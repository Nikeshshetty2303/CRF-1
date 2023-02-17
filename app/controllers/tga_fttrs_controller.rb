class TgaFttrsController < ApplicationController
  before_action :set_tga_fttr, only: %i[ show edit update destroy ]

  # GET /tga_fttrs or /tga_fttrs.json
  def index
    @tga_fttrs = TgaFttr.all
  end

  # GET /tga_fttrs/1 or /tga_fttrs/1.json
  def show
  end

  # GET /tga_fttrs/new
  def new
    @tga_fttr = TgaFttr.new
  end

  # GET /tga_fttrs/1/edit
  def edit
  end

  # POST /tga_fttrs or /tga_fttrs.json
  def create
    @tga_fttr = TgaFttr.new(tga_fttr_params)

    respond_to do |format|
      if @tga_fttr.save
        format.html { redirect_to tga_fttr_url(@tga_fttr), notice: "Tga fttr was successfully created." }
        format.json { render :show, status: :created, location: @tga_fttr }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tga_fttr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tga_fttrs/1 or /tga_fttrs/1.json
  def update
    respond_to do |format|
      if @tga_fttr.update(tga_fttr_params)
        format.html { redirect_to tga_fttr_url(@tga_fttr), notice: "Tga fttr was successfully updated." }
        format.json { render :show, status: :ok, location: @tga_fttr }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tga_fttr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tga_fttrs/1 or /tga_fttrs/1.json
  def destroy
    @tga_fttr.destroy

    respond_to do |format|
      format.html { redirect_to tga_fttrs_url, notice: "Tga fttr was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tga_fttr
      @tga_fttr = TgaFttr.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tga_fttr_params
      params.require(:tga_fttr).permit(:sample, :measurement, :stype, :description, :nature, :min_temp, :max_temp, :scan_rate, :atmosphere, :hazard, :compatability, :carcinogenic, :explosive, :more)
    end
end