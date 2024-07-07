// javascript/alert_close.js

document.addEventListener('DOMContentLoaded', function() {
    document.addEventListener('click', function(event) {
      if (event.target.classList.contains('close-button')) {
        event.target.parentElement.style.display = 'none';
      }
    });
  });