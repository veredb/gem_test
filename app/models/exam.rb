require 'active_record'
require 'postgres-copy'
require 'pg_data_encoder'
require 'benchmark'


ActiveSupport.on_load :active_record do
  require "postgres-copy"
  require "active_record"
end
ActiveRecord::Base.establish_connection(
        :adapter  => "postgresql",
        :host     => "localhost",
        :database => "test"
)
ActiveRecord::Base.connection.execute %{
  SET client_min_messages TO warning;
  DROP TABLE IF EXISTS test_models;
  CREATE TABLE test_models (id serial PRIMARY KEY, data VARCHAR);
}

class Exam < ActiveRecord::Base
end

encoder = PgDataEncoder::EncodeForCopy.new

puts "Loading data to disk"
puts Benchmark.measure {
  0.upto(1_000_000).each {|i|
    encoder.add [1, "test1", "test2", "test3"]
  }
}
puts "inserting into db"
puts Benchmark.measure {
  Exam.pg_copy_from(encoder.get_io, :format => :binary, :columns => [:id, :username, :password, :port])
}

encoder.remove
