% porocilo.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{porocilo}[Latex class for reports]

% Base this class on article
\LoadClass[12pt]{article}

% Required packages
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\RequirePackage[left=2.5cm,right=2.5cm,top=2.5cm,bottom=2.5cm]{geometry}
\RequirePackage{hyperref}

\RequirePackage{amsmath}
\RequirePackage{multirow}
\RequirePackage{microtype}
\RequirePackage{subcaption}
\RequirePackage{booktabs}
\usepackage{hyperref}
\RequirePackage{siunitx}
\sisetup{output-decimal-marker = {,}}
\RequirePackage{graphicx}

% Slovene language support
\RequirePackage[slovene]{babel}

% Custom universal commands
\newcommand{\dd}{\mathrm{d}}
\newcommand{\Dd}[3][{}]{\frac{\dd^{#1} #2}{\dd#3^{#1}}}
\newcommand{\pd}{\partial}
\newcommand{\Pd}[3][{}]{\frac{\pd^{#1} #2}{\pd #3^{#1}}}

% Define new commands for the title page
\newcommand{\institutionlogo}[1]{\def\@institutionlogo{#1}}
\newcommand{\subjectname}[1]{\def\@subjectname{#1}}
\newcommand{\projecttitle}[1]{\def\@projecttitle{#1}}
\newcommand{\authorname}[1]{\def\@authorname{#1}}
\newcommand{\instructions}[1]{\def\@instructions{#1}}

% Set default values
\institutionlogo{example-image}
\subjectname{Subject Name}
\projecttitle{Project Title}
\authorname{Author Name}
\instructions{Instructions}

% Set default parameters
\setlength\parindent{0pt}
\setlength{\parskip}{\baselineskip}
\pagenumbering{arabic}

% Cusom figure environment
% Additional packages for better figures
\RequirePackage{float}
\RequirePackage{caption}
\RequirePackage{subcaption}

% Configure captions
\captionsetup{
    font=small,
    labelfont=bf,
    format=plain,
    justification=centering,
    margin=10pt
}

% Custom command for inserting single figures
% example usage: \insertfig{image}{caption}{label}
% Arguments: [width]{image}{caption}{label}
\newcommand{\insertfig}[4][0.8]{%
    \begin{figure}[htbp]
        \centering
        \includegraphics[width=#1\textwidth]{#2}
        \caption{#3}
        \label{fig:#4}
    \end{figure}
}

% Command for multiple figures in a row
% example usage:
% \begin{multifig}{2}{Overall caption}{0.45}{label}
%   \subfig{image1}{Subcaption 1}{label1}
%   \subfig{image2}{Subcaption 2}{label2}
% \end{multifig}
% Arguments: {number of columns}{overall caption}{subfigure width}{label}
\newenvironment{multifig}[4]{%
    \begin{figure}[htbp]
        \centering
        \def\numcols{#1}
        \def\subfigwidth{#3}
        \def\multifigcaption{#2}
        \def\multifiglabel{#4}
}{%
        \caption{\multifigcaption}
        \label{fig:\multifiglabel}
    \end{figure}
}

% Command for adding a subfigure within multifig
% Arguments: {image}{subcaption}{label}
\newcommand{\subfig}[3]{%
    \begin{subfigure}[b]{\subfigwidth\textwidth}
        \centering
        \includegraphics[width=\textwidth]{#1}
        \caption{#2}
        \label{fig:#3}
    \end{subfigure}%
    \hfill
}

% Custom command for inserting single .tex diagrams
% example usage: \insertfig{file}{caption}{label}
% Arguments: {file}{caption}{label}
\newcommand{\insertdiag}[3]{%
    \begin{figure}[htbp]
        \centering
        \include{#1}
        \caption{#2}
        \label{fig:#3}
    \end{figure}
}

% Define class options
% Option to disable table of contents
% Usage: \documentclass[notoc]{porocilo}
\newif\ifnotoc
\DeclareOption{notoc}{\notoctrue}
\ProcessOptions\relax

% Redefine the maketitle command
\renewcommand{\maketitle}{
    \begin{titlepage}
        \centering
        \includegraphics[width=0.7\textwidth]{\@institutionlogo}
        
        \vspace{1.0cm}
        {\large\textbf{\@subjectname}\par}
        
        \vspace{1.0cm}
        {\LARGE\textbf{\@projecttitle}\par}
        
        \vspace{1.0cm}
        {\large\textbf{\@authorname}\par}
        
        \vspace{1.0cm}
        \vfill
        
        {\normalsize\textbf{Navodila:}\par}
        
        \vspace{0.5cm}
        {\small\@instructions\par}
        
        \vfill
        {\normalsize\textbf{\today}\par}
    \end{titlepage}
    
    \setcounter{page}{2}

    \ifnotoc
        % Do nothing
    \else
        \tableofcontents
        \newpage
    \fi
}
