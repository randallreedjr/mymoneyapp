require 'spec_helper'

describe "Static pages" do

	let(:base_title) { "Money Garden" }

	describe "Home page" do
		it "should have the h1 'Money Garden'" do
			visit root_path
			page.should have_selector('h1', :text => 'Money Garden')
    	end

    	it "should have the base title" do
    		visit root_path
    		page.should have_selector('title', 
    			:text => "Money Garden")
    	end

    	it "should not have a custom page title" do
    		visit root_path
    		page.should_not have_selector('title', 
    			:text => "| Home")
    	end
  	end


	describe "Help page" do

		it "should have the h1 'Help'" do
			visit help_path
			page.should have_selector('h1', :text => 'Help')
		end

		it "should have the right title" do
			visit help_path
			page.should have_selector('title', 
				:text => "#{base_title} | Help")
		end
	end

	describe "About page" do
		it "should have the h1 'About Us'" do
			visit about_path
			page.should have_selector('h1', :text => 'About Us')
		end

		it "should have the right title" do
			visit about_path
			page.should have_selector('title', 
				:text => "#{base_title} | About")
		end
	end

	describe "Contact page" do
		it "should have the h1 'Contact Us'" do
			visit contact_path
			page.should have_selector('h1', :text => 'Contact Us')
		end

		it "should have the right title" do
			visit contact_path
			page.should have_selector('title', 
				:text => "#{base_title} | Contact")
		end
	end
end