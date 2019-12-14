class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.string :name
      t.string :localization
      t.string :phone
      t.datetime :start_time

      t.timestamps
    end
  end
end
