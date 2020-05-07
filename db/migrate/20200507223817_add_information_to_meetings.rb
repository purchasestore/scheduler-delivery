class AddInformationToMeetings < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :information, :string
  end
end
