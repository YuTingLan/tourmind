class Users::RegistrationsController < Devise::RegistrationsController
  def update_resource(resource, params)
    if resource.provider == 'google_oauth2'|| 'line' || 'facebook'
      params.delete('current_password')
      resource.password = params['password']
      resource.update(account_update_params)
    else
      resource.update(account_update_params)
    end
  end

  private
  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :name, :city, :tel)
  end
end
