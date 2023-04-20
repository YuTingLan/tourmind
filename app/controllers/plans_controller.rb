class PlansController < ApplicationController
  before_action :find_plan, only: %i[show edit update destroy]

  def index
    @plans = Plan.all
  end

  def show
  end

  def new
    @plan = Plan.new
  end

  def create
  end

  def edit
    render :new
  end

  def update
  end

  def destroy
    return redirect_to plans_path if @plan.destroy
  end

  private

  def find_plan
    @plan = Plan.find(params[:id])
  end

  def plan_params
    params.require(:plan).permit(:name, :description, :days, :caegory)
  end
end
