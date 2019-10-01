\ProvidesClass{exammath}[2007/10/19]

\LoadClass{ctexart}

\RequirePackage{cnmath}

%----------------------------------------------------
% 悬挂缩进记数
% ---------------------------------------------------
\RequirePackage{xifthen}
\RequirePackage{calc}
\def\indentNumber{3.25em}
\newcommand{\setindent}[1]{\def \indentNumber{#1}}
\newcommand{\extendindentatten}{\setindent{3.75em}}
%----------------------------------------------------
% 题号计数器
% ---------------------------------------------------
\newcounter{problemCounter}                         % 计数器本体
\newcommand*{\internalIncreaseCounter} {     % 增加计数
    \addtocounter{problemCounter}{1}
    \ifthenelse{\theproblemCounter<10}{}{\extendindentatten} %到10时增加缩进量

}
\newcommand*{\internalProblemPreparation} {  % 题目准备操作
    \internalIncreaseCounter
}
\newcommand*{\problemNumber} {                  % 引用题号
    \internalProblemPreparation
    \theproblemCounter.
}
% ---------------------------------------------------
% 大题（题组）标注
% ---------------------------------------------------
% 使用方法：
% \section{大题序号}{大题名称}{说明文字}
\renewcommand{\section}[3]{
    \par
    \hangafter 1
    \hangindent 2em
    \noindent \textbf{#1、#2：#3}
}
% ---------------------------------------------------
% 解答题标记
% ---------------------------------------------------
%\RequirePackage{xifthen}% provides \isempty test

% 使用方法：
% \problem[说明文字（如“选修4-4 极坐标与参数方程”），可留空]{该题分数}
\newcommand{\problem}[2][]{
    \ifthenelse{\isempty{#1}}%
    {\def \tempProblemCommentNote{}
    }% if #1 is empty
    {\def \tempProblemCommentNote{[#1]}}% if #1 is not empty
    \par
    \problemNumber \tempProblemCommentNote (#2 分) 
    \par 
}

% 小问
% 使用方法：
% \subproblem{该小问序号}
\newcommand*{\subproblem}[1] {\par (#1)}
% ---------------------------------------------------
% 必考题、选考题标签
% ---------------------------------------------------
\newcommand{\problemShouldDoLabel}{\par \textbf{（一）必考题：60分。}}
\newcommand{\problemChooseToDoLabel}{\par \textbf{（二）选考题：共10分。请考生在第22、23 题中任选一题作答，如果多做，则按所做的第一题计分。}}

% ---------------------------------------------------
% 小题标记
% ---------------------------------------------------
\newcommand{\simpleproblem}{
    \problemNumber
    \hangafter 1
    \hangindent \indentNumber
}

% ---------------------------------------------------
% 选择题选项
% ---------------------------------------------------

\RequirePackage{tasks}


\settasks{
    counter-format={tsk[A].},
    label-offset={0.4em},
    label-align=left,
    column-sep={2pt},
    item-indent={4.7em},
    before-skip={-0.5em},
    after-item-skip={-1ex plus 1ex minus 1ex}
    %after-skip={1em}
}

% 使用方法：
% \selections{选项A}{选项B}{选项C}{选项D}
\newcommand*{\selections}[4]{
    \vspace{-1ex}
    \begin{tasks}(4)
        \task #1
        \task #2
        \task #3
        \task #4
    \end{tasks}
}

% ---------------------------------------------------
% 填空题的空
% ---------------------------------------------------
\newcommand{\blank}{\underline{\makebox[5em][c]{ }}}
\newcommand{\blanktriangle}{$\underline{\makebox[5em][c]{$\blacktriangle$}}$}

% ---------------------------------------------------
% 数学环境
% ---------------------------------------------------
\RequirePackage{amsmath,amssymb}%
\def\dif{\mathop{}\!\mathrm{d}}
\DeclareMathOperator{\rank}{rank}
\RequirePackage{bm}
\RequirePackage{pifont}
\RequirePackage{extarrows} %长等号
\RequirePackage{scalerel}%缩放公式大小


%%--------------- 卷首信息 ---------------%%
\RequirePackage{enumitem}

\def \savedSecretText {}
\newcommand*{\settopsecret}{\def\savedSecretText{绝密$\bigstar$启用前}}
\newcommand*{\setsecret}{\def\savedSecretText{机密$\bigstar$启用前}}

\def \savedTitle {}
\renewcommand*{\title}[1]{\def \savedTitle{#1}}

\def \savedleadingtext {}
\newcommand*{\leadingtext}[1]{\def \savedleadingtext{#1}}

\def \savedCautionInfoAddition{ }
\def \savedCautionInfo{ }

\newcommand{\additioninfo}[1]{\def \savedCautionInfoAddition{#1}}
\newcommand{\usebasicinfo}{
    \def \savedCautionInfo{
        \textbf{注意事项}：
        \par 1.答卷前，考生务必把自己的姓名、考生号写等填写在答题卡和试卷指定位置上。
        \par 2.回答选择题时，选出每小题答案后，用铅笔把答题卡上对应题目的答案标号涂黑。如需改动，用橡皮擦干净后，再选涂其它答案标号。回答非选择题时，将答案写在答题卡上。写在本试卷上无效。
        \par 3.考试结束后，将本试卷和答题卡一并交回。
        \savedCautionInfoAddition
        \vspace{3ex}
    }
}
\newcommand{\useadditioninfoonly}{
    \def \savedCautionInfo{
        \textbf{注意事项}：
        \par \savedCautionInfoAddition
        \vspace{3ex}
    }
}

\renewcommand*{\maketitle}{
    \noindent \savedSecretText 
    \begin{center}
        \begin{Large}
            \savedleadingtext
        \end{Large}
        \\
        \vspace{3ex}
        \begin{LARGE}
            \textbf{\savedTitle}
        \end{LARGE}
    \end{center}
    \savedCautionInfo
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%--------------- 页面设置 ---------------%%
\RequirePackage{geometry}
\geometry{a4paper, top=20mm,bottom=30mm,left=20mm,right=20mm,headsep=10pt}
\renewcommand*{\baselinestretch}{1.55}
\RequirePackage{fancyhdr}%使用页眉页脚宏包
\pagestyle{fancy}
\RequirePackage{lastpage}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\setlength{\columnseprule}{0.4pt}
\setlength{\columnsep}{1.8cm}
\cfoot{\scriptsize{\savedTitle \quad 第\thepage 页\ ( 共\pageref{LastPage} 页 ) }}
\renewcommand{\headrulewidth}{0pt}

\RequirePackage{color,xcolor}%-颜色-%



