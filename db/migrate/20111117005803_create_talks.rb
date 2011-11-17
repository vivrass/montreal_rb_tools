class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :name
      t.string :title
      t.string :email
      t.text :description

      t.timestamps
    end
  end
end
