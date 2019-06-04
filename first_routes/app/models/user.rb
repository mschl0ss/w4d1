# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#



class User < ApplicationRecord


  validates :username, presence: true

  has_many :artworks, 
    foreign_key: :artist_id, 
    class_name: :Artwork

  has_many :artwork_shares,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare
    
  # has_many :shared_artworks,
  #   foreign_key
end
