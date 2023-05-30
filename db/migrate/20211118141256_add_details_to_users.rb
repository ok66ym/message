class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :university, :string
    add_column :users, :undergraduate, :string
    add_column :users, :department, :string
    add_column :users, :schoolcount, :string
    add_column :users, :name, :string
  end
end
