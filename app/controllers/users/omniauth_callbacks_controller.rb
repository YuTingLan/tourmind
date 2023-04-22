# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      user = User.from_omniauth(auth)
      if user.present?
        sign_out_all_scopes
        # kind 識別使用者所使用的身份驗證提供者的類型
        flash[:notice] = t 'devise.omniauth_callbacks.success', kind: 'Google'
        # 當系統接收到 authentication 這個事件時，就代表該用戶已經被成功認證
        sign_in_and_redirect user, event: :authentication
      else
        flash[:alert] =
          t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
        redirect_to new_user_registration_path
      end
    end

    def line
      user = User.from_omniauth(auth)
      if user.present?
        sign_out_all_scopes
        flash[:notice] = t 'devise.omniauth_callbacks.success', kind: 'line'
        sign_in_and_redirect user, event: :authentication
      else
        flash[:alert] =
          t 'devise.omniauth_callbacks.failure', kind: 'line', reason: "#{auth.info.email} is not authorized."
        redirect_to new_user_registration_path
      end
    end

    def facebook
      user = User.from_omniauth(auth)
      if user.present?
        sign_out_all_scopes
        flash[:notice] = t 'devise.omniauth_callbacks.success', kind: 'Facebook'
        sign_in_and_redirect user, event: :authentication
      else
        flash[:alert] =
          t 'devise.omniauth_callbacks.failure', kind: 'Facebook', reason: "#{auth.info.email} is not authorized."
        redirect_to new_user_registration_path
      end
    end

    protected

    # 使用 OmniAuth 登入失敗時，重新導向的路徑
    def after_omniauth_failure_path_for(_scope)
      new_user_registration_path
    end

    # 使用者登入後重新導向的路徑
    def after_sign_in_path_for(resource_or_scope)
      stored_location_for(resource_or_scope) || root_path
    end

    private

    # 獲取第三方認證訊息的hash value
    def auth
      @auth ||= request.env['omniauth.auth']
    end
  end
end
