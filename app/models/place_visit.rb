class PlaceVisit
  include Mongoid::Document
  #include Mongoid::Token

  #token :field_name => :_id, :length => 8
  field :entry_time
  field :exit_time
  
  belongs_to :user
  belongs_to :place
end
