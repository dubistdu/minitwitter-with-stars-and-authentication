class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :text, limit: 140
      t.string :user_name

      t.timestamps
    end
  end
end
