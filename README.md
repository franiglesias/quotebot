Legacy Testing Kata
===================

Original description from https://github.com/cyriux/legacy-testing-kata-java by [Cyrille Martraire](https://github.com/cyriux)

A legacy codebase that resist a bit testing.

First try to run it. 

Then your goal is to make it testable so that you can make changes (FIXME inside) and perhaps refactor it a bit.

This code draws on a C# code kata authored by my distinguished colleague Nicolas M.; Thanks Nicolas for the good ideas in the kata!

--

If you hesitate where to start, here are some of the tricky bits that make it hard to test:

Lack of dependency injection:
- A static main with no args
- Static service
- Hard-coded instantiation of a service that itself instantiates its dependencies, and again

Implementation issues:
- Very slow service
- Hidden dependency to a license key in env variable
- Random return value -> non-deterministic test
- Dialog poping up prompting for user input

Other tricks:
- New Date() in the middle of calculations -> non-deterministic test
- High combinatorial of calculations lead to too many required test cases
- Stateful behavior from internal cache: first call different from next calls
- Heavy dependency called within a large loop with different values
- Use a dependency or another depending on the passed parameter


## Notes for this repository

### Why this kata?

I knew about this kata in a coding dojo at Codurance Barcelona. It is the first kata that helped me to understand how to put legacy code under test. So, It became one of my favorite exercises to put in practice refactoring and legacy code management technique.

So, I decided to put several versions of this kata in different languages for using in coding-dojos, courses, or as an example for blog posts.

Some of the versions available in this repository are:

1. [Java](quotebot-java)
2. [PHP](quotebot-php)
3. [Python](quotebot-python)
4. [TypeScript](quotebot-ts)
5. [Go](quotebot-go)
6. [Elixir](quotebot-elixir)

