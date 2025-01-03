class ProjectsController < ApplicationController
  before_action :get_project, only: [:show, :edit, :update, :destroy, :toggle_status]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = 'Project was successfully created.'
      redirect_to projects_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
  end
  
  def update
    if @project.update(project_params)
      flash[:notice] = 'Project was successfully updated.'
      redirect_to projects_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = 'Project was successfully destroyed.'
    redirect_to projects_path
  end

  def toggle_status
    @project.active = !@project.active
    @project.save
    redirect_to projects_path
  end

  private

  def get_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :image, :github, :link, :active)
  end
end