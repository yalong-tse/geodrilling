module HolesHelper

  # 字典项的处理方法
  def dictionary_treat(passkey)
	if !passkey
		return ""
	elsif passkey.nil?
		return ""
	else
		dic = Dictionary.find(passkey)
		if dic
		  return dic.item 
		else
		  return ""
		end
	end
  end

end
