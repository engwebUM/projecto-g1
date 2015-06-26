class ReturnInvestment
  def data(plans)
    plans.each_with_object({}) do |plan, graph_data|
      graph_data[plan.name] = plan.return_of_investment.round(2)
    end
  end
end
