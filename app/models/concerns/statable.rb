module Concerns
  module Statable
    extend ActiveSupport::Concern

    def compute_stat_xp
      {
        body: deci_calc(body),
        mind: deci_calc(mind),
        resolve: linear_calc(resolve),
        infection: linear_calc(infection),
      }.values.reduce(0) { |a, b| a + b }
    end

    private

    def deci_calc(x)
      Array.new(6, x)
        .map.with_index { |x, i| x - 10 * i }
        .filter { |x| x > 0 }
        .map.with_index(1) do |x, i|
          i == 6 ? x * 10 : [x, 10].min * (2 * i - 1) 
        end.reduce(0) { |a, b| a + b }
    end

    def linear_calc(x)
      [0, x].max * 10
    end
  end
end