require('pry-byebug')
require('pg')

class Bounty
  attr_accessor :bounty_name, :danger_level, :favourite_weapon, :bounty_value
  attr_reader :id #new

  #initialize
  def initialize( options )
    @id = options['id'].to_i if options['id']
    @bounty_name = options['bounty_name']
    @danger_level = options['danger_level']
    @favourite_weapon = options['favourite_weapon']
    @bounty_value = options['bounty_value'].to_i
  end

  def Bounty.all
  db = PG.connect ({ dbname: 'bounty', host: 'localhost' } )
  sql = "SELECT * FROM bounty"
  db.prepare( "all", sql)
  order_hashes = db.exec_prepared("all")
  db.close()

  bounty = order_hashes.map {
    |hash| Bounty.new(hash)
  }

  return bounty
  end
  def update()
     db = PG.connect( { dbname: 'bounty', host: 'localhost' } )
     sql = "UPDATE bounty
     SET
     (
     	bounty_name,
     	danger_level,
     	favourite_weapon,
     	bounty_value
     ) =
     (
     	$1, $2, $3, $4
     )
     WHERE id = $5"
     values = [@bounty_name, @danger_level, @favourite_weapon, @bounty_value, @id]
     db.prepare("update", sql)
     db.exec_prepared("update", values)
     db.close
   end


  def delete()
    db = PG.connect ({ dbname: 'bounty', host: 'localhost' } )
    sql = "DELETE FROM bounty WHERE id = $1"
    values = [ @id ]
    db.prepare( "delete_one", sql)
    db.exec_prepared("delete_one", values)
    db.close()
  end

   def Bounty.delete_all()
     db = PG.connect( { dbname: 'bounty', host: 'localhost' } )
    sql = "DELETE FROM bounty"
    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all")
    db.close
  end

  def save
      # CONNECT TO DB
    db = PG.connect( { dbname: 'bounty', host: 'localhost'} )

    sql = "INSERT INTO bounty (bounty_name, danger_level, favourite_weapon, bounty_value) VALUES ($1, $2, $3, $4) RETURNING *"
    values = [@bounty_name, @danger_level, @favourite_weapon, @bounty_value]
    db.prepare( "save" ,sql)
    db.exec_prepared("save" , @id = values)[0]["id"].to_i

    db.close()
  end
end





# UPDATE






# DELETE
