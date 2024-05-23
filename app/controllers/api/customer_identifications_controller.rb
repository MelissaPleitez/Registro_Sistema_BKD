class Api::CustomerIdentificationsController < ApplicationController
    before_action :authenticate_user_from_token!
    before_action :set_customer_identification, only: [:show, :update, :destroy]
  

    def index
      @customer_identifications = Customer.find(params[:customer_id]).customer_identifications
      render json: @customer_identifications
    end
  
 
    def show
      render json: @customer_identification
    end
  
  
    def create
      @customer_identification = Customer.find(params[:customer_id]).customer_identifications.build(customer_identification_params)
      if @customer_identification.save
        render json: @customer_identification, status: :created
      else
        render json: @customer_identification.errors, status: :unprocessable_entity
      end
    end
  

    def update
      if @customer_identification.update(customer_identification_params)
        render json: @customer_identification
      else
        render json: @customer_identification.errors, status: :unprocessable_entity
      end
    end
  

    def destroy
      @customer_identification.destroy
      render json: "Customer identification deleted"
    end
  
    private
  
  
    def set_customer_identification
      @customer_identification = CustomerIdentification.find(params[:id])
    end
  
   
    def customer_identification_params
      params.require(:customer_identification).permit(:identification_type, :identification_number)
    end
end
