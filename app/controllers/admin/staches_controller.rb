module Admin
  class StachesController < Admin::BaseController
    def new
      @stache = Stache.new
    end

    def create
      categories = params[:stache][:categories]
      @stache = Stache.new(stache_params)
      @stache_creation = StacheCreation.new(@stache, categories)
      if @stache_creation.create
        flash[:notice] = "#{@stache.name} created!"
        redirect_to @stache
      else
        render :new
      end
    end

    def index
      @staches = Stache.all.includes(:categories)
    end

    private

    def stache_params
      params.require(:stache).permit(:name, :description, :price, :image_url,
                                     :categories)
    end
  end
end
