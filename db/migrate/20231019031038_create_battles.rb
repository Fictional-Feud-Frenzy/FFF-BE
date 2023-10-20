class CreateBattles < ActiveRecord::Migration[7.0]
  def change
    create_table :battles do |t|
      t.references :character1, null: false, foreign_key: { to_table: :characters }
      t.references :character2, null: false, foreign_key: { to_table: :characters }
      t.references :winner, null: false, foreign_key: { to_table: :characters }
      t.text :description

      t.timestamps
    end
  end
end
