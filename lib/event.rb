

class Event
	attr_accessor :start_date, :duration, :title
	

	def initialize(start_date_event,duration_event,title_event,attendees_event)
		@start_date = Time.parse(start_date_event)
		@duration = duration_event.to_i
		@title = title_event
		@attendees = attendees_event

	end

	def postpone_24h
		@start_date = @start_date + 60 * 60 * 24
		
	end

	def end_date
		@final_date = Time.new
		@final_date = @start_date + duration * 60
		if @final_date < Time.now
			return true
		else
			return false
		end
	end

	def is_past?
		if @final_date < Time.now
			print true
		else
			print false
		end

	end

	def is_future?
		if @final_date > Time.now
			print true
		else
			print false
		end
			
	end

	def is_soon 
    	if @start_date < Time.now + 60 * 30
      	print "The event is comign soon"
   		else  
      	print "Event is in 30minutes"
      end

    end


  def to_s
    puts " "
    puts "Titre : #{@title} "
    puts "Date de début : #{@start_date}"
    puts "Durée : #{@duration} minutes"
    puts "Invités : #{@attendees.join(", ")}"
  end

end