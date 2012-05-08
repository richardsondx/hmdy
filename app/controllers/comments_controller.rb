class CommentsController < ApplicationController
  
  before_filter :initialize_micropost
  
  def index
    @comments = @micropost.comments.all
  end
  
  def new

    @comment = @micropost.comments.new
  end
  
  def create

   @comment = @micropost.comments.create!(params[:comment])
   
   
   if @comment.asguys = params["commit"] == "I'm a Guy"
      @comment.asguys = true
         flash[:notice] = "to Guys was clicked and the boolean is updated"
      else
         @comment.asguys = false
      end
   
   
   
     if @comment.save
        redirect_to :back, :notice => "Comment successfully posted."
      else
        redirect_to :back , :notice => "Something went wrong."
      end
    rescue ActiveRecord::RecordInvalid
     redirect_to :back , :notice =>"You're Comment was more than 140 characters"
    
  end
  
  def update
     if @comment.asguys = params["commit"] == "I'm a Guy"
        @comment.asguys = true
           flash[:notice] = "to Guys was clicked and the boolean is updated"
        else
           @comment.asguys = false
        end

    
    if @comment.update_attributes(params[:comment])
      redirect_to @comment, :notice  => "Successfully updated Comment."
    else
      render :action => 'edit'
    end
  end
  
  def edit
    @comment = @micropost.comments.find(params[:id])
  end
  
  def destroy
    @comment = @micropost.comments.find(params[:id])
    @comment.destroy
    redirect_to micropost_comments_url, :notice => "Successfully destroyed Comment."
  end
  
  def show
    @comment = @micropost.comments.find(params[:id])
  end
  
  private
  
  def initialize_micropost
    @micropost = Micropost.find(params[:micropost_id])
  end
  
 
end
