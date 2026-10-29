const initializeGameEditInteractions = () => {
  const detailsModal = document.getElementById("exampleModal");
  const detailsForm = document.getElementById("game_detail_form");
  const detailsTitle = document.getElementById("exampleModalLabel");
  const detailIdField = document.getElementById("game_detail_id");
  const detailTypeSelect = document.getElementById("game_detail_detail_type");
  const playerSelect = document.getElementById("game_detail_player_id");
  const teamSelect = document.getElementById("game_detail_team_id");
  if (!detailsModal || !detailsForm || !detailsTitle || !detailIdField || !detailTypeSelect || !playerSelect || !teamSelect || detailsModal.dataset.handlersReady) return;
  detailsModal.dataset.handlersReady = "true";

  const updatePlayerAvailability = () => {
    const isSetWon = detailTypeSelect.value === "S";
    playerSelect.disabled = isSetWon;
    if (isSetWon) playerSelect.value = "";
  };

  detailTypeSelect.addEventListener("change", updatePlayerAvailability);
  detailsModal.addEventListener("show.bs.modal", (event) => {
    const trigger = event.relatedTarget;
    const detailId = trigger?.dataset.gameDetailId;
    detailsForm.reset();

    if (detailId) {
      detailIdField.value = detailId;
      teamSelect.value = trigger.dataset.teamId || "";
      playerSelect.value = trigger.dataset.playerId || "";
      detailTypeSelect.value = trigger.dataset.detailType || "";
      document.getElementById("game_detail_number_set").value = trigger.dataset.numberSet || "";
      document.getElementById("game_detail_played_minute").value = trigger.dataset.playedMinute || "";
      document.getElementById("game_detail_description").value = trigger.dataset.description || "";
      detailsTitle.textContent = detailsTitle.dataset.editTitle;
    } else {
      detailIdField.value = "";
      detailsTitle.textContent = detailsTitle.dataset.createTitle;
    }

    updatePlayerAvailability();
  });

  if (new URLSearchParams(window.location.search).get("add_details") === "true") {
    bootstrap.Modal.getOrCreateInstance(detailsModal).show();
  }

  teamSelect.addEventListener("change", async () => {
    const teamId = teamSelect.value;
    playerSelect.replaceChildren(new Option(playerSelect.dataset.noPlayerLabel, ""));
    if (!teamId) return;

    try {
      const response = await fetch(`/players/${encodeURIComponent(teamId)}/get_players`, {
        headers: { Accept: "application/json" }
      });
      if (!response.ok) throw new Error(`Could not load team players (${response.status})`);

      const players = await response.json();
      players.forEach((player) => playerSelect.add(new Option(player.name, player.id)));
    } catch (error) {
      console.error("Unable to load players for the selected team.", error);
    }
  });
};

document.addEventListener("DOMContentLoaded", initializeGameEditInteractions);
document.addEventListener("turbo:load", initializeGameEditInteractions);
initializeGameEditInteractions();
