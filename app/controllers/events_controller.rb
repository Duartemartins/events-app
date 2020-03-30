class EventsController < ApplicationController
  
  def new
  	@event = Event.new
  end

  def create
  	# @event = Event.new(event_params)
  	@user = current_user
  	@event = @user.events.create(event_params)
  	if @event.save
      flash[:notice] = "Event created successfully!"
      redirect_to @user
   else
      flash.now.alert = "Oops, couldn't create Event. Please make sure you are using a valid description."
      render :new
   end
  end

  def show
  	@event = Event.find(params[:id])
  	@user = current_user
  end

  def index
  	@events = Event.all
    @upcoming_events = @events.upcoming_events  
    @prev_events = @events.prev_events
  end

private

  def event_params
  	params.require(:event).permit(:description, :date)
  end

end
