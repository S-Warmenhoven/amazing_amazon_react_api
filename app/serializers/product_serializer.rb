class ProductSerializer < ActiveModel::Serializer

# Active Model Serializer Docs:
  # https://github.com/rails-api/active_model_serializers/blob/v0.10.6/docs/README.md

  # Use the `attributes` method to specify which 
  # methods of a model to include in the serialization output.
  # All columns of a model have a corresponding attr_reader (getter) method, so we can filter this way as well. 
  attributes :id, :title, :description, :price, :created_at, :updated_at, :seller, :tags, :taggings

  # To include associated models, use the same named methods
  # for creating associations. You can rename the association 
  # with the argument `key:`, which is only going to show in
  # the rendered json (won't effect the name of the 
  # association anywhere else).
  belongs_to :user, key: :seller

  def seller
    UserSerializer.new object.user
  end
  
  #You can create methods inside the aerializer to include
  #custom data in th json serialization. When doing
  #so make sure to include the name of the method in the
  #'attributes' call
  
  has_many :reviews
  #To customize a serializer for associated models you can 
  #define define a serializer within the current serializer like this:
  class ReviewSerializer < ActiveModel::Serializer
    attributes :id, :body, :rating, :created_at, :updated_at
    belongs_to :user, key: :reviewer
  end

end


