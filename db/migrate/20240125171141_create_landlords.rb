class CreateLandlords < ActiveRecord::Migration[7.1]
  def change
    create_table :landlords do |t|
      t.string :name
      t.string :company_email
      t.string :company_phone_number
      t.string :password_digest

      t.timestamps
    end
  end
end
