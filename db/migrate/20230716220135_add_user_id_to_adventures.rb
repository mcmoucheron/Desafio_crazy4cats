class AddUserIdToAdventures < ActiveRecord::Migration[7.0]
  def change
    add_reference :adventures, :user, foreign_key: true
    #null: false,
  end
end
