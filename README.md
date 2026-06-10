# UltraC
<p align="center">
  <img src="logo.jpg" width="300">
</p>
Ultra C is still in development, is not for general use, and has problems and bugs.

# What is Ultra C?
Ultra C is a simple, uncomplicated interpreter written more for learning purposes than for industrial or large-scale use. 
My goal in writing Ultra C was to both teach myself C from a different perspective and to try to create a fast interpreter without the need for AST or tokenization.

# Is it usable?
It's actually usable, but it has a lot of bugs. But overall, in this version (version 0.1) it only supports the printf and return functions, along with a few data types. Also, newline escape.

# Whats work?
The changes work for the most part and are bug-free. But there are some things that are a bit problematic. 
I've listed them below:
  1. `long`: I still don't understand why it returns a syntax error when using it. But the bug attribute has changed from string to long.
  2. `string`: It gives a syntax error in ‍`c main`, but if you define it outside the function, it doesn't give an error.

# Whats `UltraC v0.1BETA` Support?
  1. `short`
  2. `double`
  3. `printf`
  4. `return`
  5. `char`
  6. `main`
  7. `int`

# Syntax in UltraC
The syntax may seem a bit intimidating, but it's very easy.
  1. Always put a space after main before the brackets. (`int main() {`)
  2. Always in end of file/program use ` _ss` and inside it call `main`. (`int _ss = main();`)


# How can I try it myself?
It's very simple. You just need to clone this repo with git first. (`git clone https://github.com/anhumandev/ultraC.git`) Then if dmd is not installed on your system, install its latest version based on your Linux or Windows distro. 
Then compile it with dub (`dub`) and run the output. (`./ultrac -h`)
