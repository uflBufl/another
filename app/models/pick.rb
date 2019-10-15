class Pick < ApplicationRecord
  belongs_to :message, :class_name => "Message", optional: true
  belongs_to :transmit, :class_name => "Message", optional: true

  validates :context, presence: true, length: { minimum: 1 }
end
