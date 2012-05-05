class MicropostsController < ApplicationController
   # html basic authentification system for the admin session
   before_filter :authenticate , :except => [ :create, :new, :display,
     :like, :unlike,:dislike, :undislike, :ignore, :unignore, :stach, :unstach]
    
  def index
    # last = params[:last].blank? ? Time.now + 1.second : 
    #    Time.parse(params[:last])
    #    @microposts = Micropost.feed(last)
    @microposts = Micropost.order("name").page(params[:page]).per_page(1)
    @all_microposts = Micropost.all
    @micropost = Micropost.new
  end

  def show
    @micropost = Micropost.find(params[:id])
  end
  
  def display
    @micropost = Micropost.find(params[:id])
    
    @fb_admins ="500208454"
    @og_title ="HelpMeDateYou.com"
    @og_url="http://www.helpmedateyou.com/" + "#{@micropost.id}"
    @og_description ="#{@micropost.to_guys ? "one girl is saying: " : "one guy is saying: "}#{ @micropost.content}"
    @og_type ="website"
    @og_image ="http://i.imgur.com/Mij1Q.png"
    @og_site_name ="HelpMeDateYou.com | Share avice anonymously with guys and girls"


    
    
    
  end
  
  def new
    @micropost = Micropost.new(:tag => '5' )
  end

  def create
    @micropost = Micropost.new(params[:micropost])
    
    if @micropost.to_guys = params["commit"] == "to Guys"
       @micropost.to_guys = true
          flash[:notice] = "to Guys was clicked and the boolean is updated"
       else
          @micropost.to_guys = false
       end
 
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
  
  
  
  def like
    @micropost = Micropost.find params[:id]

      if current_user.like @micropost
        @liked = @micropost.liked_by.length 
        redirect_to :back
      else
        redirect_to :back
      end
  end

  # DELETE /beers/:id/like.json
  # DELETE /beers/:id/like.xml
  def unlike
    @micropost = Micropost.find params[:id]

      if current_user.unlike @micropost
        
        redirect_to :back
      else
        redirect_to :back
      end
    
  end

  # POST /beers/:id/dislike.json
  # POST /beers/:id/dislike.xml
  def dislike
    @micropost = Micropost.find params[:id]

      if current_user.dislike @micropost
          redirect_to :back
        else
          redirect_to :back
      end

  end

  # DELETE /beers/:id/dislike.json
  # DELETE /beers/:id/dislike.xml
  def undislike
    @micropost = Micropost.find params[:id]


      if current_user.undislike @micropost
          redirect_to :back
        else
          redirect_to :back
      end

  end
  
    def ignore
      @micropost = Micropost.find params[:id]

        if current_user.ignore @micropost
            redirect_to :back
          else
            redirect_to :back
        end
    end

    # DELETE /beers/:id/ignore.json
    # DELETE /beers/:id/ignore.xml
    def unignore
      @micropost = Micropost.find params[:id]

        if current_user.unignore @micropost
            redirect_to :back
          else
            redirect_to :back
        end

    end

    # POST /beers/:id/stash.json
    # POST /beers/:id/stash.xml
    def stash
      @micropost = Micropost.find params[:id]


        if current_user.stash @micropost
            redirect_to :back
          else
            redirect_to :back
        end

    end

    # DELETE /beers/:id/stash.json
    # DELETE /beers/:id/stash.xml
    def unstash
      @micropost = Micropost.find params[:id]


        if current_user.unstash @micropost
            redirect_to :back
          else
            redirect_to :back
        end

    end
  
  
  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password == "open"
    end
  end
  


 end
