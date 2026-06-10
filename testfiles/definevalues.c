// follow UltraC v0.1 style.

//UltraCBETAv0.1 support string as char name[].
string name = "AHuman"; 
int a = 1;
double u = 17787.0182721;
char aj = 'a';
int main() {
  printf(name);
  printf("\n");
  printf(a);
  printf("\n");
  printf(u);
  printf("\n");
  printf(aj);
  // use retrun is not needed in Ultrac. if you want custom outcode, use it.
}

//Super importent!: use _ss var to call main.
// main return int. for that we use int _ss.

int _ss = main();
