class Visit
  include Mongoid::Document
  include Mongoid::Token
  # include Mongoid::Paperclip
  # include Mongo::Voteable

  token :field_name => :_id, :length => 8

  field :entry_time, type: String
  field :exit_time, type: String
  field :duration, type: Integer

  belongs_to :user
  belongs_to :place

end
