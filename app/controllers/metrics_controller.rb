class MetricsController < ApplicationController
  def index
    gon.data = Metric.prepare(params[:format])
  end
end
