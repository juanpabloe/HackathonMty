class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  belongs_to :team
  before_create :set_member
  
  ajaxful_rater
  
  def set_member 
      self.role ||= "participante"  
  end

  def admin?
    self.role == 'admin'
  end

  def participante?
    self.role == 'participante'
  end
  


  
end


