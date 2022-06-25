# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin_all_from "app/javascript/appJs", under: "appJs"
pin "trix"
pin "@rails/actiontext", to: "actiontext.js"
