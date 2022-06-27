class ProductsController < ApplicationController
  before_action :set_product, only: [:new,:edit]
  def index
    @products = Product.all
  end

  def new

    
  end

  def create
    @product= Product.create(product_params)

    if @product.persisted?
      redirect_to products_path, notice: "Producto creado"
    else
      render :new, status: :unprocessable_entity, alert: "No se pudo crear el producto"
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :visible)
    
  end
  def set_product
    @product = Product.new
    
  end
end
