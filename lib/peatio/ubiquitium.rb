require "active_support/core_ext/object/blank"
require "active_support/core_ext/enumerable"
require "peatio"

module Peatio
  module Ubiquitium
    require "bigdecimal"
    require "bigdecimal/util"

    require "peatio/ubiquitium/blockchain"
    require "peatio/ubiquitium/client"
    require "peatio/ubiquitium/wallet"

    require "peatio/ubiquitium/hooks"

    require "peatio/ubiquitium/version"
  end
end
