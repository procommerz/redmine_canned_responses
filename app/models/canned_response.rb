class CannedResponse < ActiveRecord::Base
  belongs_to :project

  validates_presence_of :title, :text

  scope :global, where(:project_id => nil)
  default_scope order(:title)

  def global?
    project.nil?
  end
  
  def is_global?
    global
  end
  
  def is_global=(value)
    project_id = nil if value
  end  
end
