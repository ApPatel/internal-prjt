class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :agenda
      t.text :description
      t.string :attachment_file
      t.integer :sub_category_id
      t.date :event_date

      t.timestamps
    end
  end
end
