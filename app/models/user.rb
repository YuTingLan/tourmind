class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  #驗證必填欄位
  validates :tel, presence: true
  validates :email,
            presence: true,
            format: {
              with: /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/,
            }
  
   #confirmable -> 確認mail認證
   devise :database_authenticatable, :registerable,
   :recoverable, :rememberable, :validatable,
   :omniauthable, omniauth_providers: [:google_oauth2, :line, :facebook]
   

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    if auth.provider == "google_oauth2"
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name =auth.info.name
      user.avatar_url = auth.info.image
    elsif auth.provider == "line"
      user.password = Devise.friendly_token[0,20]
      user.name =auth.info.name
      user.avatar_url = auth.info.image
    elsif auth.provider == "facebook"
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name =auth.info.name
      user.avatar_url = auth.info.image
      end
    end
  end

  def email_required?
    false
  end

  def password_required?
    false
  end

  def self.city_list
    [['請選擇城市'], ['台北市'],['新北市'],['宜蘭'],['花蓮'],['高雄'],['台南'],['台東'],['新竹'],['彰化'],['嘉義'],['南投'],['屏東']]
  end
end
