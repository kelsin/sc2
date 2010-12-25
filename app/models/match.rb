class Match < ActiveRecord::Base
  belongs_to :video
  belongs_to :character

  has_attached_file :replay
end
