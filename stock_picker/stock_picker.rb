def stock_picker(prices)
    max_profit = 0
    buy_sell = [0,0]

    prices.each_with_index do | price, day |
        prices[day + 1 .. -1].each do |sell|
            profit = sell - price
            if profit > max_profit
                max_profit = profit
                buy_sell[0] = day
                buy_sell[1] = prices.index(sell)
            end 
        end
        prices[day] = 0
    end
    p buy_sell
end



stock_picker([15,3,6,9,15,8,6,1,10])