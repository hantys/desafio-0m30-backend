import feather from "feather-icons";

const initFeather = function () {
  feather.replace();
};

document.addEventListener("turbo:load", initFeather);
document.addEventListener("turbo:render", initFeather);
