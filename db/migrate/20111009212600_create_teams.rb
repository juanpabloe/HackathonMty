class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :project_name
      t.text :project_description

      t.timestamps
    end
  end
end
