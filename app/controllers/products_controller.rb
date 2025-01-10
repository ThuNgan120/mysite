class ProductsController < ApplicationController
  # Uncomment dòng sau nếu muốn cho phép truy cập không cần xác thực vào index và show
  # allow_unauthenticated_access only: %i[index show]

  before_action :set_product, only: %i[show edit update destroy]

  # GET /products
  def index
    @products = Product.all
  end

  # GET /products/:id
  def show
    # @product đã được set bởi before_action :set_product
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # POST /products
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: "Product was successfully created."
    else
      flash.now[:alert] = "Failed to create product. Please check the input."
      render :new, status: :unprocessable_entity
    end
  end

  # GET /products/:id/edit
  def edit
    # @product đã được set bởi before_action :set_product
  end

  # PATCH/PUT /products/:id
  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Product updated successfully."
    else
      flash.now[:alert] = "Failed to update product. Please check the input."
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /products/:id
  def destroy
    if @product.destroy
      redirect_to products_path, notice: "Product deleted successfully."
    else
      redirect_to products_path, alert: "Failed to delete product."
    end
  end





  
  private

  # Callback để set sản phẩm cho các action show, edit, update, destroy
  def set_product
    @product = Product.find(params[:id])
  end
  def product_params
      params.require(:product).permit(:name, :description, :featured_image, :inventory_count)
  end
end