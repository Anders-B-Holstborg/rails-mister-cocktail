class AddNoteToCocktail < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :note, :text
  end
end
