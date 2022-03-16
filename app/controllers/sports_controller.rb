class SportsController < ApplicationController
  before_action :set_sport, only: %i[show edit update destroy]

  def index
    @q = Sport.ransack(params[:q])
    @sports = @q.result(distinct: true).includes(:fastest_times,
                                                 :workouts).page(params[:page]).per(10)
  end

  def show
    @workout = Workout.new
    @fastest_time = FastestTime.new
  end

  def new
    @sport = Sport.new
  end

  def edit; end

  def create
    @sport = Sport.new(sport_params)

    if @sport.save
      redirect_to @sport, notice: "Sport was successfully created."
    else
      render :new
    end
  end

  def update
    if @sport.update(sport_params)
      redirect_to @sport, notice: "Sport was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @sport.destroy
    redirect_to sports_url, notice: "Sport was successfully destroyed."
  end

  private

  def set_sport
    @sport = Sport.find(params[:id])
  end

  def sport_params
    params.require(:sport).permit(:name, :description)
  end
end
