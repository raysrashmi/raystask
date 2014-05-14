Task.destroy_all
(1..5).to_a.each do |i|
  Task.create(title: "Task-#{i}")
end
