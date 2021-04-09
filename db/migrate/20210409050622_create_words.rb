class CreateWords < ActiveRecord::Migration[6.1]
  def change
    create_table :words do |t|
      t.text :kanji
      t.text :yomikata
      t.text :definition
      t.references :study_set, null: false, foreign_key: true

      t.timestamps
    end
  end
end
