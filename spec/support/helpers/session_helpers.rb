module Features
  module SessionHelpers
    def sign_in_user(user)
      login_as(user, :scope => :user)
      visit root_path
    end
  end
end