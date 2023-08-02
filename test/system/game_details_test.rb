require "application_system_test_case"

class GameDetailsTest < ApplicationSystemTestCase
  setup do
    @game_detail = game_details(:one)
  end

  test "visiting the index" do
    visit game_details_url
    assert_selector "h1", text: "Game details"
  end

  test "should create game detail" do
    visit game_details_url
    click_on "New game detail"

    fill_in "Description", with: @game_detail.description
    fill_in "Game", with: @game_detail.game_id
    fill_in "Game time", with: @game_detail.game_time
    click_on "Create Game detail"

    assert_text "Game detail was successfully created"
    click_on "Back"
  end

  test "should update Game detail" do
    visit game_detail_url(@game_detail)
    click_on "Edit this game detail", match: :first

    fill_in "Description", with: @game_detail.description
    fill_in "Game", with: @game_detail.game_id
    fill_in "Game time", with: @game_detail.game_time
    click_on "Update Game detail"

    assert_text "Game detail was successfully updated"
    click_on "Back"
  end

  test "should destroy Game detail" do
    visit game_detail_url(@game_detail)
    click_on "Destroy this game detail", match: :first

    assert_text "Game detail was successfully destroyed"
  end
end
