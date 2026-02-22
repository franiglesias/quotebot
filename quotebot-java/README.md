legacy-testing-kata-java
========================

A legacy codebase that resist a bit testing.

First try to run it.

Then your goal is to make it testable so that you can make changes (FIXME inside) and perhaps refactor it a bit.

This code draws on a C# code kata authored by my distinguished colleague Nicolas M.; Thanks Nicolas for the good ideas in the kata!

## How to Run

### Prerequisites

- Java 8 or higher
- Maven 3.x

### Build the project

```bash
mvn clean compile
```

### Run the application (currently does not work)

```bash
mvn exec:java -Dexec.mainClass="com.arolla.legacy.testing.quotebot.Application"
```

**Note**: The application currently does not work due to dependencies with testing issues (licenses, user dialogs, slow services, etc.).

### Setup the environment to write tests

1. Make sure you have testing dependencies in `pom.xml` (JUnit, Mockito, etc.)

2. Compile including test classes:

```bash
mvn clean test-compile
```

3. Run the tests:

```bash
mvn test
```

4. Create a test class in `src/test/java/` following the same package structure as the classes to test.

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
