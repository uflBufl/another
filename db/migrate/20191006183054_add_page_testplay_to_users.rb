class AddPageTestplayToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :page_testplay, :integer
  end
end
