class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string     :title,         null: false
      t.date       :date_id,       null: false
      t.integer    :time_id
      t.text       :text
      t.integer    :importance_id, null: false
      t.references :user,          foreign_key: true

      t.timestamps
    end
  end
end
