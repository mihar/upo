class AddUnionAndSubunionIds < ActiveRecord::Migration
  def self.up
    
    add_column :people, :subunion_id, :integer
    
    add_column :recreations, :union_id, :integer
    add_column :recreations, :subunion_id, :integer
    
    add_column :rules, :union_id, :integer
    add_column :rules, :subunion_id, :integer
    
    add_column :symbolics, :union_id, :integer
    add_column :symbolics, :subunion_id, :integer
    
    add_column :visits_of_events, :union_id, :integer
    add_column :visits_of_events, :subunion_id, :integer
    
    # Bring subunions and unions up to date
    add_column :subunions, :working_hours, :string
    add_column :subunions, :locality, :string
    add_column :unions, :president, :string
    add_column :subunions, :description, :string
    add_column :subunions, :contact, :string
    
  end

  def self.down
    
    remove_column :people, :subunion_id
    remove_column :recreations, :union_id
    remove_column :recreations, :subunion_id
    remove_column :rules, :union_id
    remove_column :rules, :subunion_id
    remove_column :symbolics, :union_id
    remove_column :symbolics, :subunion_id
    remove_column :visits_of_events, :union_id
    remove_column :visits_of_events, :subunion_id
    remove_column :subunions, :working_hours
    remove_column :subunions, :locality
    remove_column :subunions, :president
    remove_column :subunions, :description
    remove_column :subunions, :contact
    
  end
end
