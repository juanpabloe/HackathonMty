class Team < ActiveRecord::Base
  DIMENSIONS = [:consistencia, :portabilidad, :originalidad, :usabilidad, :potencial, :integrabilidad]
  has_many :members
  ajaxful_rateable :stars => 5, :dimensions => DIMENSIONS , :allow_update => true
  

  attr_accessible :name, :project_description, :project_name, :members_attributes

  validates :name, :presence => true
  validates :project_description, :presence => true
  validates :project_name, :presence => true

  accepts_nested_attributes_for :members
  before_create :rescue_members

  def rescue_members
    self.members.each do |member|
      if member.name.blank? and member.email.blank?
        member.delete
      else
        member.password = 'secret'
        member.password_confirmation = 'secret'
      end
    end
  end

end
