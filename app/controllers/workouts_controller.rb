class WorkoutsController < ApplicationController
  before_action :current_user_must_be_workout_user,
                only: %i[edit update destroy]

  before_action :set_workout, only: %i[show edit update destroy]

  def index
    @q = Workout.ransack(params[:q])
    @workouts = @q.result(distinct: true).includes(:user, :fastest_times,
                                                   :sport).page(params[:page]).per(10)
  end

  def show
    @fastest_time = FastestTime.new
  end

  def new
    @workout = Workout.new
  end

  def edit; end

  def create
    @workout = Workout.new(workout_params)

    if @workout.save
      message = "Workout was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @workout, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @workout.update(workout_params)
      redirect_to @workout, notice: "Workout was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @workout.destroy
    message = "Workout was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to workouts_url, notice: message
    end
  end

  private

  def current_user_must_be_workout_user
    set_workout
    unless current_user == @workout.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_workout
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:description, :user_id, :sport_id,
                                    :distance, :date)
  end
end
