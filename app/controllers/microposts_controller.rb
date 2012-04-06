class MicropostsController < ApplicationController
   # html basic authentification system for the admin session
    before_filter :authenticate , :except => [ :create, :new, :display]
    
  def index
    @microposts = Micropost.all
    @micropost = Micropost.new(:tag => '4')
  end

  def show
    @micropost = Micropost.find(params[:id])
  end
  
  def display
    @micropost = Micropost.find(params[:id])
  end
  
  def new
    @micropost = Micropost.new(:tag => '5' )
  end

  def create
    @micropost = Micropost.new(params[:micropost])
    
    @micropost.to_guys = params["commit"] == "to Guys"
    #    @micropost.to_guys = true
    #    flash[:notice] = "to Guys was clicked and the boolean is updated"
    # else
    #    @micropost.to_guys = false
    # end

    if @micropost.save
      redirect_to(:back)
      flash[:notice] = "Thanks! You have successfully posted this Micropost."
    else
      redirect_to(:back)
      flash[:notice] = "Something went wrong. You're Micropost wasn't created"
    end
  end

  def edit
    @micropost = Micropost.find(params[:id])
  end

  def update
    @micropost = Micropost.find(params[:id])

    if params['commit'] == "to Guys"
       @micropost.update_attribute(:to_guys, true)
       flash[:notice] = "to Guys was clicked and the boolean is updated"
    else
       @micropost.update_attribute(:to_guys, false)
    end

    if @micropost.update_attributes(params[:micropost])
      redirect_to @micropost, :notice  => "Successfully updated Micropost."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy
    redirect_to microposts_url, :notice => "Successfully destroyed Micropost."
  end
  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password == "open"
    end
  end
  


 end
