class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.boolean :upvote
      t.integer :user_id
      t.references :tweet, foreign_key: true  # foreign_key -> db relationship. This migration is related to tweet

      t.timestamps
    end
  end
end
