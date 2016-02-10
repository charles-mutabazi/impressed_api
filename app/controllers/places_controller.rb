class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :update, :destroy]
  # before_action :authenticate_user!

  def index
    @places = Place.all
    render json: { places: @places }, methods: :reviews
  end

  def show
    render json: { place: @place }, methods: :reviews
  end

  def create
    @place = Place.new(place_params)

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
      params.require(:place).permit(:name, :description, :address, :longitude, :latitude)
    end
end
