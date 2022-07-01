class AddEnvToTests < ActiveRecord::Migration[7.0]
  def change
    add_column :tests, :environments, :text, default: [].to_yaml
  end
end
