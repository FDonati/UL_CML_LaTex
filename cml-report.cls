\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cml-report}[2017/07/27 v1.0 Leiden University CML report]

\newif\if@dutch
\newif\if@english
\newif\if@nativefonts
\newif\if@print
\newif\if@roman
\@romantrue

\DeclareOption{dutch}{\@dutchtrue\@englishfalse}
\DeclareOption{roman}{\@romantrue}
\DeclareOption{noroman}{\@romanfalse}
\DeclareOption{english}{\@dutchfalse\@englishtrue}
\DeclareOption{nativefonts}{\@nativefontstrue}
\DeclareOption{print}{\@printtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ExecuteOptions{english}
\ProcessOptions\relax

\LoadClass[10pt]{book}

\RequirePackage{ifxetex}
\RequirePackage{amsmath}
\RequirePackage{amssymb}

%% English is the default language, but this can be changed to Dutch by
%% specifying the 'dutch' option to the document class.

\ifxetex
    \RequirePackage{polyglossia}
    \if@dutch
        \setdefaultlanguage{dutch}
    \else
        \setdefaultlanguage{english}
        \setotherlanguage{dutch}
    \fi
\else
    \if@dutch
        \RequirePackage[dutch]{babel}
    \else
        \RequirePackage[dutch,english]{babel}
    \fi
\fi
\RequirePackage[nooneline,footnotesize]{caption}
\RequirePackage{fancyhdr}
\RequirePackage[flushmargin,hang]{footmisc}
\RequirePackage{ifpdf}
\ifxetex
    \RequirePackage{geometry}
    \RequirePackage{graphicx}
    \RequirePackage{hyperref}
    \RequirePackage{fontspec}
    \defaultfontfeatures{Ligatures=TeX}
\else
    \ifpdf
        \RequirePackage[pdftex]{geometry}
        \RequirePackage[pdftex]{graphicx}
        \RequirePackage[pdftex]{hyperref}
    \else
        \RequirePackage[dvips]{geometry}
        \RequirePackage[dvips]{graphicx}
        \RequirePackage[hypertex]{hyperref}
    \fi
\fi



\RequirePackage{metalogo}
\RequirePackage[numbers,sort&compress]{natbib}
\RequirePackage{tikz}
\RequirePackage[noindentafter]{titlesec}
\RequirePackage{titletoc}
\RequirePackage[nottoc]{tocbibind}
\RequirePackage{xcolor}
\RequirePackage{xkeyval}
\RequirePackage[export]{adjustbox}




\ifxetex
    %% fonts for the cover.
    \newfontfamily\ultitlefamily[
        Path = fonts/,
        Extension = .otf ]{MinionPro}
    \newfontfamily\ulrmfamily[
        Path = fonts/,
        Extension = .otf,
        BoldFont = *-Bold,
        ItalicFont = *-Italic,
        BoldItalicFont = *-BoldIt]{MinionPro}
    \newfontfamily\ulsfFamily[
        Path = fonts/,
        Extension = .otf,
        BoldFont = *Bold,
        ItalicFont = *Italic,
        BoldItalicFont = *BoldItalic]{Vestula}
\else
    \@nativefontstrue
    \newcommand*\ulrmfamily{\rmfamily}
    \newcommand*\ulsffamily{\sffamily}
\fi



\if@nativefonts
    \RequirePackage[T1]{fontenc}
    \RequirePackage[utf8]{inputenc}
    \if@roman
      \RequirePackage{fourier}
    \else 
      \RequirePackage{helvet}
      \renewcommand{\sffamily}
    \fi
    \def\largetitlefont{\rmfamily}
    \def\largetitleseries{\fontseries{t}}
    \def\largetitleshape{\fontshape{n}}
    \def\largetitlestyle{\largetitlefont\largetitleseries\largetitleshape}
    \def\titleshape{\fontshape{n}}
    \if@roman
        \renewcommand{\familydefault}{\rmdefault}
        \def\titlefont{\rmfamily}
        \def\sectitleshape{\fontshape{n}}
        \def\sectitlestyle{\rmfamily\titleshape\bfseries}
        \def\chaptitlestyle{\rmfamily\titleshape}
    \else
        \def\titlefont{\rmfamily}
        \def\sectitlestyle{\sffamily\titleshape\bfseries}
        \def\chaptitlestyle{\sffamily\titleshape}
    \fi

    \def\titlestyle{\titlefont\titleshape}
        \def\headerstyle{\titlefont}

\else
    %% Courier New for monospace
    %% and Cambria for math.
    \RequirePackage{unicode-math}
    \setmainfont[
        Path = fonts/,
        Extension = .otf,
        BoldFont = *-Bold,
        ItalicFont = *-Italic,
        BoldItalicFont = *-BoldItalic ]{MinionPro-Regular}
    \setsansfont[
        Path = fonts/,
        Extension = .otf,
        BoldFont = *Bold,
        ItalicFont = *RegularItalic,
        BoldItalicFont = *BoldItalic]{Vestula}
    \setmonofont[
        Path = fonts/,
        Extension = .otf,
        BoldFont = *Bold,
        ItalicFont = *RegularItalic,
        BoldItalicFont = *BoldItalic]{Vestula}
    \setmathfont[
        Path = fonts/,
        Extension = .ttf ]{CambriaMath}

    %% The default style for text is Tahoma (sans-serif).
%    \setlength\@largetitlesize{96pt}

    \renewcommand*\familydefault{\sfdefault}
    %% The default style for titles is Bookman Old Style (serif). 
    \def\titlefont{\rmfamily}
    \def\largetitlefont{\titlefamily}
    \def\titleshape{}
    \def\largetitleshape{\titleshape}
    \def\largetitleseries{}
    \def\largetitlestyle{\largetitlefont\largetitleseries\largetitleshape}
    \def\chaptitlefamily{\rmfamily}

        \def\titlestyle{\titlefont\titleshape}

        \def\sectitlestyle{\rmfamily\titleshape\bfseries}
        \def\chaptitlestyle{\chaptitlefamily}
    \def\headerstyle{\titlestyle}
\fi

% Use roman (Georgia) in quote environment
\renewenvironment{quote}
               {\list{}{\rightmargin\leftmargin}\rmfamily\selectfont%
                \item\relax}
               {\endlist}

%% Define the Leiden university CML house style colors.
\definecolor{LEI-blue}{cmyk}{1,0.75,0,0.35}
\definecolor{black}{cmyk}{0,0,0,1}
\definecolor{white}{cmyk}{0,0,0,0}
\definecolor{LEI-green}{cmyk}{0.88,0,1,0.24}
\definecolor{LEI-light-green}{cmyk}{0.35,0,1,0.14}

\def\@pagecolor{white}

%% Use Leiden LEI-blue as the color for titles
\colorlet{title}{LEI-blue}

%% We use A4 paper with slightly smaller margins than the default (scale = 0.7).
\geometry{a4paper}

%% Redefine the title command to accept an optional subtitle.
\renewcommand*\title[2][white]{%
    \def\@titlecolor{#1}%
    \def\@title{#2}%
    %% Add the title to the PDF meta data.
    \hypersetup{pdftitle=#2}%
}

\newcommand*\subtitle[2][white]{
    \def\@subtitlecolor{#1}
    \def\@subtitle{#2}
    }

%% Redefine the author command to add the name to the PDF meta data.
\renewcommand*\author[2][white]{%
    \def\@authorcolor{#1}%
    \def\@author{#2}%
    \hypersetup{pdfauthor=#2}%
}
%% The project
\newcommand*\project[2][black]{\def\@afilcolor{#1}
    \def\@project{#2}}

%% The cover image command is used to specify the filename of the optional cover
%% image.
\newcommand*\coverimage[1]{\def\@cover@image{#1}}
%% The covertext command can be used to specify the text printed on the back
%% cover. This text is inserted in a minipage environment and can therefore
%% include line breaks.
\newcommand\covertext[2][white]{%
    \def\@covertextcolor{#1}%
    \def\@cover@text{#2}}

%% The cover image is scaled to fill the width of the front cover.
\newlength\@cover@imagewidth

%% The width of the spine if a back cover is present.
\newlength\@cover@spinewidth
\setlength\@cover@spinewidth{0.375in}

%% Width and height of the boxes on the front and back cover.
\newlength\@cover@frontboxwidth
\setlength\@cover@frontboxwidth{6in}

\newlength\@cover@frontboxheight
\setlength\@cover@frontboxheight{2.05in}

\newlength\@cover@fronttextwidth
\newlength\@cover@fronttextheight

\newlength\@cover@splitboxwidth
\setlength\@cover@splitboxwidth{5in}

\newlength\@cover@splitboxheight
\newlength\@cover@splitboxtextwidth

\newlength\@cover@splittextheight

%% Position on the front cover where the corner of both boxes meet.
\newlength\@cover@x
\setlength\@cover@x{1.36in}

\newlength\@cover@y
\setlength\@cover@y{3in}


\newlength\@cover@ax
\setlength\@cover@ax{7in}
\newlength\@cover@ay
\setlength\@cover@ay{10.20in}

%% The margin around text boxes.
\newlength\@cover@margin
\setlength\@cover@margin{10pt}

%% Define the options for the makecover command.
\define@boolkey{cover}{back}[true]{}
\define@boolkey{cover}{split}[true]{}
\define@boolkey{cover}{nospine}[true]{}
\define@boolkey{cover}{frontbottom}[true]{}
\define@boolkey{cover}{whitelogo}[true]{}
\define@key{cover}{spinewidth}{\setlength\@cover@spinewidth{#1}}
\define@key{cover}{frontboxwidth}{\setlength\@cover@frontboxwidth{#1}}
\define@key{cover}{frontboxheight}{\setlength\@cover@frontboxheight{#1}}
\define@key{cover}{x}{\setlength\@cover@x{#1}}
\define@key{cover}{y}{\setlength\@cover@y{#1}}
\define@key{cover}{ax}{\setlength\@cover@ax{#1}}
\define@key{cover}{ay}{\setlength\@cover@ay{#1}}
\define@key{cover}{margin}{\setlength\@cover@margin{#1}}
\newcommand\titleoffsetx[1]{\def\@cover@x{#1}}
\newcommand\titleoffsety[1]{\def\@cover@y{#1}}
\newcommand\afiloffsetx[1]{\def\@cover@ax{#1}}
\newcommand\afiloffsety[1]{\def\@cover@ay{#1}}
\newcommand\setpagecolor[1]{\def\@pagecolor{#1}}

\newcommand*\makecover[1][]{
    \setkeys{cover}{#1}
    %% Create a \@pagecolor empty page without margins.
    \clearpage
    \newgeometry{margin=10pt}
    \pagecolor{\@pagecolor}
    \thispagestyle{empty}
    %% We need the this to perform coordinate calculations in TikZ.
    \usetikzlibrary{calc}
    \begin{tikzpicture}[remember picture,overlay]
        \ifKV@cover@nospine
            \setlength\@cover@spinewidth{0pt}
        \fi
        %% If a back cover is present, stretch the cover image to extend onto
        %% the spine.
        \ifKV@cover@back
            \setlength\@cover@imagewidth{\paperwidth}
            \addtolength\@cover@imagewidth{\@cover@spinewidth}
        \else
            \centering
            \setlength\@cover@imagewidth{\paperwidth}
        \fi
        %% If a cover image was specified, attach it to the top right of the
        %% front cover.
        \ifx\@cover@image\undefined\else
          \ifKV@cover@back
            {\ifKV@cover@split
               \node[anchor=north west,inner sep=0pt] at (current page.center) {
               \includegraphics[width=\@cover@imagewidth]{\@cover@image}};
            \else
               \node at (current page.north east)[anchor=north east,inner sep=0pt]{
               \includegraphics[width=\@cover@imagewidth]{\@cover@image}};
            \fi}
          \else
            {\ifKV@cover@split
               \node[anchor=north west,inner sep=0pt] at (current page.west) {
               \includegraphics[width=\@cover@imagewidth]{\@cover@image}};
            \else
               \node at (current page.center){
               \includegraphics[width=0.7\@cover@imagewidth]{\@cover@image}};
            \fi}
          \fi
        \fi
        \ifKV@cover@whitelogo %right now if not specified it will go directly to white logo FD
          \ifKV@cover@back 
        %all this needs to be fixed to have a back cover, for the time being front cover works just fine FD
              \node at (current page.south west)[anchor=south west,inner sep=20pt]{
                  \includegraphics{cover/logo_white}
              };
              \node at (current page.south east)[anchor=south east,inner sep=20pt]{
                  \includegraphics{cover/logo_white}
              };
          \else
              \node at (current page.south west)[anchor=south west,inner sep=20pt]{
                  \includegraphics{cover/logo_white}
              };
          \fi
        \else
          \ifKV@cover@back
              \node at (current page.south west)[anchor=south west,inner sep=30pt]{ 
                  \includegraphics{cover/front.pdf}
              };
              \node at (current page.south east)[anchor=south east,inner sep=30pt]{
                  \includegraphics{cover/front.pdf}
              };
          \else
              \node at (current page.south west)[anchor=south west,inner sep=0]{
                  \includegraphics{cover/front.pdf}
              };
          \fi
        \fi
        %% Calculate the coordinate of the top left corner of the front cover.
        \ifKV@cover@back
            \coordinate (top left) at ($(current page.north)+(0.5\@cover@spinewidth,0pt)$);
        \else
            \coordinate (top left) at (current page.north west);
        \fi
        \ifKV@cover@back
            \coordinate (bottom left) at ($(current page.south)+(0.5\@cover@spinewidth,0pt)$);
        \else
            \coordinate (bottom left) at (current page.south west);
        \fi
        \ifKV@cover@back\ifKV@cover@nospine\else
            %% If a back cover is present, calculate the coordinates of the
            %% spine box.
            \coordinate (spine top left) at ($(top left)-(\@cover@spinewidth,0pt)$);
            \coordinate (spine bottom right) at ($(top left)+(0pt,-\@cover@y)$);
            \ifKV@cover@frontbottom
                \coordinate (spine bottom right) at ($(spine bottom right)+(0pt,\@cover@backboxheight)$);
            \fi
            \coordinate (spine bottom center) at ($(spine bottom right)+(-0.5\@cover@spinewidth,0pt)$);
            %% Extend the spine box by 1pt to the left to ensure it completely
            %% covers the cover image.
            \coordinate (spine top left) at ($(spine top left)-(1pt,0pt)$);
            %% Draw a black box on the spine.
            \fill[fill= LEI-blue](spine top left) rectangle (spine bottom right);
            %% Print the title on the center right of the spine box.
            \node at (spine bottom center)[rotate=-90,anchor=east,inner sep=\@cover@margin]{
                \sffamily\color{white}\LARGE\@title
            };
        \fi\fi
        %% Calculate the coordinate of the corner where the front and back boxes
        %% meet.
        \ifKV@cover@split
          \setlength\@cover@fronttextwidth{\@cover@splitboxwidth}
          \addtolength\@cover@fronttextwidth{-2\@cover@margin}
          \setlength\@cover@fronttextheight{\@cover@splitboxheight}
          \addtolength\@cover@fronttextheight{-4\@cover@margin}
          \coordinate (tcorner) at ($(top left)+(2\@cover@margin,-2\@cover@margin)$);
          \coordinate (front top left) at (tcorner);
%%          \coordinate (back top left) at ($(tcorner)+(-\@cover@backboxwidth,\@cover@backboxheight)$);     
          \node at (front top left)[anchor=north west,inner sep=\@cover@margin]{
             \begin{minipage}[t][\@cover@fronttextheight]{\@cover@fronttextwidth}
                 %% Print the title and optional subtitle at the top in white.
                   {\titlefont\color{\@titlecolor}\fontsize{50}{50}\selectfont\@title}
                    \ifx\@subtitle\undefined\else
%                     \\[3mm]
                     \vfill
                     
                     {\titlefont\color{\@subtitlecolor}\fontsize{25}{25}\selectfont\@subtitle}
                   \fi
                 %% Print the author.
                   \vfill
                  
                   {\titlefont\color{\@authorcolor}\fontsize{25}{25}\selectfont\@author}
                   \ifx\@cover@text\undefined\else
                     \vfill
                     
                     {\titlefont\color{\@covertextcolor}\fontsize{18}{18}\selectfont\@cover@text}
                   \fi
             \end{minipage}
            };
        \else
          \coordinate (tcorner) at ($(top left)+(\@cover@x,-\@cover@y)$);
          \coordinate (acorner) at ($(top left)+(\@cover@ax,-\@cover@ay)$);
  %        \coordinate (lcorner) at ($(bottom left)+(2cm,2cm)$);
          %% Calculate the top left and bottom right coordinates of the front and
          %% back boxes.
          \ifKV@cover@frontbottom
              \coordinate (front top left) at (tcorner);
              \coordinate (back top left) at ($(tcorner)+(-\@cover@splitboxwidth,\@cover@splitboxheight)$);
          \else
              \coordinate (front top left) at ($(tcorner)+(0pt,\@cover@frontboxheight)$);
              \coordinate (back top left) at ($(tcorner)+(-\@cover@splitboxwidth,0pt)$);
          \fi
          \coordinate (front bottom right) at ($(front top left)+(\@cover@frontboxwidth,-\@cover@frontboxheight)$);
          \coordinate (back bottom right) at ($(back top left)+(\@cover@splitboxwidth,-\@cover@splitboxheight)$);
          %% Draw the front box in black.
  %        \fill[fill= black](front top left) rectangle (front bottom right);
          %% Calculate the width and height of the front text box.


    %% This is where all the font settings for the front cover are

          \setlength\@cover@fronttextwidth{\@cover@frontboxwidth}
          \addtolength\@cover@fronttextwidth{-2\@cover@margin}
          \setlength\@cover@fronttextheight{\@cover@frontboxheight}
          \addtolength\@cover@fronttextheight{-2\@cover@margin}
          %% Create the front text box.
          \node at (front top left)[anchor=north west,inner sep=\@cover@margin]{
              \begin{minipage}[t][\@cover@fronttextheight]{\@cover@fronttextwidth}
                  %% Print the title and optional subtitle at the top in white.
                  {\largetitlestyle\color{\@titlecolor}\fontsize{41}{49}\selectfont\@title}
                  \ifx\@subtitle\undefined\else
                      \\[8mm]
                      {\rmfamily\color{\@subtitlecolor}\fontsize{28}{32}\selectfont\@subtitle}
                  \fi
                      \\[12mm]
                  {\sffamily\color{\@authorcolor}\fontsize{18}{18}\selectfont\@author}
              \end{minipage}
          };
          \ifx\@project\undefined\else
              \node at (acorner){
                  \sffamily\color{\@afilcolor}\fontsize{28}{30}\@project
              };
          \fi
       \fi
    \end{tikzpicture}
    %% Restore the margins and turn the page white again.
    \restoregeometry
    \pagecolor{white}
}

%% Remove the header and page number on empty pages.
\def\cleardoublepage{%
    \clearpage%
    \if@twoside%
        \ifodd\c@page%
        \else%
            \thispagestyle{empty}%
            \vspace*{\fill}%
            \newpage%
        \fi%
    \fi%
}

%% Page style for title pages.
\fancypagestyle{plain}{%
    \fancyhf{}
    \renewcommand*\headrulewidth{0pt}
    \renewcommand*\footrulewidth{0pt}
    \fancyfoot[C]{\titlefont\thepage}
}

%% Fancy style for the main matter.
\fancypagestyle{mainmatter}{%
    \fancyhf{}
    %% Page numbers on the top left and top right.
    \fancyhead[LE,RO]{\titlefont\titleshape\thepage}
    %% Chapter name on the left (even) page.
    \fancyhead[RE]{\titlefont\titleshape\nouppercase{\leftmark}}
    %% Section name on the right (odd) page.
    \fancyhead[LO]{\titlefont\titleshape\nouppercase{\rightmark}}
}

%% The mainmatter style is default for normal pages.
\pagestyle{mainmatter}

%% Print the current chapter and section at the top of the page.
\renewcommand*\chaptermark[1]{\markboth{\thechapter.\ \color{title}#1}{}}
\renewcommand*\sectionmark[1]{\markright{\thesection.\ \color{title}#1}}
\newcommand*\setheader[1]{\markboth{\color{title}#1}{\color{LEI-blue}#1}}

%% Change the headrule command (from fancyhdr.sty) to draw the line below the
%% header in the title color.
\renewcommand*\headrule{%
    \if@fancyplain%
        \let\headrulewidth\plainheadrulewidth%
    \fi%
    {\color{title}\hrule\@height\headrulewidth\@width\headwidth}%
    \vskip-\headrulewidth%
}

%% Draw the line above a footnote in the title color as well.
\renewcommand*\footnoterule{%
    \vspace*{-3pt}%
    {\color{title}\hrule width 0.5\textwidth height 0.4pt}%
    \vspace*{2.6pt}%
}

%% A part title starts with a huge (96pt) bold black number, flushed to the
%% right, followed by the part name on the next line in the title color.
\titleformat{\part}[display]
    {\flushright}
    {\fontsize{\@largetitlesize}{\@largetitlesize}\selectfont\bfseries\thepart}
    {0pt}
    {\Huge\color{title}}
%% Separate the title from the text by two empty lines.
\titlespacing{\part}{0pt}{0pt}{2\baselineskip}
%% In the table of contents, the part name is preceded by an empty line, printed
%% in bold, and not followed by a line of dots.
\dottedcontents{part}[0em]{\vspace{\baselineskip}\titlefont\bfseries}{1.5em}{0pc}

%% Chapter titles have the same layout as parts.
\titleformat{\chapter}[display]
    {\flushright\largetitlestyle}
    {\fontsize{96}{96}\selectfont\thechapter}
    {0pt}
    {\chaptitlestyle\Huge\color{title}}
\titlespacing{\chapter}{0pt}{0pt}{2\baselineskip}
%% In the table of contents, a chapter is similar to a part, except that it is
%% preceded by half an empty line.
\dottedcontents{chapter}[1.5em]{\vspace{0.5\baselineskip}\titlefont\bfseries}{1.5em}{0pc}

%% Section titles start with the number in bold, followed by the name printed
%% in the title color.
\titleformat{\section}
    {\Large\sectitlestyle}
    {\bfseries\thesection.\ }
    {0pt}
    {\color{title}}
%% Sections are preceded by an empty line.
\titlespacing{\section}{0pt}{\baselineskip}{0pt}
%% In the table of contents, section names are followed by a line of dots 8pt
%% apart.
\dottedcontents{section}[3.8em]{\titlefont}{2.3em}{8pt}

%% Subsection titles have the same layout as section titles, except in a smaller
%% font.
\titleformat{\subsection}
    {\large\sectitlestyle}
    {\bfseries\thesubsection.\ }
    {0pt}
    {\color{title}}
\titlespacing{\subsection}{0pt}{\baselineskip}{0pt}
\dottedcontents{subsection}[7em]{\titlefont}{3.2em}{8pt}

%% Subsubsections have the same font and color as sections and subsections, but
%% are not preceded by a number.
\titleformat{\subsubsection}
    {\headerstyle}
    {}
    {0pt}
    {\color{title}}

%% Subsubsections are preceded by an empty line and do not appear in the table
%% of contents.
\titlespacing{\subsubsection}{0pt}{\bigskipamount}{0pt}

%% Color the bullets of the itemize environment and make the symbol of the third
%% level a diamond instead of an asterisk.
\renewcommand*\labelitemi{\color{title}\textbullet}
\renewcommand*\labelitemii{\color{title}--}
\renewcommand*\labelitemiii{\color{title}$\diamond$}
\renewcommand*\labelitemiv{\color{title}\textperiodcentered}

%% Use a custom bibliography style based on apsrev4-1.
\bibliographystyle{cml-report}

%% Hyperlinks are LEI-blue, except in print mode, when they are all black.
\hypersetup{
    colorlinks=true,
    citecolor=title,
    linkcolor=title,
    urlcolor=title
}

