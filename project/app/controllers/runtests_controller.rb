class RuntestsController < ApplicationController
  before_action :set_runtest, only: [:show, :edit, :update, :destroy]

  # GET /runtests
  # GET /runtests.json
  def index
    @runtests = Runtest.all
  end

  # GET /runtests/1
  # GET /runtests/1.json
  def show
  end

  # GET /runtests/new
  def new
    @runtest = Runtest.new
  end

  # GET /runtests/1/edit
  def edit
  end

  # POST /runtests
  # POST /runtests.json
  def create
    @runtest = Runtest.new(runtest_params)

    respond_to do |format|
      if @runtest.save
        format.html { redirect_to @runtest, notice: 'Runtest was successfully created.' }
        format.json { render :show, status: :created, location: @runtest }
      else
        format.html { render :new }
        format.json { render json: @runtest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /runtests/1
  # PATCH/PUT /runtests/1.json
  def update
    respond_to do |format|
      if @runtest.update(runtest_params)
        format.html { redirect_to @runtest, notice: 'Runtest was successfully updated.' }
        format.json { render :show, status: :ok, location: @runtest }
      else
        format.html { render :edit }
        format.json { render json: @runtest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /runtests/1
  # DELETE /runtests/1.json
  def destroy
    @runtest.destroy
    respond_to do |format|
      format.html { redirect_to runtests_url, notice: 'Runtest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_runtest
      @runtest = Runtest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def runtest_params
      params.require(:runtest).permit(:nurseID, :testID, :dateAndTime)
    end
end
