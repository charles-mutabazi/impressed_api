class User
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongo::Voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
#          :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]
#
#   acts_as_token_authenticatable
#   field :authentication_token

  ## Username - added by charl
  field :name, type: String
  
  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String
  
  #Omniauthable - charl
  field :provider
  field :uid
  
  field :gender
  field :date_of_birth

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time
  
  # has_many :reviews, dependent: :destroy # very important code
  # has_many :comments, dependent: :destroy # very important code
  # has_many :discoveries, dependent: :destroy
  
  # has_mongoid_attached_file :avatar, :styles => { :medium => "300x300#", :thumb => "100x100#", :sm_thumb => "32x32#" }, :default_url => "/images/:style/missing.png"
  # validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
