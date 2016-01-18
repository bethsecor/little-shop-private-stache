module Admin
  class CategoriesController < Admin::BaseController
    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        flash[:notice] = "New category #{@category.title} created"
        redirect_to admin_dashboard_path
      else
        render :new
      end
    end

    private

    def category_params
      params.require(:category).permit(:title)
    end
  end
end