class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :content, null: false
      t.integer :point_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
