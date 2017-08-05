class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.integer :number
      t.string :complement
      t.string :neighborhood
      t.string :city
      t.string :state
      t.float :latitude
      t.float :longitude
      t.integer :addressable_id
      t.string :addressable_type
      t.timestamps
    end
  end
end
