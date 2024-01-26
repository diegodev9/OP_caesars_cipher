def stock_picker(prices)
  return nil if prices.length < 2

  max_profit_info = prices.each_with_index.reduce({ max_profit: 0, best_days: nil }) do |max_profit_info, (buy_price, buy_day)|
    prices[buy_day+1..-1].each_with_index.reduce(max_profit_info) do |max_profit_info, (sell_price, sell_day)|
      profit = sell_price - buy_price

      if profit > max_profit_info[:max_profit]
        max_profit_info[:max_profit] = profit
        max_profit_info[:best_days] = [buy_day, buy_day + sell_day + 1]
      end

      max_profit_info
    end
  end

  max_profit_info[:best_days]
end

stock_picker([17,3,6,9,15,8,6,1,10])
stock_picker([17,11,6,4,5,8,9,12,10])
stock_picker([1,2,7,9,17,9,7,15,10])
