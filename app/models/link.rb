class Category < ApplicationRecord

  validates :link, :name, :categorie_id, :id_channel, presence: true
  validates_format_of :link, :with => /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/i

  belong_to :category, dependent: :destroy

  scope :by_channel, ->(id_channel) {where(id_channel: id_channel) }
  scope :by_name, ->(name) { where('unaccent(name) ILIKE unaccent(?)', "%#{name}%") }
  scope :by_primary, ->(is_primary) {where(is_primary: is_primary) }
  scope :dates_between, lambda { |start_date, end_date|
    where('created_at >= ? AND created_at <= ?', start_date, end_date)
  }

end