class StachesController < ApplicationController
  helper :headshot

  def index
    @staches = Stache.all
  end

  def show
    @stache = Stache.find(params[:id])
  end

  def stached
    byebug
    @stache = Stache.find(params[:stache_id])
    if current_user.headshot_photos.empty?
      redirect_to @stache
    else
    @photo = current_user.headshot_photos.last
    end
  end
end
