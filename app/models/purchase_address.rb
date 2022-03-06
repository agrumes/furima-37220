# Formオブジェクトにはアソシエーションを定義することはできない

class PurchaseAddress
  #そのクラスのインスタンスはActiveRecordを継承したクラスのインスタンスと同様に、form_with や render などのヘルパーメソッドの引数として扱え、バリデーションの機能を使用できるようになる
  include ActiveModel::Model
  #保存したいカラムを属性値として扱えるようにする
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :block, :building, :phone_number, :token

  # with_optionsは複数のバリデーションをグループ化し、共通の制限をかけるためのメソッド
  with_options presence: true do
  # addressモデルのバリデーション
  validates :token
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city
  validates :block
  validates :phone_number, length: { minimum: 10, message: 'is too short'} 
  # purchaseモデルのバリデーション
  validates :user_id
  validates :item_id
  end

  validates :phone_number, length: { maximum: 11, message: 'is too long'} 
  validates :phone_number, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input only number' }

  def save
    # 購入情報を保存し、変数purchaseに代入する
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    # 送付先を保存する。
    # purchase_idには、変数purchaseのidと指定する
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end

end
