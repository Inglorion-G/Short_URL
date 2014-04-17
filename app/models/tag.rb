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
      COUNT(*)
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

    development.sqlite3.execute(query)
  end

  def most_popular_rails

  end

end