class PropertiesController < ApplicationController
 before_action :set_property, :except => [:index, :new, :create] 
def new
  @property = Property.new
end

def index
@properties = Property.all

end


def create
@property = Property.new(property_params)
if  @property.save
    flash[:notice] = "property has successfully created"
  redirect_to properties_path
else
    render "new"
end
end

def update
    @property = Property.find(params[:id])
  if  @property.update_attributes(property_params)
  flash[:notice] = "property has been successfully updated"
  redirect_to properties_path
else
  render "edit" 
end
end

def edit
 @property = Property.find(params[:id])
end

def show
@property = Property.find(params[:id])
end

def destroy
  
  if  @property.destroy
  flash[:notice] = "property successfully deleted"
redirect_to properties_path 
end
end

def set_property
 @property = Property.find(params[:id])
end
private

def property_params
  params.require(:property).permit!
end

end
