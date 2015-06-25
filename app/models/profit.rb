class Profit
  def data(plans)
    plans.each_with_object({}) do |plan, graph_data|
      graph_data[plan.name] = plan.profit.round(2)
    end
  end
end
