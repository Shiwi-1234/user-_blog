class AddPublishedToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :published, :boolean, default: "false"
    add_column :articles, :Date, :date
    add_column :articles, :Day, :string
  end
end
