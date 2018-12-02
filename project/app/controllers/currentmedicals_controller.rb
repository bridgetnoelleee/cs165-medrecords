class CurrentmedicalsController < ApplicationController
  before_action :set_currentmedical, only: [:show, :edit, :update, :destroy]

  # GET /currentmedicals
  # GET /currentmedicals.json
  def index
    @currentmedicals = Currentmedical.all
  end

  def get
    @currentmedical = Currentmedical.where(id: params[:ids])
  end

  # GET /currentmedicals/1
  # GET /currentmedicals/1.json
  def show
  end

  # GET /currentmedicals/new
  def new
    @currentmedical = Currentmedical.new
  end

  # GET /currentmedicals/1/edit
  def edit
  end

  # POST /currentmedicals
  # POST /currentmedicals.json
  def create
    @currentmedical = Currentmedical.new(currentmedical_params)

    respond_to do |format|
      if @currentmedical.save
        format.html { redirect_to @currentmedical, notice: 'Currentmedical was successfully created.' }
        format.json { render :show, status: :created, location: @currentmedical }
      else
        format.html { render :new }
        format.json { render json: @currentmedical.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /currentmedicals/1
  # PATCH/PUT /currentmedicals/1.json
  def update
    respond_to do |format|
      if @currentmedical.update(currentmedical_params)
        format.html { redirect_to @currentmedical, notice: 'Currentmedical was successfully updated.' }
        format.json { render :show, status: :ok, location: @currentmedical }
      else
        format.html { render :edit }
        format.json { render json: @currentmedical.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /currentmedicals/1
  # DELETE /currentmedicals/1.json
  def destroy
    @currentmedical.destroy
    respond_to do |format|
      format.html { redirect_to currentmedicals_url, notice: 'Currentmedical was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_currentmedical
      @currentmedical = Currentmedical.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def currentmedical_params
      params.require(:currentmedical).permit(:dateCreated, :dateUpdated, :medications, :allergies, :symptoms, :bloodPressure, :height, :weight)
    end
end
