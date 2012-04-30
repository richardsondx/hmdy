class PagesController < ApplicationController
  def _board
  end

  def _forum
  end

  def contact
    @title = "Contact"
  end

  def index
    @title = "Home"
    @microposts = Micropost.paginate(:page => params[:page], :per_page => 20)

   # @microposts = Micropost.order("created_at").page(params[:page]).per(6)
  end
  
  def flagthis
    micropost.flag += 1
    redirect_to(:back)
  end
  
  
end
