`arith`, a simple language with stores and arithmetic expressions.

see lecture 2 slides and notes for information:
https://www.cs.cornell.edu/courses/cs4110/2021fa/schedule.html

```
# example.arith

foo := 4;
bar := 3;

(foo + 2) * (bar + 1)
```

```
$ arith.exe example.arith
= 24
```

## run

1. have `menhir` installed with opam
1. build with `dune build`
1. test with `dune exec arith` (for stdin, or pass a file)

---

note that I'm not affiliated with Cornell in any way, I simply found the lecture notes and decided to implement the languages presented therein.