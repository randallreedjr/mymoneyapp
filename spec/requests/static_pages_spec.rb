require 'spec_helper'

describe "Static pages" do
	
	subject { page }

	shared_examples_for "all static pages" do
		it { should have_selector('h1', text: heading) }
    	it { should have_selector('title', text: full_title(page_title)) }
    end

	describe "Home page" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit root_path }

		let(:heading) { 'Money Garden'}
		let(:page_title) { '' }

		it_should_behave_like "all static pages"
    	it { should_not have_selector 'title', text: '| Home' }
    	it { should_not have_link 'Profile', href: user_path(user) }
    	it { should_not have_link 'Settings', href: edit_user_path(user) }
  	end



	describe "Help page" do
		before { visit help_path }
		let(:heading) { 'Help' }
		let(:page_title) { 'Help' }
		it_should_behave_like "all static pages"
	end

	describe "About page" do
		before { visit about_path }
		let(:heading) { 'About Us' }
		let(:page_title) { 'About' }
		it_should_behave_like "all static pages"
	end

	describe "Contact page" do
		before { visit contact_path }
		let(:heading) { 'Contact Us' }
		let(:page_title) { 'Contact' }
		it_should_behave_like "all static pages"
	end

	it "should have the right links on the layout" do
		visit root_path
		
		click_link "About"
		page.should have_selector 'title', text: full_title('About')

		click_link "Help"
		page.should have_selector 'title', text: full_title('Help')

		click_link "Contact"
		page.should have_selector 'title', text: full_title('Contact')

		click_link "Home"
		click_link "Sign up now!"
		page.should have_selector 'title', text: full_title('Sign up')
	end

end