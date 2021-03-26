module Peatio
  module Ubiquitium
    module Hooks
      BLOCKCHAIN_VERSION_REQUIREMENT = "~> 1.0.0"
      WALLET_VERSION_REQUIREMENT = "~> 1.0.0"

      class << self
        def check_compatibility
          unless Gem::Requirement.new(BLOCKCHAIN_VERSION_REQUIREMENT)
                                 .satisfied_by?(Gem::Version.new(Peatio::Blockchain::VERSION))
            [
              "Ubiquitium blockchain version requiremnt was not suttisfied by Peatio::Blockchain.",
              "Ubiquitium blockchain requires #{BLOCKCHAIN_VERSION_REQUIREMENT}.",
              "Peatio::Blockchain version is #{Peatio::Blockchain::VERSION}"
            ].join('\n').tap { |s| Kernel.abort s }
          end

          unless Gem::Requirement.new(WALLET_VERSION_REQUIREMENT)
                                 .satisfied_by?(Gem::Version.new(Peatio::Wallet::VERSION))
            [
              "Ubiquitium wallet version requiremnt was not suttisfied by Peatio::Wallet.",
              "Ubiquitium wallet requires #{WALLET_VERSION_REQUIREMENT}.",
              "Peatio::Wallet version is #{Peatio::Wallet::VERSION}"
            ].join('\n').tap { |s| Kernel.abort s }
          end
        end

        def register
          Peatio::Blockchain.registry[:ubiquitium] = Ubiquitium::Blockchain
          Peatio::Wallet.registry[:ubiquitiumd] = Ubiquitium::Wallet
        end
      end

      if defined?(Rails::Railtie)
        require "peatio/ubiquitium/railtie"
      else
        check_compatibility
        register
      end
    end
  end
end
