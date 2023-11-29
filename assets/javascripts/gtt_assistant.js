// Plugin Javascript

// When the DOM is fully loaded, execute the moveElement and registerRequest functions
document.addEventListener('DOMContentLoaded', () => {
  moveElement();
  registerRequest();
});

// Function to move the smart assistant element
function moveElement() {
  const field = document.querySelector('label[for="issue_subject"]');
  const smartAssistant = document.querySelector('#smart_assistant');

  // Exit the function if either the field, its parent, or smartAssistant is not found
  if (!field || !field.parentNode || !smartAssistant) {
    return;
  }

  // Move the smart assistant element after the target
  field.parentNode.parentNode.insertBefore(smartAssistant, field.parentNode.nextSibling);

  // Set the smart assistant element's display style to block
  smartAssistant.style.display = "block";
}



// Function to register requests for the assistant buttons
function registerRequest() {
  // Get all assistant buttons
  const assistantButtons = document.getElementsByClassName('assistantButton');

  // Get the CSRF token from the meta tag
  const csrfToken = document.querySelector('meta[name="csrf-token"]').content;

  // Get the issue subject and description elements
  const issue_subject = document.getElementById('issue_subject');
  const issue_description = document.getElementById('issue_description');

  // Function to handle POST requests to the assistant
  function postData(event) {
    // Prevent the default button click behavior
    event.preventDefault();

    // Display the spinner while processing the request
    const spinnerContainer = event.target.querySelector('.spinner');
    spinnerContainer.style.display = 'block';

    // Send a POST request to the assistant
    fetch(`/assistant/${event.target.dataset.action}`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken
      },
      body: JSON.stringify({
        action: event.target.dataset.action,
        subject: issue_subject.value,
        description: issue_description.value
      })
    })
      .then(response => {
        // Hide the spinner when the response is received
        spinnerContainer.style.display = 'none';

        if (response.ok) {
          // If the response is successful, parse the JSON data
          return response.json();
        } else {
          // If the response is unsuccessful, throw an error
          throw new Error('Request failed');
        }
      })
      .then(data => {
        // Update the issue subject and description with the received data
        const { subject, description } = data.answer;
        if (subject) issue_subject.value = subject;
        if (description) issue_description.value = description;
      })
      .catch(error => {
        // Hide the spinner and log the error in case of a request failure
        spinnerContainer.style.display = 'none';
        console.error(error);
      });
  }

  // Add a click event listener to each assistant button to handle the postData function
  Array.from(assistantButtons).forEach(button => {
    button.addEventListener('click', postData);
  });
}
