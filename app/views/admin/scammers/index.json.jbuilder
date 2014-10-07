json.array!(@scammers) do |scammer|
  json.extract! scammer, :id
  json.url scammer_url(scammer, format: :json)
end
