class Api::V1::ProductsController < Api::ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :find_product, only: [:show, :edit, :update, :destroy]

    def create
        product = Product.new product_params
        product.user = current_user
        if product.save
            render json: { id: product.id }
        else
            render(
                json: { errors: product.errors },
                status: 422 #Unprocessable Entity
            )
        end
    end

    def edit 
    end

    def update
        if @product.update product_params
            render json: { id: @product.id}
        else 
            reder :edit
        end
    end

    def index 
        products = Product.order(created_at: :desc)
        #this allows us to use the
        #QuestionCollectionSerializer to render json of
        #questions in this list in order to keep the data 
        #limited to the minimum we need.
        render json: products #, each_serializer:
        #QuestionCollectionSerializer  
    end

    def show 
        @product = Product.find params[:id]
        render(
            json: @product, 
            include: [ 'reviews.reviewer', tag_ids: [] ]
        )
    end

    def destroy
        @product.destroy
        render json: {status:200}, status: 200
    end

    private

    def find_product
        @product = Product.find params[:id]
    end

    def product_params
        params.require(:product).permit(:title, :description, :price, tag_ids: [])
    end 

end
