class Api::AuditLogsController < ApplicationController
  before_action :authenticate_user_from_token!
  def index
    @audit_logs = AuditLog.all
    render json: @audit_logs
  end
end
