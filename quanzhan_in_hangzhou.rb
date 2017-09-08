require "Time"

class HangZhou

  def self.before_party_info
    address = "杭州市拱墅区海外海国际酒店"
    party_time_start_at = Time.at(1505473200)
    party_time_end_at = Time.at(1505480400)

    puts "地址: #{address}"
    puts "开始时间: #{party_time_start_at}"
    puts "结束时间: #{party_time_end_at}"

    return "quanzhan in hangzhou"
  end
end


puts HangZhou.before_party_info
