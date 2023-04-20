# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      user.create_reset_digest
      user.send_password_reset_email
      flash[:notice] = "重置密碼郵件已發送到您的郵箱，請查收。"
      redirect_to root_path
    else
      flash.now[:alert] = "該電子郵件地址未註冊。"
      render 'new'
    end
  end
  
  def edit
  end

  def update
    if current_user.update(password_params)
      redirect_to root_path, notice: "密碼已更新"
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
