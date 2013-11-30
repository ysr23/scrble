require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  setup do
    @game = games(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:games)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game" do
    assert_difference('Game.count') do
      post :create, game: { date_played: @game.date_played, draw: @game.draw, location: @game.location, loser: @game.loser, p1_score: @game.p1_score, p2_score: @game.p2_score, player1: @game.player1, player2: @game.player2, winner: @game.winner }
    end

    assert_redirected_to game_path(assigns(:game))
  end

  test "should show game" do
    get :show, id: @game
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @game
    assert_response :success
  end

  test "should update game" do
    put :update, id: @game, game: { date_played: @game.date_played, draw: @game.draw, location: @game.location, loser: @game.loser, p1_score: @game.p1_score, p2_score: @game.p2_score, player1: @game.player1, player2: @game.player2, winner: @game.winner }
    assert_redirected_to game_path(assigns(:game))
  end

  test "should destroy game" do
    assert_difference('Game.count', -1) do
      delete :destroy, id: @game
    end

    assert_redirected_to games_path
  end
end
