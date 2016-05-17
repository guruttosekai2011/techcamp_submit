class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :birth_year, :int
    add_column :users, :birth_month, :int
    add_column :users, :birth_day, :int
    add_column :users, :belonging, :string
    add_column :users, :facebookid, :string
    add_column :users, :twitterid, :string
    add_column :users, :introduction, :text
  end
end
