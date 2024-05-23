class Api::CustomerDirectionsController < ApplicationController
    before_action :authenticate_user_from_token!
    before_action :set_customer_direction, only: [:show, :update, :destroy]
  
 
    def index
      @customer_directions = Customer.find(params[:customer_id]).customer_directions
      render json: @customer_directions
    end
  

    def show
      render json: @customer_direction
    end
  

    def create
      @customer_direction = Customer.find(params[:customer_id]).customer_directions.build(customer_direction_params)
      if @customer_direction.save
        render json: @customer_direction, status: :created
      else
        render json: @customer_direction.errors, status: :unprocessable_entity
      end
    end
  
 
    def update
      if @customer_direction.update(customer_direction_params)
        render json: @customer_direction
      else
        render json: @customer_direction.errors, status: :unprocessable_entity
      end
    end
  

    def destroy
      @customer_direction.destroy
      render json: "Customer direction deleted"
    end
  
    private
  

    def set_customer_direction
      @customer_direction = CustomerDirection.find(params[:id])
    end

    
    def customer_direction_params
      params.require(:customer_direction).permit(:address, :city, :state, :postal_code)
    end
end
