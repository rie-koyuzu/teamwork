# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 店長アカウント
Admin.create!(
 [
	employee_number: '100000',
	password: '11111111',
	email: 'admin@1.com',
	last_name: '田中',
	first_name: '太郎'
 ]
)

Member.create!(
 [
  last_name: 'テスト',
  first_name: 'メンバー',
  last_name_eng: 'test',
  first_name_eng: 'member',
  employee_number: '1234',
  affiliation: '運営部',
  email: 'testmember@1.com',
  password: 'testmember'
 ]
)