import "select2";
$(document).ready(function () {
  $(".select2").select2({
    theme: "bootstrap-5",
    language: "pt-BR",
    width: $(this).data("width")
      ? $(this).data("width")
      : $(this).hasClass("w-100")
      ? "100%"
      : "style",
    placeholder: $(this).data("placeholder"),
  });

  $(".select2-multiple").select2({
    theme: "bootstrap-5",
    language: "pt-BR",
    width: $(this).data("width")
      ? $(this).data("width")
      : $(this).hasClass("w-100")
      ? "100%"
      : "style",
    placeholder: $(this).data("placeholder"),
    closeOnSelect: false,
    allowClear: false,
  });
});
