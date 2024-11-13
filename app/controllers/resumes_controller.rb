class ResumesController < ApplicationController
  before_action :set_resume, only: %i[ show edit update destroy ]

  def index
    @resumes = Resume.all
  end

  def show
  end

  def new
    @resume = Resume.new
  end

  def edit
  end

  def create
    @resume = Resume.new(resume_params)
    if @resume.save
      redirect_to resume_url(@resume), notice: "Resume was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @resume.update(resume_params)
      redirect_to resume_url(@resume), notice: "Resume was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @resume.destroy!
    redirect_to resumes_url, notice: "Resume was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resume
      @resume = Resume.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def resume_params
      params.require(:resume).permit(:title, :file, :active)
    end
end
