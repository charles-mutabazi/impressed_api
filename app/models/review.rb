class Review
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Token
  # include Mongo::Voteable

  token :field_name => :_id, :length => 6
  field :body, type: String

  belongs_to :place
  belongs_to :user
end
