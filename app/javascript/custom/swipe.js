if (location.pathname == "/users") {
  document.addEventListener("DOMContentLoaded", function () {
    let allCards = document.querySelectorAll(".swipe--card");
    let swipeContainer = document.querySelector(".swipe");

    function initCards() {
      console.log("init");
      allCards.forEach(function (card, index) {
        card.style.zIndex = allCards.length - index;
        card.style.transform =
          "scale(" + (20 - index) / 20 + ") translateY(-" + 30 * index + "px)";
        card.style.opacity = (10 - index) / 10;
      });
    }
    initCards();
  });
}
