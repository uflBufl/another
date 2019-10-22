class Message < ApplicationRecord
    has_many :picks, foreign_key: 'transmit_id', class_name: "Pick"
    has_many :picks, foreign_key: 'message_id', class_name: "Pick"
    has_one :game,foreign_key: 'first_page_id', class_name: "Game"

    validates :value, presence: true, length: { minimum: 2 },
                      uniqueness: false
    validates :comment,
              uniqueness: false, presence: false
end
