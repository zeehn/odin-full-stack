def stock_picker(prices)
    min_price = prices.first
    max_price = prices[1]
    profit = 0
    profits = {}
    
    2.upto(prices.length - 1) do |index|
        if min_price > max_price 
            min_price = max_price
            max_price = prices[index]
        else
            max_price = prices[index]
        end
        profit = max_price - min_price
        profits[profit] = [prices.find_index(min_price), index]
    end

    max_profit = 0
    profits.each do |key, value|
        max_profit = key if max_profit < key
    end
    profits[max_profit]
end

stock_prices = [17,3,6,9,15,8,6,1,10]
p stock_picker(stock_prices)