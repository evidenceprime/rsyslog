module RsyslogCookbook
  # helpers for the various service providers on Ubuntu systems
  module Helpers
    def declare_rsyslog_service
      service node['rsyslog']['service_name'] do
        supports :restart => true, :status => true
        action   [:enable, :start]
        if node['platform'] == 'ubuntu' && node['platform_version'].to_f >= 12.04 &&
           node['platform_version'].to_f <= 14.04
          provider Chef::Provider::Service::Upstart
        end
      end
    end
  end
end
