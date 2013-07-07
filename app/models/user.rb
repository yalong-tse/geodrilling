#encoding: utf-8
require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  belongs_to :department
  has_many :assignments
  has_many :roles, :through => :assignments
  
  attr_accessible :birthday, :duty, :education, :email, :isappuser, :mobile, :name, :officephone, :sex, :account, :password, :password_confirmation, :role_ids
  attr_accessor :password

  before_save :encrypt_password

  SEXS = [["男",1], ["女",2]]
  EDUCATION = ["大专","本科","硕士","博士","博士后"]

  validates :password, :length => { minimum: 1 }, :confirmation => true, :if => :is_appuser?
  validates :account, :uniqueness => true, :if => :is_appuser?

  def role_ids=(role_ids)
    # 只有是系统用户时才能添加角色，防止页面点击“是”后又改为“否”的特殊情况下，系统逻辑出错
    if :is_appuser
      role_ids.each do |r_id|
        role = Role.find(r_id)
        self.roles << role
      end
    end
  end
  
  def is_appuser?
    isappuser?
    # password.present? || password_confirmation.present?
  end

  def encrypt_password
    if password.present?
      self.password_digest = BCrypt::Password.create(password)
    end
  end

  def self.authenticate(account, password)
    user = find_by_account(account)
    if user && Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
  
  # 初始化用户时设置的默认密码
  def self.set_default_password(user)
    user.password = user.password_confirmation = "1"
  end

end
