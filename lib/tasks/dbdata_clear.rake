#endoding: utf-8
namespace 'dbdata' do
  desc "clear all table data in the contracts,holes,tourreports,drilltowers,rigmachines,pumps,deployments"
  task(:clear => :environment) do
    Contract.delete_all
    Hole.delete_all
    Tourreport.delete_all
    Workcontent.delete_all
    Drilltower.delete_all
    Rigmachine.delete_all
    Pump.delete_all
    Deployment.delete_all
  end
end
