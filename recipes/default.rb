package node['java']['package'] do
  version node['java']['version']
end

remote_file '/etc/yum.repos.d/jenkins.repo' do
  source "http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo"
end

execute "rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key"

package 'jenkins' do
  version node['jenkins']['version']
end

service 'jenkins' do
  action [:enable, :start]
end
