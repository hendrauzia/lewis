class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.belongs_to :student, index: true
      t.belongs_to :parent, index: true

      t.timestamps
    end
  end
end
