

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
		
		return @start_date + duration * 60
		
	end

	def is_past?
		if @start_date < Time.now
			print true
		else
			print false
		end

	end

	def is_future?
		if @start_date > Time.now
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

  def age_analysis
    age_array = [] #On initialise un array qui va contenir les âges de tous les participants à un évènement
    average = 0 #On initialise une variable pour calculer la moyenne d'âge à l'évènement

    @attendees.each do |attendee| #On parcourt tous les participants (objets de type User)
      age_array << attendee.age #leur âge est stocké dans l'array des âges
      average = average + attendee.age #leur âge est additionné pour préparer le calcul de la moyenne
    end

    average = average / @attendees.length #on divise la somme des âges pour avoir la moyenne

    puts "Voici les âges des participants :"
    puts age_array.join(", ")
    puts "La moyenne d'âge est de #{average} ans"
  end

end

class WorkEvent < Event
  def is_event_acceptable?

    if @attendees.length > 3 || @duration > 60
      puts "Cette réunion ne respecte pas nos bonnes pratiques !"
      return false
    else
      puts "Cette réunion est OK."
      return true
    end
  end
end