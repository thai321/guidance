class AddBiographyToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :biography, :text, default: ''
  end
end
