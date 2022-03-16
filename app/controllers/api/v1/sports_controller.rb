class Api::V1::SportsController < Api::V1::GraphitiController
  def index
    sports = SportResource.all(params)
    respond_with(sports)
  end

  def show
    sport = SportResource.find(params)
    respond_with(sport)
  end

  def create
    sport = SportResource.build(params)

    if sport.save
      render jsonapi: sport, status: 201
    else
      render jsonapi_errors: sport
    end
  end

  def update
    sport = SportResource.find(params)

    if sport.update_attributes
      render jsonapi: sport
    else
      render jsonapi_errors: sport
    end
  end

  def destroy
    sport = SportResource.find(params)

    if sport.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: sport
    end
  end
end
