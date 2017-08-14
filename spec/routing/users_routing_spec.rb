require "rails_helper"

RSpec.describe UsersController, type: :routing do
  describe "routing users" do

    it "routes to #index" do
      expect(:get => "/usuarios").to route_to("users#index")
    end

    it "routes to #new" do
      expect(:get => "/usuarios/new").to route_to("users#new")
    end

    it "routes to #show" do
      expect(:get => "/usuarios/1").to route_to("users#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/usuarios/1/edit").to route_to("users#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/usuarios").to route_to("users#create")
    end

    it "routes to #update" do
      expect(:put => "/usuarios/1").to route_to("users#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/usuarios/1").to route_to("users#destroy", :id => "1")
    end

  end
end