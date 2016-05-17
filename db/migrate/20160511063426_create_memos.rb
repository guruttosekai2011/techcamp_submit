class CreateMemos < ActiveRecord::Migration
  def change
    create_table :memos do |t|
      t.integer :user_id
      t.string :title
      t.text :memo
      t.integer :public_open
      t.timestamps
    end
  end
end
