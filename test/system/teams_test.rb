require "application_system_test_case"

class TeamsTest < ApplicationSystemTestCase
  setup do
    @team = teams(:one)
  end

  test "visiting the index" do
    visit teams_url
    assert_selector "h1", text: "Teams"
  end

  test "should create team" do
    visit teams_url
    click_on "New team"

    fill_in "Assistant coach1 last name", with: @team.assistant_coach1_last_name
    fill_in "Assistant coach1 name", with: @team.assistant_coach1_name
    fill_in "Assistant coach2 last name", with: @team.assistant_coach2_last_name
    fill_in "Assistant coach2 name", with: @team.assistant_coach2_name
    fill_in "Color shirt1", with: @team.color_shirt1
    fill_in "Color shirt2", with: @team.color_shirt2
    fill_in "Color shirt3", with: @team.color_shirt3
    fill_in "Color short1", with: @team.color_short1
    fill_in "Color short2", with: @team.color_short2
    fill_in "Color short3", with: @team.color_short3
    fill_in "Delegate last name", with: @team.delegate_last_name
    fill_in "Delegate name", with: @team.delegate_name
    fill_in "Doctor last name", with: @team.doctor_last_name
    fill_in "Doctor name", with: @team.doctor_name
    fill_in "Head coach last name", with: @team.head_coach_last_name
    fill_in "Head coach name", with: @team.head_coach_name
    fill_in "International referee last name", with: @team.international_referee_last_name
    fill_in "International referee name", with: @team.international_referee_name
    fill_in "Physiotherapist last name", with: @team.physiotherapist_last_name
    fill_in "Physiotherapist name", with: @team.physiotherapist_name
    fill_in "Statistical last name", with: @team.statistical_last_name
    fill_in "Statistical name", with: @team.statistical_name
    fill_in "Team name", with: @team.team_name
    fill_in "Tournament", with: @team.tournament_id
    click_on "Create Team"

    assert_text "Team was successfully created"
    click_on "Back"
  end

  test "should update Team" do
    visit team_url(@team)
    click_on "Edit this team", match: :first

    fill_in "Assistant coach1 last name", with: @team.assistant_coach1_last_name
    fill_in "Assistant coach1 name", with: @team.assistant_coach1_name
    fill_in "Assistant coach2 last name", with: @team.assistant_coach2_last_name
    fill_in "Assistant coach2 name", with: @team.assistant_coach2_name
    fill_in "Color shirt1", with: @team.color_shirt1
    fill_in "Color shirt2", with: @team.color_shirt2
    fill_in "Color shirt3", with: @team.color_shirt3
    fill_in "Color short1", with: @team.color_short1
    fill_in "Color short2", with: @team.color_short2
    fill_in "Color short3", with: @team.color_short3
    fill_in "Delegate last name", with: @team.delegate_last_name
    fill_in "Delegate name", with: @team.delegate_name
    fill_in "Doctor last name", with: @team.doctor_last_name
    fill_in "Doctor name", with: @team.doctor_name
    fill_in "Head coach last name", with: @team.head_coach_last_name
    fill_in "Head coach name", with: @team.head_coach_name
    fill_in "International referee last name", with: @team.international_referee_last_name
    fill_in "International referee name", with: @team.international_referee_name
    fill_in "Physiotherapist last name", with: @team.physiotherapist_last_name
    fill_in "Physiotherapist name", with: @team.physiotherapist_name
    fill_in "Statistical last name", with: @team.statistical_last_name
    fill_in "Statistical name", with: @team.statistical_name
    fill_in "Team name", with: @team.team_name
    fill_in "Tournament", with: @team.tournament_id
    click_on "Update Team"

    assert_text "Team was successfully updated"
    click_on "Back"
  end

  test "should destroy Team" do
    visit team_url(@team)
    click_on "Destroy this team", match: :first

    assert_text "Team was successfully destroyed"
  end
end
