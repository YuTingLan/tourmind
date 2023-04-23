# frozen_string_literal: true

class HotelsController < ApplicationController
  before_action :set_hotel, only: %i[show edit update destroy]

  def index
     if params[:keyword].present?
        @hotels = Hotel.search(params[:keyword]).order(updated_at: :desc)
     else
        @hotels = Hotel.order(updated_at: :desc)
     end
    if  @hotels.empty?
        flash.now[:notice] = '沒有找到符合條件的飯店' and return
    end
  
    @hotels.map { |hotel|
      if hotel.image.nil? || hotel.image.empty?
        hotel.image = "https://fakeimg.pl/400x200/?text=Hello"
      end
    }
    @hotel_equipment = @hotels.map { |hotel|
      if hotel.equipment_types.present?
      hotel.equipment_types
      end
    }
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(hotel_parames)
    if @hotel.save
      redirect_to hotels_path, notice: '新增成功!'
    else
      render :new
    end
  end

  def show
     if @hotel.image.nil? || @hotel.image.empty?
      @hotel.image = "https://fakeimg.pl/400x200/?text=Hello"
    end
  end

  def edit; end

  def update
    if @hotel.update(hotel_parames)
      redirect_to hotel_path(@hotel.id), notice: '更新成功!'
    else
      render :edit
    end
  end

  def destroy
    @hotel.destroy
    redirect_to hotels_path, notice: '已刪除!'
  end

  private

  def set_hotel
    @hotel = Hotel.find(params[:id])
  end

  def hotel_parames
    params.require(:hotel).permit(:name, :website, :star_rating, :address, :tel, :latitude, :longitude, :intro, :image,
                                  :hotel_type, equipment_types: [])
  end
end
