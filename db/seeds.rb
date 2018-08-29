require 'ffaker'

10.times do
  speaker = Speaker.new(first_name: FFaker::Name.first_name, last_name: FFaker::Name.last_name, email: FFaker::Internet.email)
  speaker.save
end


