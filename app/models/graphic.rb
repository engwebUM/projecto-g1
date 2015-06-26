require 'extra_pay'
require 'profit'
require 'return_investment'

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
