class SessionsView
    def ask_for_username
        puts "Username of employee?"
        print "> "
        gets.chomp
    end

    def ask_for_password
        puts "Password of employee?"
        print "> "
        gets.chomp
    end

    def wrong_credentials
        puts "Wrong credentials, try again"
    end
    
    def welcome(employee)
        puts "Welcome #{employee.username.capitalize}!"
    end
    
end