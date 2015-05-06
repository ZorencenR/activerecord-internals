$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'sqlite_adapter'
require 'empanada_record'
require 'product'
#require 'sqlite3'

# p "====find======"
# p Product.find(20)
# p "***********"
# p "====first====="
# p Product.first
# p "***********"
# p "====count======"
# p Product.count
# p "***********"
# p "====all======"
# p Product.all
# p "***********"
# p "====attributes======"
p Product.find_by_("name", "Portatil")
#p "***********"
#p "====attributes======"
#p Object.const_get("Product")
