function formatDate(dateString) {
  const options = { weekday: 'long', day: 'numeric', month: 'long' };
  const date = new Date(dateString);
  const formattedDate = date.toLocaleDateString('es-ES', options).replace(',', '');

return formattedDate;
}

export default formatDate;
