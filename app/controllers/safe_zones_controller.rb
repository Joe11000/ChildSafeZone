class SafeZonesController < ApplicationController
  before_action :set_safe_zone, only: [:show, :edit, :update, :destroy, :alert]


  def alert

    params[:child_coordinates]
    nearest = SafeZone.first

    render json: { "latitude": nearest.latitude, "longitude": nearest.longitude }
  end

  # GET /safe_zones
  # GET /safe_zones.json
  def index
    @safe_zones = SafeZone.all
  end

  # GET /safe_zones/1
  # GET /safe_zones/1.json
  def show
  end

  # GET /safe_zones/new
  def new
    @safe_zone = SafeZone.new
  end

  # GET /safe_zones/1/edit
  def edit
  end

  # POST /safe_zones
  # POST /safe_zones.json
  def create
    @safe_zone = SafeZone.new(safe_zone_params)

    respond_to do |format|
      if @safe_zone.save
        format.html { redirect_to @safe_zone, notice: 'Safe zone was successfully created.' }
        format.json { render :show, status: :created, location: @safe_zone }
      else
        format.html { render :new }
        format.json { render json: @safe_zone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /safe_zones/1
  # PATCH/PUT /safe_zones/1.json
  def update
    respond_to do |format|
      if @safe_zone.update(safe_zone_params)
        format.html { redirect_to @safe_zone, notice: 'Safe zone was successfully updated.' }
        format.json { render :show, status: :ok, location: @safe_zone }
      else
        format.html { render :edit }
        format.json { render json: @safe_zone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /safe_zones/1
  # DELETE /safe_zones/1.json
  def destroy
    @safe_zone.destroy
    respond_to do |format|
      format.html { redirect_to safe_zones_url, notice: 'Safe zone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_safe_zone
      @safe_zone = SafeZone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def safe_zone_params
      params.require(:safe_zone).permit(:location_name, :person_name, :address, :latitude, :longitude)
    end
end
