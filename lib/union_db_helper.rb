module UnionDBHelper
  def find_for_union(what, union, options = {})
  	with_scope :find => options do
    	find what, :conditions => "(#{self.table_name}.union_id = #{union})"
    end
  end
  
  def find_for_subunion(what, union, options = {})
  	with_scope :find => options do
    	find what, :conditions => "(#{self.table_name}.subunion_id = #{union})"
    end
  end
  
  def find_for_zdus(what, options = {})
    with_scope :find => options do
      find what, :conditions => "((#{self.table_name}.union_id IS NULL) and (#{self.table_name}.subunion_id IS NULL)) or ((#{self.table_name}.union_id=0) and (#{self.table_name}.subunion_id=0))"
    end
  end
  
  def paginate_for_zdus(page, options={})
    with_scope :find => options do    
      paginate  :page => page,
                :per_page => 10,
                :order => "#{self.table_name}.created_at DESC",
                :conditions => "((#{self.table_name}.union_id IS NULL) and (#{self.table_name}.subunion_id IS NULL)) or ((#{self.table_name}.union_id=0) and (#{self.table_name}.subunion_id=0))"
    end
end
  
  def paginate_for_subunion(page, union, options={})
    with_scope :find => options do    
      paginate  :page => page,
                :per_page => 10,
                :order => "#{self.table_name}.created_at DESC",
                :conditions => "(#{self.table_name}.subunion_id = #{union})"
    end
  end
  
  def paginate_for_union(page, union, options={})    
    with_scope :find => options do    
      paginate  :page => page,
                :per_page => 10,
                :order => "#{self.table_name}.created_at DESC",
                :conditions => "(#{self.table_name}.union_id = #{union})"
    end
  end

end
