require "rails_helper"

RSpec.describe StudentsController, type: :routing do
  describe "routing students" do

    it "routes to #index" do
      expect(:get => "/estudantes").to route_to("students#index")
    end

    it "routes to #new" do
      expect(:get => "/estudantes/new").to route_to("students#new")
    end

    it "routes to #show" do
      expect(:get => "/estudantes/1").to route_to("students#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/estudantes/1/edit").to route_to("students#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/estudantes").to route_to("students#create")
    end

    it "routes to #update" do
      expect(:put => "/estudantes/1").to route_to("students#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/estudantes/1").to route_to("students#destroy", :id => "1")
    end

  end
end