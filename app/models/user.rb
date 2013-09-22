#encoding: utf-8
require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  belongs_to :department
  has_many :assignments
  has_many :roles, :through => :assignments
  has_and_belongs_to_many :groups

  attr_accessible :birthday, :duty, :education, :email, :isappuser, :mobile, :name, :officephone, :sex, :account, :password, :password_confirmation, :role_ids, :group_ids, :department_id
  attr_accessor :password

  before_save :encrypt_password
  before_save :normalize_blank_values
  before_validation :normalize_blank_values

  SEXS = [["男",1], ["女",2]]
  EDUCATION = ["大专","本科","硕士","博士","博士后"]

  validates :password, :length => { minimum: 1 }, :confirmation => true, :if => :is_appuser?
  validates :account, presence: true, :if => :is_appuser?
  validate :unique_account_only_for_appuser, :if => :is_appuser?
  
  # 下面的方式是在rails 4.0中使用的,在rails3.2.13中不支持condition的这种方式
  # validates_uniqueness_of :account, conditions: -> { where(isappuser: true) }, :if => :is_appuser?

  def unique_account_only_for_appuser
    users = User.where("isappuser = ? AND account = ?", true, account)
    unless users.empty?
      errors.add(:account, I18n.t("errors.messages.taken"))
    end
  end

  # 如果attributes为空字符串或者strip后为空，将它设置为nil
  def normalize_blank_values
    attributes.each do |column, value|
      self[column].respond_to?(:strip) ? self[column].strip! : self[column]
      if self[column].respond_to?(:empty?)
        self[column] = nil if self[column].empty?
      else
        self[column]
      end
      self[column]
      # self[column].present? || self[column] = nil
    end
  end

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

  # 查找全部可以用于分组的用户
  def self.get_users_for_groups
    User.includes(:department).where("departments.id IS NOT NULl") - User.joins(:groups).where("groups.id IS NOT NULL")
  end

  def has_role?(role_sym)
    roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end
end

