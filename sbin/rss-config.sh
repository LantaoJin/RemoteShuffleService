#!/usr/bin/env bash
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

unset HADOOP_CONF_DIR

# included in all the rss scripts with source command
# should not be executable directly
# also should not be passed any arguments, since we need original $*

# symlink and absolute path should rely on RSS_HOME to resolve
if [ -z "${RSS_HOME}" ]; then
  export RSS_HOME="$(cd "`dirname "$0"`"/..; pwd)"
fi

export RSS_CONF_DIR="${RSS_CONF_DIR:-"${RSS_HOME}/conf"}"

if [ -z "$RSS_ENV_LOADED" ]; then
  export RSS_ENV_LOADED=1

  if [ -f "${RSS_CONF_DIR}/rss-env.sh" ]; then
    # Promote all variable declarations to environment (exported) variables
    set -a
    . "${RSS_CONF_DIR}/rss-env.sh"
    set +a
  fi
fi
