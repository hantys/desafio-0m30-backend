import feather from "feather-icons";
import { domReady } from "../utils";

const initFeather = function () {
  document.addEventListener("turbo:load", () => {
    feather.replace();
  });
};

window.feather = feather;

export default domReady(initFeather);
