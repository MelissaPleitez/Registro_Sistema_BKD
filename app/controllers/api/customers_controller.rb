class Api::CustomersController < ApplicationController
  before_action :authenticate_user_from_token!

    def index
      @customers = current_user.customers
      render json: @customers
    end
  

    def show
      @customer = current_user.customers.find(params[:id])
      render json: @customer
    end
  
 
    def create
      @customer = current_user.customers.build(customer_params)
      if @customer.save
        create_audit_log("El cliente fue creado", @customer)
        render json: @customer, status: :created
      else
        render json: @customer.errors, status: :unprocessable_entity
      end
    end
  
 
    def update
      @customer = current_user.customers.find(params[:id])
      if @customer.update(customer_params)
        create_audit_log("El cliente fue actualizado", @customer)
        render json: @customer
      else
        render json: @customer.errors, status: :unprocessable_entity
      end
    end


    def destroy
      @customer = current_user.customers.find(params[:id])
      AuditLog.where(customer_id: @customer.id).destroy_all
      CustomerDirection.where(customer_id: @customer.id).destroy_all
      CustomerIdentification.where(customer_id: @customer.id).destroy_all
      @customer.destroy
      create_audit_log("El cliente fue eliminado", @customer)
      render json: "Client deleted"
    end

  
    private


    def customer_params
        params.require(:customer).permit(:first_name, :last_name, :client_email, :tel_number, :user_id); 
    end


    def create_audit_log(action, customer)
      AuditLog.create(authentication_id: current_user.id, changes_client: action, customer_id: customer.id)
    end
end
