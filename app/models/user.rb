class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  rolify

  has_many :likes, dependent: :destroy

  PASSWORD_FORMAT = /\A
  (?=.{8,})          # Must contain 8 or more characters
  (?=.*\d)           # Must contain a digit
  (?=.*[a-z])        # Must contain a lower case character
  (?=.*[A-Z])        # Must contain an upper case character
  (?=.*[[:^alnum:]]) # Must contain a symbol
/x

  # has_secure_password validations: false
  has_secure_password validations: false
  devise :omniauthable , omniauth_providers: %i[facebook google_oauth2 twitter]

  enum device_type: %i[android ios web]

  # validates :first_name, :email, :zipcode, :advertising_id, :udid, :device_type, :provider, presence: true
  validates :first_name, :last_name, :email, :password, :phone, presence: true
  validates :email, uniqueness: true
  validates :password,
  # length: {minimum: 8},
  presence: true, 
  length: { in: Devise.password_length }, 
  format: { with: PASSWORD_FORMAT }, 
  confirmation: true, 
  on: :create 

  validates :password, 
  allow_nil: true, 
  length: { in: Devise.password_length }, 
  format: { with: PASSWORD_FORMAT }, 
  confirmation: true, 
  on: :update

  # before_save :fetch_location_data

  # TODO: Add before_create and add dummy data based on device type

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.assign_or_new(attributes)
    obj = first || new
    obj.assign_attributes(attributes)
    obj
  end

  def self.from_omniauth(auth)
    name_split = auth.info.name.split(" ")
    user = User.where(email: auth.info.email).first
    user ||= User.create!(provider: auth.provider, uid: auth.uid, last_name: name_split[0], first_name: name_split[1], email: auth.info.email, password: Devise.friendly_token[0, 20])
      user
  end
  
  after_create :assign_default_role

        def assign_default_role
         if User.count == 1
          self.add_role(:superadmin) if self.roles.blank?
          self.add_role(:admin)
          self.add_role(:moderator)
          self.add_role(:user)
         else 
          self.add_role(:user) if self.roles.blank?
         end
        end
end
