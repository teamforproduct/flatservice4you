class AddColumnsForFacebook < ActiveRecord::Migration
  def change
    add_column :users, :gender, :integer
    add_column :users, :location, :string
    add_column :providers, :link, :string
  end
end
