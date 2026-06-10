module error.normal;
import std.stdio;
import core.stdc.stdlib;

void prerror(string errortxt){
    writeln("\033[1mUltraC " ~ __DATE__ ~ ":\033[31m" ~ errortxt ~"\033[0m");
	exit(-1);
}