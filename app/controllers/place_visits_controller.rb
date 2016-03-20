class PlaceVisitsController < ApplicationController
  before_action :set_place_visit, only: [:show, :update, :destroy]

  # GET /place_visits
  # GET /place_visits.json
  def index
    @place_visits = PlaceVisit.all
    render json: { place_visits: @place_visits }
  end

  # GET /place_visits/1
  # GET /place_visits/1.json
  def show
    render json: @place_visit
  end

  # POST /place_visits
  # POST /place_visits.json
  def create
    PlaceVisit.collection.insert(params[:place_visits]) #save to batch to database mongoid awesome
  end

  # PATCH/PUT /place_visits/1
  # PATCH/PUT /place_visits/1.json
  def update
    @place_visit = PlaceVisit.find(params[:id])

    if @place_visit.update(place_visit_params)
      head :no_content
    else
      render json: @place_visit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /place_visits/1
  # DELETE /place_visits/1.json
  def destroy
    @place_visit.destroy

    head :no_content
  end

  private

    def set_place_visit
      @place_visit = PlaceVisit.find(params[:id])
    end

    def place_visit_params
      params.require(:place_visit).permit( :entry_time, :exit_time, :place_id, :user_id)
    end
end
