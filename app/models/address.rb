class Address < ActiveRecord::Base
  belongs_to :user

  validates :address, allow_blank: false,
            length: { maximum: 50 },
            presence: true,
            on: [:create, :update]
  validates :alias, allow_blank: false,
            length: { maximum: 40 },
            presence: true,
            on: [:create, :update]
  validates :user_id, presence: true
end
