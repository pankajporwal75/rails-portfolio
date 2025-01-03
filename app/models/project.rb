class Project < ApplicationRecord
  validates_presence_of :name, :description, :image
  has_one_attached :image

  scope :active, -> { where(active: true) }
end
