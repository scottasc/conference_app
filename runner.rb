require "http"

all_meetings_hash = HTTP.get("http://localhost:3000/api/all_meetings_url").parse
first_meeting_hash = HTTP.get("http://localhost:3000/api/first_meeting_url").parse

first_meeting = "#{first_meeting_hash["id"]}, title: #{first_meeting_hash["title"]}, agenda: #{first_meeting_hash["agenda"]}, time: #{first_meeting_hash["time"]}"

puts first_meeting

all_meetings_array = all_meetings_hash.to_a

all_meetings_array.each do |meeting|
  puts "#{meeting["id"]}: title: #{meeting["title"]}, agenda: #{meeting["agenda"]}, time: #{meeting["time"]}"
end

