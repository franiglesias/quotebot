# Legacy Testing Kata - TypeScript Version

A legacy codebase that resists testing.

First try to run it.

Then your goal is to make it testable so that you can make changes (FIXME inside) and perhaps refactor it a bit.

This code draws on a C# code kata authored by my distinguished colleague Nicolas M.; Thanks Nicolas for the good ideas in the kata!

## Prerequisites

- Node.js 18 or higher
- npm 9 or higher

## How to Run

### 1. Install dependencies

```bash
npm install
```

### 2. Build the project

```bash
npm run build
```

### 3. Run the application

```bash
npm start
```

**Note**: The application will fail with a license error unless you set the LICENSE environment variable. However, setting it in development/testing is not recommended as it would call real services.

## Running Tests

```bash
# Run tests once
npm test

# Run tests in watch mode (development)
npm run test:watch

# View visual test interface
npm run test:ui

# Run tests with coverage
npm run test:coverage
```

## Available Scripts

### Build

```bash
# Build the project
npm run build

# Build in watch mode (automatically recompiles)
npm run build:watch

# Clean compiled files
npm run clean
```

### Linting

```bash
# Check code with ESLint
npm run lint

# Fix issues automatically
npm run lint:fix
```

## Project Structure

```
quotebot-ts/
├── src/           # TypeScript source code
├── lib/           # Vendor code (DO NOT MODIFY)
├── dist/          # Compiled JavaScript files
├── node_modules/  # Dependencies
└── ...
```

## Configuration

### TypeScript
- TypeScript files are in `src/` and `lib/`
- Compiled files are generated in `dist/`
- Configuration: `tsconfig.json`

### ESLint
- Configured to NOT use semicolons at the end of lines
- Ignores compiled `.js` files and the `dist/` folder
- Configuration: `eslint.config.mjs`

### Vitest
- Testing framework configured with TypeScript support
- Includes code coverage with v8
- Configuration: `vitest.config.ts`

## The Challenge

This legacy codebase resists testing. Your goal is to make it testable so you can:
1. Add tests to verify behavior
2. Fix the FIXMEs in the code safely
3. Refactor the code with confidence

**Important note:** You must not touch the `lib` folder, as it is considered vendor code. The purpose of the exercise is to practice how to deal with these problems without touching that vendor code, and without setting a LICENSE environment variable in dev/local/test environments.

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

At first, you won't be able to test it, so you should rely on proven refactoring techniques, some of them could be provided by your IDE.

One interesting suggestion is to define and keep two environments for this exercise: one that simulates a **production** setting, and one for **development/testing**. This way, you can introduce changes and see how they would affect the production side. You should commit **small sets of changes** that don't break the application in the production environment.

Try to run the code first. You'll likely encounter issues right away!

Then, work on making the code testable by addressing the problems above.

Good luck!
