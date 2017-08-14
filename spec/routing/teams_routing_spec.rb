require "rails_helper"

RSpec.describe TeamsController, type: :routing do
  describe "routing teams" do

    it "routes to #index" do
      expect(:get => "/turmas").to route_to("teams#index")
    end

    it "routes to #new" do
      expect(:get => "/turmas/new").to route_to("teams#new")
    end

    it "routes to #show" do
      expect(:get => "/turmas/1").to route_to("teams#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/turmas/1/edit").to route_to("teams#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/turmas").to route_to("teams#create")
    end

    it "routes to #update" do
      expect(:put => "/turmas/1").to route_to("teams#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/turmas/1").to route_to("teams#destroy", :id => "1")
    end

  end
end