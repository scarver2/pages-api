class AddPublishedIndexToPage < ActiveRecord::Migration
  def change
    add_index :pages, :published_on
  end
end
