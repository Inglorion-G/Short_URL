class Tag < ActiveRecord::Base
  has_many(
    :tag_links,
    class_name: "TagLink",
    foreign_key: :tag_id,
    primary_key: :id
  )

  has_many :links, through: :tag_links, source: :link

  def most_popular
    query = <<-SQL
    SELECT
      COUNT(shortened_urls.*)
    FROM
      visits
    JOIN
      shortened_urls
    ON
      shortened_urls.id = visits.shortened_id
    GROUP BY
      visits.shortened_id
    LIMIT
      3
    SQL

    ShortenedUrl.find_by_sql(query)
  end

  def most_popular_rails
    ShortenedUrl.joins(:visits).group("visits.shortened_id").order(
      "COUNT(visits.id)").where("tag_id", self.id)limit(5)
  end

end