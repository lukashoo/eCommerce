class User < ActiveRecord::Base
  has_many :apartments_as_owner, :class_name => "Apartment", :foreign_key => "user_id_1"
  has_many :apartments_as_renter, :class_name => "Apartment", :foreign_key => "user_id_2"
  has_many :user_apartment_histories
  has_many :charges

  has_many :invoices_owner, :through => :apartments_as_owner, :source => :invoices
  has_many :invoices_renter, :through => :apartments_as_renter, :source => :invoices


  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?



  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end
