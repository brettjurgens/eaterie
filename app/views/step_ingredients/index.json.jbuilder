json.array!(@step_ingredients) do |step_ingredient|
  json.extract! step_ingredient, :id, :amount
  json.url step_ingredient_url(step_ingredient, format: :json)
end
