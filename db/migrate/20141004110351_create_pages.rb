class CreatePages < ActiveRecord::Migration
  def change
    create_table :faalis_page_pages do |t|
      t.string :title
      t.string :layout, default: 'layouts/page'
      t.string :description
      t.string :tags
      t.string :permalink
      t.integer :user_id

      t.text :raw_content
      t.text :content

      t.boolean :members_only, default: false
      t.boolean :published, default: false

      t.timestamps
    end

    add_index :faalis_page_pages, :permalink
    site_aware :faalis_page_pages
  end
end
