class Api::MeetingsController < ApplicationController

  def index
    @meetings = Meeting.all
    sort_attribute = params[:sort]
    sort_order = params[:sort_order]
    search_term = params[:search]

    if search_term
      @meetings = @meetings.where('title iLIKE ? OR agenda iLIKE ?', "%#{search_term}%", "%#{search_term}%")
    end

    if sort_attribute && sort_order
      @meetings = @meetings.order(sort_attribute => sort_order)
    elsif sort_attribute
      @meetings = @meetings.order(sort_attribute)
    end

    render 'index.json.jbuilder'
  end

  def create
    @meeting = Meeting.new(
                          title: params[:title],
                          agenda: params[:agenda],
                          time: params[:time],
                          location: params[:location],
                          speaker_id: params[:speaker_id]
                          )

    if @meeting.save
      render 'show.json.jbuilder'
    elsif 
      render json: {errors: @meeting.errors.full_messages}, status: :unprocessable_entity
    end

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
    @meeting.speaker_id = params[:speaker_id] || @meeting.speaker_id
    
    if @meeting.save
      render 'show.json.jbuilder'
    elsif 
      render json: {errors: @meeting.errors.full_messages}, status: :unprocessable_entity
    end

  end

  def destroy
   @meeting = Meeting.find(params[:id])
   @meeting.destroy
   render json: {message: "You've canceled the meeting."}
  end

end
