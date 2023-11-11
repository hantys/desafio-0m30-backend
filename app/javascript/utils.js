import dayjs from "dayjs";
import jquery from "jquery";

window.$ = jquery;

export const domReady = (fn) =>
  document.readyState === "interactive" || document.readyState === "complete"
    ? fn()
    : document.addEventListener("DOMContentLoaded", fn);
