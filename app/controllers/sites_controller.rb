# frozen_string_literal: true

class SitesController < ApplicationController
  before_action :set_site, only: %i[show edit update destroy]

  def index
    @sites = Site.order(updated_at: :desc)
    @sites = Site.search(params[:keyword]) if params[:keyword].present?
    return unless @sites.empty?

    flash.now[:notice] = '沒有找到符合條件的飯店'
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_parames)
    if @site.save
      redirect_to sites_path, notice: '新增成功'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @site.update(site_parames)
      redirect_to sites_path, notice: '更新成功'
    else
      render :edit
    end
  end

  def destroy
    set_site
    @site.destroy
    redirect_to sites_path, notice: '已刪除!'
  end

  private

  def set_site
    @site = Site.find(params[:id])
  end

  def site_parames
    params.require(:site).permit(:name, :website, :address, :tel, :latitude, :longitude, :stay_duration, :intro,
                                 :pet_freindly, site_types: [])
  end
end
