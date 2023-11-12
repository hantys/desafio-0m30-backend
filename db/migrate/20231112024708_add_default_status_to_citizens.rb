class AddDefaultStatusToCitizens < ActiveRecord::Migration[7.1]
  def change
    change_column_default :citizens, :status, from: nil, to: 1
  end
end
