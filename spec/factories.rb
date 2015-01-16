FactoryGirl.define do
	factory :student do
		last_name "Student"
		first_name "Sally"
		sequence(:email) { |n| "person#{n}@example.com"}
		password "password"
		password_confirmation "password"
		type "Student"
	end

	factory :admin, aliases: [:club_admin, :account] do
		last_name "Admin"
		first_name "Sally"
		sequence(:email) {|n| "admin#{n}@example.com"}
		password "password"
		password_confirmation "password"
		type "Admin"
	end

	factory :admin_detail do
		association :account, factory: :admin
		position "President"
		phone "0412345678"
	end

	factory :club do
		association :club_admin, factory: :admin
		name "Example Club"
		description "The example club is an example of a club that might participate in Club-Biz."
		url "http://exampleclub.com"
		logo "image.jpeg"
	end

end
