require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build (:user)
  end
  context 'ユーザー新規登録ができるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
     # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがある
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'ニックネーム', with: @user.nickname
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      fill_in 'パスワード(確認用)', with: @user.password_confirmation
      # 新規登録ボタンを押すとユーザーモデルのカウントが１上がる
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      # トップページへ遷移する
      expect(current_path).to eq root_path
      # トップページにログアウトボタンが表示される
      expect(page).to have_content('ログアウト')
      # 新規登録ページへ遷移するボタンやログインページへ遷移するボタンが表示されていない
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end
  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがある
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'ニックネーム', with: ""
      fill_in 'メールアドレス', with: ""
      fill_in 'パスワード', with: ""
      fill_in 'パスワード(確認用)', with: ""
      # サインアップボタンを押してもユーザーモデルのカウントは上がらない
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      # 新規登録ページへ戻される
      expect(current_path).to eq "/users"
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインできるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがある
      expect(page).to have_content('ログイン')
      # ログインページへ遷移する
      visit new_user_session_path
      # 正しいユーザー情報を入力する
      fill_in'メールアドレス', with: @user.email
      fill_in'パスワード',with: @user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      #トップページへ遷移する
      expect(current_path).to eq root_path
      # トップページにログアウトボタンが表示される
      expect(page).to have_content('ログアウト')
      # 新規登録ページへ遷移するボタンやログインページへ遷移するボタンが表示されていない
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end
  context 'ログインができないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがある
      expect(page).to have_content('ログイン')
      # ログインページへ遷移する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in 'メールアドレス', with: ""
      fill_in 'パスワード', with: ""
      # ログインボタンを押す
      find('input[name="commit"]').click
      # ログインページへ戻される
      expect(current_path).to eq new_user_session_path
    end
  end
end