# frozen_string_literal: true

require 'mysql2'
require 'pry'

class DB

  DATA = "fgb"
  def get_data
    con = Mysql2::Client.new(host: '77.120.103.50', username: 'pekelis_usr',
                             password: 'B6y0N7i5', database: 'pekelis_db', port: '3310')
    rs = con.query 'select * from oc_customer;'
    rs.each do |row|
      row.each { |key, value| puts key.to_s + ': ' + value.to_s }
      puts
    end

  rescue Mysql2::Error => e
    puts e.errno
    puts e.error
  ensure
    con&.close
  end
end

db = DB.new
db.get_data
puts DB::DATA
