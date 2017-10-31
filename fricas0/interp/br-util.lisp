 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; browserAutoloadOnceTrigger() == nil
 
(DEFUN |browserAutoloadOnceTrigger| #1=() (PROG #1# (RETURN NIL)))
 
; $includeUnexposed? := true   --default setting
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$includeUnexposed?| T))
 
; $tick := char '_`            --field separator for database files
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$tick| (|char| '|`|)))
 
; $charUnderscore := ('__)     --needed because of parser bug
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$charUnderscore| '_))
 
; $wild1 := '"[^`]*"           --phrase used to convert keys to grep strings
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$wild1| "[^`]*"))
 
; $browseCountThreshold := 10  --the maximum number of names that will display
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$browseCountThreshold| 10))
 
; $opDescriptionThreshold := 4 --if <= 4 operations with unique name, give desc
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$opDescriptionThreshold| 4))
 
; $browseMixedCase := true     --distinquish case in the browser?
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$browseMixedCase| T))
 
; $docTable := nil             --cache for documentation table
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$docTable| NIL))
 
; $conArgstrings := nil        --bound by conPage so that kPage
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$conArgstrings| NIL))
 
; $conformsAreDomains  := false     --are all arguments of a constructor given?
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$conformsAreDomains| NIL))
 
; $returnNowhereFromGoGet := false  --special branch out for goget for browser
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$returnNowhereFromGoGet| NIL))
 
; $dbDataFunctionAlist := nil       --set by dbGatherData
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$dbDataFunctionAlist| NIL))
 
; $domain   := nil             --bound in koOps
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$domain| NIL))
 
; $infovec  := nil             --bound in koOps
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$infovec| NIL))
 
; $predvec  := nil             --bound in koOps
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$predvec| NIL))
 
; $exposedOnlyIfTrue := nil    --see repeatSearch, dbShowOps, dbShowCon
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$exposedOnlyIfTrue| NIL))
 
; $bcMultipleNames := nil      --see bcNameConTable
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$bcMultipleNames| NIL))
 
; $docTableHash := MAKE_-HASHTABLE 'EQUAL  --see dbExpandOpAlistIfNecessary
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$docTableHash| (MAKE-HASHTABLE 'EQUAL)))
 
; $groupChoice := nil  --see dbShowOperationsFromConform
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$groupChoice| NIL))
 
; $pmFilterDelimiters := [char '_(,char '_),char '_ ]
 
(EVAL-WHEN (EVAL LOAD)
  (SETQ |$pmFilterDelimiters| (LIST (|char| '|(|) (|char| '|)|) (|char| '| |))))
 
; $dbKindAlist :=
;   [[char 'a,:'"attribute"],[char 'o,:'"operation"],
;     [char 'd,:'"domain"],[char 'p,:'"package"],
;       [char 'c,:'"category"],[char 'x,:'"default_ package"]]
 
(EVAL-WHEN (EVAL LOAD)
  (SETQ |$dbKindAlist|
          (LIST (CONS (|char| '|a|) "attribute")
                (CONS (|char| '|o|) "operation") (CONS (|char| '|d|) "domain")
                (CONS (|char| '|p|) "package") (CONS (|char| '|c|) "category")
                (CONS (|char| '|x|) "default package"))))
 
; $OpViewTable := '(
;   (names           "Name"      "Names"           dbShowOpNames)
;   (documentation   "Name"      "Names"           dbShowOpDocumentation)
;   (domains         "Domain"    "Domains"         dbShowOpDomains)
;   (signatures      "Signature" "Signatures"      dbShowOpSignatures)
;   (parameters      "Form"      "Forms"           dbShowOpParameters)
;   (origins         "Origin"    "Origins"         dbShowOpOrigins)
;   (implementation  nil         "Implementation Domains" dbShowOpImplementations)
;   (conditions      "Condition" "Conditions"      dbShowOpConditions))
 
(EVAL-WHEN (EVAL LOAD)
  (SETQ |$OpViewTable|
          '((|names| "Name" "Names" |dbShowOpNames|)
            (|documentation| "Name" "Names" |dbShowOpDocumentation|)
            (|domains| "Domain" "Domains" |dbShowOpDomains|)
            (|signatures| "Signature" "Signatures" |dbShowOpSignatures|)
            (|parameters| "Form" "Forms" |dbShowOpParameters|)
            (|origins| "Origin" "Origins" |dbShowOpOrigins|)
            (|implementation| |nil| "Implementation Domains"
             |dbShowOpImplementations|)
            (|conditions| "Condition" "Conditions" |dbShowOpConditions|))))
 
; bcBlankLine() == bcHt '"\vspace{1}\newline "
 
(DEFUN |bcBlankLine| #1=() (PROG #1# (RETURN (|bcHt| "\\vspace{1}\\newline "))))
 
; pluralize k ==
;   k = '"child" => '"children"
;   k = '"category" => '"categories"
;   k = '"entry" => '"entries"
;   STRCONC(k,'"s")
 
(DEFUN |pluralize| (|k|)
  (PROG ()
    (RETURN
     (COND ((EQUAL |k| "child") "children")
           ((EQUAL |k| "category") "categories")
           ((EQUAL |k| "entry") "entries") ('T (STRCONC |k| "s"))))))
 
; capitalize s ==
;   LASSOC(s,'( _
;       ("domain"   . "Domain") _
;       ("category" . "Category") _
;       ("package"  . "Package") _
;       ("default package" . "Default Package"))) or
;     res := COPY_-SEQ s
;     SETELT(res,0,UPCASE res.0)
;     res
 
(DEFUN |capitalize| (|s|)
  (PROG (|res|)
    (RETURN
     (OR
      (LASSOC |s|
       '(("domain" . "Domain") ("category" . "Category")
         ("package" . "Package") ("default package" . "Default Package")))
      (PROGN
       (SETQ |res| (COPY-SEQ |s|))
       (SETELT |res| 0 (UPCASE (ELT |res| 0)))
       |res|)))))
 
; escapeSpecialIds u ==   --very expensive function
;   x := LASSOC(u,$htCharAlist) => [x]
;   #u = 1 =>
;     member(u, $htSpecialChars) => [CONCAT('"_\", u)]
;     [u]
;   c := char u.0
;   or/[c = char y for y in $htSpecialChars] =>
;     [CONCAT('"_\",u)]
;   [u]
 
(DEFUN |escapeSpecialIds| (|u|)
  (PROG (|x| |c|)
    (RETURN
     (COND ((SETQ |x| (LASSOC |u| |$htCharAlist|)) (LIST |x|))
           ((EQL (LENGTH |u|) 1)
            (COND ((|member| |u| |$htSpecialChars|) (LIST (CONCAT "\\" |u|)))
                  (#1='T (LIST |u|))))
           (#1#
            (PROGN
             (SETQ |c| (|char| (ELT |u| 0)))
             (COND
              (((LAMBDA (|bfVar#2| |bfVar#1| |y|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#1|)
                         (PROGN (SETQ |y| (CAR |bfVar#1|)) NIL))
                     (RETURN |bfVar#2|))
                    (#1#
                     (PROGN
                      (SETQ |bfVar#2| (EQUAL |c| (|char| |y|)))
                      (COND (|bfVar#2| (RETURN |bfVar#2|))))))
                   (SETQ |bfVar#1| (CDR |bfVar#1|))))
                NIL |$htSpecialChars| NIL)
               (LIST (CONCAT "\\" |u|)))
              (#1# (LIST |u|)))))))))
 
; escapeString com ==   --this makes changes on single comment lines
; -- was htexCom
;   look := 0
;   while look repeat
;     look >= SIZE com => look := []
;     look := STRPOSL ('"${}#%", com, look, [])
;     if look then
;       com := RPLACSTR (com,look,0,'"\")  --note RPLACSTR copies!!!
;       look := look + 2
;   com
 
(DEFUN |escapeString| (|com|)
  (PROG (|look|)
    (RETURN
     (PROGN
      (SETQ |look| 0)
      ((LAMBDA ()
         (LOOP
          (COND ((NOT |look|) (RETURN NIL))
                (#1='T
                 (COND ((NOT (< |look| (SIZE |com|))) (SETQ |look| NIL))
                       (#1#
                        (PROGN
                         (SETQ |look| (STRPOSL "${}#%" |com| |look| NIL))
                         (COND
                          (|look| (SETQ |com| (RPLACSTR |com| |look| 0 "\\"))
                           (SETQ |look| (+ |look| 2))))))))))))
      |com|))))
 
; htPred2English(x,:options) ==
;   $emList :local := IFCAR options   --list of identifiers to be emphasised
;   $precList: local := '((OR 10 . "or") (AND 9 . "and")
;      (_< 5) (_<_= 5) (_> 5) (_>_= 5) (_= 5) (_^_= 5) (or 10) (and 9))
;   fn(x,100) where
;     fn(x,prec) ==
;       x is [op,:l] =>
;         LASSOC(op,$precList) is [iprec,:rename] =>
;           if iprec > prec then htSay '"("
;           fn(first l,iprec)
;           for y in rest l repeat
;             htSay('" ",rename or op,'" ")
;             fn(y,iprec)
;           if iprec > prec then htSay '")"
;         if prec < 5 then htSay '"("
;         gn(x,op,l,prec)
;         if prec < 5 then htSay '")"
;       x = 'etc => htSay '"..."
;       IDENTP x and not MEMQ(x,$emList) => htSay escapeSpecialIds PNAME x
;       htSay form2HtString(x,$emList)
;     gn(x,op,l,prec) ==
;       MEMQ(op,'(NOT not)) =>
;         htSay('"not ")
;         fn(first l,0)
;       op = 'HasCategory =>
;         bcConform(first l,$emList)
;         htSay('" has ")
;         bcConform(CADADR l,$emList)
;       op = 'HasAttribute => BREAK()
;       MEMQ(op,'(has ofCategory)) =>
;         bcConform(first l,$emList)
;         htSay('" has ")
;         [a,b] := l
;         bcConform(b, $emList)
;       bcConform(x,$emList)
 
(DEFUN |htPred2English| (|x| &REST |options|)
  (PROG (|$precList| |$emList|)
    (DECLARE (SPECIAL |$precList| |$emList|))
    (RETURN
     (PROGN
      (SETQ |$emList| (IFCAR |options|))
      (SETQ |$precList|
              '((OR 10 . "or") (AND 9 . "and") (< 5) (<= 5) (> 5) (>= 5) (= 5)
                (^= 5) (|or| 10) (|and| 9)))
      (|htPred2English,fn| |x| 100)))))
(DEFUN |htPred2English,fn| (|x| |prec|)
  (PROG (|op| |l| |ISTMP#1| |iprec| |rename|)
    (RETURN
     (COND
      ((AND (CONSP |x|)
            (PROGN (SETQ |op| (CAR |x|)) (SETQ |l| (CDR |x|)) #1='T))
       (COND
        ((PROGN
          (SETQ |ISTMP#1| (LASSOC |op| |$precList|))
          (AND (CONSP |ISTMP#1|)
               (PROGN
                (SETQ |iprec| (CAR |ISTMP#1|))
                (SETQ |rename| (CDR |ISTMP#1|))
                #1#)))
         (PROGN
          (COND ((< |prec| |iprec|) (|htSay| "(")))
          (|htPred2English,fn| (CAR |l|) |iprec|)
          ((LAMBDA (|bfVar#3| |y|)
             (LOOP
              (COND
               ((OR (ATOM |bfVar#3|) (PROGN (SETQ |y| (CAR |bfVar#3|)) NIL))
                (RETURN NIL))
               (#1#
                (PROGN
                 (|htSay| " " (OR |rename| |op|) " ")
                 (|htPred2English,fn| |y| |iprec|))))
              (SETQ |bfVar#3| (CDR |bfVar#3|))))
           (CDR |l|) NIL)
          (COND ((< |prec| |iprec|) (|htSay| ")")))))
        (#1#
         (PROGN
          (COND ((< |prec| 5) (|htSay| "(")))
          (|htPred2English,gn| |x| |op| |l| |prec|)
          (COND ((< |prec| 5) (|htSay| ")")))))))
      ((EQ |x| '|etc|) (|htSay| "..."))
      ((AND (IDENTP |x|) (NULL (MEMQ |x| |$emList|)))
       (|htSay| (|escapeSpecialIds| (PNAME |x|))))
      (#1# (|htSay| (|form2HtString| |x| |$emList|)))))))
(DEFUN |htPred2English,gn| (|x| |op| |l| |prec|)
  (PROG (|a| |b|)
    (RETURN
     (COND
      ((MEMQ |op| '(NOT |not|))
       (PROGN (|htSay| "not ") (|htPred2English,fn| (CAR |l|) 0)))
      ((EQ |op| '|HasCategory|)
       (PROGN
        (|bcConform| (CAR |l|) |$emList|)
        (|htSay| " has ")
        (|bcConform| (CADADR |l|) |$emList|)))
      ((EQ |op| '|HasAttribute|) (BREAK))
      ((MEMQ |op| '(|has| |ofCategory|))
       (PROGN
        (|bcConform| (CAR |l|) |$emList|)
        (|htSay| " has ")
        (SETQ |a| (CAR |l|))
        (SETQ |b| (CADR |l|))
        (|bcConform| |b| |$emList|)))
      ('T (|bcConform| |x| |$emList|))))))
 
; unMkEvalable u ==
;  u is ['QUOTE,a] => a
;  u is ['LIST,:r] => [unMkEvalable x for x in r]
;  u
 
(DEFUN |unMkEvalable| (|u|)
  (PROG (|ISTMP#1| |a| |r|)
    (RETURN
     (COND
      ((AND (CONSP |u|) (EQ (CAR |u|) 'QUOTE)
            (PROGN
             (SETQ |ISTMP#1| (CDR |u|))
             (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                  (PROGN (SETQ |a| (CAR |ISTMP#1|)) #1='T))))
       |a|)
      ((AND (CONSP |u|) (EQ (CAR |u|) 'LIST) (PROGN (SETQ |r| (CDR |u|)) #1#))
       ((LAMBDA (|bfVar#5| |bfVar#4| |x|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#4|) (PROGN (SETQ |x| (CAR |bfVar#4|)) NIL))
             (RETURN (NREVERSE |bfVar#5|)))
            (#1# (SETQ |bfVar#5| (CONS (|unMkEvalable| |x|) |bfVar#5|))))
           (SETQ |bfVar#4| (CDR |bfVar#4|))))
        NIL |r| NIL))
      (#1# |u|)))))
 
; args2HtString(x,:options) ==
;   null x => '""
;   emList := IFCAR options
;   SUBSTRING(form2HtString(['f,:x],emList),1,nil)
 
(DEFUN |args2HtString| (|x| &REST |options|)
  (PROG (|emList|)
    (RETURN
     (COND ((NULL |x|) "")
           ('T
            (PROGN
             (SETQ |emList| (IFCAR |options|))
             (SUBSTRING (|form2HtString| (CONS '|f| |x|) |emList|) 1 NIL)))))))
 
; quickForm2HtString(x) ==
;   atom x => STRINGIMAGE x
;   form2HtString x
 
(DEFUN |quickForm2HtString| (|x|)
  (PROG ()
    (RETURN (COND ((ATOM |x|) (STRINGIMAGE |x|)) ('T (|form2HtString| |x|))))))
 
; form2HtString(x,:options) ==
;   $emList:local := IFCAR options   --list of atoms to be emphasized
;   $brief: local := IFCAR IFCDR options --see dbShowOperationsFromConform (lib11)
;   fn(x) where
;     fn x ==
;       atom x =>
;         MEMQ(x,$FormalMapVariableList) => STRCONC('"\",STRINGIMAGE x)
;         u := escapeSpecialChars STRINGIMAGE x
;         MEMQ(x,$emList) => STRCONC('"{\em ",u,'"}")
;         STRINGP x => STRCONC('"_"",u,'"_"")
;         u
;       first x = 'QUOTE => STRCONC('"'",sexpr2HtString first rest x)
;       first x = ":" => STRCONC(fn first rest x,'": ",fn first rest rest x)
;       first x = 'Mapping =>
;         STRCONC(fnTail(rest rest x,'"()"),'"->",fn first rest x)
;       first x = 'construct => fnTail(rest x,'"[]")
;       tail := fnTail(rest x,'"()")
;       head := fn first x
; --    $brief and #head + #tail > 35 => STRCONC(head,'"(...)")
;       STRCONC(head,tail)
;     fnTail(x,str) ==
;       null x => '""
;       STRCONC(str . 0,fn first x,fnTailTail rest x,str . 1)
;     fnTailTail x ==
;       null x => '""
;       STRCONC('",",fn first x,fnTailTail rest x)
 
(DEFUN |form2HtString| (|x| &REST |options|)
  (PROG (|$brief| |$emList|)
    (DECLARE (SPECIAL |$brief| |$emList|))
    (RETURN
     (PROGN
      (SETQ |$emList| (IFCAR |options|))
      (SETQ |$brief| (IFCAR (IFCDR |options|)))
      (|form2HtString,fn| |x|)))))
(DEFUN |form2HtString,fn| (|x|)
  (PROG (|u| |tail| |head|)
    (RETURN
     (COND
      ((ATOM |x|)
       (COND
        ((MEMQ |x| |$FormalMapVariableList|) (STRCONC "\\" (STRINGIMAGE |x|)))
        (#1='T
         (PROGN
          (SETQ |u| (|escapeSpecialChars| (STRINGIMAGE |x|)))
          (COND ((MEMQ |x| |$emList|) (STRCONC "{\\em " |u| "}"))
                ((STRINGP |x|) (STRCONC "\"" |u| "\"")) (#1# |u|))))))
      ((EQ (CAR |x|) 'QUOTE) (STRCONC "'" (|sexpr2HtString| (CAR (CDR |x|)))))
      ((EQ (CAR |x|) '|:|)
       (STRCONC (|form2HtString,fn| (CAR (CDR |x|))) ": "
        (|form2HtString,fn| (CAR (CDR (CDR |x|))))))
      ((EQ (CAR |x|) '|Mapping|)
       (STRCONC (|form2HtString,fnTail| (CDR (CDR |x|)) "()") "->"
        (|form2HtString,fn| (CAR (CDR |x|)))))
      ((EQ (CAR |x|) '|construct|) (|form2HtString,fnTail| (CDR |x|) "[]"))
      (#1#
       (PROGN
        (SETQ |tail| (|form2HtString,fnTail| (CDR |x|) "()"))
        (SETQ |head| (|form2HtString,fn| (CAR |x|)))
        (STRCONC |head| |tail|)))))))
(DEFUN |form2HtString,fnTail| (|x| |str|)
  (PROG ()
    (RETURN
     (COND ((NULL |x|) "")
           ('T
            (STRCONC (ELT |str| 0) (|form2HtString,fn| (CAR |x|))
             (|form2HtString,fnTailTail| (CDR |x|)) (ELT |str| 1)))))))
(DEFUN |form2HtString,fnTailTail| (|x|)
  (PROG ()
    (RETURN
     (COND ((NULL |x|) "")
           ('T
            (STRCONC "," (|form2HtString,fn| (CAR |x|))
             (|form2HtString,fnTailTail| (CDR |x|))))))))
 
; sexpr2HtString x ==
;   atom x => form2HtString x
;   STRCONC('"(",fn x,'")") where fn x ==
;     r := rest x
;     suffix :=
;       null r => '""
;       atom r => STRCONC('" . ",form2HtString rest x)
;       STRCONC('" ",fn r)
;     STRCONC(sexpr2HtString first x,suffix)
 
(DEFUN |sexpr2HtString| (|x|)
  (PROG ()
    (RETURN
     (COND ((ATOM |x|) (|form2HtString| |x|))
           ('T (STRCONC "(" (|sexpr2HtString,fn| |x|) ")"))))))
(DEFUN |sexpr2HtString,fn| (|x|)
  (PROG (|r| |suffix|)
    (RETURN
     (PROGN
      (SETQ |r| (CDR |x|))
      (SETQ |suffix|
              (COND ((NULL |r|) "")
                    ((ATOM |r|) (STRCONC " . " (|form2HtString| (CDR |x|))))
                    ('T (STRCONC " " (|sexpr2HtString,fn| |r|)))))
      (STRCONC (|sexpr2HtString| (CAR |x|)) |suffix|)))))
 
; form2LispString(x) ==
;   atom x =>
;     x = '_$ => '"__$"
;     MEMQ(x,$FormalMapVariableList) => STRCONC(STRINGIMAGE '__, STRINGIMAGE x)
;     STRINGP x => STRCONC('"_"",STRINGIMAGE x,'"_"")
;     STRINGIMAGE x
;   x is ['QUOTE,a] => STRCONC('"'",sexpr2LispString a)
;   x is [":",a,b] => STRCONC(form2LispString a,'":",form2LispString b)
;   first x = 'Mapping =>
;     null rest (r := rest x) => STRCONC('"()->",form2LispString first r)
;     STRCONC(args2LispString rest r,'"->",form2LispString first r)
;   STRCONC(form2LispString first x,args2LispString rest x)
 
(DEFUN |form2LispString| (|x|)
  (PROG (|ISTMP#1| |a| |ISTMP#2| |b| |r|)
    (RETURN
     (COND
      ((ATOM |x|)
       (COND ((EQ |x| '$) "_$")
             ((MEMQ |x| |$FormalMapVariableList|)
              (STRCONC (STRINGIMAGE '_) (STRINGIMAGE |x|)))
             ((STRINGP |x|) (STRCONC "\"" (STRINGIMAGE |x|) "\""))
             (#1='T (STRINGIMAGE |x|))))
      ((AND (CONSP |x|) (EQ (CAR |x|) 'QUOTE)
            (PROGN
             (SETQ |ISTMP#1| (CDR |x|))
             (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                  (PROGN (SETQ |a| (CAR |ISTMP#1|)) #1#))))
       (STRCONC "'" (|sexpr2LispString| |a|)))
      ((AND (CONSP |x|) (EQ (CAR |x|) '|:|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |x|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |a| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN (SETQ |b| (CAR |ISTMP#2|)) #1#))))))
       (STRCONC (|form2LispString| |a|) ":" (|form2LispString| |b|)))
      ((EQ (CAR |x|) '|Mapping|)
       (COND
        ((NULL (CDR (SETQ |r| (CDR |x|))))
         (STRCONC "()->" (|form2LispString| (CAR |r|))))
        (#1#
         (STRCONC (|args2LispString| (CDR |r|)) "->"
          (|form2LispString| (CAR |r|))))))
      (#1#
       (STRCONC (|form2LispString| (CAR |x|))
        (|args2LispString| (CDR |x|))))))))
 
; sexpr2LispString x ==
;   atom x => form2LispString x
;   STRCONC('"(",fn x,'")") where fn x ==
;     r := rest x
;     suffix :=
;       null r => '""
;       atom r => STRCONC('" . ",form2LispString rest x)
;       STRCONC('" ",fn r)
;     STRCONC(sexpr2HtString first x,suffix)
 
(DEFUN |sexpr2LispString| (|x|)
  (PROG ()
    (RETURN
     (COND ((ATOM |x|) (|form2LispString| |x|))
           ('T (STRCONC "(" (|sexpr2LispString,fn| |x|) ")"))))))
(DEFUN |sexpr2LispString,fn| (|x|)
  (PROG (|r| |suffix|)
    (RETURN
     (PROGN
      (SETQ |r| (CDR |x|))
      (SETQ |suffix|
              (COND ((NULL |r|) "")
                    ((ATOM |r|) (STRCONC " . " (|form2LispString| (CDR |x|))))
                    ('T (STRCONC " " (|sexpr2LispString,fn| |r|)))))
      (STRCONC (|sexpr2HtString| (CAR |x|)) |suffix|)))))
 
; args2LispString x ==
;   null x => '""
;   STRCONC('"(",form2LispString first x,fnTailTail rest x,'")") where
;     fnTailTail x ==
;       null x => '""
;       STRCONC('",",form2LispString first x,fnTailTail rest x)
 
(DEFUN |args2LispString| (|x|)
  (PROG ()
    (RETURN
     (COND ((NULL |x|) "")
           ('T
            (STRCONC "(" (|form2LispString| (CAR |x|))
             (|args2LispString,fnTailTail| (CDR |x|)) ")"))))))
(DEFUN |args2LispString,fnTailTail| (|x|)
  (PROG ()
    (RETURN
     (COND ((NULL |x|) "")
           ('T
            (STRCONC "," (|form2LispString| (CAR |x|))
             (|args2LispString,fnTailTail| (CDR |x|))))))))
 
; dbConstructorKind x ==
;   target := CADAR GETDATABASE(x,'CONSTRUCTORMODEMAP)
;   target = '(Category) => 'category
;   target is ['CATEGORY,'package,:.] => 'package
;   HGET($defaultPackageNamesHT,x) => 'default_ package
;   'domain
 
(DEFUN |dbConstructorKind| (|x|)
  (PROG (|target| |ISTMP#1|)
    (RETURN
     (PROGN
      (SETQ |target| (CADAR (GETDATABASE |x| 'CONSTRUCTORMODEMAP)))
      (COND ((EQUAL |target| '(|Category|)) '|category|)
            ((AND (CONSP |target|) (EQ (CAR |target|) 'CATEGORY)
                  (PROGN
                   (SETQ |ISTMP#1| (CDR |target|))
                   (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|package|))))
             '|package|)
            ((HGET |$defaultPackageNamesHT| |x|) '|default package|)
            ('T '|domain|))))))
 
; getConstructorForm name ==
;   name = 'Union   => '(Union  (_: a A) (_: b B))
;   name = 'UntaggedUnion => '(Union A B)
;   name = 'Record  => '(Record (_: a A) (_: b B))
;   name = 'Mapping => '(Mapping T S)
;   name = 'Enumeration => '(Enumeration a b)
;   GETDATABASE(name,'CONSTRUCTORFORM)
 
(DEFUN |getConstructorForm| (|name|)
  (PROG ()
    (RETURN
     (COND ((EQ |name| '|Union|) '(|Union| (|:| |a| A) (|:| |b| B)))
           ((EQ |name| '|UntaggedUnion|) '(|Union| A B))
           ((EQ |name| '|Record|) '(|Record| (|:| |a| A) (|:| |b| B)))
           ((EQ |name| '|Mapping|) '(|Mapping| T S))
           ((EQ |name| '|Enumeration|) '(|Enumeration| |a| |b|))
           ('T (GETDATABASE |name| 'CONSTRUCTORFORM))))))
 
; getConstructorArgs conname == rest getConstructorForm conname
 
(DEFUN |getConstructorArgs| (|conname|)
  (PROG () (RETURN (CDR (|getConstructorForm| |conname|)))))
 
; bcComments(comments,:options) ==
;   italics? := not IFCAR options
;   STRINGP comments =>
;     comments = '"" => nil
;     htSay('"\newline ")
;     if italics? then htSay '"{\em "
;     htSay comments
;     if italics? then htSay '"}"
;   null comments => nil
;   htSay('"\newline ")
;   if italics? then htSay "{\em "
;   htSay first comments
;   for x in rest comments repeat htSay('" ",x)
;   if italics? then htSay '"}"
 
(DEFUN |bcComments| (|comments| &REST |options|)
  (PROG (|italics?|)
    (RETURN
     (PROGN
      (SETQ |italics?| (NULL (IFCAR |options|)))
      (COND
       ((STRINGP |comments|)
        (COND ((EQUAL |comments| "") NIL)
              (#1='T
               (PROGN
                (|htSay| "\\newline ")
                (COND (|italics?| (|htSay| "{\\em ")))
                (|htSay| |comments|)
                (COND (|italics?| (|htSay| "}")))))))
       ((NULL |comments|) NIL)
       (#1#
        (PROGN
         (|htSay| "\\newline ")
         (COND (|italics?| (|htSay| '|{\\em |)))
         (|htSay| (CAR |comments|))
         ((LAMBDA (|bfVar#6| |x|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#6|) (PROGN (SETQ |x| (CAR |bfVar#6|)) NIL))
               (RETURN NIL))
              (#1# (|htSay| " " |x|)))
             (SETQ |bfVar#6| (CDR |bfVar#6|))))
          (CDR |comments|) NIL)
         (COND (|italics?| (|htSay| "}"))))))))))
 
; bcConform1 form == main where
;     main ==
;         form is ['ifp,form1,:pred] =>
;             hd form1
;             bcPred pred
;         hd form
;     hd form ==
;         atom form =>
;             not MEMQ(form,$Primitives) and null constructor? form =>
;                 s := STRINGIMAGE form
;                 (s.0 = char '_#) =>
;                      (n := POSN1(form, $FormalFunctionParameterList)) =>
;                           htSay form2HtString ($FormalMapVariableList . n)
;                      htSay '"\"
;                      htSay form
;                 htSay escapeSpecialChars STRINGIMAGE form
;             s := STRINGIMAGE form
;             $italicHead? => htSayItalics s
;             $bcMultipleNames =>
;                 satTypeDownLink(s, ['"(|conPageChoose| '|", s, '"|)"])
;             satTypeDownLink(s, ["(|conPage| '|", s, '"|)"])
;         (head := QCAR form) = 'QUOTE =>
;             htSay('"'")
;             hd CADR form
;         head = 'SIGNATURE =>
;             htSay(CADR form,'": ")
;             mapping CADDR form
;         head = 'Mapping and rest form => mapping rest form
;         head = ":" =>
;             hd CADR form
;             htSay '": "
;             hd CADDR form
;         QCDR form and dbEvalableConstructor? form =>
;             bcConstructor(form)
;         hd head
;         null (r := QCDR form) => nil
;         tl QCDR form
;     mapping [target,:source] ==
;         tuple source
;         bcHt
;             $saturn => '" {\ttrarrow} "
;             '" -> "
;         hd target
;     tuple u ==
;         null u => bcHt '"()"
;         null rest u => hd u
;         bcHt '"("
;         hd first u
;         for x in rest u repeat
;             bcHt '","
;             hd x
;         bcHt '")"
;     tl u ==
;         bcHt '"("
;         firstTime := true
;         for x in u repeat
;             if not firstTime then bcHt '","
;             firstTime := false
;             hd x
;         bcHt '")"
;     say x ==
;         if $italics? then bcHt '"{\em "
;         if x = 'etc then x := '"..."
;         bcHt escapeSpecialIds STRINGIMAGE x
;         if $italics? then bcHt '"}"
 
(DEFUN |bcConform1| (|form|)
  (PROG (|ISTMP#1| |form1| |pred|)
    (RETURN
     (COND
      ((AND (CONSP |form|) (EQ (CAR |form|) '|ifp|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |form|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |form1| (CAR |ISTMP#1|))
                   (SETQ |pred| (CDR |ISTMP#1|))
                   #1='T))))
       (PROGN (|bcConform1,hd| |form1|) (|bcPred| |pred|)))
      (#1# (|bcConform1,hd| |form|))))))
(DEFUN |bcConform1,hd| (|form|)
  (PROG (|s| |n| |head| |r|)
    (RETURN
     (COND
      ((ATOM |form|)
       (COND
        ((AND (NULL (MEMQ |form| |$Primitives|))
              (NULL (|constructor?| |form|)))
         (PROGN
          (SETQ |s| (STRINGIMAGE |form|))
          (COND
           ((EQUAL (ELT |s| 0) (|char| '|#|))
            (COND
             ((SETQ |n| (POSN1 |form| |$FormalFunctionParameterList|))
              (|htSay| (|form2HtString| (ELT |$FormalMapVariableList| |n|))))
             (#1='T (PROGN (|htSay| "\\") (|htSay| |form|)))))
           (#1# (|htSay| (|escapeSpecialChars| (STRINGIMAGE |form|)))))))
        (#1#
         (PROGN
          (SETQ |s| (STRINGIMAGE |form|))
          (COND (|$italicHead?| (|htSayItalics| |s|))
                (|$bcMultipleNames|
                 (|satTypeDownLink| |s| (LIST "(|conPageChoose| '|" |s| "|)")))
                (#1#
                 (|satTypeDownLink| |s|
                  (LIST '|(\|conPage\| '\|| |s| "|)"))))))))
      ((EQ (SETQ |head| (QCAR |form|)) 'QUOTE)
       (PROGN (|htSay| "'") (|bcConform1,hd| (CADR |form|))))
      ((EQ |head| 'SIGNATURE)
       (PROGN
        (|htSay| (CADR |form|) ": ")
        (|bcConform1,mapping| (CADDR |form|))))
      ((AND (EQ |head| '|Mapping|) (CDR |form|))
       (|bcConform1,mapping| (CDR |form|)))
      ((EQ |head| '|:|)
       (PROGN
        (|bcConform1,hd| (CADR |form|))
        (|htSay| ": ")
        (|bcConform1,hd| (CADDR |form|))))
      ((AND (QCDR |form|) (|dbEvalableConstructor?| |form|))
       (|bcConstructor| |form|))
      (#1#
       (PROGN
        (|bcConform1,hd| |head|)
        (COND ((NULL (SETQ |r| (QCDR |form|))) NIL)
              (#1# (|bcConform1,tl| (QCDR |form|))))))))))
(DEFUN |bcConform1,mapping| (|bfVar#9|)
  (PROG (|target| |source|)
    (RETURN
     (PROGN
      (SETQ |target| (CAR |bfVar#9|))
      (SETQ |source| (CDR |bfVar#9|))
      (|bcConform1,tuple| |source|)
      (|bcHt| (COND (|$saturn| " {\\ttrarrow} ") ('T " -> ")))
      (|bcConform1,hd| |target|)))))
(DEFUN |bcConform1,tuple| (|u|)
  (PROG ()
    (RETURN
     (COND ((NULL |u|) (|bcHt| "()")) ((NULL (CDR |u|)) (|bcConform1,hd| |u|))
           (#1='T
            (PROGN
             (|bcHt| "(")
             (|bcConform1,hd| (CAR |u|))
             ((LAMBDA (|bfVar#7| |x|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#7|) (PROGN (SETQ |x| (CAR |bfVar#7|)) NIL))
                   (RETURN NIL))
                  (#1# (PROGN (|bcHt| ",") (|bcConform1,hd| |x|))))
                 (SETQ |bfVar#7| (CDR |bfVar#7|))))
              (CDR |u|) NIL)
             (|bcHt| ")")))))))
(DEFUN |bcConform1,tl| (|u|)
  (PROG (|firstTime|)
    (RETURN
     (PROGN
      (|bcHt| "(")
      (SETQ |firstTime| T)
      ((LAMBDA (|bfVar#8| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#8|) (PROGN (SETQ |x| (CAR |bfVar#8|)) NIL))
            (RETURN NIL))
           ('T
            (PROGN
             (COND ((NULL |firstTime|) (|bcHt| ",")))
             (SETQ |firstTime| NIL)
             (|bcConform1,hd| |x|))))
          (SETQ |bfVar#8| (CDR |bfVar#8|))))
       |u| NIL)
      (|bcHt| ")")))))
(DEFUN |bcConform1,say| (|x|)
  (PROG ()
    (RETURN
     (PROGN
      (COND (|$italics?| (|bcHt| "{\\em ")))
      (COND ((EQ |x| '|etc|) (SETQ |x| "...")))
      (|bcHt| (|escapeSpecialIds| (STRINGIMAGE |x|)))
      (COND (|$italics?| (|bcHt| "}")))))))
 
; bcConform(form,:options) ==
;   $italics?    : local := IFCAR options
;   $italicHead? : local := IFCAR IFCDR options
;   bcConform1 form
 
(DEFUN |bcConform| (|form| &REST |options|)
  (PROG (|$italicHead?| |$italics?|)
    (DECLARE (SPECIAL |$italicHead?| |$italics?|))
    (RETURN
     (PROGN
      (SETQ |$italics?| (IFCAR |options|))
      (SETQ |$italicHead?| (IFCAR (IFCDR |options|)))
      (|bcConform1| |form|)))))
 
; bcConstructor(form) == htSayList dbConformGen form
 
(DEFUN |bcConstructor| (|form|)
  (PROG () (RETURN (|htSayList| (|dbConformGen| |form|)))))
 
; htSayList u ==
;   for x in u repeat htSay x
 
(DEFUN |htSayList| (|u|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#10| |x|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#10|) (PROGN (SETQ |x| (CAR |bfVar#10|)) NIL))
           (RETURN NIL))
          ('T (|htSay| |x|)))
         (SETQ |bfVar#10| (CDR |bfVar#10|))))
      |u| NIL))))
 
; conform2HtString form ==
;   for u in form2String form repeat
;     htSay u
 
(DEFUN |conform2HtString| (|form|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#11| |u|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#11|) (PROGN (SETQ |u| (CAR |bfVar#11|)) NIL))
           (RETURN NIL))
          ('T (|htSay| |u|)))
         (SETQ |bfVar#11| (CDR |bfVar#11|))))
      (|form2String| |form|) NIL))))
 
; $from_show_implementations := false
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$from_show_implementations| NIL))
 
; dbEvalableConstructor? form ==
;     form is [op,:argl] =>
;         null(cosig := GETDATABASE(op, 'COSIG)) => false
;         cosig := rest cosig
;         #cosig ~= #argl => false
;         res := true
;         for x in argl for pred in cosig while res repeat
;             pred => res :=  dbEvalableConstructor? x
;             $from_show_implementations => "iterate"
;             x is ['QUOTE, y] and STRINGP(y) => "iterate"
;             res := false
;         res
;     false
 
(DEFUN |dbEvalableConstructor?| (|form|)
  (PROG (|op| |argl| |cosig| |res| |ISTMP#1| |y|)
    (RETURN
     (COND
      ((AND (CONSP |form|)
            (PROGN (SETQ |op| (CAR |form|)) (SETQ |argl| (CDR |form|)) #1='T))
       (COND ((NULL (SETQ |cosig| (GETDATABASE |op| 'COSIG))) NIL)
             (#1#
              (PROGN
               (SETQ |cosig| (CDR |cosig|))
               (COND ((NOT (EQL (LENGTH |cosig|) (LENGTH |argl|))) NIL)
                     (#1#
                      (PROGN
                       (SETQ |res| T)
                       ((LAMBDA (|bfVar#12| |x| |bfVar#13| |pred|)
                          (LOOP
                           (COND
                            ((OR (ATOM |bfVar#12|)
                                 (PROGN (SETQ |x| (CAR |bfVar#12|)) NIL)
                                 (ATOM |bfVar#13|)
                                 (PROGN (SETQ |pred| (CAR |bfVar#13|)) NIL)
                                 (NOT |res|))
                             (RETURN NIL))
                            (#1#
                             (COND
                              (|pred|
                               (SETQ |res| (|dbEvalableConstructor?| |x|)))
                              (|$from_show_implementations| '|iterate|)
                              ((AND (CONSP |x|) (EQ (CAR |x|) 'QUOTE)
                                    (PROGN
                                     (SETQ |ISTMP#1| (CDR |x|))
                                     (AND (CONSP |ISTMP#1|)
                                          (EQ (CDR |ISTMP#1|) NIL)
                                          (PROGN
                                           (SETQ |y| (CAR |ISTMP#1|))
                                           #1#)))
                                    (STRINGP |y|))
                               '|iterate|)
                              (#1# (SETQ |res| NIL)))))
                           (SETQ |bfVar#12| (CDR |bfVar#12|))
                           (SETQ |bfVar#13| (CDR |bfVar#13|))))
                        |argl| NIL |cosig| NIL)
                       |res|)))))))
      (#1# NIL)))))
 
; htSayItalics s == htSay('"{\em ",s,'"}")
 
(DEFUN |htSayItalics| (|s|) (PROG () (RETURN (|htSay| "{\\em " |s| "}"))))
 
; bcCon(name,:options) ==
;   argString := IFCAR options or '""
;   s := STRINGIMAGE name
;   bcStar name
;   htSayConstructorName(s,s)
;   htSay argString
 
(DEFUN |bcCon| (|name| &REST |options|)
  (PROG (|argString| |s|)
    (RETURN
     (PROGN
      (SETQ |argString| (OR (IFCAR |options|) ""))
      (SETQ |s| (STRINGIMAGE |name|))
      (|bcStar| |name|)
      (|htSayConstructorName| |s| |s|)
      (|htSay| |argString|)))))
 
; bcAbb(name,abb) ==
;   s := STRINGIMAGE name
;   a := STRINGIMAGE abb
;   bcStar name
;   htSayConstructorName(a,s)
 
(DEFUN |bcAbb| (|name| |abb|)
  (PROG (|s| |a|)
    (RETURN
     (PROGN
      (SETQ |s| (STRINGIMAGE |name|))
      (SETQ |a| (STRINGIMAGE |abb|))
      (|bcStar| |name|)
      (|htSayConstructorName| |a| |s|)))))
 
; bcStar name ==
;   if $includeUnexposed? and not isExposedConstructor name then htSayUnexposed()
 
(DEFUN |bcStar| (|name|)
  (PROG ()
    (RETURN
     (COND
      ((AND |$includeUnexposed?| (NULL (|isExposedConstructor| |name|)))
       (|htSayUnexposed|))))))
 
; bcStarSpace name ==
;   null $includeUnexposed? => nil
;   not isExposedConstructor name => htSayUnexposed()
;   htBlank()
 
(DEFUN |bcStarSpace| (|name|)
  (PROG ()
    (RETURN
     (COND ((NULL |$includeUnexposed?|) NIL)
           ((NULL (|isExposedConstructor| |name|)) (|htSayUnexposed|))
           ('T (|htBlank|))))))
 
; bcStarSpaceOp(op,exposed?) ==
;   null $includeUnexposed? => nil
;   not exposed? =>
;     htSayUnexposed()
;     if op.0 = char '_* then htSay '" "
;   htBlank()
 
(DEFUN |bcStarSpaceOp| (|op| |exposed?|)
  (PROG ()
    (RETURN
     (COND ((NULL |$includeUnexposed?|) NIL)
           ((NULL |exposed?|)
            (PROGN
             (|htSayUnexposed|)
             (COND ((EQUAL (ELT |op| 0) (|char| '*)) (|htSay| " ")))))
           ('T (|htBlank|))))))
 
; bcStarConform form ==
;   bcStar opOf form
;   bcConform form
 
(DEFUN |bcStarConform| (|form|)
  (PROG () (RETURN (PROGN (|bcStar| (|opOf| |form|)) (|bcConform| |form|)))))
 
; dbSourceFile name ==
;   u:= GETDATABASE(name,'SOURCEFILE)
;   null u => '""
;   n := PATHNAME_-NAME u
;   t := PATHNAME_-TYPE u
;   STRCONC(n,'".",t)
 
(DEFUN |dbSourceFile| (|name|)
  (PROG (|u| |n| |t|)
    (RETURN
     (PROGN
      (SETQ |u| (GETDATABASE |name| 'SOURCEFILE))
      (COND ((NULL |u|) "")
            ('T
             (PROGN
              (SETQ |n| (PATHNAME-NAME |u|))
              (SETQ |t| (PATHNAME-TYPE |u|))
              (STRCONC |n| "." |t|))))))))
 
; asharpConstructorName? name ==
;   u:= GETDATABASE(name,'SOURCEFILE)
;   u and PATHNAME_-TYPE u = '"as"
 
(DEFUN |asharpConstructorName?| (|name|)
  (PROG (|u|)
    (RETURN
     (PROGN
      (SETQ |u| (GETDATABASE |name| 'SOURCEFILE))
      (AND |u| (EQUAL (PATHNAME-TYPE |u|) "as"))))))
 
; asharpConstructors() ==
;   [x for x in allConstructors() | not asharpConstructorName? x]
 
(DEFUN |asharpConstructors| #1=()
  (PROG #1#
    (RETURN
     ((LAMBDA (|bfVar#15| |bfVar#14| |x|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#14|) (PROGN (SETQ |x| (CAR |bfVar#14|)) NIL))
           (RETURN (NREVERSE |bfVar#15|)))
          ('T
           (AND (NULL (|asharpConstructorName?| |x|))
                (SETQ |bfVar#15| (CONS |x| |bfVar#15|)))))
         (SETQ |bfVar#14| (CDR |bfVar#14|))))
      NIL (|allConstructors|) NIL))))
 
; extractFileNameFromPath s == fn(s,0,#s) where
;   fn(s,i,m) ==
;     k := charPosition(char '_/,s,i)
;     k = m => SUBSTRING(s,i,nil)
;     fn(s,k + 1,m)
 
(DEFUN |extractFileNameFromPath| (|s|)
  (PROG () (RETURN (|extractFileNameFromPath,fn| |s| 0 (LENGTH |s|)))))
(DEFUN |extractFileNameFromPath,fn| (|s| |i| |m|)
  (PROG (|k|)
    (RETURN
     (PROGN
      (SETQ |k| (|charPosition| (|char| '/) |s| |i|))
      (COND ((EQUAL |k| |m|) (SUBSTRING |s| |i| NIL))
            ('T (|extractFileNameFromPath,fn| |s| (+ |k| 1) |m|)))))))
 
; bcOpTable(u,fn) ==
;   htBeginTable()
;   firstTime := true
;   for op in u for i in 0.. repeat
;     if firstTime then firstTime := false
;     else htSaySaturn '"&"
;     htSay '"{"
;     htMakePage [['bcLinks,[escapeSpecialChars STRINGIMAGE opOf op,'"",fn,i]]]
;     htSay '"}"
;   htEndTable()
 
(DEFUN |bcOpTable| (|u| |fn|)
  (PROG (|firstTime|)
    (RETURN
     (PROGN
      (|htBeginTable|)
      (SETQ |firstTime| T)
      ((LAMBDA (|bfVar#16| |op| |i|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#16|) (PROGN (SETQ |op| (CAR |bfVar#16|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (COND (|firstTime| (SETQ |firstTime| NIL))
                   (#1# (|htSaySaturn| "&")))
             (|htSay| "{")
             (|htMakePage|
              (LIST
               (LIST '|bcLinks|
                     (LIST (|escapeSpecialChars| (STRINGIMAGE (|opOf| |op|)))
                           "" |fn| |i|))))
             (|htSay| "}"))))
          (SETQ |bfVar#16| (CDR |bfVar#16|))
          (SETQ |i| (+ |i| 1))))
       |u| NIL 0)
      (|htEndTable|)))))
 
; bcNameConTable u ==
;   $bcMultipleNames: local := (#u ~= 1)
;   bcConTable REMDUP u
 
(DEFUN |bcNameConTable| (|u|)
  (PROG (|$bcMultipleNames|)
    (DECLARE (SPECIAL |$bcMultipleNames|))
    (RETURN
     (PROGN
      (SETQ |$bcMultipleNames| (NOT (EQL (LENGTH |u|) 1)))
      (|bcConTable| (REMDUP |u|))))))
 
; bcConTable u ==
;   htBeginTable()
;   firstTime := true
;   for con in u repeat
;     if firstTime then firstTime := false
;     else htSaySaturn '"&"
;     htSay '"{"
;     bcStarSpace opOf con
;     bcConform con
;     htSay '"}"
;   htEndTable()
 
(DEFUN |bcConTable| (|u|)
  (PROG (|firstTime|)
    (RETURN
     (PROGN
      (|htBeginTable|)
      (SETQ |firstTime| T)
      ((LAMBDA (|bfVar#17| |con|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#17|) (PROGN (SETQ |con| (CAR |bfVar#17|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (COND (|firstTime| (SETQ |firstTime| NIL))
                   (#1# (|htSaySaturn| "&")))
             (|htSay| "{")
             (|bcStarSpace| (|opOf| |con|))
             (|bcConform| |con|)
             (|htSay| "}"))))
          (SETQ |bfVar#17| (CDR |bfVar#17|))))
       |u| NIL)
      (|htEndTable|)))))
 
; bcAbbTable u ==
;   htBeginTable()
;   firstTime := true
;   for x in REMDUP u repeat        --allow x to be NIL meaning "no abbreviation"
;   -- for x in u repeat    --allow x to be NIL meaning "no abbreviation"
;     if firstTime then firstTime := false
;     else htSaySaturn '"&"
;     if x is [con,abb,:.] then
;       htSay '"{"
;       bcAbb(con,abb)
;       htSay '"}"
;   htEndTable()
 
(DEFUN |bcAbbTable| (|u|)
  (PROG (|firstTime| |con| |ISTMP#1| |abb|)
    (RETURN
     (PROGN
      (|htBeginTable|)
      (SETQ |firstTime| T)
      ((LAMBDA (|bfVar#18| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#18|) (PROGN (SETQ |x| (CAR |bfVar#18|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (COND (|firstTime| (SETQ |firstTime| NIL))
                   (#1# (|htSaySaturn| "&")))
             (COND
              ((AND (CONSP |x|)
                    (PROGN
                     (SETQ |con| (CAR |x|))
                     (SETQ |ISTMP#1| (CDR |x|))
                     (AND (CONSP |ISTMP#1|)
                          (PROGN (SETQ |abb| (CAR |ISTMP#1|)) #1#))))
               (|htSay| "{") (|bcAbb| |con| |abb|) (|htSay| "}"))))))
          (SETQ |bfVar#18| (CDR |bfVar#18|))))
       (REMDUP |u|) NIL)
      (|htEndTable|)))))
 
; bcConPredTable(u,conname,:options) ==
;   italicList := IFCAR options
;   htBeginTable()
;   firstTime := true
;   for [conform,:pred] in u repeat
;     if firstTime then firstTime := false
;     else htSaySaturn '"&"
;     htSay '"{"
;     bcStarSpace opOf conform
;     form :=
;       atom conform => getConstructorForm conform
;       conform
;     bcConform(form,italicList)
;     if extractHasArgs pred is [arglist,:pred] then
;       htSay('" {\em of} ")
;       bcConform([conname,:arglist],italicList,true)
;     if pred ~= 'etc then bcPred(pred,italicList)
;     htSay '"}"
;   htEndTable()
 
(DEFUN |bcConPredTable| (|u| |conname| &REST |options|)
  (PROG (|italicList| |firstTime| |conform| |pred| |form| |ISTMP#1| |arglist|)
    (RETURN
     (PROGN
      (SETQ |italicList| (IFCAR |options|))
      (|htBeginTable|)
      (SETQ |firstTime| T)
      ((LAMBDA (|bfVar#20| |bfVar#19|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#20|)
                (PROGN (SETQ |bfVar#19| (CAR |bfVar#20|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#19|)
                 (PROGN
                  (SETQ |conform| (CAR |bfVar#19|))
                  (SETQ |pred| (CDR |bfVar#19|))
                  #1#)
                 (PROGN
                  (COND (|firstTime| (SETQ |firstTime| NIL))
                        (#1# (|htSaySaturn| "&")))
                  (|htSay| "{")
                  (|bcStarSpace| (|opOf| |conform|))
                  (SETQ |form|
                          (COND
                           ((ATOM |conform|) (|getConstructorForm| |conform|))
                           (#1# |conform|)))
                  (|bcConform| |form| |italicList|)
                  (COND
                   ((PROGN
                     (SETQ |ISTMP#1| (|extractHasArgs| |pred|))
                     (AND (CONSP |ISTMP#1|)
                          (PROGN
                           (SETQ |arglist| (CAR |ISTMP#1|))
                           (SETQ |pred| (CDR |ISTMP#1|))
                           #1#)))
                    (|htSay| " {\\em of} ")
                    (|bcConform| (CONS |conname| |arglist|) |italicList| T)))
                  (COND
                   ((NOT (EQ |pred| '|etc|)) (|bcPred| |pred| |italicList|)))
                  (|htSay| "}")))))
          (SETQ |bfVar#20| (CDR |bfVar#20|))))
       |u| NIL)
      (|htEndTable|)))))
 
; bcPred(pred,:options) ==
;   pred = '"" or pred = true or null pred => 'skip
;   italicList := IFCAR options
;   if not IFCAR IFCDR options then htSay '" {\em if} "
;   htPred2English(pred,italicList)
 
(DEFUN |bcPred| (|pred| &REST |options|)
  (PROG (|italicList|)
    (RETURN
     (COND ((OR (EQUAL |pred| "") (EQUAL |pred| T) (NULL |pred|)) '|skip|)
           ('T
            (PROGN
             (SETQ |italicList| (IFCAR |options|))
             (COND ((NULL (IFCAR (IFCDR |options|))) (|htSay| " {\\em if} ")))
             (|htPred2English| |pred| |italicList|)))))))
 
; extractHasArgs pred ==
;   x := find pred or return nil where find x ==
;     x is [op,:argl] =>
;       op = 'hasArgs => x
;       MEMQ(op,'(AND OR NOT)) => or/[find y for y in argl]
;       nil
;     nil
;   [rest x, :simpBool substitute('T, x, pred)]
 
(DEFUN |extractHasArgs| (|pred|)
  (PROG (|x|)
    (RETURN
     (PROGN
      (SETQ |x| (OR (|extractHasArgs,find| |pred|) (RETURN NIL)))
      (CONS (CDR |x|) (|simpBool| (|substitute| 'T |x| |pred|)))))))
(DEFUN |extractHasArgs,find| (|x|)
  (PROG (|op| |argl|)
    (RETURN
     (COND
      ((AND (CONSP |x|)
            (PROGN (SETQ |op| (CAR |x|)) (SETQ |argl| (CDR |x|)) #1='T))
       (COND ((EQ |op| '|hasArgs|) |x|)
             ((MEMQ |op| '(AND OR NOT))
              ((LAMBDA (|bfVar#22| |bfVar#21| |y|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#21|)
                        (PROGN (SETQ |y| (CAR |bfVar#21|)) NIL))
                    (RETURN |bfVar#22|))
                   (#1#
                    (PROGN
                     (SETQ |bfVar#22| (|extractHasArgs,find| |y|))
                     (COND (|bfVar#22| (RETURN |bfVar#22|))))))
                  (SETQ |bfVar#21| (CDR |bfVar#21|))))
               NIL |argl| NIL))
             (#1# NIL)))
      (#1# NIL)))))
 
; splitConTable cons ==
;   uncond := cond := nil
;   for (pair := [con,:pred]) in cons repeat
;     null pred => 'skip
;     pred = 'T or pred is ['hasArgs,:.]  => uncond := [pair,:uncond]
;     cond := [pair,:cond]
;   [NREVERSE uncond,:NREVERSE cond]
 
(DEFUN |splitConTable| (CONS)
  (PROG (|cond| |uncond| |con| |pred|)
    (RETURN
     (PROGN
      (SETQ |uncond| (SETQ |cond| NIL))
      ((LAMBDA (|bfVar#23| |pair|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#23|) (PROGN (SETQ |pair| (CAR |bfVar#23|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |pair|)
                 (PROGN
                  (SETQ |con| (CAR |pair|))
                  (SETQ |pred| (CDR |pair|))
                  #1#)
                 (COND ((NULL |pred|) '|skip|)
                       ((OR (EQ |pred| 'T)
                            (AND (CONSP |pred|) (EQ (CAR |pred|) '|hasArgs|)))
                        (SETQ |uncond| (CONS |pair| |uncond|)))
                       (#1# (SETQ |cond| (CONS |pair| |cond|)))))))
          (SETQ |bfVar#23| (CDR |bfVar#23|))))
       CONS NIL)
      (CONS (NREVERSE |uncond|) (NREVERSE |cond|))))))
 
; bcNameTable(u,fn,:option) ==   --option if * prefix
;   htSay '"\newline"
;   htBeginTable()
;   firstTime := true
;   for x in u repeat
;     if firstTime then firstTime := false
;     else htSaySaturn '"&"
;     htSay '"{"
;     if IFCAR option then bcStar x
;     htMakePage [['bcLinks,[s := escapeSpecialChars STRINGIMAGE x,'"",fn,s]]]
;     htSay '"}"
;   htEndTable()
 
(DEFUN |bcNameTable| (|u| |fn| &REST |option|)
  (PROG (|firstTime| |s|)
    (RETURN
     (PROGN
      (|htSay| "\\newline")
      (|htBeginTable|)
      (SETQ |firstTime| T)
      ((LAMBDA (|bfVar#24| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#24|) (PROGN (SETQ |x| (CAR |bfVar#24|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (COND (|firstTime| (SETQ |firstTime| NIL))
                   (#1# (|htSaySaturn| "&")))
             (|htSay| "{")
             (COND ((IFCAR |option|) (|bcStar| |x|)))
             (|htMakePage|
              (LIST
               (LIST '|bcLinks|
                     (LIST (SETQ |s| (|escapeSpecialChars| (STRINGIMAGE |x|)))
                           "" |fn| |s|))))
             (|htSay| "}"))))
          (SETQ |bfVar#24| (CDR |bfVar#24|))))
       |u| NIL)
      (|htEndTable|)))))
 
; bcNameCountTable(u,fn,gn,:options) ==
;   linkFunction :=
;     IFCAR options => 'bcLispLinks
;     'bcLinks
;   htSay '"\newline"
;   htBeginTable()
;   firstTime := true
;   for i in 0.. for x in u repeat
;     if firstTime then firstTime := false
;     else htSaySaturn '"&"
;     htSay '"{"
;     htMakePage [[linkFunction,[FUNCALL(fn,x),'"",gn,i]]]
;     htSay '"}"
;   htEndTable()
 
(DEFUN |bcNameCountTable| (|u| |fn| |gn| &REST |options|)
  (PROG (|linkFunction| |firstTime|)
    (RETURN
     (PROGN
      (SETQ |linkFunction|
              (COND ((IFCAR |options|) '|bcLispLinks|) (#1='T '|bcLinks|)))
      (|htSay| "\\newline")
      (|htBeginTable|)
      (SETQ |firstTime| T)
      ((LAMBDA (|i| |bfVar#25| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#25|) (PROGN (SETQ |x| (CAR |bfVar#25|)) NIL))
            (RETURN NIL))
           (#1#
            (PROGN
             (COND (|firstTime| (SETQ |firstTime| NIL))
                   (#1# (|htSaySaturn| "&")))
             (|htSay| "{")
             (|htMakePage|
              (LIST
               (LIST |linkFunction| (LIST (FUNCALL |fn| |x|) "" |gn| |i|))))
             (|htSay| "}"))))
          (SETQ |i| (+ |i| 1))
          (SETQ |bfVar#25| (CDR |bfVar#25|))))
       0 |u| NIL)
      (|htEndTable|)))))
 
; dbSayItemsItalics(:u) ==
;   htSay '"{\em "
;   APPLY(function dbSayItems,u)
;   htSay '"}"
 
(DEFUN |dbSayItemsItalics| (&REST |u|)
  (PROG ()
    (RETURN
     (PROGN (|htSay| "{\\em ") (APPLY #'|dbSayItems| |u|) (|htSay| "}")))))
 
; dbSayItems(countOrPrefix,singular,plural,:options) ==
;   bcHt '"\newline "
;   count :=
;    countOrPrefix is [:prefix,c] =>
;      htSay prefix
;      c
;    countOrPrefix
;   if count = 0 then htSay('"No ",singular)
;   else if count = 1 then htSay('"1 ",singular)
;   else htSay(count,'" ",plural)
;   for x in options repeat bcHt x
;   if count ~= 0 then bcHt '":"
 
(DEFUN |dbSayItems| (|countOrPrefix| |singular| |plural| &REST |options|)
  (PROG (|ISTMP#1| |c| |prefix| |count|)
    (RETURN
     (PROGN
      (|bcHt| "\\newline ")
      (SETQ |count|
              (COND
               ((AND (CONSP |countOrPrefix|)
                     (PROGN (SETQ |ISTMP#1| (REVERSE |countOrPrefix|)) #1='T)
                     (CONSP |ISTMP#1|)
                     (PROGN
                      (SETQ |c| (CAR |ISTMP#1|))
                      (SETQ |prefix| (CDR |ISTMP#1|))
                      #1#)
                     (PROGN (SETQ |prefix| (NREVERSE |prefix|)) #1#))
                (PROGN (|htSay| |prefix|) |c|))
               (#1# |countOrPrefix|)))
      (COND ((EQL |count| 0) (|htSay| "No " |singular|))
            ((EQL |count| 1) (|htSay| "1 " |singular|))
            (#1# (|htSay| |count| " " |plural|)))
      ((LAMBDA (|bfVar#26| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#26|) (PROGN (SETQ |x| (CAR |bfVar#26|)) NIL))
            (RETURN NIL))
           (#1# (|bcHt| |x|)))
          (SETQ |bfVar#26| (CDR |bfVar#26|))))
       |options| NIL)
      (COND ((NOT (EQL |count| 0)) (|bcHt| ":")))))))
 
; dbBasicConstructor? conname == member(dbSourceFile conname,'("catdef" "coerce"))
 
(DEFUN |dbBasicConstructor?| (|conname|)
  (PROG () (RETURN (|member| (|dbSourceFile| |conname|) '("catdef" "coerce")))))
 
; nothingFoundPage(:options) ==
;   htInitPage('"Sorry, no match found",nil)
;   htShowPage()
 
(DEFUN |nothingFoundPage| (&REST |options|)
  (PROG ()
    (RETURN (PROGN (|htInitPage| "Sorry, no match found" NIL) (|htShowPage|)))))
 
; htCopyProplist htPage == [[x,:y] for [x,:y] in htpPropertyList htPage]
 
(DEFUN |htCopyProplist| (|htPage|)
  (PROG (|x| |y|)
    (RETURN
     ((LAMBDA (|bfVar#29| |bfVar#28| |bfVar#27|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#28|)
               (PROGN (SETQ |bfVar#27| (CAR |bfVar#28|)) NIL))
           (RETURN (NREVERSE |bfVar#29|)))
          (#1='T
           (AND (CONSP |bfVar#27|)
                (PROGN
                 (SETQ |x| (CAR |bfVar#27|))
                 (SETQ |y| (CDR |bfVar#27|))
                 #1#)
                (SETQ |bfVar#29| (CONS (CONS |x| |y|) |bfVar#29|)))))
         (SETQ |bfVar#28| (CDR |bfVar#28|))))
      NIL (|htpPropertyList| |htPage|) NIL))))
 
; dbInfovec name ==
;   'category = GETDATABASE(name,'CONSTRUCTORKIND) => nil
;   GETDATABASE(name, 'ASHARP?) => nil
;   loadLibIfNotLoaded(name)
;   u := GET(name, 'infovec) => u
 
(DEFUN |dbInfovec| (|name|)
  (PROG (|u|)
    (RETURN
     (COND ((EQ '|category| (GETDATABASE |name| 'CONSTRUCTORKIND)) NIL)
           ((GETDATABASE |name| 'ASHARP?) NIL)
           ('T
            (PROGN
             (|loadLibIfNotLoaded| |name|)
             (COND ((SETQ |u| (GET |name| '|infovec|)) |u|))))))))
 
; emptySearchPage(kind,filter,:options) ==
;   skipNamePart := IFCAR options
;   heading := ['"No ",capitalize kind,'" Found"]
;   htInitPage(heading,nil)
;   exposePart :=
;     null $includeUnexposed? => '"{\em exposed} "
;     '""
;   htSay('"\vspace{1}\newline\centerline{There is no ",exposePart,kind,'" matching pattern}\newline\centerline{{\em ")
;   if filter then htPred2English filter
;   htSay '"}}"
;   htShowPage()
 
(DEFUN |emptySearchPage| (|kind| |filter| &REST |options|)
  (PROG (|skipNamePart| |heading| |exposePart|)
    (RETURN
     (PROGN
      (SETQ |skipNamePart| (IFCAR |options|))
      (SETQ |heading| (LIST "No " (|capitalize| |kind|) " Found"))
      (|htInitPage| |heading| NIL)
      (SETQ |exposePart|
              (COND ((NULL |$includeUnexposed?|) "{\\em exposed} ") ('T "")))
      (|htSay| "\\vspace{1}\\newline\\centerline{There is no " |exposePart|
       |kind| " matching pattern}\\newline\\centerline{{\\em ")
      (COND (|filter| (|htPred2English| |filter|)))
      (|htSay| "}}")
      (|htShowPage|)))))
 
; string2Integer s ==
;   and/[DIGIT_-CHAR_-P (s.i) for i in 0..MAXINDEX s] => PARSE_-INTEGER s
;   nil
 
(DEFUN |string2Integer| (|s|)
  (PROG ()
    (RETURN
     (COND
      (((LAMBDA (|bfVar#31| |bfVar#30| |i|)
          (LOOP
           (COND ((> |i| |bfVar#30|) (RETURN |bfVar#31|))
                 (#1='T
                  (PROGN
                   (SETQ |bfVar#31| (DIGIT-CHAR-P (ELT |s| |i|)))
                   (COND ((NOT |bfVar#31|) (RETURN NIL))))))
           (SETQ |i| (+ |i| 1))))
        T (MAXINDEX |s|) 0)
       (PARSE-INTEGER |s|))
      (#1# NIL)))))
 
; dbGetInputString htPage ==
;   s := htpLabelInputString(htPage,'filter)
;   null s or s = '"" => '"*"
;   s
 
(DEFUN |dbGetInputString| (|htPage|)
  (PROG (|s|)
    (RETURN
     (PROGN
      (SETQ |s| (|htpLabelInputString| |htPage| '|filter|))
      (COND ((OR (NULL |s|) (EQUAL |s| "")) "*") ('T |s|))))))
 
; bcErrorPage u ==
;   u is ['error,:r] =>
;     htInitPage(first r,nil)
;     bcBlankLine()
;     for x in rest r repeat htSay x
;     htShowPage()
;   systemError '"Unexpected error message"
 
(DEFUN |bcErrorPage| (|u|)
  (PROG (|r|)
    (RETURN
     (COND
      ((AND (CONSP |u|) (EQ (CAR |u|) '|error|)
            (PROGN (SETQ |r| (CDR |u|)) #1='T))
       (PROGN
        (|htInitPage| (CAR |r|) NIL)
        (|bcBlankLine|)
        ((LAMBDA (|bfVar#32| |x|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#32|) (PROGN (SETQ |x| (CAR |bfVar#32|)) NIL))
              (RETURN NIL))
             (#1# (|htSay| |x|)))
            (SETQ |bfVar#32| (CDR |bfVar#32|))))
         (CDR |r|) NIL)
        (|htShowPage|)))
      (#1# (|systemError| "Unexpected error message"))))))
 
; errorPage(htPage,[heading,kind,:info]) ==
;   kind = 'invalidType => kInvalidTypePage first info
;   if heading = 'error then htInitPage('"Error",nil) else
;                            htInitPage(heading,nil)
;   bcBlankLine()
;   for x in info repeat htSay x
;   htShowPage()
 
(DEFUN |errorPage| (|htPage| |bfVar#34|)
  (PROG (|heading| |kind| |info|)
    (RETURN
     (PROGN
      (SETQ |heading| (CAR |bfVar#34|))
      (SETQ |kind| (CADR . #1=(|bfVar#34|)))
      (SETQ |info| (CDDR . #1#))
      (COND ((EQ |kind| '|invalidType|) (|kInvalidTypePage| (CAR |info|)))
            (#2='T
             (PROGN
              (COND ((EQ |heading| '|error|) (|htInitPage| "Error" NIL))
                    (#2# (|htInitPage| |heading| NIL)))
              (|bcBlankLine|)
              ((LAMBDA (|bfVar#33| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#33|)
                        (PROGN (SETQ |x| (CAR |bfVar#33|)) NIL))
                    (RETURN NIL))
                   (#2# (|htSay| |x|)))
                  (SETQ |bfVar#33| (CDR |bfVar#33|))))
               |info| NIL)
              (|htShowPage|))))))))
 
; htErrorStar() ==
;   errorPage(nil,['"{\em *} not a valid search string",nil,'"\vspace{3}\centerline{{\em *} is not a valid search string for a general search}\centerline{\em {it would match everything!}}"])
 
(DEFUN |htErrorStar| #1=()
  (PROG #1#
    (RETURN
     (|errorPage| NIL
      (LIST "{\\em *} not a valid search string" NIL
            "\\vspace{3}\\centerline{{\\em *} is not a valid search string for a general search}\\centerline{\\em {it would match everything!}}")))))
 
; htQueryPage(htPage,heading,message,query,fn) ==
;   htInitPage(heading,nil)
;   htSay message
;   htQuery(query,fn)
;   htShowPage()
 
(DEFUN |htQueryPage| (|htPage| |heading| |message| |query| |fn|)
  (PROG ()
    (RETURN
     (PROGN
      (|htInitPage| |heading| NIL)
      (|htSay| |message|)
      (|htQuery| |query| |fn|)
      (|htShowPage|)))))
 
; htQuery(question,fn,:options) ==
;   upLink? := IFCAR options
;   if question then
;     htSay('"\vspace{1}\centerline{")
;     htSay question
;     htSay('"}")
;   htSay('"\centerline{")
;   htMakePage [['bcLispLinks,['"\fbox{Yes}",'"",fn,'yes]]]
;   htBlank 4
;   if upLink?
;     then htSay('"\downlink{\fbox{No}}{UpPage}")
;     else htMakePage [['bcLispLinks,['"\fbox{No}",'"",fn,'no]]]
;   htSay('"}")
 
(DEFUN |htQuery| (|question| |fn| &REST |options|)
  (PROG (|upLink?|)
    (RETURN
     (PROGN
      (SETQ |upLink?| (IFCAR |options|))
      (COND
       (|question| (|htSay| "\\vspace{1}\\centerline{") (|htSay| |question|)
        (|htSay| "}")))
      (|htSay| "\\centerline{")
      (|htMakePage|
       (LIST (LIST '|bcLispLinks| (LIST "\\fbox{Yes}" "" |fn| '|yes|))))
      (|htBlank| 4)
      (COND (|upLink?| (|htSay| "\\downlink{\\fbox{No}}{UpPage}"))
            ('T
             (|htMakePage|
              (LIST (LIST '|bcLispLinks| (LIST "\\fbox{No}" "" |fn| '|no|))))))
      (|htSay| "}")))))
 
; kInvalidTypePage form ==
;   htInitPage('"Error",nil)
;   bcBlankLine()
;   htSay('"\centerline{You gave an invalid type:}\newline\centerline{{\sf ")
;   htSay(form2HtString form,'"}}")
;   htShowPage()
 
(DEFUN |kInvalidTypePage| (|form|)
  (PROG ()
    (RETURN
     (PROGN
      (|htInitPage| "Error" NIL)
      (|bcBlankLine|)
      (|htSay|
       "\\centerline{You gave an invalid type:}\\newline\\centerline{{\\sf ")
      (|htSay| (|form2HtString| |form|) "}}")
      (|htShowPage|)))))
 
; dbNotAvailablePage(:options) ==
;   htInitPage('"Missing Page",nil)
;   bcBlankLine()
;   htSay(IFCAR options or '"\centerline{This page is not available yet}")
;   htShowPage()
 
(DEFUN |dbNotAvailablePage| (&REST |options|)
  (PROG ()
    (RETURN
     (PROGN
      (|htInitPage| "Missing Page" NIL)
      (|bcBlankLine|)
      (|htSay|
       (OR (IFCAR |options|) "\\centerline{This page is not available yet}"))
      (|htShowPage|)))))
 
; dbpHasDefaultCategory? s ==  #s > 1 and s.1 = char 'x  --s is part 3 of line
 
(DEFUN |dbpHasDefaultCategory?| (|s|)
  (PROG () (RETURN (AND (< 1 (LENGTH |s|)) (EQUAL (ELT |s| 1) (|char| '|x|))))))
 
; dbKind line == line.0
 
(DEFUN |dbKind| (|line|) (PROG () (RETURN (ELT |line| 0))))
 
; dbKindString kind == LASSOC(kind,$dbKindAlist)
 
(DEFUN |dbKindString| (|kind|)
  (PROG () (RETURN (LASSOC |kind| |$dbKindAlist|))))
 
; dbName line == escapeString SUBSTRING(line,1,charPosition($tick,line,1) - 1)
 
(DEFUN |dbName| (|line|)
  (PROG ()
    (RETURN
     (|escapeString|
      (SUBSTRING |line| 1 (- (|charPosition| |$tick| |line| 1) 1))))))
 
; dbAttr line == STRCONC(dbName line,escapeString dbPart(line,4,0))
 
(DEFUN |dbAttr| (|line|)
  (PROG ()
    (RETURN
     (STRCONC (|dbName| |line|) (|escapeString| (|dbPart| |line| 4 0))))))
 
; dbPart(line,n,k) ==  --returns part n of line (n=1,..) beginning in column k
;   n = 1 => SUBSTRING(line,k + 1,charPosition($tick,line,k + 1) - k - 1)
;   dbPart(line,n - 1,charPosition($tick,line,k + 1))
 
(DEFUN |dbPart| (|line| |n| |k|)
  (PROG ()
    (RETURN
     (COND
      ((EQL |n| 1)
       (SUBSTRING |line| (+ |k| 1)
                  (- (- (|charPosition| |$tick| |line| (+ |k| 1)) |k|) 1)))
      ('T
       (|dbPart| |line| (- |n| 1)
        (|charPosition| |$tick| |line| (+ |k| 1))))))))
 
; dbXParts(line,n,m) ==
;   [.,nargs,:r] := dbParts(line,n,m)
;   [dbKindString line.0,dbName line,PARSE_-INTEGER nargs,:r]
 
(DEFUN |dbXParts| (|line| |n| |m|)
  (PROG (|LETTMP#1| |nargs| |r|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (|dbParts| |line| |n| |m|))
      (SETQ |nargs| (CADR . #1=(|LETTMP#1|)))
      (SETQ |r| (CDDR . #1#))
      (CONS (|dbKindString| (ELT |line| 0))
            (CONS (|dbName| |line|) (CONS (PARSE-INTEGER |nargs|) |r|)))))))
 
; dbParts(line,n,m) ==  --split line into n parts beginning in column m
;   n = 0 => nil
;   [SUBSTRING(line,m,-m + (k := charPosition($tick,line,m))),
;     :dbParts(line,n - 1,k + 1)]
 
(DEFUN |dbParts| (|line| |n| |m|)
  (PROG (|k|)
    (RETURN
     (COND ((EQL |n| 0) NIL)
           ('T
            (CONS
             (SUBSTRING |line| |m|
                        (+ (- |m|)
                           (SETQ |k| (|charPosition| |$tick| |line| |m|))))
             (|dbParts| |line| (- |n| 1) (+ |k| 1))))))))
 
; dbConname(line) == dbPart(line,5,1)
 
(DEFUN |dbConname| (|line|) (PROG () (RETURN (|dbPart| |line| 5 1))))
 
; dbComments line ==  dbReadComments(string2Integer dbPart(line,7,1))
 
(DEFUN |dbComments| (|line|)
  (PROG ()
    (RETURN (|dbReadComments| (|string2Integer| (|dbPart| |line| 7 1))))))
 
; dbNewConname(line) == --dbName line unless kind is 'a or 'o => name in 5th pos.
;   (kind := line.0) = char 'a or kind = char 'o =>
;     conform := dbPart(line,5,1)
;     k := charPosition(char '_(,conform,1)
;     SUBSTRING(conform,1,k - 1)
;   dbName line
 
(DEFUN |dbNewConname| (|line|)
  (PROG (|kind| |conform| |k|)
    (RETURN
     (COND
      ((OR (EQUAL (SETQ |kind| (ELT |line| 0)) (|char| '|a|))
           (EQUAL |kind| (|char| '|o|)))
       (PROGN
        (SETQ |conform| (|dbPart| |line| 5 1))
        (SETQ |k| (|charPosition| (|char| '|(|) |conform| 1))
        (SUBSTRING |conform| 1 (- |k| 1))))
      ('T (|dbName| |line|))))))
 
; dbTickIndex(line,n,k) == --returns index of nth tick in line starting at k
;   n = 1 => charPosition($tick,line,k)
;   dbTickIndex(line,n - 1,1 + charPosition($tick,line,k))
 
(DEFUN |dbTickIndex| (|line| |n| |k|)
  (PROG ()
    (RETURN
     (COND ((EQL |n| 1) (|charPosition| |$tick| |line| |k|))
           ('T
            (|dbTickIndex| |line| (- |n| 1)
             (+ 1 (|charPosition| |$tick| |line| |k|))))))))
 
; mySort u == listSort(function GLESSEQP,u)
 
(DEFUN |mySort| (|u|) (PROG () (RETURN (|listSort| #'GLESSEQP |u|))))
