class CreateStudySets < ActiveRecord::Migration[6.1]
  def change
    create_table :study_sets do |t|
      t.text :name
      t.boolean :public
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
