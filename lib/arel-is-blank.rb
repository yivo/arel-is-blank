# encoding: UTF-8
# frozen_string_literal: true

module ArelIsBlank
  module Extension
    def is_blank
      "(#{to_sql} IS NULL OR #{to_sql} = '')"
    end

    def is_not_blank
      "(#{to_sql} IS NOT NULL AND #{to_sql} <> '')"
    end

    def is_blank_or_equals(value)
      engine = relation.respond_to?(:engine) ? relation.engine : Arel::Table.engine
      "(#{to_sql} = #{engine.connection.quote(value)} OR #{is_blank})"
    end
  end
end

require 'arel'
require 'arel-to-sql'

Arel::Attributes::Attribute.include ArelIsBlank::Extension
