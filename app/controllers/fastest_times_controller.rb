class FastestTimesController < ApplicationController
  before_action :set_fastest_time, only: %i[show edit update destroy]

  def index
    @q = FastestTime.ransack(params[:q])
    @fastest_times = @q.result(distinct: true).includes(:workout,
                                                        :sport).page(params[:page]).per(10)
  end

  def show; end

  def new
    @fastest_time = FastestTime.new
  end

  def edit; end

  def create
    @fastest_time = FastestTime.new(fastest_time_params)

    if @fastest_time.save
      message = "FastestTime was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @fastest_time, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @fastest_time.update(fastest_time_params)
      redirect_to @fastest_time,
                  notice: "Fastest time was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @fastest_time.destroy
    message = "FastestTime was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to fastest_times_url, notice: message
    end
  end

  private

  def set_fastest_time
    @fastest_time = FastestTime.find(params[:id])
  end

  def fastest_time_params
    params.require(:fastest_time).permit(:sport_id, :time_spent, :workout_id)
  end
end
