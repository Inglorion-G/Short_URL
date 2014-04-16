class ShortenedUrl < ActiveRecord::Base

  belongs_to(
    :submitter,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :visits,
    class_name: "Visit",
    foreign_key: :shortened_id,
    primary_key: :id
  )

  has_many(
    :visitors,
    through: :visits,
    source: :user,
    uniq: true
  )

  def num_clicks
    visits.count
  end

  def num_uniques
    visitors.count
  end

  def num_recent_uniques
    visits.where(:created_at => (10.minutes.ago..Time.now.utc)).count
  end

  def self.create_for_user_and_long_url!(user, long_url)
    short_url = ShortenedUrl.random_code
    self.create!({user_id: user.id, long_url: long_url, short_url: short_url})
  end

  validates :short_url,
    :uniqueness => true, :presence => true
  validates :user_id,
    :presence => true
  validates :long_url,
    :presence => true

  def self.random_code
    new_short_url = nil
    loop do
      new_short_url = SecureRandom.urlsafe_base64
      break if ShortenedUrl.where("short_url = ?", new_short_url).empty?
    end

    new_short_url
  end
end