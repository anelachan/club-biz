module ClubsHelper

def set_search
      
    club_name = params[:search_data]
    
    @clubs = [];
    
    #Make sure something was entered into search bar. 
    if club_name
          
          #populate array of clubs that contain substring given by club_name
          Club.all.each do |club|
                
          if( club.match_substring?( club_name ) )
                @clubs << club
          end
          
            end
   
          
          if @clubs.empty?
                flash.now[:error] = "No results found"
                @clubs = Club.all
          end
    else
          #Nothing was typed in search bar.
          @clubs = Club.all
    end
    
  end

end