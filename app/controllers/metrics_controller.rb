class MetricsController < ApplicationController
  def index
    if !params[:query]
      gon.data = Metric.prepare
    end
  end
end
