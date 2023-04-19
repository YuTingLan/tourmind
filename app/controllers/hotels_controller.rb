class HotelsController < ApplicationController
    def index
      @hotels = Hotel.all
    end
    def new 
       @hotel = Hotel.new
    end
    def create
       @hotel = Hotel.new(hotel_parames)
       if @hotel.save
        redirect_to hotels_path, notice:'新增成功'
       else
        render :new
       end
    end
    def show
        @hotel = Hotel.find(params[:id])
    end
    def edit
        @hotel = Hotel.find(params[:id])
    end
    def update
        @hotel = Hotel.find(params[:id])
        if  @hotel.update (hotel_parames )
             redirect_to hotels_path, notice:'更新成功'
       else
        render :edit
       end
    end
    def destroy
       @hotel = Hotel.find(params[:id])
        @hotel.destroy
        redirect_to hotels_path, notice:'已刪除!'
    end

    private
    def  hotel_parames 
        params.require(:hotel).permit(:name, :website, :star_rating, :address, :latitude, :longitude, :intro)
    end
end
