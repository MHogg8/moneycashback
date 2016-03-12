require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/transaction')

require ('pry-byebug')

Transaction.delete_all
Merchant.delete_all
Tag.delete_all

merchant1 = Merchant.new({'name' => 'Aldi'})
merchant2 = Merchant.new({'name' => 'Nespresso'})
merchant3 = Merchant.new({'name' => 'Great Grog'})

new_merchant1 = merchant1.save
new_merchant2 = merchant2.save
new_merchant3 = merchant3.save


tag1 = Tag.new({'name' => 'Food'})
tag2 = Tag.new({'name' => 'Gifts'})
tag3 = Tag.new({'name' => 'Utilities'})
tag4 = Tag.new({'name' => 'Childcare'})
tag5 = Tag.new({'name' => 'Luxury'})

new_tag1 = tag1.save
new_tag2 = tag2.save
new_tag3 = tag3.save
new_tag4 = tag4.save
new_tag5 = tag5.save


transaction1 = Transaction.new({'amount' => 32.00, 'day' => '12-March-16','description' => 'Friday tea', 'merchant_id' => new_merchant1.id, 'tag_id' => new_tag1.id })
transaction2 = Transaction.new({'amount' => 48.00, 'day' => '11-March-16','description' => 'Good Coffee', 'merchant_id' => new_merchant2.id, 'tag_id' => new_tag5.id })
transaction3= Transaction.new({'amount' => 76.00, 'day' => '11-March-16','description' => 'Beer', 'merchant_id' => new_merchant3.id, 'tag_id' => new_tag2.id })

transaction1.save
transaction2.save
transaction3.save

binding.pry
nil