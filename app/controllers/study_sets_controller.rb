class StudySetsController < ApplicationController

    before_action :authenticate_user!, only: [:create]

    def index

    end

    def create
        study_set = StudySet.new(study_set_params)
        study_set.user = current_user
        if study_set.save
            puts "Success!!!"
            save_words(params[:words], study_set)
        else
            puts "OH NO"
            study_set.save!
        end
    end

    def destroy
        study_set = StudySet.find(params[:id])
        if study_set.destroy
            update_user_frontend(current_user)
        else
          puts "error deleting study set: #{params}"
          render json: {error: 'Could not delete study set'}.to_json
        end
    end

    def update
        p params
        study_set = StudySet.find(params[:id])
        if study_set.update(study_set_params)
            save_words(params[:words], study_set)
        else
            puts "Study set failed to update!"
            study_set.update!(study_set_params)
        end
    end

    private

    def study_set_params
        params.require(:study_set).permit(:name, :public, :words)
    end

    def save_words(words, study_set)
        failures = []
        words.each do |word|
            word[:id] ? new_word = Word.find(word[:id]) : new_word = Word.new
            new_word.study_set = study_set
            new_word.kanji = word[:kanji]
            new_word.yomikata = word[:yomikata]
            new_word.definition = word[:definition]
            if word[:id]
                failures << new_word.errors unless new_word.update({kanji: word[:kanji], yomikata: word[:yomikata], definition: word[:definition]})
            else
                failures << new_word.errors unless new_word.save
            end
        end
        if failures.size.zero?
            update_user_frontend(current_user)
        else
            render json: {errors: failures}.to_json
        end
    end
end
