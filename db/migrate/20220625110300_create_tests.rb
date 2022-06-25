class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :tag
      t.string :description
      t.string :name
      t.string :steps
      t.string :status

      t.timestamps
    end
  end
end
