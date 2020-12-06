class ToppagesController < ApplicationController
  MAX_DISPLAY_RELATED_PRODUCTS=3
  
  def index
    @posts =Post.where('created_at > ?', 1.day.ago).order("RAND()").limit(3)
  end
end
