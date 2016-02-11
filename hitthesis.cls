\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hitthesis}[2016/02/05 Thesis class]
\typeout{Thesis class for HIT by Daniel Andersson, danan391@student.liu.se}
\def\createvariable#1{
    \expandafter\def\csname #1\endcsname{\expandafter\gdef\csname @#1\endcsname}
    \csname #1\endcsname{\texttt{\textbackslash #1}}
}


% declaration of options
\newif\ifdext@languagechosen

\DeclareOption{english}{%
    %\PassOptionsToPackage{english}{polyglossia} % No options needed
    \dext@languagechosentrue
}
\DeclareOption{swedish}{%
    \PassOptionsToPackage{swedish,english}{polyglossia}
    \dext@languagechosentrue
}

\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{memoir}}

\PassOptionsToClass{a4paper, oneside}{memoir}


% execution of options
\ProcessOptions

% package loading
\LoadClass{memoir}

\RequirePackage{fontspec}
\RequirePackage[utf8]{inputenc}
\RequirePackage{polyglossia}
\RequirePackage{lmodern}
\RequirePackage{amsmath,amssymb,amsthm}
\RequirePackage{siunitx}
\RequirePackage{tikz}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{titlesec}

\RequirePackage{hyperref}



\RequirePackage{xeCJK} % Chinese



\defaultfontfeatures{Ligatures=TeX}
% Set sans serif font to Arial
\setsansfont{Arial}
% Set serifed font to Times New Roman
\setmainfont{Times New Roman}
% Set formats for each heading level
\titleformat*{\section}{\fontsize{16}{18}\bfseries\sffamily}
\titleformat*{\subsection}{\fontsize{14}{16}\bfseries\sffamily}
\titleformat*{\subsubsection}{\fontsize{12}{14}\bfseries\sffamily}



\setCJKmainfont[BoldFont=Heiti SC Medium]{Heiti SC Light} % \setCJKmainfont[BoldFont=Songti SC Bold]{Songti SC Light}
\setCJKsansfont{Heiti SC}
\setCJKmonofont{Courier}



\gdef\@abstractCN{\input{abstract-cn}}
\gdef\@abstractEN{\input{abstract-en}}





\renewcommand{\maketitle}{
    \copypagestyle{titlestyle}{plain}
    \thispagestyle{titlestyle}
    {\centering
        硕士学位论文 \\
        Dissertation for Master's Degree \\
        (工程硕士) \\
        (Master of Engineering)
        \\~\\~\\
        恶意代码行为提取及分类系统 \\
        MALICIOUS CODE BEHAVIOR EXTRACTION AND CLASSIFICATION SYSTEM
        \\~\\
        王维 \\
    }
    \pagebreak
    \copypagestyle{titlestyle}{plain}
    \makeevenhead{titlestyle}{
    国内图书分类号：TP311 \\
    国际图书分类号：681
    }{}{
    学校代码：10213 \\
    密级：公开
    }
    \makeoddhead{titlestyle}{
    国内图书分类号：TP311 \\
    国际图书分类号：681
    }{}{
    学校代码：10213 \\
    密级：公开
    }
    \thispagestyle{titlestyle}
    {\centering
        工程硕士学位论文 \\
        Dissertation for the Master's Degree in Engineering \\
        (工程硕士) \\
        (Master of Engineering)
        \\~\\
        恶意代码行为提取及分类系统 \\
        MALICIOUS CODE BEHAVIOR EXTRACTION AND CLASSIFICATION SYSTEM \\

        \begin{tabular}{ll}
            \textbf{Candidate：}                     & Your Name                              \\
            \textbf{Supervisor：}                    & HIT Supervisor's Name and Title        \\
            \textbf{Associate Supervisor:}          & LiU Supervisor's Name and Title        \\
            \textbf{Industrial Supervisor:}         & Internship Supervisor's Name and Title \\
            \textbf{Academic Degree Applied for：}   & Master of Engineering                  \\
            \textbf{Speciality：}                    & Software Engineering                   \\
            \textbf{Affiliation：}                   & School of Software                     \\
            \textbf{Date of Defence：}               & September, 2014                        \\
            \textbf{Degree-Conferring-Institution：} & Harbin Institute of Technology         \\
        \end{tabular}
    }
}

\AtBeginDocument{
    \maketitle
    \makeatletter
        \copypagestyle{normal}{ruled}
        \makeevenhead{normal}{}{Thesis for Master's Degree at HIT and LiU}{}
        \makeoddhead{normal}{}{Thesis for Master's Degree at HIT and LiU}{}
        \makeevenfoot{normal}{}{\thepage}{}
        \makeoddfoot{normal}{}{\thepage}{}


        \renewcommand{\ruledheadrule}{%
            \hrule \@width \textwidth \@height 2\normalrulethickness
            \vskip \normalrulethickness
            \hrule \@width \textwidth \@height \normalrulethickness
            \vskip \normalrulethickness}
        \aliaspagestyle{chapter}{normal}
    \makeatother
    \pagestyle{normal}
    \newpage
    %\pagenumbering{roman}
    \frontmatter
    \addcontentsline{toc}{chapter}{摘  要}
    \addcontentsline{toc}{chapter}{Abstract}
    \begin{abstract}
        \@abstractCN
        \clearpage{}
        \@abstractEN
    \end{abstract}
    \newpage
    \clearpage
    \tableofcontents
    \clearpage{}
    %\listoffigures
    %\clearpage{}
    %\listoftables
    %\cleartorecto%
    %\pagenumbering{arabic}
    \mainmatter
}
