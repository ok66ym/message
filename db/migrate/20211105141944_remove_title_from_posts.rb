class RemoveTitleFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :title, :string
    remove_column :posts, :contents, :text
  end
end
