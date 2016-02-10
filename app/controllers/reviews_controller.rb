class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :update, :destroy]
  # GET /reviews
  # GET /reviews.json
  def index
    place = Place.find(params[:place_id])
    @reviews = place.reviews
    render json: {reviews: @reviews}, methods: :place_id
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    place = Place.find(params[:place_id])
    @review = place.reviews.find(params[:id])
    
    render json: {review: @review}, methods: :place_id
  end

  # POST /reviews
  # POST /reviews.json
  def create
    place = Place.find(params[:place_id])
    @review = place.reviews.create(review_params)
    
    if @review.save
      render json: { review: @review }, methods: :place_id, status: :created, location: @review.place #very important
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    place = Place.find(params[:place_id])
    @review = place.reviews.find(params[:id])

    if @review.update(review_params)
      head :no_content
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    
    head :no_content
  end

  private

    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:body)
    end
end
