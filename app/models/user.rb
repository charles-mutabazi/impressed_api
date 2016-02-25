class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Token
  # include Mongoid::Paperclip
  # include Mongo::Voteable
  
  token :field_name => :_id, :length => 6
  field :name
  field :device_uuid
  field :age_range
  field :gender

  has_many :visits
  has_many :reviews
end
