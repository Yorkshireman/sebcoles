json.array!(@materials) do |material|
  json.extract! material, :id, :title, :level, :description, :link
  json.url material_url(material, format: :json)
end
