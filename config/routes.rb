TictactoeWebsite::Application.routes.draw do

root :to => 'Tictactoe#game'
post 'tictactoe/player_moves', to: "tictactoe#player_moves", as: 'tictactoe_playermoves'
post 'tictactoe/new_game', to: "tictactoe#new_game", as: 'tictactoe_newgame'
   #get  '/tictactoe/playermoves', to: "Tictactoe#playermoves" ,as: 'tictactoe_playermoves'
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
