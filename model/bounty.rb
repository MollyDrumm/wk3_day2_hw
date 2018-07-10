require('pry-byebug')
require('pg')

class Bounty
  # attr_reader
  # attr_writer
  def initialize( options )
    @bounty_name = options['bounty_name']
    @danger_level = options['danger_level']
    @favourite_weapon = options['favourite_weapon']
    @bounty_value = options['value'].to_i
  end

# SAVE

  def save
      # CONNECT TO DB
      db = PG.connect( { dbname: 'bounty', host: 'localhost'} )

      sql = "INSERT INTO bounty (bounty_name, danger_level, favourite_weapon, bounty_value) VALUES ($1, $2, $3, $4);"
      values = [@bounty_name, @danger_level, @favourite_weapon, @bounty_value]
      db.prepare( "save" ,sql)
      db.exec_prepared("save" , values)

      db.close()


  end
end





# UPDATE






# DELETE
