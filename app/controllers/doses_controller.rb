class DosesController < ApplicationController

    def index
    end

    def new
        @cocktail = Cocktail.find(params[:cocktail_id])
        @dose = Dose.new
    end

    def create
        @dose = Dose.new(dose_params) # create new dose
        @cocktail = Cocktail.find(params[:cocktail_id]) #find cocktail by id
        @dose.cocktail = @cocktail # assign cocktail_id inside dose
        if @dose.save
            redirect_to cocktail_path(@cocktail) # return to cocktail/:id (cocktail no s)
        else
            render :new
        end
    end

    def destroy
        @dose = Dose.find(params[:id])
        @dose.destroy
        redirect_to cocktail_path(@dose.cocktail)
    end

    private

    def dose_params
        params.require(:dose).permit(:description, :ingredient_id)
    end
end
