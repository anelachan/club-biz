require 'spec_helper'


describe "Static pages" do

  subject {page}

  describe "Home page" do

  	before {visit root_path}

  	it {should have_content('Welcome to Club-Biz!')}
  	it {should have_title('Club-Biz')}
  	it {should have_link('Sign in',href: signin_path)}
  	it {should have_link('Sign up',href: signup_path)}
  	it {should have_link('Want to sign up as a club? Register your club with Club-Biz', href: new_verification_path)}

  	describe "for signed-in students" do

  		let(:student) {FactoryGirl.create(:student)}
		before {sign_in student}

	  	it {should have_link('Browse Events',href: events_path)}
	  	it {should have_link('Browse Clubs',href: clubs_path)}
	  	it {should have_link('My Events',href: events_student_path(student))}
	  	it {should have_link('My Clubs',href: clubs_student_path(student))}
	  	it {should have_link('Messages',href: messages_student_path(student))}
	  	it {should have_link('Sign out',href: signout_path)}

	  	it {should_not have_link('Create event',href: new_event_path)}
	  	it {should_not have_link('Events',href:events_admin_path(student))}
	  	it {should_not have_link('Club profile',href:edit_club_path(student))}
	  
	end

	describe "for signed-in admins" do

		let(:admin){FactoryGirl.create(:admin)}
		let(:club){FactoryGirl.create(:club)}
		let(:admin_detail){FactoryGirl.create(:admin_detail)}

		before {sign_in admin}

		it {should have_link('Create Event', href: new_event_path)}
		it {should have_link('Events', href:events_admin_path(admin))}
		it {should have_link('Club Profile', href:edit_club_path(club))}
		it {should have_link('Sign out',href: signout_path)}

		it {should_not have_link('Browse Events',href: events_path)}
	  	it {should_not have_link('Browse Clubs',href: clubs_path)}
	  	it {should_not have_link('My Events',href: events_student_path(admin))}
	  	it {should_not have_link('My Clubs',href: clubs_student_path(admin))}
	  	it {should_not have_link('Messages',href: messages_student_path(admin))}

	end


  end

end
