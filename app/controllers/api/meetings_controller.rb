class Api::MeetingsController < ApplicationController

  def index
    @meetings = Meeting.all
    render 'index.json.jbuilder'
  end

  def create
    @meeting = Meeting.new(
                          title: params[:title],
                          agenda: params[:agenda],
                          time: params[:time],
                          location: params[:location],
                          remote: params[:remote]
                          )
    @meeting.save
    render 'show.json.jbuilder'
  end

  def show
    @meeting = Meeting.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @meeting = Meeting.find(params[:id])
    @meeting.title = params[:title] || @meeting.title
    @meeting.agenda = params[:agenda] || @meeting.agenda
    @meeting.time = params[:time] || @meeting.time
    @meeting.location = params[:location] || @meeting.location
    @meeting.remote = params[:remote] || @meeting.remote
    render 'show.json.jbuilder'
  end

  def destroy
   @meeting = Meeting.find(params[:id])
   @meeting.destroy
   render json: {message: "You've canceled the meeting."}
  end

end
