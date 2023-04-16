class ApplicationController < ActionController::Base
    include Rails.application.routes.url_helpers

    def authenticate_user
        return if current_user.present?
        redirect_to user_line_omniauth_authorize_path
    end
end
