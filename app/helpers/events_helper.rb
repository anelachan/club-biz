module EventsHelper

 #find events based on club's name. This method can be private.
  def events_by_club_name( clubs )
  	  
  	  clubs_id = [];
  	  events = [];
  	  
  	  if clubs
  	  	  clubs.each {|club| clubs_id << club.id}
  	  	  clubs_id.each {|i| events.concat(Event.where(club_id: i))}
  	  end
  	  
  	  return events;
  end
  
  #returns array of events that match a substring input to the method. This can be private
  def match_events( string )
  	ret_event = [];
  	Event.all.each do |event|
  	  if( event.match_substring?( string ) )
  	  	ret_event << event;
  	  end
  	end
  	return ret_event;
  end  


  def set_search
  	  
  	  #grab search parameter for searching
  	  search = params[:search_data]
  	  searchByName = params[:search_by_name]
  	  searchByClub = params[:search_by_club]
  	  clubs_name = []
  	  clubs_id = []
  	  @events = []
  	  
  	  #make sure @search is not nil
  	  if !search
  	  	  search = ""
  	  end
  	  
  	  #Search by both club and event name. Default(when no field is selected)
  	  #will be search by both fields.
  	  if (searchByName && searchByClub) || !(searchByName && searchByClub)
  	  	  
  	  	  #search events by both club and event name
  	  	  @events = match_events( search.to_s )
  	  	  clubs_name = ClubsController.new.match_clubs( search.to_s )
  	  	  @events.concat( events_by_club_name(clubs_name) )
  	  	  
  	  elsif searchByClub
  	  	  
  	  	  #Search events via club name
  	  	  clubs_name = ClubsController.new.match_clubs( search.to_s )
  	  	  @events = events_by_club_name( clubs_name )
  	  	  
  	  elsif searchByName
  	  	  
  	  	  #search events by event name.
  	  	  @events = match_events( search.to_s )
  	  	  
  	  end
  	  
  	  #No events were found, then display all events and an error.
  	  if @events.empty?
  	  	  flash.now[:error] = "No results found"
  	  	  @events = Event.all
  	  else
          @events.uniq!
      end
  end


end