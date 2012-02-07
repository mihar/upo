class AddSearchFriendlyToDuAndPz < ActiveRecord::Migration
  def self.up
    add_column :unions, :title_websafe, :string
    add_column :subunions, :title_websafe, :string
    
    # Generate safe names.
    Union.find(:all).each { |u| u.title_websafe = u.title.make_search_engine_friendly; u.save }
    Subunion.find(:all).each { |su| su.title_websafe = su.title.make_search_engine_friendly; su.save }    
  end

  def self.down
    remove_column :subunions, :title_websafe
    remove_column :unions, :title_websafe
  end
end
