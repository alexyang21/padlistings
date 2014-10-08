json.array!(@pads) do |pad|
  json.extract! pad, :id, :heading, :body, :price, :external_url
  json.url pad_url(pad, format: :json)
end
