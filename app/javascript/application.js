// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "controllers"
import "jquery"
import "popper.js"
import "bootstrap"

// Bootstrap dropdown initialization
document.addEventListener("turbo:load", function() {
  $('[data-toggle="dropdown"]').dropdown();
})