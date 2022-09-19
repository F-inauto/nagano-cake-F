class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.string :image_id
      t.text :introduction
      t.integer :price
      #enum用のboolean型のis_mactiveカラムを追加
      t.boolean :is_active, null: false, default: true
      t.timestamps

    end
  end
end
