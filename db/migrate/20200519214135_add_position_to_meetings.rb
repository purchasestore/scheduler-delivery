class AddPositionToMeetings < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :position, :integer
    Meeting.order(:start_time).each.with_index(1) do |meeting, index|
      meeting.update_column :position, index
    end
  end
end
