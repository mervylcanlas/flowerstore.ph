class ProductsController < ApplicationController
    before_action :authenticate_user!

    def index
        @products = Product.all
    end

    def show
        @product = Product.find(params[:id])
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params.merge(status: 'Inactive'))

        if @product.save
            redirect_to products_path
        else
            render :new
        end
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:id])
    
        if @product.update(product_params)
            redirect_to products_path
        else
            render :edit
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
    
        redirect_to root_path
    end

    private

    def product_params
        params.require(:product).permit(:product_name, :product_description, :quantity, :price, :status)
    end

end
