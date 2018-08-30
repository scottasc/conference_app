class Api::MeetingsController < ApplicationController

  def first_meeting_action
    @meeting = Meeting.first
    render 'first_meeting_view.json.jbuilder'
  end

  def two_meetings_action
    @two_meetings = Meeting.take(2)
    render 'two_meetings_view.json.jbuilder'
  end

  def all_meetings_action
    @meetings = Meeting.all
    render 'all_meetings_view.json.jbuilder'
  end

end
