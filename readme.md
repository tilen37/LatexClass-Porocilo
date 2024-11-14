# Custom LaTeX Class for Reports

This custom class is being updated throughout the schoolyear with weekly reports at two different courses.

## Installation Instructions for Linux

### 1. Clone the Repository

Clone the repository containing your custom class directly into your local TeX directory. This keeps your files organized and ensures LaTeX can access them.

```bash
$ git clone https://github.com/tilen37/LatexClass-Porocilo.git
```

### 2. Update the LaTeX Database

Run the following command to refresh the LaTeX file database so it recognizes your new class.

```bash
$ texhash ~/texmf
```

## Example

```latex
\documentclass[notoc]{porocilo} % notoc option removes table of contents
\institutionlogo{Logo}
\subjectname{Subject Name}
\projecttitle{Project Title}
\authorname{Author Name}
\instructions{Instructions}

\begin{document}
\maketitle

% Your content goes here.

\end{document}
```
