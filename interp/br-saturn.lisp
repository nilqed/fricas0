 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; $aixTestSaturn := false
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$aixTestSaturn| NIL))
 
; $saturnAmpersand := '"\&\&"
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$saturnAmpersand| "\\&\\&"))
 
; $kPageSaturnArguments := nil  --bound by $kPageSaturn
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$kPageSaturnArguments| NIL))
 
; $atLeastOneUnexposed := false
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$atLeastOneUnexposed| NIL))
 
; $saturnContextMenuLines := nil
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$saturnContextMenuLines| NIL))
 
; $saturnContextMenuIndex := 0
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$saturnContextMenuIndex| 0))
 
; $saturnMacros := '(_
;   "\def\unixcommand#1#2{{\em #1}}"_
;   "\def\lispFunctionLink#1#2{\lispLink[d]{#1}{{\bf #2}}}"_
;   "\def\lispTypeLink#1#2{\lispLink[d]{#1}{{\sf #2}}}"_
;   "\def\menuitemstyle{\menubutton}"_
;   "\def\browseTitle#1{\windowTitle{#1}\section{#1}}"_
;   "\def\ttrarrow{$\rightarrow$}"_
;   "\def\spadtype#1{\lispLink[d]{\verb!(|spadtype| '|#1|)!}{\sf #1}}"_
;   "\def\spad#1{{\em #1}}"_
;   "\def\spadfun#1{{\em #1}}")
 
(EVAL-WHEN (EVAL LOAD)
  (SETQ |$saturnMacros|
          '("\\def\\unixcommand#1#2{{\\em #1}}"
            "\\def\\lispFunctionLink#1#2{\\lispLink[d]{#1}{{\\bf #2}}}"
            "\\def\\lispTypeLink#1#2{\\lispLink[d]{#1}{{\\sf #2}}}"
            "\\def\\menuitemstyle{\\menubutton}"
            "\\def\\browseTitle#1{\\windowTitle{#1}\\section{#1}}"
            "\\def\\ttrarrow{$\\rightarrow$}"
            "\\def\\spadtype#1{\\lispLink[d]{\\verb!(|spadtype| '|#1|)!}{\\sf #1}}"
            "\\def\\spad#1{{\\em #1}}" "\\def\\spadfun#1{{\\em #1}}")))
 
; page() ==
;   $standard => $curPage
;   $saturnPage
 
(DEFUN |page| #1=()
  (PROG #1# (RETURN (COND (|$standard| |$curPage|) ('T |$saturnPage|)))))
 
; htSay(x,:options) ==  --say for possibly both $saturn and standard code
;   htSayBind(x, options)
 
(DEFUN |htSay| (|x| &REST |options|)
  (PROG () (RETURN (|htSayBind| |x| |options|))))
 
; htSayCold x ==
;   htSay '"\lispLink{}{"
;   htSay x
;   htSay '"}"
 
(DEFUN |htSayCold| (|x|)
  (PROG ()
    (RETURN (PROGN (|htSay| "\\lispLink{}{") (|htSay| |x|) (|htSay| "}")))))
 
; htSayStandard(x, :options) ==  --do AT MOST for $standard
;   $saturn: local := nil
;   htSayBind(x, options)
 
(DEFUN |htSayStandard| (|x| &REST |options|)
  (PROG (|$saturn|)
    (DECLARE (SPECIAL |$saturn|))
    (RETURN (PROGN (SETQ |$saturn| NIL) (|htSayBind| |x| |options|)))))
 
; htSaySaturn(x, :options) ==    --do AT MOST for $saturn
;   $standard: local := nil
;   htSayBind(x, options)
 
(DEFUN |htSaySaturn| (|x| &REST |options|)
  (PROG (|$standard|)
    (DECLARE (SPECIAL |$standard|))
    (RETURN (PROGN (SETQ |$standard| NIL) (|htSayBind| |x| |options|)))))
 
; htSayBind(x, options) ==
;   bcHt x
;   for y in options repeat bcHt y
 
(DEFUN |htSayBind| (|x| |options|)
  (PROG ()
    (RETURN
     (PROGN
      (|bcHt| |x|)
      ((LAMBDA (|bfVar#1| |y|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#1|) (PROGN (SETQ |y| (CAR |bfVar#1|)) NIL))
            (RETURN NIL))
           ('T (|bcHt| |y|)))
          (SETQ |bfVar#1| (CDR |bfVar#1|))))
       |options| NIL)))))
 
; bcHt line ==
;   $newPage =>  --this path affects both saturn and old lines
;     text :=
;       PAIRP line => [['text, :line]]
;       STRINGP line => line
;       [['text, line]]
;     if $saturn then htpAddToPageDescription($saturnPage, text)
;     if $standard then htpAddToPageDescription($curPage, text)
;   PAIRP line =>
;     $htLineList := NCONC(nreverse mapStringize COPY_-LIST line, $htLineList)
;   $htLineList := [basicStringize line, :$htLineList]
 
(DEFUN |bcHt| (|line|)
  (PROG (|text|)
    (RETURN
     (COND
      (|$newPage|
       (PROGN
        (SETQ |text|
                (COND ((CONSP |line|) (LIST (CONS '|text| |line|)))
                      ((STRINGP |line|) |line|)
                      (#1='T (LIST (LIST '|text| |line|)))))
        (COND (|$saturn| (|htpAddToPageDescription| |$saturnPage| |text|)))
        (COND (|$standard| (|htpAddToPageDescription| |$curPage| |text|)))))
      ((CONSP |line|)
       (SETQ |$htLineList|
               (NCONC (NREVERSE (|mapStringize| (COPY-LIST |line|)))
                      |$htLineList|)))
      (#1#
       (SETQ |$htLineList| (CONS (|basicStringize| |line|) |$htLineList|)))))))
 
; htShowPage() ==
; -- show the page which has been computed
;   htSayStandard '"\endscroll"
;   htShowPageNoScroll()
 
(DEFUN |htShowPage| #1=()
  (PROG #1#
    (RETURN (PROGN (|htSayStandard| "\\endscroll") (|htShowPageNoScroll|)))))
 
; htShowPageNoScroll() ==
; -- show the page which has been computed
;   htSayStandard '"\autobuttons"
;   if $standard then
;     htpSetPageDescription($curPage, nreverse htpPageDescription $curPage)
;   if $saturn then
;     htpSetPageDescription($saturnPage, nreverse htpPageDescription $saturnPage)
;   $newPage := false
;   ----------------------
;   if $standard then
;     $htLineList := nil
;     htMakePage htpPageDescription $curPage
;     if $htLineList then line := concatenateStringList(nreverse $htLineList)
;     issueHTStandard line
;   ----------------------
;   if $saturn then
;     $htLineList := nil
;     htMakePage htpPageDescription $saturnPage
;     if $htLineList then line := concatenateStringList(nreverse $htLineList)
;     issueHTSaturn line
;   ----------------------
;   endHTPage()
 
(DEFUN |htShowPageNoScroll| ()
  (PROG (|line|)
    (RETURN
     (PROGN
      (|htSayStandard| "\\autobuttons")
      (COND
       (|$standard|
        (|htpSetPageDescription| |$curPage|
         (NREVERSE (|htpPageDescription| |$curPage|)))))
      (COND
       (|$saturn|
        (|htpSetPageDescription| |$saturnPage|
         (NREVERSE (|htpPageDescription| |$saturnPage|)))))
      (SETQ |$newPage| NIL)
      (COND
       (|$standard| (SETQ |$htLineList| NIL)
        (|htMakePage| (|htpPageDescription| |$curPage|))
        (COND
         (|$htLineList|
          (SETQ |line| (|concatenateStringList| (NREVERSE |$htLineList|)))))
        (|issueHTStandard| |line|)))
      (COND
       (|$saturn| (SETQ |$htLineList| NIL)
        (|htMakePage| (|htpPageDescription| |$saturnPage|))
        (COND
         (|$htLineList|
          (SETQ |line| (|concatenateStringList| (NREVERSE |$htLineList|)))))
        (|issueHTSaturn| |line|)))
      (|endHTPage|)))))
 
; issueHTSaturn line == --called by htMakePageNoScroll and htMakeErrorPage
;   if $saturn then
;      $marg      : local := 0
;      $linelength: local := 80
;      writeSaturn '"\inputonce{<AXIOM>/doc/browser/browmacs.tex}"
;      writeSaturnPrefix()
;      writeSaturn(line)
;      writeSaturnSuffix()
 
(DEFUN |issueHTSaturn| (|line|)
  (PROG (|$linelength| |$marg|)
    (DECLARE (SPECIAL |$linelength| |$marg|))
    (RETURN
     (COND
      (|$saturn| (SETQ |$marg| 0) (SETQ |$linelength| 80)
       (|writeSaturn| "\\inputonce{<AXIOM>/doc/browser/browmacs.tex}")
       (|writeSaturnPrefix|) (|writeSaturn| |line|) (|writeSaturnSuffix|))))))
 
; writeSaturnPrefix() ==
;   $saturnContextMenuLines =>
;     index :=
;       STRINGIMAGE ($saturnContextMenuIndex := $saturnContextMenuIndex + 1)
;     writeSaturnLines
;       ['"\newmenu{BCM", index,
;           '"}{",:nreverse $saturnContextMenuLines,
;             '"}\usemenu{BCM", index,'"}{\vbox{"]
 
(DEFUN |writeSaturnPrefix| ()
  (PROG (|index|)
    (RETURN
     (COND
      (|$saturnContextMenuLines|
       (IDENTITY
        (PROGN
         (SETQ |index|
                 (STRINGIMAGE
                  (SETQ |$saturnContextMenuIndex|
                          (+ |$saturnContextMenuIndex| 1))))
         (|writeSaturnLines|
          (CONS "\\newmenu{BCM"
                (CONS |index|
                      (CONS "}{"
                            (APPEND (NREVERSE |$saturnContextMenuLines|)
                                    (CONS "}\\usemenu{BCM"
                                          (CONS |index|
                                                (CONS "}{\\vbox{"
                                                      NIL)))))))))))))))
 
; writeSaturnSuffix() ==
;   $saturnContextMenuLines => saturnPRINTEXP '"}}"
 
(DEFUN |writeSaturnSuffix| #1=()
  (PROG #1#
    (RETURN
     (COND (|$saturnContextMenuLines| (IDENTITY (|saturnPRINTEXP| "}}")))))))
 
; issueHTStandard line == --called by htMakePageNoScroll and htMakeErrorPage
;   if $standard then
;   --unescapeStringsInForm line
;     sockSendInt($MenuServer, $SendLine)
;     sockSendString($MenuServer, line)
 
(DEFUN |issueHTStandard| (|line|)
  (PROG ()
    (RETURN
     (COND
      (|$standard| (|sockSendInt| |$MenuServer| |$SendLine|)
       (|sockSendString| |$MenuServer| |line|))))))
 
; htMakeErrorPage htPage ==
;   $newPage := false
;   $htLineList := nil
;   if $standard then $curPage := htPage
;   if $saturn then $saturnPage := htPage
;   htMakePage htpPageDescription htPage
;   line := concatenateStringList(nreverse $htLineList)
;   issueHT line
;   endHTPage()
 
(DEFUN |htMakeErrorPage| (|htPage|)
  (PROG (|line|)
    (RETURN
     (PROGN
      (SETQ |$newPage| NIL)
      (SETQ |$htLineList| NIL)
      (COND (|$standard| (SETQ |$curPage| |htPage|)))
      (COND (|$saturn| (SETQ |$saturnPage| |htPage|)))
      (|htMakePage| (|htpPageDescription| |htPage|))
      (SETQ |line| (|concatenateStringList| (NREVERSE |$htLineList|)))
      (|issueHT| |line|)
      (|endHTPage|)))))
 
; writeSaturnLines lines ==
;   for line in lines repeat
;    if line ~= '"" and line.0 = char '_\ then saturnTERPRI()
;    saturnPRINTEXP line
 
(DEFUN |writeSaturnLines| (|lines|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#2| |line|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#2|) (PROGN (SETQ |line| (CAR |bfVar#2|)) NIL))
           (RETURN NIL))
          ('T
           (PROGN
            (COND
             ((AND (NOT (EQUAL |line| ""))
                   (EQUAL (ELT |line| 0) (|char| '|\\|)))
              (|saturnTERPRI|)))
            (|saturnPRINTEXP| |line|))))
         (SETQ |bfVar#2| (CDR |bfVar#2|))))
      |lines| NIL))))
 
; writeSaturn(line) ==
;   k := 0
;   n := MAXINDEX line
;   while  --advance k if true
;       k > n => false
;       line.k ~= char '_\ => true
;       code := isBreakSegment?(line, k + 1,n) => false
;       true
;     repeat (k := k + 1)
;   k > n => writeSaturnPrint(line)
;   segment := SUBSTRING(line,0,k)
;   writeSaturnPrint(segment)
;   code = 1 =>
;     writeSaturnPrint('"\\")
;     writeSaturn SUBSTRING(line,k + 2, nil)
;   code = 2 =>
;     writeSaturnPrint('"  &")
;     writeSaturn SUBSTRING(line,k + 4, nil)
;   code = 3 =>
;     writeSaturnPrint('"\item")
;     writeSaturn SUBSTRING(line,k + 5,nil)
;   code = 4 =>
;     writeSaturnPrint('"\newline")
;     writeSaturn SUBSTRING(line,k + 8,nil)
;   code = 5 =>
;     writeSaturnPrint('"\table{")
;     $marg := $marg + 3
;     writeSaturnTable SUBSTRING(line,k + 7,nil)
;   code = 6 =>
;     i := charPosition(char '_},line,k + 4)
;     tabCode := SUBSTRING(line,k, i - k + 1)
;     writeSaturnPrint tabCode
;     line := SUBSTRING(line,i + 1, nil)
;     writeSaturn line
;   code = 7 =>
;     saturnTERPRI()
;     writeSaturn SUBSTRING(line, k + 2,nil)
;   code = 8 =>
;     i :=
;       substring?('"\beginmenu",  line,k) => k + 9
;       substring?('"\beginscroll",line,k) => k + 11
;       charPosition(char '_},line,k)
;     if char '_[ = line.(i + 1) then
;       i := charPosition(char '_], line, i + 2)
;     beginCode := SUBSTRING(line,k, i - k + 1)
;     writeSaturnPrint(beginCode)
;     line := SUBSTRING(line,i + 1,nil)
;     writeSaturn line
;   code = 9 =>
;     i :=
;       substring?('"\endmenu",line,k)   => k + 7
;       substring?('"\endscroll",line,k) => k + 9
;       charPosition(char '_},line,k)
;     endCode := SUBSTRING(line,k, i - k + 1)
;     writeSaturnPrint(endCode)
;     line := SUBSTRING(line,i + 1,nil)
;     $marg := $marg - 3
;     writeSaturn line
;   systemError code
 
(DEFUN |writeSaturn| (|line|)
  (PROG (|k| |n| |code| |segment| |i| |tabCode| |beginCode| |endCode|)
    (RETURN
     (PROGN
      (SETQ |k| 0)
      (SETQ |n| (MAXINDEX |line|))
      ((LAMBDA ()
         (LOOP
          (COND
           ((NOT
             (COND ((< |n| |k|) NIL)
                   ((NOT (EQUAL (ELT |line| |k|) (|char| '|\\|))) T)
                   ((SETQ |code| (|isBreakSegment?| |line| (+ |k| 1) |n|)) NIL)
                   (#1='T T)))
            (RETURN NIL))
           (#1# (SETQ |k| (+ |k| 1)))))))
      (COND ((< |n| |k|) (|writeSaturnPrint| |line|))
            (#1#
             (PROGN
              (SETQ |segment| (SUBSTRING |line| 0 |k|))
              (|writeSaturnPrint| |segment|)
              (COND
               ((EQL |code| 1)
                (PROGN
                 (|writeSaturnPrint| "\\\\")
                 (|writeSaturn| (SUBSTRING |line| (+ |k| 2) NIL))))
               ((EQL |code| 2)
                (PROGN
                 (|writeSaturnPrint| "  &")
                 (|writeSaturn| (SUBSTRING |line| (+ |k| 4) NIL))))
               ((EQL |code| 3)
                (PROGN
                 (|writeSaturnPrint| "\\item")
                 (|writeSaturn| (SUBSTRING |line| (+ |k| 5) NIL))))
               ((EQL |code| 4)
                (PROGN
                 (|writeSaturnPrint| "\\newline")
                 (|writeSaturn| (SUBSTRING |line| (+ |k| 8) NIL))))
               ((EQL |code| 5)
                (PROGN
                 (|writeSaturnPrint| "\\table{")
                 (SETQ |$marg| (+ |$marg| 3))
                 (|writeSaturnTable| (SUBSTRING |line| (+ |k| 7) NIL))))
               ((EQL |code| 6)
                (PROGN
                 (SETQ |i| (|charPosition| (|char| '}) |line| (+ |k| 4)))
                 (SETQ |tabCode| (SUBSTRING |line| |k| (+ (- |i| |k|) 1)))
                 (|writeSaturnPrint| |tabCode|)
                 (SETQ |line| (SUBSTRING |line| (+ |i| 1) NIL))
                 (|writeSaturn| |line|)))
               ((EQL |code| 7)
                (PROGN
                 (|saturnTERPRI|)
                 (|writeSaturn| (SUBSTRING |line| (+ |k| 2) NIL))))
               ((EQL |code| 8)
                (PROGN
                 (SETQ |i|
                         (COND
                          ((|substring?| "\\beginmenu" |line| |k|) (+ |k| 9))
                          ((|substring?| "\\beginscroll" |line| |k|)
                           (+ |k| 11))
                          (#1# (|charPosition| (|char| '}) |line| |k|))))
                 (COND
                  ((EQUAL (|char| '[) (ELT |line| (+ |i| 1)))
                   (SETQ |i| (|charPosition| (|char| ']) |line| (+ |i| 2)))))
                 (SETQ |beginCode| (SUBSTRING |line| |k| (+ (- |i| |k|) 1)))
                 (|writeSaturnPrint| |beginCode|)
                 (SETQ |line| (SUBSTRING |line| (+ |i| 1) NIL))
                 (|writeSaturn| |line|)))
               ((EQL |code| 9)
                (PROGN
                 (SETQ |i|
                         (COND
                          ((|substring?| "\\endmenu" |line| |k|) (+ |k| 7))
                          ((|substring?| "\\endscroll" |line| |k|) (+ |k| 9))
                          (#1# (|charPosition| (|char| '}) |line| |k|))))
                 (SETQ |endCode| (SUBSTRING |line| |k| (+ (- |i| |k|) 1)))
                 (|writeSaturnPrint| |endCode|)
                 (SETQ |line| (SUBSTRING |line| (+ |i| 1) NIL))
                 (SETQ |$marg| (- |$marg| 3))
                 (|writeSaturn| |line|)))
               (#1# (|systemError| |code|))))))))))
 
; isBreakSegment?(line, k, n) ==
;   k > n => nil
;   char2 := line . k
;   char2 = (char '_\) => 1
;   char2 = (char '_&) =>
;     substring?('"&\&", line, k) => 2
;     nil
;   char2 = char 'i =>
;     substring?('"item",line,k) => 3
;     nil
;   char2 = char 'n =>
;     substring?('"newline",line,k) => 4
;     nil
;   char2 = char 't =>
;     (k := k + 2) > n => nil
;     line.(k - 1) = char 'a and line.k = char 'b =>
;       (k := k + 1) > n => nil
;       line.k = char "{" => 6
;       substring?('"table",line,k - 3) => 5
;       nil
;   char2 = (char '_!) => 7
;   char2 = char 'b =>
;     substring?('"begin",line,k) => 8
;     nil
;   char2 = (char 'e)  =>
;     substring?('"end",line,k) => 9
;     nil
;   nil
 
(DEFUN |isBreakSegment?| (|line| |k| |n|)
  (PROG (|char2|)
    (RETURN
     (COND ((< |n| |k|) NIL)
           (#1='T
            (PROGN
             (SETQ |char2| (ELT |line| |k|))
             (COND ((EQUAL |char2| (|char| '|\\|)) 1)
                   ((EQUAL |char2| (|char| '&))
                    (COND ((|substring?| "&\\&" |line| |k|) 2) (#1# NIL)))
                   ((EQUAL |char2| (|char| '|i|))
                    (COND ((|substring?| "item" |line| |k|) 3) (#1# NIL)))
                   ((EQUAL |char2| (|char| '|n|))
                    (COND ((|substring?| "newline" |line| |k|) 4) (#1# NIL)))
                   ((EQUAL |char2| (|char| '|t|))
                    (COND ((< |n| (SETQ |k| (+ |k| 2))) NIL)
                          ((AND (EQUAL (ELT |line| (- |k| 1)) (|char| '|a|))
                                (EQUAL (ELT |line| |k|) (|char| '|b|)))
                           (COND ((< |n| (SETQ |k| (+ |k| 1))) NIL)
                                 ((EQUAL (ELT |line| |k|) (|char| '{)) 6)
                                 ((|substring?| "table" |line| (- |k| 3)) 5)
                                 (#1# NIL)))))
                   ((EQUAL |char2| (|char| '!)) 7)
                   ((EQUAL |char2| (|char| '|b|))
                    (COND ((|substring?| "begin" |line| |k|) 8) (#1# NIL)))
                   ((EQUAL |char2| (|char| '|e|))
                    (COND ((|substring?| "end" |line| |k|) 9) (#1# NIL)))
                   (#1# NIL))))))))
 
; writeSaturnPrint s ==
;   for i in 0..($marg - 1) repeat saturnPRINTEXP '" "
;   saturnPRINTEXP s
;   saturnTERPRI()
 
(DEFUN |writeSaturnPrint| (|s|)
  (PROG ()
    (RETURN
     (PROGN
      ((LAMBDA (|bfVar#3| |i|)
         (LOOP
          (COND ((> |i| |bfVar#3|) (RETURN NIL)) ('T (|saturnPRINTEXP| " ")))
          (SETQ |i| (+ |i| 1))))
       (- |$marg| 1) 0)
      (|saturnPRINTEXP| |s|)
      (|saturnTERPRI|)))))
 
; saturnPRINTEXP s ==
;   $browserOutputStream => PRINTEXP(s,$browserOutputStream)
;   PRINTEXP s
 
(DEFUN |saturnPRINTEXP| (|s|)
  (PROG ()
    (RETURN
     (COND (|$browserOutputStream| (PRINTEXP |s| |$browserOutputStream|))
           ('T (PRINTEXP |s|))))))
 
; saturnTERPRI() ==
;   $browserOutputStream => TERPRI($browserOutputStream)
;   TERPRI()
 
(DEFUN |saturnTERPRI| #1=()
  (PROG #1#
    (RETURN
     (COND (|$browserOutputStream| (TERPRI |$browserOutputStream|))
           ('T (TERPRI))))))
 
; writeSaturnTable line ==
;   open := charPosition(char '"_{",line,0)
;   close:= charPosition(char '"_}",line,0)
;   open < close =>
;     close := findBalancingBrace(line,open + 1,MAXINDEX line,0) or error '"no balancing brace"
;     writeSaturnPrint SUBSTRING(line,0,close + 1)
;     writeSaturnTable SUBSTRING(line,close + 1,nil)
;   $marg := $marg - 3
;   writeSaturnPrint SUBSTRING(line,0,close + 1)
;   writeSaturn SUBSTRING(line, close + 1,nil)
 
(DEFUN |writeSaturnTable| (|line|)
  (PROG (|open| |close|)
    (RETURN
     (PROGN
      (SETQ |open| (|charPosition| (|char| "{") |line| 0))
      (SETQ |close| (|charPosition| (|char| "}") |line| 0))
      (COND
       ((< |open| |close|)
        (PROGN
         (SETQ |close|
                 (OR
                  (|findBalancingBrace| |line| (+ |open| 1) (MAXINDEX |line|)
                   0)
                  (|error| "no balancing brace")))
         (|writeSaturnPrint| (SUBSTRING |line| 0 (+ |close| 1)))
         (|writeSaturnTable| (SUBSTRING |line| (+ |close| 1) NIL))))
       ('T
        (PROGN
         (SETQ |$marg| (- |$marg| 3))
         (|writeSaturnPrint| (SUBSTRING |line| 0 (+ |close| 1)))
         (|writeSaturn| (SUBSTRING |line| (+ |close| 1) NIL)))))))))
 
; findBalancingBrace(s,k,n,level) ==
;   k > n => nil
;   c := s . k
;   c = char '_{ => findBalancingBrace(s, k + 1, n, level + 1)
;   c = char '_} =>
;     level = 0 => k
;     findBalancingBrace(s, k + 1, n, level - 1)
;   findBalancingBrace(s, k + 1, n, level)
 
(DEFUN |findBalancingBrace| (|s| |k| |n| |level|)
  (PROG (|c|)
    (RETURN
     (COND ((< |n| |k|) NIL)
           (#1='T
            (PROGN
             (SETQ |c| (ELT |s| |k|))
             (COND
              ((EQUAL |c| (|char| '{))
               (|findBalancingBrace| |s| (+ |k| 1) |n| (+ |level| 1)))
              ((EQUAL |c| (|char| '}))
               (COND ((EQL |level| 0) |k|)
                     (#1#
                      (|findBalancingBrace| |s| (+ |k| 1) |n| (- |level| 1)))))
              (#1# (|findBalancingBrace| |s| (+ |k| 1) |n| |level|)))))))))
 
; htMakePageStandard itemList ==
;   $saturn => nil
;   htMakePage itemList
 
(DEFUN |htMakePageStandard| (|itemList|)
  (PROG () (RETURN (COND (|$saturn| NIL) ('T (|htMakePage| |itemList|))))))
 
; htMakePageSaturn itemList ==
;   $standard => nil
;   htMakePage itemList
 
(DEFUN |htMakePageSaturn| (|itemList|)
  (PROG () (RETURN (COND (|$standard| NIL) ('T (|htMakePage| |itemList|))))))
 
; htMakePage itemList ==
;   if $newPage then
;     if $saturn then htpAddToPageDescription($saturnPage, saturnTran itemList)
;     if $standard then htpAddToPageDescription($curPage, itemList)
;   htMakePage1 itemList
 
(DEFUN |htMakePage| (|itemList|)
  (PROG ()
    (RETURN
     (PROGN
      (COND
       (|$newPage|
        (COND
         (|$saturn|
          (|htpAddToPageDescription| |$saturnPage| (|saturnTran| |itemList|))))
        (COND
         (|$standard| (|htpAddToPageDescription| |$curPage| |itemList|)))))
      (|htMakePage1| |itemList|)))))
 
; htMakePage1 itemList ==
; -- make a page given the description in itemList
;   for u in itemList repeat
;     itemType := 'text
;     items :=
;       STRINGP u => u
;       ATOM u => STRINGIMAGE u
;       STRINGP first u => u
;       u is ['text, :s] => s
;       itemType := first u
;       rest u
;     itemType = 'text              => iht items
; --      $saturn => bcHt items
; --      $standard => iht items
;     itemType = 'lispLinks         => htLispLinks items
;     itemType = 'lispmemoLinks     => htLispMemoLinks items
;     itemType = 'bcLinks           => htBcLinks items               --->
;     itemType = 'bcLinksNS         => htBcLinks(items,true)
;     itemType = 'bcLispLinks       => htBcLispLinks items           --->
;     itemType = 'radioButtons      => htRadioButtons items
;     itemType = 'bcRadioButtons    => htBcRadioButtons items
;     itemType = 'inputStrings      => htInputStrings items
;     itemType = 'domainConditions  => htProcessDomainConditions items
;     itemType = 'bcStrings         => htProcessBcStrings items
;     itemType = 'toggleButtons     => htProcessToggleButtons items
;     itemType = 'bcButtons         => htProcessBcButtons items
;     itemType = 'doneButton        => htProcessDoneButton items
;     itemType = 'doitButton        => htProcessDoitButton items
;     systemError '"unexpected branch"
 
(DEFUN |htMakePage1| (|itemList|)
  (PROG (|itemType| |s| |items|)
    (RETURN
     ((LAMBDA (|bfVar#4| |u|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#4|) (PROGN (SETQ |u| (CAR |bfVar#4|)) NIL))
           (RETURN NIL))
          (#1='T
           (PROGN
            (SETQ |itemType| '|text|)
            (SETQ |items|
                    (COND ((STRINGP |u|) |u|) ((ATOM |u|) (STRINGIMAGE |u|))
                          ((STRINGP (CAR |u|)) |u|)
                          ((AND (CONSP |u|) (EQ (CAR |u|) '|text|)
                                (PROGN (SETQ |s| (CDR |u|)) #1#))
                           |s|)
                          (#1# (PROGN (SETQ |itemType| (CAR |u|)) (CDR |u|)))))
            (COND ((EQ |itemType| '|text|) (|iht| |items|))
                  ((EQ |itemType| '|lispLinks|) (|htLispLinks| |items|))
                  ((EQ |itemType| '|lispmemoLinks|)
                   (|htLispMemoLinks| |items|))
                  ((EQ |itemType| '|bcLinks|) (|htBcLinks| |items|))
                  ((EQ |itemType| '|bcLinksNS|) (|htBcLinks| |items| T))
                  ((EQ |itemType| '|bcLispLinks|) (|htBcLispLinks| |items|))
                  ((EQ |itemType| '|radioButtons|) (|htRadioButtons| |items|))
                  ((EQ |itemType| '|bcRadioButtons|)
                   (|htBcRadioButtons| |items|))
                  ((EQ |itemType| '|inputStrings|) (|htInputStrings| |items|))
                  ((EQ |itemType| '|domainConditions|)
                   (|htProcessDomainConditions| |items|))
                  ((EQ |itemType| '|bcStrings|) (|htProcessBcStrings| |items|))
                  ((EQ |itemType| '|toggleButtons|)
                   (|htProcessToggleButtons| |items|))
                  ((EQ |itemType| '|bcButtons|) (|htProcessBcButtons| |items|))
                  ((EQ |itemType| '|doneButton|)
                   (|htProcessDoneButton| |items|))
                  ((EQ |itemType| '|doitButton|)
                   (|htProcessDoitButton| |items|))
                  (#1# (|systemError| "unexpected branch"))))))
         (SETQ |bfVar#4| (CDR |bfVar#4|))))
      |itemList| NIL))))
 
; saturnTran x ==
;   x is [[kind, [s1, s2, :callTail]]] and MEMQ(kind,'(bcLinks bcLispLinks)) =>
;     text := saturnTranText s2
;     fs :=  getCallBackFn callTail
;     y := isMenuItemStyle? s1 =>  ----> y is text for button in 2nd column
;       t1 :=  mkDocLink(fs, mkMenuButton())
;       y = '"" =>
;         s2 = '"" => t1
;         mkTabularItem [t1, text]
;       t2 :=  mkDocLink(fs, y)
;       mkTabularItem [t1, t2, text]
;     t := mkDocLink(fs, s1)
;     [:t, :text]
;   x is [['text,:r],:.] => r
;   error nil
 
(DEFUN |saturnTran| (|x|)
  (PROG (|ISTMP#1| |kind| |ISTMP#2| |ISTMP#3| |s1| |ISTMP#4| |s2| |callTail|
         |text| |fs| |y| |t1| |t2| |t| |r|)
    (RETURN
     (COND
      ((AND (CONSP |x|) (EQ (CDR |x|) NIL)
            (PROGN
             (SETQ |ISTMP#1| (CAR |x|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |kind| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN
                         (SETQ |ISTMP#3| (CAR |ISTMP#2|))
                         (AND (CONSP |ISTMP#3|)
                              (PROGN
                               (SETQ |s1| (CAR |ISTMP#3|))
                               (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                               (AND (CONSP |ISTMP#4|)
                                    (PROGN
                                     (SETQ |s2| (CAR |ISTMP#4|))
                                     (SETQ |callTail| (CDR |ISTMP#4|))
                                     #1='T)))))))))
            (MEMQ |kind| '(|bcLinks| |bcLispLinks|)))
       (PROGN
        (SETQ |text| (|saturnTranText| |s2|))
        (SETQ |fs| (|getCallBackFn| |callTail|))
        (COND
         ((SETQ |y| (|isMenuItemStyle?| |s1|))
          (PROGN
           (SETQ |t1| (|mkDocLink| |fs| (|mkMenuButton|)))
           (COND
            ((EQUAL |y| "")
             (COND ((EQUAL |s2| "") |t1|)
                   (#1# (|mkTabularItem| (LIST |t1| |text|)))))
            (#1#
             (PROGN
              (SETQ |t2| (|mkDocLink| |fs| |y|))
              (|mkTabularItem| (LIST |t1| |t2| |text|)))))))
         (#1#
          (PROGN (SETQ |t| (|mkDocLink| |fs| |s1|)) (APPEND |t| |text|))))))
      ((AND (CONSP |x|)
            (PROGN
             (SETQ |ISTMP#1| (CAR |x|))
             (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|text|)
                  (PROGN (SETQ |r| (CDR |ISTMP#1|)) #1#))))
       |r|)
      (#1# (|error| NIL))))))
 
; mkBold s ==
;   secondPart :=
;     atom s => [s, '"}"]
;     [:s, '"}"]
;   ['"{\bf ", :secondPart]
 
(DEFUN |mkBold| (|s|)
  (PROG (|secondPart|)
    (RETURN
     (PROGN
      (SETQ |secondPart|
              (COND ((ATOM |s|) (LIST |s| "}"))
                    ('T (APPEND |s| (CONS "}" NIL)))))
      (CONS "{\\bf " |secondPart|)))))
 
; mkMenuButton() == [menuButton()]
 
(DEFUN |mkMenuButton| #1=() (PROG #1# (RETURN (LIST (|menuButton|)))))
 
; menuButton() == '"\menuitemstyle{}"
 
(DEFUN |menuButton| #1=() (PROG #1# (RETURN "\\menuitemstyle{}")))
 
; getCallBackFn form ==
;   func := mkCurryFun(first form, rest form)
;   STRCONC('"(|htDoneButton| '|", func, '"| ",htpName page(), '")")
 
(DEFUN |getCallBackFn| (|form|)
  (PROG (|func|)
    (RETURN
     (PROGN
      (SETQ |func| (|mkCurryFun| (CAR |form|) (CDR |form|)))
      (STRCONC "(|htDoneButton| '|" |func| "| " (|htpName| (|page|)) ")")))))
 
; mkDocLink(code,s) ==
;   if atom code then code := [code]
;   if atom s    then s    := [s]
;   ['"\lispLink[d]{\verb!", :code, '"!}{", :s, '"}"]
 
(DEFUN |mkDocLink| (|code| |s|)
  (PROG ()
    (RETURN
     (PROGN
      (COND ((ATOM |code|) (SETQ |code| (LIST |code|))))
      (COND ((ATOM |s|) (SETQ |s| (LIST |s|))))
      (CONS "\\lispLink[d]{\\verb!"
            (APPEND |code| (CONS "!}{" (APPEND |s| (CONS "}" NIL)))))))))
 
; saturnTranText x ==
;   STRINGP x         => [unTab x]
;   null x            => nil
;   -- FIXME
;   -- x is [s,fn,:.] and s ????
;   r is [s,fn,:.] and s = '"\unixcommand{" => ['"{\it ",s,'".spad}"]
;   x is [['text, :s],:r] => unTab [:s, :saturnTranText r]
;   error nil
 
(DEFUN |saturnTranText| (|x|)
  (PROG (|s| |ISTMP#1| |fn| |r|)
    (RETURN
     (COND ((STRINGP |x|) (LIST (|unTab| |x|))) ((NULL |x|) NIL)
           ((AND (CONSP |r|)
                 (PROGN
                  (SETQ |s| (CAR |r|))
                  (SETQ |ISTMP#1| (CDR |r|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN (SETQ |fn| (CAR |ISTMP#1|)) #1='T)))
                 (EQUAL |s| "\\unixcommand{"))
            (LIST "{\\it " |s| ".spad}"))
           ((AND (CONSP |x|)
                 (PROGN
                  (SETQ |ISTMP#1| (CAR |x|))
                  (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|text|)
                       (PROGN (SETQ |s| (CDR |ISTMP#1|)) #1#)))
                 (PROGN (SETQ |r| (CDR |x|)) #1#))
            (|unTab| (APPEND |s| (|saturnTranText| |r|))))
           (#1# (|error| NIL))))))
 
; isMenuItemStyle? s ==
;   15 = STRING_<('"\menuitemstyle{", s) => SUBSTRING(s,15,(MAXINDEX s) - 15)
;   nil
 
(DEFUN |isMenuItemStyle?| (|s|)
  (PROG ()
    (RETURN
     (COND
      ((EQL 15 (STRING< "\\menuitemstyle{" |s|))
       (SUBSTRING |s| 15 (- (MAXINDEX |s|) 15)))
      ('T NIL)))))
 
; getCallBack callTail ==
;   LASSOC(callTail, $callTailList) or
;     callTail is [fn] => callTail
;     error nil
 
(DEFUN |getCallBack| (|callTail|)
  (PROG (|fn|)
    (RETURN
     (OR (LASSOC |callTail| |$callTailList|)
         (COND
          ((AND (CONSP |callTail|) (EQ (CDR |callTail|) NIL)
                (PROGN (SETQ |fn| (CAR |callTail|)) #1='T))
           |callTail|)
          (#1# (|error| NIL)))))))
 
; endHTPage() ==
;   $standard => sockSendInt($MenuServer, $EndOfPage)
;   nil
 
(DEFUN |endHTPage| #1=()
  (PROG #1#
    (RETURN
     (COND (|$standard| (|sockSendInt| |$MenuServer| |$EndOfPage|)) ('T NIL)))))
 
; htSayHrule() == bcHt
;   $saturn => '"\hrule{}\newline{}"
;   '"\horizontalline{}\newline{}"
 
(DEFUN |htSayHrule| #1=()
  (PROG #1#
    (RETURN
     (|bcHt|
      (COND (|$saturn| "\\hrule{}\\newline{}")
            ('T "\\horizontalline{}\\newline{}"))))))
 
; htpAddInputAreaProp(htPage, label, prop) ==
; ------------> Add STRINGIMAGE
;   SETELT(htPage, 5, [[label, nil, nil, nil, :prop], :ELT(htPage, 5)])
 
(DEFUN |htpAddInputAreaProp| (|htPage| |label| |prop|)
  (PROG ()
    (RETURN
     (SETELT |htPage| 5
      (CONS (CONS |label| (CONS NIL (CONS NIL (CONS NIL |prop|))))
            (ELT |htPage| 5))))))
 
; htpSetLabelInputString(htPage, label, val) ==
; ------------> Add STRINGIMAGE
; -- value user typed as input string on page
;   props := LASSOC(label, htpInputAreaAlist htPage)
;   props => SETELT(props, 0, STRINGIMAGE val)
;   nil
 
(DEFUN |htpSetLabelInputString| (|htPage| |label| |val|)
  (PROG (|props|)
    (RETURN
     (PROGN
      (SETQ |props| (LASSOC |label| (|htpInputAreaAlist| |htPage|)))
      (COND (|props| (SETELT |props| 0 (STRINGIMAGE |val|))) ('T NIL))))))
 
; htDoneButton(func, htPage, :optionalArgs) ==
; ------> Handle argument values passed from page if present
;   if optionalArgs then
;     htpSetInputAreaAlist(htPage, first optionalArgs)
;   typeCheckInputAreas htPage =>
;     htMakeErrorPage htPage
;   NULL FBOUNDP func =>
;     systemError ['"unknown function", func]
;   FUNCALL(SYMBOL_-FUNCTION func, htPage)
 
(DEFUN |htDoneButton| (|func| |htPage| &REST |optionalArgs|)
  (PROG ()
    (RETURN
     (PROGN
      (COND
       (|optionalArgs| (|htpSetInputAreaAlist| |htPage| (CAR |optionalArgs|))))
      (COND ((|typeCheckInputAreas| |htPage|) (|htMakeErrorPage| |htPage|))
            ((NULL (FBOUNDP |func|))
             (|systemError| (LIST "unknown function" |func|)))
            ('T (FUNCALL (SYMBOL-FUNCTION |func|) |htPage|)))))))
 
; htBcLinks(links,:options) ==
;   skipStateInfo? := IFCAR options
;   [links,options] := beforeAfter('options,links)
;   for [message, info, func, :value] in links repeat
;     link :=
;       $saturn => '"\lispLink[d]"
;       '"\lispdownlink"
;     htMakeButton(link,message,
;                    mkCurryFun(func, value),skipStateInfo?)
;     bcIssueHt info
 
(DEFUN |htBcLinks| (|links| &REST |options|)
  (PROG (|skipStateInfo?| |LETTMP#1| |message| |ISTMP#1| |info| |ISTMP#2|
         |func| |value| |link|)
    (RETURN
     (PROGN
      (SETQ |skipStateInfo?| (IFCAR |options|))
      (SETQ |LETTMP#1| (|beforeAfter| '|options| |links|))
      (SETQ |links| (CAR |LETTMP#1|))
      (SETQ |options| (CADR |LETTMP#1|))
      ((LAMBDA (|bfVar#6| |bfVar#5|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#6|) (PROGN (SETQ |bfVar#5| (CAR |bfVar#6|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#5|)
                 (PROGN
                  (SETQ |message| (CAR |bfVar#5|))
                  (SETQ |ISTMP#1| (CDR |bfVar#5|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |info| (CAR |ISTMP#1|))
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|)
                             (PROGN
                              (SETQ |func| (CAR |ISTMP#2|))
                              (SETQ |value| (CDR |ISTMP#2|))
                              #1#)))))
                 (PROGN
                  (SETQ |link|
                          (COND (|$saturn| "\\lispLink[d]")
                                (#1# "\\lispdownlink")))
                  (|htMakeButton| |link| |message|
                   (|mkCurryFun| |func| |value|) |skipStateInfo?|)
                  (|bcIssueHt| |info|)))))
          (SETQ |bfVar#6| (CDR |bfVar#6|))))
       |links| NIL)))))
 
; htBcLispLinks links ==
;   [links,options] := beforeAfter('options,links)
;   for [message, info, func, :value] in links repeat
;     link :=
;       $saturn => '"\lispLink[n]"
;       '"\lisplink"
;     htMakeButton(link ,message, mkCurryFun(func, value))
;     bcIssueHt info
 
(DEFUN |htBcLispLinks| (|links|)
  (PROG (|LETTMP#1| |options| |message| |ISTMP#1| |info| |ISTMP#2| |func|
         |value| |link|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (|beforeAfter| '|options| |links|))
      (SETQ |links| (CAR |LETTMP#1|))
      (SETQ |options| (CADR |LETTMP#1|))
      ((LAMBDA (|bfVar#8| |bfVar#7|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#8|) (PROGN (SETQ |bfVar#7| (CAR |bfVar#8|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#7|)
                 (PROGN
                  (SETQ |message| (CAR |bfVar#7|))
                  (SETQ |ISTMP#1| (CDR |bfVar#7|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |info| (CAR |ISTMP#1|))
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|)
                             (PROGN
                              (SETQ |func| (CAR |ISTMP#2|))
                              (SETQ |value| (CDR |ISTMP#2|))
                              #1#)))))
                 (PROGN
                  (SETQ |link|
                          (COND (|$saturn| "\\lispLink[n]")
                                (#1# "\\lisplink")))
                  (|htMakeButton| |link| |message|
                   (|mkCurryFun| |func| |value|))
                  (|bcIssueHt| |info|)))))
          (SETQ |bfVar#8| (CDR |bfVar#8|))))
       |links| NIL)))))
 
; htMakeButton(htCommand, message, func,:options) ==
;   $saturn => htMakeButtonSaturn(htCommand, message, func, options)
;   skipStateInfo? := IFCAR options
;   iht [htCommand, '"{"]
;   bcIssueHt message
;   skipStateInfo? =>
;     iht ['"}{(|htDoneButton| '|", func, '"| ",htpName $curPage, '")}"]
;   iht ['"}{(|htDoneButton| '|", func, '"| (PROGN "]
;   for [id, ., ., ., type, :.] in htpInputAreaAlist $curPage repeat
;     iht ['"(|htpSetLabelInputString| ", htpName $curPage, '"'|", id, '"| "]
;     if type = 'string then
;       iht ['"_"\stringvalue{", id, '"}_""]
;     else
;       iht ['"_"\boxvalue{", id, '"}_""]
;     iht '") "
;   iht [htpName $curPage, '"))}"]
 
(DEFUN |htMakeButton| (|htCommand| |message| |func| &REST |options|)
  (PROG (|skipStateInfo?| |id| |ISTMP#1| |ISTMP#2| |ISTMP#3| |ISTMP#4| |type|)
    (RETURN
     (COND
      (|$saturn| (|htMakeButtonSaturn| |htCommand| |message| |func| |options|))
      (#1='T
       (PROGN
        (SETQ |skipStateInfo?| (IFCAR |options|))
        (|iht| (LIST |htCommand| "{"))
        (|bcIssueHt| |message|)
        (COND
         (|skipStateInfo?|
          (|iht|
           (LIST "}{(|htDoneButton| '|" |func| "| " (|htpName| |$curPage|)
                 ")}")))
         (#1#
          (PROGN
           (|iht| (LIST "}{(|htDoneButton| '|" |func| "| (PROGN "))
           ((LAMBDA (|bfVar#10| |bfVar#9|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#10|)
                     (PROGN (SETQ |bfVar#9| (CAR |bfVar#10|)) NIL))
                 (RETURN NIL))
                (#1#
                 (AND (CONSP |bfVar#9|)
                      (PROGN
                       (SETQ |id| (CAR |bfVar#9|))
                       (SETQ |ISTMP#1| (CDR |bfVar#9|))
                       (AND (CONSP |ISTMP#1|)
                            (PROGN
                             (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                             (AND (CONSP |ISTMP#2|)
                                  (PROGN
                                   (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                                   (AND (CONSP |ISTMP#3|)
                                        (PROGN
                                         (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                                         (AND (CONSP |ISTMP#4|)
                                              (PROGN
                                               (SETQ |type| (CAR |ISTMP#4|))
                                               #1#)))))))))
                      (PROGN
                       (|iht|
                        (LIST "(|htpSetLabelInputString| "
                              (|htpName| |$curPage|) "'|" |id| "| "))
                       (COND
                        ((EQ |type| '|string|)
                         (|iht| (LIST "\"\\stringvalue{" |id| "}\"")))
                        (#1# (|iht| (LIST "\"\\boxvalue{" |id| "}\""))))
                       (|iht| ") ")))))
               (SETQ |bfVar#10| (CDR |bfVar#10|))))
            (|htpInputAreaAlist| |$curPage|) NIL)
           (|iht| (LIST (|htpName| |$curPage|) "))}")))))))))))
 
; htMakeButtonSaturn(htCommand, message, func,options) ==
;   skipStateInfo? := IFCAR options
;   iht htCommand
;   skipStateInfo? =>
;     iht ['"{\verb!(|htDoneButton| '|", func, '"| ",htpName page(), '")!}{"]
;     bcIssueHt message
;     iht '"}"
;   iht ['"{\verb!(|htDoneButton| '|", func, '"| "]
;   if $kPageSaturnArguments then
;     iht '"(PROGN "
;     for id in $kPageSaturnArguments for var in $PatternVariableList  repeat
;       iht ['"(|htpSetLabelInputString| ", htpName page(), '"'|", var, '"| "]
;       iht ["'|!\", id, '"\verb!|"]
;       iht '")"
;     iht htpName $saturnPage
;     iht '")"
;   else
;     iht htpName $saturnPage
;   iht '")!}{"
;   bcIssueHt message
;   iht '"}"
 
(DEFUN |htMakeButtonSaturn| (|htCommand| |message| |func| |options|)
  (PROG (|skipStateInfo?|)
    (RETURN
     (PROGN
      (SETQ |skipStateInfo?| (IFCAR |options|))
      (|iht| |htCommand|)
      (COND
       (|skipStateInfo?|
        (PROGN
         (|iht|
          (LIST "{\\verb!(|htDoneButton| '|" |func| "| " (|htpName| (|page|))
                ")!}{"))
         (|bcIssueHt| |message|)
         (|iht| "}")))
       (#1='T
        (PROGN
         (|iht| (LIST "{\\verb!(|htDoneButton| '|" |func| "| "))
         (COND
          (|$kPageSaturnArguments| (|iht| "(PROGN ")
           ((LAMBDA (|bfVar#11| |id| |bfVar#12| |var|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#11|) (PROGN (SETQ |id| (CAR |bfVar#11|)) NIL)
                     (ATOM |bfVar#12|)
                     (PROGN (SETQ |var| (CAR |bfVar#12|)) NIL))
                 (RETURN NIL))
                (#1#
                 (PROGN
                  (|iht|
                   (LIST "(|htpSetLabelInputString| " (|htpName| (|page|)) "'|"
                         |var| "| "))
                  (|iht| (LIST '|'\|!\\| |id| "\\verb!|"))
                  (|iht| ")"))))
               (SETQ |bfVar#11| (CDR |bfVar#11|))
               (SETQ |bfVar#12| (CDR |bfVar#12|))))
            |$kPageSaturnArguments| NIL |$PatternVariableList| NIL)
           (|iht| (|htpName| |$saturnPage|)) (|iht| ")"))
          (#1# (|iht| (|htpName| |$saturnPage|))))
         (|iht| ")!}{")
         (|bcIssueHt| |message|)
         (|iht| "}"))))))))
 
; htpAddToPageDescription(htPage, pageDescrip) ==
;   newDescript :=
;     STRINGP pageDescrip => [pageDescrip, :ELT(htPage, 7)]
;     nconc(nreverse COPY_-LIST pageDescrip, ELT(htPage, 7))
;   SETELT(htPage, 7, newDescript)
 
(DEFUN |htpAddToPageDescription| (|htPage| |pageDescrip|)
  (PROG (|newDescript|)
    (RETURN
     (PROGN
      (SETQ |newDescript|
              (COND
               ((STRINGP |pageDescrip|) (CONS |pageDescrip| (ELT |htPage| 7)))
               ('T
                (NCONC (NREVERSE (COPY-LIST |pageDescrip|))
                       (ELT |htPage| 7)))))
      (SETELT |htPage| 7 |newDescript|)))))
 
; htProcessBcStrings strings ==
;   for [numChars, default, stringName, spadType, :filter] in strings repeat
;     mess2 := '""
;     if NULL LASSOC(stringName, htpInputAreaAlist page()) then
;       setUpDefault(stringName, ['string, default, spadType, filter])
;     if htpLabelErrorMsg(page(), stringName) then
;       iht ['"\centerline{{\em ", htpLabelErrorMsg(page(), stringName), '"}}"]
;       mess2 := CONCAT(mess2, bcSadFaces())
;       htpSetLabelErrorMsg(page(), stringName, nil)
;     iht ['"\inputstring{", stringName, '"}{",
;          numChars, '"}{", htpLabelDefault(page(),stringName), '"} ", mess2]
 
(DEFUN |htProcessBcStrings| (|strings|)
  (PROG (|numChars| |ISTMP#1| |default| |ISTMP#2| |stringName| |ISTMP#3|
         |spadType| |filter| |mess2|)
    (RETURN
     ((LAMBDA (|bfVar#14| |bfVar#13|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#14|)
               (PROGN (SETQ |bfVar#13| (CAR |bfVar#14|)) NIL))
           (RETURN NIL))
          (#1='T
           (AND (CONSP |bfVar#13|)
                (PROGN
                 (SETQ |numChars| (CAR |bfVar#13|))
                 (SETQ |ISTMP#1| (CDR |bfVar#13|))
                 (AND (CONSP |ISTMP#1|)
                      (PROGN
                       (SETQ |default| (CAR |ISTMP#1|))
                       (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                       (AND (CONSP |ISTMP#2|)
                            (PROGN
                             (SETQ |stringName| (CAR |ISTMP#2|))
                             (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                             (AND (CONSP |ISTMP#3|)
                                  (PROGN
                                   (SETQ |spadType| (CAR |ISTMP#3|))
                                   (SETQ |filter| (CDR |ISTMP#3|))
                                   #1#)))))))
                (PROGN
                 (SETQ |mess2| "")
                 (COND
                  ((NULL (LASSOC |stringName| (|htpInputAreaAlist| (|page|))))
                   (|setUpDefault| |stringName|
                    (LIST '|string| |default| |spadType| |filter|))))
                 (COND
                  ((|htpLabelErrorMsg| (|page|) |stringName|)
                   (|iht|
                    (LIST "\\centerline{{\\em "
                          (|htpLabelErrorMsg| (|page|) |stringName|) "}}"))
                   (SETQ |mess2| (CONCAT |mess2| (|bcSadFaces|)))
                   (|htpSetLabelErrorMsg| (|page|) |stringName| NIL)))
                 (|iht|
                  (LIST "\\inputstring{" |stringName| "}{" |numChars| "}{"
                        (|htpLabelDefault| (|page|) |stringName|) "} "
                        |mess2|))))))
         (SETQ |bfVar#14| (CDR |bfVar#14|))))
      |strings| NIL))))
 
; setUpDefault(name, props) ==
;   htpAddInputAreaProp(page(), name, props)
 
(DEFUN |setUpDefault| (|name| |props|)
  (PROG () (RETURN (|htpAddInputAreaProp| (|page|) |name| |props|))))
 
; htInitPage(title, propList) ==
; -- start defining a hyperTeX page
;   htInitPageNoScroll(propList, title)
;   htSayStandard '"\beginscroll "
;   page()
 
(DEFUN |htInitPage| (|title| |propList|)
  (PROG ()
    (RETURN
     (PROGN
      (|htInitPageNoScroll| |propList| |title|)
      (|htSayStandard| "\\beginscroll ")
      (|page|)))))
 
; htInitPageNoScroll(propList, :options) ==
; --start defining a hyperTeX page
;   $atLeastOneUnexposed := nil     --reset every time a new page is initialized
;   $saturnContextMenuLines := nil
;   title := IFCAR options
;   $curPage :=
;     $standard => htpMakeEmptyPage(propList)
;     nil
;   if $saturn then $saturnPage := htpMakeEmptyPage(propList)
;   $newPage := true
;   $htLineList := nil
;   if title then
;     if $standard then htSayStandard ['"\begin{page}{", htpName $curPage, '"}{"]
;     htSaySaturn '"\browseTitle{"
;     htSay title
;     htSaySaturn '"}"
;     htSayStandard '"} "
;   page()
 
(DEFUN |htInitPageNoScroll| (|propList| &REST |options|)
  (PROG (|title|)
    (RETURN
     (PROGN
      (SETQ |$atLeastOneUnexposed| NIL)
      (SETQ |$saturnContextMenuLines| NIL)
      (SETQ |title| (IFCAR |options|))
      (SETQ |$curPage|
              (COND (|$standard| (|htpMakeEmptyPage| |propList|)) ('T NIL)))
      (COND (|$saturn| (SETQ |$saturnPage| (|htpMakeEmptyPage| |propList|))))
      (SETQ |$newPage| T)
      (SETQ |$htLineList| NIL)
      (COND
       (|title|
        (COND
         (|$standard|
          (|htSayStandard|
           (LIST "\\begin{page}{" (|htpName| |$curPage|) "}{"))))
        (|htSaySaturn| "\\browseTitle{") (|htSay| |title|) (|htSaySaturn| "}")
        (|htSayStandard| "} ")))
      (|page|)))))
 
; htInitPageNoHeading(propList) ==
; --start defining a hyperTeX page
;   $curPage :=
;     $standard => htpMakeEmptyPage(propList)
;   if $saturn then $saturnPage := htpMakeEmptyPage(propList)
;   $newPage := true
;   $htLineList := nil
;   page()
 
(DEFUN |htInitPageNoHeading| (|propList|)
  (PROG ()
    (RETURN
     (COND ((SETQ |$curPage| |$standard|) (|htpMakeEmptyPage| |propList|))
           ('T
            (PROGN
             (COND
              (|$saturn| (SETQ |$saturnPage| (|htpMakeEmptyPage| |propList|))))
             (SETQ |$newPage| T)
             (SETQ |$htLineList| NIL)
             (|page|)))))))
 
; htpMakeEmptyPage(propList,:options) ==
;   name := IFCAR options or  GENTEMP()
;   if not $saturn then
;     $activePageList := [name, :$activePageList]
;   SET(name, val := VECTOR(name, nil, nil, nil, nil, nil, propList, nil))
;   val
 
(DEFUN |htpMakeEmptyPage| (|propList| &REST |options|)
  (PROG (|name| |val|)
    (RETURN
     (PROGN
      (SETQ |name| (OR (IFCAR |options|) (GENTEMP)))
      (COND
       ((NULL |$saturn|)
        (SETQ |$activePageList| (CONS |name| |$activePageList|))))
      (SET |name|
           (SETQ |val| (VECTOR |name| NIL NIL NIL NIL NIL |propList| NIL)))
      |val|))))
 
; kPage(line,:options) == --any cat, dom, package, default package
; --constructors    Cname\#\E\sig \args   \abb \comments (C is C, D, P, X)
;   parts := dbXParts(line,7,1)
;   [kind,name,nargs,xflag,sig,args,abbrev,comments] := parts
;   form := IFCAR options
;   isFile := null kind
;   kind := kind or '"package"
;   RPLACA(parts,kind)
;   conform         := mkConform(kind,name,args)
;   $kPageSaturnArguments: local := rest conform
;   conname         := opOf conform
;   capitalKind     := capitalize kind
;   signature       := ncParseFromString sig
;   sourceFileName  := dbSourceFile INTERN name
;   constrings      :=
;     IFCDR form => dbConformGenUnder form
;     [STRCONC(name,args)]
;   emString        := ['"{\sf ",:constrings,'"}"]
;   heading := [capitalKind,'" ",:emString]
;   if not isExposedConstructor conname then heading := ['"Unexposed ",:heading]
;   if name=abbrev then abbrev := asyAbbreviation(conname,nargs)
;   page := htInitPageNoScroll nil
;   htAddHeading heading
;   htSayStandard("\beginscroll ")
;   htpSetProperty(page,'argSublis,mkConArgSublis rest conform)
;   htpSetProperty(page,'isFile,true)
;   htpSetProperty(page,'parts,parts)
;   htpSetProperty(page,'heading,heading)
;   htpSetProperty(page,'kind,kind)
;   if asharpConstructorName? conname then
;     htpSetProperty(page,'isAsharpConstructor,true)
;   htpSetProperty(page,'conform,conform)
;   htpSetProperty(page,'signature,signature)
;   ---what follows is stuff from kiPage with domain = nil
;   $conformsAreDomains := nil
;   dbShowConsDoc1(page,conform,nil)
;   if kind ~= 'category and nargs > 0 then addParameterTemplates(page,conform)
;   if $atLeastOneUnexposed then htSay '"\newline{}{\em *} = unexposed"
;   htSayStandard("\endscroll ")
;   kPageContextMenu page
;   htShowPageNoScroll()
 
(DEFUN |kPage| (|line| &REST |options|)
  (PROG (|$kPageSaturnArguments| |page| |heading| |emString| |constrings|
         |sourceFileName| |signature| |capitalKind| |conname| |conform|
         |isFile| |form| |comments| |abbrev| |args| |sig| |xflag| |nargs|
         |name| |kind| |parts|)
    (DECLARE (SPECIAL |$kPageSaturnArguments|))
    (RETURN
     (PROGN
      (SETQ |parts| (|dbXParts| |line| 7 1))
      (SETQ |kind| (CAR |parts|))
      (SETQ |name| (CADR . #1=(|parts|)))
      (SETQ |nargs| (CADDR . #1#))
      (SETQ |xflag| (CADDDR . #1#))
      (SETQ |sig| (CAR #2=(CDDDDR . #1#)))
      (SETQ |args| (CADR . #3=(#2#)))
      (SETQ |abbrev| (CADDR . #3#))
      (SETQ |comments| (CADDDR . #3#))
      (SETQ |form| (IFCAR |options|))
      (SETQ |isFile| (NULL |kind|))
      (SETQ |kind| (OR |kind| "package"))
      (RPLACA |parts| |kind|)
      (SETQ |conform| (|mkConform| |kind| |name| |args|))
      (SETQ |$kPageSaturnArguments| (CDR |conform|))
      (SETQ |conname| (|opOf| |conform|))
      (SETQ |capitalKind| (|capitalize| |kind|))
      (SETQ |signature| (|ncParseFromString| |sig|))
      (SETQ |sourceFileName| (|dbSourceFile| (INTERN |name|)))
      (SETQ |constrings|
              (COND ((IFCDR |form|) (|dbConformGenUnder| |form|))
                    ('T (LIST (STRCONC |name| |args|)))))
      (SETQ |emString| (CONS "{\\sf " (APPEND |constrings| (CONS "}" NIL))))
      (SETQ |heading| (CONS |capitalKind| (CONS " " |emString|)))
      (COND
       ((NULL (|isExposedConstructor| |conname|))
        (SETQ |heading| (CONS "Unexposed " |heading|))))
      (COND
       ((EQUAL |name| |abbrev|)
        (SETQ |abbrev| (|asyAbbreviation| |conname| |nargs|))))
      (SETQ |page| (|htInitPageNoScroll| NIL))
      (|htAddHeading| |heading|)
      (|htSayStandard| '|\\beginscroll |)
      (|htpSetProperty| |page| '|argSublis| (|mkConArgSublis| (CDR |conform|)))
      (|htpSetProperty| |page| '|isFile| T)
      (|htpSetProperty| |page| '|parts| |parts|)
      (|htpSetProperty| |page| '|heading| |heading|)
      (|htpSetProperty| |page| '|kind| |kind|)
      (COND
       ((|asharpConstructorName?| |conname|)
        (|htpSetProperty| |page| '|isAsharpConstructor| T)))
      (|htpSetProperty| |page| '|conform| |conform|)
      (|htpSetProperty| |page| '|signature| |signature|)
      (SETQ |$conformsAreDomains| NIL)
      (|dbShowConsDoc1| |page| |conform| NIL)
      (COND
       ((AND (NOT (EQ |kind| '|category|)) (< 0 |nargs|))
        (|addParameterTemplates| |page| |conform|)))
      (COND
       (|$atLeastOneUnexposed| (|htSay| "\\newline{}{\\em *} = unexposed")))
      (|htSayStandard| '|\\endscroll |)
      (|kPageContextMenu| |page|)
      (|htShowPageNoScroll|)))))
 
; kPageContextMenu page ==
;   $saturn => kPageContextMenuSaturn page
;   [kind,name,nargs,xpart,sig,args,abbrev,comments] := htpProperty(page,'parts)
;   conform := htpProperty(page,'conform)
;   conname := opOf conform
;   htBeginTable()
;   htSay '"{"
;   htMakePage [['bcLinks,['Ancestors,'"",'kcaPage,nil]]]
;   if kind = '"category" then
;     htSay '"}{"
;     htMakePage [['bcLinks,['Children,'"",'kccPage,nil]]]
;   if not asharpConstructorName? conname then
;     htSay '"}{"
;     htMakePage [['bcLinks,['Dependents,'"",'kcdePage,nil]]]
;   if kind = '"category" then
;     htSay '"}{"
;     htMakePage [['bcLinks,['Descendents,'"",'kcdPage,nil]]]
;   if kind = '"category" then
;     htSay '"}{"
;     if not asharpConstructorName? conname then
;       htMakePage [['bcLinks,['Domains,'"",'kcdoPage,nil]]]
;     else htSay '"{\em Domains}"
;   htSay '"}{"
;   if kind ~= '"category" and (pathname := dbHasExamplePage conname)
;     then htMakePage [['bcLinks,['Examples,'"",'kxPage,pathname]]]
;     else htSay '"{\em Examples}"
;   htSay '"}{"
;   htMakePage [['bcLinks,['Exports,'"",'kePage,nil]]]
;   htSay '"}{"
;   htMakePage [['bcLinks,['Operations,'"",'koPage,'"operation"]]]
;   htSay '"}{"
;   htMakePage [['bcLinks,['Parents,'"",'kcpPage,'"operation"]]]
;   if kind ~= '"category" then
;     htSay '"}{"
;     if not asharpConstructorName? conname
;     then  htMakePage [['bcLinks,["Search Path",'"",'ksPage,nil]]]
;     else htSay '"{\em Search Path}"
;   if kind ~= '"category" then
;     htSay '"}{"
;     htMakePage [['bcLinks,['Users,'"",'kcuPage,nil]]]
;     htSay '"}{"
;     htMakePage [['bcLinks,['Uses,'"",'kcnPage,nil]]]
;   htSay '"}"
;   if $standard then htEndTable()
 
(DEFUN |kPageContextMenu| (|page|)
  (PROG (|LETTMP#1| |kind| |name| |nargs| |xpart| |sig| |args| |abbrev|
         |comments| |conform| |conname| |pathname|)
    (RETURN
     (COND (|$saturn| (|kPageContextMenuSaturn| |page|))
           (#1='T
            (PROGN
             (SETQ |LETTMP#1| (|htpProperty| |page| '|parts|))
             (SETQ |kind| (CAR |LETTMP#1|))
             (SETQ |name| (CADR . #2=(|LETTMP#1|)))
             (SETQ |nargs| (CADDR . #2#))
             (SETQ |xpart| (CADDDR . #2#))
             (SETQ |sig| (CAR #3=(CDDDDR . #2#)))
             (SETQ |args| (CADR . #4=(#3#)))
             (SETQ |abbrev| (CADDR . #4#))
             (SETQ |comments| (CADDDR . #4#))
             (SETQ |conform| (|htpProperty| |page| '|conform|))
             (SETQ |conname| (|opOf| |conform|))
             (|htBeginTable|)
             (|htSay| "{")
             (|htMakePage|
              (LIST (LIST '|bcLinks| (LIST '|Ancestors| "" '|kcaPage| NIL))))
             (COND
              ((EQUAL |kind| "category") (|htSay| "}{")
               (|htMakePage|
                (LIST
                 (LIST '|bcLinks| (LIST '|Children| "" '|kccPage| NIL))))))
             (COND
              ((NULL (|asharpConstructorName?| |conname|)) (|htSay| "}{")
               (|htMakePage|
                (LIST
                 (LIST '|bcLinks| (LIST '|Dependents| "" '|kcdePage| NIL))))))
             (COND
              ((EQUAL |kind| "category") (|htSay| "}{")
               (|htMakePage|
                (LIST
                 (LIST '|bcLinks| (LIST '|Descendents| "" '|kcdPage| NIL))))))
             (COND
              ((EQUAL |kind| "category") (|htSay| "}{")
               (COND
                ((NULL (|asharpConstructorName?| |conname|))
                 (|htMakePage|
                  (LIST
                   (LIST '|bcLinks| (LIST '|Domains| "" '|kcdoPage| NIL)))))
                (#1# (|htSay| "{\\em Domains}")))))
             (|htSay| "}{")
             (COND
              ((AND (NOT (EQUAL |kind| "category"))
                    (SETQ |pathname| (|dbHasExamplePage| |conname|)))
               (|htMakePage|
                (LIST
                 (LIST '|bcLinks|
                       (LIST '|Examples| "" '|kxPage| |pathname|)))))
              (#1# (|htSay| "{\\em Examples}")))
             (|htSay| "}{")
             (|htMakePage|
              (LIST (LIST '|bcLinks| (LIST '|Exports| "" '|kePage| NIL))))
             (|htSay| "}{")
             (|htMakePage|
              (LIST
               (LIST '|bcLinks|
                     (LIST '|Operations| "" '|koPage| "operation"))))
             (|htSay| "}{")
             (|htMakePage|
              (LIST
               (LIST '|bcLinks| (LIST '|Parents| "" '|kcpPage| "operation"))))
             (COND
              ((NOT (EQUAL |kind| "category")) (|htSay| "}{")
               (COND
                ((NULL (|asharpConstructorName?| |conname|))
                 (|htMakePage|
                  (LIST
                   (LIST '|bcLinks| (LIST '|Search Path| "" '|ksPage| NIL)))))
                (#1# (|htSay| "{\\em Search Path}")))))
             (COND
              ((NOT (EQUAL |kind| "category")) (|htSay| "}{")
               (|htMakePage|
                (LIST (LIST '|bcLinks| (LIST '|Users| "" '|kcuPage| NIL))))
               (|htSay| "}{")
               (|htMakePage|
                (LIST (LIST '|bcLinks| (LIST '|Uses| "" '|kcnPage| NIL))))))
             (|htSay| "}")
             (COND (|$standard| (|htEndTable|)))))))))
 
; kPageContextMenuSaturn page ==
;   $newPage    : local := nil
;   [kind,name,nargs,xpart,sig,args,abbrev,comments] := htpProperty(page,'parts)
;   $htLineList : local := nil
;   conform := htpProperty(page,'conform)
;   conname := opOf conform
;   htMakePage [['bcLinks,['"\&Ancestors",'"",'kcaPage,nil]]]
;   if kind = '"category" then
;     htMakePage [['bcLinks,['"\&Children",'"",'kccPage,nil]]]
;   if not asharpConstructorName? conname then
;     htMakePage [['bcLinks,['"\&Dependents",'"",'kcdePage,nil]]]
;   if kind = '"category" then
;     htMakePage [['bcLinks,['"Desce\&ndents",'"",'kcdPage,nil]]]
;   if kind = '"category" then
;     if not asharpConstructorName? conname then
;       htMakePage [['bcLinks,['"Do\&mains",'"",'kcdoPage,nil]]]
;       else htSayCold '"Do\&mains"
;   if kind ~= '"category" and (name := saturnHasExamplePage conname)
;     then saturnExampleLink name
;     else htSayCold '"E\&xamples"
;   htMakePage [['bcLinks,['"\&Exports",'"",'kePage,nil]]]
;   htMakePage [['bcLinks,['"\&Operations",'"",'koPage,'"operation"]]]
;   htMakePage [['bcLinks,['"\&Parents",'"",'kcpPage,'"operation"]]]
;   if not asharpConstructorName? conname
;     then  htMakePage [['bcLinks,['"Search O\&rder",'"",'ksPage,nil]]]
;     else htSayCold '"Search Order"
;   if kind ~= '"category" or dbpHasDefaultCategory? xpart
;     then
;        htMakePage [['bcLinks,['"\&Users",'"",'kcuPage,nil]]]
;        htMakePage [['bcLinks,['"U\&ses",'"",'kcnPage,nil]]]
;     else
;        htSayCold '"\&Users"
;        htSayCold '"U\&ses"
;   $saturnContextMenuLines := $htLineList
 
(DEFUN |kPageContextMenuSaturn| (|page|)
  (PROG (|$htLineList| |$newPage| |conname| |conform| |comments| |abbrev|
         |args| |sig| |xpart| |nargs| |name| |kind| |LETTMP#1|)
    (DECLARE (SPECIAL |$htLineList| |$newPage|))
    (RETURN
     (PROGN
      (SETQ |$newPage| NIL)
      (SETQ |LETTMP#1| (|htpProperty| |page| '|parts|))
      (SETQ |kind| (CAR |LETTMP#1|))
      (SETQ |name| (CADR . #1=(|LETTMP#1|)))
      (SETQ |nargs| (CADDR . #1#))
      (SETQ |xpart| (CADDDR . #1#))
      (SETQ |sig| (CAR #2=(CDDDDR . #1#)))
      (SETQ |args| (CADR . #3=(#2#)))
      (SETQ |abbrev| (CADDR . #3#))
      (SETQ |comments| (CADDDR . #3#))
      (SETQ |$htLineList| NIL)
      (SETQ |conform| (|htpProperty| |page| '|conform|))
      (SETQ |conname| (|opOf| |conform|))
      (|htMakePage|
       (LIST (LIST '|bcLinks| (LIST "\\&Ancestors" "" '|kcaPage| NIL))))
      (COND
       ((EQUAL |kind| "category")
        (|htMakePage|
         (LIST (LIST '|bcLinks| (LIST "\\&Children" "" '|kccPage| NIL))))))
      (COND
       ((NULL (|asharpConstructorName?| |conname|))
        (|htMakePage|
         (LIST (LIST '|bcLinks| (LIST "\\&Dependents" "" '|kcdePage| NIL))))))
      (COND
       ((EQUAL |kind| "category")
        (|htMakePage|
         (LIST (LIST '|bcLinks| (LIST "Desce\\&ndents" "" '|kcdPage| NIL))))))
      (COND
       ((EQUAL |kind| "category")
        (COND
         ((NULL (|asharpConstructorName?| |conname|))
          (|htMakePage|
           (LIST (LIST '|bcLinks| (LIST "Do\\&mains" "" '|kcdoPage| NIL)))))
         (#4='T (|htSayCold| "Do\\&mains")))))
      (COND
       ((AND (NOT (EQUAL |kind| "category"))
             (SETQ |name| (|saturnHasExamplePage| |conname|)))
        (|saturnExampleLink| |name|))
       (#4# (|htSayCold| "E\\&xamples")))
      (|htMakePage|
       (LIST (LIST '|bcLinks| (LIST "\\&Exports" "" '|kePage| NIL))))
      (|htMakePage|
       (LIST
        (LIST '|bcLinks| (LIST "\\&Operations" "" '|koPage| "operation"))))
      (|htMakePage|
       (LIST (LIST '|bcLinks| (LIST "\\&Parents" "" '|kcpPage| "operation"))))
      (COND
       ((NULL (|asharpConstructorName?| |conname|))
        (|htMakePage|
         (LIST (LIST '|bcLinks| (LIST "Search O\\&rder" "" '|ksPage| NIL)))))
       (#4# (|htSayCold| "Search Order")))
      (COND
       ((OR (NOT (EQUAL |kind| "category")) (|dbpHasDefaultCategory?| |xpart|))
        (|htMakePage|
         (LIST (LIST '|bcLinks| (LIST "\\&Users" "" '|kcuPage| NIL))))
        (|htMakePage|
         (LIST (LIST '|bcLinks| (LIST "U\\&ses" "" '|kcnPage| NIL)))))
       (#4# (|htSayCold| "\\&Users") (|htSayCold| "U\\&ses")))
      (SETQ |$saturnContextMenuLines| |$htLineList|)))))
 
; saturnExampleLink lname ==
;   htSay '"\docLink{\csname "
;   htSay STRCONC(first(rest(lname)), '"\endcsname}{E&xamples}")
 
(DEFUN |saturnExampleLink| (|lname|)
  (PROG ()
    (RETURN
     (PROGN
      (|htSay| "\\docLink{\\csname ")
      (|htSay| (STRCONC (CAR (CDR |lname|)) "\\endcsname}{E&xamples}"))))))
 
; $exampleConstructors := nil
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$exampleConstructors| NIL))
 
; saturnHasExamplePage conname ==
;   if not $exampleConstructors then
;      $exampleConstructors := getSaturnExampleList()
;   ASSQ(conname, $exampleConstructors)
 
(DEFUN |saturnHasExamplePage| (|conname|)
  (PROG ()
    (RETURN
     (PROGN
      (COND
       ((NULL |$exampleConstructors|)
        (SETQ |$exampleConstructors| (|getSaturnExampleList|))))
      (ASSQ |conname| |$exampleConstructors|)))))
 
; getSaturnExampleList() ==
;   file := STRCONC( getEnv('"AXIOM"), "/doc/axug/examples.lsp")
;   not PROBE_-FILE file => nil
;   fp := MAKE_-INSTREAM file
;   lst := VMREAD fp
;   SHUT fp
;   lst
 
(DEFUN |getSaturnExampleList| ()
  (PROG (|lst| |fp| |file|)
    (RETURN
     (PROGN
      (SETQ |file| (STRCONC (|getEnv| "AXIOM") '|/doc/axug/examples.lsp|))
      (COND ((NULL (PROBE-FILE |file|)) NIL)
            ('T
             (PROGN
              (SETQ |fp| (MAKE-INSTREAM |file|))
              (SETQ |lst| (VMREAD |fp|))
              (SHUT |fp|)
              |lst|)))))))
 
; dbPresentCons(htPage,kind,:exclusions) ==
;   $saturn => dbPresentConsSaturn(htPage,kind,exclusions)
;   htpSetProperty(htPage,'exclusion,first exclusions)
;   cAlist := htpProperty(htPage,'cAlist)
;   empty? := null cAlist
;   one?   := null rest cAlist
;   one? := empty? or one?
;   exposedUnexposedFlag := $includeUnexposed? --used to be star?       4/92
;   star?  := true     --always include information on exposed/unexposed   4/92
;   if $standard then htBeginTable()
;   htSay '"{"
;   if one? or member('abbrs,exclusions)
;     then htSay '"{\em Abbreviations}"
;     else htMakePage [['bcLispLinks,['"Abbreviations",'"",'dbShowCons,'abbrs]]]
;   htSay '"}{"
;   if one? or member('conditions, exclusions) or
;         and/[rest x = true for x in cAlist]
;     then htSay '"{\em Conditions}"
;     else htMakePage [['bcLispLinks,['"Conditions",'"",'dbShowCons,'conditions]]]
;   htSay '"}{"
;   if empty? or member('documentation,exclusions)
;     then htSay '"{\em Descriptions}"
;     else htMakePage [['bcLispLinks,['"Descriptions",'"",'dbShowCons,'documentation]]]
;   htSay '"}{"
;   if one? or null rest cAlist
;     then htSay '"{\em Filter}"
;     else htMakePage
;       [['bcLinks,['"Filter",'"",'htFilterPage,['dbShowCons,'filter]]]]
;   htSay '"}{"
;   if one? or member('kinds,exclusions) or kind ~= 'constructor
;     then htSay '"{\em Kinds}"
;     else htMakePage [['bcLispLinks,['"Kinds",'"",'dbShowCons,'kinds]]]
;   htSay '"}{"
;   if one? or member('names,exclusions)
;     then htSay '"{\em Names}"
;     else htMakePage [['bcLispLinks,['"Names",'"",'dbShowCons,'names]]]
;   htSay '"}{"
;   if one? or member('parameters, exclusions) or not(or/[CDAR x for x in cAlist])
;     then htSay '"{\em Parameters}"
;     else htMakePage [['bcLispLinks,['"Parameters",'"",'dbShowCons,'parameters]]]
;   htSay '"}{"
;   if $exposedOnlyIfTrue
;     then
;       if one?
;       then htSay '"{\em Unexposed Also}"
;       else htMakePage [['bcLinks,['"Unexposed Also",'"",'dbShowCons,'exposureOff]]]
;     else
;       if one?
;       then htSay '"{\em Exposed Only}"
;       else htMakePage [['bcLinks,['"Exposed Only",'"",'dbShowCons,'exposureOn]]]
;   htSay '"}"
;   if $standard then htEndTable()
 
(DEFUN |dbPresentCons| (|htPage| |kind| &REST |exclusions|)
  (PROG (|cAlist| |empty?| |one?| |exposedUnexposedFlag| |star?|)
    (RETURN
     (COND (|$saturn| (|dbPresentConsSaturn| |htPage| |kind| |exclusions|))
           (#1='T
            (PROGN
             (|htpSetProperty| |htPage| '|exclusion| (CAR |exclusions|))
             (SETQ |cAlist| (|htpProperty| |htPage| '|cAlist|))
             (SETQ |empty?| (NULL |cAlist|))
             (SETQ |one?| (NULL (CDR |cAlist|)))
             (SETQ |one?| (OR |empty?| |one?|))
             (SETQ |exposedUnexposedFlag| |$includeUnexposed?|)
             (SETQ |star?| T)
             (COND (|$standard| (|htBeginTable|)))
             (|htSay| "{")
             (COND
              ((OR |one?| (|member| '|abbrs| |exclusions|))
               (|htSay| "{\\em Abbreviations}"))
              (#1#
               (|htMakePage|
                (LIST
                 (LIST '|bcLispLinks|
                       (LIST "Abbreviations" "" '|dbShowCons| '|abbrs|))))))
             (|htSay| "}{")
             (COND
              ((OR |one?| (|member| '|conditions| |exclusions|)
                   ((LAMBDA (|bfVar#16| |bfVar#15| |x|)
                      (LOOP
                       (COND
                        ((OR (ATOM |bfVar#15|)
                             (PROGN (SETQ |x| (CAR |bfVar#15|)) NIL))
                         (RETURN |bfVar#16|))
                        (#1#
                         (PROGN
                          (SETQ |bfVar#16| (EQUAL (CDR |x|) T))
                          (COND ((NOT |bfVar#16|) (RETURN NIL))))))
                       (SETQ |bfVar#15| (CDR |bfVar#15|))))
                    T |cAlist| NIL))
               (|htSay| "{\\em Conditions}"))
              (#1#
               (|htMakePage|
                (LIST
                 (LIST '|bcLispLinks|
                       (LIST "Conditions" "" '|dbShowCons| '|conditions|))))))
             (|htSay| "}{")
             (COND
              ((OR |empty?| (|member| '|documentation| |exclusions|))
               (|htSay| "{\\em Descriptions}"))
              (#1#
               (|htMakePage|
                (LIST
                 (LIST '|bcLispLinks|
                       (LIST "Descriptions" "" '|dbShowCons|
                             '|documentation|))))))
             (|htSay| "}{")
             (COND
              ((OR |one?| (NULL (CDR |cAlist|))) (|htSay| "{\\em Filter}"))
              (#1#
               (|htMakePage|
                (LIST
                 (LIST '|bcLinks|
                       (LIST "Filter" "" '|htFilterPage|
                             (LIST '|dbShowCons| '|filter|)))))))
             (|htSay| "}{")
             (COND
              ((OR |one?| (|member| '|kinds| |exclusions|)
                   (NOT (EQ |kind| '|constructor|)))
               (|htSay| "{\\em Kinds}"))
              (#1#
               (|htMakePage|
                (LIST
                 (LIST '|bcLispLinks|
                       (LIST "Kinds" "" '|dbShowCons| '|kinds|))))))
             (|htSay| "}{")
             (COND
              ((OR |one?| (|member| '|names| |exclusions|))
               (|htSay| "{\\em Names}"))
              (#1#
               (|htMakePage|
                (LIST
                 (LIST '|bcLispLinks|
                       (LIST "Names" "" '|dbShowCons| '|names|))))))
             (|htSay| "}{")
             (COND
              ((OR |one?| (|member| '|parameters| |exclusions|)
                   (NULL
                    ((LAMBDA (|bfVar#18| |bfVar#17| |x|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#17|)
                              (PROGN (SETQ |x| (CAR |bfVar#17|)) NIL))
                          (RETURN |bfVar#18|))
                         (#1#
                          (PROGN
                           (SETQ |bfVar#18| (CDAR |x|))
                           (COND (|bfVar#18| (RETURN |bfVar#18|))))))
                        (SETQ |bfVar#17| (CDR |bfVar#17|))))
                     NIL |cAlist| NIL)))
               (|htSay| "{\\em Parameters}"))
              (#1#
               (|htMakePage|
                (LIST
                 (LIST '|bcLispLinks|
                       (LIST "Parameters" "" '|dbShowCons| '|parameters|))))))
             (|htSay| "}{")
             (COND
              (|$exposedOnlyIfTrue|
               (COND (|one?| (|htSay| "{\\em Unexposed Also}"))
                     (#1#
                      (|htMakePage|
                       (LIST
                        (LIST '|bcLinks|
                              (LIST "Unexposed Also" "" '|dbShowCons|
                                    '|exposureOff|)))))))
              (|one?| (|htSay| "{\\em Exposed Only}"))
              (#1#
               (|htMakePage|
                (LIST
                 (LIST '|bcLinks|
                       (LIST "Exposed Only" "" '|dbShowCons|
                             '|exposureOn|))))))
             (|htSay| "}")
             (COND (|$standard| (|htEndTable|)))))))))
 
; dbPresentConsSaturn(htPage,kind,exclusions) ==
;   $htLineList : local := nil
;   $newPage    : local := nil
;   htpSetProperty(htPage,'exclusion,first exclusions)
;   cAlist := htpProperty(htPage,'cAlist)
;   empty? := null cAlist
;   one?   := null IFCDR cAlist
;   one? := empty? or one?
;   exposedUnexposedFlag := $includeUnexposed? --used to be star?       4/92
;   star?  := true     --always include information on exposed/unexposed   4/92
;   if $standard then htBeginTable()
;   if one? or member('abbrs,exclusions)
;     then htSayCold '"\&Abbreviations"
;     else htMakePage [['bcLispLinks,['"\&Abbreviations",'"",'dbShowCons,'abbrs]]]
;   if one? or member('conditions, exclusions) or
;       and/[rest x = true for x in cAlist]
;     then htSayCold '"\&Conditions"
;     else htMakePage [['bcLispLinks,['"\&Conditions",'"",'dbShowCons,'conditions]]]
;   if empty? or member('documentation,exclusions)
;     then htSayCold '"\&Descriptions"
;     else htMakePage [['bcLispLinks,['"\&Descriptions",'"",'dbShowCons,'documentation]]]
;   if one? or null rest cAlist
;     then htSayCold '"\&Filter"
;     else htMakeSaturnFilterPage ['dbShowCons, 'filter]
;   if one? or member('kinds,exclusions) or kind ~= 'constructor
;     then htSayCold '"\&Kinds"
;     else htMakePage [['bcLispLinks,['"\&Kinds",'"",'dbShowCons,'kinds]]]
;   if one? or member('names,exclusions)
;     then htSayCold '"\&Names"
;     else htMakePage [['bcLispLinks,['"\&Names",'"",'dbShowCons,'names]]]
;   if one? or member('parameters, exclusions) or not(or/[CDAR x for x in cAlist])
;     then htSayCold '"\&Parameters"
;     else htMakePage [['bcLispLinks,['"\&Parameters",'"",'dbShowCons,'parameters]]]
;   htSaySaturn '"\hrule"
;   if $exposedOnlyIfTrue
;     then
;       if one? then htSayCold '"\&Unexposed Also"
;       else htMakePage [['bcLinks,['"\&Unexposed Also",'"",'dbShowCons,'exposureOff]]]
;     else
;       if one? then htSayCold '"\Exposed Only\&y"
;       else htMakePage [['bcLinks,['"Exposed Onl\&y",'"",'dbShowCons,'exposureOn]]]
;   if $standard then htEndTable()
;   $saturnContextMenuLines := $htLineList
 
(DEFUN |dbPresentConsSaturn| (|htPage| |kind| |exclusions|)
  (PROG (|$newPage| |$htLineList| |star?| |exposedUnexposedFlag| |one?|
         |empty?| |cAlist|)
    (DECLARE (SPECIAL |$newPage| |$htLineList|))
    (RETURN
     (PROGN
      (SETQ |$htLineList| NIL)
      (SETQ |$newPage| NIL)
      (|htpSetProperty| |htPage| '|exclusion| (CAR |exclusions|))
      (SETQ |cAlist| (|htpProperty| |htPage| '|cAlist|))
      (SETQ |empty?| (NULL |cAlist|))
      (SETQ |one?| (NULL (IFCDR |cAlist|)))
      (SETQ |one?| (OR |empty?| |one?|))
      (SETQ |exposedUnexposedFlag| |$includeUnexposed?|)
      (SETQ |star?| T)
      (COND (|$standard| (|htBeginTable|)))
      (COND
       ((OR |one?| (|member| '|abbrs| |exclusions|))
        (|htSayCold| "\\&Abbreviations"))
       (#1='T
        (|htMakePage|
         (LIST
          (LIST '|bcLispLinks|
                (LIST "\\&Abbreviations" "" '|dbShowCons| '|abbrs|))))))
      (COND
       ((OR |one?| (|member| '|conditions| |exclusions|)
            ((LAMBDA (|bfVar#20| |bfVar#19| |x|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#19|)
                      (PROGN (SETQ |x| (CAR |bfVar#19|)) NIL))
                  (RETURN |bfVar#20|))
                 (#1#
                  (PROGN
                   (SETQ |bfVar#20| (EQUAL (CDR |x|) T))
                   (COND ((NOT |bfVar#20|) (RETURN NIL))))))
                (SETQ |bfVar#19| (CDR |bfVar#19|))))
             T |cAlist| NIL))
        (|htSayCold| "\\&Conditions"))
       (#1#
        (|htMakePage|
         (LIST
          (LIST '|bcLispLinks|
                (LIST "\\&Conditions" "" '|dbShowCons| '|conditions|))))))
      (COND
       ((OR |empty?| (|member| '|documentation| |exclusions|))
        (|htSayCold| "\\&Descriptions"))
       (#1#
        (|htMakePage|
         (LIST
          (LIST '|bcLispLinks|
                (LIST "\\&Descriptions" "" '|dbShowCons| '|documentation|))))))
      (COND ((OR |one?| (NULL (CDR |cAlist|))) (|htSayCold| "\\&Filter"))
            (#1# (|htMakeSaturnFilterPage| (LIST '|dbShowCons| '|filter|))))
      (COND
       ((OR |one?| (|member| '|kinds| |exclusions|)
            (NOT (EQ |kind| '|constructor|)))
        (|htSayCold| "\\&Kinds"))
       (#1#
        (|htMakePage|
         (LIST
          (LIST '|bcLispLinks| (LIST "\\&Kinds" "" '|dbShowCons| '|kinds|))))))
      (COND
       ((OR |one?| (|member| '|names| |exclusions|)) (|htSayCold| "\\&Names"))
       (#1#
        (|htMakePage|
         (LIST
          (LIST '|bcLispLinks| (LIST "\\&Names" "" '|dbShowCons| '|names|))))))
      (COND
       ((OR |one?| (|member| '|parameters| |exclusions|)
            (NULL
             ((LAMBDA (|bfVar#22| |bfVar#21| |x|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#21|)
                       (PROGN (SETQ |x| (CAR |bfVar#21|)) NIL))
                   (RETURN |bfVar#22|))
                  (#1#
                   (PROGN
                    (SETQ |bfVar#22| (CDAR |x|))
                    (COND (|bfVar#22| (RETURN |bfVar#22|))))))
                 (SETQ |bfVar#21| (CDR |bfVar#21|))))
              NIL |cAlist| NIL)))
        (|htSayCold| "\\&Parameters"))
       (#1#
        (|htMakePage|
         (LIST
          (LIST '|bcLispLinks|
                (LIST "\\&Parameters" "" '|dbShowCons| '|parameters|))))))
      (|htSaySaturn| "\\hrule")
      (COND
       (|$exposedOnlyIfTrue|
        (COND (|one?| (|htSayCold| "\\&Unexposed Also"))
              (#1#
               (|htMakePage|
                (LIST
                 (LIST '|bcLinks|
                       (LIST "\\&Unexposed Also" "" '|dbShowCons|
                             '|exposureOff|)))))))
       (|one?| (|htSayCold| "\\Exposed Only\\&y"))
       (#1#
        (|htMakePage|
         (LIST
          (LIST '|bcLinks|
                (LIST "Exposed Onl\\&y" "" '|dbShowCons| '|exposureOn|))))))
      (COND (|$standard| (|htEndTable|)))
      (SETQ |$saturnContextMenuLines| |$htLineList|)))))
 
; htFilterPage(htPage,args) ==
;   htInitPage("Filter String",htCopyProplist htPage)
;   htSay "\centerline{Enter filter string (use {\em *} for wild card):}"
;   htSay '"\centerline{"
;   htMakePage [['bcStrings, [50,'"",'filter,'EM]]]
;   htSay '"}\vspace{1}\centerline{"
;   htMakePage [['bcLispLinks,['"\fbox{Filter}",'"",:args]]]
;   htSay '"}"
;   htShowPage()
 
(DEFUN |htFilterPage| (|htPage| |args|)
  (PROG ()
    (RETURN
     (PROGN
      (|htInitPage| '|Filter String| (|htCopyProplist| |htPage|))
      (|htSay|
       '|\\centerline{Enter filter string (use {\\em *} for wild card):}|)
      (|htSay| "\\centerline{")
      (|htMakePage| (LIST (LIST '|bcStrings| (LIST 50 "" '|filter| 'EM))))
      (|htSay| "}\\vspace{1}\\centerline{")
      (|htMakePage|
       (LIST (LIST '|bcLispLinks| (CONS "\\fbox{Filter}" (CONS "" |args|)))))
      (|htSay| "}")
      (|htShowPage|)))))
 
; htMakeSaturnFilterPage [fn2Call,:args] ==
;   htSay '"\inputboxLink[\lispLink[d]{\verb+(|"
;   htSay fn2Call
;   htSay '"| "
;   htSay htpName $saturnPage
;   for x in args repeat
;     htSay '" '|"
;     htSay x
;     htSay '"|"
;   htSay '" _"+_\FILTERSTRING\verb+_")+}{}]{\FILTERSTRING}{*}"
;   htSay '"{\centerline{Enter filter string (use {\em *} for wild card):}}"
;   htSay '"{Filter Page}{\&Filter}"
 
(DEFUN |htMakeSaturnFilterPage| (|bfVar#24|)
  (PROG (|fn2Call| |args|)
    (RETURN
     (PROGN
      (SETQ |fn2Call| (CAR |bfVar#24|))
      (SETQ |args| (CDR |bfVar#24|))
      (|htSay| "\\inputboxLink[\\lispLink[d]{\\verb+(|")
      (|htSay| |fn2Call|)
      (|htSay| "| ")
      (|htSay| (|htpName| |$saturnPage|))
      ((LAMBDA (|bfVar#23| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#23|) (PROGN (SETQ |x| (CAR |bfVar#23|)) NIL))
            (RETURN NIL))
           ('T (PROGN (|htSay| " '|") (|htSay| |x|) (|htSay| "|"))))
          (SETQ |bfVar#23| (CDR |bfVar#23|))))
       |args| NIL)
      (|htSay| " \"+\\FILTERSTRING\\verb+\")+}{}]{\\FILTERSTRING}{*}")
      (|htSay|
       "{\\centerline{Enter filter string (use {\\em *} for wild card):}}")
      (|htSay| "{Filter Page}{\\&Filter}")))))
 
; dbShowConsKinds cAlist ==
;   cats := doms := paks := defs := nil
;   for x in cAlist repeat
;     op := CAAR x
;     kind := dbConstructorKind op
;     kind  = 'category => cats := [x,:cats]
;     kind = 'domain    => doms := [x,:doms]
;     kind = 'package   => paks := [x,:paks]
;     defs := [x,:defs]
;   lists := [NREVERSE cats,NREVERSE doms,NREVERSE paks,NREVERSE defs]
;   htBeginMenu 'description
;   htSayStandard '"\indent{1}"
;   kinds := +/[1 for x in lists | #x > 0]
;   firstTime := true
;   for kind in '("category" "domain" "package" "default package") for x in lists | #x > 0 repeat
;     if firstTime then firstTime := false
;                  else htSaySaturn '"\\"
;     htSaySaturn '"\item["
;     htSayStandard '"\item"
;     if kinds = 1
;        then htSay menuButton()
;        else htMakePage
;          [['bcLinks,[menuButton(),'"",'dbShowConsKindsFilter,[kind,x]]]]
;     htSaySaturn '"]"
;     htSayStandard '"\tab{1}"
;     htSay('"{\em ",c := #x,'" ")
;     htSay(c > 1 => pluralize kind; kind)
;     htSay '":}"
;     htSaySaturn '"\\"
;     bcConTable REMDUP [CAAR y for y in x]
;   htEndMenu 'description
;   htSayStandard '"\indent{0}"
 
(DEFUN |dbShowConsKinds| (|cAlist|)
  (PROG (|defs| |paks| |doms| |cats| |op| |kind| |lists| |kinds| |firstTime|
         |c|)
    (RETURN
     (PROGN
      (SETQ |cats| (SETQ |doms| (SETQ |paks| (SETQ |defs| NIL))))
      ((LAMBDA (|bfVar#25| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#25|) (PROGN (SETQ |x| (CAR |bfVar#25|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (SETQ |op| (CAAR |x|))
             (SETQ |kind| (|dbConstructorKind| |op|))
             (COND ((EQ |kind| '|category|) (SETQ |cats| (CONS |x| |cats|)))
                   ((EQ |kind| '|domain|) (SETQ |doms| (CONS |x| |doms|)))
                   ((EQ |kind| '|package|) (SETQ |paks| (CONS |x| |paks|)))
                   (#1# (SETQ |defs| (CONS |x| |defs|)))))))
          (SETQ |bfVar#25| (CDR |bfVar#25|))))
       |cAlist| NIL)
      (SETQ |lists|
              (LIST (NREVERSE |cats|) (NREVERSE |doms|) (NREVERSE |paks|)
                    (NREVERSE |defs|)))
      (|htBeginMenu| '|description|)
      (|htSayStandard| "\\indent{1}")
      (SETQ |kinds|
              ((LAMBDA (|bfVar#27| |bfVar#26| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#26|)
                        (PROGN (SETQ |x| (CAR |bfVar#26|)) NIL))
                    (RETURN |bfVar#27|))
                   (#1#
                    (AND (< 0 (LENGTH |x|))
                         (SETQ |bfVar#27| (+ |bfVar#27| 1)))))
                  (SETQ |bfVar#26| (CDR |bfVar#26|))))
               0 |lists| NIL))
      (SETQ |firstTime| T)
      ((LAMBDA (|bfVar#28| |kind| |bfVar#29| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#28|) (PROGN (SETQ |kind| (CAR |bfVar#28|)) NIL)
                (ATOM |bfVar#29|) (PROGN (SETQ |x| (CAR |bfVar#29|)) NIL))
            (RETURN NIL))
           (#1#
            (AND (< 0 (LENGTH |x|))
                 (PROGN
                  (COND (|firstTime| (SETQ |firstTime| NIL))
                        (#1# (|htSaySaturn| "\\\\")))
                  (|htSaySaturn| "\\item[")
                  (|htSayStandard| "\\item")
                  (COND ((EQL |kinds| 1) (|htSay| (|menuButton|)))
                        (#1#
                         (|htMakePage|
                          (LIST
                           (LIST '|bcLinks|
                                 (LIST (|menuButton|) ""
                                       '|dbShowConsKindsFilter|
                                       (LIST |kind| |x|)))))))
                  (|htSaySaturn| "]")
                  (|htSayStandard| "\\tab{1}")
                  (|htSay| "{\\em " (SETQ |c| (LENGTH |x|)) " ")
                  (|htSay|
                   (COND ((< 1 |c|) (|pluralize| |kind|)) (#1# |kind|)))
                  (|htSay| ":}")
                  (|htSaySaturn| "\\\\")
                  (|bcConTable|
                   (REMDUP
                    ((LAMBDA (|bfVar#31| |bfVar#30| |y|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#30|)
                              (PROGN (SETQ |y| (CAR |bfVar#30|)) NIL))
                          (RETURN (NREVERSE |bfVar#31|)))
                         (#1# (SETQ |bfVar#31| (CONS (CAAR |y|) |bfVar#31|))))
                        (SETQ |bfVar#30| (CDR |bfVar#30|))))
                     NIL |x| NIL)))))))
          (SETQ |bfVar#28| (CDR |bfVar#28|))
          (SETQ |bfVar#29| (CDR |bfVar#29|))))
       '("category" "domain" "package" "default package") NIL |lists| NIL)
      (|htEndMenu| '|description|)
      (|htSayStandard| "\\indent{0}")))))
 
; addParameterTemplates(page, conform) ==
; ---------------> from kPage <-----------------------
;   parlist := [STRINGIMAGE par for par in rest conform]
;   manuelsCode? := "MAX"/[#s for s in parlist] > 10
;   w := (manuelsCode? => 55; 23)
;   htSaySaturn '"\colorbuttonbox{lightgray}{"
;   htSay '"Optional argument value"
;   htSay
;     rest parlist => '"s:"
;     '":"
;   htSaySaturn '"}"
;   if rest conform then htSaySaturn '"\newline{}"
;   htSaySaturn '"\begin{tabular}{p{.25in}l}"
;   firstTime := true
;   odd := false
;   argSublis := htpProperty(page,'argSublis)
;   for parname in $PatternVariableList for par in rest conform repeat
;     htSayStandard (odd or manuelsCode? => "\newline";"\tab{29}")
;     if firstTime then firstTime := false
;                  else htSaySaturn '"\\"
;     odd := not odd
;     argstring :=
;       $conArgstrings is [a,:r] => ($conArgstrings := r; a)
;       '""
;     htMakePageStandard [['text,'"{\em ",par,'"} = "],
;         ['bcStrings,[w - #STRINGIMAGE par,argstring,parname,'EM]]]
;     if $saturn then
;       setUpDefault(parname, ['string, '"", 'EM, nil])
;     htSaySaturn '"{\em "
;     htSaySaturn par
;     htSaySaturn '" = }"
;     htSaySaturnAmpersand()
;     htSaySaturn '"\colorbuttonbox{lightgray}{\inputbox[2.5in]{\"
;     htSaySaturn SUBLIS(argSublis,par)
;     htSaySaturn '"}{"
;     htSaySaturn argstring
;     htSaySaturn '"}}"
;   htEndTabular()
 
(DEFUN |addParameterTemplates| (|page| |conform|)
  (PROG (|parlist| |manuelsCode?| |w| |firstTime| |odd| |argSublis| |a| |r|
         |argstring|)
    (RETURN
     (PROGN
      (SETQ |parlist|
              ((LAMBDA (|bfVar#33| |bfVar#32| |par|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#32|)
                        (PROGN (SETQ |par| (CAR |bfVar#32|)) NIL))
                    (RETURN (NREVERSE |bfVar#33|)))
                   (#1='T
                    (SETQ |bfVar#33| (CONS (STRINGIMAGE |par|) |bfVar#33|))))
                  (SETQ |bfVar#32| (CDR |bfVar#32|))))
               NIL (CDR |conform|) NIL))
      (SETQ |manuelsCode?|
              (< 10
                 ((LAMBDA (|bfVar#35| |bfVar#34| |s|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#34|)
                           (PROGN (SETQ |s| (CAR |bfVar#34|)) NIL))
                       (RETURN |bfVar#35|))
                      (#1# (SETQ |bfVar#35| (MAX |bfVar#35| (LENGTH |s|)))))
                     (SETQ |bfVar#34| (CDR |bfVar#34|))))
                  -999999 |parlist| NIL)))
      (SETQ |w| (COND (|manuelsCode?| 55) (#1# 23)))
      (|htSaySaturn| "\\colorbuttonbox{lightgray}{")
      (|htSay| "Optional argument value")
      (|htSay| (COND ((CDR |parlist|) "s:") (#1# ":")))
      (|htSaySaturn| "}")
      (COND ((CDR |conform|) (|htSaySaturn| "\\newline{}")))
      (|htSaySaturn| "\\begin{tabular}{p{.25in}l}")
      (SETQ |firstTime| T)
      (SETQ |odd| NIL)
      (SETQ |argSublis| (|htpProperty| |page| '|argSublis|))
      ((LAMBDA (|bfVar#36| |parname| |bfVar#37| |par|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#36|) (PROGN (SETQ |parname| (CAR |bfVar#36|)) NIL)
                (ATOM |bfVar#37|) (PROGN (SETQ |par| (CAR |bfVar#37|)) NIL))
            (RETURN NIL))
           (#1#
            (PROGN
             (|htSayStandard|
              (COND ((OR |odd| |manuelsCode?|) '|\\newline|)
                    (#1# '|\\tab{29}|)))
             (COND (|firstTime| (SETQ |firstTime| NIL))
                   (#1# (|htSaySaturn| "\\\\")))
             (SETQ |odd| (NULL |odd|))
             (SETQ |argstring|
                     (COND
                      ((AND (CONSP |$conArgstrings|)
                            (PROGN
                             (SETQ |a| (CAR |$conArgstrings|))
                             (SETQ |r| (CDR |$conArgstrings|))
                             #1#))
                       (PROGN (SETQ |$conArgstrings| |r|) |a|))
                      (#1# "")))
             (|htMakePageStandard|
              (LIST (LIST '|text| "{\\em " |par| "} = ")
                    (LIST '|bcStrings|
                          (LIST (- |w| (LENGTH (STRINGIMAGE |par|)))
                                |argstring| |parname| 'EM))))
             (COND
              (|$saturn|
               (|setUpDefault| |parname| (LIST '|string| "" 'EM NIL))))
             (|htSaySaturn| "{\\em ")
             (|htSaySaturn| |par|)
             (|htSaySaturn| " = }")
             (|htSaySaturnAmpersand|)
             (|htSaySaturn| "\\colorbuttonbox{lightgray}{\\inputbox[2.5in]{\\")
             (|htSaySaturn| (SUBLIS |argSublis| |par|))
             (|htSaySaturn| "}{")
             (|htSaySaturn| |argstring|)
             (|htSaySaturn| "}}"))))
          (SETQ |bfVar#36| (CDR |bfVar#36|))
          (SETQ |bfVar#37| (CDR |bfVar#37|))))
       |$PatternVariableList| NIL (CDR |conform|) NIL)
      (|htEndTabular|)))))
 
; kPageArgs([op,:args],[.,.,:source]) ==
;   htSaySaturn '"\begin{tabular}{p{.25in}lp{0in}}"
;   firstTime := true
;   coSig := rest GETDATABASE(op,'COSIG)
;   for x in args for t in source for pred in coSig repeat
;     if firstTime then firstTime := false
;                  else
;                    htSaySaturn '"\\"
;                    htSayStandard '", and"
;     htSayStandard '"\newline "
;     htSaySaturnAmpersand()
;     typeForm := (t is [":",.,t1] => t1; t)
;     if pred = true
;       then htMakePage [['bcLinks,[x,'"",'kArgPage,x]]]
;       else htSay('"{\em ",x,'"}")
;     htSayStandard( '"\tab{",STRINGIMAGE( # PNAME x),'"}, ")
;     htSaySaturnAmpersand()
;     htSay
;       pred => '"a domain of category "
;       '"an element of the domain "
;     bcConform(typeForm,true)
;   htEndTabular()
 
(DEFUN |kPageArgs| (|bfVar#41| |bfVar#42|)
  (PROG (|source| |op| |args| |firstTime| |coSig| |ISTMP#1| |ISTMP#2| |t1|
         |typeForm|)
    (RETURN
     (PROGN
      (SETQ |source| (CDDR |bfVar#42|))
      (SETQ |op| (CAR |bfVar#41|))
      (SETQ |args| (CDR |bfVar#41|))
      (|htSaySaturn| "\\begin{tabular}{p{.25in}lp{0in}}")
      (SETQ |firstTime| T)
      (SETQ |coSig| (CDR (GETDATABASE |op| 'COSIG)))
      ((LAMBDA (|bfVar#38| |x| |bfVar#39| |t| |bfVar#40| |pred|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#38|) (PROGN (SETQ |x| (CAR |bfVar#38|)) NIL)
                (ATOM |bfVar#39|) (PROGN (SETQ |t| (CAR |bfVar#39|)) NIL)
                (ATOM |bfVar#40|) (PROGN (SETQ |pred| (CAR |bfVar#40|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (COND (|firstTime| (SETQ |firstTime| NIL))
                   (#1# (|htSaySaturn| "\\\\") (|htSayStandard| ", and")))
             (|htSayStandard| "\\newline ")
             (|htSaySaturnAmpersand|)
             (SETQ |typeForm|
                     (COND
                      ((AND (CONSP |t|) (EQ (CAR |t|) '|:|)
                            (PROGN
                             (SETQ |ISTMP#1| (CDR |t|))
                             (AND (CONSP |ISTMP#1|)
                                  (PROGN
                                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                   (AND (CONSP |ISTMP#2|)
                                        (EQ (CDR |ISTMP#2|) NIL)
                                        (PROGN
                                         (SETQ |t1| (CAR |ISTMP#2|))
                                         #1#))))))
                       |t1|)
                      (#1# |t|)))
             (COND
              ((EQUAL |pred| T)
               (|htMakePage|
                (LIST (LIST '|bcLinks| (LIST |x| "" '|kArgPage| |x|)))))
              (#1# (|htSay| "{\\em " |x| "}")))
             (|htSayStandard| "\\tab{" (STRINGIMAGE (LENGTH (PNAME |x|)))
              "}, ")
             (|htSaySaturnAmpersand|)
             (|htSay|
              (COND (|pred| "a domain of category ")
                    (#1# "an element of the domain ")))
             (|bcConform| |typeForm| T))))
          (SETQ |bfVar#38| (CDR |bfVar#38|))
          (SETQ |bfVar#39| (CDR |bfVar#39|))
          (SETQ |bfVar#40| (CDR |bfVar#40|))))
       |args| NIL |source| NIL |coSig| NIL)
      (|htEndTabular|)))))
 
; dbConform form ==
; --one button for the main constructor page of a type
;   $saturn => ["\lispLink[d]{\verb!(|conPage| '",:form2Fence dbOuttran form,'")!}{",
;            :form2StringList opOf form,"}"]
;   ["\conf{",:form2StringList opOf form,'"}{",:form2Fence dbOuttran form,'"}"]
 
(DEFUN |dbConform| (|form|)
  (PROG ()
    (RETURN
     (COND
      (|$saturn|
       (CONS '|\\lispLink[d]{\\verb!(\|conPage\| '|
             (APPEND (|form2Fence| (|dbOuttran| |form|))
                     (CONS ")!}{"
                           (APPEND (|form2StringList| (|opOf| |form|))
                                   (CONS '} NIL))))))
      ('T
       (CONS '|\\conf{|
             (APPEND (|form2StringList| (|opOf| |form|))
                     (CONS "}{"
                           (APPEND (|form2Fence| (|dbOuttran| |form|))
                                   (CONS "}" NIL))))))))))
 
; htTab s == if $standard then htSayStandard ('"\tab{",s,'"}")
 
(DEFUN |htTab| (|s|)
  (PROG () (RETURN (COND (|$standard| (|htSayStandard| "\\tab{" |s| "}"))))))
 
; dbGatherThenShow(htPage,opAlist,which,data,constructorIfTrue,word,fn) ==
;   single? := null rest data
;   htBeginMenu 'description
;   bincount := 0
;   for [thing,exposeFlag,:items] in data repeat
;     htSaySaturn '"\item["
;     htSayStandard ('"\item")
;     if single? then htSay(menuButton())
;     else
;       htMakePageStandard
;         [['bcLinks,[menuButton(),'"",'dbShowOps,which,bincount]]]
;       button := mkButtonBox (1 + bincount)
;       htMakePageSaturn [['bcLinks,[button,'"",'dbShowOps,which,bincount]]]
;     htSaySaturn '"]"
;     htSay '"{\em "
;     htSay
;       thing = 'nowhere => '"implemented nowhere"
;       thing = 'constant => '"constant"
;       thing = '_$ => '"by the domain"
;       INTEGERP thing => '"unexported"
;       constructorIfTrue =>
;         htSay word
;         atom thing => '" an unknown constructor"
;         '""
;       atom thing => '"unconditional"
;       '""
;     htSay '"}"
;     if null atom thing then
;       if constructorIfTrue then htSay('" {\em ",dbShowKind thing,'"}")
;       htSay '" "
;       FUNCALL(fn,thing)
;     htSay('":\newline ")
;     dbShowOpSigList(which,items,(1 + bincount) * 8192)
;     bincount := bincount + 1
;   htEndMenu 'description
 
(DEFUN |dbGatherThenShow|
       (|htPage| |opAlist| |which| |data| |constructorIfTrue| |word| |fn|)
  (PROG (|single?| |bincount| |thing| |ISTMP#1| |exposeFlag| |items| |button|)
    (RETURN
     (PROGN
      (SETQ |single?| (NULL (CDR |data|)))
      (|htBeginMenu| '|description|)
      (SETQ |bincount| 0)
      ((LAMBDA (|bfVar#44| |bfVar#43|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#44|)
                (PROGN (SETQ |bfVar#43| (CAR |bfVar#44|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#43|)
                 (PROGN
                  (SETQ |thing| (CAR |bfVar#43|))
                  (SETQ |ISTMP#1| (CDR |bfVar#43|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |exposeFlag| (CAR |ISTMP#1|))
                        (SETQ |items| (CDR |ISTMP#1|))
                        #1#)))
                 (PROGN
                  (|htSaySaturn| "\\item[")
                  (|htSayStandard| "\\item")
                  (COND (|single?| (|htSay| (|menuButton|)))
                        (#1#
                         (|htMakePageStandard|
                          (LIST
                           (LIST '|bcLinks|
                                 (LIST (|menuButton|) "" '|dbShowOps| |which|
                                       |bincount|))))
                         (SETQ |button| (|mkButtonBox| (+ 1 |bincount|)))
                         (|htMakePageSaturn|
                          (LIST
                           (LIST '|bcLinks|
                                 (LIST |button| "" '|dbShowOps| |which|
                                       |bincount|))))))
                  (|htSaySaturn| "]")
                  (|htSay| "{\\em ")
                  (|htSay|
                   (COND ((EQ |thing| '|nowhere|) "implemented nowhere")
                         ((EQ |thing| '|constant|) "constant")
                         ((EQ |thing| '$) "by the domain")
                         ((INTEGERP |thing|) "unexported")
                         (|constructorIfTrue|
                          (PROGN
                           (|htSay| |word|)
                           (COND ((ATOM |thing|) " an unknown constructor")
                                 (#1# ""))))
                         ((ATOM |thing|) "unconditional") (#1# "")))
                  (|htSay| "}")
                  (COND
                   ((NULL (ATOM |thing|))
                    (COND
                     (|constructorIfTrue|
                      (|htSay| " {\\em " (|dbShowKind| |thing|) "}")))
                    (|htSay| " ") (FUNCALL |fn| |thing|)))
                  (|htSay| ":\\newline ")
                  (|dbShowOpSigList| |which| |items| (* (+ 1 |bincount|) 8192))
                  (SETQ |bincount| (+ |bincount| 1))))))
          (SETQ |bfVar#44| (CDR |bfVar#44|))))
       |data| NIL)
      (|htEndMenu| '|description|)))))
 
; dbPresentOps(htPage,which,:exclusions) ==
;   $saturn => dbPresentOpsSaturn(htPage,which,exclusions)
;   asharp? := htpProperty(htPage,'isAsharpConstructor)
;   fromConPage? := (conname := opOf htpProperty(htPage,'conform))
;   usage? := nil
;   star? := not fromConPage? or which = '"package operation"
;   implementation? := not asharp? and
;     $UserLevel = 'development and $conformsAreDomains --and not $includeUnexposed?
;   rightmost? := star? or (implementation? and not $includeUnexposed?)
;   if INTEGERP first exclusions then exclusions := ['documentation]
;   htpSetProperty(htPage,'exclusion,first exclusions)
;   opAlist :=
;     which = '"operation" => htpProperty(htPage,'opAlist)
;     htpProperty(htPage,'attrAlist)
;   empty? := null opAlist
;   one?   := opAlist is [entry] and 2 = #entry
;   one? := empty? or one?
;   htBeginTable()
;   htSay '"{"
;   if one? or member('conditions,exclusions)
;                  or (htpProperty(htPage,'condition?) = 'no)
;       then htSay '"{\em Conditions}"
;       else htMakePage [['bcLispLinks,['"Conditions",'"",'dbShowOps,which,'conditions]]]
;   htSay '"}{"
;   if empty? or member('documentation,exclusions)
;     then htSay '"{\em Descriptions}"
;     else htMakePage [['bcLispLinks,['"Descriptions",'"",'dbShowOps,which,'documentation]]]
;   htSay '"}{"
;   if null IFCDR opAlist
;     then htSay '"{\em Filter}"
;     else htMakePage [['bcLinks,['"Filter ",'"",'htFilterPage,['dbShowOps,which,'filter]]]]
;   htSay '"}{"
;   if one? or member('names,exclusions) or null IFCDR opAlist
;     then htSay '"{\em Names}"
;     else htMakePage [['bcLispLinks,['"Names",'"",'dbShowOps,which,'names]]]
;   if not star? then
;     htSay '"}{"
;     if not implementation? or member('implementation,exclusions) or which = '"attribute" or
;       ((conname := opOf htpProperty(htPage,'conform))
;         and GETDATABASE(conname,'CONSTRUCTORKIND) = 'category)
;     then htSay '"{\em Implementations}"
;     else htMakePage
;       [['bcLispLinks,['"Implementations",'"",'dbShowOps,which,'implementation]]]
;   htSay '"}{"
;   if one? or member('origins,exclusions)
;     then htSay '"{\em Origins}"
;     else htMakePage [['bcLispLinks,['"Origins",'"",'dbShowOps,which,'origins]]]
;   htSay '"}{"
;   if one? or member('parameters,exclusions) --also test for some parameter
;       or not dbDoesOneOpHaveParameters? opAlist
;     then htSay '"{\em Parameters}"
;     else htMakePage [['bcLispLinks,['"Parameters",'"",'dbShowOps,which,'parameters]]]
;   htSay '"}{"
;   if which ~= '"attribute" then
;     if one? or member('signatures,exclusions)
;       then htSay '"{\em Signatures}"
;       else htMakePage [['bcLispLinks,['"Signatures",'"",'dbShowOps,which,'signatures]]]
;   htSay '"}"
;   if star? then
;     htSay '"{"
;     if $exposedOnlyIfTrue
;     then if one?
;          then htSay '"{\em Unexposed Also}"
;          else htMakePage [['bcLinks,['"Unexposed Also",'"",'dbShowOps,which,'exposureOff]]]
;     else if one?
;          then htSay '"{\em Exposed Only}"
;          else htMakePage [['bcLinks,['"Exposed Only",'"",'dbShowOps, which,'exposureOn]]]
;     htSay '"}"
;   htEndTable()
 
(DEFUN |dbPresentOps| (|htPage| |which| &REST |exclusions|)
  (PROG (|asharp?| |conname| |fromConPage?| |usage?| |star?| |implementation?|
         |rightmost?| |opAlist| |empty?| |entry| |one?|)
    (RETURN
     (COND (|$saturn| (|dbPresentOpsSaturn| |htPage| |which| |exclusions|))
           (#1='T
            (PROGN
             (SETQ |asharp?| (|htpProperty| |htPage| '|isAsharpConstructor|))
             (SETQ |fromConPage?|
                     (SETQ |conname|
                             (|opOf| (|htpProperty| |htPage| '|conform|))))
             (SETQ |usage?| NIL)
             (SETQ |star?|
                     (OR (NULL |fromConPage?|)
                         (EQUAL |which| "package operation")))
             (SETQ |implementation?|
                     (AND (NULL |asharp?|) (EQ |$UserLevel| '|development|)
                          |$conformsAreDomains|))
             (SETQ |rightmost?|
                     (OR |star?|
                         (AND |implementation?| (NULL |$includeUnexposed?|))))
             (COND
              ((INTEGERP (CAR |exclusions|))
               (SETQ |exclusions| (LIST '|documentation|))))
             (|htpSetProperty| |htPage| '|exclusion| (CAR |exclusions|))
             (SETQ |opAlist|
                     (COND
                      ((EQUAL |which| "operation")
                       (|htpProperty| |htPage| '|opAlist|))
                      (#1# (|htpProperty| |htPage| '|attrAlist|))))
             (SETQ |empty?| (NULL |opAlist|))
             (SETQ |one?|
                     (AND (CONSP |opAlist|) (EQ (CDR |opAlist|) NIL)
                          (PROGN (SETQ |entry| (CAR |opAlist|)) #1#)
                          (EQL 2 (LENGTH |entry|))))
             (SETQ |one?| (OR |empty?| |one?|))
             (|htBeginTable|)
             (|htSay| "{")
             (COND
              ((OR |one?| (|member| '|conditions| |exclusions|)
                   (EQ (|htpProperty| |htPage| '|condition?|) '|no|))
               (|htSay| "{\\em Conditions}"))
              (#1#
               (|htMakePage|
                (LIST
                 (LIST '|bcLispLinks|
                       (LIST "Conditions" "" '|dbShowOps| |which|
                             '|conditions|))))))
             (|htSay| "}{")
             (COND
              ((OR |empty?| (|member| '|documentation| |exclusions|))
               (|htSay| "{\\em Descriptions}"))
              (#1#
               (|htMakePage|
                (LIST
                 (LIST '|bcLispLinks|
                       (LIST "Descriptions" "" '|dbShowOps| |which|
                             '|documentation|))))))
             (|htSay| "}{")
             (COND ((NULL (IFCDR |opAlist|)) (|htSay| "{\\em Filter}"))
                   (#1#
                    (|htMakePage|
                     (LIST
                      (LIST '|bcLinks|
                            (LIST "Filter " "" '|htFilterPage|
                                  (LIST '|dbShowOps| |which| '|filter|)))))))
             (|htSay| "}{")
             (COND
              ((OR |one?| (|member| '|names| |exclusions|)
                   (NULL (IFCDR |opAlist|)))
               (|htSay| "{\\em Names}"))
              (#1#
               (|htMakePage|
                (LIST
                 (LIST '|bcLispLinks|
                       (LIST "Names" "" '|dbShowOps| |which| '|names|))))))
             (COND
              ((NULL |star?|) (|htSay| "}{")
               (COND
                ((OR (NULL |implementation?|)
                     (|member| '|implementation| |exclusions|)
                     (EQUAL |which| "attribute")
                     (AND
                      (SETQ |conname|
                              (|opOf| (|htpProperty| |htPage| '|conform|)))
                      (EQ (GETDATABASE |conname| 'CONSTRUCTORKIND)
                          '|category|)))
                 (|htSay| "{\\em Implementations}"))
                (#1#
                 (|htMakePage|
                  (LIST
                   (LIST '|bcLispLinks|
                         (LIST "Implementations" "" '|dbShowOps| |which|
                               '|implementation|))))))))
             (|htSay| "}{")
             (COND
              ((OR |one?| (|member| '|origins| |exclusions|))
               (|htSay| "{\\em Origins}"))
              (#1#
               (|htMakePage|
                (LIST
                 (LIST '|bcLispLinks|
                       (LIST "Origins" "" '|dbShowOps| |which| '|origins|))))))
             (|htSay| "}{")
             (COND
              ((OR |one?| (|member| '|parameters| |exclusions|)
                   (NULL (|dbDoesOneOpHaveParameters?| |opAlist|)))
               (|htSay| "{\\em Parameters}"))
              (#1#
               (|htMakePage|
                (LIST
                 (LIST '|bcLispLinks|
                       (LIST "Parameters" "" '|dbShowOps| |which|
                             '|parameters|))))))
             (|htSay| "}{")
             (COND
              ((NOT (EQUAL |which| "attribute"))
               (COND
                ((OR |one?| (|member| '|signatures| |exclusions|))
                 (|htSay| "{\\em Signatures}"))
                (#1#
                 (|htMakePage|
                  (LIST
                   (LIST '|bcLispLinks|
                         (LIST "Signatures" "" '|dbShowOps| |which|
                               '|signatures|))))))))
             (|htSay| "}")
             (COND
              (|star?| (|htSay| "{")
               (COND
                (|$exposedOnlyIfTrue|
                 (COND (|one?| (|htSay| "{\\em Unexposed Also}"))
                       (#1#
                        (|htMakePage|
                         (LIST
                          (LIST '|bcLinks|
                                (LIST "Unexposed Also" "" '|dbShowOps| |which|
                                      '|exposureOff|)))))))
                (|one?| (|htSay| "{\\em Exposed Only}"))
                (#1#
                 (|htMakePage|
                  (LIST
                   (LIST '|bcLinks|
                         (LIST "Exposed Only" "" '|dbShowOps| |which|
                               '|exposureOn|))))))
               (|htSay| "}")))
             (|htEndTable|)))))))
 
; dbPresentOpsSaturn(htPage,which,exclusions) ==
;   $htLineList : local := nil
;   $newPage    : local := nil
;   asharp? := htpProperty(htPage,'isAsharpConstructor)
;   fromConPage? := (conname := opOf htpProperty(htPage,'conform))
;   usage? := nil
;   star? := not fromConPage? or which = '"package operation"
;   implementation? := not asharp? and
;     $UserLevel = 'development and $conformsAreDomains --and not $includeUnexposed?
;   rightmost? := star? or (implementation? and not $includeUnexposed?)
;   if INTEGERP first exclusions then exclusions := ['documentation]
;   htpSetProperty(htPage,'exclusion,first exclusions)
;   opAlist :=
;     which = '"operation" => htpProperty(htPage,'opAlist)
;     htpProperty(htPage,'attrAlist)
;   empty? := null opAlist
;   one?   := opAlist is [entry] and 2 = #entry
;   one? := empty? or one?
;   if one? or member('conditions,exclusions)
;                  or (htpProperty(htPage,'condition?) = 'no)
;       then htSayCold '"\&Conditions"
;       else htMakePage [['bcLispLinks,['"\&Conditions",'"",'dbShowOps,which,'conditions]]]
;   if empty? or member('documentation,exclusions)
;     then htSayCold '"\&Descriptions"
;     else htMakePage [['bcLispLinks,['"\&Descriptions",'"",'dbShowOps,which,'documentation]]]
;   if null IFCDR opAlist
;     then htSayCold '"\&Filter"
;     else htMakeSaturnFilterPage ['dbShowOps, which, 'filter]
;   if not implementation? or member('implementation,exclusions) or which = '"attribute" or
;       ((conname := opOf htpProperty(htPage,'conform))
;         and GETDATABASE(conname,'CONSTRUCTORKIND) = 'category)
;     then htSayCold '"\&Implementations"
;     else htMakePage
;       [['bcLispLinks,['"\&Implementations",'"",'dbShowOps,which,'implementation]]]
;   if one? or member('names, exclusions) or null IFCDR opAlist
;     then htSayCold '"\&Names"
;     else htMakePage [['bcLispLinks,['"\&Names",'"",'dbShowOps,which,'names]]]
;   if one? or member('origins,exclusions)
;     then htSayCold '"\&Origins"
;     else htMakePage [['bcLispLinks,['"\&Origins",'"",'dbShowOps,which,'origins]]]
;   if one? or member('parameters,exclusions) --also test for some parameter
;       or not dbDoesOneOpHaveParameters? opAlist
;     then htSayCold '"\&Parameters"
;     else htMakePage [['bcLispLinks,['"\&Parameters",'"",'dbShowOps,which,'parameters]]]
;   if which ~= '"attribute" then
;     if one? or member('signatures,exclusions)
;       then htSayCold '"\&Signatures"
;       else htMakePage [['bcLispLinks,['"\&Signatures",'"",'dbShowOps,which,'signatures]]]
;   if star? then
;     htSay '"\hrule"
;     if $exposedOnlyIfTrue
;       then if one? then htSayCold '"\&Unexposed Also"
;       else htMakePage [['bcLinks,['"\&Unexposed Also",'"",'dbShowOps,which,'exposureOff]]]
;     else
;       if one? then htSayCold '"Exposed Onl\&y"
;       else htMakePage [['bcLinks,['"Exposed Onl\&y",'"",'dbShowOps,which,'exposureOn]]]
;   $saturnContextMenuLines := $htLineList
 
(DEFUN |dbPresentOpsSaturn| (|htPage| |which| |exclusions|)
  (PROG (|$newPage| |$htLineList| |one?| |entry| |empty?| |opAlist|
         |rightmost?| |implementation?| |star?| |usage?| |fromConPage?|
         |conname| |asharp?|)
    (DECLARE (SPECIAL |$newPage| |$htLineList|))
    (RETURN
     (PROGN
      (SETQ |$htLineList| NIL)
      (SETQ |$newPage| NIL)
      (SETQ |asharp?| (|htpProperty| |htPage| '|isAsharpConstructor|))
      (SETQ |fromConPage?|
              (SETQ |conname| (|opOf| (|htpProperty| |htPage| '|conform|))))
      (SETQ |usage?| NIL)
      (SETQ |star?|
              (OR (NULL |fromConPage?|) (EQUAL |which| "package operation")))
      (SETQ |implementation?|
              (AND (NULL |asharp?|) (EQ |$UserLevel| '|development|)
                   |$conformsAreDomains|))
      (SETQ |rightmost?|
              (OR |star?| (AND |implementation?| (NULL |$includeUnexposed?|))))
      (COND
       ((INTEGERP (CAR |exclusions|))
        (SETQ |exclusions| (LIST '|documentation|))))
      (|htpSetProperty| |htPage| '|exclusion| (CAR |exclusions|))
      (SETQ |opAlist|
              (COND
               ((EQUAL |which| "operation")
                (|htpProperty| |htPage| '|opAlist|))
               (#1='T (|htpProperty| |htPage| '|attrAlist|))))
      (SETQ |empty?| (NULL |opAlist|))
      (SETQ |one?|
              (AND (CONSP |opAlist|) (EQ (CDR |opAlist|) NIL)
                   (PROGN (SETQ |entry| (CAR |opAlist|)) #1#)
                   (EQL 2 (LENGTH |entry|))))
      (SETQ |one?| (OR |empty?| |one?|))
      (COND
       ((OR |one?| (|member| '|conditions| |exclusions|)
            (EQ (|htpProperty| |htPage| '|condition?|) '|no|))
        (|htSayCold| "\\&Conditions"))
       (#1#
        (|htMakePage|
         (LIST
          (LIST '|bcLispLinks|
                (LIST "\\&Conditions" "" '|dbShowOps| |which|
                      '|conditions|))))))
      (COND
       ((OR |empty?| (|member| '|documentation| |exclusions|))
        (|htSayCold| "\\&Descriptions"))
       (#1#
        (|htMakePage|
         (LIST
          (LIST '|bcLispLinks|
                (LIST "\\&Descriptions" "" '|dbShowOps| |which|
                      '|documentation|))))))
      (COND ((NULL (IFCDR |opAlist|)) (|htSayCold| "\\&Filter"))
            (#1#
             (|htMakeSaturnFilterPage| (LIST '|dbShowOps| |which| '|filter|))))
      (COND
       ((OR (NULL |implementation?|) (|member| '|implementation| |exclusions|)
            (EQUAL |which| "attribute")
            (AND (SETQ |conname| (|opOf| (|htpProperty| |htPage| '|conform|)))
                 (EQ (GETDATABASE |conname| 'CONSTRUCTORKIND) '|category|)))
        (|htSayCold| "\\&Implementations"))
       (#1#
        (|htMakePage|
         (LIST
          (LIST '|bcLispLinks|
                (LIST "\\&Implementations" "" '|dbShowOps| |which|
                      '|implementation|))))))
      (COND
       ((OR |one?| (|member| '|names| |exclusions|) (NULL (IFCDR |opAlist|)))
        (|htSayCold| "\\&Names"))
       (#1#
        (|htMakePage|
         (LIST
          (LIST '|bcLispLinks|
                (LIST "\\&Names" "" '|dbShowOps| |which| '|names|))))))
      (COND
       ((OR |one?| (|member| '|origins| |exclusions|))
        (|htSayCold| "\\&Origins"))
       (#1#
        (|htMakePage|
         (LIST
          (LIST '|bcLispLinks|
                (LIST "\\&Origins" "" '|dbShowOps| |which| '|origins|))))))
      (COND
       ((OR |one?| (|member| '|parameters| |exclusions|)
            (NULL (|dbDoesOneOpHaveParameters?| |opAlist|)))
        (|htSayCold| "\\&Parameters"))
       (#1#
        (|htMakePage|
         (LIST
          (LIST '|bcLispLinks|
                (LIST "\\&Parameters" "" '|dbShowOps| |which|
                      '|parameters|))))))
      (COND
       ((NOT (EQUAL |which| "attribute"))
        (COND
         ((OR |one?| (|member| '|signatures| |exclusions|))
          (|htSayCold| "\\&Signatures"))
         (#1#
          (|htMakePage|
           (LIST
            (LIST '|bcLispLinks|
                  (LIST "\\&Signatures" "" '|dbShowOps| |which|
                        '|signatures|))))))))
      (COND
       (|star?| (|htSay| "\\hrule")
        (COND
         (|$exposedOnlyIfTrue|
          (COND (|one?| (|htSayCold| "\\&Unexposed Also"))
                (#1#
                 (|htMakePage|
                  (LIST
                   (LIST '|bcLinks|
                         (LIST "\\&Unexposed Also" "" '|dbShowOps| |which|
                               '|exposureOff|)))))))
         (|one?| (|htSayCold| "Exposed Onl\\&y"))
         (#1#
          (|htMakePage|
           (LIST
            (LIST '|bcLinks|
                  (LIST "Exposed Onl\\&y" "" '|dbShowOps| |which|
                        '|exposureOn|))))))))
      (SETQ |$saturnContextMenuLines| |$htLineList|)))))
 
; htShowPageStar() ==
;   $saturn => htShowPageStarSaturn()
;   htSayStandard '"\endscroll "
;   if $exposedOnlyIfTrue then
;     htMakePage [['bcLinks,['"Unexposed Also",'"",'repeatSearch,NIL]]]
;   else
;     htMakePage [['bcLinks,['"Exposed Only",'"",'repeatSearch,'T]]]
;   htShowPageNoScroll()
 
(DEFUN |htShowPageStar| #1=()
  (PROG #1#
    (RETURN
     (COND (|$saturn| (|htShowPageStarSaturn|))
           (#2='T
            (PROGN
             (|htSayStandard| "\\endscroll ")
             (COND
              (|$exposedOnlyIfTrue|
               (|htMakePage|
                (LIST
                 (LIST '|bcLinks|
                       (LIST "Unexposed Also" "" '|repeatSearch| NIL)))))
              (#2#
               (|htMakePage|
                (LIST
                 (LIST '|bcLinks|
                       (LIST "Exposed Only" "" '|repeatSearch| 'T))))))
             (|htShowPageNoScroll|)))))))
 
; htShowPageStarSaturn() ==
;   $newPage    : local := nil
;   $htLineList : local := nil
;   if $exposedOnlyIfTrue then
;     htMakePage [['bcLinks,['"Unexposed Also",'"",'repeatSearch,NIL]]]
;   else
;     htMakePage [['bcLinks,['"Exposed Only",'"",'repeatSearch,'T]]]
;   $saturnContextMenuLines := $htLineList
;   htShowPageNoScroll()
 
(DEFUN |htShowPageStarSaturn| ()
  (PROG (|$htLineList| |$newPage|)
    (DECLARE (SPECIAL |$htLineList| |$newPage|))
    (RETURN
     (PROGN
      (SETQ |$newPage| NIL)
      (SETQ |$htLineList| NIL)
      (COND
       (|$exposedOnlyIfTrue|
        (|htMakePage|
         (LIST
          (LIST '|bcLinks| (LIST "Unexposed Also" "" '|repeatSearch| NIL)))))
       ('T
        (|htMakePage|
         (LIST
          (LIST '|bcLinks| (LIST "Exposed Only" "" '|repeatSearch| 'T))))))
      (SETQ |$saturnContextMenuLines| |$htLineList|)
      (|htShowPageNoScroll|)))))
 
; displayDomainOp(htPage,which,origin,op,sig,predicate,
;                 doc,index,chooseFn,unexposed?,$generalSearch?) ==
;   $chooseDownCaseOfType : local := true   --see dbGetContrivedForm
;   $whereList  : local := nil
;   $NumberList : local := '(i j k l m n i1 j1 k1 l1 m1 n1 i2 j2 k2 l2 m2 n2 i3 j3 k3 l3 m3 n3 i4 j4 k4 l4 m4 n4 )
;   $ElementList: local := '(x y z u v w x1 y1 z1 u1 v1 w1 x2 y2 z2 u2 v2 w2 x3 y3 z3 u3 v3 w3 x4 y4 z4 u4 v4 w4 )
;   $FunctionList:local := '(f g h d e F G H)
;   $DomainList:  local := '(D R S E T A B C M N P Q U V W)
;   exactlyOneOpSig     := null index
;   conform   := htpProperty(htPage,'domname) or htpProperty(htPage,'conform)
;                  or origin
;   if $generalSearch? then $DomainList := rest $DomainList
;   opform :=
;     which = '"attribute" =>
;       null sig => [op]
;       [op,sig]
;     which = '"constructor" => origin
;     dbGetDisplayFormForOp(op,sig,doc)
;   htSayStandard('"\newline")
;   -----------------------------------------------------------
;   htSaySaturn '"\item["
;   if exactlyOneOpSig
;     then htSay menuButton()
;     else htMakePage
;       [['bcLinks,[menuButton(),'"",chooseFn,which,index]]]
;   htSaySaturn '"]"
;   htSayStandard '"\tab{2}"
;   op   := IFCAR opform
;   args := IFCDR opform
;   ops := escapeSpecialChars STRINGIMAGE op
;   n := #sig
;   do
;     n = 2 and GETL(op, 'Nud) =>
;         htSay(ops,'" {\em ", quickForm2HtString IFCAR args, '"}")
;     n = 3 and GETL(op, 'Led) =>
;         htSay('"{\em ", quickForm2HtString IFCAR args, '"} ", ops,
;               '" {\em ", quickForm2HtString IFCAR IFCDR args, '"}")
;     if unexposed? and $includeUnexposed? then
;       htSayUnexposed()
;     htSay(ops)
;     predicate='ASCONST or GETDATABASE(op,'NILADIC) or member(op,'(0 1)) => 'skip
;     which = '"attribute" and null args => 'skip
;     htSay('"(")
;     if IFCAR args then htSay('"{\em ",quickForm2HtString IFCAR args,'"}")
;     for x in IFCDR args repeat
;       htSay('",{\em ",quickForm2HtString x,'"}")
;     htSay('")")
;   -----------prepare to print description---------------------
;   constring := form2HtString conform
;   conname   := first conform
;   $conkind   : local := htpProperty(htPage,'kind) -- a string e.g. "category"
;                           or STRINGIMAGE GETDATABASE(conname,'CONSTRUCTORKIND)
;   $conlength : local := #constring
;   $conform   : local := conform
;   $conargs   : local := rest conform
;   if which = '"operation" then
;     $signature : local :=
;       MEMQ(conname,$Primitives) => nil
;       CDAR getConstructorModemap conname
;     --RDJ: this next line is necessary until compiler bug is fixed
;     --that forgets to substitute #variables for t#variables;
;     --check the signature for SegmentExpansionCategory, e.g.
;     tvarlist := TAKE(# $conargs,$TriangleVariableList)
;     $signature := SUBLISLIS($FormalMapVariableList,tvarlist,$signature)
;   $sig :=
;     which = '"attribute" or which = '"constructor" => sig
;     $conkind ~= '"package" => sig
;     symbolsUsed := [x for x in rest conform | IDENTP x]
;     $DomainList := SETDIFFERENCE($DomainList,symbolsUsed)
;     getSubstSigIfPossible sig
;   -----------------------------------------------------------
;   htSaySaturn '"\begin{tabular}{lp{0in}}"
;   -----------------------------------------------------------
;   if member(which,'("operation" "constructor")) then
;     $displayReturnValue: local := nil
;     if args then
;       htSayStandard('"\newline\tab{2}{\em Arguments:}")
;       htSaySaturn '"{\em Arguments:}"
;       htSaySaturnAmpersand()
;       firstTime := true
;       coSig := IFCDR GETDATABASE(op, 'COSIG)  --check if op is constructor
;       for a in args for t in rest $sig repeat
;             if not firstTime then
;               htSaySaturn '"\\ "
;               htSaySaturnAmpersand()
;             firstTime := false
;             htSayIndentRel(15, true)
;             position := IFCAR relatives
;             relatives := IFCDR relatives
;             if IFCAR coSig and t ~= '(Type)
;               then htMakePage [['bcLinks,[a,'"",'kArgPage,a]]]
;               else htSay('"{\em ",form2HtString(a),'"}")
;             htSay ", "
;             coSig := IFCDR coSig
;             htSayValue t
;             htSayIndentRel(-15,true)
;             htSayStandard('"\newline ")
;       htSaySaturn '"\\"
;     if first $sig then
;       $displayReturnValue := true
;       htSayStandard('"\newline\tab{2}")
;       htSay '"{\em Returns:}"
;       htSaySaturnAmpersand()
;       htSayIndentRel(15, true)
;       htSayValue first $sig
;       htSayIndentRel(-15, true)
;       htSaySaturn '"\\"
;   -----------------------------------------------------------
;   if origin and ($generalSearch? or origin ~= conform) and op~=opOf origin then
;     htSaySaturn '"{\em Origin:}"
;     htSaySaturnAmpersand()
;     htSayStandard('"\newline\tab{2}{\em Origin:}")
;     htSayIndentRel(15)
;     if not isExposedConstructor opOf origin and $includeUnexposed?
;        then htSayUnexposed()
;     bcConform(origin,true)
;     htSayIndentRel(-15)
;     htSaySaturn '"\\"
;   -----------------------------------------------------------
;   if not MEMQ(predicate,'(T ASCONST)) then
;     pred := sublisFormal(IFCDR conform, predicate)
;     count := #pred
;     htSaySaturn '"{\em Conditions:}"
;     htSayStandard('"\newline\tab{2}{\em Conditions:}")
;     firstTime := true
;     for p in displayBreakIntoAnds SUBST($conform,"$",pred) repeat
;       if not firstTime then htSaySaturn '"\\"
;       htSayIndentRel(15,count > 1)
;       firstTime := false
;       htSaySaturnAmpersand()
;       bcPred(p,$conform,true)
;       htSayIndentRel(-15,count > 1)
;       htSayStandard('"\newline ")
;     htSaySaturn '"\\"
;   -----------------------------------------------------------
;   if $whereList then
;     count := #$whereList
;     htSaySaturn '"{\em Where:}"
;     htSayStandard('"\newline\tab{2}{\em Where:}")
;     firstTime := true
;     if assoc("$",$whereList) then
;       htSayIndentRel(15,true)
;       htSaySaturnAmpersand()
;       htSayStandard '"{\em \$} is "
;       htSaySaturn '"{\em \%} is "
;       htSay
;         $conkind = '"category" => '"of category "
;         '"the domain "
;       bcConform(conform,true,true)
;       firstTime := false
;       htSayIndentRel(-15,true)
;     for [d,key,:t] in $whereList | d ~= "$" repeat
;       htSayIndentRel(15,count > 1)
;       if not firstTime then htSaySaturn '"\\ "
;       htSaySaturnAmpersand()
;       firstTime := false
;       htSay("{\em ",d,"} is ")
;       htSayConstructor(key, sublisFormal(IFCDR conform, t))
;       htSayIndentRel(-15,count > 1)
;     htSaySaturn '"\\"
;   -----------------------------------------------------------
;   if doc and (doc ~= '"" and (doc isnt [d] or d ~= '"")) then
;     htSaySaturn '"{\em Description:}"
;     htSaySaturnAmpersand()
;     htSayStandard('"\newline\tab{2}{\em Description:}")
;     htSayIndentRel(15)
;     if doc = $charFauxNewline then htSay $charNewline
;     else
;        ndoc:=
;           -- we are confused whether doc is a string or a list of strings
;           CONSP doc =>  [SUBSTITUTE($charNewline, $charFauxNewline, i) for i in doc]
;           SUBSTITUTE($charNewline, $charFauxNewline,doc)
;        htSay ndoc
; --  htSaySaturn '"\\"
;     htSayIndentRel(-15)
;   --------> print abbr and source file for constructors <---------
;   if which = '"constructor" then
;     if (abbr := GETDATABASE(conname,'ABBREVIATION)) then
;       htSaySaturn '"\\"
;       htSaySaturn '"{\em Abbreviation:}"
;       htSaySaturnAmpersand()
;       htSayStandard('"\tab{2}{\em Abbreviation:}")
;       htSayIndentRel(15)
;       htSay abbr
;       htSayIndentRel(-15)
;       htSayStandard('"\newline{}")
;     if ( $saturn and (link := saturnHasExamplePage conname)) then
;       htSaySaturn '"\\"
;       htSaySaturn '"{\em Examples:}"
;       htSaySaturnAmpersand()
;       htSayIndentRel(15)
;       htSay '"\spadref{"
;       htSay first(rest(link))
;       htSay '"}"
;       htSayIndentRel(-15)
;       htSayStandard('"\newline{}")
;     htSaySaturn '"\\"
;     htSaySaturn '"{\em Source File:}"
;     htSaySaturnAmpersand()
;     htSayStandard('"\tab{2}{\em Source File:}")
;     htSayIndentRel(15)
;     htSaySourceFile conname
;     htSayIndentRel(-15)
;   ------------------> remove profile printouts for now <-------------------
;   if $standard and
;     exactlyOneOpSig and (infoAlist := htpProperty(htPage,'infoAlist)) then
;       displayInfoOp(htPage,infoAlist,op,sig)
;   -----------------------------------------------------------
;   htSaySaturn '"\end{tabular}"
 
(DEFUN |displayDomainOp|
       (|htPage| |which| |origin| |op| |sig| |predicate| |doc| |index|
        |chooseFn| |unexposed?| |$generalSearch?|)
  (DECLARE (SPECIAL |$generalSearch?|))
  (PROG (|$displayReturnValue| |$signature| |$conargs| |$conform| |$conlength|
         |$conkind| |$DomainList| |$FunctionList| |$ElementList| |$NumberList|
         |$whereList| |$chooseDownCaseOfType| |infoAlist| |link| |abbr| |ndoc|
         |t| |key| |ISTMP#1| |d| |count| |pred| |relatives| |position| |coSig|
         |firstTime| |symbolsUsed| |tvarlist| |conname| |constring| |n| |ops|
         |args| |opform| |conform| |exactlyOneOpSig|)
    (DECLARE
     (SPECIAL |$displayReturnValue| |$signature| |$conargs| |$conform|
      |$conlength| |$conkind| |$DomainList| |$FunctionList| |$ElementList|
      |$NumberList| |$whereList| |$chooseDownCaseOfType|))
    (RETURN
     (PROGN
      (SETQ |$chooseDownCaseOfType| T)
      (SETQ |$whereList| NIL)
      (SETQ |$NumberList|
              '(|i| |j| |k| |l| |m| |n| |i1| |j1| |k1| |l1| |m1| |n1| |i2| |j2|
                |k2| |l2| |m2| |n2| |i3| |j3| |k3| |l3| |m3| |n3| |i4| |j4|
                |k4| |l4| |m4| |n4|))
      (SETQ |$ElementList|
              '(|x| |y| |z| |u| |v| |w| |x1| |y1| |z1| |u1| |v1| |w1| |x2| |y2|
                |z2| |u2| |v2| |w2| |x3| |y3| |z3| |u3| |v3| |w3| |x4| |y4|
                |z4| |u4| |v4| |w4|))
      (SETQ |$FunctionList| '(|f| |g| |h| |d| |e| F G H))
      (SETQ |$DomainList| '(D R S E T A B C M N P Q U V W))
      (SETQ |exactlyOneOpSig| (NULL |index|))
      (SETQ |conform|
              (OR (|htpProperty| |htPage| '|domname|)
                  (|htpProperty| |htPage| '|conform|) |origin|))
      (COND (|$generalSearch?| (SETQ |$DomainList| (CDR |$DomainList|))))
      (SETQ |opform|
              (COND
               ((EQUAL |which| "attribute")
                (COND ((NULL |sig|) (LIST |op|)) (#1='T (LIST |op| |sig|))))
               ((EQUAL |which| "constructor") |origin|)
               (#1# (|dbGetDisplayFormForOp| |op| |sig| |doc|))))
      (|htSayStandard| "\\newline")
      (|htSaySaturn| "\\item[")
      (COND (|exactlyOneOpSig| (|htSay| (|menuButton|)))
            (#1#
             (|htMakePage|
              (LIST
               (LIST '|bcLinks|
                     (LIST (|menuButton|) "" |chooseFn| |which| |index|))))))
      (|htSaySaturn| "]")
      (|htSayStandard| "\\tab{2}")
      (SETQ |op| (IFCAR |opform|))
      (SETQ |args| (IFCDR |opform|))
      (SETQ |ops| (|escapeSpecialChars| (STRINGIMAGE |op|)))
      (SETQ |n| (LENGTH |sig|))
      (|do|
       (COND
        ((AND (EQL |n| 2) (GETL |op| '|Nud|))
         (|htSay| |ops| " {\\em " (|quickForm2HtString| (IFCAR |args|)) "}"))
        ((AND (EQL |n| 3) (GETL |op| '|Led|))
         (|htSay| "{\\em " (|quickForm2HtString| (IFCAR |args|)) "} " |ops|
          " {\\em " (|quickForm2HtString| (IFCAR (IFCDR |args|))) "}"))
        (#1#
         (PROGN
          (COND ((AND |unexposed?| |$includeUnexposed?|) (|htSayUnexposed|)))
          (|htSay| |ops|)
          (COND
           ((OR (EQ |predicate| 'ASCONST) (GETDATABASE |op| 'NILADIC)
                (|member| |op| '(0 1)))
            '|skip|)
           ((AND (EQUAL |which| "attribute") (NULL |args|)) '|skip|)
           (#1#
            (PROGN
             (|htSay| "(")
             (COND
              ((IFCAR |args|)
               (|htSay| "{\\em " (|quickForm2HtString| (IFCAR |args|)) "}")))
             ((LAMBDA (|bfVar#45| |x|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#45|)
                       (PROGN (SETQ |x| (CAR |bfVar#45|)) NIL))
                   (RETURN NIL))
                  (#1# (|htSay| ",{\\em " (|quickForm2HtString| |x|) "}")))
                 (SETQ |bfVar#45| (CDR |bfVar#45|))))
              (IFCDR |args|) NIL)
             (|htSay| ")"))))))))
      (SETQ |constring| (|form2HtString| |conform|))
      (SETQ |conname| (CAR |conform|))
      (SETQ |$conkind|
              (OR (|htpProperty| |htPage| '|kind|)
                  (STRINGIMAGE (GETDATABASE |conname| 'CONSTRUCTORKIND))))
      (SETQ |$conlength| (LENGTH |constring|))
      (SETQ |$conform| |conform|)
      (SETQ |$conargs| (CDR |conform|))
      (COND
       ((EQUAL |which| "operation")
        (SETQ |$signature|
                (COND ((MEMQ |conname| |$Primitives|) NIL)
                      (#1# (CDAR (|getConstructorModemap| |conname|)))))
        (SETQ |tvarlist| (TAKE (LENGTH |$conargs|) |$TriangleVariableList|))
        (SETQ |$signature|
                (SUBLISLIS |$FormalMapVariableList| |tvarlist| |$signature|))))
      (SETQ |$sig|
              (COND
               ((OR (EQUAL |which| "attribute") (EQUAL |which| "constructor"))
                |sig|)
               ((NOT (EQUAL |$conkind| "package")) |sig|)
               (#1#
                (PROGN
                 (SETQ |symbolsUsed|
                         ((LAMBDA (|bfVar#47| |bfVar#46| |x|)
                            (LOOP
                             (COND
                              ((OR (ATOM |bfVar#46|)
                                   (PROGN (SETQ |x| (CAR |bfVar#46|)) NIL))
                               (RETURN (NREVERSE |bfVar#47|)))
                              (#1#
                               (AND (IDENTP |x|)
                                    (SETQ |bfVar#47| (CONS |x| |bfVar#47|)))))
                             (SETQ |bfVar#46| (CDR |bfVar#46|))))
                          NIL (CDR |conform|) NIL))
                 (SETQ |$DomainList|
                         (SETDIFFERENCE |$DomainList| |symbolsUsed|))
                 (|getSubstSigIfPossible| |sig|)))))
      (|htSaySaturn| "\\begin{tabular}{lp{0in}}")
      (COND
       ((|member| |which| '("operation" "constructor"))
        (SETQ |$displayReturnValue| NIL)
        (COND
         (|args| (|htSayStandard| "\\newline\\tab{2}{\\em Arguments:}")
          (|htSaySaturn| "{\\em Arguments:}") (|htSaySaturnAmpersand|)
          (SETQ |firstTime| T) (SETQ |coSig| (IFCDR (GETDATABASE |op| 'COSIG)))
          ((LAMBDA (|bfVar#48| |a| |bfVar#49| |t|)
             (LOOP
              (COND
               ((OR (ATOM |bfVar#48|) (PROGN (SETQ |a| (CAR |bfVar#48|)) NIL)
                    (ATOM |bfVar#49|) (PROGN (SETQ |t| (CAR |bfVar#49|)) NIL))
                (RETURN NIL))
               (#1#
                (PROGN
                 (COND
                  ((NULL |firstTime|) (|htSaySaturn| "\\\\ ")
                   (|htSaySaturnAmpersand|)))
                 (SETQ |firstTime| NIL)
                 (|htSayIndentRel| 15 T)
                 (SETQ |position| (IFCAR |relatives|))
                 (SETQ |relatives| (IFCDR |relatives|))
                 (COND
                  ((AND (IFCAR |coSig|) (NOT (EQUAL |t| '(|Type|))))
                   (|htMakePage|
                    (LIST (LIST '|bcLinks| (LIST |a| "" '|kArgPage| |a|)))))
                  (#1# (|htSay| "{\\em " (|form2HtString| |a|) "}")))
                 (|htSay| '|, |)
                 (SETQ |coSig| (IFCDR |coSig|))
                 (|htSayValue| |t|)
                 (|htSayIndentRel| (- 15) T)
                 (|htSayStandard| "\\newline "))))
              (SETQ |bfVar#48| (CDR |bfVar#48|))
              (SETQ |bfVar#49| (CDR |bfVar#49|))))
           |args| NIL (CDR |$sig|) NIL)
          (|htSaySaturn| "\\\\")))
        (COND
         ((CAR |$sig|) (SETQ |$displayReturnValue| T)
          (|htSayStandard| "\\newline\\tab{2}") (|htSay| "{\\em Returns:}")
          (|htSaySaturnAmpersand|) (|htSayIndentRel| 15 T)
          (|htSayValue| (CAR |$sig|)) (|htSayIndentRel| (- 15) T)
          (|htSaySaturn| "\\\\")))))
      (COND
       ((AND |origin| (OR |$generalSearch?| (NOT (EQUAL |origin| |conform|)))
             (NOT (EQUAL |op| (|opOf| |origin|))))
        (|htSaySaturn| "{\\em Origin:}") (|htSaySaturnAmpersand|)
        (|htSayStandard| "\\newline\\tab{2}{\\em Origin:}")
        (|htSayIndentRel| 15)
        (COND
         ((AND (NULL (|isExposedConstructor| (|opOf| |origin|)))
               |$includeUnexposed?|)
          (|htSayUnexposed|)))
        (|bcConform| |origin| T) (|htSayIndentRel| (- 15))
        (|htSaySaturn| "\\\\")))
      (COND
       ((NULL (MEMQ |predicate| '(T ASCONST)))
        (SETQ |pred| (|sublisFormal| (IFCDR |conform|) |predicate|))
        (SETQ |count| (LENGTH |pred|)) (|htSaySaturn| "{\\em Conditions:}")
        (|htSayStandard| "\\newline\\tab{2}{\\em Conditions:}")
        (SETQ |firstTime| T)
        ((LAMBDA (|bfVar#50| |p|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#50|) (PROGN (SETQ |p| (CAR |bfVar#50|)) NIL))
              (RETURN NIL))
             (#1#
              (PROGN
               (COND ((NULL |firstTime|) (|htSaySaturn| "\\\\")))
               (|htSayIndentRel| 15 (< 1 |count|))
               (SETQ |firstTime| NIL)
               (|htSaySaturnAmpersand|)
               (|bcPred| |p| |$conform| T)
               (|htSayIndentRel| (- 15) (< 1 |count|))
               (|htSayStandard| "\\newline "))))
            (SETQ |bfVar#50| (CDR |bfVar#50|))))
         (|displayBreakIntoAnds| (SUBST |$conform| '$ |pred|)) NIL)
        (|htSaySaturn| "\\\\")))
      (COND
       (|$whereList| (SETQ |count| (LENGTH |$whereList|))
        (|htSaySaturn| "{\\em Where:}")
        (|htSayStandard| "\\newline\\tab{2}{\\em Where:}") (SETQ |firstTime| T)
        (COND
         ((|assoc| '$ |$whereList|) (|htSayIndentRel| 15 T)
          (|htSaySaturnAmpersand|) (|htSayStandard| "{\\em \\$} is ")
          (|htSaySaturn| "{\\em \\%} is ")
          (|htSay|
           (COND ((EQUAL |$conkind| "category") "of category ")
                 (#1# "the domain ")))
          (|bcConform| |conform| T T) (SETQ |firstTime| NIL)
          (|htSayIndentRel| (- 15) T)))
        ((LAMBDA (|bfVar#52| |bfVar#51|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#52|)
                  (PROGN (SETQ |bfVar#51| (CAR |bfVar#52|)) NIL))
              (RETURN NIL))
             (#1#
              (AND (CONSP |bfVar#51|)
                   (PROGN
                    (SETQ |d| (CAR |bfVar#51|))
                    (SETQ |ISTMP#1| (CDR |bfVar#51|))
                    (AND (CONSP |ISTMP#1|)
                         (PROGN
                          (SETQ |key| (CAR |ISTMP#1|))
                          (SETQ |t| (CDR |ISTMP#1|))
                          #1#)))
                   (NOT (EQ |d| '$))
                   (PROGN
                    (|htSayIndentRel| 15 (< 1 |count|))
                    (COND ((NULL |firstTime|) (|htSaySaturn| "\\\\ ")))
                    (|htSaySaturnAmpersand|)
                    (SETQ |firstTime| NIL)
                    (|htSay| '|{\\em | |d| '|} is |)
                    (|htSayConstructor| |key|
                     (|sublisFormal| (IFCDR |conform|) |t|))
                    (|htSayIndentRel| (- 15) (< 1 |count|))))))
            (SETQ |bfVar#52| (CDR |bfVar#52|))))
         |$whereList| NIL)
        (|htSaySaturn| "\\\\")))
      (COND
       ((AND |doc| (NOT (EQUAL |doc| ""))
             (OR
              (NOT
               (AND (CONSP |doc|) (EQ (CDR |doc|) NIL)
                    (PROGN (SETQ |d| (CAR |doc|)) #1#)))
              (NOT (EQUAL |d| ""))))
        (|htSaySaturn| "{\\em Description:}") (|htSaySaturnAmpersand|)
        (|htSayStandard| "\\newline\\tab{2}{\\em Description:}")
        (|htSayIndentRel| 15)
        (COND ((EQUAL |doc| |$charFauxNewline|) (|htSay| |$charNewline|))
              (#1#
               (SETQ |ndoc|
                       (COND
                        ((CONSP |doc|)
                         ((LAMBDA (|bfVar#54| |bfVar#53| |i|)
                            (LOOP
                             (COND
                              ((OR (ATOM |bfVar#53|)
                                   (PROGN (SETQ |i| (CAR |bfVar#53|)) NIL))
                               (RETURN (NREVERSE |bfVar#54|)))
                              (#1#
                               (SETQ |bfVar#54|
                                       (CONS
                                        (SUBSTITUTE |$charNewline|
                                                    |$charFauxNewline| |i|)
                                        |bfVar#54|))))
                             (SETQ |bfVar#53| (CDR |bfVar#53|))))
                          NIL |doc| NIL))
                        (#1#
                         (SUBSTITUTE |$charNewline| |$charFauxNewline|
                                     |doc|))))
               (|htSay| |ndoc|)))
        (|htSayIndentRel| (- 15))))
      (COND
       ((EQUAL |which| "constructor")
        (COND
         ((SETQ |abbr| (GETDATABASE |conname| 'ABBREVIATION))
          (|htSaySaturn| "\\\\") (|htSaySaturn| "{\\em Abbreviation:}")
          (|htSaySaturnAmpersand|)
          (|htSayStandard| "\\tab{2}{\\em Abbreviation:}")
          (|htSayIndentRel| 15) (|htSay| |abbr|) (|htSayIndentRel| (- 15))
          (|htSayStandard| "\\newline{}")))
        (COND
         ((AND |$saturn| (SETQ |link| (|saturnHasExamplePage| |conname|)))
          (|htSaySaturn| "\\\\") (|htSaySaturn| "{\\em Examples:}")
          (|htSaySaturnAmpersand|) (|htSayIndentRel| 15) (|htSay| "\\spadref{")
          (|htSay| (CAR (CDR |link|))) (|htSay| "}") (|htSayIndentRel| (- 15))
          (|htSayStandard| "\\newline{}")))
        (|htSaySaturn| "\\\\") (|htSaySaturn| "{\\em Source File:}")
        (|htSaySaturnAmpersand|)
        (|htSayStandard| "\\tab{2}{\\em Source File:}") (|htSayIndentRel| 15)
        (|htSaySourceFile| |conname|) (|htSayIndentRel| (- 15))))
      (COND
       ((AND |$standard| |exactlyOneOpSig|
             (SETQ |infoAlist| (|htpProperty| |htPage| '|infoAlist|)))
        (|displayInfoOp| |htPage| |infoAlist| |op| |sig|)))
      (|htSaySaturn| "\\end{tabular}")))))
 
; htSaySourceFile conname ==
;   sourceFileName := (GETDATABASE(conname,'SOURCEFILE) or '"none")
;   filename :=  extractFileNameFromPath sourceFileName
;   htMakePage [['text,'"\unixcommand{",filename,'"}{_\$AXIOM/lib/SPADEDIT ",
;               sourceFileName, '" ", conname, '"}"]]
 
(DEFUN |htSaySourceFile| (|conname|)
  (PROG (|sourceFileName| |filename|)
    (RETURN
     (PROGN
      (SETQ |sourceFileName| (OR (GETDATABASE |conname| 'SOURCEFILE) "none"))
      (SETQ |filename| (|extractFileNameFromPath| |sourceFileName|))
      (|htMakePage|
       (LIST
        (LIST '|text| "\\unixcommand{" |filename| "}{\\$AXIOM/lib/SPADEDIT "
              |sourceFileName| " " |conname| "}")))))))
 
; htSayIndentRel(n,:options) ==
;   flag := IFCAR options
;   m := ABS n
;   if flag then m := m + 2
;   if $standard then htSayStandard
;     n > 0 =>
;       flag => ['"\indent{",STRINGIMAGE m,'"}\tab{-2}"]
;       ['"\indent{",STRINGIMAGE m,'"}\tab{0}"]
;     n < 0 => ['"\indent{0}\newline "]
 
(DEFUN |htSayIndentRel| (|n| &REST |options|)
  (PROG (|flag| |m|)
    (RETURN
     (PROGN
      (SETQ |flag| (IFCAR |options|))
      (SETQ |m| (ABS |n|))
      (COND (|flag| (SETQ |m| (+ |m| 2))))
      (COND
       (|$standard|
        (|htSayStandard|
         (COND
          ((< 0 |n|)
           (COND (|flag| (LIST "\\indent{" (STRINGIMAGE |m|) "}\\tab{-2}"))
                 ('T (LIST "\\indent{" (STRINGIMAGE |m|) "}\\tab{0}"))))
          ((MINUSP |n|) (LIST "\\indent{0}\\newline "))))))))))
 
; htSayUnexposed() ==
;   htSay '"{\em *}"
;   $atLeastOneUnexposed := true
 
(DEFUN |htSayUnexposed| #1=()
  (PROG #1#
    (RETURN (PROGN (|htSay| "{\\em *}") (SETQ |$atLeastOneUnexposed| T)))))
 
; htEndTabular() ==
;   htSaySaturn '"\end{tabular}"
 
(DEFUN |htEndTabular| #1=()
  (PROG #1# (RETURN (|htSaySaturn| "\\end{tabular}"))))
 
; htPopSaturn s ==
;   pageDescription := ELT($saturnPage, 7)
;   pageDescription is [=s, :b] => SETELT($saturnPage, 7, rest pageDescription)
;   nil
 
(DEFUN |htPopSaturn| (|s|)
  (PROG (|pageDescription| |b|)
    (RETURN
     (PROGN
      (SETQ |pageDescription| (ELT |$saturnPage| 7))
      (COND
       ((AND (CONSP |pageDescription|) (EQUAL (CAR |pageDescription|) |s|)
             (PROGN (SETQ |b| (CDR |pageDescription|)) #1='T))
        (SETELT |$saturnPage| 7 (CDR |pageDescription|)))
       (#1# NIL))))))
 
; htBeginTable() ==
;   htSaySaturn '"\begin{dirlist}[lv]"
;   htSayStandard '"\table{"
 
(DEFUN |htBeginTable| #1=()
  (PROG #1#
    (RETURN
     (PROGN
      (|htSaySaturn| "\\begin{dirlist}[lv]")
      (|htSayStandard| "\\table{")))))
 
; htEndTable() ==
;   htSaySaturn '"\end{dirlist}"
;   htSayStandard '"}"
 
(DEFUN |htEndTable| #1=()
  (PROG #1#
    (RETURN (PROGN (|htSaySaturn| "\\end{dirlist}") (|htSayStandard| "}")))))
 
; htBeginMenu(kind,:options) ==
;   skip := IFCAR options
;   if $saturn then
;     kind = 'description => htSaySaturn '"\begin{description}"
;     htSaySaturn '"\begin{tabular}"
;     htSaySaturn
;       kind = 3 => '"{llp{0in}}"
;       kind = 2 => '"{lp{0in}}"
;       error nil
;   null skip => htSayStandard '"\beginmenu "
;   nil
 
(DEFUN |htBeginMenu| (|kind| &REST |options|)
  (PROG (|skip|)
    (RETURN
     (PROGN
      (SETQ |skip| (IFCAR |options|))
      (COND
       (|$saturn|
        (COND
         ((EQ |kind| '|description|) (|htSaySaturn| "\\begin{description}"))
         (#1='T
          (PROGN
           (|htSaySaturn| "\\begin{tabular}")
           (|htSaySaturn|
            (COND ((EQL |kind| 3) "{llp{0in}}") ((EQL |kind| 2) "{lp{0in}}")
                  (#1# (|error| NIL)))))))))
      (COND ((NULL |skip|) (|htSayStandard| "\\beginmenu ")) (#1# NIL))))))
 
; htEndMenu(kind) ==
;   if $saturn then
;     kind = 'description => htSaySaturn '"\end{description}"
;     htPopSaturn '"\\"
;     htSaySaturn '"\end{tabular}"
;   htSayStandard '"\endmenu "
 
(DEFUN |htEndMenu| (|kind|)
  (PROG ()
    (RETURN
     (PROGN
      (COND
       (|$saturn|
        (COND ((EQ |kind| '|description|) (|htSaySaturn| "\\end{description}"))
              ('T
               (PROGN
                (|htPopSaturn| "\\\\")
                (|htSaySaturn| "\\end{tabular}"))))))
      (|htSayStandard| "\\endmenu ")))))
 
; htSayConstructorName(nameShown, name) ==
;   if $saturn then
;     code := ['"(|conPage| '|", name, '"|)"]
;     htSaySaturn mkDocLink(code,nameShown)
;   if $standard then
;     htSayStandard ["\lispdownlink{",nameShown,'"}{(|conPage| '|",name,'"|)}"]
 
(DEFUN |htSayConstructorName| (|nameShown| |name|)
  (PROG (|code|)
    (RETURN
     (PROGN
      (COND
       (|$saturn| (SETQ |code| (LIST "(|conPage| '|" |name| "|)"))
        (|htSaySaturn| (|mkDocLink| |code| |nameShown|))))
      (COND
       (|$standard|
        (|htSayStandard|
         (LIST '|\\lispdownlink{| |nameShown| "}{(|conPage| '|" |name|
               "|)}"))))))))
 
; htAddHeading(title) ==
;   htNewPage title
;   page()
 
(DEFUN |htAddHeading| (|title|)
  (PROG () (RETURN (PROGN (|htNewPage| |title|) (|page|)))))
 
; htNewPage title ==
;   if $saturn then
;     htSaySaturn '"\browseTitle{"
;     htSaySaturn title
;     htSaySaturn '"}"
;   if $standard then htSayStandard('"\begin{page}{", htpName $curPage, '"}{")
;   htSayStandard title
;   htSayStandard '"}"
 
(DEFUN |htNewPage| (|title|)
  (PROG ()
    (RETURN
     (PROGN
      (COND
       (|$saturn| (|htSaySaturn| "\\browseTitle{") (|htSaySaturn| |title|)
        (|htSaySaturn| "}")))
      (COND
       (|$standard|
        (|htSayStandard| "\\begin{page}{" (|htpName| |$curPage|) "}{")))
      (|htSayStandard| |title|)
      (|htSayStandard| "}")))))
 
; mkTabularItem u == [:first u,:fn rest u] where fn x ==
;   null x => nil
;   [$saturnAmpersand, x,:fn rest x]
 
(DEFUN |mkTabularItem| (|u|)
  (PROG () (RETURN (APPEND (CAR |u|) (|mkTabularItem,fn| (CDR |u|))))))
(DEFUN |mkTabularItem,fn| (|x|)
  (PROG ()
    (RETURN
     (COND ((NULL |x|) NIL)
           ('T
            (CONS |$saturnAmpersand|
                  (CONS |x| (|mkTabularItem,fn| (CDR |x|)))))))))
 
; htSaySaturnAmpersand() == htSaySaturn $saturnAmpersand
 
(DEFUN |htSaySaturnAmpersand| #1=()
  (PROG #1# (RETURN (|htSaySaturn| |$saturnAmpersand|))))
 
; htBlank(:options) ==
;   options is [n] =>
;     htSaySaturn("STRCONC"/['"\phantom{*}" for i in 1..n])
;     htSayStandard STRCONC('"\space{",STRINGIMAGE n,'"}")
;   htSaySaturn '"\phantom{*}"
;   htSayStandard '"\space{1}"
 
(DEFUN |htBlank| (&REST |options|)
  (PROG (|n|)
    (RETURN
     (COND
      ((AND (CONSP |options|) (EQ (CDR |options|) NIL)
            (PROGN (SETQ |n| (CAR |options|)) #1='T))
       (PROGN
        (|htSaySaturn|
         ((LAMBDA (|bfVar#55| |i|)
            (LOOP
             (COND ((> |i| |n|) (RETURN |bfVar#55|))
                   (#1# (SETQ |bfVar#55| (STRCONC |bfVar#55| "\\phantom{*}"))))
             (SETQ |i| (+ |i| 1))))
          "" 1))
        (|htSayStandard| (STRCONC "\\space{" (STRINGIMAGE |n|) "}"))))
      (#1#
       (PROGN
        (|htSaySaturn| "\\phantom{*}")
        (|htSayStandard| "\\space{1}")))))))
 
; unTab s ==
;   STRINGP s => unTab1 s
;   atom s => s
;   [unTab1 first s, :rest s]
 
(DEFUN |unTab| (|s|)
  (PROG ()
    (RETURN
     (COND ((STRINGP |s|) (|unTab1| |s|)) ((ATOM |s|) |s|)
           ('T (CONS (|unTab1| (CAR |s|)) (CDR |s|)))))))
 
; unTab1 s ==
;   STRING_<('"\tab{", s) = 5 and (k := charPosition(char '_}, s, 4)) =>
;       SUBSTRING(s, k + 1, nil)
;   s
 
(DEFUN |unTab1| (|s|)
  (PROG (|k|)
    (RETURN
     (COND
      ((AND (EQL (STRING< "\\tab{" |s|) 5)
            (SETQ |k| (|charPosition| (|char| '}) |s| 4)))
       (SUBSTRING |s| (+ |k| 1) NIL))
      ('T |s|)))))
 
; satBreak() ==
;   htSaySaturn '"\\ "
;   htSayStandard '"\item "
 
(DEFUN |satBreak| #1=()
  (PROG #1#
    (RETURN (PROGN (|htSaySaturn| "\\\\ ") (|htSayStandard| "\\item ")))))
 
; htBigSkip() ==
;   htSaySaturn '"\bigskip{}"
;   htSayStandard '"\vspace{1}\newline "
 
(DEFUN |htBigSkip| #1=()
  (PROG #1#
    (RETURN
     (PROGN
      (|htSaySaturn| "\\bigskip{}")
      (|htSayStandard| "\\vspace{1}\\newline ")))))
 
; htSaturnBreak() == htSaySaturn '"\!"
 
(DEFUN |htSaturnBreak| #1=() (PROG #1# (RETURN (|htSaySaturn| "\\!"))))
 
; satDownLink(s,code) ==
;   htSaySaturn '"\lispFunctionLink{\verb!"
;   htSaySaturn code
;   htSaySaturn '"!}{"
;   htSaySaturn s
;   htSaySaturn '"}"
;   ------------------
;   htSayStandard '"\lispdownlink{"
;   htSayStandard s
;   htSayStandard '"}{"
;   htSayStandard code
;   htSayStandard '"}"
 
(DEFUN |satDownLink| (|s| |code|)
  (PROG ()
    (RETURN
     (PROGN
      (|htSaySaturn| "\\lispFunctionLink{\\verb!")
      (|htSaySaturn| |code|)
      (|htSaySaturn| "!}{")
      (|htSaySaturn| |s|)
      (|htSaySaturn| "}")
      (|htSayStandard| "\\lispdownlink{")
      (|htSayStandard| |s|)
      (|htSayStandard| "}{")
      (|htSayStandard| |code|)
      (|htSayStandard| "}")))))
 
; satTypeDownLink(s,code) ==
;   htSaySaturn '"\lispLink[d]{\verb!"
;   htSaySaturn code
;   htSaySaturn '"!}{"
;   htSaySaturn s
;   htSaySaturn '"}"
;   ------------------
;   htSayStandard '"\lispdownlink{"
;   htSayStandard s
;   htSayStandard '"}{"
;   htSayStandard code
;   htSayStandard '"}"
 
(DEFUN |satTypeDownLink| (|s| |code|)
  (PROG ()
    (RETURN
     (PROGN
      (|htSaySaturn| "\\lispLink[d]{\\verb!")
      (|htSaySaturn| |code|)
      (|htSaySaturn| "!}{")
      (|htSaySaturn| |s|)
      (|htSaySaturn| "}")
      (|htSayStandard| "\\lispdownlink{")
      (|htSayStandard| |s|)
      (|htSayStandard| "}{")
      (|htSayStandard| |code|)
      (|htSayStandard| "}")))))
 
; mkButtonBox n == STRCONC('"\buttonbox{", STRINGIMAGE n, '"}")
 
(DEFUN |mkButtonBox| (|n|)
  (PROG () (RETURN (STRCONC "\\buttonbox{" (STRINGIMAGE |n|) "}"))))
 
; purgeNewConstructorLines(lines, conlist) ==
;   [x for x in lines | not screenLocalLine(x, conlist)]
 
(DEFUN |purgeNewConstructorLines| (|lines| |conlist|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#57| |bfVar#56| |x|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#56|) (PROGN (SETQ |x| (CAR |bfVar#56|)) NIL))
           (RETURN (NREVERSE |bfVar#57|)))
          ('T
           (AND (NULL (|screenLocalLine| |x| |conlist|))
                (SETQ |bfVar#57| (CONS |x| |bfVar#57|)))))
         (SETQ |bfVar#56| (CDR |bfVar#56|))))
      NIL |lines| NIL))))
 
; screenLocalLine(line, conlist) ==
;   k := dbKind line
;   con := INTERN
;     k = char 'o or k = char 'a =>
;       s := dbPart(line,5,1)
;       k := charPosition(char '_(,s,1)
;       SUBSTRING(s,1,k - 1)
;     dbName line
;   MEMQ(con, conlist)
 
(DEFUN |screenLocalLine| (|line| |conlist|)
  (PROG (|k| |s| |con|)
    (RETURN
     (PROGN
      (SETQ |k| (|dbKind| |line|))
      (SETQ |con|
              (INTERN
               (COND
                ((OR (EQUAL |k| (|char| '|o|)) (EQUAL |k| (|char| '|a|)))
                 (PROGN
                  (SETQ |s| (|dbPart| |line| 5 1))
                  (SETQ |k| (|charPosition| (|char| '|(|) |s| 1))
                  (SUBSTRING |s| 1 (- |k| 1))))
                ('T (|dbName| |line|)))))
      (MEMQ |con| |conlist|)))))
 
; purgeLocalLibdb() ==   --called by the user through a clear command?
;   $newConstructorList := nil
;   deleteFile '"libdb.text"
 
(DEFUN |purgeLocalLibdb| #1=()
  (PROG #1#
    (RETURN
     (PROGN (SETQ |$newConstructorList| NIL) (|deleteFile| "libdb.text")))))
