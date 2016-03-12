class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :update, :destroy]
  # before_action :authenticate_admin!, except: [:index]

  def index
    @places = Place.all
    render json: { places: @places }, methods: [:reviews, :visit_ids, :image_url_medium]
    # render json: @places, methods: :reviews # return a place object not a places object as above
  end

  def show
    # @place[:image_url_large] = @place.image.url(:large)
    # @place[:image_url_medium] = @place.image.url(:medium)
    render json: { place: @place }, methods: [:reviews, :image_url_large, :image_url_medium]
  end
  
  def show_reviews
    @place = Place.find(params[:id])
    @reviews = @place.reviews
    
    render json: { reviews: @reviews }
    
  end

  def create
    @place = Place.new(place_params)
    @place.image = params[:file] #very important if you are using ng-file-upload

    if @place.save
      render json: {place: @place, reviews: @place.reviews }, methods: :reviews , status: :created, location: @place
    else
      render json: @place.errors, status: :unprocessable_entity
    end
  end

  def update
    @place = Place.find(params[:id])

    if @place.update(place_params)
      head :no_content
    else
      render json: @place.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @place.destroy

    head :no_content
  end

  private

    def set_place
      @place = Place.find(params[:id])
    end

    def place_params
      params.require(:place).permit(:name, :description, :address, :longitude, :latitude, :image)
    end
end
