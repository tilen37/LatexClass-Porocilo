\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{porocilo}[Latex class for reports, arXiv compatible]

% Base this class on article
\LoadClass[11pt]{article}


% Required packages
\RequirePackage[utf8]{inputenc}        % UTF-8 encoding
\RequirePackage[T1]{fontenc}           % Proper font encoding
\RequirePackage{mathptmx}              % Times-like font for text and math
\RequirePackage{amsmath}               % Math environments
\RequirePackage{amssymb}               % Math symbols
\RequirePackage{graphicx}              % Figures and images
\RequirePackage[slovene]{babel}        % Slovene language support
\RequirePackage{fancyhdr}              % Header and footer customization
\RequirePackage{hyperref}              % Hyperlinks
\RequirePackage{siunitx}               % Scientific units and number formatting
\RequirePackage{geometry}              % Document dimensions

% Set comma as decimal marker
\sisetup{output-decimal-marker = {,}}  

% Configure hyperref for arXiv
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    filecolor=magenta,
    urlcolor=cyan,
    pdftitle={Report},
    pdfauthor={Author},
    pdfsubject={Subject},
    pdfkeywords={Keywords},
    hidelinks
}

% Configure geometry
\geometry{
    left=2.5cm,
    right=2.5cm,
    top=2.5cm,
    bottom=2.5cm
}

% Custom universal commands
\newcommand{\dd}{\mathrm{d}}
\newcommand{\Dd}[3][{}]{\frac{\dd^{#1} #2}{\dd#3^{#1}}}
\newcommand{\pd}{\partial}
\newcommand{\Pd}[3][{}]{\frac{\pd^{#1} #2}{\pd #3^{#1}}}
\newcommand{\ii}{\mathrm{i}}
\newcommand{\pa}[1]{\left(#1\right)}

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


% Header configuration
\fancypagestyle{standard}{
    % \fancyhf{} % Clear all header and footer fields
    \lhead{\@authorname} % Left header
    \rhead{\@projecttitle} % Right header
    \renewcommand{\headrulewidth}{0.4pt} % Header rule
    \renewcommand{\footrulewidth}{0pt}   % No footer rule
}
\pagestyle{standard}  % This ensures the header is applied throughout the document
\setlength{\headheight}{13.92pt} % Set header height
\addtolength{\topmargin}{-1.92pt} % Compensate for increased header height

% Set default parameters
\setlength\parindent{0pt}
\setlength{\parskip}{\baselineskip}
\pagenumbering{arabic}

% Custom command for inserting single figures
\newcommand{\insertfig}[4][0.8]{%
    \begin{figure}[ht]
        \centering
        \includegraphics[width=#1\textwidth]{#2}
        \caption{#3}
        \label{fig:#4}
    \end{figure}
}

% Command for inserting a TikZ or .tex diagram
\newcommand{\insertdiag}[3]{%
    \begin{figure}[ht]
        \centering
        \input{#1}
        \caption{#2}
        \label{fig:#3}
    \end{figure}
}

% Define class options
% Option to disable table of contents
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
