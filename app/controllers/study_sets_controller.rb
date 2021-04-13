class StudySetsController < ApplicationController
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
    private

    def study_set_params
        params.require(:study_set).permit(:name, :public, :words)
    end

    def save_words(words, study_set)
        failures = []
        words.each do |word|
            new_word = Word.new
            new_word.study_set = study_set
            new_word.kanji = word[:kanji]
            new_word.yomikata = word[:yomikata]
            new_word.definition = word[:definition]
            if new_word.save
                puts "Saved a new word successfully"
            else
                failures << new_word.errors
                puts "NEW WORD FAILED TO SAVE"
                new_word.save!
            end
        end
        if failures.size.zero?
            update_user_frontend(current_user)
        else
            render json: {errors: failures}.to_json
        end
    end
end
