class AddContentToResponses < ActiveRecord::Migration[6.1]
  def change
    add_column :responses, :content, :text
  end
end
