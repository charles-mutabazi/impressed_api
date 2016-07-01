require 'data_analysis.rb'
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]


  # GET /users
  # GET /users.json
  def index
    @users = User.all
    render json: { users: @users }, methods: :visit_ids
  end

  # GET /users/1
  # GET /users/1.json
  def show
    render json: @user
  end

  #/users/1/place_visits
  def get_user_visits
    @place_visits = User.find(params[:user_id]).place_visits
    render json: @place_visits
  end

  #/users/1/visits
  def visits 
    @visits = User.find(params[:user_id]).visits
    render json: @visits
  end
  
  

  #/users/1/reviews
  def get_user_reviews
    reviews = User.find(params[:user_id]).reviews
    render json: reviews
  end

  # POST /users
  # POST /users.json
  def create
    # old_user = User.find(params[:id])

    # if old_user
    #   old_user.update(user_params)
    # else
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created, location: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    # end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    head :no_content
  end
  
  #Get user analytics
  def get_user_analytics
    result_user_v = Array.new
    result_all_v = Array.new
    
    user_visits = User.find(params[:user_id]).visits
    all_users = User.all
    all_visits = Visit.all
    
    all_users.each do |user|
      u_visits = User.find(user["device_uuid"]).visits
      coords = []
      u_visits.each do |u|
        lat = u["latitude"]
        lon = u["longitude"]
        grid_coords = grid_coords(lat, lon, 300) # accuracy of 300 Meters
        # user_id = u["user_id"]
        coords.push(grid_coords)
      end
      result_all_v.push([user["device_uuid"], coords.uniq])
    end
    
    similarity = Array.new
    users = Hash[result_all_v]
    users.each do |key1, value1|
      arr = Array.new
      users.each do |key2, value2|
        next if(value1==value2)
        same_places = (value1&value2).size
        total_places = (value1|value2).size
        sm = (same_places.to_f/total_places.to_f)*100
        my_arr = [["user", key2], ["likelihood", sm.round], ["same_places", same_places], ["total_places", total_places]]
        
        arr.push(Hash[my_arr])
      end
      similarity.push([key1, arr])
    end
    
    user_visits.each do |uv|
      lat = uv["latitude"]
      lon = uv["longitude"]
      grid_coords = grid_coords(lat, lon, 300) # accuracy of 300 Meters
      result_user_v.push(grid_coords)
    end
    
    # comparision = Hash.new
    my_hash = Hash[similarity].slice(params[:user_id]).values[0]
    render json: {
      # grid_coordinates: result_user_v.uniq,
      visits_300m_acc: result_user_v.uniq.size,
      comparision: my_hash #to remain with the current user comparision
    }
  end


  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:display_name, :device_uuid, :gender, :age_range, :ios_version)
    end
end
