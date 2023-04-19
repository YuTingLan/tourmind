# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Rails.application.routes.url_helpers
  # 設定語言為中文
  before_action :set_locale
  def set_locale
    I18n.locale = :zh
  end

  # 用在需要在先登入才能進行動作
  # 根據 URL 中包含的信息，判斷應該重定向到哪個第三方驗證頁面
  def authenticate_user
    return if current_user.present?

    if request.env['omniauth.origin'].include?('google')
      redirect_to user_google_oauth2_omniauth_authorize_path
    elsif request.env['omniauth.origin'].include?('facebook')
      redirect_to user_facebook_omniauth_authorize_path
    else
      redirect_to user_line_omniauth_authorize_path
    end
  end
     #404:沒有找到紀錄
     rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
   

    private
    def record_not_found
    render file: Rails.root.join('public', '404.html'),
           layout: false,
           status: 404 and return
    end
end
