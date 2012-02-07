class AddSummaryToNewsAndActuality < ActiveRecord::Migration
  def self.up
    add_column :news, :summary, :text
    add_column :actualities, :summary, :text
  end

  def self.down
    remove_column :news, :summary
    remove_column :actualities, :summary
  end
end
