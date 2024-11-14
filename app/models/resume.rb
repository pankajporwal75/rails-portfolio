class Resume < ApplicationRecord
  has_one_attached :file
  validates_presence_of :title, :file

  scope :active, -> { where(active: true) }
end
