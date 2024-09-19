
;; Function main (main, funcdef_no=0, decl_uid=2344, cgraph_uid=1, symbol_order=0)

int main ()
{
  int g;
  int f;
  int n;
  int i;
  int D.2354;

  scanf ("%d", &n);
  i = 2;
  f = 1;
  g = i + f;
  goto <D.2351>;
  <D.2352>:
  f = f * i;
  i = i + 1;
  <D.2351>:
  n.0_1 = n;
  if (i <= n.0_1) goto <D.2352>; else goto <D.2350>;
  <D.2350>:
  printf ("%d", f);
  __builtin_putchar (10);
  n = {CLOBBER};
  D.2354 = 0;
  goto <D.2355>;
  <D.2355>:
  return D.2354;
}


