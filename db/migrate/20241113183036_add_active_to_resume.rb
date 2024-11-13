class AddActiveToResume < ActiveRecord::Migration[7.1]
  def change
    add_column :resumes, :active, :boolean, default: false
  end
end
