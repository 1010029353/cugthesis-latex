% 中国地质大学（武汉）学士学位论文 LaTeX 模板类
% 编译方式：XeLaTeX。字体按规范使用宋体、黑体、仿宋、Times New Roman。
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cugthesis}[2026/04/30 CUG bachelor thesis template]

\RequirePackage{iftex}
\ifXeTeX\else
  \ClassError{cugthesis}{This template must be compiled with XeLaTeX}{Use xelatex to compile main.tex.}
\fi

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
\LoadClass[UTF8,zihao=-4,fontset=windows,twoside,openany]{ctexbook}

\RequirePackage{geometry}
\RequirePackage{fontspec}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{eso-pic}
\RequirePackage{amsmath,amssymb}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{caption}
\RequirePackage{tocloft}
\RequirePackage{indentfirst}
\RequirePackage{etoolbox}
\RequirePackage[unicode,hidelinks]{hyperref}
\hypersetup{
  bookmarksnumbered=true,
  bookmarksopen=true
}
\RequirePackage[backend=biber,style=gb7714-2015]{biblatex}

\setmainfont{Times New Roman}
% Windows 宋体、黑体通常没有独立粗体字形，开启 CJK 伪粗体以满足封面加粗要求。
\setCJKfamilyfont{CUGsong}[AutoFakeBold=2.8]{SimSun}
\setCJKfamilyfont{CUGhei}[AutoFakeBold=2.8]{SimHei}
\newcommand{\CUGsong}{\CJKfamily{CUGsong}}
\newcommand{\CUGhei}{\CJKfamily{CUGhei}}

\geometry{
  a4paper,
  top=3cm,
  bottom=3cm,
  left=3cm,
  right=3cm,
  includehead=false,
  includefoot=false,
  headheight=15pt,
  headsep=0.5cm,
  footskip=1cm,
  bindingoffset=0cm
}

\makeatletter

% 正文：宋体/Times New Roman 12 磅，固定值行距 20 磅，首行缩进 2 字符。
\renewcommand\normalsize{%
  \@setfontsize\normalsize{12bp}{20bp}%
  \abovedisplayskip 10bp plus 2bp minus 5bp%
  \abovedisplayshortskip 0bp plus 3bp%
  \belowdisplayshortskip 6bp plus 3bp minus 3bp%
  \belowdisplayskip \abovedisplayskip
  \let\@listi\@listI
}
\normalsize
\newcommand{\CUG@bodyfont}{\normalfont\CUGsong\normalsize}
\AtBeginDocument{%
  \CUG@bodyfont
  \setlength{\parindent}{2em}%
  \setlength{\parskip}{0bp}%
}
\AtBeginBibliography{\CUG@bodyfont}
\setlength{\bibitemsep}{0bp}
\setlength{\bibparsep}{0bp}

% 论文信息字段。
\newcommand{\CUG@studentid}{请填写}
\newcommand{\CUG@title}{论文题目}
\newcommand{\CUG@author}{姓名}
\newcommand{\CUG@major}{学科专业}
\newcommand{\CUG@supervisor}{指导教师}
\newcommand{\CUG@supervisortitle}{职称}
\newcommand{\CUG@cosupervisor}{}
\newcommand{\CUG@cosupervisortitle}{}
\newcommand{\CUG@college}{培养单位}
\newcommand{\CUG@date}{二〇二六年四月}
\newcommand{\CUG@coverimage}{}

\newcommand{\CUGstudentid}[1]{\gdef\CUG@studentid{#1}}
\newcommand{\CUGtitle}[1]{\gdef\CUG@title{#1}}
\newcommand{\CUGauthor}[1]{\gdef\CUG@author{#1}}
\newcommand{\CUGmajor}[1]{\gdef\CUG@major{#1}}
\newcommand{\CUGsupervisor}[2]{\gdef\CUG@supervisor{#1}\gdef\CUG@supervisortitle{#2}}
\newcommand{\CUGcosupervisor}[2]{\gdef\CUG@cosupervisor{#1}\gdef\CUG@cosupervisortitle{#2}}
\newcommand{\CUGcollege}[1]{\gdef\CUG@college{#1}}
\newcommand{\CUGdate}[1]{\gdef\CUG@date{#1}}
\newcommand{\CUGcoverimage}[1]{\gdef\CUG@coverimage{#1}}

% 页眉页脚。正文奇数页：学校论文名；偶数页：作者：题名。页码在外侧。
\newcommand{\CUG@frontstyle}{%
  \fancypagestyle{CUGfront}{%
    \fancyhf{}%
    \fancyfoot[C]{\CUGsong\zihao{5}\thepage}%
    \renewcommand{\headrulewidth}{0pt}%
    \renewcommand{\footrulewidth}{0pt}%
  }%
  \fancypagestyle{plain}{%
    \fancyhf{}%
    \fancyfoot[C]{\CUGsong\zihao{5}\thepage}%
    \renewcommand{\headrulewidth}{0pt}%
    \renewcommand{\footrulewidth}{0pt}%
  }%
}
\newcommand{\CUG@mainstyle}{%
  \fancypagestyle{CUGmain}{%
    \fancyhf{}%
    \fancyhead[CO]{\CUGsong\zihao{5}中国地质大学学士学位论文}%
    \fancyhead[CE]{\CUGsong\zihao{5}\CUG@author：\CUG@title}%
    \fancyfoot[RO,LE]{\CUGsong\zihao{5}\thepage}%
    \renewcommand{\headrulewidth}{0.4pt}%
    \renewcommand{\footrulewidth}{0pt}%
  }%
  \fancypagestyle{plain}{%
    \fancyhf{}%
    \fancyhead[CO]{\CUGsong\zihao{5}中国地质大学学士学位论文}%
    \fancyhead[CE]{\CUGsong\zihao{5}\CUG@author：\CUG@title}%
    \fancyfoot[RO,LE]{\CUGsong\zihao{5}\thepage}%
    \renewcommand{\headrulewidth}{0.4pt}%
    \renewcommand{\footrulewidth}{0pt}%
  }%
}
\fancypagestyle{CUGempty}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
}
\newcommand{\CUG@emptystyle}{%
  \fancypagestyle{plain}{%
    \fancyhf{}%
    \renewcommand{\headrulewidth}{0pt}%
    \renewcommand{\footrulewidth}{0pt}%
  }%
  \pagestyle{CUGempty}%
}
\CUG@frontstyle
\pagestyle{CUGfront}
\newif\ifCUG@frontroman

\newcommand{\CUGfrontmatter}{%
  \clearpage
  \CUG@frontstyle
  \CUG@frontromanfalse
  \pagenumbering{gobble}%
  \CUG@emptystyle
}
\newcommand{\CUG@startfrontroman}{%
  \ifCUG@frontroman\else
    \pagenumbering{Roman}%
    \setcounter{page}{1}%
    \CUG@frontromantrue
  \fi
  \CUG@frontstyle
  \pagestyle{CUGfront}%
}
\newcommand{\CUGmainmatter}{%
  \clearpage
  \CUG@mainstyle
  \pagenumbering{arabic}%
  \pagestyle{CUGmain}%
}

% 章、节标题。
\ctexset{
  chapter = {
    name = {第,章},
    number = \chinese{chapter},
    aftername = \quad,
    format = \centering\CUGhei\zihao{3}\bfseries,
    beforeskip = 40bp,
    afterskip = 40bp,
    fixskip = true
  },
  section = {
    aftername = \quad,
    format = \centering\CUGhei\zihao{4}\bfseries,
    beforeskip = 20bp,
    afterskip = 20bp,
    fixskip = true
  },
  subsection = {
    aftername = \quad,
    format = \raggedright\CUGhei\zihao{-4},
    beforeskip = 20bp,
    afterskip = 20bp,
    fixskip = true
  }
}
\setcounter{secnumdepth}{2}
\setcounter{tocdepth}{2}
\renewcommand{\thesection}{\arabic{chapter}.\arabic{section}}
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}

% 图、表、公式编号与标题。
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}
\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}
\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}
\@addtoreset{figure}{chapter}
\@addtoreset{table}{chapter}
\@addtoreset{equation}{chapter}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}
\DeclareCaptionLabelSeparator{cugspace}{\hspace{1em}}
\DeclareCaptionFont{cugcaption}{\CUGsong\zihao{5}}
\captionsetup{
  font={cugcaption},
  labelfont={normalfont},
  textfont={normalfont},
  labelsep=cugspace,
  justification=centering,
  singlelinecheck=false
}
\captionsetup[figure]{name=图,position=bottom}
\captionsetup[table]{name=表,position=top}
\def\tagform@#1{\maketag@@@{\rmfamily\zihao{5}(#1)}}

% 目录、图清单、表清单。
\renewcommand{\contentsname}{目\quad 录}
\renewcommand{\listfigurename}{图清单}
\renewcommand{\listtablename}{表清单}
\renewcommand{\cfttoctitlefont}{\hfill\CUGhei\zihao{3}\bfseries}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftloftitlefont}{\hfill\CUGhei\zihao{3}\bfseries}
\renewcommand{\cftafterloftitle}{\hfill}
\renewcommand{\cftlottitlefont}{\hfill\CUGhei\zihao{3}\bfseries}
\renewcommand{\cftafterlottitle}{\hfill}
\setlength{\cftbeforetoctitleskip}{0bp}
\setlength{\cftaftertoctitleskip}{20bp}
\setlength{\cftbeforeloftitleskip}{0bp}
\setlength{\cftafterloftitleskip}{20bp}
\setlength{\cftbeforelottitleskip}{0bp}
\setlength{\cftafterlottitleskip}{20bp}
\newcommand{\CUG@tocchapterfont}{\CUGsong\fontsize{14bp}{20bp}\selectfont}
\newcommand{\CUG@tocentryfont}{\CUGsong\fontsize{12bp}{20bp}\selectfont}
\renewcommand{\cftchapfont}{\CUG@tocchapterfont}
\renewcommand{\cftchappagefont}{\CUG@tocchapterfont}
\renewcommand{\cftsecfont}{\CUG@tocentryfont}
\renewcommand{\cftsecpagefont}{\CUG@tocentryfont}
\renewcommand{\cftsubsecfont}{\CUG@tocentryfont}
\renewcommand{\cftsubsecpagefont}{\CUG@tocentryfont}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\setlength{\cftbeforechapskip}{0bp}
\setlength{\cftbeforesecskip}{0bp}
\setlength{\cftbeforesubsecskip}{0bp}
\setlength{\cftbeforefigskip}{0bp}
\setlength{\cftbeforetabskip}{0bp}
\setlength{\cftparskip}{0bp}
\setlength{\cftchapindent}{0em}
\setlength{\cftchapnumwidth}{4.5em}
\setlength{\cftsecindent}{1em}
\setlength{\cftsecnumwidth}{3em}
\setlength{\cftsubsecindent}{2em}
\setlength{\cftsubsecnumwidth}{4em}
\renewcommand{\cftfigfont}{\CUG@tocentryfont}
\renewcommand{\cftfigpagefont}{\CUG@tocentryfont}
\renewcommand{\cftfigpresnum}{图\hspace{0.5em}}
\renewcommand{\cftfigaftersnum}{\hspace{1em}}
\setlength{\cftfignumwidth}{5em}
\renewcommand{\cfttabfont}{\CUG@tocentryfont}
\renewcommand{\cfttabpagefont}{\CUG@tocentryfont}
\renewcommand{\cfttabpresnum}{表\hspace{0.5em}}
\renewcommand{\cfttabaftersnum}{\hspace{1em}}
\setlength{\cfttabnumwidth}{5em}

\newcommand{\makeCUGtoc}{%
  \clearpage
  \CUG@emptystyle
  \tableofcontents
  \thispagestyle{CUGempty}%
}
\newcommand{\makeCUGlof}{%
  \clearpage
  \CUG@startfrontroman
  \phantomsection
  \addcontentsline{toc}{chapter}{图清单}%
  \begingroup
  \let\addvspace\@gobble
  \listoffigures
  \endgroup
  \thispagestyle{CUGfront}%
}
\newcommand{\makeCUGlot}{%
  \clearpage
  \CUG@startfrontroman
  \phantomsection
  \addcontentsline{toc}{chapter}{表清单}%
  \begingroup
  \let\addvspace\@gobble
  \listoftables
  \endgroup
  \thispagestyle{CUGfront}%
}

% 封面。
\newcommand{\CUG@maybeCoverImage}{%
  \ifdefempty{\CUG@coverimage}{}{% 
    \AddToShipoutPictureBG*{\includegraphics[width=\paperwidth,height=\paperheight]{\CUG@coverimage}}%
  }%
}
\newcommand{\CUG@labeltwo}[2]{#1\hfil#2}
\newcommand{\CUG@labelfour}[4]{#1\hfil#2\hfil#3\hfil#4}
\newcommand{\CUG@coverrow}[2]{%
  \makebox[5.8em][s]{#1}：\hspace{0.5em} & #2\\[0.55em]%
}
\newcommand{\CUG@covercontinue}[1]{%
  \makebox[5.8em][s]{}\phantom{：}\hspace{0.5em} & #1\\[0.55em]%
}
\newcommand{\makeCUGcover}{%
  \clearpage
  \thispagestyle{CUGempty}%
  \CUG@maybeCoverImage
  \begingroup
  \vspace*{0.95cm}
  \begin{center}
    \vspace*{-0.4cm}
    {\CUGsong\bfseries\fontsize{26bp}{31bp}\selectfont 学士学位论文\par}
    \vspace{2.45cm}
    \begin{minipage}{0.82\textwidth}
      \centering\CUGhei\bfseries\fontsize{22bp}{28bp}\selectfont\CUG@title\par
    \end{minipage}
    \par
    \vspace{2.05cm}
    {\CUGsong\bfseries\fontsize{16bp}{24bp}\selectfont
      \begin{tabular}{@{}l@{}l@{}}
      \CUG@coverrow{\CUG@labeltwo{学}{号}}{{\rmfamily\bfseries\CUG@studentid}}
      \CUG@coverrow{\CUG@labeltwo{姓}{名}}{\CUG@author}
      \CUG@coverrow{\CUG@labelfour{学}{科}{专}{业}}{\CUG@major}
      \CUG@coverrow{\CUG@labelfour{指}{导}{教}{师}}{\CUG@supervisor\quad \CUG@supervisortitle}
      \ifdefempty{\CUG@cosupervisor}{}{
        \CUG@covercontinue{\CUG@cosupervisor\quad \CUG@cosupervisortitle}
      }
      \CUG@coverrow{\CUG@labelfour{培}{养}{单}{位}}{\CUG@college}
      \end{tabular}
    }
    \par
    \vspace{0.8cm plus 1fill}
    {\CUGsong\fontsize{16bp}{24bp}\selectfont\CUG@date\par}
    \vspace*{1.35cm}
  \end{center}
  \endgroup
  \clearpage
}
% 原创性声明。
\newcommand{\makeCUGoriginality}{%
  \clearpage
  \thispagestyle{CUGempty}%
  \begingroup
  \CUGsong\fontsize{14bp}{24bp}\selectfont
  \setlength{\parindent}{2em}%
  \begin{center}
    {\CUGhei\fontsize{16bp}{22bp}\selectfont 中国地质大学（武汉）学士学位论文原创性声明\par}
  \end{center}
  \vspace{0.8em}
  \par
  本人郑重声明：本人所呈交的学士学位论文《\CUG@title》，是本人在指导老师的指导下，在中国地质大学（武汉）攻读学士学位期间独立进行研究工作所取得的成果。论文中除已注明部分外不包含他人已发表或撰写过的研究成果，对论文的完成提供过帮助的有关人员已在文中说明并致以谢意。

  本人所呈交的学士学位论文没有违反学术道德和学术规范，没有侵权行为，并愿意承担由此而产生的法律责任和法律后果。

  \vspace{1.8cm}
  \hfill\begin{minipage}{7.4cm}
  \noindent 学位论文作者签名：\underline{\hspace{2.7cm}}\par

  \vspace{0.7em}
  \noindent 日\quad 期：\hspace{1.5cm}年\hspace{1cm}月\hspace{1cm}日
  \end{minipage}
  \endgroup
  \clearpage
}

% 中英文摘要。
\newenvironment{CUGabstract}{%
  \clearpage
  \CUG@emptystyle
  \thispagestyle{CUGempty}%
  \begin{center}
    {\CUGhei\fontsize{18bp}{18bp}\selectfont\bfseries 摘要\par}
  \end{center}
  \vspace{20bp}
  \CUG@bodyfont
  \setlength{\parindent}{2em}%
  \@afterindenttrue
  \@afterheading
  \ignorespaces
}{\par}
\newcommand{\CUGkeywords}[1]{%
  \par\vspace{1em}\noindent{\CUGsong\bfseries 关键词：}#1\par
}
\newenvironment{CUGabstractEN}{%
  \clearpage
  \CUG@emptystyle
  \thispagestyle{CUGempty}%
  \begin{center}
    {\rmfamily\fontsize{18bp}{18bp}\selectfont\bfseries Abstract\par}
  \end{center}
  \vspace{20bp}
  \rmfamily\fontsize{12bp}{20bp}\selectfont
  \setlength{\parindent}{2em}%
  \@afterindenttrue
  \@afterheading
  \ignorespaces
}{\par}
\newcommand{\CUGkeywordsEN}[1]{%
  \par\vspace{1em}\noindent{\bfseries Key Words: }#1\par
}

% 致谢、附录与参考文献。
\newenvironment{CUGacknowledgements}{%
  \clearpage
  \chapter*{致谢}%
  \phantomsection
  \addcontentsline{toc}{chapter}{致谢}%
  \CUG@bodyfont
}{\par}
\newcommand{\CUGappendix}{%
  \clearpage
  \chapter*{附录}%
  \phantomsection
  \addcontentsline{toc}{chapter}{附录}%
  \CUG@bodyfont
}
\renewcommand{\bibname}{参考文献}
\defbibheading{CUGbibliography}[\bibname]{%
  \chapter*{#1}%
  \phantomsection
  \addcontentsline{toc}{chapter}{#1}%
}
\newcommand{\makeCUGbibliography}{%
  \clearpage
  \printbibliography[heading=CUGbibliography,title={\bibname}]%
}
\providecommand{\upcite}[1]{\supercite{#1}}

\makeatother
