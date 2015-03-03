class CreateRubies < ActiveRecord::Migration
  def change
    create_table :rubies do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
