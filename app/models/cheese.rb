class Cheese < ActiveRecord::Base
  attachment :cheese_image
  belongs_to :category

  def self.search(search)
    where("lower(name) ILIKE ? OR lower(thoughts) ILIKE ?", "%#{search}%", "%#{search}%")
  end

end
