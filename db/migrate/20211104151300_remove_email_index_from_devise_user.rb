class RemoveEmailIndexFromDeviseUser < ActiveRecord::Migration[6.0]
  def change
    remove_index :deviseusers, name: "index_deviseusers_on_email"
  end
end
