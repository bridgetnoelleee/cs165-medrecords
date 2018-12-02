class GetinfosController < ApplicationController
  before_action :set_getinfo, only: [:show, :edit, :update, :destroy]

  # GET /getinfos
  # GET /getinfos.json
  def index
    @getinfos = Getinfo.all
  end

  # GET /getinfos/1
  # GET /getinfos/1.json
  def show
  end

  # GET /getinfos/new
  def new
    @getinfo = Getinfo.new
  end

  # GET /getinfos/1/edit
  def edit
  end

  # POST /getinfos
  # POST /getinfos.json
  def create
    @getinfo = Getinfo.new(getinfo_params)

    respond_to do |format|
      if @getinfo.save
        format.html { redirect_to @getinfo, notice: 'Getinfo was successfully created.' }
        format.json { render :show, status: :created, location: @getinfo }
      else
        format.html { render :new }
        format.json { render json: @getinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /getinfos/1
  # PATCH/PUT /getinfos/1.json
  def update
    respond_to do |format|
      if @getinfo.update(getinfo_params)
        format.html { redirect_to @getinfo, notice: 'Getinfo was successfully updated.' }
        format.json { render :show, status: :ok, location: @getinfo }
      else
        format.html { render :edit }
        format.json { render json: @getinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /getinfos/1
  # DELETE /getinfos/1.json
  def destroy
    @getinfo.destroy
    respond_to do |format|
      format.html { redirect_to getinfos_url, notice: 'Getinfo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_getinfo
      @getinfo = Getinfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def getinfo_params
      params.require(:getinfo).permit(:patientID, :nurseID)
    end
end
