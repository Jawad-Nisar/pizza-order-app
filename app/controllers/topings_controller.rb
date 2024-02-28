class TopingsController < ApplicationController
  before_action :set_toping, only: %i[ show edit update destroy ]

  # GET /topings or /topings.json
  def index
    @topings = Toping.all
  end

  # GET /topings/1 or /topings/1.json
  def show
  end

  # GET /topings/new
  def new
    @toping = Toping.new
  end

  # GET /topings/1/edit
  def edit
  end

  # POST /topings or /topings.json
  def create
    @toping = Toping.new(toping_params)

    respond_to do |format|
      if @toping.save
        format.html { redirect_to toping_url(@toping), notice: "Toping was successfully created." }
        format.json { render :show, status: :created, location: @toping }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @toping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topings/1 or /topings/1.json
  def update
    respond_to do |format|
      if @toping.update(toping_params)
        format.html { redirect_to toping_url(@toping), notice: "Toping was successfully updated." }
        format.json { render :show, status: :ok, location: @toping }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @toping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topings/1 or /topings/1.json
  def destroy
    @toping.destroy!

    respond_to do |format|
      format.html { redirect_to topings_url, notice: "Toping was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_toping
      @toping = Toping.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def toping_params
      params.require(:toping).permit(:name)
    end
end
