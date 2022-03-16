class Api::V1::FastestTimesController < Api::V1::GraphitiController
  def index
    fastest_times = FastestTimeResource.all(params)
    respond_with(fastest_times)
  end

  def show
    fastest_time = FastestTimeResource.find(params)
    respond_with(fastest_time)
  end

  def create
    fastest_time = FastestTimeResource.build(params)

    if fastest_time.save
      render jsonapi: fastest_time, status: 201
    else
      render jsonapi_errors: fastest_time
    end
  end

  def update
    fastest_time = FastestTimeResource.find(params)

    if fastest_time.update_attributes
      render jsonapi: fastest_time
    else
      render jsonapi_errors: fastest_time
    end
  end

  def destroy
    fastest_time = FastestTimeResource.find(params)

    if fastest_time.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: fastest_time
    end
  end
end
