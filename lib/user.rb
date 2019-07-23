
class User
	attr_accessor :email
	attr_accessor :age
	@@all_users = []

	def initialize(email_to_save, age_to_save)


    @email = email_to_save
   	@age = age_to_save.to_i

   	@@all_users << self
	   	
  end

  def self.find_by_email(email_to_enter)
  	@@all_users.each do |user|
  		return user if user.email == email_to_enter
  	end

  	puts "Mail not exist"

  end

 	

  	def self.all
  		return @@all_users
  	end

end

user = User.new(@email,@age)

