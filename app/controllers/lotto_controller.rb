class LottoController < ApplicationController
  def index
  end

  def show
    @lotto = [*1..45].sample(6).sort()
    
  end
  
  def api
  @lotto = [*1..45].sample(6)
  arr = []
  require 'httparty'
  require 'json'
      
  response = HTTParty.get("http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=")
  result = JSON.parse(response.body)
  
  @arr = Array.new
  
  for i in 0..6
      @arr << result["drwtNo#{i}"]
  end
  bounus = result["bnusNo"]
  
  # @matching = @arr & @lotto
    @matching = @arr & @lotto
  
  if @matching.count == 6
    @result = "1등(15억)"
  elsif @matching.count == 5 && @lotto.include?(bounus)
    @result = "2등(4천만원)"
  elsif @matching.count == 5
    @result = "3등"
    elsif @matching.count == 4
    @result = "4등(5만원)"
    elsif @matching.count == 3
    @result = "5등(5천원)"
    elsif @matching.count == 2
    @result = "6등(천원)"
    else
    @result = "꽝"  
  end
end

end

