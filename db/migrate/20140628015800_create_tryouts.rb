class CreateTryouts < ActiveRecord::Migration
  def change
    create_table :tryouts do |t|
      t.belongs_to :student, index: true
      t.belongs_to :quiz, index: true
      t.json :answers
      t.integer :score

      t.timestamps
    end
  end
end
