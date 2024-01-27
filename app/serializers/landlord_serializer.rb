class LandlordSerializer < ActiveModel::Serializer
  attributes :id, :name, :company_email, :company_phone_number, :password_digest
end
