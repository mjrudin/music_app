class Album < ActiveRecord::Base
  attr_accessible :album_type, :band_id, :name

  belongs_to :band
  has_many :tracks, dependent: :destroy

  validates :name, presence: true
  validates_uniqueness_of :name, :scope => [:band_id]


end
