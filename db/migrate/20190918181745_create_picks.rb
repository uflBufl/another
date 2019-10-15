class CreatePicks < ActiveRecord::Migration[5.2]
  def change
    create_table :picks do |t|
      t.text :context
      t.references :message, foreign_key: {to_table: :messages}
      t.references :transmit, foreign_key: {to_table: :messages}

      t.timestamps
    end
  end
end
