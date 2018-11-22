import 'dart:math';

// Sieve of Eratosthenes
List<int> sieve(int n) {
  Map<int, bool> primes = {2: true, 3: true};
  List<int> result = [];
  var bound = sqrt(n);

  for (var i = 6; i <= n; i += 6) {
    primes[i-1] = true;
    primes[i+1] = true;
  }

  for (var i = 4; i < n; i += 2) {
    primes[i] = false;
  }

  for (var i = 3; i < bound; i+=2) {
    if (primes[i]) {
      var x = 2*i;
      for (var j = i*i; j < n; j += x) {
        primes[j] = false;
      }
    }
  }

  for (var i in primes.keys) {
    if (primes[i]) {
      result.add(i);
    }
  }

  return result;
}

int nthPrime(int n) {
  int ln = log(n).round();
  int pn_upper = n*(ln+2);
  var result = sieve(pn_upper);
  return result[n-1];
}

// Euler 001
// If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
// Find the sum of all the multiples of 3 or 5 below 1000.
int sumNmod(int n, int m1, int m2) {
  int result = 0;
  for (var i = 0; i < n; i++) {
    if (i % m1 == 0 || i % m2 == 0) {
      result += i;
    }
  }
  return result;
}

int euler001() {
  return sumNmod(1000, 3, 5);
}

// Euler 003
// The prime factors of 13195 are 5, 7, 13 and 29.
//
// What is the largest prime factor of the number 600851475143 ?

double euler003() {
  const double n = 600851475143;
  double x = n;
  double f = 0;
  double i = 2;
  while (i*i <= x) {
    if (x%i == 0) {
      x = x/i;
      f = i;
    } else {
      i++;
    }
    if (x > f) {
      f = x;
    }
  }
  return f;
}

// Euler 004
// A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
// Find the largest palindrome made from the product of two 3-digit numbers.

bool isPalindrome(int n) {
  final s = n.toString();
  return s == s.split('').reversed.join('');
}

int largestPalindromeproduct(int limit) {
  var i = limit;
  var j = limit;
  for (; i > 0; i--) {
    for (; j <= i; j--) {
      var x = i * j;
      if (isPalindrome(x)) {
        return x;
      }
    }
  }
  return null;
}

int euler004() {
  return largestPalindromeproduct(999999);
}

// Euler 006
// Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

int euler006(int n) {
  var squares = 0;
  var sum = 0;

  for (var i = 0; i < n + 1; i++) {
    squares += pow(i, 2);
    sum += i;
  }
  var squareofsums = pow(sum, 2);
  return squareofsums - squares;
}

// Euler 008
// Find the thirteen adjacent digits in the 1000-digit number that have the greatest product. What is the value of this product?

num mulString(String s) {
  num result = 1;

  for (var i in s.split('')) {
    result *= num.parse(i);
  }
  return result;
}

num euler008() {
  const String euler008_problem =
      "7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450";

  num result = 0;

  for (var i = 0; i < euler008_problem.length - 12; i++) {
    var s = euler008_problem.substring(i, i + 13);
    if (s.length < 13) {
      break;
    } else {
      var p = mulString(s);
      if (p > result) {
        result = p;
      }
    }
  }
  return result;
}

// Euler 009
// A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
//
// a2 + b2 = c2
// For example, 32 + 42 = 9 + 16 = 25 = 52.
//
// There exists exactly one Pythagorean triplet for which a + b + c = 1000.
// Find the product abc.

num euler009() {
  for (var a = 2; a < 499; a += 2) {
    for (var b = a; b < 499; b++) {
      var c = 1000 - a - b;
      if ((pow(a, 2) + pow(b, 2)) == pow(c, 2)) {
        return a * b * c;
      }
    }
  }
  return null;
}

// Euler 10
// The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
//
// Find the sum of all the primes below two million.

int euler010(int n){
  var primes = sieve(n);
  var result = 0;

  for (var p in primes) {
    result += p;
  }
  return result;
}


// Euler 014

num collatz(num n) {
  if (n == 0) {
    return null;
  }

  var steps = 0;
  var number = n;

  while (number != 1) {
    if (number % 2 == 0) {
      number = number / 2;
    } else {
      number = (number * 3) + 1;
    }
    steps += 1;
  }

  return steps;
}

// Euler 015
//
// Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
//
// How many such routes are there through a 20×20 grid?

num euler015(num n) {
  num p = 1;
  for (var i = 0; i < n; i++) {
    p *= (2 * n) - i;
    p /= (i + 1);
  }
  return p;
}

// Euler 019

int euler019() {
  int result = 0;
  for (var i = 1901; i < 2001; i++) {
    for (var j = 1; j <= 12; j++) {
      if (DateTime.utc(i, j, 1).weekday == 7) {
        result += 1;
      }
    }
  }
  return result;
}

// Euler 020

BigInt factorial(num n) {
  BigInt result = BigInt.from(1);
  ;
  for (num i = 1; i <= n; i++) {
    result *= BigInt.from(i);
  }
  return result;
}

num sumString(String s) {
  num result = 0;

  for (var i in s.split('')) {
    result += num.parse(i);
  }
  return result;
}

num euler020() {
  String s = factorial(100).toString();
  return sumString(s);
}

// Euler 025

num euler025() {
  var log_phi = log(1.618033988749895);
  var x = log(10) * 999;
  var y = log(5) / 2;
  var result = ((x + y) / log_phi).ceil();
  return result;
}

// Euler 028

num euler028() {
  var result = 0;
  var x = 1;
  var y = 0;
  for (var i = 0; i < 500; i++) {
    y += 2;
    for (var j = 0; j < 4; j++) {
      x += y;
      result += x;
    }
  }
  return result;
}

// Euler 029

int euler029() {
  var result = Set<BigInt>();
  BigInt limit = BigInt.from(101);
  BigInt start = BigInt.from(2);

  for (BigInt i = start; i < limit; i += BigInt.from(1)) {
    for (var j = 2; j < 101; j++) {
      result.add(i.pow(j));
    }
  }

  return result.length;
}

// Euler 31

int euler031(int tot, List<int> coins) {
  var ways = <int, int>{};
  ways[0] = 1;
  for (var i = 1; i < tot + 1; i++) {
    ways[i] = 0;
  }
  for (var coin in coins) {
    for (var i = coin; i < tot + 1; i++) {
      ways[i] += ways[i - coin];
    }
  }
  return ways[tot];
}
