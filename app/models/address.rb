class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :purchase

  validates :postal_code, presence: true,
            format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: true
  validates :block, presence: true
  validates :phone_number, presence: true
            format: { with: /\A\d{10,11}\z/, message: 'is too short' }
  validates :phone_number, 
            format: { with: /\A[0-9]+\z/, message: 'is invalid. Input only number' }
end
