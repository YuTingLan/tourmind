class SitesController < ApplicationController
     def index
      @sites = Site.all
    end
    def new 
       @site = Site.new
    end
    def create
       @site = Site.new(site_parames)
       if @site.save
        redirect_to sites_path, notice:'新增成功'
       else
        render :new
       end
    end
    def show
        @site = Site.find_by(id: params[:id])
    end
    def edit
        @site = Site.find_by(id: params[:id])
    end
    def update
        @site = Site.find_by(id: params[:id])
        if  @site.update (site_parames )
             redirect_to sites_path, notice:'更新成功'
       else
        render :edit
       end
    end
    def destroy
        @site = Site.find_by(id: params[:id])
        @site.destroy
        redirect_to sites_path, notice:'已刪除!'
    end

    private
    def  site_parames 
        params.require(:site).permit(:name, :website, :adderess, :latitude, :longitude, :stay_duration, :intro, :pet_freindly)
    end
end
