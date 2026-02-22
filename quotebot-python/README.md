# Legacy Testing Kata - Python Version

A legacy codebase that resists testing.

First try to run it.

Then your goal is to make it testable so that you can make changes (FIXME inside) and perhaps refactor it a bit.

This is a Python port of the original Java kata, which draws on a C# code kata authored by my distinguished colleague Nicolas M.; Thanks Nicolas for the good ideas in the kata!

## Prerequisites

- Python 3.8 or higher
- pip (Python package installer)
- (Optional) A virtual environment tool like `venv` or `virtualenv`

## How to Run

### 1. Create and activate a virtual environment (recommended)

```bash
# Create virtual environment
python -m venv venv

# Activate on Linux/Mac
source venv/bin/activate

# Activate on Windows
venv\Scripts\activate
```

### 2. Install the package

```bash
# Install in development mode (editable)
pip install -e .

# Install development dependencies for testing
pip install -r requirements-dev.txt
```

### 3. Set the required environment variable

The application requires a `license` environment variable to run:

```bash
# Linux/Mac
export license=dummy

# Windows (CMD)
set license=dummy

# Windows (PowerShell)
$env:license="dummy"
```

### 4. Run the application

```bash
# Using the installed script
quotebot

# Or directly with Python
python -m quotebot.application
```

**Warning:** The application will display dialog boxes and takes ~5 seconds to run due to the intentionally slow database access.

## Running Tests

```bash
# Run all tests
pytest

# Run with verbose output
pytest -v

# Run with coverage report
pytest --cov=quotebot

# Generate HTML coverage report
pytest --cov=quotebot --cov-report=html
# Open htmlcov/index.html in your browser
```

## Project Structure

```
quotebot-python/
├── quotebot/              # Main package
│   ├── __init__.py
│   ├── application.py     # Entry point
│   ├── automatic_quote_bot.py
│   ├── blog_auction_task.py
│   ├── ad_space.py
│   ├── tech_blogs.py
│   └── thirdparty/        # External dependencies
│       ├── market_study_vendor.py
│       └── quote_publisher.py
├── tests/                 # Test directory
│   ├── __init__.py
│   └── test_example.py
├── pyproject.toml         # Project configuration
├── requirements-dev.txt   # Development dependencies
└── README.md
```

## The Challenge

This legacy codebase resists testing. Your goal is to make it testable so you can:
1. Add tests to verify behavior
2. Fix the FIXMEs in the code safely
3. Refactor the code with confidence

The code has two FIXMEs that need to be addressed:

1. In `blog_auction_task.py`: The proposal calculation should be `+2` not `+1`
2. In `ad_space.py`: Should only return blogs that start with a 'T'

However, the codebase is **intentionally difficult to test**. Your goal is to:

1. **First, make the code testable** by refactoring to enable dependency injection and removing hard dependencies
2. **Write tests** to verify the current behavior
3. **Make the changes** indicated by the FIXMEs
4. **Verify** your changes work correctly with your tests

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
