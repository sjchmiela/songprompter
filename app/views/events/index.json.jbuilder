json.array!(@events) do |event|
  json.extract! event, :name
  json.url event_url(event, format: :json)
end