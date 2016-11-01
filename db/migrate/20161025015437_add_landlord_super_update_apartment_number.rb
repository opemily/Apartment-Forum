class AddLandlordSuperUpdateApartmentNumber < ActiveRecord::Migration
  def change
     add_column(:users, :super, :boolean, null: false, default: false)
      add_column(:users, :landlord, :boolean, null: false, default: false)
      rename_column(:users, :apartment_number, :apt)
  end
end
