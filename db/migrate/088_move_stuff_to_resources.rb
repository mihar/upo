class MoveStuffToResources < ActiveRecord::Migration
  def self.up
    
    # #
    # #
    # # O nas
    # #
    # cat = ResourceCategory.create({:title => 'O nas'})
    # 
    # # ZDUS
    # i = Information.find :first
    # res = Resource.create({
    #   :title => 'O nas',
    #   :text => i.about
    # })
    # att = ResourceAttachment.create({
    #   :fileimage => i.image
    # })
    # cat << res
    # res << att
    # cat.save
    # res.save
    
  end

  def self.down
  end
end
