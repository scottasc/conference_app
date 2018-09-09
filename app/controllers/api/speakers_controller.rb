class Api::SpeakersController < ApplicationController

  def index
    @speakers = Speaker.order('age asc')
    sort_attribute = params[:sort]
    sort_order = params[:sort_order]
    search_term = params[:search]

    if search_term
      @speakers = @speakers.where("first_name iLIKE ? OR last_name iLIKE ?", "%#{search_term}%", "%#{search_term}%")
    end

    if sort_attribute && sort_order
      @speakers = @speakers.order(sort_attribute => sort_order)
    elsif sort_attribute
      @speakers = @speakers.order(sort_attribute)
    end

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
    
    if @speaker.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @speaker.errors.full_messages}, status: :unprocessable_entity
    end
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

    if @speaker.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @speaker.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
   @speaker = Speaker.find(params[:id])
   @speaker.destroy
   render json: {message: "You've made the speaker go away."}
  end

end
