class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :product

  # Each tag can only be applied to a question once
  validates :tag_id, uniqueness: { scope: :product_id }

end
