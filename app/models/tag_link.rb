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

  def self.add_tag!(tag, shortened_url)
    self.create!({ tag_id: tag.id, link_id: shortened_url.id })
  end

end