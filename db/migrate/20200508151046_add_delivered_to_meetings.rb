class AddDeliveredToMeetings < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :message_sent, :boolean, default: false
  end
end
