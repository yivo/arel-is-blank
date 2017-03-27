# encoding: UTF-8
# frozen_string_literal: true

require 'bundler'
Bundler.require :default, :development, :test

class FakeRecord
  class Connection
    def quote_table_name(name)
      "`#{name}`"
    end

    def quote_column_name(name)
      "`#{name}`"
    end

    def quote(value)
      String === value ? "'#{value}'" : value
    end
  end

  class << self
    attr_accessor :connection
  end

  self.connection = Connection.new
end

class ArelToSQLTest < Test::Unit::TestCase
  def test_is_blank
    table = Arel::Table.new(:users)
    assert_equal "(`users`.`name` IS NULL OR `users`.`name` = '')", table[:name].is_blank
  end

  def test_is_blank_or_equals
    table = Arel::Table.new(:users)
    assert_equal "(`users`.`name` = 'Anonymous' OR (`users`.`name` IS NULL OR `users`.`name` = ''))",
                 table[:name].is_blank_or_equals('Anonymous')
  end

  def setup
    super
    Arel::Table.engine = FakeRecord
  end
end
