class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      enable_extension 'hstore'
      t.string :name
      t.string :description
      t.json :questions
      t.json :answers
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
