class CreateCategorizations < ActiveRecord::Migration[6.1]
  def change
    create_table :categorizations do |t|
      t.string :name
      t.timestamps
    end 
  end
end
