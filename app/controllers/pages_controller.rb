class PagesController < ApplicationController
  def _board
  end

  def _forum
  end

  def contact
    @title = "Contact"
  end

  def index
    @fb_app_id ="109989265800865"  
    @fb_admins ="500208454"
    @og_title ="HelpMeDateYou.com"
    @og_url="http://helpmedateyou.com"
    @og_description ="Share avice anonymously with guys and girls"
    @og_type ="website"
    @og_image ="http://i.imgur.com/Mij1Q.png"
    @og_site_name ="HelpMeDateYou.com | Share avice anonymously with guys and girls"
   
    @title = "Home"
    #@microposts = Micropost.paginate(:page => params[:page], :per_page => 20).order('comments_count DESC, created_at DESC')
    
    # searching 
    @microposts = Micropost.order("created_at DESC").search(params[:search], params[:page])
    # @microposts.filter(params[:filter]).paginate(:page => params[:page])
    # 
    #filtering the content0
 
    # @microposts = Micropost.order("created_at").page(params[:page]).per(6)

  end
  
  def popular
    @microposts = Micropost.search(params[:search], params[:page])
  
  end
  
end
