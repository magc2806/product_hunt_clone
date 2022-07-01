class ProductsController < ApplicationController
  before_action :set_product, only: [:new]
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  def index
    @products = Product.paginates params[:page]
  end

  def show
    
  end

  def new

    
  end

  def create
    @product= Product.create(product_params)

    if @product.persisted?
      redirect_to product_path(@product), notice: "Producto creado"
    else
      render :new, status: :unprocessable_entity, alert: "No se pudo crear el producto"
    end
  end

  def edit
    
    
  end

  def update
    if @product.update product_params
      redirect_to product_path(@product), notice: "El producto se actualizó"
    else
      render :edit, status: :unprocessable_entity, alert: "No se pudo actualizar el producto"
    end
  end

  def destroy
    if @product.destroy
      redirect_to products_path, status: :see_other, notice: "Producto eliminado" 
    else
      redirect_to product_path(@product),status: :unprocessable_entity, alert: "No se pudo eliminar el producto"
    end

  end

  def search
    @name = params[:search_name]
    @products = Product.search_by_name(@name, params[:page])
    
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :visible, :image)
    
  end
  def set_product
    @product = Product.new
    
  end

  def find_product
    @product = Product.friendly.find(params[:id])
    
  end
end
