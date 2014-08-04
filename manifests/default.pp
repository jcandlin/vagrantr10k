# R10K Test Setup

node "rabbitmq1.prod.williamhill.plc" {
  include utils
  include puppetclient
}

node "puppetmaster.prod.williamhill.plc" {
  include utils
  include r10k
  include puppetmaster
}
