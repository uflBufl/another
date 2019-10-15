class Game < ApplicationRecord
  belongs_to :first_page, :class_name => "Message", optional: true

  validates :name, presence: true, length: { minimum: 1 }
  validates :image, length: { minimum: 1 }
  validates :image, length: { minimum: 1 }
end
