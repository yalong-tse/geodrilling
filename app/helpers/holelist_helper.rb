#encoding: utf-8
module HolelistHelper
  # 得到所有的机长，以及机长下属的所有班长
  def get_leader_member
    result = ""
    Group.get_all_leader.each do |leader|
      result<< "<option value='" + leader.id.to_s + "'>" +"机长:" + leader.name + " [班长：";
        leader.members.each do |user|
          result << user.name + " "
        end
      result = result.rstrip
      result <<  "]"  + "</option>"
    end
    return result.html_safe;
  end

end
