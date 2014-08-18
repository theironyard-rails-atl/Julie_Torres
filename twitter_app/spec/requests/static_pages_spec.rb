require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }
  end
end



describe "Static pages" do
 subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Twitter App') }
    it { should have_title("Ruby on Rails Tutorial Sample App") }
    it { should_not have_title('| Home') }
  end


  describe "Help page" do
    before { visit help_path }

    it { should have_content('Help') }
    it { should have_title("Ruby on Rails Tutorial Sample App | Help") }
  end

   describe "About page" do
     before { visit about_path }

     it {should have_content('About This App')}
     it {should have_title("Ruby on Rails Tutorial Sample App | About Us")}
  end

  describe "Contact page" do
    before { visit contact_path }

    it {should have_content('Contact')}
    it {should have_title("Ruby on Rails Tutorial Sample App | Contact")}
  end
end
