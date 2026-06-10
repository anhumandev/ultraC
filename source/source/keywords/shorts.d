module keywords.shorts;
import std.string;
import std.stdio;
import app;
import std.algorithm;
import std.file;
import core.stdc.stdlib;
import std.regex;
import std.conv;
import error.normal;


void short_ultrac(string line){
    // just normal int creation.
    auto uai = regex(`short (\S+) (\S+) (\S+);`);
    auto aj = match(line, uai);
    if (!aj.empty){
            if (aj.captures[2] == "="){
                try {
				    shop[to!string(aj.captures[1])] = to!short(aj.captures[3]);
                } catch(Exception e){
                    prerror("The syntax is wrong.");
                }
            } else {
                writeln("\033[1mUltraC " ~ __DATE__ ~ ": \033[31mUnknown operator.\033[0m");
				exit(-1);
            }
        } else {
            writeln("\033[1mUltraC " ~ __DATE__ ~ ":\033[31m The placement order was not followed. Or a value was not placed.\033[0m");
			exit(-1);
        }
    }