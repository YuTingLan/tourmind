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
    plan_data = plan_info
    plan_data[:locations] = update_order(plan_data, @plan)

    if @plan.update(plan_data)
      render json: { status: "success", redirect_url: "/plans/#{@plan.id}" }
      return
    end

    render json: {
             status: "server error",
             redirect_url: "/plans/#{@plan.id}",
           },
           status: :internal_server_error
  end

  def destroy
    return redirect_to plans_path if @plan.destroy
  end

  def day_info
    @plan = Plan.find(params[:id])
    @day = params[:day].to_i

    render "day_nav"
  end

  def plan_overview
    @plan = Plan.find(params[:id])

    render "_plan_overview"
  end

  private

  def find_plan
    @plan = Plan.find(params[:id])
  end

  def plan_info
    params
      .require(:data)
      .permit(:name, :description, :days, locations: {})
      .tap { |field| field[:locations] = params[:data][:locations].permit! }
  end

  def update_order(locations, reference)
    locations[:locations].each_key do |key|
      locations[:locations][key] = locations[:locations][key].map do |location|
        reference[:locations][location[0]][location[1] - 1]
      end
    end
  end
end
