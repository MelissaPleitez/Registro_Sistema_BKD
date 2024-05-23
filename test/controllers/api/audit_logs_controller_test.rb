require "test_helper"

class Api::AuditLogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_audit_logs_index_url
    assert_response :success
  end
end
