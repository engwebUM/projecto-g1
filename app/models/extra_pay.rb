class ExtraPay
  def data(plans)
    plans.each_with_object({}) do |plan, graph_data|
      graph_data[plan.name] = plan.extra_pay_total.round(2)
    end
  end
end
