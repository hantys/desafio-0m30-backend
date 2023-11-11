class CreateCitizens < ActiveRecord::Migration[7.1]
  def change
    create_table :citizens do |t|
      t.string :full_nome
      t.string :document_number
      t.string :cns
      t.string :email
      t.integer :status
      t.date :birth_date

      t.timestamps
    end
    add_index :citizens, :full_nome
    add_index :citizens, :document_number
    add_index :citizens, :cns
    add_index :citizens, :email
  end
end
