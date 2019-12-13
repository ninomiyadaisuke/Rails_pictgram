class User < ApplicationRecord
  
  #名前の長さに制限を追加する
  validates :name, presence: true, length: {maximum: 15}
  #メールアドレスの正規表現を追加してください
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  #パスワードの文字数制限を追加する 8〜32文字
  #パスワードをアルファベット、数字の混合のみ可能にしてください
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]{8,32}+\z/ }
  has_secure_password
  
  
end
