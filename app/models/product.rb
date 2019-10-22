class Product < ApplicationRecord
  validates(:title, presence: true, uniqueness: true, case_sensitive: false)
  validates(:price, numericality: { greater_than: 0 })
  validates(:description, presence: true, length: { minimum: 10 })
  before_validation :set_default_value_price
  before_save :capitalize_product_title

private
def set_default_value_price
    self.price ||=1
end

def capitalize_product_title
    self.title.capitalize!
    
end
end
