class Place
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Token
  # include Mongoid::Paperclip
  # include Mongo::Voteable
  
  token :field_name => :_id, :length => 6
  field :name
  field :description
  field :address
  field :longitude
  field :latitude
  
  # has_mongoid_attached_file :post_image, :styles => { :large => "400x200#", :medium => "300x150#", :thumb => "100x100#", :sm_thumb => "32x32#" }
  # validates_attachment_content_type :post_image, :content_type => /\Aimage\/.*\Z/

  validates_presence_of :description, :message => 'This Cannot be Blank'
  has_many :reviews
end

class Review
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Token
  # include Mongo::Voteable
  
  token :field_name => :_id, :length => 6
  # field :author, type: String
  field :body, type: String
  belongs_to :place
end
