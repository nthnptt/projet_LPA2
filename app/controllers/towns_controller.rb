class TownsController < ApplicationController
  before_action :set_town, only: [:show, :edit, :update, :destroy]

  # GET /towns
  # GET /towns.json
  def index
    @towns = Town.all
  end

  # GET /towns/1
  # GET /towns/1.json
  def show
    @weather = @town.get_weather()
  end

  # GET /towns/new
  def new
    @town = Town.new
  end

  # GET /towns/1/edit
  def edit
  end

  # POST /towns
  # POST /towns.json
  def create
    @town = Town.new(town_params)
    format_creation(@town)
  end

  # PATCH/PUT /towns/1
  # PATCH/PUT /towns/1.json
  def update
    format_update(@town,town_params)
  end

  # DELETE /towns/1
  # DELETE /towns/1.json
  def destroy
    @town.destroy
    respond_to do |format|
      format.html { redirect_to towns_url, notice: 'Town was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_town
      @town = Town.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def town_params
      params.require(:town).permit(:name, :postal_code, :lat, :long)
    end
end
