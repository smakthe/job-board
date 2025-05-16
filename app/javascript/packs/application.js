// Rails dependencies
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Bootstrap dependencies
import 'jquery'
import 'popper.js'
import 'bootstrap'

// Import the stylesheet (adjust path if needed)
import '../stylesheets/application'  

// Bootstrap jQuery plugins
document.addEventListener("turbolinks:load", function() {
  // Bootstrap dropdown initialization (if needed)
  $('[data-toggle="dropdown"]').dropdown();
})