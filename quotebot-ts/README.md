QuoteBot legacy kata
===

This is a code exercise to practice how to manage and improve legacy code. It's not very big, and you can make it evolve progressively:

* Make it run. The current code doesn't run at all in a local development environment. And it does, it is wasting money on every run.
* Make it testable and create some tests. There are lots of coupling, at least for a very small project like this.
* Refactor and fix. Introduce some sanity in the code.
* Make it evolve, so it becomes a well-structured application. It would be nice. Make it Hexagonal, or Layered... or whatever interesting architecture you want to try.
* Change implementations of the `QuotePublisher` so you can get a good report of the job that this bot is doing.

## Notes from the original README:

A legacy codebase that resist a bit testing, by Cyrille Martraire.

[Original kata](https://github.com/cyriux/legacy-testing-kata-java)

First try to run it.

Then your goal is to make it testable so that you can make changes (FIXME inside) and perhaps refactor it a bit.

This code draws on a C# code kata authored by my distinguished colleague Nicolas M.; Thanks Nicolas for the good ideas in the kata!

## Personal notes about this kata

This kata is very interesting to practice several refactor techniques.

At first, you won't be able to test it, so you should rely on proven refactor techniques, some of them could be provided by your IDE.

One interesting suggestion is to define and keep two environments for this exercise: one that simulates a **production** setting, and one for the **development/testing**. This way, you can introduce changes and see how they would affect the production side. You should commit **small sets of changes** that doesn't break the application in production environment.

## Prerequisites

- Node.js 18 or higher
- npm 9 or higher

## Initial Setup

1. Clone or download this repository
2. Install dependencies:

```shell
npm install
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

## Available Scripts

### Build

```shell
# Build the project
npm run build

# Build in watch mode (automatically recompiles)
npm run build:watch

# Clean compiled files
npm run clean
```

### Testing

```shell
# Run tests once
npm test

# Run tests in watch mode (development)
npm run test:watch

# View visual test interface
npm run test:ui

# Run tests with coverage
npm run test:coverage
```

### Linting

```shell
# Check code with ESLint
npm run lint

# Fix issues automatically
npm run lint:fix
```

### Execution

```shell
# Build and run the project
npm start
```

## Environment Configuration

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

## Kata Notes

This project is a legacy code exercise. **DO NOT MODIFY** the `lib/` folder as it is considered vendor code.

### Initial Problem

When you run the code you will see a license error:

```shell
npm start
```

```text
Error [InvalidLicenseError]: [Stupid license] Missing license!!!!
```

You could use an environment variable `LICENSE='quotebot-license'` to make it work, but:
1. In a real environment this would cost money
2. It's not portable or suitable for development/testing

### Goal

The goal is to make the code testable and refactor it without:
- Modifying the `lib/` folder
- Using environment variables in development/testing
- Spending money on real services during development

**Important note:** you must not touch the `lib` folder, given it is considered a vendor. In fact, the purpose of the exercise is to practice how to deal with these problems without touching that vendors, and without setting a LICENSE env variable in the dev/local/test environments.

## Where to start? Extracted notes from the original

If you hesitate where to start, here are some of the tricky bits that make it hard to test:

* Lack of dependency injection:
* A static main with no args
* Static service
* Hard-coded instantiation of a service that itself instantiates its dependencies, and again

Implementation issues:

* Very slow service
* Hidden dependency to a license key in env variable
* Random return value -> non-deterministic test
* Dialog popping up prompting for user input

Other tricks:

* New Date() in the middle of calculations -> non-deterministic test
* High combinatorial of calculations lead to too many required test cases
* Stateful behavior from internal cache: first call different from next calls
* Heavy dependency called within a large loop with different values
* Use a dependency or another depending on the passed parameter

