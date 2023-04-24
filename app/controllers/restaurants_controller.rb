# frozen_string_literal: true

class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]

  # GET /restaurants or /restaurants.json
  def index
    @restaurants = Restaurant.order(updated_at: :desc)
  end

  # GET /restaurants/1 or /restaurants/1.json
  def show
    @google_api_key = Rails.application.credentials.GOOGLE_API_KEY
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit; end

  # POST /restaurants or /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)
    set_default_image_if_not_filled
    if @restaurant.save
      get_location
      redirect_to restaurants_path, notice: 'Restaurant was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /restaurants/1 or /restaurants/1.json
  def update
    if @restaurant.update(restaurant_params)
      get_location
      redirect_to restaurant_url(@restaurant), notice: 'Restaurant was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /restaurants/1 or /restaurants/1.json
  def destroy
    @restaurant.destroy
    redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def set_default_image_if_not_filled
    @restaurant.image = 'https://fakeimg.pl/300x200' if @restaurant.image.empty?
  end

  def get_location
    GeocoderSearchJob.perform_later(@restaurant)
  end

  # Only allow a list of trusted parameters through.
  def restaurant_params
    params.require(:restaurant).permit(:name, :intro, :address, :lat, :long, :image, :section, :email, :tel,
                                       :website, :restaurant_type, { cuisine_types: [] }, :price, { atmostphere: [] }, :michelin_star).tap do |whitelisted|
      whitelisted[:cuisine_types].reject!(&:empty?)
      whitelisted[:atmostphere].reject!(&:empty?)
    end
  end
end
