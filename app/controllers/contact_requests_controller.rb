class ContactRequestsController < ApplicationController
  before_action :set_contact_request, only: %i[ show destroy ]

  def index
    @contact_requests = ContactRequest.all
  end

  def show
  end

  def destroy
    @contact_request.destroy!
    redirect_to contact_requests_url, notice: "Contact request was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_request
      @contact_request = ContactRequest.find(params[:id])
    end
end
