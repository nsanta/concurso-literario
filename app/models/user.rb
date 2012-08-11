class User < ActiveRecord::Base

  ROLES = %w(presenter reviewer admin)
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name , :last_name , :address , :phone, :school
  # attr_accessible :title, :body
  #
  #
  has_many :presentations
  has_many :rates



  def full_name
    "#{first_name} #{last_name}"
  end

  ROLES.each do |role|
    define_method "#{role}?" do
      self.role == role
    end
  end

end
