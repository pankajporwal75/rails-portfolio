class ContactRequestsController < ApplicationController
  before_action :set_contact_request, only: %i[ show update destroy ]

  def index
    @contact_requests = ContactRequest.all
  end

  def show
  end

  def update
    @contact_request.update(mark_as_seen: true)
    redirect_to @contact_request, notice: "Contact request marked as seen."
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
