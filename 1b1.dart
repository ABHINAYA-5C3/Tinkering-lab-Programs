void main() {
  int number = 5; // You can change this value
  int result = factorial(number);
  
  print("The factorial of $number is $result");
}

// Function to calculate factorial
int factorial(int n) {
  int fact = 1;
  for (int i = 1; i <= n; i++) {
    fact *= i;
  }
  return fact;
}
