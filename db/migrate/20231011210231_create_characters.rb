class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :intelligence
      t.integer :strength
      t.integer :speed
      t.integer :durability
      t.integer :power
      t.integer :combat
      t.string :full_name
      t.string :place_of_birth
      t.string :publisher
      t.string :alignment
      t.string :gender
      t.string :race
      t.string :height
      t.string :weight
      t.string :eye_color
      t.string :hair_color
      t.string :group_affiliation
      t.string :image
      t.timestamps
    end
  end
end
