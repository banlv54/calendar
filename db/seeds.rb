# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ToDo.delete_all
time_now = Time.now
20.times do |n|
  status = ToDo.statuses.keys.sample
  start_time = time_now + (n*30).minutes
  ToDo.create(title: "Title #{n}", status: status,
    content: "This is a content for todo #{n} - Demo for calendar. \n Made by Le Van Ban",
    start_time: start_time, end_time: start_time + 30.minutes)
end
