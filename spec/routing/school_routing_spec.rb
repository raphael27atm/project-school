require "rails_helper"

RSpec.describe SchoolsController, type: :routing do
  describe "routing schools" do

    it "routes to #index" do
      expect(:get => "/escolas").to route_to("schools#index")
    end

    it "routes to #new" do
      expect(:get => "/escolas/new").to route_to("schools#new")
    end

    it "routes to #show" do
      expect(:get => "/escolas/1").to route_to("schools#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/escolas/1/edit").to route_to("schools#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/escolas").to route_to("schools#create")
    end

    it "routes to #update" do
      expect(:put => "/escolas/1").to route_to("schools#update", :id => "1")
    end

  end
end