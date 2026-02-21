#include "main.h"
#include "options.h"
int main(int ac, char ** av) {
  extern int somefunc(void);
  print("--");
  somefunc();
  return 0;
}
