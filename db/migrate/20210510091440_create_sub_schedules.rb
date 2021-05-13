class CreateSubSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_schedules do |t|
      t.string     :title,         null: false
      t.date       :date_id,       null: false
      t.integer    :time_id
      t.text       :text
      t.integer    :importance_id, null: false
      t.references :schedule,      foreign_key: true

      t.timestamps
    end
  end
end
