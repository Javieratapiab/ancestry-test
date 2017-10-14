class CreateManagements < ActiveRecord::Migration[5.1]
  def change
    create_table :managements do |t|
      t.float :grade, default: 0
      t.string :area

      t.timestamps
    end
  end
end
