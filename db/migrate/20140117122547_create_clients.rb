class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :surname
      t.integer :contact
      t.text :email
      t.text :address

      t.timestamps
    end
  end
end
