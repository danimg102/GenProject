json.array!(@nomenclators) do |nomenclator|
  json.extract! nomenclator, :id, :name, :description
  json.url nomenclator_url(nomenclator, format: :json)
end
