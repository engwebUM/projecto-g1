class ReturnInvestment
  def data(plans)
    plans.each_with_object({}) do |plan, graph_data|
      graph_data[plan.name] = plan.return_of_investment.round(2)
    end
  end
end

class ExtraPay
  def data(plans)
    plans.each_with_object({}) do |plan, graph_data|
      graph_data[plan.name] = plan.extra_pay_total.round(2)
    end
  end
end

class Profit
  def data(plans)
    plans.each_with_object({}) do |plan, graph_data|
      graph_data[plan.name] = plan.profit.round(2)
    end
  end
end

class Graphic
  GRAPHS = {
    roi: ReturnInvestment,
    extra_pay: ExtraPay,
    profit: Profit
  }
  private_constant :GRAPHS

  def initialize(plans)
    @plans = plans
  end

  def data_for(graph_identifier = :roi)
    GRAPHS[graph_identifier].new.data(@plans)
  end
end