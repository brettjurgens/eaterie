json.array!(@recipe_steps) do |recipe_step|
  json.extract! recipe_step, :id, :description
  json.url recipe_step_url(recipe_step, format: :json)
end
