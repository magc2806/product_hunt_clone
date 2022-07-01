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

  validates :name, presence: true
  validates :description, presence: true

  has_one_attached :image, :dependent => :destroy

  self.per_page = 30
  scope :visibles, ->{where(visible: true)}
  scope :paginates, ->(page=1){order(created_at: :desc).distinct.paginate(page: page)}
  scope :search_by_name, ->(name='', page=1){visibles.where("name LIKE ?",  "%#{name}%").paginates(page)}



end
