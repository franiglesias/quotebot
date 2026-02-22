# Legacy Testing Kata - Java Version

A legacy codebase that resists testing.

First try to run it.

Then your goal is to make it testable so that you can make changes (FIXME inside) and perhaps refactor it a bit.

This code draws on a C# code kata authored by my distinguished colleague Nicolas M.; Thanks Nicolas for the good ideas in the kata!

## Prerequisites

- Java 8 or higher
- Maven 3.x

## How to Run

### Build the project

```bash
mvn clean compile
```

### Run the application (currently does not work)

```bash
mvn exec:java -Dexec.mainClass="com.arolla.legacy.testing.quotebot.Application"
```

**Note**: The application currently does not work due to dependencies with testing issues (licenses, user dialogs, slow services, etc.).

## Running Tests

```bash
# Compile test classes
mvn clean test-compile

# Run all tests
mvn test
```

## The Challenge

This legacy codebase resists testing. Your goal is to make it testable so you can:
1. Add tests to verify behavior
2. Fix the FIXMEs in the code safely
3. Refactor the code with confidence

## Legacy Code Problems in This Kata

### Lack of Dependency Injection
- A static main with no args
- Static service
- Hard-coded instantiation of a service that itself instantiates its dependencies, and again

### Implementation Issues
- Very slow service
- Hidden dependency on LICENSE environment variable
- Random return value → non-deterministic tests
- Dialog popping up prompting for user input

### Other Challenges
- New Date() in calculations → non-deterministic tests
- High combinatorial complexity in calculations
- Stateful behavior from internal cache (first call different from subsequent calls)
- Heavy dependency called within loop with different values
- Use a dependency or another depending on the passed parameter

## Getting Started

Try to run the code first. You'll likely encounter issues right away!

Then, work on making the code testable by addressing the problems above.

Good luck!
