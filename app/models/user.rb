class User < ApplicationRecord
  # gem bcrypt
  # 1. passwordを暗号化する
  # 2. password_digest => password
  # 3. password_confirmation => パスワードの一致確認
  # 4. 一致のバリデーション追加
  # 5. authenticate()
  # 6. 最大文字数 72文字まで
  # 7. User.create() => 入力必須バリデーション, User.update() => ×
  has_secure_password

  # validates
  validates :name, presence: true,
                   length: { maximum: 30, allow_blank: true }

  # 追加
  VALID_PASSWORD_REGEX = /\A[\w\-]+\z/
  validates :password, presence: true,
                       length: {
                        minimum: 8,
                        allow_blank: true
                      },
                       format: {
                        with: VALID_PASSWORD_REGEX,
                        message: invalid_password,
                        allow_blank: true
                       },
                       allow_nil: true
end
