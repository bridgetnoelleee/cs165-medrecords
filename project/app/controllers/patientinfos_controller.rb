class PatientinfosController < ApplicationController
  before_action :set_patientinfo, only: [:show, :edit, :update, :destroy]

  # GET /patientinfos
  # GET /patientinfos.json
  def index
    @patientinfos = Patientinfo.all
  end

  # GET /patientinfos/1
  # GET /patientinfos/1.json
  def show
  end

  # GET /patientinfos/new
  def new
    @patientinfo = Patientinfo.new
  end

  # GET /patientinfos/1/edit
  def edit
  end

  # POST /patientinfos
  # POST /patientinfos.json
  def create
    @patientinfo = Patientinfo.new(patientinfo_params)

    respond_to do |format|
      if @patientinfo.save
        format.html { redirect_to @patientinfo, notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @patientinfo }
      else
        format.html { render :new }
        format.json { render json: @patientinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patientinfos/1
  # PATCH/PUT /patientinfos/1.json
  def update
    respond_to do |format|
      if @patientinfo.update(patientinfo_params)
        format.html { redirect_to @patientinfo, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @patientinfo }
      else
        format.html { render :edit }
        format.json { render json: @patientinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patientinfos/1
  # DELETE /patientinfos/1.json
  def destroy
    @patientinfo.destroy
    respond_to do |format|
      format.html { redirect_to patientinfos_url, notice: 'Entry was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patientinfo
      @patientinfo = Patientinfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patientinfo_params
      # params.require(:patientinfo).permit(:currMedID, :name, :birthDate, :bloodType, :dateCreated, :dateUpdated, :emergencyContact)
      params.require(:patientinfo).permit(:name, :birthDate, :bloodPressure, :height, :weight, :bloodType, :emergencyContact, :medications, :allergies, :symptoms, :dateCreated, :dateUpdated, :nurseID)
    end
end
