class SplitPresentationInTwoFields < ActiveRecord::Migration
  def self.up
    add_column :abouts, :summary, :text
    add_column :unions, :summary, :text
    add_column :subunions, :summary, :text
  end

  def self.down
    remove_column :subunions, :summary
    remove_column :unions, :summary
    remove_column :abouts, :summary
  end
end
