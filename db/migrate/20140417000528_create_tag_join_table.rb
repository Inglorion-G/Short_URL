class CreateTagJoinTable < ActiveRecord::Migration
  def change
    create_table :tag_links do |t|
      t.integer :tag_id
      t.integer :link_id

      t.timestamps
    end
    add_index :tag_links, :tag_id
    add_index :tag_links, :link_id
  end
end