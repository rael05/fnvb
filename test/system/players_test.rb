require "application_system_test_case"

class PlayersTest < ApplicationSystemTestCase
  setup do
    @player = players(:one)
  end

  test "visiting the index" do
    visit players_url
    assert_selector "h1", text: "Players"
  end

  test "should create player" do
    visit players_url
    click_on "New player"

    fill_in "Birthday", with: @player.birthday
    fill_in "Height", with: @player.height
    fill_in "Last name", with: @player.last_name
    fill_in "Name", with: @player.name
    fill_in "Nationality", with: @player.nationality
    fill_in "Number", with: @player.number
    fill_in "Position", with: @player.position
    fill_in "Team", with: @player.team_id
    fill_in "Weight", with: @player.weight
    click_on "Create Player"

    assert_text "Player was successfully created"
    click_on "Back"
  end

  test "should update Player" do
    visit player_url(@player)
    click_on "Edit this player", match: :first

    fill_in "Birthday", with: @player.birthday
    fill_in "Height", with: @player.height
    fill_in "Last name", with: @player.last_name
    fill_in "Name", with: @player.name
    fill_in "Nationality", with: @player.nationality
    fill_in "Number", with: @player.number
    fill_in "Position", with: @player.position
    fill_in "Team", with: @player.team_id
    fill_in "Weight", with: @player.weight
    click_on "Update Player"

    assert_text "Player was successfully updated"
    click_on "Back"
  end

  test "should destroy Player" do
    visit player_url(@player)
    click_on "Destroy this player", match: :first

    assert_text "Player was successfully destroyed"
  end
end
