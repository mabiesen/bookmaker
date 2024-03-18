class AddKeywordToSnippets < ActiveRecord::Migration[7.1]
  def change
    add_column :snippets, :keyword, :string
  end
end
