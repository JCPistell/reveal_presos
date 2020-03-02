## Python Development Best Practices

---

## Agenda

1. A Pragmatic Environment
2. Program Structure
3. Defensive Coding
4. Testing
5. Automate The World


---

## Why Python?

- In short, no matter what the problem is, Python is the 2nd or 3rd best choice to tackle it.
- It's ubiquitous... runs on everything
- It excels as a "glue language"

---

## Part I: A Pragmatic Environment

1. Shell Games
2. The Problem with Python
3. All Hail the Pipfile
4. Too Many Slides About Text Editors

---

## Shell Games

All craftsmen need a solid workbench to support their work. That is what the command line is. There is no escape, so you
may as well embrace the benefits.

--

## Making it work

get to know your `.bash_profile`

---

## The Problem with Python

Dependency management sucks

--

## The old way

Virtualenvs

--

## Pyenv and Pipenv

All hail the pipfile


---

## Text Editors in brief

Go for something simple and extensible. There are a few good options:

1. Sublime
2. Atom
3. VS Code

--

## my $0.02

- These days, if you're starting off, probably use VSCode
- Avoid IDEs (e.g. pycharm etc.). Not worth the resource intensity and it makes you weak.

--

## An elegant weapon...

![elegant](media/elegant_weapon.gif)

The true Jedi uses vim

---

## Part II: Code Structure

1. Everything in a function
2. Script Structure
3. The `__main__` Event
4. `argparse()`
5. Keep it clean
6. Exercise: FizzBuzz

---

## Everything in a function

![srp](media/srp.jpeg)

---

## Script Structure

![structure](media/code_structure.png)

---

## the __main__ event

You may have seen this before:

```
if __name__ == "__main__":
  <stuff>
```

So what does it mean?

---

## argparse

`argparse` is a python library that makes adding command-line arguments to your module extremely easy. Let's look at a
bare-bones example:

```python
import argparse
parser = argparse.ArgumentParser()
parser.parse_args()
```

--

## argparse

Let's add an argument:

```python
parser = argparse.ArgumentParser()
parser.add_argument("--foo", type=int)
args = parser.parse_args()

print(args.foo)
```

--

A more complete example:

```python
import argparse


def combobulator(num):

  if num % 2 == 0:
    print(f"{num} is even")

  return num * 2

if __name__ == "__main__":
  parser= = argparse.ArgumentParser()
  parser.add_argument("--entry", type=int)
  args = parser.parse_args()

  res = combobulator(args.entry)
  print(res)
```

---

## Linting

This may seem pedantic but it's really important.

--

## Linting Options

1. `flake8`
2. `black`

IMO: Use `flake8` and set your editor to auto-lint in some sane fashion

---

## Exercise Time

Exercise: fizzbuzz!

---

## Part III: Defensive Coding

1. Orthoginality & Decoupling
2. The Evils of Duplication
3. Dead Programs Tell No Lies

--

Make changing stuff easy

---

## Orthoginality & Decoupling

```python
def apply_discount(customer, order_id, discount):
  totals = customer
    .orders
    .find(order_id)
    .get_totals()

  totals.grand_total = totals.grand_total - discount
```

--

## Orthoginality & Decoupling

```python
def apply_discount(customer, order_id, discount):
  customer
    .find_order(order_id)
    .discount(discount)
```

---

## The Evils of Duplication

Keep your code DRY

--

## Duplication: The many-headed hydra

```python
```

--

```python
def adder(a, b)
  """
  This function accepts two arguments, named a and b. It adds the two arguments together, b first followed by a and then
  returns the results
  """

  return b + a
```

--

```python
class line():

  def __init__(self, a, b, length):
    self.a = a
    self.b = b
    self.length = length
```

---

## Dead Programs Tell No Lies

Kill your scripts at the point of error

--

```python
from math import pi, sqrt

def circle_area(r):
  return pi * r**2

def swizzler(radius_float)
  area = circle_area(radius_float)

  if sqrt(area) < 10:
    print("your circle is too small!")
  else
    print("circle is good")
```

--

## Assertiveness

aka The Best Defense is...

```python
from math import pi, sqrt

def circle_area(r):
  assert type(r) in (float, int) and r > 0, "Please ensure radius is a positive number"
  return pi * r**2
```

---

## Part IV: Testing

1. Why Test?
2. Learn `pytest` in 60 seconds
3. Exercise: Our first test
4. Fixtures
5. Mocking
6. Test Driven Development is like LSD
7. Exercise: Test Time

---

## Why test?

![testing](media/testing_bears.gif)

Slow is smooth, smooth is fast

--

## Exercise: Learn `pytest` in 60 seconds

pytest assert exercise

--

## Our First Test

calculatron

---

## Fixtures

---

## Mocking

---

## Test Driven Development

You should try it, but there are risks


---

## Exercise: Test Time

- Write a function that hits a specific api endpoint
- This endpoint returns a json in the form of `{"key": <list of ints>}`
- Return the largest absolute value int
- Write a test suite to validate

---

## Automate the world
### CI/CD for people in a hurry

Github actions
