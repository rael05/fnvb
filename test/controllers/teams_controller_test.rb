require "test_helper"

class TeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team = teams(:one)
  end

  test "should get index" do
    get teams_url
    assert_response :success
  end

  test "should get new" do
    get new_team_url
    assert_response :success
  end

  test "should create team" do
    assert_difference("Team.count") do
      post teams_url, params: { team: { assistant_coach1_last_name: @team.assistant_coach1_last_name, assistant_coach1_name: @team.assistant_coach1_name, assistant_coach2_last_name: @team.assistant_coach2_last_name, assistant_coach2_name: @team.assistant_coach2_name, color_shirt1: @team.color_shirt1, color_shirt2: @team.color_shirt2, color_shirt3: @team.color_shirt3, color_short1: @team.color_short1, color_short2: @team.color_short2, color_short3: @team.color_short3, delegate_last_name: @team.delegate_last_name, delegate_name: @team.delegate_name, doctor_last_name: @team.doctor_last_name, doctor_name: @team.doctor_name, head_coach_last_name: @team.head_coach_last_name, head_coach_name: @team.head_coach_name, international_referee_last_name: @team.international_referee_last_name, international_referee_name: @team.international_referee_name, physiotherapist_last_name: @team.physiotherapist_last_name, physiotherapist_name: @team.physiotherapist_name, statistical_last_name: @team.statistical_last_name, statistical_name: @team.statistical_name, team_name: @team.team_name, tournament_id: @team.tournament_id } }
    end

    assert_redirected_to team_url(Team.last)
  end

  test "should show team" do
    get team_url(@team)
    assert_response :success
  end

  test "should get edit" do
    get edit_team_url(@team)
    assert_response :success
  end

  test "should update team" do
    patch team_url(@team), params: { team: { assistant_coach1_last_name: @team.assistant_coach1_last_name, assistant_coach1_name: @team.assistant_coach1_name, assistant_coach2_last_name: @team.assistant_coach2_last_name, assistant_coach2_name: @team.assistant_coach2_name, color_shirt1: @team.color_shirt1, color_shirt2: @team.color_shirt2, color_shirt3: @team.color_shirt3, color_short1: @team.color_short1, color_short2: @team.color_short2, color_short3: @team.color_short3, delegate_last_name: @team.delegate_last_name, delegate_name: @team.delegate_name, doctor_last_name: @team.doctor_last_name, doctor_name: @team.doctor_name, head_coach_last_name: @team.head_coach_last_name, head_coach_name: @team.head_coach_name, international_referee_last_name: @team.international_referee_last_name, international_referee_name: @team.international_referee_name, physiotherapist_last_name: @team.physiotherapist_last_name, physiotherapist_name: @team.physiotherapist_name, statistical_last_name: @team.statistical_last_name, statistical_name: @team.statistical_name, team_name: @team.team_name, tournament_id: @team.tournament_id } }
    assert_redirected_to team_url(@team)
  end

  test "should destroy team" do
    assert_difference("Team.count", -1) do
      delete team_url(@team)
    end

    assert_redirected_to teams_url
  end
end
