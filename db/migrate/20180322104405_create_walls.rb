class CreateWalls < ActiveRecord::Migration[5.1]
  def change
    create_table :walls do |t|
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
