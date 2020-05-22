class AddCepToMeetings < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :cep, :string
  end
end
