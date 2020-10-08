class CocktailsController < ApplicationController
  before_action :set_params, only: [:show, :edit, :destroy]

  # CRUD = create, read, update, destroy

  # all
  def index
    @cocktails = Cocktail.all
  end

  # READ
  # A user can see the details of a given cocktail, with the dose needed for each ingredient
  def show
    @dose = Dose.new
    # @review = Review.new
  end

  # CREATE
  # new (to set an id )
  # create
  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      # go the the specific page of the cocktail created
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  # UPDATE
  # edit
  # update
  def edit
  end

  def update
    if @cocktail.update(cocktail_params)
      # go the the page with all cocktails
      redirect_to cocktails_path
    else
      render :edit
    end
  end

  def destroy
    @cocktail.destroy
    # go the the page with all cocktails
    redirect_to cocktails_path
  end

  private
  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def set_params
    @cocktail = Cocktail.find(params[:id])
  end
end
