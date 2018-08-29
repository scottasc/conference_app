Rails.application.routes.draw do
  namespace :api do
    get "/one_speaker_url" => 'speakers#one_speaker_action'
  end
end
