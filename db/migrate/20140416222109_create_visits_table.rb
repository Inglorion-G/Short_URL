class CreateVisitsTable < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :shortened_id
      t.integer :user_id

      t.timestamps
    end
    add_index :visits, :shortened_id
    add_index :visits, :user_id
  end
end
