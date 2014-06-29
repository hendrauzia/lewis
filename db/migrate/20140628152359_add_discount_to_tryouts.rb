class AddDiscountToTryouts < ActiveRecord::Migration
  def change
    add_column :tryouts, :discount, :float
  end
end
