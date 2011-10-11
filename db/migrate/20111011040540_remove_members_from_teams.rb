class RemoveMembersFromTeams < ActiveRecord::Migration
  def up
    remove_column :teams, :member1_name
    remove_column :teams, :member1_email
    remove_column :teams, :member2_name
    remove_column :teams, :member2_email
    remove_column :teams, :member3_name
    remove_column :teams, :member3_email
    remove_column :teams, :member4_name
    remove_column :teams, :member4_email
  end

  def down
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
