class ApplicationController < ActionController::Base
  before_action :logged_in?
  skip_before_action :logged_in?, if: :devise_controller?

  protected
    def logged_in?
      unless current_user
        redirect_to new_user_session_path, notice: 'Please sign in.'
      end
    end
end
