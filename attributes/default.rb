#
# Cookbook Name:: create-sysadmin
# Attributes:: default
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

case node['platform']
when 'ubuntu','debian'
  groups = ['admin', 'sudo']
else
  groups = ['wheel']
end

case node['platform']
when 'freebsd'
  shell = '/bin/csh'
else
  shell = '/bin/bash'
end

default['sysadmin']['default_sudo_groups'] = groups
default['sysadmin']['shell'] = shell

