# roles
['banned', 'moderator', 'admin'].each do |role|
  Role.find_or_create_by({name: role})
end

# Admin
User.create({
  name: "Marlon Raphael", 
  email: "admin@school.com.br", 
  passwaord: "school", 
  passwaord_confirmation: "school",
  role: "admin"})

# moderator  
User.create({
  name: "Marlon Raphael", 
  email: "moderator@school.com.br", 
  passwaord: "school", 
  passwaord_confirmation: "school",
  role: "moderator"})


# School

# Unit

# Students

# Teachers

# Responsible