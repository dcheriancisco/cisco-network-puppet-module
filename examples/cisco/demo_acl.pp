# Manifest to demo cisco_acl providers
#
# Copyright (c) 2016 Cisco and/or its affiliates.
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

class ciscopuppet::cisco::demo_acl {
  cisco_acl { 'ipv4 my_ipv4_acl':
    ensure                 => 'present',
    stats_per_entry        => false,
    fragments              => 'permit'
  }

  cisco_ace { 'ipv4 my_ipv4_acl 10':
    ensure                 => 'present',
    action                 => 'permit',
    proto                  => 'tcp',
    src_addr               => '1.2.3.4 2.3.4.5',
    src_port               => 'eq 40',
    dst_addr               => '8.9.0.4/32',
    dst_port               => 'range 32 56',
  }

  cisco_ace { 'ipv4 my_ipv4_acl 20':
    action                 => 'permit',
    proto                  => 'tcp',
    src_addr               => '1.2.3.4 2.3.4.5',
    src_port               => 'eq 40',
    dst_addr               => '8.9.0.4/32',
    dst_port               => 'range 32 56',
    tcp_flags              => 'ack syn fin',
    dscp                   => 'af11',
    established            => false,

    # TBD: These properties need platform checks
    # http_method            => 'post',
    # packet_length          => 'range 80 1000',
    # tcp_option_length      => '20',
    # time_range             => 'my_range',
    # ttl                    => '153',
    # redirect               => 'Ethernet1/1,Ethernet1/2,port-channel1',
    # log                    => false,
  }

  cisco_acl { 'ipv6 my_ipv6_acl':
    ensure                 => 'present'
  }

  cisco_ace { 'ipv6 my_ipv6_acl 85':
    ensure                 => 'present',
    action                 => 'permit',
    proto                  => 'tcp',
    src_addr               => 'any',
    dst_addr               => 'any',
  }

  cisco_ace { 'ipv6 my_ipv6_acl 89':
    remark                 => 'my ace remark',
  }
}
