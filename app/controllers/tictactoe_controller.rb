require 'Tictactoe'
class TictactoeController < ApplicationController
  @winner = false
  @board_full = false
  before_filter :set_game
  def set_game 
    session[:game] = Tictactoe.new if session[:game].nil?
    session[:winner] = false if session[:winner].nil?
    @game = session[:game]
    session[:human_symbol] = "X" if session[:human_symbol].nil?
    session[:current_player] = "HU" if session[:current_player].nil?
    @winner = session[:winner]
  end

  def game
    @winner = session[:winner]
    session[:game] = Tictactoe.new
  end

  def new_game
    session[:game] = Tictactoe.new
    session[:winner] = false
    @winner = session[:winner]
    @game = session[:game]
    render :game
  end

  def player_moves
    p "PLAYER MOVES"
    if session[:current_player] == "HU" then
      if ( @game.playerMoves( Integer(params[:row]) ,Integer(params[:column]),"X") ) then
        session[:current_player] = "IA"
        winner(Integer(params[:row]),Integer(params[:column]),"X")
      end
    elsif ( @game.playerMoves( Integer(params[:row]) , Integer(params[:column]),"O")) then
      #game.IAMoves("O")
      session[:current_player] = "HU"
      winner(Integer(params[:row]),Integer(params[:column]),"O")
    end
    session[:game] = @game
    p "<<<<CURRENT BOARD>>>>"
    @game.printboard()
    @board_full = @game.isBoardFull()
    render :game
  end

  def winner(row, column,symbol)
    p "Checking winner...."
    if( @game.isAWinner(row, column,symbol))
      p "Player "<< symbol << " wins in positions: " << row << ", " << column
     @winner = true
      session[:winner] = true
    end
  end

  private

  def board_game
    @game ||= Tictactoe.new
    p "#" * 30
    @game.printboard
    p "#" * 30
  end
end
