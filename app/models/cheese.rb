class Cheese < ActiveRecord::Base
  attachment :cheese_image
  belongs_to :category

  def self.search(search)
    where("name ILIKE ? OR thoughts ILIKE ?", "%#{search}%", "%#{search}%")
  end

end
