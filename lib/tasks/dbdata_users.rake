#endoding: utf-8
namespace 'dbdata' do
  desc "change the Users data from blank to NULL in the database"
  task(:users => :environment) do
    users = User.where(account: '')
    users.each do |user|
      user.account = nil
      user.save
    end
  end
end
