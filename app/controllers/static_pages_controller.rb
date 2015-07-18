class StaticPagesController < ApplicationController

  def home
    #@user = current_user.find(params[:id])
    @micropost = current_user.microposts.build if logged_in?
  end
end
