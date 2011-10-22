class Team < ActiveRecord::Base
  DIMENSIONS = [:portabilidad, :originalidad, :usabilidad]
  DIMENSIONS_ADMIN = [:consistencia, :potencial, :integrabilidad]
  FULL_DIMENSIONS = DIMENSIONS + DIMENSIONS_ADMIN

  has_many :members, :dependent => :destroy
  ajaxful_rateable :stars => 5, :dimensions => FULL_DIMENSIONS, :allow_update => true
  

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
        member.password = "hackathon#{member.email.gsub(/@.*/,'')}"
        member.password_confirmation = "hackathon#{member.email.gsub(/@.*/,'')}"
      end
    end
  end

  def total_rate_average
    total = 0.0
    FULL_DIMENSIONS.each{|dimension| total += dimension_average dimension}
    total/FULL_DIMENSIONS.size
  end

  def dimension_average(dimension)
     self.rates_sum(dimension).to_f/self.total_rates(dimension).to_f
  end

end
