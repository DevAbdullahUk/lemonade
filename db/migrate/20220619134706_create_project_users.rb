class CreateProjectUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :project_users do |t|
      t.string :projectId
      t.string :userId
      t.string :accessLevel

      t.timestamps
    end
  end
end
