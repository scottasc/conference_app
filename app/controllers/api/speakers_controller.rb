class Api::SpeakersController < ApplicationController

  def index
    @speakers = Speaker.all
    render 'index.json.jbuilder'
  end

  def create
    @speaker = Speaker.new(
                          first_name: params[:first_name],
                          last_name: params[:last_name],
                          email: params[:email],
                          age: params[:age],
                          gender: params[:gender]
                          )
    @speaker.save
    render 'show.json.jbuilder'
  end

  def show
    @speaker = Speaker.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @speaker = Speaker.find(params[:id])
    @speaker.first_name = params[:first_name] || @speaker.first_name
    @speaker.last_name = params[:last_name] || @speaker.last_name
    @speaker.email = params[:email] || @speaker.email
    @speaker.age = params[:age] || @speaker.age
    @speaker.gender = params[:gender] || @speaker.gender
    render 'show.json.jbuilder'
  end

  def destroy
   @speaker = Speaker.find(params[:id])
   @speaker.destroy
   render json: {message: "You've made the speaker go away."}
  end

end
