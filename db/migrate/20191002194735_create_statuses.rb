class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.integer :DeployID
      t.references :deployment, foreign_key: true
      t.text :Received
      t.decimal :Latitude
      t.decimal :Longitude
      t.decimal :Temperature

      t.timestamps
    end
  end
end
