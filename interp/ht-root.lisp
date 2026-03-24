
; )package "BOOT"

(IN-PACKAGE "BOOT")

; $historyDisplayWidth := 120

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$historyDisplayWidth| 120))

; downlink page ==
;   htInitPage('"Bridge",nil)
;   htSayList(['"\replacepage{", page, '"}"])
;   htShowPage()

(DEFUN |downlink| (|page|)
  (PROG ()
    (RETURN
     (PROGN
      (|htInitPage| "Bridge" NIL)
      (|htSayList| (LIST "\\replacepage{" |page| "}"))
      (|htShowPage|)))))

; dbNonEmptyPattern pattern ==
;   null pattern => '"*"
;   pattern := STRINGIMAGE pattern
;   #pattern > 0 => pattern
;   '"*"

(DEFUN |dbNonEmptyPattern| (|pattern|)
  (PROG ()
    (RETURN
     (COND ((NULL |pattern|) "*")
           (#1='T
            (PROGN
             (SETQ |pattern| (STRINGIMAGE |pattern|))
             (COND ((< 0 (LENGTH |pattern|)) |pattern|) (#1# "*"))))))))

; htSystemVariables() == main where
;   main ==
;     not $fullScreenSysVars => htSetVars()
;     classlevel := $UserLevel
;     $levels : local := '(compiler development interpreter)
;     $heading  : local := nil
;     while classlevel ~= first $levels repeat $levels := rest $levels
;     table := NREVERSE fn($setOptions,nil,true)
;     htInitPage('"System Variables",nil)
;     htSay '"\beginmenu"
;     lastHeading := nil
;     for [heading,name,message,.,key,variable,options,func] in table repeat
;       htSay('"\newline\item ")
;       if heading = lastHeading then htSay '"\tab{8}" else
;         htSayList([heading, '"\tab{8}"])
;         lastHeading := heading
;       htSayList(['"{\em ", name, "}\tab{22}", message])
;       htSay('"\tab{80}")
;       key = 'FUNCTION =>
;          null options => htMakePage [['bcLinks,['"reset",'"",func]]]
;          [msg,class,var,valuesOrFunction,:.] := first options  --skip first message
;          functionTail(name,class,var,valuesOrFunction)
;          for option in rest options repeat
;            option is ['break,:.] => 'skip
;            [msg,class,var,valuesOrFunction,:.] := option
;            htSayList(['"\newline\tab{22}", msg,'"\tab{80}"])
;            functionTail(name,class,var,valuesOrFunction)
;       val := eval variable
;       displayOptions(name,key,variable,val,options)
;     htSay '"\endmenu"
;     htShowPage()
;   functionTail(name,class,var,valuesOrFunction) ==
;     val := eval var
;     atom valuesOrFunction =>
;       htMakePage '((domainConditions (isDomain STR (String))))
;       htMakePage [['bcLinks,['"reset",'"",'htSetSystemVariableKind,[var,name,nil]]]]
;       htMakePage [['bcStrings,[30,STRINGIMAGE val,name,valuesOrFunction]]]
;     displayOptions(name,class,var,val,valuesOrFunction)
;   displayOptions(name,class,variable,val,options) ==
;     class = 'INTEGER =>
;       htMakePage [['bcLispLinks,[[['text,options.0,'"-",options.1 or '""]],'"",'htSetSystemVariableKind,[variable,name,'PARSE_-INTEGER]]]]
;       htMakePage '((domainConditions (isDomain INT (Integer))))
;       htMakePage  [['bcStrings,[5,STRINGIMAGE val,name,'INT]]]
;     class = 'STRING =>
;       htSayList ['"{\em ", val, '"}\space{1}"]
;     for x in options repeat
;       val = x or val = true and x = 'on or null val and x = 'off =>
;         htSayList ['"{\em ", x, '"}\space{1}"]
;       htMakePage [['bcLispLinks,[x,'" ",'htSetSystemVariable,[variable,x]]]]
;   fn(t,al,firstTime) ==
;     atom t => al
;     if firstTime then $heading := opOf first t
;     fn(rest t,gn(first t,al),firstTime)
;   gn(t,al) ==
;     [.,.,class,key,.,options,:.] := t
;     not MEMQ(class,$levels) => al
;     key = 'LITERALS or key = 'INTEGER or key = 'STRING => [[$heading,:t],:al]
;     key = 'TREE => fn(options,al,false)
;     key = 'FUNCTION => [[$heading,:t],:al]
;     systemError key

(DEFUN |htSystemVariables| ()
  (PROG (|$heading| |$levels| |classlevel| |table| |lastHeading| |heading|
         |ISTMP#1| |name| |ISTMP#2| |message| |ISTMP#3| |ISTMP#4| |key|
         |ISTMP#5| |variable| |ISTMP#6| |options| |ISTMP#7| |func| |LETTMP#1|
         |msg| |class| |var| |valuesOrFunction| |val|)
    (DECLARE (SPECIAL |$heading| |$levels|))
    (RETURN
     (COND ((NULL |$fullScreenSysVars|) (|htSetVars|))
           (#1='T
            (PROGN
             (SETQ |classlevel| |$UserLevel|)
             (SETQ |$levels| '(|compiler| |development| |interpreter|))
             (SETQ |$heading| NIL)
             ((LAMBDA ()
                (LOOP
                 (COND ((EQUAL |classlevel| (CAR |$levels|)) (RETURN NIL))
                       (#1# (SETQ |$levels| (CDR |$levels|)))))))
             (SETQ |table|
                     (NREVERSE (|htSystemVariables,fn| |$setOptions| NIL T)))
             (|htInitPage| "System Variables" NIL)
             (|htSay| "\\beginmenu")
             (SETQ |lastHeading| NIL)
             ((LAMBDA (|bfVar#2| |bfVar#1|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#2|)
                       (PROGN (SETQ |bfVar#1| (CAR |bfVar#2|)) NIL))
                   (RETURN NIL))
                  (#1#
                   (AND (CONSP |bfVar#1|)
                        (PROGN
                         (SETQ |heading| (CAR |bfVar#1|))
                         (SETQ |ISTMP#1| (CDR |bfVar#1|))
                         (AND (CONSP |ISTMP#1|)
                              (PROGN
                               (SETQ |name| (CAR |ISTMP#1|))
                               (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                               (AND (CONSP |ISTMP#2|)
                                    (PROGN
                                     (SETQ |message| (CAR |ISTMP#2|))
                                     (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                                     (AND (CONSP |ISTMP#3|)
                                          (PROGN
                                           (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                                           (AND (CONSP |ISTMP#4|)
                                                (PROGN
                                                 (SETQ |key| (CAR |ISTMP#4|))
                                                 (SETQ |ISTMP#5|
                                                         (CDR |ISTMP#4|))
                                                 (AND (CONSP |ISTMP#5|)
                                                      (PROGN
                                                       (SETQ |variable|
                                                               (CAR |ISTMP#5|))
                                                       (SETQ |ISTMP#6|
                                                               (CDR |ISTMP#5|))
                                                       (AND (CONSP |ISTMP#6|)
                                                            (PROGN
                                                             (SETQ |options|
                                                                     (CAR
                                                                      |ISTMP#6|))
                                                             (SETQ |ISTMP#7|
                                                                     (CDR
                                                                      |ISTMP#6|))
                                                             (AND
                                                              (CONSP |ISTMP#7|)
                                                              (EQ
                                                               (CDR |ISTMP#7|)
                                                               NIL)
                                                              (PROGN
                                                               (SETQ |func|
                                                                       (CAR
                                                                        |ISTMP#7|))
                                                               #1#)))))))))))))))
                        (PROGN
                         (|htSay| "\\newline\\item ")
                         (COND
                          ((EQUAL |heading| |lastHeading|)
                           (|htSay| "\\tab{8}"))
                          (#1# (|htSayList| (LIST |heading| "\\tab{8}"))
                           (SETQ |lastHeading| |heading|)))
                         (|htSayList|
                          (LIST "{\\em " |name| '|}\\tab{22}| |message|))
                         (|htSay| "\\tab{80}")
                         (COND
                          ((EQ |key| 'FUNCTION)
                           (COND
                            ((NULL |options|)
                             (|htMakePage|
                              (LIST
                               (LIST '|bcLinks| (LIST "reset" "" |func|)))))
                            (#1#
                             (PROGN
                              (SETQ |LETTMP#1| (CAR |options|))
                              (SETQ |msg| (CAR |LETTMP#1|))
                              (SETQ |class| (CADR |LETTMP#1|))
                              (SETQ |var| (CADDR |LETTMP#1|))
                              (SETQ |valuesOrFunction| (CADDDR |LETTMP#1|))
                              (|htSystemVariables,functionTail| |name| |class|
                               |var| |valuesOrFunction|)
                              ((LAMBDA (|bfVar#3| |option|)
                                 (LOOP
                                  (COND
                                   ((OR (ATOM |bfVar#3|)
                                        (PROGN
                                         (SETQ |option| (CAR |bfVar#3|))
                                         NIL))
                                    (RETURN NIL))
                                   (#1#
                                    (COND
                                     ((AND (CONSP |option|)
                                           (EQ (CAR |option|) '|break|))
                                      '|skip|)
                                     (#1#
                                      (PROGN
                                       (SETQ |msg| (CAR |option|))
                                       (SETQ |class| (CADR |option|))
                                       (SETQ |var| (CADDR |option|))
                                       (SETQ |valuesOrFunction|
                                               (CADDDR |option|))
                                       (|htSayList|
                                        (LIST "\\newline\\tab{22}" |msg|
                                              "\\tab{80}"))
                                       (|htSystemVariables,functionTail| |name|
                                        |class| |var| |valuesOrFunction|))))))
                                  (SETQ |bfVar#3| (CDR |bfVar#3|))))
                               (CDR |options|) NIL)))))
                          (#1#
                           (PROGN
                            (SETQ |val| (|eval| |variable|))
                            (|htSystemVariables,displayOptions| |name| |key|
                             |variable| |val| |options|))))))))
                 (SETQ |bfVar#2| (CDR |bfVar#2|))))
              |table| NIL)
             (|htSay| "\\endmenu")
             (|htShowPage|)))))))
(DEFUN |htSystemVariables,functionTail|
       (|name| |class| |var| |valuesOrFunction|)
  (PROG (|val|)
    (RETURN
     (PROGN
      (SETQ |val| (|eval| |var|))
      (COND
       ((ATOM |valuesOrFunction|)
        (PROGN
         (|htMakePage| '((|domainConditions| (|isDomain| STR (|String|)))))
         (|htMakePage|
          (LIST
           (LIST '|bcLinks|
                 (LIST "reset" "" '|htSetSystemVariableKind|
                       (LIST |var| |name| NIL)))))
         (|htMakePage|
          (LIST
           (LIST '|bcStrings|
                 (LIST 30 (STRINGIMAGE |val|) |name| |valuesOrFunction|))))))
       ('T
        (|htSystemVariables,displayOptions| |name| |class| |var| |val|
         |valuesOrFunction|)))))))
(DEFUN |htSystemVariables,displayOptions|
       (|name| |class| |variable| |val| |options|)
  (PROG ()
    (RETURN
     (COND
      ((EQ |class| 'INTEGER)
       (PROGN
        (|htMakePage|
         (LIST
          (LIST '|bcLispLinks|
                (LIST
                 (LIST
                  (LIST '|text| (ELT |options| 0) "-"
                        (OR (ELT |options| 1) "")))
                 "" '|htSetSystemVariableKind|
                 (LIST |variable| |name| 'PARSE-INTEGER)))))
        (|htMakePage| '((|domainConditions| (|isDomain| INT (|Integer|)))))
        (|htMakePage|
         (LIST (LIST '|bcStrings| (LIST 5 (STRINGIMAGE |val|) |name| 'INT))))))
      ((EQ |class| 'STRING) (|htSayList| (LIST "{\\em " |val| "}\\space{1}")))
      (#1='T
       ((LAMBDA (|bfVar#4| |x|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#4|) (PROGN (SETQ |x| (CAR |bfVar#4|)) NIL))
             (RETURN NIL))
            (#1#
             (COND
              ((OR (EQUAL |val| |x|) (AND (EQUAL |val| T) (EQ |x| '|on|))
                   (AND (NULL |val|) (EQ |x| '|off|)))
               (|htSayList| (LIST "{\\em " |x| "}\\space{1}")))
              (#1#
               (|htMakePage|
                (LIST
                 (LIST '|bcLispLinks|
                       (LIST |x| " " '|htSetSystemVariable|
                             (LIST |variable| |x|)))))))))
           (SETQ |bfVar#4| (CDR |bfVar#4|))))
        |options| NIL))))))
(DEFUN |htSystemVariables,fn| (|t| |al| |firstTime|)
  (PROG ()
    (RETURN
     (COND ((ATOM |t|) |al|)
           ('T
            (PROGN
             (COND (|firstTime| (SETQ |$heading| (|opOf| (CAR |t|)))))
             (|htSystemVariables,fn| (CDR |t|)
              (|htSystemVariables,gn| (CAR |t|) |al|) |firstTime|)))))))
(DEFUN |htSystemVariables,gn| (|t| |al|)
  (PROG (|class| |key| |options|)
    (RETURN
     (PROGN
      (SETQ |class| (CADDR |t|))
      (SETQ |key| (CADDDR |t|))
      (SETQ |options| (CADR (CDDDDR |t|)))
      (COND ((NULL (MEMQ |class| |$levels|)) |al|)
            ((OR (EQ |key| 'LITERALS) (EQ |key| 'INTEGER) (EQ |key| 'STRING))
             (CONS (CONS |$heading| |t|) |al|))
            ((EQ |key| 'TREE) (|htSystemVariables,fn| |options| |al| NIL))
            ((EQ |key| 'FUNCTION) (CONS (CONS |$heading| |t|) |al|))
            ('T (|systemError| |key|)))))))

; htSetSystemVariableKind(htPage,[variable,name,fun]) ==
;   value := htpLabelInputString(htPage,name)
;   if STRINGP value and fun then value := FUNCALL(fun,value)
; --SCM::what to do???  if not FIXP value then userError ???
;   SET(variable,value)
;   htSystemVariables ()

(DEFUN |htSetSystemVariableKind| (|htPage| |bfVar#5|)
  (PROG (|variable| |name| |fun| |value|)
    (RETURN
     (PROGN
      (SETQ |variable| (CAR |bfVar#5|))
      (SETQ |name| (CADR . #1=(|bfVar#5|)))
      (SETQ |fun| (CADDR . #1#))
      (SETQ |value| (|htpLabelInputString| |htPage| |name|))
      (COND
       ((AND (STRINGP |value|) |fun|) (SETQ |value| (FUNCALL |fun| |value|))))
      (SET |variable| |value|)
      (|htSystemVariables|)))))

; htSetSystemVariable(htPage,[name,value]) ==
;   value :=
;     value = 'on => true
;     value = 'off => nil
;     value
;   SET(name,value)
;   htSystemVariables ()

(DEFUN |htSetSystemVariable| (|htPage| |bfVar#6|)
  (PROG (|name| |value|)
    (RETURN
     (PROGN
      (SETQ |name| (CAR |bfVar#6|))
      (SETQ |value| (CADR |bfVar#6|))
      (SETQ |value|
              (COND ((EQ |value| '|on|) T) ((EQ |value| '|off|) NIL)
                    ('T |value|)))
      (SET |name| |value|)
      (|htSystemVariables|)))))

; htGloss(pattern) == htGlossPage(nil,dbNonEmptyPattern pattern or '"*",true)

(DEFUN |htGloss| (|pattern|)
  (PROG ()
    (RETURN (|htGlossPage| NIL (OR (|dbNonEmptyPattern| |pattern|) "*") T))))

; htGlossPage(htPage,pattern,tryAgain?) ==
;   $wildCard: local := char '_*
;   pattern = '"*" => downlink 'GlossaryPage
;   filter := pmTransFilter pattern
;   grepForm := mkGrepPattern(filter,'none)
;   $key: local := 'none
;   $localLibdb : local := []
;   results := applyGrep(grepForm,'gloss)
;   defstream := MAKE_INSTREAM(STRCONC($spadroot,
;                                      '"/algebra/glossdef.text"))
;   lines := gatherGlossLines(results,defstream)
;   heading :=
;     pattern = '"" => '"Glossary"
;     null lines => ['"No glossary items match {\em ",pattern,'"}"]
;     ['"Glossary items matching {\em ",pattern,'"}"]
;   null lines =>
;     tryAgain? and #pattern > 0 =>
;       (pattern.(k := MAXINDEX(pattern))) = char 's =>
;         htGlossPage(htPage,SUBSTRING(pattern,0,k),true)
;       UPPER_-CASE_-P pattern.0 =>
;         htGlossPage(htPage,DOWNCASE pattern,false)
;       errorPage(htPage,['"Sorry",nil,['"\centerline{",:heading,'"}"]])
;     errorPage(htPage,['"Sorry",nil,['"\centerline{",:heading,'"}"]])
;   htInitPageNoScroll(nil,heading)
;   htSay('"\beginscroll\beginmenu")
;   for line in lines repeat
;     tick := charPosition($tick,line,1)
;     htSayList(['"\item{\em \menuitemstyle{}}\tab{0}{\em ",
;                escapeString SUBSTRING(line,0,tick),'"} ",
;                SUBSTRING(line,tick + 1,nil)])
;   htSay '"\endmenu "
;   htSay '"\endscroll\newline "
;   htMakePage [['bcLinks,['"Search",'"",'htGlossSearch,nil]]]
;   htSay '" for glossary entry matching "
;   htMakePage [['bcStrings, [24,'"*",'filter,'EM]]]
;   htShowPageNoScroll()

(DEFUN |htGlossPage| (|htPage| |pattern| |tryAgain?|)
  (PROG (|$localLibdb| |$key| |$wildCard| |tick| |k| |heading| |lines|
         |defstream| |results| |grepForm| |filter|)
    (DECLARE (SPECIAL |$localLibdb| |$key| |$wildCard|))
    (RETURN
     (PROGN
      (SETQ |$wildCard| (|char| '*))
      (COND ((EQUAL |pattern| "*") (|downlink| '|GlossaryPage|))
            (#1='T
             (PROGN
              (SETQ |filter| (|pmTransFilter| |pattern|))
              (SETQ |grepForm| (|mkGrepPattern| |filter| '|none|))
              (SETQ |$key| '|none|)
              (SETQ |$localLibdb| NIL)
              (SETQ |results| (|applyGrep| |grepForm| '|gloss|))
              (SETQ |defstream|
                      (MAKE_INSTREAM
                       (STRCONC |$spadroot| "/algebra/glossdef.text")))
              (SETQ |lines| (|gatherGlossLines| |results| |defstream|))
              (SETQ |heading|
                      (COND ((EQUAL |pattern| "") "Glossary")
                            ((NULL |lines|)
                             (LIST "No glossary items match {\\em " |pattern|
                                   "}"))
                            (#1#
                             (LIST "Glossary items matching {\\em " |pattern|
                                   "}"))))
              (COND
               ((NULL |lines|)
                (COND
                 ((AND |tryAgain?| (< 0 (LENGTH |pattern|)))
                  (COND
                   ((EQUAL (ELT |pattern| (SETQ |k| (MAXINDEX |pattern|)))
                           (|char| '|s|))
                    (|htGlossPage| |htPage| (SUBSTRING |pattern| 0 |k|) T))
                   ((UPPER-CASE-P (ELT |pattern| 0))
                    (|htGlossPage| |htPage| (DOWNCASE |pattern|) NIL))
                   (#1#
                    (|errorPage| |htPage|
                     (LIST "Sorry" NIL
                           (CONS "\\centerline{"
                                 (APPEND |heading| (CONS "}" NIL))))))))
                 (#1#
                  (|errorPage| |htPage|
                   (LIST "Sorry" NIL
                         (CONS "\\centerline{"
                               (APPEND |heading| (CONS "}" NIL))))))))
               (#1#
                (PROGN
                 (|htInitPageNoScroll| NIL |heading|)
                 (|htSay| "\\beginscroll\\beginmenu")
                 ((LAMBDA (|bfVar#7| |line|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#7|)
                           (PROGN (SETQ |line| (CAR |bfVar#7|)) NIL))
                       (RETURN NIL))
                      (#1#
                       (PROGN
                        (SETQ |tick| (|charPosition| |$tick| |line| 1))
                        (|htSayList|
                         (LIST "\\item{\\em \\menuitemstyle{}}\\tab{0}{\\em "
                               (|escapeString| (SUBSTRING |line| 0 |tick|))
                               "} " (SUBSTRING |line| (+ |tick| 1) NIL))))))
                     (SETQ |bfVar#7| (CDR |bfVar#7|))))
                  |lines| NIL)
                 (|htSay| "\\endmenu ")
                 (|htSay| "\\endscroll\\newline ")
                 (|htMakePage|
                  (LIST
                   (LIST '|bcLinks| (LIST "Search" "" '|htGlossSearch| NIL))))
                 (|htSay| " for glossary entry matching ")
                 (|htMakePage|
                  (LIST (LIST '|bcStrings| (LIST 24 "*" '|filter| 'EM))))
                 (|htShowPageNoScroll|)))))))))))

; gatherGlossLines(results,defstream) ==
;   acc := nil
;   for keyline in results repeat
;     n := charPosition($tick,keyline,0)
;     keyAndTick := SUBSTRING(keyline,0,n + 1)
;     byteAddress := string2Integer SUBSTRING(keyline,n + 1,nil)
;     FILE_-POSITION(defstream,byteAddress)
;     line := read_line defstream
;     k := charPosition($tick,line,1)
;     pointer := SUBSTRING(line,0,k)
;     def := SUBSTRING(line,k + 1,nil)
;     xtralines := nil
;     while not EOFP defstream and (x := read_line defstream) and
;       (j := charPosition($tick,x,1)) and (nextPointer := SUBSTRING(x,0,j))
;         and (nextPointer = pointer) repeat
;           xtralines := [SUBSTRING(x,j + 1,nil),:xtralines]
;     acc := [STRCONC(keyAndTick,def, "STRCONC"/NREVERSE xtralines),:acc]
;   REVERSE acc

(DEFUN |gatherGlossLines| (|results| |defstream|)
  (PROG (|acc| |n| |keyAndTick| |byteAddress| |line| |k| |pointer| |def|
         |xtralines| |x| |j| |nextPointer|)
    (RETURN
     (PROGN
      (SETQ |acc| NIL)
      ((LAMBDA (|bfVar#8| |keyline|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#8|) (PROGN (SETQ |keyline| (CAR |bfVar#8|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (SETQ |n| (|charPosition| |$tick| |keyline| 0))
             (SETQ |keyAndTick| (SUBSTRING |keyline| 0 (+ |n| 1)))
             (SETQ |byteAddress|
                     (|string2Integer| (SUBSTRING |keyline| (+ |n| 1) NIL)))
             (FILE-POSITION |defstream| |byteAddress|)
             (SETQ |line| (|read_line| |defstream|))
             (SETQ |k| (|charPosition| |$tick| |line| 1))
             (SETQ |pointer| (SUBSTRING |line| 0 |k|))
             (SETQ |def| (SUBSTRING |line| (+ |k| 1) NIL))
             (SETQ |xtralines| NIL)
             ((LAMBDA ()
                (LOOP
                 (COND
                  ((NOT
                    (AND (NULL (EOFP |defstream|))
                         (SETQ |x| (|read_line| |defstream|))
                         (SETQ |j| (|charPosition| |$tick| |x| 1))
                         (SETQ |nextPointer| (SUBSTRING |x| 0 |j|))
                         (EQUAL |nextPointer| |pointer|)))
                   (RETURN NIL))
                  (#1#
                   (SETQ |xtralines|
                           (CONS (SUBSTRING |x| (+ |j| 1) NIL)
                                 |xtralines|)))))))
             (SETQ |acc|
                     (CONS
                      (STRCONC |keyAndTick| |def|
                       ((LAMBDA (|bfVar#9| |bfVar#11| |bfVar#10|)
                          (LOOP
                           (COND
                            ((OR (ATOM |bfVar#11|)
                                 (PROGN
                                  (SETQ |bfVar#10| (CAR |bfVar#11|))
                                  NIL))
                             (RETURN |bfVar#9|))
                            (#1#
                             (SETQ |bfVar#9| (STRCONC |bfVar#9| |bfVar#10|))))
                           (SETQ |bfVar#11| (CDR |bfVar#11|))))
                        "" (NREVERSE |xtralines|) NIL))
                      |acc|)))))
          (SETQ |bfVar#8| (CDR |bfVar#8|))))
       |results| NIL)
      (REVERSE |acc|)))))

; htGlossSearch(htPage,junk) ==  htGloss htpLabelInputString(htPage,'filter)

(DEFUN |htGlossSearch| (|htPage| |junk|)
  (PROG () (RETURN (|htGloss| (|htpLabelInputString| |htPage| '|filter|)))))
