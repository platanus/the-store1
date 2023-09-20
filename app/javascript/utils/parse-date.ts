function parseDate(date: string) {
  const parsedDate = new Date(date);

  return parsedDate.toLocaleDateString('es-CL', {
    year: 'numeric',
    month: 'long',
    day: 'numeric',
  });
}

export default parseDate;
