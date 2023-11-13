const applySearchCep = () => {
  $(".cep_search").keyup(function () {
    const cep = $(this).val();
    const filter_cep = cep.replace(/\D/g, "");
    $(this).css({ "border-color": "rgb(206, 212, 218)" });
    $(".cep_error").remove();
    if (filter_cep.length == 8) {
      $(".loading").removeClass('d-none');
      $.get(
        `https://viacep.com.br/ws/${filter_cep}/json/`,
        {},
        function (data) {
          process_cep_data(data)
          $(".loading").addClass("d-none");
        }
      );
    } else {
      //cep é inválido.
      error_cep("CEP inválido");
    }
  });

  function process_cep_data(data) {
    if (!data.erro) {
      $(".street_search").val(data.logradouro);
      $(".neighborhood_search").val(data.bairro);
      $(".ibge_search").val(data.ibge);
      $(".city_search").val(data.localidade);
      $(".state_search").val(data.uf);
    } else {
      //cep não encontrado.
      error_cep("CEP Não encontrado");
    }
  }

  function error_cep(text) {
    limpa_formulario_cep();
    $(".cep_search").css({ "border-color": "rgb(255, 0, 0)" });
    $("#cep_div").append(
      "<span class='cep_error small text-danger'>" + text + "</span>"
    );
  }

  function limpa_formulario_cep() {
    // Limpa valores do formulário de cep.
    $(".neighborhood_search").val("");
    $(".street_search").val("");
    $(".state_search").val("");
    $(".city_search").val("");
  }
};


document.addEventListener("turbo:load", applySearchCep);

// Adicione a chamada da função após a renderização devido a um erro
document.addEventListener("turbo:render", applySearchCep);