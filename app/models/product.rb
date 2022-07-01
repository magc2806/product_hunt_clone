# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string           default("")
#  description :string
#  visible     :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string
#
class Product < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: :slugged

  
  has_many :product_categories
  has_many :categories, through: :product_categories

  has_one_attached :image, :dependent => :destroy

  validates :name, presence: true
  validates :description, presence: true

  self.per_page = 30
  scope :visibles, ->{where(visible: true).order(created_at: :desc)}
  scope :search_by_name, ->(name=''){visibles.where("name LIKE ?",  "%#{name}%")}



end
