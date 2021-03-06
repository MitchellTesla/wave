# Copyright 2020 H2O.ai, Inc.
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


#' @title Configure Environment Variables
#' 
#' @param .config - List of environment variables
#' @param ... - Any additional argument added to \code{.config}
#' 
#' @description configure the list of environment variables. The list includes the 
#' server address, the access key and secret, shutdown timeout, and app communication mode. 
#' 
#' @examples .onLoad()
#' 
#' @export
#' 
.onLoad <- function(libname,pkgname){
        .config <<- list()
        .config$internal_address <<- .get_env_var(c("INTERNAL_ADDRESS",.default_internal_address))
        .config$external_address <<- .get_env_var(c("EXTERNAL_ADDRESS",.config$internal_address))
        .config$hub_address <<- .get_env_var(c("ADDRESS",'http://localhost:10101'))
        .config$hub_access_key_id <<- .get_env_var(c('ACCESS_KEY_ID', 'access_key_id'))
        .config$hub_access_key_secret <<- .get_env_var(c('ACCESS_KEY_SECRET','access_key_secret'))
        .config$shutdown_timeout <<- as.integer(.get_env_var(c('SHUTDOWN_TIMEOUT','3')))
        .config$app_mode <<- .get_env_var(c('APP_MODE',UNICAST))
}

UNICAST <- 'unicast'