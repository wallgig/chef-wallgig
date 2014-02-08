chef_gem "chef-handler-mail"
gem "chef-handler-mail"

chef_handler "MailHandler" do
   source 'chef/handler/mail'
   arguments :to_address => "root"
   action :nothing
end.run_action(:enable)

