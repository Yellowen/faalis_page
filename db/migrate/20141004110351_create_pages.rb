class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :layout
      t.string :description
      t.string :tags
      t.string :permalink
      t.boolean :publish
      t.text :raw_content

      t.timestamps
    end
  end
end
