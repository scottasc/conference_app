require 'ffaker'

10.times do
  speaker = Speaker.new(first_name: FFaker::Name.first_name, last_name: FFaker::Name.last_name, email: FFaker::Internet.email)
  speaker.save
end

meeting = Meeting.new(title: "meating", agenda: "in this meeting we will be quiet with each other", time: "3")
meeting.save


