class Address < ActiveRecord::Base
  belongs_to :user

  validates :address, presence: true,
            length: { maximum: 50 },
            on: :create
  validates :alias, length: { maximum: 40 },
            on: :create
  validates :user_id, presence: true
end
