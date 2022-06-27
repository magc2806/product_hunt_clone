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
#
class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
end
