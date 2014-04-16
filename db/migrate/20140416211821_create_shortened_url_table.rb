class CreateShortenedUrlTable < ActiveRecord::Migration
  def change
    create_table :shortened_urls do |t|
      t.string :long_url
      t.string :short_url
      t.integer :user_id

      t.timestamp
    end
    add_index :user_id
    add_index :short_url, :unique => true
  end
end
