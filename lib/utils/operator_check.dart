bool isOperator(String ele) {
  if (ele == '%' ||
      ele == '+' ||
      ele == '-' ||
      ele == 'x' ||
      ele == '*' ||
      ele == '/') {
    return true;
  }
  return false;
}
