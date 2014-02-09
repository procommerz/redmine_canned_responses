class CannedResponse < ActiveRecord::Base
  belongs_to :project

  validates_presence_of :title, :text
  
  before_save :set_global_property

  scope :global, where(:project_id => nil)
  default_scope order(:title)

  def global?
    project.nil?
  end
  
  def is_global
    @is_global
  end
  
  def is_global=(value)
    if value
      @is_global = true
    else
      @is_global = false
    end
  end  
  
  private
  
  def set_global_property
    product_id = nil if @is_global
  end
end
