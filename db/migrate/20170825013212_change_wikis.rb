class ChangeWikis < ActiveRecord::Migration
  def change
    change_table :collaborators do |t|
      t.rename :wikis, :wiki_id
      t.rename :users, :user_id
    end
  end
end
