class AddDistrictToMeetings < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :district, :string
  end
end
