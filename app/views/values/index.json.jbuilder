json.array!(@values) do |value|
  json.extract! value, :id, :attrib_id, :value, :patient_id
  json.url value_url(value, format: :json)
end
