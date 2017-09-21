class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :video_url, null: false
      t.boolean :published, null: false, default: false
      t.integer :author_id, null: false

      t.timestamps
    end

    add_index :projects, :title
    add_index :projects, :author_id
  end
end
