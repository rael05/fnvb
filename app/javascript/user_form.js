const data_teams = async (tournament_id) => {
    const response = await fetch(`/calendars/get_teams_by_tournament/${tournament_id}.json`);
    return await response.json();
};

const fill_select = async (select, teams) => {
    teams.map(item => new Option(item[0], item[1])).forEach(element => {
        select.appendChild(element)
    });
}

const tournament_id = window.user_tournament_id.value;
data_teams(tournament_id).then(response => {
    fill_select(window.user_team_id, response.teams_by_tournament);
});

window.user_tournament_id.addEventListener("change", (event) => {
    const selectTeam = window.user_team_id;
    selectTeam.innerHTML = "";
    const tournament_id = event.target.value;
    data_teams(tournament_id).then(response => {
        fill_select(selectTeam, response.teams_by_tournament);
    });
});
