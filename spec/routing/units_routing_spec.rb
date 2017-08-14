require "rails_helper"

RSpec.describe UnitsController, type: :routing do
  describe "routing units" do

    it "routes to #index" do
      expect(:get => "/unidades").to route_to("units#index")
    end

    it "routes to #new" do
      expect(:get => "/unidades/new").to route_to("units#new")
    end

    it "routes to #show" do
      expect(:get => "/unidades/1").to route_to("units#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/unidades/1/edit").to route_to("units#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/unidades").to route_to("units#create")
    end

    it "routes to #update" do
      expect(:put => "/unidades/1").to route_to("units#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/unidades/1").to route_to("units#destroy", :id => "1")
    end

  end
end