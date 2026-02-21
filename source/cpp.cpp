#include <vector>
#include <iostream>
extern "C" {
  int somefunc(void);
}

int somefunc(void) {
  // this is supposed to be C++! do something C++!
  std::vector<bool> x(100);
  for (bool b : x) {
    std::cout << b << ' ';
  }
  std::cout << '\n';
  return 0;
}
