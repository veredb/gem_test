class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :username
      t.string :password
      t.string :port

      t.timestamps
    end
  end
end
