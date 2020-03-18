class AddHeroColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :hero, :string
  end
end
