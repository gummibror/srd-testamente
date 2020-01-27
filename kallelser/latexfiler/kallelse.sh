#!/bin/bash
# Dependencies -> pdflatex and gdate (included by default on linux, use "brew install coreutils" on mac)
meetnumber=$1
ordforande=$3

if [ -n "$2" ]
then
    points=$( cat $2 | awk '$0="\\punkt{"$0"}{Diskussion/Beslut}{}"')
else
    points=""
fi

: ${meetnumber:=X}
: ${ordforande:=Oskar Damkjaer}

meetdate=$(gdate -d 'this Wednesday' '+%Y-%m-%d')
meetdatehuman=$(LANG=sv_SE gdate -d 'this Wednesday' '+%-d %-B %Y')

echo "
\def \ordforande {$ordforande}
\def \meetnumber {$meetnumber}
\def \meetdate {$meetdate}
\def \meetdatehuman {$meetdatehuman}
% Variabler läggs ovan

\UseRawInputEncoding
\documentclass{dsekkallelse}
\usepackage[utf8]{inputenc}

\setheader{STUDIERÅDET}{Kallelse SRD \meetnumber}{\meetdate}

\title{Kallelse till studierådsmöte \meetdate}
\author{\ordforande}

\begin{document}

\section{Kallelse till studierådsmöte \meetnumber, den \meetdatehuman}

\tidochplats{12.10}{E:1407}

\begin{dagordning*}[total=16cm,paragraf=0.6cm,bilaga=3cm]
\punkt{OFMÖ}{}{}
\punkt{Tid och sätt}{Beslut}{}
\punkt{Adjungeringar}{Beslut}{}
\punkt{Godkännande av dagordningen}{Beslut}{}
\punkt{Föregående mötes protokoll}{Beslut}{}
\punkt{Information från Externa Representanter}{Information}{}
\punkt{Meddelanden}{Information}{}
\punkt{SRX}{Information}{}
\punkt{Valärenden och nomineringar}{Beslut}{}
\punkt{Avslutade kurser}{Diskussion}{}
\punkt{Pågående kurser}{Diskussion}{}
% Här läggs fler punkter
$points
\punkt{Övrigt}{Beslut}{}
\punkt{OFMA}{}{}
\end{dagordning*}

\signature{Lund, dag som ovan}{\ordforande}{Studierådsordförande Datatekniksektionen}
\end{document}
" | pdflatex
