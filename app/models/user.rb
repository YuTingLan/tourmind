# frozen_string_literal: true

class User < ApplicationRecord
  # 驗證必填欄位
  # 驗證 email 欄位，只有在 email 欄位存在的情況下才進行驗證
  validates :email,
            presence: true,
            format: {
              with: /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/,
            }, if: -> { email.present? }

  # confirmable -> 確認mail認證
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2 line facebook]

  # 喜愛清單關聯性
  has_many :favorites, inverse_of: :user
  
  # 第三方認證登入後，創建用戶資料庫
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      case auth.provider
      when 'google_oauth2'
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.name = auth.info.name
        user.avatar_url = auth.info.image
      when 'line'
        user.password = Devise.friendly_token[0, 20]
        user.name = auth.info.name
        user.avatar_url = auth.info.image
      when 'facebook'
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.name = auth.info.name
        user.avatar_url = auth.info.image
      end
    end
  end

  # 不需要用戶回傳email, line不會回傳
  def email_required?
    false
  end

  # 不需要用戶提供密碼, 第三方登入不需要輸入密碼
  def password_required?
    false
  end

  def self.city_list
    [['請選擇城市'], ['台北市'], ['新北市'], ['宜蘭'], ['花蓮'], ['高雄'], ['台南'], ['台東'], ['新竹'], ['彰化'], ['嘉義'], ['南投'], ['屏東']]
  end
end
