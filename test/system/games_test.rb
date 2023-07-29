require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  setup do
    @game = games(:one)
  end

  test "visiting the index" do
    visit games_url
    assert_selector "h1", text: "Games"
  end

  test "should create game" do
    visit games_url
    click_on "New game"

    fill_in "Description", with: @game.description
    fill_in "Lose team", with: @game.lose_team
    fill_in "User", with: @game.user_id
    fill_in "Winning team", with: @game.winning_team
    click_on "Create Game"

    assert_text "Game was successfully created"
    click_on "Back"
  end

  test "should update Game" do
    visit game_url(@game)
    click_on "Edit this game", match: :first

    fill_in "Description", with: @game.description
    fill_in "Lose team", with: @game.lose_team
    fill_in "User", with: @game.user_id
    fill_in "Winning team", with: @game.winning_team
    click_on "Update Game"

    assert_text "Game was successfully updated"
    click_on "Back"
  end

  test "should destroy Game" do
    visit game_url(@game)
    click_on "Destroy this game", match: :first

    assert_text "Game was successfully destroyed"
  end
end
