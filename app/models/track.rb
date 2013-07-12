class Track < ActiveRecord::Base
  attr_accessible :album_id, :name, :track_type, :lyrics

  belongs_to :album

  validates :name, presence: true
  validates_uniqueness_of :name, :scope => [:album_id]

end
