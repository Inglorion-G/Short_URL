class ShortenedUrl < ActiveRecord::Base
  validates :short_url,
    :uniqueness => true, :presence => true
  validates :user_id,
    :presence => true
  validates :long_url,
    :presence => true
end