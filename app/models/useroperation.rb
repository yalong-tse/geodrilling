#encoding: utf-8
class Useroperation < ActiveRecord::Base
  # operatecontent 操作内容
  # operatetime 操作时间
  # remark 备注
  # useraccount 用户登陆账号
  # username 用户名
  # userid 用户id
  # userip 用户登陆ip地址
  attr_accessible :operatecontent, :operatetime, :remark, :useraccount, :userid, :userip, :username
end
