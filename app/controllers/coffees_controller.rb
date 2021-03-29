class CoffeesController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @coffees = Coffee.all
    json_response(@coffees)
  end

  def show
    @coffee = Coffee.find(params[:id])
    json_response(@coffee)
  end

  def create
    @coffee = Coffee.create(coffee_params)
    json_response(@coffee)
  end

  def update
    @coffee = Coffee.find(params[:id])
    @coffee.update(coffee_params)
  end

  def destroy
    @coffee = Coffee.find(params[:id])
    @coffee.destroy
  end

  private
  def coffee_params
    params.permit(:blend_name, :origin, :notes)
  end
end
