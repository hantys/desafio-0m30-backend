class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :cep
      t.string :street
      t.string :neighborhood
      t.string :number
      t.string :city
      t.string :state
      t.string :complement
      t.string :ibge
      t.references :addressable, polymorphic: true

      t.timestamps
    end
  end
end
