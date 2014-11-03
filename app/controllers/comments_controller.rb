class CommentsController < ApplicationController
  before_action :set_comment, :except => [:index,:new,:create]
  def index
    # @comments = Comment.all
    @commentable = find_commentable
    @comments = @commentable.comments
  end

  def new 
    @comment = Comment.new
    #   if
    #     @commentable.comments.blank?
    #   @commentable.comments.build
    # end
  end
 
  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(comment_params)
    if @comment.save
      flash[:notice] = "Successfully created comment."
      redirect_to :id => nil
    else
      render :action => 'new'
    end
  end





  def show

  end

  def edit
  
  end

  def update
  
     
    if @comment.update_attributes(comment_params)
      redirect_to comments_path
    else
      render "edit"
    end
  end

  def destroy
    if @comment.destroy
      redirect_to comments_path
    end
  end






  def set_comment
    @comment =Comment.find(params[:id]) 
  end


  private

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end





  def comment_params
    params.require(:comment).permit!
  end

end
