class AuditLog < ApplicationRecord
  belongs_to :authentication
  belongs_to :customer
end
