import 'package:euler_dart/euler_dart.dart';
import 'package:test/test.dart';

void main() {
  test('sieve', () {
    expect(sieve(100), [
      2,
      3,
      5,
      7,
      11,
      13,
      17,
      19,
      23,
      29,
      31,
      37,
      41,
      43,
      47,
      53,
      59,
      61,
      67,
      71,
      73,
      79,
      83,
      89,
      97
    ]);
  });
  test('nthPrime', () {
    expect(nthPrime(100), 541);
  });
  test('nthPrime_1000000', () {
    expect(nthPrime(1000000), 15485863);
  });
  test('euler001', () {
    expect(sumNmod(10, 3, 5), 23);
  });
  test('euler003', () {
    expect(euler003(), 6857);
  });
  test('euler004_is_palindrome_true', () {
    expect((isPalindrome(909)), true);
  });
  test('euler004_is_palindrome_false', () {
    expect((isPalindrome(123)), false);
  });
  test('euler004_largest_palindrome_product', () {
    expect((largestPalindromeproduct(99)), 9009);
  });
  test('euler006', () {
    expect(euler006(100), 25164150);
  });
  test('euler007', () {
    expect(nthPrime(10001), 104743);
  });
  test('euler008', () {
    expect(euler008(), 23514624000);
  });
  test('euler009', () {
    expect(euler009(), 31875000);
  });
  test('euler010', () {
    expect(euler010(2000000), 142913828922);
  });
  test('euler014_9', () {
    expect(collatz(9), 19);
  });
  test('euler014_27', () {
    expect(collatz(27), 111);
  });
  test('euler014_837799', () {
    expect(collatz(837799), 524);
  });
  test('euler015_2', () {
    expect(euler015(2), 6);
  });
  test('euler019', () {
    expect(euler019(), 171);
  });
  test('factorial_10', () {
    expect(factorial(10), BigInt.from(3628800));
  });
  test('euler020', () {
    expect(euler020(), 648);
  });
  test('euler025', () {
    expect(euler025(), 4782);
  });
  test('euler028', () {
    expect(euler028(), 669171000);
  });
  test('euler029', () {
    expect(euler029(), 9183);
  });
  test('euler031', () {
    expect(euler031(200, [1, 2, 5, 10, 20, 50, 100, 200]), 73682);
  });
}
