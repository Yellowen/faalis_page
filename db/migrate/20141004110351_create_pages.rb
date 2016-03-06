class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :layout, default: 'application'
      t.string :description
      t.string :tags
      t.string :permalink
      t.integer :user_id

      t.text :raw_content

      t.boolean :members_only, default: false
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
