class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :postcode
      t.datetime :joindate

      t.timestamps
    end
  end
end
