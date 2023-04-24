class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites
  end
  def create
    @favorite = current_user.favorites.new(favorite_params)

    if @favorite.save
      redirect_back fallback_location: root_path, notice: "新增到喜愛清單"
    else
      redirect_back fallback_location: root_path, alert: "以收藏在喜愛清單裡"
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to favorites_path
  end
  private
    def favorite_params
      params.require(:favorites).permit(:favorable_type, :favorable_id)
    end
end
