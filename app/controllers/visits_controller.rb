class VisitsController < ApplicationController
  before_action :set_visit, only: [:show, :update, :destroy]

  # GET /visits
  # GET /visits.json
  def index
    @visits = Visit.all

    render json: @visits
  end

  # GET /visits/1
  # GET /visits/1.json
  def show
    render json: @visit
  end

  # POST /visits
  # POST /visits.json
  def create
    current_visit = Visit.find_by entry_time: visit_params[:entry_time]
    
    if current_visit
      current_visit.update(visit_params)
    else
      @visit = Visit.new(visit_params)
      if @visit.save
        render json: @visit, status: :created, location: @visit
      else
        render json: @visit.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /visits/1
  # PATCH/PUT /visits/1.json
  def update
    @visit = Visit.find(params[:id])

    if @visit.update(visit_params)
      head :no_content
    else
      render json: @visit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /visits/1
  # DELETE /visits/1.json
  def destroy
    @visit.destroy

    head :no_content
  end

  private

    def set_visit
      @visit = Visit.find(params[:id])
    end

    def visit_params
      params.require(:visit).permit(:entry_time, :exit_time, :duration, :place_id, :user_id)
    end
end
