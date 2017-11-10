  
  require 'httparty'
  require 'json'
      
  lotto = [*1..45].sample(6)
  arr = []
  # 6개 맞으면 1등
  # 5개 맞으면 2등
  # 4개 맞으면 3등
  # 3개 맞으면 4등
  # 2개 맞으면 5등
  # 1개 맞으면 6등
  response = HTTParty.get("http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=")
  result = JSON.parse(response.body)
  
  arr = Array.new
  
  for i in 0..6
      arr << result["drwtNo#{i}"]
  end
  
  
arr.each do |nl|
count +=1 if lotto.include? nl
end
  
  case count
  when 6
  puts '1등'
  when 5
  puts '2등'
  when 4
  puts '3등'
  when 3
  puts '4등'
  when 2
  puts '5등'
  when 1
  puts '6등'
  else
  puts "꽝입니다."
  end
  