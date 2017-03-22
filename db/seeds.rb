today = Date.today
two_days_ago = Date.today - 2.days
three_days_ago = Date.today - 3.days
dates = [today, two_days_ago, three_days_ago]

User.destroy_all
puts "Users Deleted..."
TodoList.destroy_all
puts "TodoLists Deleted..."

puts "Creating 100 TodoLists..."
100.times { |index| TodoList.create! list_name: "List #{index}", list_due_date: dates.sample }

puts "Creating todoitems..."
TodoList.all.each do |list|
  list.todo_items.create! [
    { title: "Task 1", due_date: dates.sample, description: "very important task TEST", completed: false },
    { title: "Task 2", due_date: dates.sample, description: "do something else TEST", completed: true},
    { title: "Task 3", due_date: dates.sample, description: "learn Action Pack TEST", completed: true}
  ]
end

puts "Creating Users..."
users = User.create! [
  { username: "jim", password: "abc123" },
  { username: "rich", password: "123abc" }
]
puts "Users created!"

puts "Seeds OK!"

TodoList.all.each do |list|
  list.user = users.sample
  list.save!
end