class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.string :image
      t.string :author
      t.references :first_page, foreign_key: {to_table: :messages}

      t.timestamps
    end
    add_index :games, [:name, :author]
  end
end
