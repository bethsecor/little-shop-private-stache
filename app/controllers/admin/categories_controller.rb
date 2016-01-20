module Admin
  class CategoriesController < Admin::BaseController
    def index
      @categories = Category.all
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)
      @categories = Category.all
      if @category.save
        flash[:notice] = "New category #{@category.title} created"
        redirect_to admin_categories_path
      else
        render "index"
      end
    end

    def edit
      @categories = Category.all
      @category = Category.find(params[:id])
    end

    def update
      @category = Category.find(params[:id])
      if @category.update(category_params)
        flash[:notice] = "#{@category.title} updated"
        redirect_to admin_categories_path
      else
        render "edit"
      end
    end

    def destroy
      @category = Category.find(params[:id]).destroy
      flash[:notice] = "#{@category.title} removed"
      redirect_to admin_categories_path
    end

    private

    def category_params
      params.require(:category).permit(:title)
    end
  end
end
