class WorkoutsController < ApplicationController
  before_action :current_user_must_be_workout_user,
                only: %i[edit update destroy]

  before_action :set_workout, only: %i[show edit update destroy]

  # GET /workouts
  def index
    @q = Workout.ransack(params[:q])
    @workouts = @q.result(distinct: true).includes(:user, :fastest_times,
                                                   :sport).page(params[:page]).per(10)
  end

  # GET /workouts/1
  def show
    @fastest_time = FastestTime.new
  end

  # GET /workouts/new
  def new
    @workout = Workout.new
  end

  # GET /workouts/1/edit
  def edit; end

  # POST /workouts
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

  # PATCH/PUT /workouts/1
  def update
    if @workout.update(workout_params)
      redirect_to @workout, notice: "Workout was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /workouts/1
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

  # Use callbacks to share common setup or constraints between actions.
  def set_workout
    @workout = Workout.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def workout_params
    params.require(:workout).permit(:description, :user_id, :sport_id,
                                    :distance, :date)
  end
end
