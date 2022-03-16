class FastestTimesController < ApplicationController
  before_action :set_fastest_time, only: [:show, :edit, :update, :destroy]

  # GET /fastest_times
  def index
    @fastest_times = FastestTime.page(params[:page]).per(10)
  end

  # GET /fastest_times/1
  def show
  end

  # GET /fastest_times/new
  def new
    @fastest_time = FastestTime.new
  end

  # GET /fastest_times/1/edit
  def edit
  end

  # POST /fastest_times
  def create
    @fastest_time = FastestTime.new(fastest_time_params)

    if @fastest_time.save
      message = 'FastestTime was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @fastest_time, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /fastest_times/1
  def update
    if @fastest_time.update(fastest_time_params)
      redirect_to @fastest_time, notice: 'Fastest time was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /fastest_times/1
  def destroy
    @fastest_time.destroy
    message = "FastestTime was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to fastest_times_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fastest_time
      @fastest_time = FastestTime.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fastest_time_params
      params.require(:fastest_time).permit(:sport_id, :time_spent, :workout_id)
    end
end
