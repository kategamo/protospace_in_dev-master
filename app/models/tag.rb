class Tag < ActiveRecord::Base
  has_many :prototypes, through: :prototype_tags
  has_many :prototype_tags, foreign_key: 'tag_id', dependent: :destroy
  accepts_nested_attributes_for :prototype_tags



end
