class EventsController < ApplicationController
 
 before_action :set_event, :except => [:index, :new, :create] 
def new
  @event = Event.new
end

def index
@events = Event.all

end


def create
@event = Event.new(event_params)
if @event.save
    flash[:notice] = "event has successfully created"
  redirect_to events_path
else
    render "new"
end
end

def update
    @event = Event.find(params[:id])
  if @event.update_attributes(event_params)
  flash[:notice] = "event has been successfully updated"
  redirect_to events_path
else
  render "edit" 
end
end

def edit
@event = Event.find(params[:id])
end

def show
@event = Event.find(params[:id])
end

def destroy
  
  if @event.destroy
  flash[:notice] = "event successfully deleted"
redirect_to events_path 
end
end

def set_event
  @event = Event.find(params[:id])
end
private

def event_params
  params.require(:event).permit!
end

end
