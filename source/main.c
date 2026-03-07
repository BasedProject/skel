#include "main.h"
#include "options.h"
int main(int ac, char ** av) {
  (void) ac, (void) av;
  extern int somefunc(void);
  print("--");
  somefunc();
  return 0;
}
