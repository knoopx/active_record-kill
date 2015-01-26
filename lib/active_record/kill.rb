require "active_record/kill/version"
require 'active_support/concern'

module ActiveRecord
  module Kill
    extend ActiveSupport::Concern

    included do
      alias_method_chain :drop_database, :kill
    end

    def drop_database_with_kill(name)
      execute <<-SQL
        SELECT pg_terminate_backend(pg_stat_activity.pid)
        FROM pg_stat_activity
        WHERE pg_stat_activity.datname = #{quote(name)}
        AND pid <> pg_backend_pid();
      SQL

      drop_database_without_kill(name)
    end
  end
end

require 'active_record/connection_adapters/postgresql/schema_statements'
ActiveRecord::ConnectionAdapters::PostgreSQL::SchemaStatements.send(:include, ActiveRecord::Kill)
