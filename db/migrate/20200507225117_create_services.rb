class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :title
      t.string :subtitle
      t.text :section1
      t.string :section1Image
      t.text :section2
      t.string :section2Image
      t.text :section3
      t.string :section3Image
      t.text :tags

      t.timestamps
    end
  end
end
