class AddMembersToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :member1_name, :string
    add_column :teams, :member1_email, :string
    add_column :teams, :member2_name, :string
    add_column :teams, :member2_email, :string
    add_column :teams, :member3_name, :string
    add_column :teams, :member3_email, :string
    add_column :teams, :member4_name, :string
    add_column :teams, :member4_email, :string
  end
end
