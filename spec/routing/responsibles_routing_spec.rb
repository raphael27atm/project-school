require "rails_helper"

RSpec.describe ResponsiblesController, type: :routing do
  describe "routing responsibles" do

    it "routes to #index" do
      expect(:get => "/responsaveis").to route_to("responsibles#index")
    end

    it "routes to #new" do
      expect(:get => "/responsaveis/new").to route_to("responsibles#new")
    end

    it "routes to #show" do
      expect(:get => "/responsaveis/1").to route_to("responsibles#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/responsaveis/1/edit").to route_to("responsibles#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/responsaveis").to route_to("responsibles#create")
    end

    it "routes to #update" do
      expect(:put => "/responsaveis/1").to route_to("responsibles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/responsaveis/1").to route_to("responsibles#destroy", :id => "1")
    end

  end
end