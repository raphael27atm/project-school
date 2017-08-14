require "rails_helper"

RSpec.describe MatriculationsController, type: :routing do
  describe "routing matriculations" do

    it "routes to #new" do
      expect(:get => "/turmas/1/matriculations/new").to route_to("matriculations#new", :team_id => "1")
    end

    it "routes to #create" do
      expect(:post => "/turmas/1/matriculations").to route_to("matriculations#create", :team_id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/turmas/1/matriculations/1").to route_to("matriculations#destroy", :team_id => "1", :id => "1")
    end

  end
end