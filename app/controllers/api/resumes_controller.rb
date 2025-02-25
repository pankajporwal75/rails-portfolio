class Api::ResumesController < Api::ApplicationController
  include Rails.application.routes.url_helpers

  def index
    resume = Resume.active.first
    if resume&.file&.attached?
      render json: { resume_url: rails_blob_url(resume.file) }, status: :ok
    else
      render json: { error: 'Resume not found' }, status: :not_found
    end
  end
end
