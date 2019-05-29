class BudgetBuildsController < ApplicationController
  def index
    @stuffed_animal = StuffedAnimal.best_profit
    if params[:budget]
      @budget = params[:budget].to_i * 100
      if(@budget && @stuffed_animal.sale_price > @budget)
        @budget_low = true
      else
        build = @stuffed_animal.accessories_on_a_budget(@budget - @stuffed_animal.sale_price)
        @cost = @stuffed_animal.cost
        @revenue = @stuffed_animal.sale_price
        build.each do |accessory|
          @cost += accessory.cost
          @revenue += accessory.sale_price
        end
      end
    end
  end
end
