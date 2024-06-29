document.addEventListener('turbo:load', function() {
  document.body.addEventListener('click', function(event) {
    var target = event.target;
    if (target.classList.contains('image--profile-icon')) {
      var avatarUrl = target.getAttribute('src');
      document.getElementById('avatar_url').value = avatarUrl;
      console.log('Avatar URL:', avatarUrl);
      // Optional: Toggle selected class for visual feedback
      document.querySelectorAll('.image--profile-icon').forEach(function(img) {
        img.classList.remove('selected');
      });
      target.classList.add('selected');
    }
  });
});