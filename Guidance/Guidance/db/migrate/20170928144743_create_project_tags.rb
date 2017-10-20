class CreateProjectTags < ActiveRecord::Migration[5.1]
  def change
    create_table :project_tags do |t|
      t.integer :project_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end

    add_index :project_tags, [:project_id, :tag_id], unique: true
  end
end
