class AddPackageReadyToMeetings < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :package_ready, :boolean, default: false
    add_column :meetings, :package_delivered, :boolean, default: false
  end
end
