// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require social-share-button

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

require("flatpickr")
9
import flatpickr from "flatpickr";
// require('jquery')
require("packs/notification.js")
require("packs/noti.js")
import "bootstrap"

import "../trix-editor-overrides"
require("controllers")
import "@fortawesome/fontawesome-free/js/all";
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("trix")
require("@rails/actiontext")
import "controllers"


import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"
import { Trix } from "trix"

const application = Application.start()
const context = require.context("controllers", true, /.js$/)
application.load(definitionsFromContext(context))