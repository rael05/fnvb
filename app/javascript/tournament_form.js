const initializeTournamentTeamPicker = () => {
  const searchField = document.getElementById("tournament-team-search");
  const tableBody = document.getElementById("tournament-team-options");
  const selectedTeams = document.getElementById("tournament-selected-teams");
  const selectedTeamCount = document.getElementById("tournament-selected-team-count");
  if (!searchField || !tableBody || searchField.dataset.ready) return;

  const rows = Array.from(tableBody.querySelectorAll("tr[data-team-name]"));
  const checkboxes = Array.from(tableBody.querySelectorAll(".tournament-team-checkbox"));
  const noResults = document.getElementById("tournament-no-team-results");
  const previousButton = document.getElementById("tournament-teams-previous");
  const nextButton = document.getElementById("tournament-teams-next");
  const pageLabel = document.getElementById("tournament-teams-page");
  const perPage = 8;
  let currentPage = 1;
  let filteredRows = rows;

  const renderPage = () => {
    const pageCount = Math.max(1, Math.ceil(filteredRows.length / perPage));
    currentPage = Math.min(currentPage, pageCount);
    const firstVisibleIndex = (currentPage - 1) * perPage;
    const lastVisibleIndex = firstVisibleIndex + perPage;

    rows.forEach((row) => row.classList.add("d-none"));
    filteredRows.slice(firstVisibleIndex, lastVisibleIndex).forEach((row) => row.classList.remove("d-none"));
    noResults.classList.toggle("d-none", filteredRows.length > 0);
    previousButton.disabled = currentPage <= 1;
    nextButton.disabled = currentPage >= pageCount;
    pageLabel.textContent = pageLabel.dataset.pageLabel
      .replace("%{current}", currentPage)
      .replace("%{total}", pageCount);
  };

  const syncSelection = () => {
    const selected = checkboxes.filter((checkbox) => checkbox.checked);
    const emptyInput = document.getElementById("tournament-empty-team-id");
    if (selected.length > 0) {
      emptyInput?.remove();
    } else if (!emptyInput) {
      const input = document.createElement("input");
      input.type = "hidden";
      input.name = "tournament[team_ids][]";
      input.value = "";
      input.id = "tournament-empty-team-id";
      searchField.form.appendChild(input);
    }

    selectedTeams.replaceChildren();
    if (selected.length === 0) {
      const emptyLabel = document.createElement("span");
      emptyLabel.className = "small text-muted";
      emptyLabel.textContent = selectedTeams.dataset.emptyLabel;
      selectedTeams.appendChild(emptyLabel);
    }

    selected.forEach((checkbox) => {
      const teamId = checkbox.value;
      const teamName = checkbox.closest("tr").cells[0].textContent.trim();
      const teamLabel = document.createElement("span");
      teamLabel.className = "badge text-bg-primary d-inline-flex align-items-center gap-1";
      const teamText = document.createElement("span");
      teamText.textContent = teamName;
      teamLabel.appendChild(teamText);

      const removeButton = document.createElement("button");
      removeButton.type = "button";
      removeButton.className = "btn-close btn-close-white";
      removeButton.setAttribute("aria-label", selectedTeams.dataset.removeLabel.replace("%{team}", teamName));
      removeButton.dataset.removeTeamId = teamId;
      teamLabel.appendChild(removeButton);
      selectedTeams.appendChild(teamLabel);
    });

    selectedTeamCount.textContent = selectedTeamCount.dataset.countLabel.replace("%{count}", selected.length);
  };

  const filterTeams = () => {
    const query = searchField.value.trim().toLocaleLowerCase();
    filteredRows = rows.filter((row) => row.dataset.teamName.includes(query));
    currentPage = 1;
    renderPage();
  };

  searchField.addEventListener("keyup", filterTeams);
  searchField.addEventListener("input", filterTeams);

  tableBody.addEventListener("change", syncSelection);
  selectedTeams.addEventListener("click", (event) => {
    const removeButton = event.target.closest("[data-remove-team-id]");
    if (!removeButton) return;

    const checkbox = document.getElementById(`tournament_team_choice_${removeButton.dataset.removeTeamId}`);
    if (checkbox) checkbox.checked = false;
    syncSelection();
  });
  previousButton.addEventListener("click", () => { currentPage -= 1; renderPage(); });
  nextButton.addEventListener("click", () => { currentPage += 1; renderPage(); });

  searchField.dataset.ready = "true";
  syncSelection();
  renderPage();
};

document.addEventListener("DOMContentLoaded", initializeTournamentTeamPicker);
document.addEventListener("turbo:load", initializeTournamentTeamPicker);
initializeTournamentTeamPicker();
