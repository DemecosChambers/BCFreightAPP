// Add your JavaScript code here to handle form submission,
// send data to the backend (application server), etc.

const form = document.getElementById('load-form');

form.addEventListener('submit', (event) => {
  event.preventDefault(); // Prevent default form submission

  // Get form data
  const formData = new FormData(form);
  const origin = formData.get('origin');
  const destination = formData.get('destination');
  // ... other form data

  // Send data to the backend (replace with your actual backend endpoint)
  fetch('/api/submit-load', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({ origin, destination, /* ... other data */ })
  })
  .then(response => {
    // Handle response from backend
  })
  .catch(error => {
    // Handle error
  });
});