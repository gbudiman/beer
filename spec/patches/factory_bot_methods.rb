# frozen_string_literal: true

require 'factory_bot'

module FactoryBot
  module Syntax
    module Methods
      IGNORED_ATTRIBUTES = %w[id type created_at updated_at].freeze

      def attributes_with_foreign_keys_for(*args)
        FactoryBot.build(*args).attributes.delete_if do |attribute, _|
          IGNORED_ATTRIBUTES.member?(attribute)
        end
      end

      def described_symbol
        described_class.name.underscore.to_sym
      end
    end
  end
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
