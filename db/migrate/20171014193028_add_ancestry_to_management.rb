class AddAncestryToManagement < ActiveRecord::Migration[5.1]
  def change
    add_column :managements, :ancestry, :string
    add_index :managements, :ancestry
  end
end
