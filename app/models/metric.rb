class Metric
  def self.prepare
    data = { "labels" => [],
      "datasets" => [
        fillColor: "rgb(1,97,158)",
        strokeColor: "rgba(220,220,220,0.8)",
        highlightFill: "rgba(220,220,220,0.75)",
        highlightStroke: "rgba(220,220,220,1)",
        data: []] }
    machines = Machine.all
    machines.each do |key|
      binding.pry
      data["labels"] << key.name
      data["datasets"][0][:data] << Order.where(machine_id: key.id).count
    end
    data
  end
end
