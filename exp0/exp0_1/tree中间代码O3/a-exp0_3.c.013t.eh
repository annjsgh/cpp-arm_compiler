
;; Function main (main, funcdef_no=23, decl_uid=2545, cgraph_uid=24, symbol_order=23)

int main ()
{
  int g;
  int f;
  int n;
  int i;
  int D.2555;

  scanf ("%d", &n);
  i = 2;
  f = 1;
  g = i + f;
  goto <D.2552>;
  <D.2553>:
  f = f * i;
  i = i + 1;
  <D.2552>:
  n.0_1 = n;
  if (i <= n.0_1) goto <D.2553>; else goto <D.2551>;
  <D.2551>:
  printf ("%d", f);
  printf ("\n");
  n = {CLOBBER};
  D.2555 = 0;
  goto <D.2556>;
  <D.2556>:
  return D.2555;
}



;; Function printf (<unset-asm-name>, funcdef_no=15, decl_uid=964, cgraph_uid=16, symbol_order=15)

__attribute__((artificial, gnu_inline, always_inline))
__attribute__((nonnull (1), format (printf, 1, 2)))
int printf (const char * restrict __fmt)
{
  int D.2557;

  D.2557 = __printf_chk (1, __fmt, __builtin_va_arg_pack ());
  goto <D.2558>;
  <D.2558>:
  return D.2557;
}


