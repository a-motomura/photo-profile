require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー管理機能' do
    context '新規登録がうまくいくとき' do

      it 'すべての値が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordが６文字以上であれば登録できること' do
        @user.password = '1234Aa'
        @user.password_confirmation = '1234Aa'
        expect(@user).to be_valid
      end
    end
  end

  describe 'ユーザー管理機能' do
    context '新規登録がうまくいかないとき' do

      it 'nicknameが空では登録できないこと' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'emailが空では登録できないこと' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it 'emailに@が含まれない場合は登録できないこと' do
        @user.email = 'kkkgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end

      it 'passwordが空では登録できないこと' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードは半角英数字で入力してください", "パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'passwordが５文字以下であれば登録できないこと' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください", "パスワードは半角英数字で入力してください")
      end

      it 'passwordが英字のみであれば登録できないこと' do
        @user.password = 'TTTttt'
        @user.password_confirmation = 'TTTttt'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数字で入力してください")
      end

      it 'passwordが数字のみであれば登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数字で入力してください")
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
    end
  end
end
