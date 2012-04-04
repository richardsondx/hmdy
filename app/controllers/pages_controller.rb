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
    @microposts = Micropost.order("created_at").page(params[:page]).per(6)
    
  end
end
