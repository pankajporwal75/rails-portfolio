class Api::ProjectsController < Api::ApplicationController
  include Rails.application.routes.url_helpers

  def index
    projects = Project.active.map do |project|
      {
        name: project.name,
        description: project.description,
        image: project.image.attached? ? url_for(project.image) : nil,
        github: project.github,
        link: project.link
      }
    end
    render json: { projects: projects }
  end
end
