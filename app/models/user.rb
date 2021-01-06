class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email,               uniqueness: { case_sensitive: true }
  validates :password,            format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  with_options presence: true do
    validates :nickname
    validates :birth
    with_options format: { with: /\A[ァ-ヶ]+\z/ } do
      validates :last_name_kana
      validates :first_name_kana
      with_options format: { with: /\A[ぁ-ん一-龥々]+\z/ } do
        validates :last_name
        validates :first_name
      end
    end
  end

end