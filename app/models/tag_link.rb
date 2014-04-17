class TagLink < ActiveRecord::Base
  belongs_to(
    :tag,
    class_name: "Tag",
    foreign_key: :tag_id,
    primary_key: :id
  )

  belongs_to(
    :link,
    class_name: "ShortenedUrl",
    foreign_key: :link_id,
    primary_key: :id
  )
end