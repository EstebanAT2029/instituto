document.getElementById('formContacto').addEventListener('submit', function(e) {
  e.preventDefault();

  let nombre = document.getElementById('nombre');
  let email = document.getElementById('email');
  let mensaje = document.getElementById('mensaje');
  let valid = true;

  // Validación de nombre
  if (nombre.value.trim() === '') {
    nombre.classList.add('is-invalid');
    valid = false;
  } else {
    nombre.classList.remove('is-invalid');
  }

  // Validación de email simple
  if (!email.value.includes('@') || email.value.trim() === '') {
    email.classList.add('is-invalid');
    valid = false;
  } else {
    email.classList.remove('is-invalid');
  }

  // Validación de mensaje
  if (mensaje.value.trim() === '') {
    mensaje.classList.add('is-invalid');
    valid = false;
  } else {
    mensaje.classList.remove('is-invalid');
  }

  if (valid) {
    alert('Gracias por contactarnos, pronto te responderemos.');
    this.reset();
  }
});
