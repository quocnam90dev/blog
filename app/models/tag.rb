class Tag < ApplicationRecord
  has_many :page_tags, dependent: :destroy
  has_many :pages, through: :page_tags

  validates :name, presence: true, uniqueness: true

  scope :ordered, -> { order(:name) }
end
