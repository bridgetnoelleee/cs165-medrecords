class PatienthistoriesController < ApplicationController
  before_action :set_patienthistory, only: [:show, :edit, :update, :destroy]

  # GET /patienthistories
  # GET /patienthistories.json
  def index
    @patienthistories = Patienthistory.all
  end

  # GET /patienthistories/1
  # GET /patienthistories/1.json
  def show
  end

  # GET /patienthistories/new
  def new
    @patienthistory = Patienthistory.new
  end

  # GET /patienthistories/1/edit
  def edit
  end

  # POST /patienthistories
  # POST /patienthistories.json
  def create
    @patienthistory = Patienthistory.new(patienthistory_params)

    respond_to do |format|
      if @patienthistory.save
        format.html { redirect_to @patienthistory, notice: 'Patienthistory was successfully created.' }
        format.json { render :show, status: :created, location: @patienthistory }
      else
        format.html { render :new }
        format.json { render json: @patienthistory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patienthistories/1
  # PATCH/PUT /patienthistories/1.json
  def update
    respond_to do |format|
      if @patienthistory.update(patienthistory_params)
        format.html { redirect_to @patienthistory, notice: 'Patienthistory was successfully updated.' }
        format.json { render :show, status: :ok, location: @patienthistory }
      else
        format.html { render :edit }
        format.json { render json: @patienthistory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patienthistories/1
  # DELETE /patienthistories/1.json
  def destroy
    @patienthistory.destroy
    respond_to do |format|
      format.html { redirect_to patienthistories_url, notice: 'Patienthistory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patienthistory
      @patienthistory = Patienthistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patienthistory_params
      params.require(:patienthistory).permit(:patientID, :medHisID)
    end
end
