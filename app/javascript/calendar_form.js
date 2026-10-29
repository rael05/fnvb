const tournamentSelect = document.getElementById("calendar_tournament_id");
const teamOneSelect = document.getElementById("calendar_team1");
const teamTwoSelect = document.getElementById("calendar_team2");

if (tournamentSelect && teamOneSelect && teamTwoSelect) {
  const teamsUrlTemplate = tournamentSelect.dataset.teamsUrl;

  tournamentSelect.addEventListener("change", async (event) => {
    const tournamentId = event.target.value;
    teamOneSelect.replaceChildren(new Option("", ""));
    teamTwoSelect.replaceChildren(new Option("", ""));
    if (!tournamentId) return;

    try {
      const url = teamsUrlTemplate.replace("TOURNAMENT_ID", encodeURIComponent(tournamentId));
      const response = await fetch(url, { headers: { Accept: "application/json" } });
      if (!response.ok) throw new Error(`Could not load tournament teams (${response.status})`);

      const data = await response.json();
      (data.teams_by_tournament || []).forEach(([name, id]) => {
        teamOneSelect.add(new Option(name, id));
        teamTwoSelect.add(new Option(name, id));
      });
    } catch (error) {
      console.error("Unable to load teams for the selected tournament.", error);
    }
  });
}
