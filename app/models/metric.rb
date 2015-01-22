class Metric
  def self.prepare(*query)
    data = { "labels" => [],
             "datasets" => [
                fillColor: "rgb(1,97,158)",
                strokeColor: "rgba(220,220,220,0.8)",
                highlightFill: "rgba(220,220,220,0.75)",
                highlightStroke: "rgba(220,220,220,1)",
                data: []] }
    machines = Machine.all
    if query[0] == "today"
      machines.each do |key|
        data["labels"] << key.name
        data["datasets"][0][:data] << Order.where(
        "created_at::date = ? and machine_id = ?", Date.today, key.id).count
      end
    elsif query[0] == "week"
      machines.each do |key|
        data["labels"] << key.name
        data["datasets"][0][:data] << Order.where(
          "created_at > ? and machine_id = ?",
          Time.now.beginning_of_week.to_date, key.id).count
      end
    elsif query[0] == "month"
      machines.each do |key|
        data["labels"] << key.name
        data["datasets"][0][:data] << Order.where(
          "created_at::date > ? and machine_id = ?",
          Time.now.beginning_of_month.to_date, key.id).count
      end
    elsif query[0] == "year"
      machines.each do |key|
        data["labels"] << key.name
        data["datasets"][0][:data] << Order.where(
        "created_at::date > ? and machine_id = ?",
        Time.now.beginning_of_year.to_date, key.id).count
      end
    else
      machines.each do |key|
        data["labels"] << key.name
        data["datasets"][0][:data] << Order.where(machine_id: key.id).count
      end
    end
    data
  end
end
