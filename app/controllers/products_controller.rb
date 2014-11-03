class ProductsController < ApplicationController

 before_action :set_product, :except => [:index, :new, :create] 
def new
  @product = Product.new
end

def index
@products = Product.all

end


def create
 @product = Product.new(product_params)
if @product.save
    flash[:notice] = "product has successfully created"
  redirect_to products_path
else
    render "new"
end
end

def update
    @product = Product.find(params[:id])
  if @product.update_attributes(product_params)
  flash[:notice] = "product has been successfully updated"
  redirect_to product_path
else
  render "edit" 
end
end

def edit
  @product = Product.find(params[:id])
end

def show
@product = Product.find(params[:id])
end

def destroy
  
  if @product.destroy
  flash[:notice] = "product successfully deleted"
redirect_to products_path 
end
end

def set_product
  @product = Product.find(params[:id])
end
private

def product_params
  params.require(:product).permit!
end

end
