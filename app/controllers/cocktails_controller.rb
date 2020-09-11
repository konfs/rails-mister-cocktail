class CocktailsController < ApplicationController
    before_action :cocktail_find, only: [:show]

    def index
        @cocktails = Cocktail.all
    end

    def new
        # @ingredient = Ingredient.new
        @doses = Dose.all
        @cocktail = Cocktail.new
    end
    
    def show
        @cocktail = Cocktail.find(params[:id])
    end


    def create
        @cocktail = Cocktail.new(cocktail_params)
        @cocktail.save
        redirect_to cocktails_path
    end


    private

    def cocktail_find
        @cocktail = Cocktail.find(params[:id])
    end

    def cocktail_params
        params.require(:cocktail).permit(:name)
    end
end
