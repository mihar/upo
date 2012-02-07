class AddSubunionIdToSubsections < ActiveRecord::Migration
  def self.up
    add_column :subsections, :subunion_id, :integer
  end

  def self.down
    remove_column :subsections, :subunion_id
  end
end
