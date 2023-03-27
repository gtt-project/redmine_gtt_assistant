// Plugin Javascript

window.addEventListener('DOMContentLoaded', function() {
  // Call the moveElement function whenever necessary
  moveElement();

  registerRequest();
});

function moveElement() {
  // Find the label element with for="issue_subject"
  var field = document.querySelector('label[for="issue_subject"]');

  // If the label element is not found, skp
  if (!field) {
    return;
  }

  // Find the enclosing p element of the label
  var target = field.parentNode;

  // Find the p element with id="smart_assistant" and move it after the target
  target.parentNode.insertBefore(
    document.querySelector('#smart_assistant'),
    target.nextSibling
  );

  // Set the smartAssistantP display style to block
  document.querySelector('#smart_assistant').style.display = "block";
}

function registerRequest() {
  const assistantButtons = document.getElementsByClassName('assistantButton');

  const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
  const issue_subject = document.getElementById('issue_subject');
  const issue_description = document.getElementById('issue_description');

  function postData(event) {
    event.preventDefault();

    const spinnerContainer = event.target.querySelector('.spinner');
    spinnerContainer.style.display = 'block';

    fetch("/assistant/" + event.target.dataset.action, {
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
        spinnerContainer.style.display = 'none';
        if (response.ok) {
          // Handle success
          return response.json();
        } else {
          // Handle error
          throw new Error('Request failed');
        }
      })
      .then(data => {
        // Handle JSON data
        if (data.answer.subject) {
          issue_subject.value = data.answer.subject;
        }
        if (data.answer.description) {
          issue_description.value = data.answer.description;
        }
      })
      .catch(error => {
        spinnerContainer.style.display = 'none';
        // Handle error
        console.error(error);
      });
  }

  Array.from(assistantButtons).forEach(button => {
    button.addEventListener('click', postData);
  });
}
