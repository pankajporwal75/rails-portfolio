require 'rails_helper'

RSpec.describe Resume, type: :model do
  let(:resume) { build(:resume) }

  context "validations" do
    it "is valid with a title and file" do
      expect(resume).to be_valid
    end

    it "is invalid without a title" do
      resume.title = nil
      expect(resume).not_to be_valid
    end

    it "is invalid without a file" do
      resume.file.detach
      expect(resume).not_to be_valid
    end
  end

  context "scopes" do
    it "returns only active resumes" do
      active_resume = create(:resume, active: true)
      inactive_resume = create(:resume, active: false)

      expect(Resume.active).to include(active_resume)
      expect(Resume.active).not_to include(inactive_resume)
    end
  end
end