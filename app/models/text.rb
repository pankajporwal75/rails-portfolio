class Text < ApplicationRecord
  validates_presence_of :key, :value
end
