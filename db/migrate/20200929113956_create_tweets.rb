class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string     :name,               null: false, default: ""
      t.integer    :genre_id,           null: false
      t.text       :introduction,       null: false
      t.text       :place
      t.text       :other
      t.timestamps
    end
  end
end
