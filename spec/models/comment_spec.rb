require 'rails_helper'
describe Tweet do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント機能' do
    context 'コメントがうまくいくとき' do
      it 'すべての値が正しく入力されていれば登録できる' do
        expect(@comment).to be_valid
      end
    end
  end

  describe 'コメント機能' do
    context 'コメントがうまくいかないとき' do
      it 'コメントが空の場合は登録出来ない' do
        @comment.text = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Textを入力してください")
      end
    end
  end
end
