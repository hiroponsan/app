json.array!(@tests) do |test|
  json.extract! test, :id, :year, :semester, :textbook, :user_id
  json.url test_url(test, format: :json)
end
