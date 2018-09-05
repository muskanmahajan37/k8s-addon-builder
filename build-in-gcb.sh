#!/bin/bash
#
# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit
set -o nounset
set -o xtrace

subs=()
if [[ -n "${_GO_IMAGE:-}" ]]; then
  subs+=("_GO_IMAGE=$_GO_IMAGE")
fi
# shellcheck disable=SC2178
subs="--substitutions=$(IFS=, eval 'echo "${subs[*]}"')"

gcloud container builds submit \
  "${subs:-}" \
  --config addon-builder.cloudbuild.yaml \
  .
