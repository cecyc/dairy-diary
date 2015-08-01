class Cheese < ActiveRecord::Base
  attachment :cheese_image
  belongs_to :category
end

