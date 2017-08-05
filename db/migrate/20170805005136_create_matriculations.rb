class CreateMatriculations < ActiveRecord::Migration[5.1]
  def change
    create_table :matriculations do |t|
      t.belongs_to :student, index: true
      t.belongs_to :team, index: true
      t.timestamps
    end
  end
end
