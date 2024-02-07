const data_teams = async (tournament_id) => {
  const response = await fetch(`/calendars/get_teams_by_tournament/${tournament_id}.json`);
  return await response.json();
};

const fill_select = async (select, teams) => {
  teams.map(item => new Option(item[0], item[1])).forEach(element => {
    select.appendChild(element)
  });
}

const tournament_id = window.calendar_tournament_id.value;
data_teams(tournament_id).then(response => {
  fill_select(window.calendar_team1, response.teams_by_tournament);
  fill_select(window.calendar_team2, response.teams_by_tournament);
});

window.calendar_tournament_id.addEventListener("change", (event) => {
  const selectTeam1 = window.calendar_team1;
  const selectTeam2 = window.calendar_team2;
  selectTeam1.innerHTML = "";
  selectTeam2.innerHTML = "";
  const tournament_id = event.target.value;
  data_teams(tournament_id).then(response => {
    fill_select(selectTeam1, response.teams_by_tournament);
    fill_select(selectTeam2, response.teams_by_tournament);
  });
});
