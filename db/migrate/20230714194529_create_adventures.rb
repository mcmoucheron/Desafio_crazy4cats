class CreateAdventures < ActiveRecord::Migration[7.0]
  def change
    create_table :adventures do |t|
      t.string :title
      t.string :description
      t.string :place
      t.datetime :when_went

      t.timestamps
    end
  end
end
