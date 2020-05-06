class AddFieldsToMeetings < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :products, :string
    add_column :meetings, :total_price, :float
    add_column :meetings, :payment_type, :string
  end
end
