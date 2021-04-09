require Rails.root + 'db/jlpt5.rb'
require Rails.root + 'db/jlpt4.rb'
require Rails.root + 'db/jlpt3.rb'
require Rails.root + 'db/jlpt2.rb'
require Rails.root + 'db/places.rb'
require Rails.root + 'db/basic.rb'

User.destroy_all

admin = User.create password: "123456", email: "idiot@stupid.com"

def add_words_to_set(set, word_list)
    word_list.each do |kanji|
        Word.create kanji: kanji[:kanji], yomikata: kanji[:yomikata], definition: kanji[:definition], romaji: Romaji.kana2romaji(kanji[:yomikata]), study_set: set
    end
end

add_words_to_set(StudySet.create( user: admin, name: 'JLPT5', public: true ), jlpt5)
add_words_to_set(StudySet.create( user: admin, name: 'JLPT4', public: true ), jlpt4)
add_words_to_set(StudySet.create( user: admin, name: 'JLPT3', public: true ), jlpt3)
add_words_to_set(StudySet.create( user: admin, name: 'JLPT2', public: true ), jlpt2)
add_words_to_set(StudySet.create( user: admin, name: 'Places', public: true ), places)
add_words_to_set(StudySet.create( user: admin, name: 'Basic', public: true ), basic)
