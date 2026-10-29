const initializeTeamSwap = () => {
  const winningSelect = document.getElementById("game_winning_team");
  const losingSelect = document.getElementById("game_lose_team");
  if (!winningSelect || !losingSelect || winningSelect.dataset.swapReady) return;

  winningSelect.dataset.previousValue = winningSelect.value;
  losingSelect.dataset.previousValue = losingSelect.value;
  winningSelect.dataset.swapReady = "true";
  losingSelect.dataset.swapReady = "true";

  const keepTeamsDistinct = (changedSelect, otherSelect) => {
    if (changedSelect.value && changedSelect.value === otherSelect.value) {
      const previousValue = changedSelect.dataset.previousValue;
      const previousOptionExists = Array.from(otherSelect.options).some(
        (option) => option.value === previousValue && option.value !== changedSelect.value
      );
      const alternateOption = Array.from(otherSelect.options).find(
        (option) => option.value && option.value !== changedSelect.value
      );

      otherSelect.value = previousOptionExists ? previousValue : alternateOption?.value || "";
      otherSelect.dataset.previousValue = otherSelect.value;
    }

    changedSelect.dataset.previousValue = changedSelect.value;
  };

  winningSelect.addEventListener("change", () => keepTeamsDistinct(winningSelect, losingSelect));
  losingSelect.addEventListener("change", () => keepTeamsDistinct(losingSelect, winningSelect));
};

const initializeGameSubmitLabel = () => {
  const statusSelect = document.getElementById("calendar_status");
  const submitButton = document.getElementById("game_submit");
  if (!statusSelect || !submitButton || statusSelect.dataset.labelReady) return;

  const updateLabel = () => {
    submitButton.value = statusSelect.value === "I"
      ? submitButton.dataset.inProgressLabel
      : submitButton.dataset.defaultLabel;
  };

  statusSelect.addEventListener("change", updateLabel);
  statusSelect.dataset.labelReady = "true";
  updateLabel();
};

document.addEventListener("DOMContentLoaded", initializeTeamSwap);
document.addEventListener("turbo:load", initializeTeamSwap);
document.addEventListener("DOMContentLoaded", initializeGameSubmitLabel);
document.addEventListener("turbo:load", initializeGameSubmitLabel);
initializeTeamSwap();
initializeGameSubmitLabel();
