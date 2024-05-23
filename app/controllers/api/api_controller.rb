class Api::ApiController < ApplicationController

    def generate_client_report
      customers = Customer.all
  
      respond_to do |format|
        format.csv do
          send_data generate_csv(customers), filename: "client_report_#{Time.now.strftime('%Y-%m-%d_%H-%M-%S')}.csv"
        end
      end
    end
  
    private
  
    def generate_csv(customers)
      CSV.generate(headers: true) do |csv|
        csv << ['ID', 'Nombre', 'Apellido', 'Correo', 'Teléfono', 'Fecha de Creación']
  
        customers.each do |customer|
          csv << [customer.id, customer.first_name, customer.last_name, customer.client_email, customer.tel_number, customer.created_at.strftime('%Y-%m-%d %H:%M:%S')]
        end
      end
    end
end
  