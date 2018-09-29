json.extract! playlist, :id, :url, :user_id, :created_at, :updated_at
json.url playlist_url(playlist, format: :json)
