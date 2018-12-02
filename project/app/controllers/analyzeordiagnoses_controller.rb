class AnalyzeordiagnosesController < ApplicationController
  before_action :set_analyzeordiagnosis, only: [:show, :edit, :update, :destroy]

  # GET /analyzeordiagnoses
  # GET /analyzeordiagnoses.json
  def index
    @analyzeordiagnoses = Analyzeordiagnose.all
  end

  # GET /analyzeordiagnoses/1
  # GET /analyzeordiagnoses/1.json
  def show
  end

  # GET /analyzeordiagnoses/new
  def new
    @analyzeordiagnosis = Analyzeordiagnose.new
  end

  # GET /analyzeordiagnoses/1/edit
  def edit
  end

  # POST /analyzeordiagnoses
  # POST /analyzeordiagnoses.json
  def create
    @analyzeordiagnosis = Analyzeordiagnose.new(analyzeordiagnosis_params)

    respond_to do |format|
      if @analyzeordiagnosis.save
        format.html { redirect_to @analyzeordiagnosis, notice: 'Analyzeordiagnose was successfully created.' }
        format.json { render :show, status: :created, location: @analyzeordiagnosis }
      else
        format.html { render :new }
        format.json { render json: @analyzeordiagnosis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /analyzeordiagnoses/1
  # PATCH/PUT /analyzeordiagnoses/1.json
  def update
    respond_to do |format|
      if @analyzeordiagnosis.update(analyzeordiagnosis_params)
        format.html { redirect_to @analyzeordiagnosis, notice: 'Analyzeordiagnose was successfully updated.' }
        format.json { render :show, status: :ok, location: @analyzeordiagnosis }
      else
        format.html { render :edit }
        format.json { render json: @analyzeordiagnosis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analyzeordiagnoses/1
  # DELETE /analyzeordiagnoses/1.json
  def destroy
    @analyzeordiagnosis.destroy
    respond_to do |format|
      format.html { redirect_to analyzeordiagnoses_url, notice: 'Analyzeordiagnose was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_analyzeordiagnosis
      @analyzeordiagnosis = Analyzeordiagnose.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def analyzeordiagnosis_params
      params.require(:analyzeordiagnosis).permit(:doctorID, :medHisID)
    end
end
