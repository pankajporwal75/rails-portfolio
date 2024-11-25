class Api::ContactRequestsController < Api::ApplicationController
  protect_from_forgery with: :null_session

  def create
    @contact_request = ContactRequest.new(contact_request_params)
    if @contact_request.save
      render json: 
        {
          message: 'Your request has been submitted, I will get back to you shortly.',
          success: true
        }
    else
      render json: 
        {
          message: 'An error occured while submitting your request.',
          success: false,
          error: @contact_request.errors.full_messages
        }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def contact_request_params
    params.require(:contact_request).permit(:name, :email, :subject, :message)
  end
end