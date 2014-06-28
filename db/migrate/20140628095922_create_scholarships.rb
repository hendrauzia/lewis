class CreateScholarships < ActiveRecord::Migration
  def change
    create_table :scholarships do |t|
      t.integer :score
      t.float :discount

      t.timestamps
    end
  end
end
