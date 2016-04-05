class Place
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Token
  include Mongoid::Paperclip
  # include Mongo::Voteable
  
  token :field_name => :_id, :length => 6
  field :name
  field :description
  field :address
  field :longitude
  field :latitude
  
  has_mongoid_attached_file :image, :styles => { :large => "946x473#", :medium => "375x250#", :thumb => "100x100#" } #:sm_thumb => "32x32#" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates_presence_of :description, :message => 'This Cannot be Blank'
  has_many :reviews, dependent: :destroy
  #has_many :place_visits, dependent: :destroy

  #very important to include image_url
  def image_url_medium
    image.url(:medium)
  end

  def image_url_large
    image.url(:large)
  end
end

#class Review
 # include Mongoid::Document
  #include Mongoid::Timestamps
  #include Mongoid::Token
  # include Mongo::Voteable
  
  #token :field_name => :_id, :length => 6
  #field :body, type: String
  
  #belongs_to :place
  #belongs_to :user
#end
