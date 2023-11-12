class AddPhoneToCitizen < ActiveRecord::Migration[7.1]
  def change
    add_column :citizens, :country_code, :string, default: '+55'
    add_column :citizens, :phone_number, :string
  end
end
