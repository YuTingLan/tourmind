class Users::RegistrationsController < Devise::RegistrationsController
  #更新使用者資訊
  #resource= User, params = 要更新的參數
  def update_resource(resource, params)
    resource.update(account_update_params)
  end

  private
  #取得使用者資料允許更新的參數
  def account_update_params
    params.require(:user).permit(:email, :name, :city, :tel, :avatar_url)
  end
end
