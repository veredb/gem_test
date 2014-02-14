require 'pg_data_encoder/version'
require 'pg_data_encoder/encode_for_copy'

module PgDataEncoder
    encoder = PgDataEncoder::EncodeForCopy.new

    encoder.add [1, "text1", "text2", "text3"]
    encoder.add [2, "text4", "text5", "text6"]
    encoder.add [3, "text7", "text8", "text9"]
    
   Exam.pg_copy_from(encoder.get_io, :format => :binary, :columns => [:id, :username, :password, :port])
end
