class AuthenticationsSerializer
  include JSONAPI::Serializer
  attributes :id, :email
end
