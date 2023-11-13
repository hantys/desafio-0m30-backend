# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "jquery", to: "https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.js", preload: true

pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.8/lib/index.js"
pin "feather-icons", to: "https://ga.jspm.io/npm:feather-icons@4.29.1/dist/feather.js"
pin "tippy.js", to: "https://ga.jspm.io/npm:tippy.js@6.3.7/dist/tippy.esm.js"
pin "vanilla-masker", to: "https://ga.jspm.io/npm:vanilla-masker@1.2.0/lib/vanilla-masker.js"
pin "@rails/ujs", to: "https://ga.jspm.io/npm:@rails/ujs@7.1.2/app/assets/javascripts/rails-ujs.esm.js"
pin "@rails/actiontext", to: "https://ga.jspm.io/npm:@rails/actiontext@7.1.2/app/assets/javascripts/actiontext.esm.js"
pin "lodash", to: "https://ga.jspm.io/npm:lodash@4.17.21/lodash.js"
pin "lodash/fp", to: "https://ga.jspm.io/npm:lodash@4.17.21/fp.js"

pin_all_from "app/javascript/controllers", under: "controllers"
pin_all_from "app/javascript/initializers", under: "initializers"
pin_all_from "app/javascript/templates", under: "templates"
