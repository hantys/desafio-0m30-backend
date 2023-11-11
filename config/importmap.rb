# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin_all_from "app/javascript/initializers", under: "initializers"
pin_all_from "app/javascript/templates", under: "templates"

pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "@popperjs--core.js" # @2.11.8
pin "feather-icons" # @4.29.1
pin "tippy.js" # @6.3.7
pin "jquery" # @3.7.1
pin "vanilla-masker" # @1.2.0
pin "select2" # @4.1.0
pin "@rails/ujs", to: "@rails--ujs.js" # @7.1.1
pin "@rails/actiontext", to: "@rails--actiontext.js" # @7.1.1
pin "dayjs" # @1.11.10
pin "lodash" # @4.17.21
pin "lodash/fp", to: "lodash--fp.js" # @4.17.21
