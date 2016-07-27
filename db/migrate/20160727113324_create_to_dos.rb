class CreateToDos < ActiveRecord::Migration
  def change
    create_table :to_dos do |t|
      t.string :content
      t.datetime :start_time
      t.datetime :end_time
      t.integer :status
      t.string :title

      t.timestamps null: false
    end
  end
end
