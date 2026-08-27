int sum(int num1, int num2) {
  return num1 + num2;
}   

int subtract(int num1, int num2) {
  return num1 - num2;
} 

int multiply(int num1, int num2) {
  return num1 * num2;
} 

int divide(int num1, int num2) {
  if (num2 == 0) {
    throw ArgumentError('Cannot divide by zero');
  }
  return num1 ~/ num2;
}