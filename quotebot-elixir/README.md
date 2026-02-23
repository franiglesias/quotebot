# Legacy Testing Kata - Elixir Version

This is the Elixir implementation of the Legacy Testing Kata.

## Prerequisites

- Elixir 1.14 or higher
- Mix (comes with Elixir)

## Running the code

### 1. Install dependencies

```bash
cd quotebot-elixir
mix deps.get
```

### 2. Set the required environment variable

The application requires a `LICENSE` environment variable to run:

```bash
# Linux/Mac/Unix
export LICENSE=quotebot-license

# Windows (CMD)
set LICENSE=quotebot-license

# Windows (PowerShell)
$env:LICENSE="quotebot-license"
```

### 3. Try to run it

**Important:** The code will NOT run successfully as-is. This is intentional!

```bash
# Try to compile
mix compile

# Try to run
mix run -e "Quotebot.Application.run()"

# Or build an escript
mix escript.build
./quotebot
```

**Warning:** If you manage to get past the compilation errors, the application will:
- Exit immediately with an error (calls `System.halt(1)`)
- Take ~5 seconds to run due to intentionally slow database access
- Return random values (non-deterministic behavior)

## The Challenge

This legacy codebase resists testing. Your goal is to make it testable so you can:
1. Add tests to verify behavior
2. Fix the FIXMEs in the code safely
3. Refactor the code with confidence

The code has two FIXMEs that need to be addressed:

1. In `lib/blog_auction_task.ex`: The proposal calculation should be `+2` not `+1`
2. In `lib/ad_space.ex`: Should only return blogs that start with a 'T'

However, the codebase is **intentionally difficult to test and even run**. Your goal is to:

1. **First, fix the compilation/runtime issues** to make the code runnable
2. **Then, make the code testable** by refactoring to enable dependency injection and removing hard dependencies
3. **Write tests** to verify the current behavior
4. **Make the changes** indicated by the FIXMEs
5. **Verify** your changes work correctly with your tests

## Legacy Code Problems in This Kata

### Lack of Dependency Injection
- Static entry point with no args
- Hard-coded instantiation of services
- Dependencies create their own dependencies
- Global cache state (using process dictionary or Agent)

### Implementation Issues
- Very slow service (5 second sleep in `TechBlogs.list_all_blogs/0`)
- Hidden dependency on LICENSE environment variable
- Random return value → non-deterministic tests
- Production service that calls `System.halt(1)` (exits the VM!)

### Other Challenges
- `DateTime.utc_now()` in calculations → non-deterministic tests
- High combinatorial complexity in calculations
- Stateful behavior from internal cache (first call different from subsequent calls)
- Heavy dependency called within loop with different values

### Elixir-Specific Issues
- The code has **deliberate problems** that will prevent it from running:
  - Module/function naming issues
  - Missing module definitions
  - Incorrect function calls
  - These need to be fixed before you can even run the application!

## Running Tests

```bash
# Run all tests
mix test

# Run with verbose output
mix test --trace

# Run specific test file
mix test test/quotebot_test.exs
```

## Project Structure

```
quotebot-elixir/
├── lib/
│   ├── application.ex              # Entry point
│   ├── automatic_quote_bot.ex      # Main bot logic
│   ├── blog_auction_task.ex        # Pricing and publishing (has FIXME)
│   ├── ad_space.ex                 # Ad spaces with cache (has FIXME)
│   ├── tech_blogs.ex               # Slow database simulation
│   └── thirdparty/                 # External dependencies
│       ├── market_study_vendor.ex  # Requires license
│       └── quote_publisher.ex      # Production service (exits!)
├── test/
│   ├── test_helper.exs
│   └── quotebot_test.exs
├── mix.exs                         # Project configuration
└── README.md
```

## Getting Started

Try to run the code first. You'll encounter compilation/runtime issues right away!

Then, work on making the code runnable and testable by addressing the problems above.

Good luck!
