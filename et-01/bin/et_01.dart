void main() {
  print(calculate(11));
}

int calculate(int number) {
  int sum = 0;
  int auxNum = number - 1;
  while (auxNum >= 3) {
    if (auxNum % 3 == 0 || auxNum % 5 == 0) {
      sum += auxNum;
    }
    auxNum--;
  }
  return sum;
}
