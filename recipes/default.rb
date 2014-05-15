#
# Cookbook Name:: create-sysadmin
# Recipe:: default
#
# Copyright 2014, Wegtam UG
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'users'

# Create all users that are in the group `sysadmin`.
users_manage 'sysadmin' do
  action [ :remove, :create ]
end

# Collect all users from the group `sysadmin` and set their shell.
admins = []
search(:users, "groups:sysadmin").each do |user|
  admins << user['id']
  user "#{user['id']}" do
    shell node['sysadmin']['shell']
    action :modify
  end
end
# Modify the default sudo groups of the platform to hold a list of the
# created users.
node['sysadmin']['default_sudo_groups'].each do |name|
  group "#{name}" do
    members admins
  end
end
