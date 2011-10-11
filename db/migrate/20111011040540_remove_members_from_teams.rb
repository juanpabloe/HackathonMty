class RemoveMembersFromTeams < ActiveRecord::Migration
  def up
    remove_column :teams, :member1_name, :string
    remove_column :teams, :member1_email, :string
    remove_column :teams, :member2_name, :string
    remove_column :teams, :member2_email, :string
    remove_column :teams, :member3_name, :string
    remove_column :teams, :member3_email, :string
    remove_column :teams, :member4_name, :string
    remove_column :teams, :member4_email, :string
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
