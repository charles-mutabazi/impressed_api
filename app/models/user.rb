class User
  include Mongoid::Document
  include Mongoid::Timestamps
  # include Mongoid::Token
  # include Mongoid::Paperclip
  # include Mongo::Voteable
  
  # token :field_name => :_id, :length => 6
  field :_id, type: String, default: -> { device_uuid }
  field :display_name
  field :device_uuid
  field :age_range
  field :gender
  field :ios_version

  has_many :visits, dependent: :destroy
  has_many :reviews
  has_many :place_visits
end
