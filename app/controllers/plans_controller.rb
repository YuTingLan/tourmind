class PlansController < ApplicationController
  before_action :find_plan, only: %i[show edit update destroy]

  def index
    @plans = Plan.order(id: :desc)
  end

  def show
  end

  def new
    @plan = Plan.new
  end

  def create
    plan = Plan.new(plan_params)
    return redirect_to plan_path(plan.id) if plan.save
  end

  def edit
    render :new
  end

  def update
    return redirect_to plan_path(@plan.id) if @plan.update(plan_params)
    render :new
  end

  def destroy
    return redirect_to plans_path if @plan.destroy
  end

  private

  def find_plan
    @plan = Plan.find(params[:id])
  end

  def plan_params
    params.require(:plan).permit(:name, :description, :days, :category)
  end
end
