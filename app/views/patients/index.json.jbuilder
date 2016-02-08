json.array!(@patients) do |patient|
  json.extract! patient, :id, :code
  json.url patient_url(patient, format: :json)
end
