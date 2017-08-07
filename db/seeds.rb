# roles
['banned', 'moderator', 'admin'].each do |role|
  Role.find_or_create_by({name: role})
end

# Admin
User.create(
  name: "Marlon Raphael", 
  email: "admin@school.com.br", 
  password: "school", 
  password_confirmation: "school")

# moderator  
User.create(
  name: "Marlon Raphael", 
  email: "moderator@school.com.br", 
  password: "school", 
  password_confirmation: "school")


# School

# Unit

# Students

# Teachers

# Responsible