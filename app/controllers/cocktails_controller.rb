class CocktailsController < ApplicationController
    before_action :cocktail_find, only: [:show]

    def index
        @cocktails = Cocktail.all
    end

    def new
        @ingredient = Ingredient.new
        @dose = Dose.new
        @cocktail = Cocktail.new
    end
    
    def show
        @cocktail = Cocktail.find(params[:id])
    end


    def create
        # @cocktail = Cocktail.new(cocktail_params)

    end


    private

    def cocktail_find
        @cocktail = Cocktail.find(params[:id])
    end

    def cocktail_params
        params.require(:cocktail).permit(:name)
    end
end
