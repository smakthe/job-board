// Configure your import map in config/importmap.rb

import "@hotwired/turbo-rails"
import "controllers"
import "channels"

// Bootstrap
import "bootstrap"

// Initialize Bootstrap components
document.addEventListener("turbo:load", () => {
  // Initialize dropdowns and other Bootstrap components
  const dropdowns = document.querySelectorAll('[data-bs-toggle="dropdown"]')
  dropdowns.forEach(dropdown => {
    new bootstrap.Dropdown(dropdown)
  })
})