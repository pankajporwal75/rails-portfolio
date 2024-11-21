class AddFieldsToContactRequest < ActiveRecord::Migration[7.1]
  def change
    add_column :contact_requests, :mark_as_seen, :boolean, default: false
  end
end
