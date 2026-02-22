# Legacy Testing Kata - Go Version

This is the Go implementation of the Legacy Testing Kata.

## Running the code

```bash
go run cmd/quotebot/main.go
```

## The Challenge

This legacy codebase resists testing. Your goal is to make it testable so you can:
1. Add tests to verify behavior
2. Fix the FIXMEs in the code safely
3. Refactor the code with confidence

## Legacy Code Problems in This Kata

### Lack of Dependency Injection
- Static main with no args
- Hard-coded instantiation of services
- Dependencies create their own dependencies
- Package-level static cache

### Implementation Issues
- Very slow service (5 second sleep)
- Hidden dependency on LICENSE environment variable
- Random return value → non-deterministic tests
- Production service that calls `os.Exit()`

### Other Challenges
- `time.Now()` in calculations → non-deterministic tests
- High combinatorial complexity in calculations
- Stateful behavior from internal cache (first call different from subsequent calls)
- Heavy dependency called within loop with different values

## Getting Started

Try to run the code first. You'll likely encounter issues right away!

Then, work on making the code testable by addressing the problems above.

Good luck!
