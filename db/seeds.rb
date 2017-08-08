@teachers = []

@unit_primary = []
@unit_baby = []
@unit_south = []
@unit_center = []

@students_primary = []
@students_baby = []
@students_south = []
@students_center = []

@teams_primary = []
@teams_baby = []
@teams_south = []
@teams_center = []

@responsibles = []

@matriculations = []

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

# > Unit

@unit_primary << Unit.create(
  name: "Principal",
  school_id: @school.id
)
puts " Added Unit #{@unit_primary[2]}"

@unit_baby << Unit.create(
  name: "Unidade Baby",
  school_id: @school.id
)
puts " Added Unit #{@unit_baby[2]}"

@unit_south << Unit.create(
  name: "Unidade Sul",
  school_id: @school.id
)
puts " Added Unit #{@unit_south[2]}"

@unit_center << Unit.create(
  name: "Unidade Centro",
  school_id: @school.id
)
puts " Added Unit #{@unit_center[2]}"

# > Teams

# teams Primmary
13.times do |n|
  @teams_primary << Team.create(
    name: "Turma #{n}",
    unit_id: @unit_primary.sample.id
  )
  puts " Added Team #{n}"
end

# teams Baby
2.times do |n|
  @teams_baby << Team.create(
    name: "Turma #{n}",
    unit_id: @unit_baby.sample.id
  )
  puts " Added Team #{n}"
end

# teams South
10.times do |n|
  @teams_south << Team.create(
    name: "Turma #{n}",
    unit_id: @unit_south.sample.id
  )
  puts " Added Team #{n}"
end

# teams Center
5.times do |n|
  @teams_south << Team.create(
    name: "Turma #{n}",
    unit_id: @unit_center.sample.id
  )
  puts " Added Team #{n}"
end

# Teachers Center
5.times do |n|
  @teachers << Teacher.create(
    name: Faker::Name.unique.name,
    unit_id: @unit_center.sample.id
  )
  puts " Added Teacher #{n}"
end

# Teachers Primary
23.times do |n|
  @teachers << Teacher.create(
    name: Faker::Name.unique.name,
    unit_id: @unit_primary.sample.id
  )
  puts " Added Teacher #{n}"
end

# Teachers Baby
5.times do |n|
  @teachers << Teacher.create(
    name: Faker::Name.unique.name,
    unit_id: @unit_baby.sample.id
  )
  puts " Added Teacher #{n}"
end

# Teachers South
20.times do |n|
  @teachers << Teacher.create(
    name: Faker::Name.unique.name,
    unit_id: @unit_south.sample.id
  )
  puts " Added Teacher #{n}"
end

# > Student

# Students Primary
250.times do |n|
  @students_primary << Student.create(
    name: Faker::Name.unique.name,
    age: 10,
    phone: Faker::PhoneNumber.phone_number,
    unit_id: @unit_primary.sample.id
  )
  puts " Added Student #{n}"
end

# Students Babey
15.times do |n|
  @students_baby<< Student.create(
    name: Faker::Name.unique.name,
    age: 5,
    phone: Faker::PhoneNumber.phone_number,
    unit_id: @unit_baby.sample.id
  )
  puts " Added Student #{n}"
end

# Students South
50.times do |n|
  @students_south << Student.create(
    name: Faker::Name.unique.name,
    age: 15,
    phone: Faker::PhoneNumber.phone_number,
    unit_id: @unit_south.sample.id
  )
  puts " Added Student #{n}"
end

# Students Center
40.times do |n|
  @students_center << Student.create(
    name: Faker::Name.unique.name,
    age: 15,
    phone: Faker::PhoneNumber.phone_number,
    unit_id: @unit_center.sample.id
  )
  puts " Added Student #{n}"
end

# Responsible primary
500.times do |n|
  @responsibles << Responsible.create(
    name: Faker::Name.unique.name,
    student_id: @students_primary.sample.id
  )
  puts " Added Responsible #{n}"
end

# Responsible baby
30.times do |n|
  @responsibles << Responsible.create(
    name: Faker::Name.unique.name,
    student_id: @students_baby.sample.id
  )
  puts " Added Responsible #{n}"
end

# Responsible south
100.times do |n|
  @responsibles << Responsible.create(
    name: Faker::Name.unique.name,
    student_id: @students_south.sample.id
  )
  puts " Added Responsible #{n}"
end

# Responsible center
80.times do |n|
  @responsibles << Responsible.create(
    name: Faker::Name.unique.name,
    student_id: @students_center.sample.id
  )
  puts " Added Responsible #{n}"
end

# Matriculation Prymary
100.times do |n|
  @matriculations << Matriculation.create(
    number: Faker::Number.number(10),
    student_id: @students_primary.sample.id,
    team_id: @teams_primary.sample.id
  )
  puts " Added Matriculation #{n}"
end

# Matriculation Baby
50.times do |n|
  @matriculations << Matriculation.create(
    number: Faker::Number.number(10),
    student_id: @students_baby.sample.id,
    team_id: @teams_baby.sample.id
  )
  puts " Added Matriculation #{n}"
end

# Matriculation South
50.times do |n|
  @matriculations << Matriculation.create(
    number: Faker::Number.number(10),
    student_id: @students_south.sample.id,
    team_id: @teams_south.sample.id
  )
  puts " Added Matriculation #{n}"
end
