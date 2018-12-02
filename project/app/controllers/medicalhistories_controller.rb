class MedicalhistoriesController < ApplicationController
  before_action :set_medicalhistory, only: [:show, :edit, :update, :destroy]

  # GET /medicalhistories
  # GET /medicalhistories.json
  def index
    @medicalhistories = Medicalhistory.all
  end

  # GET /medicalhistories/1
  # GET /medicalhistories/1.json
  def show
  end

  # GET /medicalhistories/new
  def new
    @medicalhistory = Medicalhistory.new
  end

  # GET /medicalhistories/1/edit
  def edit
  end

  # POST /medicalhistories
  # POST /medicalhistories.json
  def create
    @medicalhistory = Medicalhistory.new(medicalhistory_params)

    respond_to do |format|
      if @medicalhistory.save
        format.html { redirect_to @medicalhistory, notice: 'Medicalhistory was successfully created.' }
        format.json { render :show, status: :created, location: @medicalhistory }
      else
        format.html { render :new }
        format.json { render json: @medicalhistory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medicalhistories/1
  # PATCH/PUT /medicalhistories/1.json
  def update
    respond_to do |format|
      if @medicalhistory.update(medicalhistory_params)
        format.html { redirect_to @medicalhistory, notice: 'Medicalhistory was successfully updated.' }
        format.json { render :show, status: :ok, location: @medicalhistory }
      else
        format.html { render :edit }
        format.json { render json: @medicalhistory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medicalhistories/1
  # DELETE /medicalhistories/1.json
  def destroy
    @medicalhistory.destroy
    respond_to do |format|
      format.html { redirect_to medicalhistories_url, notice: 'Medicalhistory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicalhistory
      @medicalhistory = Medicalhistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medicalhistory_params
      params.require(:medicalhistory).permit(:dateAndTime, :medication, :diseaseOrCondition)
    end
end
