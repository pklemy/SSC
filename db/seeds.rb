# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: "admin@test.com", password: "password")

owner_employees_attributes = [
    { name: "owner_1", email: "owner_1@test.com", password: "password", store_admin: true },
    { name: "owner_2", email: "owner_2@test.com", password: "password", store_admin: true },
    { name: "owner_3", email: "owner_3@test.com", password: "password", store_admin: true },
  ]

stores_attributes = [
    { name: "store_1", address: "store_1_city", phone: "000-000-0000" },
    { name: "store_2", address: "store_2_city", phone: "000-000-0000" },
    { name: "store_3", address: "store_3_city", phone: "000-000-0000" }
  ]

      # t.string :url, null:false
      # t.string :phone_number, null:false
      # t.string :name, null:false
store_vendors_attributes = [
    [
      { vendor_name: "vendor_A", url: "https://test.testA.com", phone: "111-111-1111", name: "yamada" },
      { vendor_name: "vendor_B", url: "https://test.testB.com", phone: "111-111-1111", name: "suzuki" },
      { vendor_name: "vendor_C", url: "https://test.testC.com", phone: "111-111-1111", name: "satou" }
    ],
    [
      { vendor_name: "vendor_D", url: "https://test.testD.com", phone: "111-111-1111", name: "tanaka" },
      { vendor_name: "vendor_E", url: "https://test.testE.com", phone: "111-111-1111", name: "sugimoto" }
    ],
    [
      { vendor_name: "vendor_F", url: "https://test.testF.com", phone: "111-111-1111", name: "kimura" }
    ],
  ]
  
staff_employees_attributes = [
  [
    { name: "staff_1", email: "staff_1@test.com", password: "password" },
    { name: "staff_2", email: "staff_2@test.com", password: "password" },
    { name: "staff_3", email: "staff_3@test.com", password: "password" }
  ],
  [
    { name: "staff_4", email: "staff_4@test.com", password: "password" },
    { name: "staff_5", email: "staff_5@test.com", password: "password" }
  ],
  [
    { name: "staff_6", email: "staff_6@test.com", password: "password" }
  ],
]
  
owner_employees_attributes.each_with_index do |employee_attributes, i|
  employee = Employee.create!(employee_attributes)
  
  employee.stores.create!(stores_attributes[i])
  
  vendors_attributes = store_vendors_attributes[i]
  vendors_attributes.each do |vendor_attributes|
    employee.stores.first.vendors.create!(vendor_attributes)
  end
  
  staff_employee_attributes = staff_employees_attributes[i]
  staff_employee_attributes.each do |employee_attributes|
    staff_employee = Employee.create!(employee_attributes)
    employee.stores.first.employee_stores.create!(employee_id: staff_employee.id)
  end
end

