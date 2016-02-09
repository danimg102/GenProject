json.array!(@attribs) do |attrib|
  json.extract! attrib, :id, :system_id, :name, :type, :extra
  json.url attrib_url(attrib, format: :json)
end
