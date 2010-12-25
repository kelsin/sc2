class Video < ActiveRecord::Base
  has_many :matches
  belongs_to :characters
end
