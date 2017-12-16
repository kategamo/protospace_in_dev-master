class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :captured_images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
  accepts_nested_attributes_for :captured_images, reject_if: :reject_sub_images

  has_many :prototype_tags, foreign_key: 'prototype_id' ,dependent: :destroy
  has_many :tags, through: :prototype_tags
  accepts_nested_attributes_for :tags


  validates :title,
            :catch_copy,
            :concept,
            presence: true

  def reject_sub_images(attributed)
    attributed['content'].blank?
  end



  def set_main_thumbnail
    captured_images.main.first.content
  end

  def set_sub_thumbnail
    sub_thumbs = captured_images.sub
    i = 0
    while i < 3
      sub_thumbs[i]||= captured_images.new(status: 1)
      i = i +1
    end
    return sub_thumbs
  end

  def set_tag_list
    tag_list = tags
    i = 0
    while i < 3
      tag_list[i]||= tags.new
      i = i +1
    end
    return tag_list
  end


  def posted_date
    created_at.strftime('%b %d %a')
  end
end
