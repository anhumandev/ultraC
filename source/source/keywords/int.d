module keywords.intl;
import std.string;
import std.stdio;
import app;
import std.algorithm;
import std.file;
import core.stdc.stdlib;
import std.regex;
import std.conv;


void int_ultrac(string line){
    // just normal int creation.
    auto uai = regex(`int (\S+) (\S+) (\S+);`);
    auto aj = match(line, uai);
    if (!aj.empty){
            if (aj.captures[2] == "="){
                try {
                    jaj[to!string(aj.captures[1])] = to!int(aj.captures[3]);
                } catch (Exception e){
                    perror("The syntax is wrong.");
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