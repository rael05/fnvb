const initializeUserForm = () => {
  const tournamentSelect = document.getElementById("user_tournament_id");
  const teamSelect = document.getElementById("user_team_id");
  const permissionSelect = document.getElementById("user_permission");
  const teamFields = document.querySelectorAll(".user-team-fields");
  if (!tournamentSelect || !teamSelect || !permissionSelect) return;

  const toggleTeamFields = () => {
    const visible = permissionSelect.value === "I";
    teamFields.forEach((field) => { field.hidden = !visible; });
  };

  const loadTeams = async (tournamentId) => {
    const selectedTeamId = teamSelect.value;
    teamSelect.replaceChildren();
    if (!tournamentId) return;

    try {
      const response = await fetch(`/calendars/get_teams_by_tournament/${encodeURIComponent(tournamentId)}.json`, {
        headers: { Accept: "application/json" }
      });
      if (!response.ok) throw new Error(`Could not load tournament teams (${response.status})`);

      const data = await response.json();
      (data.teams_by_tournament || []).forEach(([name, id]) => teamSelect.add(new Option(name, id)));
      if ([...teamSelect.options].some((option) => option.value === selectedTeamId)) {
        teamSelect.value = selectedTeamId;
      }
    } catch (error) {
      console.error("Unable to load teams for the selected tournament.", error);
    }
  };

  toggleTeamFields();
  if (!permissionSelect.dataset.teamFieldsReady) {
    permissionSelect.addEventListener("change", toggleTeamFields);
    permissionSelect.dataset.teamFieldsReady = "true";
  }

  if (!tournamentSelect.dataset.teamOptionsReady) {
    tournamentSelect.addEventListener("change", (event) => loadTeams(event.target.value));
    tournamentSelect.dataset.teamOptionsReady = "true";
  }

  if (!tournamentSelect.dataset.initialTeamsLoaded) {
    tournamentSelect.dataset.initialTeamsLoaded = "true";
    loadTeams(tournamentSelect.value);
  }
};

document.addEventListener("DOMContentLoaded", initializeUserForm);
document.addEventListener("turbo:load", initializeUserForm);
initializeUserForm();
