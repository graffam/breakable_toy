class MetricsController < ApplicationController
  def index
    @hash = { "labels" => [],
      "datasets" => [
        fillColor: "rgb(1,97,158)",
        strokeColor: "rgba(220,220,220,0.8)",
        highlightFill: "rgba(220,220,220,0.75)",
        highlightStroke: "rgba(220,220,220,1)",
        data: []] }
    @machines = Machine.all
    @machines.each do |key|
      @hash["labels"] << key.name
      @hash["datasets"][0][:data] << Order.where(machine_id: key.id).count
    end
    gon.data = @hash
  end
end
