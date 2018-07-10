require('pry-byebug')
require_relative('model/bounty')

Bounty.delete_all()

bounty1 = Bounty.new(
{'bounty_name' => 'Jack Sparrow', 'danger_level' => 'low', 'favourite_weapon' => 'sword', 'bounty_value' => '50'}
)

bounty2 = Bounty.new(
{'bounty_name' => 'Senor Bob', 'danger_level' => 'high', 'favourite_weapon' => 'gun', 'bounty_value' => '120'}
)

bounty3 = Bounty.new(
{'bounty_name' => 'Doctor Evil', 'danger_level' => 'med', 'favourite_weapon' => 'lazer eyes', 'bounty_value' => '95'}
)

bounty1.save()
bounty2.save()
bounty3.save()

bounty1.bounty_name = 'Jock Sparrow'
bounty1.update()


bounty1.delete()




all_bountys = Bounty.all()
p all_bountys
