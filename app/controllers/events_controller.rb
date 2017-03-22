class EventsController < ApplicationController
  def index
    @in_state_events = Event.where(state: session[:state])
    @out_state_events = Event.where.not(state: session[:state])
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
    @state = ["IL", "MN", "CA", "NY", "PA", "FL"]
  end

  def create
    event = Event.create(name: params[:name], date: params[:date], city: params[:city], state: params[:state], user: User.find(session[:id]))
    if event.valid?
      redirect_to '/', alert: "Event has been created"
    else
      flash[:errors] = event.errors.full_messages
      redirect_to '/'
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to '/'
  end

  def update
    event = Event.find(params[:id])
    puts params[:date]
    event.name = params[:name]
    event.date = params[:date]
    event.city = params[:city]
    event.state = params[:state]
    event.save
    redirect_to '/'

  end

  def join
    join = Attendee.create(event: Event.find(params[:event_id]), user: User.find(params[:user_id]))
    if join.valid?
      redirect_to '/', alert: "You are attending the event"
    else
      flash[:errors] = join.errors.full_messages
      redirect_to '/'
    end
  end

  def leave
    leave = Attendee.where(event: Event.find(params[:event_id]), user: User.find(params[:user_id]))
    leave.each do |remove|
      puts remove.id
      remove.destroy
    end
    redirect_to '/'
  end
end
