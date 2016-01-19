module Admin
  class StachesController < Admin::BaseController
    def new
      @stache = Stache.new
    end

    def create
      categories = params[:stache][:categories]
      retired_status = params[:stache][:retired]
      @stache = Stache.new(stache_params)
      @stache_creation = StacheCreation.new(@stache, categories, retired_status)
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

    def edit
      @stache = Stache.find(params[:id])
    end

    def update
      @stache = Stache.find(params[:id])
      if @stache.update(stache_params)
        flash[:notice] = "#{@stache.name} updated"
        redirect_to admin_staches_path
      else
        render "edit"
      end
    end


    def retire
      Stache.update(params[:stache_id], retired: true)
      redirect_to admin_staches_path
    end

    private

    def stache_params
      params.require(:stache).permit(:name, :description, :price, :image_url,
                                     :categories, :retired)
    end
  end
end
