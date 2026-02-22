# Legacy Testing Kata - PHP Version

A legacy codebase that resists testing.

First try to run it.

Then your goal is to make it testable so that you can make changes (FIXME inside) and perhaps refactor it a bit.

This code draws on a C# code kata authored by my distinguished colleague Nicolas M.; Thanks Nicolas for the good ideas in the kata!

## Prerequisites

- PHP 7.4 or higher
- Composer
- Docker and Docker Compose (optional, for containerized setup)

## How to Run

### Option 1: Local Setup

1. Install dependencies:

```bash
composer install
```

2. Run the application:

```bash
php run.php
```

**Important note:** You must not touch the `lib` folder, as it is considered vendor code.

### Option 2: Using Docker

1. Start the containers:

```bash
docker compose up -d
```

**Note**: If you're on Apple Silicon (M1/M2/M3), the `docker-compose.yml` already includes the necessary `platform: linux/amd64` configuration.

2. Install dependencies:

```bash
docker exec quotebot composer install
```

3. Run the application:

```bash
docker exec quotebot php run.php
```

4. Access the container:

```bash
docker exec -it quotebot bash
```

5. Stop the containers:

```bash
docker compose down
```

## Running Tests

### Local

```bash
vendor/bin/phpunit
```

### Docker

```bash
docker exec quotebot vendor/bin/phpunit
```

## Configuring PHPStorm with Docker

1. Start containers: `docker compose up -d`
2. Go to **PHP Storm > Preferences > Languages and Frameworks > PHP**
3. Click **CLI Interpreter…** and add Remote Interpreter from Docker
4. Select **docker-compose** and choose the **php-fpm** service
5. Configure XDebug port to 9001 in **PHP > Debug**
6. Add **PhpUnit by remote interpreter** in **Test Frameworks**
7. Set composer autoloader path: `vendor/autoload.php`
8. Select `phpunit.xml` as default configuration file

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

This kata is very interesting to practice several refactoring techniques.

At first, you won't be able to test it, so you should rely on secure refactoring techniques as provided by your IDE.

One interesting suggestion is to define and keep two environments for this exercise: one that simulates a **production** setting, and one for **development/testing**. This way, you can introduce changes and see how they would affect the production side. You should commit **small sets of changes** that don't break the application in the production environment.

Try to run the code first. You'll likely encounter issues right away!

Then, work on making the code testable by addressing the problems above.

Good luck!
