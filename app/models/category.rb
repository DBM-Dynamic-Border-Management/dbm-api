class Category < ApplicationRecord

  validates :name, :id_channel, presence: true

  has_many :categories, dependent: :destroy

end
