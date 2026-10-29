const tournamentSelect = document.getElementById("user_tournament_id");
const teamSelect = document.getElementById("user_team_id");
const permissionSelect = document.getElementById("user_permission");
const teamFields = document.querySelectorAll(".user-team-fields");

if (!tournamentSelect || !teamSelect || !permissionSelect) {
    // This module is shared by user forms; do nothing if the fields are absent.
} else {
const data_teams = async (tournament_id) => {
    const response = await fetch(`/calendars/get_teams_by_tournament/${tournament_id}.json`);
    return await response.json();
};

const fill_select = async (select, teams) => {
    teams.map(item => new Option(item[0], item[1])).forEach(element => {
        select.appendChild(element)
    });
}

const toggleTeamFields = () => {
    const visible = permissionSelect.value === "I";
    teamFields.forEach((field) => { field.hidden = !visible; });
};

const loadTeams = async (tournamentId) => {
    const selectedTeamId = teamSelect.value;
    teamSelect.innerHTML = "";
    if (!tournamentId) return;

    const response = await data_teams(tournamentId);
    fill_select(teamSelect, response.teams_by_tournament);
    if ([...teamSelect.options].some((option) => option.value === selectedTeamId)) {
        teamSelect.value = selectedTeamId;
    }
};

toggleTeamFields();
loadTeams(tournamentSelect.value);
permissionSelect.addEventListener("change", toggleTeamFields);

tournamentSelect.addEventListener("change", (event) => {
    loadTeams(event.target.value);
});
}
