# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: "admin@test.com", password: "password")

owner_employees_attributes = [
    { name: "owner_1", email: "owner_1@test.com", password: "password", store_admin: true, phone_number: "000-000-0000" },
    { name: "owner_2", email: "owner_2@test.com", password: "password", store_admin: true, phone_number: "000-000-0000" },
    { name: "owner_3", email: "owner_3@test.com", password: "password", store_admin: true, phone_number: "000-000-0000" },
  ]

stores_attributes = [
    { name: "イタリアン名古屋", address: "i_nagoya@test.city", phone: "000-000-0000" },
    { name: "居酒屋みやこ", address: "miyako@test.city", phone: "000-000-0000" },
    { name: "スナック煌", address: "kirameki@test.city", phone: "000-000-0000" }
  ]

      # t.string :url, null:false
      # t.string :phone_number, null:false
      # t.string :name, null:false
store_vendors_attributes = [
    [
      { vendor_name: "ミート大国", url: "https://test.meat.com", phone: "111-111-1111", name: "yamada" },
      { vendor_name: "魚王国", url: "https://test.fish.com", phone: "111-111-1111", name: "suzuki" },
      { vendor_name: "野菜農園", url: "https://test.vegetable.com", phone: "111-111-1111", name: "satou" }
    ],
    [
      { vendor_name: "ドリンク都", url: "https://test.drink.com", phone: "111-111-1111", name: "tanaka" },
      { vendor_name: "オール食材", url: "https://test.all.com", phone: "111-111-1111", name: "sugimoto" }
    ],
    [
      { vendor_name: "何でも屋", url: "https://test.anything.com", phone: "111-111-1111", name: "kimura" }
    ],
  ]
  
staff_employees_attributes = [
  [
    { name: "亀田光輝", email: "kameda@test.com", password: "password", phone_number: "000-000-0000" },
    { name: "目黒加奈", email: "meguro@test.com", password: "password", phone_number: "000-000-0000" },
    { name: "山田莉子", email: "yamada@test.com", password: "password", phone_number: "000-000-0000" }
  ],
  [
    { name: "佐藤美紀", email: "saitou@test.com", password: "password", phone_number: "000-000-0000" },
    { name: "川口大輝", email: "kawaguti@test.com", password: "password", phone_number: "000-000-0000" }
  ],
  [
    { name: "後藤正樹", email: "gotou@test.com", password: "password", phone_number: "000-000-0000" }
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

