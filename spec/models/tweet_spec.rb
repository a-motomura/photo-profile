require 'rails_helper'
describe Tweet do
  before do
    @tweet = FactoryBot.build(:tweet)
    @tweet.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '写真投稿機能' do
    context '写真投稿がうまくいくとき' do
      it 'すべての値が正しく入力されていれば登録できる' do
        expect(@tweet).to be_valid
      end

      it 'otherは空でも保存できること' do
        @tweet.other = nil
        expect(@tweet).to be_valid
      end
    end
  end

  describe '写真投稿機能' do
    context '写真投稿がうまくいかないとき' do
      it 'imageが空では登録できないこと' do
        @tweet.image = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では登録できないこと' do
        @tweet.name = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Name can't be blank")
      end

      it 'genreを選択していないと保存できないこと' do
        @tweet.genre_id = 0
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Genre can't be blank")
      end

      it 'introductionが空では登録できないこと' do
        @tweet.introduction = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Introduction can't be blank")
      end

      it 'priceが空では登録できないこと' do
        @tweet.place = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Place can't be blank")
      end
    end
  end
end