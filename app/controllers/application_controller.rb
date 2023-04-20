class ApplicationController < ActionController::Base
    include Rails.application.routes.url_helpers
    #設定語言為中文
    before_action :set_locale
    def set_locale
        I18n.locale = :zh
    end

    def authenticate_user
        return if current_user.present?
        redirect_to user_line_omniauth_authorize_path
    end
end
