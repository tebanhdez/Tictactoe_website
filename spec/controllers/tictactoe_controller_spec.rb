require 'Tictactoe'
require 'spec_helper'

describe TictactoeController do
  context "#player_moves" do
    it "renders game" do
      post :player_moves, position: 1
      response.should render_template(:game)
    end
  end
#begin
#  context "#new" do
#    it "assigns game" do
#      get :game
#      assigns[:game].should be_instance_of(Tictactoe)
#    end
#  end
#end
end
