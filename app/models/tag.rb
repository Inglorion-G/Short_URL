class Tag < ActiveRecord::Base
  has_many(
    :tag_links,
    class_name: "TagLink",
    foreign_key: :tag_id,
    primary_key: :id
  )

  has_many :links, through: :tag_links, source: :shortened_url

end