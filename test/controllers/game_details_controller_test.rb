require "test_helper"

class GameDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_detail = game_details(:one)
  end

  test "should get index" do
    get game_details_url
    assert_response :success
  end

  test "should get new" do
    get new_game_detail_url
    assert_response :success
  end

  test "should create game_detail" do
    assert_difference("GameDetail.count") do
      post game_details_url, params: { game_detail: { description: @game_detail.description, game_id: @game_detail.game_id, game_time: @game_detail.game_time } }
    end

    assert_redirected_to game_detail_url(GameDetail.last)
  end

  test "should show game_detail" do
    get game_detail_url(@game_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_detail_url(@game_detail)
    assert_response :success
  end

  test "should update game_detail" do
    patch game_detail_url(@game_detail), params: { game_detail: { description: @game_detail.description, game_id: @game_detail.game_id, game_time: @game_detail.game_time } }
    assert_redirected_to game_detail_url(@game_detail)
  end

  test "should destroy game_detail" do
    assert_difference("GameDetail.count", -1) do
      delete game_detail_url(@game_detail)
    end

    assert_redirected_to game_details_url
  end
end
