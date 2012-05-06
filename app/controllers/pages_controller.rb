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
    @og_url="http://www.helpmedateyou.com"
    @og_description ="Share avice anonymously with guys and girls"
    @og_type ="website"
    @og_image ="http://i.imgur.com/Mij1Q.png"
    @og_site_name ="HelpMeDateYou.com | Share avice anonymously with guys and girls"
   
    @title = "Home"
    @microposts = Micropost.paginate(:page => params[:page], :per_page => 20)

   # @microposts = Micropost.order("created_at").page(params[:page]).per(6)
  end
  
  def flagthis
    micropost.flag += 1
    redirect_to(:back)
  end
  
  
end
