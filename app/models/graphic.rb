class Graphic

  def initialize(plans)
    @plans = plans
  end

  def return_of_investiment
    @return_of_investiment = {}
    @plans.each do |plan|
      @return_of_investiment[plan.name] = (plan.return_of_investiment).round(2)
    end
    @return_of_investiment
  end

  def return_extra_pay_total
    @return_extra_pay_total = {}
    @plans.each do |plan|
      @return_extra_pay_total[plan.name] = (plan.extra_pay_total).round(2)
    end
    @return_extra_pay_total
  end

  def return_profit
    @return_profit = {}
    @plans.each do |plan|
      @return_profit[plan.name] = (plan.profit).round(2)
    end
    @return_profit
  end

end