## Welcome!

Let's do a brief informal survey.

---

## What these sessions are about

- Jumpstarting
- Providing context
- Extra skills & tech you'll see "in the real world"

---

## Tonight's Agenda

1. command line & bash
2. food break
3. text editors
4. tool setup/Q&A?

---

## The Command Line

This is really **the** skill that separates developers from mere computer users.

--

Keep in mind that this is just another way of using your operating system. It requires more practice than a mouse, but is much more powerful.
<br>
<blockquote>"GUIs make easy things easier. Bash makes the impossible possible."</blockquote>

--

Let's use an analogy:

<div class="left">
    <img src="media/toyota.jpeg">
</div>

<div class="right">
    <img src="media/bugatti.jpg">
</div>

--

### With even more skill

![xwing](media/xwing.png)

--

<!-- .slide: data-background="media/barrel_roll.gif" data-background-transition="convex" -->
### Trust me, you'll need it...

--

<!-- .slide: data-background="#ed2939" -->
<p style="color: black">We must shift from <i>using</i> computers to <b>controlling them</b></p>

---

## Let's try it!

Navigate to [workshop.das42.com](https://workshop.das42.com) and sign in using your colorado gmail account.


---

## Why Bash & Linux?

- Linux is open-sourced Unix. It runs the internet. There is no escape.
- Bash is by far the most used shell language.
- Windows... is... well... just a terrible development platform (they're trying though)

---

## Where are we?

We can use the `pwd` command to get our current location... but it's usually part of our prompt.

More interestingly, we can use `ls` to 'list' the contents of our current working directory. Let's try it!

```bash
ls
```

--

### Parameters

We can enter in a number of parameters to any shell command that will impact the behavior of the command. For example, to print out the contents of our working directory in a convenient 'long' form, we can add the following:

```bash
ls -l
```

--

### Example

<asciinema-player src="/media/ls.cast" theme="monokai" cols="160" rows="30" idle-time-limit="3"></asciinema-player>

---

## RTFM

How do you know what a command does and what parameters are available for it? Read the &^%#ing manual, aka man pages!

For example, to see the man page for `ls` enter the following:

```bash
man ls
```

To quit, press `q`

--

### Example

<asciinema-player src="/media/man.cast" theme="monokai" cols="160" rows="30" idle-time-limit="3"></asciinema-player>

---

## Making a directory

Good directory structure is the basis of project organization. So let's make a directory!

```bash
mkdir test
```

Try `ls` again and you'll see your new directory.

---

### Navigation

Let's enter your new directory.

```bash
cd test
```

Notice your prompt changed! You can confirm with `pwd`

--

### Getting back

What if we want to back out to the parent directory?

```bash
cd ..
```

The .. is a bash shorthand for 'the parent directory'

--

### Example

<asciinema-player src="/media/mkdir.cast" theme="monokai" cols="160" rows="30" idle-time-limit="3"></asciinema-player>

---

## Relative vs. Absolute

This is a topic that confuses a lot of people, but it's actually pretty easy:

- A Relative path means 'how do I get to there from where I currently am?'
- An Absolute path means 'how do I get there from root?'

```bash
# Relative path to home directory:
cd ..
# Absolute path to home directory
cd /home/jcpistell
```

---

## Root vs. Home

Unix is multi-user, meaning every user on a system has their own home directory, but there is only one root.

- Shortcut for getting to root is `cd /`
- Shortcut for getting to your home is `cd ~`

Generally speaking, don't mess with anything in root unless you know what you're doing.

---

## stdin, stdout, stderr

These are the standard I/O channels available

- `stdin`: your keyboard
- `stdout`: your terminal screen
- `stderr`: also your terminal screen :)

---

## Working with files

Navigate back to your test directory

```bash
cd ~/test
```

Now let's create a simple text file. We'll break down what all these steps mean next

```bash
echo hello world > hello.txt
```

--

## echo

`echo` will print something to stdout. This can be regular text or variables. For example:

```bash
echo hello world
```

--

### Redirection

The `>` character is used to redirect stdout to somewhere else... typically a file.


--

### Example

<asciinema-player src="/media/file.cast" theme="monokai" cols="160" rows="30" idle-time-limit="3"></asciinema-player>

---

### Reading contents of a file

Did the last step work? Let's find out!

```bash
cat hello.txt
```
`cat` will read the contents of a file and push them to stdout.

Note that you can tab-complete most things... so type `cat he` and then press tab. Magic!

---

### Moving, Copying, and Deleting

Let's first make a subdirectory:

```bash
mkdir subdirectory
```

Now we can copy our text file into the new subdirectory:

```bash
cp hello.txt subdirectory
```

--

Let's remove it.

```bash
cd subdirectory
rm hello.txt
```

**Always keep in mind that `rm` has no confirmation and no undo! Be very very careful!**

--

Now let's try moving the file instead.

```bash
cd ..
mv hello.txt subdirectory
```

--

### Example

<asciinema-player src="/media/cp.cast" theme="monokai" cols="160" rows="30" idle-time-limit="3"></asciinema-player>

---

### (slightly) More Advanced

Let's do some neat-o things. It's okay if this doesn't make complete sense right now. Come back later and repeat the steps... it'll click pretty fast.

--

### Step 1: Create two files

```bash
echo Hello there. > hello.txt
echo How are you? > how.txt
```

--

### Step 2: Combine them into a new file

```bash
cat hello.txt how.txt > combined.txt
cat combined.txt
```

--

### Example

<asciinema-player src="/media/comb.cast" theme="monokai" cols="160" rows="30" idle-time-limit="3"></asciinema-player>

---

## Getting things from the internet

We can use `curl` to grab stuff from the internet

```bash
curl https://www.colorado.edu
```

--

### We can get files too...

```bash
curl http://www.gutenberg.org/files/1513/1513-0.txt
```

- We can redirect stdout to a file
- We can also make use of the -o flag

--

```bash
curl http://www.gutenberg.org/files/1513/1513-0.txt > rj.txt
```
...is equivalent to

```bash
curl http://www.gutenberg.org/files/1513/1513-0.txt -o rj.txt
```

--

`curl` is extremely useful for all kinds of http requests... making it vital for using REST APIs

--

### Example

<asciinema-player src="/media/curl.cast" theme="monokai" cols="160" rows="30" idle-time-limit="3"></asciinema-player>

---

### Step 3: Search files for patterns

This introduces us to grep, a very powerful search tool. Grep is a subject all on its own, but this'll give you an idea of the basics.

```bash
grep -i wherefore romeo_and_juliet.txt
```

Grep has lots of helpful parameters. What does this do?

```bash
grep -ic romeo romeo_and_juliet.txt
```

--

### Example

<asciinema-player src="/media/grep.cast" theme="monokai" cols="160" rows="30" idle-time-limit="3"></asciinema-player>

---

### Stream editing: sed and pipe!

Let's push the output to stdout, then pipe it to a stream editor, then redirect the output to a new file.

```bash
cat romeo_and_juliet.txt | sed 's/Romeo/Steve/gI' > newPlay.txt
```

cool.

---

## This is just the beginning

There is a lot of key stuff we just don't have time to cover:

- Shell scripting
- Scheduling & `cron`
- Networking and SSH

--

### A Good Resource

It's several years out of date but [Data Science at the Command Line](https://www.datascienceatthecommandline.com/) is a great resource for getting started.

---

## Let's Eat

---

## Editing files like a civilized human

You have two great choices:

<div class="left">
    <img src="media/sublime.png" height="300" width="300">
</div>

<div class="right">
    <img src="media/atom.png" height="300" width="300">
</div>

--

## Sublime Demo

Let's look at some neat things Sublime can do

---

## Vim

![elegant](media/elegant_weapon.gif)

an elegant weapon from a more civilized age.

--

### Exiting Vim

![exitingvim](media/exitingvim.jpg)

```
:wq
```

---

## tmux + vim

![redline](media/redline.gif)
