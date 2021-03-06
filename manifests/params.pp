# Parameters for puppet-octavia
#
class octavia::params {
  include ::openstacklib::defaults

  $api_service_name            = 'octavia-api'
  $worker_service_name         = 'octavia-worker'
  $health_manager_service_name = 'octavia-health-manager'
  $housekeeping_service_name   = 'octavia-housekeeping'
  case $::osfamily {
    'RedHat': {
      $common_package_name         = 'openstack-octavia-common'
      $api_package_name            = 'openstack-octavia-api'
      $worker_package_name         = 'openstack-octavia-worker'
      $health_manager_package_name = 'openstack-octavia-health-manager'
      $housekeeping_package_name   = 'openstack-octavia-housekeeping'
    }
    'Debian': {
      $common_package_name         = 'octavia-common'
      $api_package_name            = 'octavia-api'
      $worker_package_name         = 'octavia-worker'
      $health_manager_package_name = 'octavia-health-manager'
      $housekeeping_package_name   = 'octavia-housekeeping'
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem")
    }

  } # Case $::osfamily
}
