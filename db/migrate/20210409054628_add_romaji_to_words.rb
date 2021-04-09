class AddRomajiToWords < ActiveRecord::Migration[6.1]
  def change
    add_column :words, :romaji, :string
  end
end
