class CoffeesController < ApplicationController

  def index
    @coffees = Coffee.all
    json_response(@coffees)
  end

  def show
    @coffee = Coffee.find(params[:id])
    json_response(@coffee)
  end

  def create
    if @coffee = Coffee.create!(coffee_params)
      render status: 201, json: {
        message: "You have successfully created a coffee",
        coffee: @coffee
      }
    end
  end

  def update
    @coffee = Coffee.find(params[:id])
    if @coffee.update!(coffee_params)
      render status: 200, json: {
        message: "This coffee has been successfully updated.",
        coffee: @coffee
      }
    end
  end

  def destroy
    @coffee = Coffee.find(params[:id])
    if @coffee.destroy!
      render status: 200, json: {
        message: "You have successfully deleted the coffee with id #{@coffee.id}"
      }
    end
  end

  private
  def coffee_params
    params.permit(:blend_name, :origin, :notes)
  end
end
