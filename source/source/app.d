import std.stdio;
import core.stdc.stdlib;
import std.file;
import std.regex;
import std.algorithm;
import std.string;
import std.conv;
import keywords.lauto;
import keywords.volatilep;
import error.normal;
import keywords.chars;
import keywords.doubles;
import keywords.longs;
import keywords.shorts;
import keywords.strs;
import keywords.shorts;
import keywords.intl;
string ver = "0.1";
int[string] jaj;
double[string] doub;
string[string] strs;
long[string] longs;
char[string] chars;
short[string] shop;

void main(string[] args)
{
	if (args.length < 2){
		writeln("\033[1mUltraC " ~ __DATE__ ~ ": \033[31m No files have been imported.\033[0m");
		exit(-1);
	} else if (args[1] == "--help" || args[1] == "-h"){
		writeln("\033[1mUltraC " ~ __DATE__ ~ " " ~  ver);
		writeln("	Usage: ./ultraC [flag] [options]");
		writeln("\nFlags:");
		writeln("	--help | -h			Show current menu.");
		writeln("	--enter | -e [options=filepath] run a .c program.");
		writeln("\033[0m");
	} else if (args[1] == "--enter" || args[1] == "-e"){
		if (exists(args[2])){
			auto fi = File(args[2]);
			int brcount = 0;
			int linenum = 0;
			int wherisbr;
			int wherisbr2 = 0;
			int kaa = 0;
			string tua;
			foreach(line; fi.byLine()){
				linenum = linenum++;
				if (kaa == 1){
					if (line.startsWith("}")){
						kaa = 0;
						continue;
					}
					tua = tua ~ "\n" ~ to!string(line);
				} else if (line.startsWith("int")){
					auto oa = regex(`int (\S+) (\S+)`);
					auto ab = match(line, oa);
					if (!ab.empty)
					{
						if (ab.captures[1] == "main()"){
							if (ab.captures[2] == "{"){
								kaa = 1;
								continue;
							} else {
								writeln("\033[1mUltraC " ~ __DATE__ ~ ": \033[31m " ~ args[2] ~ ": The bracket for the defined function is not opened.");
			                    exit(-1);
							}
						} else if (ab.captures[1] == "_ss"){
							if (ab.captures[2] == "="){
								auto ah = regex(`_ss \= (\S+)\;`);
								auto ah1 = match(line, ah);
								if (!ah1.empty){
									if (ah1.captures[1] == "main()"){
										if (tua != null){
											//writeln(tua);
											foreach (tuaaa; tua.splitLines())
											{
												//writeln(tuaaa);
												string tuaa = strip(tuaaa);
												if (tuaa.empty) { continue; }
												if (tuaa.startsWith("printf")){
													auto ma = regex(`printf\("([^"]+)"\);`);
													auto m2 = match(tuaa, ma);
													if (!m2.empty){
														if (m2.captures[1] == "\n"){
															writeln("");
														} else {
															auto m2a = m2.captures[1].replace("\\n", "\n");
															write(m2a);
														}
														
													} else {
													    auto mb = regex(`printf\(([^;)]+)\);`);
														auto mq2 = match(tuaa, mb);
														if (!mq2.empty){
															if (mq2.captures[1] in jaj) {
																//writeln(mq2.captures[1]);
																write(jaj[to!string(mq2.captures[1])]);
															} else if (mq2.captures[1] in strs) {
																write(strs[to!string(mq2.captures[1])]);
															} else if (mq2.captures[1] in shop) {
																write(shop[to!string(mq2.captures[1])]);
															} else if (mq2.captures[1] in longs) {
																write(longs[to!string(mq2.captures[1])]);
															} else if (mq2.captures[1] in chars) {
																write(chars[to!string(mq2.captures[1])]);
															} else if (mq2.captures[1] in doub) {
																write(doub[to!string(mq2.captures[1])]);
															} else {
																writeln("\033[1mUltraC " ~ __DATE__ ~ ": \033[31mA variable with this name is not defined.\033[0m");
																exit(-1);
															}
														} else {
															writeln("\033[1mUltraC " ~ __DATE__ ~ ": \033[31mA string is not included in the printf. Or a semicolon is not included.\033[0m");
															exit(-1);
														}
													}
												} else if (tuaa.startsWith("return")) {
													auto ma = regex(`return (\S+);`);
													auto m4 = match(tuaa, ma);
													if (!m4.empty){
														wherisbr = to!int(m4.captures[1]);
														exit(wherisbr);
													} else {
														writeln("\033[1mUltraC " ~ __DATE__ ~ ": \033[31m A number is not included in the return. Or a semicolon is not included.\033[0m");
														exit(-1);
													}
												} else if(tuaa.startsWith("\\")){
													continue;
												} else if (tuaa.startsWith("auto")){
													auto_ultrac(tuaa);
												} else if (tuaa.startsWith("volatile")){
													volatile_ultrac(tuaa);
												} else if (tuaa.startsWith("double")){
													double_ultrac(to!string(tuaa));
												} else if (tuaa.startsWith("char")){
													chars_ultrac(to!string(tuaa));
												} else if (tuaa.startsWith("string")){
													str_ultrac(to!string(tuaa));
												} else if (tuaa.startsWith("int")){
													int_ultrac(to!string(tuaa));
												} else if (tuaa.startsWith("long")){
													long_ultrac(to!string(tuaa));
												} else if (tuaa.startsWith("short")){
													short_ultrac(to!string(tuaa));
												} else if (tuaa.startsWith("//")){
													
												} else {
													writeln(tuaa);
													writeln("\033[1mUltraC " ~ __DATE__ ~ ": \033[31m A function or keyword with this value does not exist or is not defined.\033[0m");
													exit(-1);
												}
											}
											
										}
									} else {
										writeln("\033[1mUltraC " ~ __DATE__ ~ ": \033[31m The value of _ss should always be equal to the main runtime function of the program.\033[0m");
										exit(-1);
									}
								}
							}
						} else {
							if (ab.captures[2] == "="){
								auto ga = regex(`\= (\S+)\;`);
								auto ba = match(line, ga);
								if (!ga.empty){
									jaj[to!string(ab.captures[1])] = to!int(ba.captures[1]);								}
								} else {
									writeln("\033[1mUltraC " ~ __DATE__ ~ ": \033[31m To assign a value to this data type, you must use the equal sign.\033[0m");
										exit(-1);
								}
						}
					} else {
						writeln("\033[1mUltraC " ~ __DATE__ ~ ":\033[31m The placement order was not followed. Or a value was not placed.\033[0m");
						exit(-1);
					}
				} else if (line.startsWith("double")){
					double_ultrac(to!string(line));
				} else if (line.startsWith("auto")){
					auto_ultrac(to!string(line));
				} else if (line.startsWith("char")){
					chars_ultrac(to!string(line));
				} else if (line.startsWith("string")){
					str_ultrac(to!string(line));
				} else if (line.startsWith("long")){
				    long_ultrac(to!string(line));
				} else if (line.startsWith("short")){
					short_ultrac(to!string(line));
				}
			}
		} else {
			writeln("\033[1mUltraC " ~ __DATE__ ~ ": \033[31m" ~ args[2] ~ "does not exist externally on disk.\033[0m");
			exit(-1);
		}
	}
}
