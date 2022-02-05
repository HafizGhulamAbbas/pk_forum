class User < ApplicationRecord
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
  has_secure_password
  devise :omniauthable, omniauth_providers: %i[facebook google_oauth2 twitter]

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
    where(email: auth.info.email).first_or_create do |user|
      user.email = auth.info.email
      user.first_name = if auth.provider == 'twitter'
                          auth.info.name
                        else
                          auth.info.first_name
                        end
      user.last_name = auth.info.last_name unless auth.provider == 'twitter'
      user.provider = auth.provider
      user.zipcode = '00000'
      user.uid = auth.uid
      user.device_type = 'web'

      # TODO: Remove and add in before_create
      user.advertising_id = '6a05a329-12a4-4b09-ab6c-2cece3b3803a'
      user.udid = 'eAOnmT3xxn8:APA91bF7Ch4URpZexSQJ-cC1dlIhG6Aje89SnzJn1f3DlcMn2GJ7daYXCmv1S0ZQzm2iyuSJURDsjqFSA-VT33NFd-eFAujsq8d2bKzISsJ_nVWxSqe93asieD8MrZ91yP5mzeVh7Hv-d-EpYEceGsLC3soO2blZpg'
    end
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
