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

document.addEventListener("DOMContentLoaded", initializeTeamSwap);
document.addEventListener("turbo:load", initializeTeamSwap);
