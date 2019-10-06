# frozen_string_literal: true

module Concerns
  module Upsertable
    extend ActiveSupport::Concern

    included do
      cattr_accessor :upsertable_columns
      cattr_accessor :blacklisted_ids
      cattr_accessor :after_upsert
    end

    class_methods do
      def upsert!(blob)
        id = blob['id']
        return if blacklisted_ids.present? && blacklisted_ids[id]

        begin
          name.constantize.find_or_initialize_by(id: blob['id']).tap do |entity|
            upsertable_columns.each do |remote, local|
              entity.send("#{local}=", typecast(
                                         remote: remote,
                                         local: local,
                                         value: blob[remote.to_s]
                                       ))
            end
          end.save!

          # byebug if self.name == 'Location'
          after_upsert.call(blob) if after_upsert.present?
        rescue ActiveRecord::RecordNotUnique
          # nop
        rescue ActiveRecord::RecordInvalid
          # nop
        rescue ArgumentError
          # nop
        end
      end

      def upsert(columns, &block)
        self.upsertable_columns = columns.merge(id: :id, name: :name)
        self.after_upsert = block
      end

      def transform_upcase(*columns)
        self.upcased_columns = columns
      end

      def blacklist(*ids)
        self.blacklisted_ids = ids.map { |id| [id, true] }.to_h
      end

      def typecast(local:, remote:, value:)
        case remote
        when ->(m) { m.to_s.match(/name/) }
          case local
          when :state then value.strip.upcase
          else value.strip
          end
        when ->(m) { m.to_s.match(/date/) } then Time.parse(value)
        else value
        end
      end
    end
  end
end
