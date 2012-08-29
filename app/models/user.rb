class User < ActiveRecord::Base

  ROLES = %w(presenter reviewer admin)
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name , :last_name , :address , :phone, :school, :role
  # attr_accessible :title, :body
  #
  #
  has_many :presentations
  has_many :rates
  has_many :courses

  before_create :assign_default_role

  def full_name
    "#{first_name} #{last_name}"
  end

  ROLES.each do |role|
    define_method "#{role}?" do
      self.role == role
    end
  end


  def has_presentation_for?(course)
    presentations.where(course_id: course.id).first.present?
  end

  protected


  def assign_default_role
    self.role = 'presenter'
  end

end
