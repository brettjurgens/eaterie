class StepIngredientsController < ApplicationController
  before_action :set_step_ingredient, only: [:show, :edit, :update, :destroy]

  # GET /step_ingredients
  # GET /step_ingredients.json
  def index
    @step_ingredients = StepIngredient.all
  end

  # GET /step_ingredients/1
  # GET /step_ingredients/1.json
  def show
  end

  # GET /step_ingredients/new
  def new
    @step_ingredient = StepIngredient.new
  end

  # GET /step_ingredients/1/edit
  def edit
  end

  # POST /step_ingredients
  # POST /step_ingredients.json
  def create
    @step_ingredient = StepIngredient.new(step_ingredient_params)

    respond_to do |format|
      if @step_ingredient.save
        format.html { redirect_to @step_ingredient, notice: 'Step ingredient was successfully created.' }
        format.json { render action: 'show', status: :created, location: @step_ingredient }
      else
        format.html { render action: 'new' }
        format.json { render json: @step_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /step_ingredients/1
  # PATCH/PUT /step_ingredients/1.json
  def update
    respond_to do |format|
      if @step_ingredient.update(step_ingredient_params)
        format.html { redirect_to @step_ingredient, notice: 'Step ingredient was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @step_ingredient }
      else
        format.html { render action: 'edit' }
        format.json { render json: @step_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /step_ingredients/1
  # DELETE /step_ingredients/1.json
  def destroy
    @step_ingredient.destroy
    respond_to do |format|
      format.html { redirect_to step_ingredients_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_step_ingredient
      @step_ingredient = StepIngredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def step_ingredient_params
      params.require(:step_ingredient).permit(:amount)
    end
end
