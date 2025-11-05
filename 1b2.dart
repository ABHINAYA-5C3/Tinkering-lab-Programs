void main() {
  int number = 17; // You can change this value
  bool isPrime = checkPrime(number);

  if (isPrime) {
    print("$number is a Prime number");
  } else {
    print("$number is not a Prime number");
  }
}

// Function to check if a number is prime
bool checkPrime(int n) {
  if (n <= 1) return false; // 0 and 1 are not prime

  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) {
      return false; // Found a divisor, not prime
    }
  }
  return true; // No divisors found, prime number
}
