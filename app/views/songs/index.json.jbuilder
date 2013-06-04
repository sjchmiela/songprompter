json.array!(@songs) do |song|
  json.extract! song, :name, :text
  json.url song_url(song, format: :json)
end