class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :synopsis
      t.text :description
      t.string :site_link
      t.string :source_link
      t.string :screenshot_link

      t.timestamps
    end
  end
end
