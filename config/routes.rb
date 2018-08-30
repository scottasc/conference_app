Rails.application.routes.draw do
  namespace :api do
    get "/one_speaker_url" => 'speakers#one_speaker_action'
    get "/first_meeting_url" => 'meetings#first_meeting_action'
    get "/two_meetings_url" => 'meetings#two_meetings_action'
    get "/all_meetings_url" => 'meetings#all_meetings_action'
  end
end
