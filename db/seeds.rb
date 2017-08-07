# roles
['banned', 'moderator', 'admin'].each do |role|
  Role.find_or_create_by({name: role})
end

# School
@school = School.create(
  name: "Escola 01"
)

# Admin
User.create(
  name: "Marlon Raphael", 
  email: "admin@school.com.br", 
  password: "school", 
  password_confirmation: "school",
  school_id: @school.id)

# moderator  
User.create(
  name: "Marlon Raphael", 
  email: "moderator@school.com.br", 
  password: "school", 
  password_confirmation: "school", 
  school_id: @school.id)


# School

# Unit

# Students

# Teachers

# Responsible