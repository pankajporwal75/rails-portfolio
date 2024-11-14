class ContactRequest < ApplicationRecord
  validates_presence_of :name, :email, :message, :subject
end
