class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_day

  belongs_to :user
  has_one_attached :item_image

  validates :item_image, presence: true
  validates :item_name, presence: true, length: {maximum: 40 }
  validates :item_explanation, presence: true, length: {maximum: 1000 }
  validates :category_id, numericality: { other_than: 1 ,message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 ,message: "can't be blank"}
  validates :delivery_charge_id, numericality: { other_than: 1 ,message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 ,message: "can't be blank"}
  validates :delivery_day_id, numericality: { other_than: 1 ,message: "can't be blank"}
  validates :price, presence: true, numericality:{ only_integer: true ,message: "is invalid. Input half-width characters"}
  validates :price, numericality:{ greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
end