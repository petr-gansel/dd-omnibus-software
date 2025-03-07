#
# Copyright 2012-2014 Chef Software, Inc.
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
# expeditor/ignore: deprecated 2021-11
#

name "libuuid"
default_version "2.21"

license "LGPL-2.1"
license_file "COPYING"

source url: "https://www.kernel.org/pub/linux/utils/util-linux/v#{version}/util-linux-#{version}.tar.gz"
# We use the version in util-linux, and only build the libuuid subdirectory
version "2.27.1" do
  source sha256: "133c14f625d40e90e73e9d200faf3f2ce87937b99f923c84e5504ac0badc71d6",
         url: "https://www.kernel.org/pub/linux/utils/util-linux/v2.27/util-linux-2.27.1.tar.gz"
end
version "2.21" do
  source sha256: "c4a221015a1403acbe4625bd17f5cfa5e659c9e1e987a020c1a0fd6413e66a31"
end

relative_path "util-linux-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "./configure --prefix=#{install_dir}/embedded", env: env

  make "-j #{workers}", env: env, cwd: "#{project_dir}/libuuid"
  make "-j #{workers} install", env: env, cwd: "#{project_dir}/libuuid"
end
