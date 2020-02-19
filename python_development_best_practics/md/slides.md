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

In short, no matter what the problem is, Python is the 2nd or 3rd best choice to tackle it.


---

## Shell Games

All craftsmen need a solid workbench to support their work. That is what the command line is. There is no escape, so you
may as well embrace the benefits.


--

## Make it work

get to know your `.bash_profile`

---

## The Problem with Python

Dependency managment sucks

--

## The old way

Virtualenvs

--

## Pyenv and Pipenv

All hail the pipfile


--

## Installing the toolkit

You didn't do your homework!

```
brew install pyenv
brew install pipenv
echo stuff into bash_profile
```

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

## Everything is a function

![srp](media/srp.jpeg)

---

## the __main__ event

You may have seen this before:

```
if __name__ == "__main__":
  <stuff>
```

So what does it mean?

--

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

--

## Exercise Time

Exercise: fizzbuzz!

---

## The Evils of Duplication

Keep your code DRY

--

## Duplication: The many-headed hydra

Group Exercise: Find the duplication and fix it

---

## Defensive Programming

Dead Programs Tell No Lies

---

## Assertiveness

aka The Best Defense is...

---

## Unit Testing

Slow is smooth, smooth is fast

--

pytest assert exercise

--

calculator

---

## Mocking


---

## Automate the world
### CI/CD for people in a hurry

Github actions
