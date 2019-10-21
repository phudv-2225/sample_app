class Micropost < ApplicationRecord
  belongs_to :user
  scope :scope_order_created_at, -> {order created_at: :desc}
  mount_uploader :picture, PictureUploader
  PARAMS = %i(content picture).freeze

  validates :user_id, presence: true
  validates :content, presence: true,
    length: {maximum: Settings.micropost.content.max_length}
  validate :picture_size

  private

  def picture_size
    return if picture.size < I18n.t("size_in_megabytes").megabytes
    errors.add :picture, I18n.t(".max_size_image")
  end
end
