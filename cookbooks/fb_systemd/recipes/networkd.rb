#
# Cookbook Name:: fb_systemd
# Recipe:: networkd
#
# vim: syntax=ruby:expandtab:shiftwidth=2:softtabstop=2:tabstop=2
#
# Copyright (c) 2016-present, Facebook, Inc.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree. An additional grant
# of patent rights can be found in the PATENTS file in the same directory.
#

service 'systemd-networkd' do
  only_if { node['fb_systemd']['networkd']['enable'] }
  action [:enable, :start]
end

service 'disable systemd-networkd' do
  not_if { node['fb_systemd']['networkd']['enable'] }
  service_name 'systemd-networkd'
  action [:stop, :disable]
end
