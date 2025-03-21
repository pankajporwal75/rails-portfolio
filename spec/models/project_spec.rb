require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project) { build(:project) }

  context "validations" do
    it "is valid with a name, description, and image" do
      expect(project).to be_valid
    end

    it "is invalid without a name" do
      project.name = nil
      expect(project).not_to be_valid
    end

    it "is invalid without a description" do
      project.description = nil
      expect(project).not_to be_valid
    end

    it "is invalid without an image" do
      project.image.detach
      expect(project).not_to be_valid
    end
  end

  context "scopes" do
    it "returns only active projects" do
      active_project = create(:project, active: true)
      inactive_project = create(:project, active: false)

      expect(Project.active).to include(active_project)
      expect(Project.active).not_to include(inactive_project)
    end
  end
end
