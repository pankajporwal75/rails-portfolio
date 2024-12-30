class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :prepare_exception_notifier
  add_flash_types :info, :warning

  private

  def prepare_exception_notifier
    request.env["exception_notifier.exception_data"] = {
      current_user: current_user
    }
  end
end
