class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.text :before
      t.text :aftere

      t.timestamps null: false
    end
  end
end
