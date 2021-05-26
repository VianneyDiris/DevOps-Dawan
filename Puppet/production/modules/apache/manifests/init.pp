# Class: apache
#
#
class apache {
  # resources
  include apache::install
  include apache::config
}
