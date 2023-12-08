// app/javascript/custom/link_form.js
console.log("El archivo link_form.js se está ejecutando correctamente.");
document.addEventListener('turbo:load', function () {
  console.log("El archivo link_form.js se está ejecutando correctamente.");
  const linkTypeSelect = document.getElementById('link_type_select');
  const expirationDateField = document.getElementById('expiration-date-field');
  const passwordField = document.getElementById('password-field'); 
   const passwordConfirmationField = document.getElementById('password-confirmation-field');

  function toggleExpirationDateField() {
    expirationDateField.style.display = linkTypeSelect.value === 'temporary' ? 'block' : 'none';
    console.log(linkTypeSelect.value);
  }

  function togglePasswordField() {
    passwordField.style.display = linkTypeSelect.value === 'private_link' ? 'block' : 'none';
    passwordConfirmationField.style.display = linkTypeSelect.value === 'private_link' ? 'block' : 'none';
  }

  linkTypeSelect.addEventListener('change', toggleExpirationDateField);
  linkTypeSelect.addEventListener('change', togglePasswordField);

  // Llama a las funciones una vez al cargar la página para establecer el estado inicial
  toggleExpirationDateField();
  togglePasswordField();
});
  