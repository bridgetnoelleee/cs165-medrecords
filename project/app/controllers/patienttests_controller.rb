class PatienttestsController < ApplicationController
  before_action :set_patienttest, only: [:show, :edit, :update, :destroy]

  # GET /patienttests
  # GET /patienttests.json
  def index
    @patienttests = Patienttest.all
  end

  # GET /patienttests/1
  # GET /patienttests/1.json
  def show
  end

  # GET /patienttests/new
  def new
    @patienttest = Patienttest.new
  end

  # GET /patienttests/1/edit
  def edit
  end

  # POST /patienttests
  # POST /patienttests.json
  def create
    @patienttest = Patienttest.new(patienttest_params)

    respond_to do |format|
      if @patienttest.save
        format.html { redirect_to @patienttest, notice: 'Patienttest was successfully created.' }
        format.json { render :show, status: :created, location: @patienttest }
      else
        format.html { render :new }
        format.json { render json: @patienttest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patienttests/1
  # PATCH/PUT /patienttests/1.json
  def update
    respond_to do |format|
      if @patienttest.update(patienttest_params)
        format.html { redirect_to @patienttest, notice: 'Patienttest was successfully updated.' }
        format.json { render :show, status: :ok, location: @patienttest }
      else
        format.html { render :edit }
        format.json { render json: @patienttest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patienttests/1
  # DELETE /patienttests/1.json
  def destroy
    @patienttest.destroy
    respond_to do |format|
      format.html { redirect_to patienttests_url, notice: 'Patienttest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patienttest
      @patienttest = Patienttest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patienttest_params
      params.require(:patienttest).permit(:patientID, :testID, :dateAndTime)
    end
end
