class CommentsController < ApplicationController
  def index
    @micropost = Micropost.find(params[:id])
    @comments = @micropost.comments.all
  end
  
  def new
    @micropost = Micropost.find(params[:id])
    @comment = @micropost.comments.new
  end
  
  def create
   @micropost = Micropost.find(params[:id])
   @comment = @micropost.comments.create!(params[:comment])
   
     if @comment.save
        redirect_to(comments_path)
        flash[:notice] = "Thanks! You have successfully posted this Comment."
      else
        redirect_to(:back)
        flash[:notice] = "Something went wrong. You're Comment wasn't created"
      end
  end
  
  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to @comment, :notice  => "Successfully updated Comment."
    else
      render :action => 'edit'
    end
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_url, :notice => "Successfully destroyed Comment."
  end
  
  def show
    @comment = Comment.find(params[:id])
  end
end
