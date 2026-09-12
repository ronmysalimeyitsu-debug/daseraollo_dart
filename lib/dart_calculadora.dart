import 'dart:math';

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

num power(num base, num exponent) {
  return pow(base, exponent);
}

double squareRoot(num number) {
  if (number < 0) {
    throw ArgumentError('Cannot calculate square root of a negative number');
  }
  return sqrt(number);
}

int modulo(int num1, int num2) {
  if (num2 == 0) {
    throw ArgumentError('Cannot divide by zero');
  }
  return num1 % num2;
}
