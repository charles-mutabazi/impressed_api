class Visit
  include Mongoid::Document
  #include Mongoid::Token
  #include Mongoid::Attributes::Dynamic
  # include Mongoid::Paperclip
  # include Mongo::Voteable

  #token :field_name => :_id, :length => 8

  field :entry_time
  field :exit_time
  field :accuracy
  field :latitude
  field :longitude

  belongs_to :user

end
