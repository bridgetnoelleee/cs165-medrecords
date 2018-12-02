class LabtestsresultsController < ApplicationController
  before_action :set_labtestsresult, only: [:show, :edit, :update, :destroy]

  # GET /labtestsresults
  # GET /labtestsresults.json
  def index
    @labtestsresults = Labtestsresult.all
  end

  # GET /labtestsresults/1
  # GET /labtestsresults/1.json
  def show
  end

  # GET /labtestsresults/new
  def new
    @labtestsresult = Labtestsresult.new
  end

  # GET /labtestsresults/1/edit
  def edit
  end

  # POST /labtestsresults
  # POST /labtestsresults.json
  def create
    @labtestsresult = Labtestsresult.new(labtestsresult_params)

    respond_to do |format|
      if @labtestsresult.save
        format.html { redirect_to @labtestsresult, notice: 'Labtestsresult was successfully created.' }
        format.json { render :show, status: :created, location: @labtestsresult }
      else
        format.html { render :new }
        format.json { render json: @labtestsresult.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /labtestsresults/1
  # PATCH/PUT /labtestsresults/1.json
  def update
    respond_to do |format|
      if @labtestsresult.update(labtestsresult_params)
        format.html { redirect_to @labtestsresult, notice: 'Labtestsresult was successfully updated.' }
        format.json { render :show, status: :ok, location: @labtestsresult }
      else
        format.html { render :edit }
        format.json { render json: @labtestsresult.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labtestsresults/1
  # DELETE /labtestsresults/1.json
  def destroy
    @labtestsresult.destroy
    respond_to do |format|
      format.html { redirect_to labtestsresults_url, notice: 'Labtestsresult was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_labtestsresult
      @labtestsresult = Labtestsresult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def labtestsresult_params
      params.require(:labtestsresult).permit(:testID, :dateAndTime, :testName, :testResults)
    end
end
