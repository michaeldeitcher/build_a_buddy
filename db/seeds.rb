# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'

  # MySQL and PostgreSQL
  # ActiveRecord::Base.connection.execute("TRUNCATE #{table}")

  # SQLite
  ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
end

def convertToCents(dollars)
  (dollars.to_d * 100).to_i
end

def capitalizeCSV csv
  csv.map {|line| line.map {|item| item.try :capitalize}}
end

csv = capitalizeCSV CSV.read("csv_import/Build a Buddy Data - Inventory.csv")
csv[2..].each do |line|
  stuffy = line[0..2]
  if stuffy[0].present?
    StuffedAnimal.create! description: stuffy[0], inventory: stuffy[1]
  end

  accessory = line[3..]
  if accessory[0].present?
    Accessory.create! description: accessory[0], size: accessory[1], inventory: accessory[2]
  end
end

csv = capitalizeCSV CSV.read("csv_import/Build a Buddy Data - Product Prices.csv")
csv[2..].each do |line|
  stuffy = line[0..3]
  if stuffy[0].present?
    product = StuffedAnimal.find_or_create_by!(description: stuffy[0])
    product.update_attributes! cost: convertToCents(stuffy[1]), sale_price: convertToCents(stuffy[2])
  end

  accessory = line[4..]
  if accessory[0].present?
    product = Accessory.find_or_create_by!(description: accessory[0], size: accessory[1])
    product.update_attributes! cost: convertToCents(accessory[2]), sale_price: convertToCents(accessory[3])
  end
end

csv = capitalizeCSV CSV.read("csv_import/Build a Buddy Data - Accessory Compatibility.csv")
accessory_sizes = csv[0][1..]
accessory_descriptions = csv[1][1..]
stuffies = csv[2..]
stuffies.each do |line|
  stuffy_description = line[0]
  accessories_supported = line[1..]
  accessories_supported.each_with_index do |supported, i|
    if supported.present?
      size = accessory_sizes[i] || accessory_sizes[i-1]
      stuffy = StuffedAnimal.find_or_create_by!(description: stuffy_description)
      stuffy.accessories << Accessory.find_or_create_by!(description: accessory_descriptions[i], size: size)
    end
  end
end

csv = capitalizeCSV CSV.read("csv_import/Build a Buddy Data - Purchase Orders.csv")
type_sizes = csv[0][2..]
descriptions = csv[1][2..]
orders = csv[2..]
orders.each do |line|
  order_datetime = DateTime.strptime line[0..1].join(' '), '%m/%d/%Y %I:%M:%S %p'
  purchase_order = PurchaseOrder.create purchased_at: order_datetime
  descriptions.each_with_index do |description, i|
    type_size = type_sizes[i] || type_sizes[i-1] || 'Stuffed animal'
    count = line[i+2].to_i
    while count > 0
      if(type_size == 'Stuffed animal')
        purchase_order.stuffed_animals << StuffedAnimal.where(description: description).first!
      else
        purchase_order.accessories << Accessory.where(description: description, size: type_size).first!
      end
      count -= 1
    end
  end
end