$teachers = []
$students = []
$units = []
$teams = []
$responsibles = []

# roles
['banned', 'moderator', 'admin'].each do |role|
  Role.find_or_create_by({name: role})
end

# School
@school = School.create(
  name: "Escola 01"
)
puts "Added #{@school.name}"

# Admin
@admin = User.create(
  name: "Marlon Raphael", 
  email: "admin@school.com.br", 
  password: "school", 
  password_confirmation: "school",
  role_id: 2,
  school_id: @school.id)

puts "Added #{@admin.email}"

# moderator  
@moderator = User.create(
  name: "Marlon Raphael", 
  email: "moderator@school.com.br", 
  password: "school", 
  password_confirmation: "school", 
  role_id: 3,
  school_id: @school.id)

puts "Added #{@moderator.email}"

# Unit
4.times do |n|
  $units << Unit.create(
    name: "Unidade #{n}",
    school_id: @school.id
  )
  puts " Added Unit #{n}"
end

# teams
40.times do |n|
  $teams << Team.create(
    name: "Turma #{n}",
    unit_id: $units.sample.id
  )
  puts " Added Team #{n}"
end

# Students
300.times do |n|
  $students << Student.create(
    name: Faker::Name.unique.name,
    age: [10..18].sample,
    phone: Faker::PhoneNumber.phone_number,
    unit_id: $units.sample.id
  )
  puts " Added Student #{n}"
end

# Teachers
50.times do |n|
  $teachers << Teacher.create(
    name: Faker::Name.unique.name,
    unit_id: $units.sample.id
  )
  puts " Added Teacher #{n}"
end

# Responsible
80.times do |n|
  $responsibles << Responsible.create(
    name: Faker::Name.unique.name,
    student_id: $students.sample.id
  )
  puts " Added Responsible #{n}"
end

# Matriculation
50.times do |n|
  Matriculation.create(
    number: Faker::Number.number(10),
    student_id: $students.sample.id,
    team_id: $teams.sample.id
  )
  puts " Added Matriculation #{n}"
end