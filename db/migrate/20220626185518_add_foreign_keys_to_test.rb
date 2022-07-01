class AddForeignKeysToTest < ActiveRecord::Migration[7.0]
  def change
    add_reference :tests, :project, foreign_key: true
  end
end
