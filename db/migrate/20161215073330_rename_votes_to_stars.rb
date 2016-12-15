class RenameVotesToStars < ActiveRecord::Migration[5.0]
  def change
    rename_table :votes, :stars
  end
end
