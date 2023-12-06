// app/javascript/custom/link_form.js
console.log("El archivo link_form.js se está ejecutando correctamente.");

document.addEventListener("DOMContentLoaded", function() {
    console.log("El archivo link_form.js se está ejecutando correctamente.");
    const linkTypeSelect = document.querySelector('.link-type-select');
    const expirationDateField = document.getElementById('expiration-date-field');
  
    linkTypeSelect.addEventListener('change', function() {
      const selectedType = linkTypeSelect.value;
      const expirationDateFieldDisplay = (selectedType === 'temporary') ? 'block' : 'none';
  
     
      expirationDateField.style.display = expirationDateFieldDisplay;
    });
  });
  