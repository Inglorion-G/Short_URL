class User < ActiveRecord::Base

  has_many(
    :submitted_urls,
    class_name: "ShortenedUrl",
    foreign_key: :user_id,
    primary_key: :id
  )

  validates :email,
    :uniqueness => true, :presence => true
end