 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; conPage(a,:b) ==
;   --The next 4 lines allow e.g. MATRIX INT  ==> Matrix Integer (see kPage)
;   form :=
;     atom a => [a,:b]
;     a
;   $conArgstrings : local := [form2HtString x for x in IFCDR a]
;   if not atom a then a := first a
;   da := DOWNCASE a
;   pageName := QLASSQ(da, '((type . CategoryType) (union . DomainUnion) _
;                            (record . DomainRecord) (mapping . DomainMapping) _
;                            (enumeration . DomainEnumeration))) =>
;       downlink pageName       --special jump out for primitive domains
;   line := conPageFastPath da  => kPage(line,form) --lower case name of cons?
;   line := conPageFastPath UPCASE a => kPage(line,form) --upper case an abbr?
;   ySearch a       --slow search (include default packages)
 
(DEFUN |conPage| (|a| &REST |b|)
  (PROG (|$conArgstrings| |line| |pageName| |da| |form|)
    (DECLARE (SPECIAL |$conArgstrings|))
    (RETURN
     (PROGN
      (SETQ |form| (COND ((ATOM |a|) (CONS |a| |b|)) (#1='T |a|)))
      (SETQ |$conArgstrings|
              ((LAMBDA (|bfVar#2| |bfVar#1| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#1|)
                        (PROGN (SETQ |x| (CAR |bfVar#1|)) NIL))
                    (RETURN (NREVERSE |bfVar#2|)))
                   (#1#
                    (SETQ |bfVar#2| (CONS (|form2HtString| |x|) |bfVar#2|))))
                  (SETQ |bfVar#1| (CDR |bfVar#1|))))
               NIL (IFCDR |a|) NIL))
      (COND ((NULL (ATOM |a|)) (SETQ |a| (CAR |a|))))
      (SETQ |da| (DOWNCASE |a|))
      (COND
       ((SETQ |pageName|
                (QLASSQ |da|
                 '((|type| . |CategoryType|) (|union| . |DomainUnion|)
                   (|record| . |DomainRecord|) (|mapping| . |DomainMapping|)
                   (|enumeration| . |DomainEnumeration|))))
        (|downlink| |pageName|))
       ((SETQ |line| (|conPageFastPath| |da|)) (|kPage| |line| |form|))
       ((SETQ |line| (|conPageFastPath| (UPCASE |a|))) (|kPage| |line| |form|))
       (#1# (|ySearch| |a|)))))))
 
; conPageFastPath x == --called by conPage and constructorSearch
; --gets line quickly for constructor name or abbreviation
;   s := STRINGIMAGE x
;   charPosition(char '_*,s,0) < #s => nil     --quit if name has * in it
;   name := (STRINGP x => INTERN x; x)
;   entry := HGET($lowerCaseConTb,name) or return nil
;   conPageConEntry first entry
 
(DEFUN |conPageFastPath| (|x|)
  (PROG (|s| |name| |entry|)
    (RETURN
     (PROGN
      (SETQ |s| (STRINGIMAGE |x|))
      (COND ((< (|charPosition| (|char| '*) |s| 0) (LENGTH |s|)) NIL)
            (#1='T
             (PROGN
              (SETQ |name| (COND ((STRINGP |x|) (INTERN |x|)) (#1# |x|)))
              (SETQ |entry| (OR (HGET |$lowerCaseConTb| |name|) (RETURN NIL)))
              (|conPageConEntry| (CAR |entry|)))))))))
 
; conPageConEntry entry ==
;   $conname: local := nil
;   $conform: local := nil
;   $exposed?:local := nil
;   $doc:     local := nil
;   $kind:    local := nil
;   buildLibdbConEntry entry
 
(DEFUN |conPageConEntry| (|entry|)
  (PROG (|$kind| |$doc| |$exposed?| |$conform| |$conname|)
    (DECLARE (SPECIAL |$kind| |$doc| |$exposed?| |$conform| |$conname|))
    (RETURN
     (PROGN
      (SETQ |$conname| NIL)
      (SETQ |$conform| NIL)
      (SETQ |$exposed?| NIL)
      (SETQ |$doc| NIL)
      (SETQ |$kind| NIL)
      (|buildLibdbConEntry| |entry|)))))
 
; kxPage(htPage,name) == downlink name
 
(DEFUN |kxPage| (|htPage| |name|) (PROG () (RETURN (|downlink| |name|))))
 
; kdPageInfo(name,abbrev,nargs,conform,signature,file?) ==
;   htSay("{\sf ",name,'"}")
;   if abbrev ~= name then bcHt [" has abbreviation ",abbrev]
;   if file? then bcHt ['" is a source file."]
;   if nargs = 0 then (if abbrev ~= name then bcHt '".")
;     else
;       if abbrev ~= name then bcHt '" and"
;       bcHt
;         nargs = 1 => '" takes one argument:"
;         [" takes ",STRINGIMAGE nargs," arguments:"]
;   htSaturnBreak()
;   htSayStandard '"\indentrel{2}"
;   if nargs > 0 then kPageArgs(conform,signature)
;   htSayStandard '"\indentrel{-2}"
;   if name.(#name-1) = char "&" then name := SUBSEQ(name, 0, #name-1)
; --sourceFileName := dbSourceFile INTERN name
;   sourceFileName := GETDATABASE(INTERN name,'SOURCEFILE)
;   filename := extractFileNameFromPath sourceFileName
;   if filename ~= '"" then
;     htSayStandard '"\newline{}"
;     htSay('"The source code for the constructor is found in ")
;   htMakePage [['text,'"\unixcommand{",filename,'"}{_\$AXIOM/lib/SPADEDIT ",
;               sourceFileName, '" ", name, '"}"]]
;   if nargs ~= 0 then htSay '"."
;   htSaturnBreak()
 
(DEFUN |kdPageInfo| (|name| |abbrev| |nargs| |conform| |signature| |file?|)
  (PROG (|sourceFileName| |filename|)
    (RETURN
     (PROGN
      (|htSay| '|{\\sf | |name| "}")
      (COND
       ((NOT (EQUAL |abbrev| |name|))
        (|bcHt| (LIST '| has abbreviation | |abbrev|))))
      (COND (|file?| (|bcHt| (LIST " is a source file."))))
      (COND
       ((EQL |nargs| 0) (COND ((NOT (EQUAL |abbrev| |name|)) (|bcHt| "."))))
       (#1='T (COND ((NOT (EQUAL |abbrev| |name|)) (|bcHt| " and")))
        (|bcHt|
         (COND ((EQL |nargs| 1) " takes one argument:")
               (#1# (LIST '| takes | (STRINGIMAGE |nargs|) '| arguments:|))))))
      (|htSaturnBreak|)
      (|htSayStandard| "\\indentrel{2}")
      (COND ((< 0 |nargs|) (|kPageArgs| |conform| |signature|)))
      (|htSayStandard| "\\indentrel{-2}")
      (COND
       ((EQUAL (ELT |name| (- (LENGTH |name|) 1)) (|char| '&))
        (SETQ |name| (SUBSEQ |name| 0 (- (LENGTH |name|) 1)))))
      (SETQ |sourceFileName| (GETDATABASE (INTERN |name|) 'SOURCEFILE))
      (SETQ |filename| (|extractFileNameFromPath| |sourceFileName|))
      (COND
       ((NOT (EQUAL |filename| "")) (|htSayStandard| "\\newline{}")
        (|htSay| "The source code for the constructor is found in ")))
      (|htMakePage|
       (LIST
        (LIST '|text| "\\unixcommand{" |filename| "}{\\$AXIOM/lib/SPADEDIT "
              |sourceFileName| " " |name| "}")))
      (COND ((NOT (EQL |nargs| 0)) (|htSay| ".")))
      (|htSaturnBreak|)))))
 
; kArgPage(htPage,arg) ==
;   [op,:args] := conform := htpProperty(htPage,'conform)
;   domname := htpProperty(htPage,'domname)
;   heading := htpProperty(htPage,'heading)
;   source := CDDAR getConstructorModemap op
;   n := position(arg,args)
;   typeForm := sublisFormal(args,source . n)
;   domTypeForm := mkDomTypeForm(typeForm,conform,domname)
;   descendants := domainDescendantsOf(typeForm,domTypeForm)
;   htpSetProperty(htPage,'cAlist,descendants)
;   rank :=
;     n > 4 => nil
;     ('(First Second Third Fourth Fifth)).n
;   htpSetProperty(htPage,'rank,rank)
;   htpSetProperty(htPage,'thing,'"argument")
; --htpSetProperty(htPage,'specialMessage,['reportCategory,conform,typeForm,arg])
;   dbShowCons(htPage,'names)
 
(DEFUN |kArgPage| (|htPage| |arg|)
  (PROG (|conform| |op| |args| |domname| |heading| |source| |n| |typeForm|
         |domTypeForm| |descendants| |rank|)
    (RETURN
     (PROGN
      (SETQ |conform| (|htpProperty| |htPage| '|conform|))
      (SETQ |op| (CAR |conform|))
      (SETQ |args| (CDR |conform|))
      (SETQ |domname| (|htpProperty| |htPage| '|domname|))
      (SETQ |heading| (|htpProperty| |htPage| '|heading|))
      (SETQ |source| (CDDAR (|getConstructorModemap| |op|)))
      (SETQ |n| (|position| |arg| |args|))
      (SETQ |typeForm| (|sublisFormal| |args| (ELT |source| |n|)))
      (SETQ |domTypeForm| (|mkDomTypeForm| |typeForm| |conform| |domname|))
      (SETQ |descendants| (|domainDescendantsOf| |typeForm| |domTypeForm|))
      (|htpSetProperty| |htPage| '|cAlist| |descendants|)
      (SETQ |rank|
              (COND ((< 4 |n|) NIL)
                    ('T
                     (ELT '(|First| |Second| |Third| |Fourth| |Fifth|) |n|))))
      (|htpSetProperty| |htPage| '|rank| |rank|)
      (|htpSetProperty| |htPage| '|thing| "argument")
      (|dbShowCons| |htPage| '|names|)))))
 
; reportCategory(conform,typeForm,arg) ==
;   htSay('"Argument {\em ",arg,'"}")
;   [conlist,attrlist,:oplist] := categoryParts(conform,typeForm,true)
;   htSay '" must "
;   if conlist then
;     htSay '"belong to "
;     if conlist is [u] then
;        htSay('"category ")
;        bcConform first u
;        bcPred rest u
;     else
;        htSay('"categories:")
;        bcConPredTable(conlist,opOf conform)
;        htSay '"\newline "
;   if attrlist then BREAK()
;   if oplist then
;     if conlist or attrlist then htSay '" and "
;     reportAO('"operation",oplist)
 
(DEFUN |reportCategory| (|conform| |typeForm| |arg|)
  (PROG (|LETTMP#1| |conlist| |attrlist| |oplist| |u|)
    (RETURN
     (PROGN
      (|htSay| "Argument {\\em " |arg| "}")
      (SETQ |LETTMP#1| (|categoryParts| |conform| |typeForm| T))
      (SETQ |conlist| (CAR |LETTMP#1|))
      (SETQ |attrlist| (CADR . #1=(|LETTMP#1|)))
      (SETQ |oplist| (CDDR . #1#))
      (|htSay| " must ")
      (COND
       (|conlist| (|htSay| "belong to ")
        (COND
         ((AND (CONSP |conlist|) (EQ (CDR |conlist|) NIL)
               (PROGN (SETQ |u| (CAR |conlist|)) #2='T))
          (|htSay| "category ") (|bcConform| (CAR |u|)) (|bcPred| (CDR |u|)))
         (#2# (|htSay| "categories:")
          (|bcConPredTable| |conlist| (|opOf| |conform|))
          (|htSay| "\\newline ")))))
      (COND (|attrlist| (BREAK)))
      (COND
       (|oplist| (COND ((OR |conlist| |attrlist|) (|htSay| " and ")))
        (|reportAO| "operation" |oplist|)))))))
 
; reportAO(kind,oplist) ==
;   htSay('"have ",kind,'":")
;   for [op,sig,:pred] in oplist repeat
;     htSay '"\newline "
;     if #oplist = 1 then htSay '"\centerline{"
;     if kind = '"attribute" then
;       attr := form2String [op,:sig]
;       satDownLink(attr,['"(|attrPage| '|",attr,'"|)"])
;     else
;       ops  := escapeSpecialChars STRINGIMAGE op
;       sigs := form2HtString ['Mapping,:sig]
;       satDownLink(ops,['"(|opPage| '|",ops,'"| |",sigs,'"|)"])
;       htSay '": "
;       bcConform ['Mapping,:sig]
;     if #oplist = 1 then htSay '"}"
;   htSay '"\newline "
 
(DEFUN |reportAO| (|kind| |oplist|)
  (PROG (|op| |ISTMP#1| |sig| |pred| |attr| |ops| |sigs|)
    (RETURN
     (PROGN
      (|htSay| "have " |kind| ":")
      ((LAMBDA (|bfVar#4| |bfVar#3|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#4|) (PROGN (SETQ |bfVar#3| (CAR |bfVar#4|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#3|)
                 (PROGN
                  (SETQ |op| (CAR |bfVar#3|))
                  (SETQ |ISTMP#1| (CDR |bfVar#3|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |sig| (CAR |ISTMP#1|))
                        (SETQ |pred| (CDR |ISTMP#1|))
                        #1#)))
                 (PROGN
                  (|htSay| "\\newline ")
                  (COND ((EQL (LENGTH |oplist|) 1) (|htSay| "\\centerline{")))
                  (COND
                   ((EQUAL |kind| "attribute")
                    (SETQ |attr| (|form2String| (CONS |op| |sig|)))
                    (|satDownLink| |attr| (LIST "(|attrPage| '|" |attr| "|)")))
                   (#1# (SETQ |ops| (|escapeSpecialChars| (STRINGIMAGE |op|)))
                    (SETQ |sigs| (|form2HtString| (CONS '|Mapping| |sig|)))
                    (|satDownLink| |ops|
                     (LIST "(|opPage| '|" |ops| "| |" |sigs| "|)"))
                    (|htSay| ": ") (|bcConform| (CONS '|Mapping| |sig|))))
                  (COND ((EQL (LENGTH |oplist|) 1) (|htSay| "}")))))))
          (SETQ |bfVar#4| (CDR |bfVar#4|))))
       |oplist| NIL)
      (|htSay| "\\newline ")))))
 
; mkDomTypeForm(typeForm,conform,domname) == --called by kargPage
;   domname => SUBLISLIS(rest domname,rest conform,typeForm)
;   typeForm is ['Join,:r] => ['Join,:[mkDomTypeForm(t,conform,domname) for t in r]]
;   null hasIdent typeForm => typeForm
;   nil
 
(DEFUN |mkDomTypeForm| (|typeForm| |conform| |domname|)
  (PROG (|r|)
    (RETURN
     (COND (|domname| (SUBLISLIS (CDR |domname|) (CDR |conform|) |typeForm|))
           ((AND (CONSP |typeForm|) (EQ (CAR |typeForm|) '|Join|)
                 (PROGN (SETQ |r| (CDR |typeForm|)) #1='T))
            (CONS '|Join|
                  ((LAMBDA (|bfVar#6| |bfVar#5| |t|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#5|)
                            (PROGN (SETQ |t| (CAR |bfVar#5|)) NIL))
                        (RETURN (NREVERSE |bfVar#6|)))
                       (#1#
                        (SETQ |bfVar#6|
                                (CONS (|mkDomTypeForm| |t| |conform| |domname|)
                                      |bfVar#6|))))
                      (SETQ |bfVar#5| (CDR |bfVar#5|))))
                   NIL |r| NIL)))
           ((NULL (|hasIdent| |typeForm|)) |typeForm|) (#1# NIL)))))
 
; domainDescendantsOf(conform,domform) == main where --called by kargPage
;   main ==
;     conform is [op,:r] =>
;       op = 'Join => jfn(r, IFCDR domform)
;       op = 'CATEGORY => nil
;       domainsOf(conform,domform)
;     domainsOf(conform,domform)
;   jfn([y,:r],domlist) ==  --keep only those domains that appear in ALL parts of Join
;     alist := domainsOf(y,IFCAR domlist)
;     for x in r repeat
;       domlist := IFCDR domlist
;       x is ['CATEGORY,.,:r] => alist := catScreen(r,alist)
;       keepList := nil
;       for [item,:pred] in domainsOf(x,IFCAR domlist) repeat
;         u := assoc(item,alist) =>
;             keepList := [[item, :quickAnd(rest u, pred)], :keepList]
;       alist := keepList
;     for pair in alist repeat RPLACD(pair, simpHasPred rest pair)
;     listSort(function GLESSEQP, alist)
;   catScreen(r,alist) ==
;     for x in r repeat
;       x isnt [op1,:.] and MEMQ(op1,'(ATTRIBUTE SIGNATURE)) => systemError x
;       alist := [[item,:npred] for [item,:pred] in alist |
;         (pred1 := simpHasPred ['has,item,x]) and (npred := quickAnd(pred1,pred))]
;     alist
 
(DEFUN |domainDescendantsOf| (|conform| |domform|)
  (PROG (|op| |r|)
    (RETURN
     (COND
      ((AND (CONSP |conform|)
            (PROGN
             (SETQ |op| (CAR |conform|))
             (SETQ |r| (CDR |conform|))
             #1='T))
       (COND
        ((EQ |op| '|Join|) (|domainDescendantsOf,jfn| |r| (IFCDR |domform|)))
        ((EQ |op| 'CATEGORY) NIL) (#1# (|domainsOf| |conform| |domform|))))
      (#1# (|domainsOf| |conform| |domform|))))))
(DEFUN |domainDescendantsOf,jfn| (|bfVar#15| |domlist|)
  (PROG (|y| |r| |alist| |ISTMP#1| |keepList| |item| |pred| |u|)
    (RETURN
     (PROGN
      (SETQ |y| (CAR |bfVar#15|))
      (SETQ |r| (CDR |bfVar#15|))
      (SETQ |alist| (|domainsOf| |y| (IFCAR |domlist|)))
      ((LAMBDA (|bfVar#7| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#7|) (PROGN (SETQ |x| (CAR |bfVar#7|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (SETQ |domlist| (IFCDR |domlist|))
             (COND
              ((AND (CONSP |x|) (EQ (CAR |x|) 'CATEGORY)
                    (PROGN
                     (SETQ |ISTMP#1| (CDR |x|))
                     (AND (CONSP |ISTMP#1|)
                          (PROGN (SETQ |r| (CDR |ISTMP#1|)) #1#))))
               (SETQ |alist| (|domainDescendantsOf,catScreen| |r| |alist|)))
              (#1#
               (PROGN
                (SETQ |keepList| NIL)
                ((LAMBDA (|bfVar#9| |bfVar#8|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#9|)
                          (PROGN (SETQ |bfVar#8| (CAR |bfVar#9|)) NIL))
                      (RETURN NIL))
                     (#1#
                      (AND (CONSP |bfVar#8|)
                           (PROGN
                            (SETQ |item| (CAR |bfVar#8|))
                            (SETQ |pred| (CDR |bfVar#8|))
                            #1#)
                           (COND
                            ((SETQ |u| (|assoc| |item| |alist|))
                             (IDENTITY
                              (SETQ |keepList|
                                      (CONS
                                       (CONS |item|
                                             (|quickAnd| (CDR |u|) |pred|))
                                       |keepList|))))))))
                    (SETQ |bfVar#9| (CDR |bfVar#9|))))
                 (|domainsOf| |x| (IFCAR |domlist|)) NIL)
                (SETQ |alist| |keepList|)))))))
          (SETQ |bfVar#7| (CDR |bfVar#7|))))
       |r| NIL)
      ((LAMBDA (|bfVar#10| |pair|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#10|) (PROGN (SETQ |pair| (CAR |bfVar#10|)) NIL))
            (RETURN NIL))
           (#1# (RPLACD |pair| (|simpHasPred| (CDR |pair|)))))
          (SETQ |bfVar#10| (CDR |bfVar#10|))))
       |alist| NIL)
      (|listSort| #'GLESSEQP |alist|)))))
(DEFUN |domainDescendantsOf,catScreen| (|r| |alist|)
  (PROG (|op1| |item| |pred| |pred1| |npred|)
    (RETURN
     (PROGN
      ((LAMBDA (|bfVar#11| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#11|) (PROGN (SETQ |x| (CAR |bfVar#11|)) NIL))
            (RETURN NIL))
           (#1='T
            (COND
             ((AND (NOT (AND (CONSP |x|) (PROGN (SETQ |op1| (CAR |x|)) #1#)))
                   (MEMQ |op1| '(ATTRIBUTE SIGNATURE)))
              (|systemError| |x|))
             (#1#
              (SETQ |alist|
                      ((LAMBDA (|bfVar#14| |bfVar#13| |bfVar#12|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#13|)
                                (PROGN (SETQ |bfVar#12| (CAR |bfVar#13|)) NIL))
                            (RETURN (NREVERSE |bfVar#14|)))
                           (#1#
                            (AND (CONSP |bfVar#12|)
                                 (PROGN
                                  (SETQ |item| (CAR |bfVar#12|))
                                  (SETQ |pred| (CDR |bfVar#12|))
                                  #1#)
                                 (SETQ |pred1|
                                         (|simpHasPred|
                                          (LIST '|has| |item| |x|)))
                                 (SETQ |npred| (|quickAnd| |pred1| |pred|))
                                 (SETQ |bfVar#14|
                                         (CONS (CONS |item| |npred|)
                                               |bfVar#14|)))))
                          (SETQ |bfVar#13| (CDR |bfVar#13|))))
                       NIL |alist| NIL))))))
          (SETQ |bfVar#11| (CDR |bfVar#11|))))
       |r| NIL)
      |alist|))))
 
; kiPage(htPage,junk) ==
;   [kind,name,nargs,xflag,sig,args,abbrev,comments] := htpProperty(htPage,'parts)
;   conform         := mkConform(kind,name,args)
;   domname         := kDomainName(htPage,kind,name,nargs)
;   domname is ['error,:.] => errorPage(htPage,domname)
;   heading := ['"Description of ", capitalize kind,'" {\sf ",name,args,'"}"]
;   page := htInitPage(heading,htCopyProplist htPage)
;   $conformsAreDomains := domname
;   dbShowConsDoc1(htPage,conform,nil)
;   htShowPage()
 
(DEFUN |kiPage| (|htPage| |junk|)
  (PROG (|LETTMP#1| |kind| |name| |nargs| |xflag| |sig| |args| |abbrev|
         |comments| |conform| |domname| |heading| |page|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (|htpProperty| |htPage| '|parts|))
      (SETQ |kind| (CAR |LETTMP#1|))
      (SETQ |name| (CADR . #1=(|LETTMP#1|)))
      (SETQ |nargs| (CADDR . #1#))
      (SETQ |xflag| (CADDDR . #1#))
      (SETQ |sig| (CAR #2=(CDDDDR . #1#)))
      (SETQ |args| (CADR . #3=(#2#)))
      (SETQ |abbrev| (CADDR . #3#))
      (SETQ |comments| (CADDDR . #3#))
      (SETQ |conform| (|mkConform| |kind| |name| |args|))
      (SETQ |domname| (|kDomainName| |htPage| |kind| |name| |nargs|))
      (COND
       ((AND (CONSP |domname|) (EQ (CAR |domname|) '|error|))
        (|errorPage| |htPage| |domname|))
       ('T
        (PROGN
         (SETQ |heading|
                 (LIST "Description of " (|capitalize| |kind|) " {\\sf " |name|
                       |args| "}"))
         (SETQ |page| (|htInitPage| |heading| (|htCopyProplist| |htPage|)))
         (SETQ |$conformsAreDomains| |domname|)
         (|dbShowConsDoc1| |htPage| |conform| NIL)
         (|htShowPage|))))))))
 
; kePage(htPage,junk) ==
;   [kind,name,nargs,xflag,sig,args,abbrev,comments] := htpProperty(htPage,'parts)
;   constring       := STRCONC(name,args)
;   domname         := kDomainName(htPage,kind,name,nargs)
;   domname is ['error,:.] => errorPage(htPage,domname)
;   htpSetProperty(htPage,'domname,domname)
;   $conformsAreDomains: local := domname
;   conform         := mkConform(kind,name,args)
;   conname         := opOf conform
;   heading := [capitalize kind,'" {\sf ",
;                (domname => form2HtString(domname,nil,true); constring),'"}"]
;   data := sublisFormal(IFCDR domname or rest conform,
;                        getConstructorExports((domname or conform),true))
;   [conlist,attrlist,:oplist] := data
;   if domname then
;     for x in conlist repeat  rplac(rest x, simpHasPred rest x)
;     for x in attrlist repeat rplac(CDDR x, simpHasPred CDDR x)
;     for x in oplist   repeat rplac(CDDR x, simpHasPred CDDR x)
;   prefix := pluralSay(#conlist + #attrlist + #oplist,'"Export",'"Exports")
;   page := htInitPage([:prefix,'" of ",:heading],htCopyProplist htPage)
;   htSayStandard '"\beginmenu "
;   htpSetProperty(page,'data,data)
;   if conlist then
;     htMakePage [['bcLinks,[menuButton(),'"",'dbShowCons1,conlist,'names]]]
;     htSayStandard '"\tab{2}"
;     htSay  '"All attributes and operations from:"
;     bcConPredTable(conlist,opOf conform,rest conform)
;   if attrlist then
;     if conlist then htBigSkip()
;     kePageDisplay(page,'"attribute",kePageOpAlist attrlist)
;   if oplist then
;     if conlist or attrlist then htBigSkip()
;     kePageDisplay(page,'"operation",kePageOpAlist oplist)
;   htSayStandard '" \endmenu "
;   htShowPage()
 
(DEFUN |kePage| (|htPage| |junk|)
  (PROG (|$conformsAreDomains| |page| |prefix| |oplist| |attrlist| |conlist|
         |data| |heading| |conname| |conform| |domname| |constring| |comments|
         |abbrev| |args| |sig| |xflag| |nargs| |name| |kind| |LETTMP#1|)
    (DECLARE (SPECIAL |$conformsAreDomains|))
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (|htpProperty| |htPage| '|parts|))
      (SETQ |kind| (CAR |LETTMP#1|))
      (SETQ |name| (CADR . #1=(|LETTMP#1|)))
      (SETQ |nargs| (CADDR . #1#))
      (SETQ |xflag| (CADDDR . #1#))
      (SETQ |sig| (CAR #2=(CDDDDR . #1#)))
      (SETQ |args| (CADR . #3=(#2#)))
      (SETQ |abbrev| (CADDR . #3#))
      (SETQ |comments| (CADDDR . #3#))
      (SETQ |constring| (STRCONC |name| |args|))
      (SETQ |domname| (|kDomainName| |htPage| |kind| |name| |nargs|))
      (COND
       ((AND (CONSP |domname|) (EQ (CAR |domname|) '|error|))
        (|errorPage| |htPage| |domname|))
       (#4='T
        (PROGN
         (|htpSetProperty| |htPage| '|domname| |domname|)
         (SETQ |$conformsAreDomains| |domname|)
         (SETQ |conform| (|mkConform| |kind| |name| |args|))
         (SETQ |conname| (|opOf| |conform|))
         (SETQ |heading|
                 (LIST (|capitalize| |kind|) " {\\sf "
                       (COND (|domname| (|form2HtString| |domname| NIL T))
                             (#4# |constring|))
                       "}"))
         (SETQ |data|
                 (|sublisFormal| (OR (IFCDR |domname|) (CDR |conform|))
                  (|getConstructorExports| (OR |domname| |conform|) T)))
         (SETQ |conlist| (CAR |data|))
         (SETQ |attrlist| (CADR . #5=(|data|)))
         (SETQ |oplist| (CDDR . #5#))
         (COND
          (|domname|
           ((LAMBDA (|bfVar#16| |x|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#16|) (PROGN (SETQ |x| (CAR |bfVar#16|)) NIL))
                 (RETURN NIL))
                (#4# (|rplac| (CDR |x|) (|simpHasPred| (CDR |x|)))))
               (SETQ |bfVar#16| (CDR |bfVar#16|))))
            |conlist| NIL)
           ((LAMBDA (|bfVar#17| |x|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#17|) (PROGN (SETQ |x| (CAR |bfVar#17|)) NIL))
                 (RETURN NIL))
                (#4# (|rplac| (CDDR |x|) (|simpHasPred| (CDDR |x|)))))
               (SETQ |bfVar#17| (CDR |bfVar#17|))))
            |attrlist| NIL)
           ((LAMBDA (|bfVar#18| |x|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#18|) (PROGN (SETQ |x| (CAR |bfVar#18|)) NIL))
                 (RETURN NIL))
                (#4# (|rplac| (CDDR |x|) (|simpHasPred| (CDDR |x|)))))
               (SETQ |bfVar#18| (CDR |bfVar#18|))))
            |oplist| NIL)))
         (SETQ |prefix|
                 (|pluralSay|
                  (+ (+ (LENGTH |conlist|) (LENGTH |attrlist|))
                     (LENGTH |oplist|))
                  "Export" "Exports"))
         (SETQ |page|
                 (|htInitPage| (APPEND |prefix| (CONS " of " |heading|))
                  (|htCopyProplist| |htPage|)))
         (|htSayStandard| "\\beginmenu ")
         (|htpSetProperty| |page| '|data| |data|)
         (COND
          (|conlist|
           (|htMakePage|
            (LIST
             (LIST '|bcLinks|
                   (LIST (|menuButton|) "" '|dbShowCons1| |conlist|
                         '|names|))))
           (|htSayStandard| "\\tab{2}")
           (|htSay| "All attributes and operations from:")
           (|bcConPredTable| |conlist| (|opOf| |conform|) (CDR |conform|))))
         (COND
          (|attrlist| (COND (|conlist| (|htBigSkip|)))
           (|kePageDisplay| |page| "attribute" (|kePageOpAlist| |attrlist|))))
         (COND
          (|oplist| (COND ((OR |conlist| |attrlist|) (|htBigSkip|)))
           (|kePageDisplay| |page| "operation" (|kePageOpAlist| |oplist|))))
         (|htSayStandard| " \\endmenu ")
         (|htShowPage|))))))))
 
; kePageOpAlist oplist ==
;   opAlist := nil
;   for [op,sig,:pred] in oplist repeat
;     u := LASSOC(op,opAlist)
; --was
; --    opAlist := insertAlist(op,[[sig,pred],:u],opAlist)
;     opAlist := insertAlist(zeroOneConvert op,[[sig,pred],:u],opAlist)
;   opAlist
 
(DEFUN |kePageOpAlist| (|oplist|)
  (PROG (|opAlist| |op| |ISTMP#1| |sig| |pred| |u|)
    (RETURN
     (PROGN
      (SETQ |opAlist| NIL)
      ((LAMBDA (|bfVar#20| |bfVar#19|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#20|)
                (PROGN (SETQ |bfVar#19| (CAR |bfVar#20|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#19|)
                 (PROGN
                  (SETQ |op| (CAR |bfVar#19|))
                  (SETQ |ISTMP#1| (CDR |bfVar#19|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |sig| (CAR |ISTMP#1|))
                        (SETQ |pred| (CDR |ISTMP#1|))
                        #1#)))
                 (PROGN
                  (SETQ |u| (LASSOC |op| |opAlist|))
                  (SETQ |opAlist|
                          (|insertAlist| (|zeroOneConvert| |op|)
                           (CONS (LIST |sig| |pred|) |u|) |opAlist|))))))
          (SETQ |bfVar#20| (CDR |bfVar#20|))))
       |oplist| NIL)
      |opAlist|))))
 
; kePageDisplay(htPage,which,opAlist) ==
;   count := #opAlist
;   total := +/[#(rest entry) for entry in opAlist]
;   count = 0 => nil
;   if which = '"operation"
;     then htpSetProperty(htPage,'opAlist,opAlist)
;     else htpSetProperty(htPage,'attrAlist,opAlist)
;   expandProperty :=
;     which = '"operation" => 'expandOperations
;     'expandAttributes
;   htpSetProperty(htPage,expandProperty,'lists)  --mark as unexpanded
;   htMakePage [['bcLinks,[menuButton(),'"",'dbShowOps,which,'names]]]
;   htSayStandard '"\tab{2}"
;   if count ~= total then
;     if count = 1
;     then htSay('"1 name for ")
;     else htSay(STRINGIMAGE count,'" names for ")
;   if total > 1
;     then htSay(STRINGIMAGE total,'" ",pluralize which,'" are explicitly exported:")
;     else htSay('"1 ",which,'" is explicitly exported:")
;   htSaySaturn '"\\"
;   data := dbGatherData(htPage,opAlist,which,'names)
;   dbShowOpItems(which,data,false)
 
(DEFUN |kePageDisplay| (|htPage| |which| |opAlist|)
  (PROG (|count| |total| |expandProperty| |data|)
    (RETURN
     (PROGN
      (SETQ |count| (LENGTH |opAlist|))
      (SETQ |total|
              ((LAMBDA (|bfVar#22| |bfVar#21| |entry|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#21|)
                        (PROGN (SETQ |entry| (CAR |bfVar#21|)) NIL))
                    (RETURN |bfVar#22|))
                   (#1='T
                    (SETQ |bfVar#22| (+ |bfVar#22| (LENGTH (CDR |entry|))))))
                  (SETQ |bfVar#21| (CDR |bfVar#21|))))
               0 |opAlist| NIL))
      (COND ((EQL |count| 0) NIL)
            (#1#
             (PROGN
              (COND
               ((EQUAL |which| "operation")
                (|htpSetProperty| |htPage| '|opAlist| |opAlist|))
               (#1# (|htpSetProperty| |htPage| '|attrAlist| |opAlist|)))
              (SETQ |expandProperty|
                      (COND ((EQUAL |which| "operation") '|expandOperations|)
                            (#1# '|expandAttributes|)))
              (|htpSetProperty| |htPage| |expandProperty| '|lists|)
              (|htMakePage|
               (LIST
                (LIST '|bcLinks|
                      (LIST (|menuButton|) "" '|dbShowOps| |which| '|names|))))
              (|htSayStandard| "\\tab{2}")
              (COND
               ((NOT (EQUAL |count| |total|))
                (COND ((EQL |count| 1) (|htSay| "1 name for "))
                      (#1# (|htSay| (STRINGIMAGE |count|) " names for ")))))
              (COND
               ((< 1 |total|)
                (|htSay| (STRINGIMAGE |total|) " " (|pluralize| |which|)
                 " are explicitly exported:"))
               (#1# (|htSay| "1 " |which| " is explicitly exported:")))
              (|htSaySaturn| "\\\\")
              (SETQ |data|
                      (|dbGatherData| |htPage| |opAlist| |which| '|names|))
              (|dbShowOpItems| |which| |data| NIL))))))))
 
; ksPage(htPage,junk) ==
;   [kind,name,nargs,xpart,sig,args,abbrev,comments] := htpProperty(htPage,'parts)
;   domname         := kDomainName(htPage,kind,name,nargs)
;   domname is ['error,:.] => errorPage(htPage,domname)
;   heading :=
;     null domname => htpProperty(htPage,'heading)
;     ['"{\sf ",form2HtString(domname,nil,true),'"}"]
;   if domname then
;     htpSetProperty(htPage,'domname,domname)
;     htpSetProperty(htPage,'heading,heading)
;   domain  := (kind = '"category" => nil; EVAL domname)
;   conform:= htpProperty(htPage,'conform)
;   page := htInitPageNoScroll(htCopyProplist htPage,
;                              ['"Search order for ",:heading])
;   htSay '"When an operation is not defined by the domain, the following domains are searched in order for a _"default definition"
;   htSayStandard '"\beginscroll "
;   u := dbSearchOrder(conform,domname,domain)
;   htpSetProperty(htPage,'cAlist,u)
;   htpSetProperty(htPage,'thing,'"constructor")
;   dbShowCons(htPage,'names)
 
(DEFUN |ksPage| (|htPage| |junk|)
  (PROG (|LETTMP#1| |kind| |name| |nargs| |xpart| |sig| |args| |abbrev|
         |comments| |domname| |heading| |domain| |conform| |page| |u|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (|htpProperty| |htPage| '|parts|))
      (SETQ |kind| (CAR |LETTMP#1|))
      (SETQ |name| (CADR . #1=(|LETTMP#1|)))
      (SETQ |nargs| (CADDR . #1#))
      (SETQ |xpart| (CADDDR . #1#))
      (SETQ |sig| (CAR #2=(CDDDDR . #1#)))
      (SETQ |args| (CADR . #3=(#2#)))
      (SETQ |abbrev| (CADDR . #3#))
      (SETQ |comments| (CADDDR . #3#))
      (SETQ |domname| (|kDomainName| |htPage| |kind| |name| |nargs|))
      (COND
       ((AND (CONSP |domname|) (EQ (CAR |domname|) '|error|))
        (|errorPage| |htPage| |domname|))
       (#4='T
        (PROGN
         (SETQ |heading|
                 (COND ((NULL |domname|) (|htpProperty| |htPage| '|heading|))
                       (#4#
                        (LIST "{\\sf " (|form2HtString| |domname| NIL T)
                              "}"))))
         (COND
          (|domname| (|htpSetProperty| |htPage| '|domname| |domname|)
           (|htpSetProperty| |htPage| '|heading| |heading|)))
         (SETQ |domain|
                 (COND ((EQUAL |kind| "category") NIL) (#4# (EVAL |domname|))))
         (SETQ |conform| (|htpProperty| |htPage| '|conform|))
         (SETQ |page|
                 (|htInitPageNoScroll| (|htCopyProplist| |htPage|)
                  (CONS "Search order for " |heading|)))
         (|htSay|
          "When an operation is not defined by the domain, the following domains are searched in order for a \"default definition")
         (|htSayStandard| "\\beginscroll ")
         (SETQ |u| (|dbSearchOrder| |conform| |domname| |domain|))
         (|htpSetProperty| |htPage| '|cAlist| |u|)
         (|htpSetProperty| |htPage| '|thing| "constructor")
         (|dbShowCons| |htPage| '|names|))))))))
 
; dbSearchOrder(conform,domname,$domain) ==  --domain = nil or set to live domain
;   conform := domname or conform
;   name:= opOf conform
;   $infovec: local := dbInfovec name or return nil  --exit for categories
;   u := $infovec.3
;   $predvec:=
;     $domain => $domain . 3
;     GETDATABASE(name,'PREDICATES)
;   catpredvec := first u
;   catinfo    := CADR u
;   catvec     := CADDR u
;   catforms := [[pakform,:pred] for i in 0..MAXINDEX catvec | test ] where
;     test ==
;       pred := simpCatPredicate
;         p:=SUBLISLIS(rest conform,$FormalMapVariableList,kTestPred catpredvec.i)
;         $domain => EVAL p
;         p
;       if domname and CONTAINED('$,pred) then pred := SUBST(domname,'$,pred)
; --    which = '"attribute" => pred    --all categories
;       (pak := catinfo . i) and pred   --only those with default packages
;     pakform ==
;       pak and not IDENTP pak => devaluate pak --in case it has been instantiated
;       catform := kFormatSlotDomain catvec . i
; --    which = '"attribute" => dbSubConform(rest conform,catform)
;       res := dbSubConform(rest conform,[pak,"$",:rest catform])
;       if domname then res := SUBST(domname,'$,res)
;       res
;   [:dbAddChain conform,:catforms]
 
(DEFUN |dbSearchOrder| (|conform| |domname| |$domain|)
  (DECLARE (SPECIAL |$domain|))
  (PROG (|$infovec| |catforms| |res| |catform| |pak| |pred| |p| |catvec|
         |catinfo| |catpredvec| |u| |name|)
    (DECLARE (SPECIAL |$infovec|))
    (RETURN
     (PROGN
      (SETQ |conform| (OR |domname| |conform|))
      (SETQ |name| (|opOf| |conform|))
      (SETQ |$infovec| (OR (|dbInfovec| |name|) (RETURN NIL)))
      (SETQ |u| (ELT |$infovec| 3))
      (SETQ |$predvec|
              (COND (|$domain| (ELT |$domain| 3))
                    (#1='T (GETDATABASE |name| 'PREDICATES))))
      (SETQ |catpredvec| (CAR |u|))
      (SETQ |catinfo| (CADR |u|))
      (SETQ |catvec| (CADDR |u|))
      (SETQ |catforms|
              ((LAMBDA (|bfVar#24| |bfVar#23| |i|)
                 (LOOP
                  (COND ((> |i| |bfVar#23|) (RETURN (NREVERSE |bfVar#24|)))
                        (#1#
                         (AND
                          (PROGN
                           (SETQ |pred|
                                   (|simpCatPredicate|
                                    (PROGN
                                     (SETQ |p|
                                             (SUBLISLIS (CDR |conform|)
                                              |$FormalMapVariableList|
                                              (|kTestPred|
                                               (ELT |catpredvec| |i|))))
                                     (COND (|$domain| (EVAL |p|)) (#1# |p|)))))
                           (COND
                            ((AND |domname| (CONTAINED '$ |pred|))
                             (SETQ |pred| (SUBST |domname| '$ |pred|))))
                           (AND (SETQ |pak| (ELT |catinfo| |i|)) |pred|))
                          (SETQ |bfVar#24|
                                  (CONS
                                   (CONS
                                    (COND
                                     ((AND |pak| (NULL (IDENTP |pak|)))
                                      (|devaluate| |pak|))
                                     (#1#
                                      (PROGN
                                       (SETQ |catform|
                                               (|kFormatSlotDomain|
                                                (ELT |catvec| |i|)))
                                       (SETQ |res|
                                               (|dbSubConform| (CDR |conform|)
                                                (CONS |pak|
                                                      (CONS '$
                                                            (CDR |catform|)))))
                                       (COND
                                        (|domname|
                                         (SETQ |res|
                                                 (SUBST |domname| '$ |res|))))
                                       |res|)))
                                    |pred|)
                                   |bfVar#24|)))))
                  (SETQ |i| (+ |i| 1))))
               NIL (MAXINDEX |catvec|) 0))
      (APPEND (|dbAddChain| |conform|) |catforms|)))))
 
; kcPage(htPage,junk) ==
;   [kind,name,nargs,xpart,sig,args,abbrev,comments] := htpProperty(htPage,'parts)
;   domname         := kDomainName(htPage,kind,name,nargs)
;   domname is ['error,:.] => errorPage(htPage,domname)
; --  domain          := (kind = '"category" => nil; EVAL domname)
;   conform := htpProperty(htPage,'conform)
;   conname := opOf conform
;   heading :=
;     null domname => htpProperty(htPage,'heading)
;     ['"{\sf ",form2HtString(domname,nil,true),'"}"]
;   page := htInitPage(['"Cross Reference for ",:heading],htCopyProplist htPage)
;   if domname then
;     htpSetProperty(htPage,'domname,domname)
;     htpSetProperty(htPage,'heading,heading)
;   if kind = '"category" and dbpHasDefaultCategory? xpart then
;     htSay '"This category has default package "
;     bcCon(STRCONC(name,char '_&),'"")
;   htSayStandard '"\newline"
;   htBeginMenu(3)
;   htSayStandard '"\item "
;   message :=
;     kind = '"category" => ['"Categories it directly extends"]
;     ['"Categories the ",(kind = '"default package" => '"package"; kind),'" belongs to by assertion"]
;   htMakePage [['bcLinks,['"\menuitemstyle{Parents}",
;     [['text,'"\tab{12}",:message]],'kcpPage,nil]]]
;   satBreak()
;   message :=
;     kind = '"category" => ['"All categories it is an extension of"]
;     ['"All categories the ",kind,'" belongs to"]
;   htMakePage [['bcLinks,['"\menuitemstyle{Ancestors}",
;     [['text,'"\tab{12}",:message]],'kcaPage,nil]]]
;   if kind = '"category" then
;     satBreak()
;     htMakePage [['bcLinks,['"\menuitemstyle{Children}",[['text,'"\tab{12}",
;       '"Categories which directly extend this category"]],'kccPage,nil]]]
; 
;     satBreak()
;     htMakePage [['bcLinks,['"\menuitemstyle{Descendants}",[['text,'"\tab{12}",
;       '"All categories which extend this category"]],'kcdPage,nil]]]
;   if not asharpConstructorName? conname then
;     satBreak()
;     message := '"Constructors mentioning this as an argument type"
;     htMakePage [['bcLinks,['"\menuitemstyle{Dependents}",
;       [['text,'"\tab{12}",message]],'kcdePage,nil]]]
;   if not asharpConstructorName? conname and kind ~= '"category" then
;     satBreak()
;     htMakePage [['bcLinks,['"\menuitemstyle{Lineage}",
;       '"\tab{12}Constructor hierarchy used for operation lookup",'ksPage,nil]]]
;   if not asharpConstructorName? conname then
;    if kind = '"category" then
;     satBreak()
;     htMakePage [['bcLinks,['"\menuitemstyle{Domains}",[['text,'"\tab{12}",
;       '"All domains which are of this category"]],'kcdoPage,nil]]]
;    if kind ~= '"category" then
;     satBreak()
;     htMakePage [['bcLinks,['"\menuitemstyle{Clients}",'"\tab{12}Constructors",'kcuPage,nil]]]
;     if HGET($defaultPackageNamesHT,conname)
;       then htSay('" which {\em may use} this default package")
; --  htMakePage [['bcLinks,['"files",'"",'kcuPage,true]]]
;       else htSay('" which {\em use} this ",kind)
;   if kind ~= '"category" or dbpHasDefaultCategory? xpart then
;     satBreak()
;     message :=
;       kind = '"category" => ['"Constructors {\em used by} its default package"]
;       ['"Constructors {\em used by} the ",kind]
;     htMakePage [['bcLinks,['"\menuitemstyle{Benefactors}",
;       [['text,'"\tab{12}",:message]],'kcnPage,nil]]]
;   --to remove "Capsule Information", comment out the next 5 lines
;   if not asharpConstructorName? conname and hasNewInfoAlist conname then
;     satBreak()
;     message := ['"Cross reference for capsule implementation"]
;     htMakePage [['bcLinks,['"\menuitemstyle{CapsuleInfo}",
;       [['text,'"\tab{12}",:message]],'kciPage,nil]]]
;   htEndMenu(3)
;   htShowPage()
 
(DEFUN |kcPage| (|htPage| |junk|)
  (PROG (|LETTMP#1| |kind| |name| |nargs| |xpart| |sig| |args| |abbrev|
         |comments| |domname| |conform| |conname| |heading| |page| |message|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (|htpProperty| |htPage| '|parts|))
      (SETQ |kind| (CAR |LETTMP#1|))
      (SETQ |name| (CADR . #1=(|LETTMP#1|)))
      (SETQ |nargs| (CADDR . #1#))
      (SETQ |xpart| (CADDDR . #1#))
      (SETQ |sig| (CAR #2=(CDDDDR . #1#)))
      (SETQ |args| (CADR . #3=(#2#)))
      (SETQ |abbrev| (CADDR . #3#))
      (SETQ |comments| (CADDDR . #3#))
      (SETQ |domname| (|kDomainName| |htPage| |kind| |name| |nargs|))
      (COND
       ((AND (CONSP |domname|) (EQ (CAR |domname|) '|error|))
        (|errorPage| |htPage| |domname|))
       (#4='T
        (PROGN
         (SETQ |conform| (|htpProperty| |htPage| '|conform|))
         (SETQ |conname| (|opOf| |conform|))
         (SETQ |heading|
                 (COND ((NULL |domname|) (|htpProperty| |htPage| '|heading|))
                       (#4#
                        (LIST "{\\sf " (|form2HtString| |domname| NIL T)
                              "}"))))
         (SETQ |page|
                 (|htInitPage| (CONS "Cross Reference for " |heading|)
                  (|htCopyProplist| |htPage|)))
         (COND
          (|domname| (|htpSetProperty| |htPage| '|domname| |domname|)
           (|htpSetProperty| |htPage| '|heading| |heading|)))
         (COND
          ((AND (EQUAL |kind| "category") (|dbpHasDefaultCategory?| |xpart|))
           (|htSay| "This category has default package ")
           (|bcCon| (STRCONC |name| (|char| '&)) "")))
         (|htSayStandard| "\\newline")
         (|htBeginMenu| 3)
         (|htSayStandard| "\\item ")
         (SETQ |message|
                 (COND
                  ((EQUAL |kind| "category")
                   (LIST "Categories it directly extends"))
                  (#4#
                   (LIST "Categories the "
                         (COND ((EQUAL |kind| "default package") "package")
                               (#4# |kind|))
                         " belongs to by assertion"))))
         (|htMakePage|
          (LIST
           (LIST '|bcLinks|
                 (LIST "\\menuitemstyle{Parents}"
                       (LIST (CONS '|text| (CONS "\\tab{12}" |message|)))
                       '|kcpPage| NIL))))
         (|satBreak|)
         (SETQ |message|
                 (COND
                  ((EQUAL |kind| "category")
                   (LIST "All categories it is an extension of"))
                  (#4# (LIST "All categories the " |kind| " belongs to"))))
         (|htMakePage|
          (LIST
           (LIST '|bcLinks|
                 (LIST "\\menuitemstyle{Ancestors}"
                       (LIST (CONS '|text| (CONS "\\tab{12}" |message|)))
                       '|kcaPage| NIL))))
         (COND
          ((EQUAL |kind| "category") (|satBreak|)
           (|htMakePage|
            (LIST
             (LIST '|bcLinks|
                   (LIST "\\menuitemstyle{Children}"
                         (LIST
                          (LIST '|text| "\\tab{12}"
                                "Categories which directly extend this category"))
                         '|kccPage| NIL))))
           (|satBreak|)
           (|htMakePage|
            (LIST
             (LIST '|bcLinks|
                   (LIST "\\menuitemstyle{Descendants}"
                         (LIST
                          (LIST '|text| "\\tab{12}"
                                "All categories which extend this category"))
                         '|kcdPage| NIL))))))
         (COND
          ((NULL (|asharpConstructorName?| |conname|)) (|satBreak|)
           (SETQ |message| "Constructors mentioning this as an argument type")
           (|htMakePage|
            (LIST
             (LIST '|bcLinks|
                   (LIST "\\menuitemstyle{Dependents}"
                         (LIST (LIST '|text| "\\tab{12}" |message|))
                         '|kcdePage| NIL))))))
         (COND
          ((AND (NULL (|asharpConstructorName?| |conname|))
                (NOT (EQUAL |kind| "category")))
           (|satBreak|)
           (|htMakePage|
            (LIST
             (LIST '|bcLinks|
                   (LIST "\\menuitemstyle{Lineage}"
                         "\\tab{12}Constructor hierarchy used for operation lookup"
                         '|ksPage| NIL))))))
         (COND
          ((NULL (|asharpConstructorName?| |conname|))
           (COND
            ((EQUAL |kind| "category") (|satBreak|)
             (|htMakePage|
              (LIST
               (LIST '|bcLinks|
                     (LIST "\\menuitemstyle{Domains}"
                           (LIST
                            (LIST '|text| "\\tab{12}"
                                  "All domains which are of this category"))
                           '|kcdoPage| NIL))))))
           (COND
            ((NOT (EQUAL |kind| "category")) (|satBreak|)
             (|htMakePage|
              (LIST
               (LIST '|bcLinks|
                     (LIST "\\menuitemstyle{Clients}" "\\tab{12}Constructors"
                           '|kcuPage| NIL))))
             (COND
              ((HGET |$defaultPackageNamesHT| |conname|)
               (|htSay| " which {\\em may use} this default package"))
              (#4# (|htSay| " which {\\em use} this " |kind|)))))))
         (COND
          ((OR (NOT (EQUAL |kind| "category"))
               (|dbpHasDefaultCategory?| |xpart|))
           (|satBreak|)
           (SETQ |message|
                   (COND
                    ((EQUAL |kind| "category")
                     (LIST "Constructors {\\em used by} its default package"))
                    (#4# (LIST "Constructors {\\em used by} the " |kind|))))
           (|htMakePage|
            (LIST
             (LIST '|bcLinks|
                   (LIST "\\menuitemstyle{Benefactors}"
                         (LIST (CONS '|text| (CONS "\\tab{12}" |message|)))
                         '|kcnPage| NIL))))))
         (COND
          ((AND (NULL (|asharpConstructorName?| |conname|))
                (|hasNewInfoAlist| |conname|))
           (|satBreak|)
           (SETQ |message| (LIST "Cross reference for capsule implementation"))
           (|htMakePage|
            (LIST
             (LIST '|bcLinks|
                   (LIST "\\menuitemstyle{CapsuleInfo}"
                         (LIST (CONS '|text| (CONS "\\tab{12}" |message|)))
                         '|kciPage| NIL))))))
         (|htEndMenu| 3)
         (|htShowPage|))))))))
 
; kcpPage(htPage,junk) ==
;   [kind,name,nargs,xpart,sig,args,abbrev,comments] := htpProperty(htPage,'parts)
;   domname         := kDomainName(htPage,kind,name,nargs)
;   domname is ['error,:.] => errorPage(htPage,domname)
;   heading :=
;     null domname => htpProperty(htPage,'heading)
;     ['"{\sf ",form2HtString(domname,nil,true),'"}"]
;   if domname then
;     htpSetProperty(htPage,'domname,domname)
;     htpSetProperty(htPage,'heading,heading)
;   conform := htpProperty(htPage,'conform)
;   conname := opOf conform
;   page := htInitPage(['"Parents of ",:heading],htCopyProplist htPage)
;   parents := parentsOf conname --was listSort(function GLESSEQP, =this)
;   if domname then parents := SUBLISLIS(rest domname,rest conform,parents)
;   htpSetProperty(htPage,'cAlist,parents)
;   htpSetProperty(htPage,'thing,'"parent")
;   choice :=
;     domname => 'parameters
;     'names
;   dbShowCons(htPage,choice)
 
(DEFUN |kcpPage| (|htPage| |junk|)
  (PROG (|LETTMP#1| |kind| |name| |nargs| |xpart| |sig| |args| |abbrev|
         |comments| |domname| |heading| |conform| |conname| |page| |parents|
         |choice|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (|htpProperty| |htPage| '|parts|))
      (SETQ |kind| (CAR |LETTMP#1|))
      (SETQ |name| (CADR . #1=(|LETTMP#1|)))
      (SETQ |nargs| (CADDR . #1#))
      (SETQ |xpart| (CADDDR . #1#))
      (SETQ |sig| (CAR #2=(CDDDDR . #1#)))
      (SETQ |args| (CADR . #3=(#2#)))
      (SETQ |abbrev| (CADDR . #3#))
      (SETQ |comments| (CADDDR . #3#))
      (SETQ |domname| (|kDomainName| |htPage| |kind| |name| |nargs|))
      (COND
       ((AND (CONSP |domname|) (EQ (CAR |domname|) '|error|))
        (|errorPage| |htPage| |domname|))
       (#4='T
        (PROGN
         (SETQ |heading|
                 (COND ((NULL |domname|) (|htpProperty| |htPage| '|heading|))
                       (#4#
                        (LIST "{\\sf " (|form2HtString| |domname| NIL T)
                              "}"))))
         (COND
          (|domname| (|htpSetProperty| |htPage| '|domname| |domname|)
           (|htpSetProperty| |htPage| '|heading| |heading|)))
         (SETQ |conform| (|htpProperty| |htPage| '|conform|))
         (SETQ |conname| (|opOf| |conform|))
         (SETQ |page|
                 (|htInitPage| (CONS "Parents of " |heading|)
                  (|htCopyProplist| |htPage|)))
         (SETQ |parents| (|parentsOf| |conname|))
         (COND
          (|domname|
           (SETQ |parents|
                   (SUBLISLIS (CDR |domname|) (CDR |conform|) |parents|))))
         (|htpSetProperty| |htPage| '|cAlist| |parents|)
         (|htpSetProperty| |htPage| '|thing| "parent")
         (SETQ |choice| (COND (|domname| '|parameters|) (#4# '|names|)))
         (|dbShowCons| |htPage| |choice|))))))))
 
; reduceAlistForDomain(alist,domform,conform) == --called from kccPage
;   alist := SUBLISLIS(rest domform,rest conform,alist)
;   for pair in alist repeat RPLACD(pair, simpHasPred(rest pair, domform))
;   [pair for (pair := [.,:pred]) in alist | pred]
 
(DEFUN |reduceAlistForDomain| (|alist| |domform| |conform|)
  (PROG (|pred|)
    (RETURN
     (PROGN
      (SETQ |alist| (SUBLISLIS (CDR |domform|) (CDR |conform|) |alist|))
      ((LAMBDA (|bfVar#25| |pair|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#25|) (PROGN (SETQ |pair| (CAR |bfVar#25|)) NIL))
            (RETURN NIL))
           (#1='T (RPLACD |pair| (|simpHasPred| (CDR |pair|) |domform|))))
          (SETQ |bfVar#25| (CDR |bfVar#25|))))
       |alist| NIL)
      ((LAMBDA (|bfVar#27| |bfVar#26| |pair|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#26|) (PROGN (SETQ |pair| (CAR |bfVar#26|)) NIL))
            (RETURN (NREVERSE |bfVar#27|)))
           (#1#
            (AND (CONSP |pair|) (PROGN (SETQ |pred| (CDR |pair|)) #1#) |pred|
                 (SETQ |bfVar#27| (CONS |pair| |bfVar#27|)))))
          (SETQ |bfVar#26| (CDR |bfVar#26|))))
       NIL |alist| NIL)))))
 
; kcaPage(htPage,junk) ==
;   kcaPage1(htPage,'"category",'" an ",'"ancestor",function ancestorsOf, false)
 
(DEFUN |kcaPage| (|htPage| |junk|)
  (PROG ()
    (RETURN
     (|kcaPage1| |htPage| "category" " an " "ancestor" #'|ancestorsOf| NIL))))
 
; kcdPage(htPage,junk) ==
;   kcaPage1(htPage,'"category",'" a ",'"descendant",function descendantsOf,true)
 
(DEFUN |kcdPage| (|htPage| |junk|)
  (PROG ()
    (RETURN
     (|kcaPage1| |htPage| "category" " a " "descendant" #'|descendantsOf| T))))
 
; kcdoPage(htPage,junk)==
;   kcaPage1(htPage,'"domain",'" a ",'"descendant",function domainsOf, false)
 
(DEFUN |kcdoPage| (|htPage| |junk|)
  (PROG ()
    (RETURN
     (|kcaPage1| |htPage| "domain" " a " "descendant" #'|domainsOf| NIL))))
 
; kcaPage1(htPage,kind,article,whichever,fn, isCatDescendants?) ==
;   [kind,name,nargs,xpart,sig,args,abbrev,comments] := htpProperty(htPage,'parts)
;   domname         := kDomainName(htPage,kind,name,nargs)
;   domname is ['error,:.] => errorPage(htPage,domname)
;   heading :=
;     null domname => htpProperty(htPage,'heading)
;     ['"{\sf ",form2HtString(domname,nil,true),'"}"]
;   if domname and not isCatDescendants? then
;     htpSetProperty(htPage,'domname,domname)
;     htpSetProperty(htPage,'heading,heading)
;   conform := htpProperty(htPage,'conform)
;   conname := opOf conform
;   ancestors := FUNCALL(fn, conform, domname)
;   if whichever ~= '"ancestor" then
;     ancestors := augmentHasArgs(ancestors,conform)
;   ancestors := listSort(function GLESSEQP,ancestors)
; --if domname then ancestors := SUBST(domname,'$,ancestors)
;   htpSetProperty(htPage,'cAlist,ancestors)
;   htpSetProperty(htPage,'thing,whichever)
;   choice :=
; --  domname => 'parameters
;     'names
;   dbShowCons(htPage,choice)
 
(DEFUN |kcaPage1|
       (|htPage| |kind| |article| |whichever| |fn| |isCatDescendants?|)
  (PROG (|LETTMP#1| |name| |nargs| |xpart| |sig| |args| |abbrev| |comments|
         |domname| |heading| |conform| |conname| |ancestors| |choice|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (|htpProperty| |htPage| '|parts|))
      (SETQ |kind| (CAR |LETTMP#1|))
      (SETQ |name| (CADR . #1=(|LETTMP#1|)))
      (SETQ |nargs| (CADDR . #1#))
      (SETQ |xpart| (CADDDR . #1#))
      (SETQ |sig| (CAR #2=(CDDDDR . #1#)))
      (SETQ |args| (CADR . #3=(#2#)))
      (SETQ |abbrev| (CADDR . #3#))
      (SETQ |comments| (CADDDR . #3#))
      (SETQ |domname| (|kDomainName| |htPage| |kind| |name| |nargs|))
      (COND
       ((AND (CONSP |domname|) (EQ (CAR |domname|) '|error|))
        (|errorPage| |htPage| |domname|))
       (#4='T
        (PROGN
         (SETQ |heading|
                 (COND ((NULL |domname|) (|htpProperty| |htPage| '|heading|))
                       (#4#
                        (LIST "{\\sf " (|form2HtString| |domname| NIL T)
                              "}"))))
         (COND
          ((AND |domname| (NULL |isCatDescendants?|))
           (|htpSetProperty| |htPage| '|domname| |domname|)
           (|htpSetProperty| |htPage| '|heading| |heading|)))
         (SETQ |conform| (|htpProperty| |htPage| '|conform|))
         (SETQ |conname| (|opOf| |conform|))
         (SETQ |ancestors| (FUNCALL |fn| |conform| |domname|))
         (COND
          ((NOT (EQUAL |whichever| "ancestor"))
           (SETQ |ancestors| (|augmentHasArgs| |ancestors| |conform|))))
         (SETQ |ancestors| (|listSort| #'GLESSEQP |ancestors|))
         (|htpSetProperty| |htPage| '|cAlist| |ancestors|)
         (|htpSetProperty| |htPage| '|thing| |whichever|)
         (SETQ |choice| '|names|)
         (|dbShowCons| |htPage| |choice|))))))))
 
; kccPage(htPage,junk) ==
;   [kind,name,nargs,xpart,sig,args,abbrev,comments] := htpProperty(htPage,'parts)
;   domname         := kDomainName(htPage,kind,name,nargs)
;   domname is ['error,:.] => errorPage(htPage,domname)
;   heading :=
;     null domname => htpProperty(htPage,'heading)
;     ['"{\sf ",form2HtString(domname,nil,true),'"}"]
;   if domname then
;     htpSetProperty(htPage,'domname,domname)
;     htpSetProperty(htPage,'heading,heading)
;   conform := htpProperty(htPage,'conform)
;   conname := opOf conform
;   page := htInitPage(['"Children of ",:heading],htCopyProplist htPage)
;   children:= augmentHasArgs(childrenOf conform,conform)
;   if domname then children := reduceAlistForDomain(children,domname,conform)
;   htpSetProperty(htPage,'cAlist,children)
;   htpSetProperty(htPage,'thing,'"child")
;   dbShowCons(htPage,'names)
 
(DEFUN |kccPage| (|htPage| |junk|)
  (PROG (|LETTMP#1| |kind| |name| |nargs| |xpart| |sig| |args| |abbrev|
         |comments| |domname| |heading| |conform| |conname| |page| |children|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (|htpProperty| |htPage| '|parts|))
      (SETQ |kind| (CAR |LETTMP#1|))
      (SETQ |name| (CADR . #1=(|LETTMP#1|)))
      (SETQ |nargs| (CADDR . #1#))
      (SETQ |xpart| (CADDDR . #1#))
      (SETQ |sig| (CAR #2=(CDDDDR . #1#)))
      (SETQ |args| (CADR . #3=(#2#)))
      (SETQ |abbrev| (CADDR . #3#))
      (SETQ |comments| (CADDDR . #3#))
      (SETQ |domname| (|kDomainName| |htPage| |kind| |name| |nargs|))
      (COND
       ((AND (CONSP |domname|) (EQ (CAR |domname|) '|error|))
        (|errorPage| |htPage| |domname|))
       (#4='T
        (PROGN
         (SETQ |heading|
                 (COND ((NULL |domname|) (|htpProperty| |htPage| '|heading|))
                       (#4#
                        (LIST "{\\sf " (|form2HtString| |domname| NIL T)
                              "}"))))
         (COND
          (|domname| (|htpSetProperty| |htPage| '|domname| |domname|)
           (|htpSetProperty| |htPage| '|heading| |heading|)))
         (SETQ |conform| (|htpProperty| |htPage| '|conform|))
         (SETQ |conname| (|opOf| |conform|))
         (SETQ |page|
                 (|htInitPage| (CONS "Children of " |heading|)
                  (|htCopyProplist| |htPage|)))
         (SETQ |children|
                 (|augmentHasArgs| (|childrenOf| |conform|) |conform|))
         (COND
          (|domname|
           (SETQ |children|
                   (|reduceAlistForDomain| |children| |domname| |conform|))))
         (|htpSetProperty| |htPage| '|cAlist| |children|)
         (|htpSetProperty| |htPage| '|thing| "child")
         (|dbShowCons| |htPage| '|names|))))))))
 
; augmentHasArgs(alist,conform) ==
;   conname := opOf conform
;   args    := IFCDR conform or return alist
;   n       := #args
;   [[name,:pred] for [name,:p] in alist] where pred ==
;      extractHasArgs p is [a,:b] => p
;      quickAnd(p, ['hasArgs, :TAKE(n, IFCDR getConstructorForm opOf name)])
 
(DEFUN |augmentHasArgs| (|alist| |conform|)
  (PROG (|conname| |args| |n| |name| |p| |ISTMP#1| |a| |b|)
    (RETURN
     (PROGN
      (SETQ |conname| (|opOf| |conform|))
      (SETQ |args| (OR (IFCDR |conform|) (RETURN |alist|)))
      (SETQ |n| (LENGTH |args|))
      ((LAMBDA (|bfVar#30| |bfVar#29| |bfVar#28|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#29|)
                (PROGN (SETQ |bfVar#28| (CAR |bfVar#29|)) NIL))
            (RETURN (NREVERSE |bfVar#30|)))
           (#1='T
            (AND (CONSP |bfVar#28|)
                 (PROGN
                  (SETQ |name| (CAR |bfVar#28|))
                  (SETQ |p| (CDR |bfVar#28|))
                  #1#)
                 (SETQ |bfVar#30|
                         (CONS
                          (CONS |name|
                                (COND
                                 ((PROGN
                                   (SETQ |ISTMP#1| (|extractHasArgs| |p|))
                                   (AND (CONSP |ISTMP#1|)
                                        (PROGN
                                         (SETQ |a| (CAR |ISTMP#1|))
                                         (SETQ |b| (CDR |ISTMP#1|))
                                         #1#)))
                                  |p|)
                                 (#1#
                                  (|quickAnd| |p|
                                   (CONS '|hasArgs|
                                         (TAKE |n|
                                          (IFCDR
                                           (|getConstructorForm|
                                            (|opOf| |name|)))))))))
                          |bfVar#30|)))))
          (SETQ |bfVar#29| (CDR |bfVar#29|))))
       NIL |alist| NIL)))))
 
; kcdePage(htPage,junk) ==
;   [kind,name,nargs,xflag,sig,args,abbrev,comments] := htpProperty(htPage,'parts)
;   conname         := INTERN name
;   constring       := STRCONC(name,args)
;   conform         :=
;     kind ~= '"default package" => ncParseFromString constring
;     [INTERN name,:rest ncParseFromString STRCONC(char 'd,args)]  --because of &
;   pakname         :=
; --  kind = '"category" => INTERN STRCONC(name,char '_&)
;     opOf conform
;   domList := getDependentsOfConstructor pakname
;   cAlist := [[getConstructorForm x,:true] for x in domList]
;   htpSetProperty(htPage,'cAlist,cAlist)
;   htpSetProperty(htPage,'thing,'"dependent")
;   dbShowCons(htPage,'names)
 
(DEFUN |kcdePage| (|htPage| |junk|)
  (PROG (|LETTMP#1| |kind| |name| |nargs| |xflag| |sig| |args| |abbrev|
         |comments| |conname| |constring| |conform| |pakname| |domList|
         |cAlist|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (|htpProperty| |htPage| '|parts|))
      (SETQ |kind| (CAR |LETTMP#1|))
      (SETQ |name| (CADR . #1=(|LETTMP#1|)))
      (SETQ |nargs| (CADDR . #1#))
      (SETQ |xflag| (CADDDR . #1#))
      (SETQ |sig| (CAR #2=(CDDDDR . #1#)))
      (SETQ |args| (CADR . #3=(#2#)))
      (SETQ |abbrev| (CADDR . #3#))
      (SETQ |comments| (CADDDR . #3#))
      (SETQ |conname| (INTERN |name|))
      (SETQ |constring| (STRCONC |name| |args|))
      (SETQ |conform|
              (COND
               ((NOT (EQUAL |kind| "default package"))
                (|ncParseFromString| |constring|))
               (#4='T
                (CONS (INTERN |name|)
                      (CDR
                       (|ncParseFromString|
                        (STRCONC (|char| '|d|) |args|)))))))
      (SETQ |pakname| (|opOf| |conform|))
      (SETQ |domList| (|getDependentsOfConstructor| |pakname|))
      (SETQ |cAlist|
              ((LAMBDA (|bfVar#32| |bfVar#31| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#31|)
                        (PROGN (SETQ |x| (CAR |bfVar#31|)) NIL))
                    (RETURN (NREVERSE |bfVar#32|)))
                   (#4#
                    (SETQ |bfVar#32|
                            (CONS (CONS (|getConstructorForm| |x|) T)
                                  |bfVar#32|))))
                  (SETQ |bfVar#31| (CDR |bfVar#31|))))
               NIL |domList| NIL))
      (|htpSetProperty| |htPage| '|cAlist| |cAlist|)
      (|htpSetProperty| |htPage| '|thing| "dependent")
      (|dbShowCons| |htPage| '|names|)))))
 
; kcuPage(htPage,junk) ==
;   [kind,name,nargs,xflag,sig,args,abbrev,comments] := htpProperty(htPage,'parts)
;   conname         := INTERN name
;   constring       := STRCONC(name,args)
;   conform         :=
;     kind ~= '"default package" => ncParseFromString constring
;     [INTERN name,:rest ncParseFromString STRCONC(char 'd,args)]  --because of &
;   pakname         :=
;     kind = '"category" => INTERN STRCONC(name,char '_&)
;     opOf conform
;   domList := getUsersOfConstructor pakname
;   cAlist := [[getConstructorForm x,:true] for x in domList]
;   htpSetProperty(htPage,'cAlist,cAlist)
;   htpSetProperty(htPage,'thing,'"user")
;   dbShowCons(htPage,'names)
 
(DEFUN |kcuPage| (|htPage| |junk|)
  (PROG (|LETTMP#1| |kind| |name| |nargs| |xflag| |sig| |args| |abbrev|
         |comments| |conname| |constring| |conform| |pakname| |domList|
         |cAlist|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (|htpProperty| |htPage| '|parts|))
      (SETQ |kind| (CAR |LETTMP#1|))
      (SETQ |name| (CADR . #1=(|LETTMP#1|)))
      (SETQ |nargs| (CADDR . #1#))
      (SETQ |xflag| (CADDDR . #1#))
      (SETQ |sig| (CAR #2=(CDDDDR . #1#)))
      (SETQ |args| (CADR . #3=(#2#)))
      (SETQ |abbrev| (CADDR . #3#))
      (SETQ |comments| (CADDDR . #3#))
      (SETQ |conname| (INTERN |name|))
      (SETQ |constring| (STRCONC |name| |args|))
      (SETQ |conform|
              (COND
               ((NOT (EQUAL |kind| "default package"))
                (|ncParseFromString| |constring|))
               (#4='T
                (CONS (INTERN |name|)
                      (CDR
                       (|ncParseFromString|
                        (STRCONC (|char| '|d|) |args|)))))))
      (SETQ |pakname|
              (COND
               ((EQUAL |kind| "category")
                (INTERN (STRCONC |name| (|char| '&))))
               (#4# (|opOf| |conform|))))
      (SETQ |domList| (|getUsersOfConstructor| |pakname|))
      (SETQ |cAlist|
              ((LAMBDA (|bfVar#34| |bfVar#33| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#33|)
                        (PROGN (SETQ |x| (CAR |bfVar#33|)) NIL))
                    (RETURN (NREVERSE |bfVar#34|)))
                   (#4#
                    (SETQ |bfVar#34|
                            (CONS (CONS (|getConstructorForm| |x|) T)
                                  |bfVar#34|))))
                  (SETQ |bfVar#33| (CDR |bfVar#33|))))
               NIL |domList| NIL))
      (|htpSetProperty| |htPage| '|cAlist| |cAlist|)
      (|htpSetProperty| |htPage| '|thing| "user")
      (|dbShowCons| |htPage| '|names|)))))
 
; kcnPage(htPage,junk) ==
; --if reached by a category, that category has a default package
;   [kind,name,nargs,xpart,sig,args,abbrev,comments] := htpProperty(htPage,'parts)
;   domname         := kDomainName(htPage,kind,name,nargs)
;   domname is ['error,:.] => errorPage(htPage,domname)
;   heading :=
;     null domname => htpProperty(htPage,'heading)
;     ['"{\sf ",form2HtString(domname,nil,true),'"}"]
;   if domname then
;     htpSetProperty(htPage,'domname,domname)
;     htpSetProperty(htPage,'heading,heading)
;   conform:= htpProperty(htPage,'conform)
;   pakname         :=
;     kind = '"category" => INTERN STRCONC(PNAME conname,char '_&)
;     opOf conform
;   domList := getImports pakname
;   if domname then
;     domList := SUBLISLIS([domname,:rest domname],['$,:rest conform],domList)
;   cAlist := [[x,:true] for x in domList]
;   htpSetProperty(htPage,'cAlist,cAlist)
;   htpSetProperty(htPage,'thing,'"benefactor")
;   dbShowCons(htPage,'names)
 
(DEFUN |kcnPage| (|htPage| |junk|)
  (PROG (|LETTMP#1| |kind| |name| |nargs| |xpart| |sig| |args| |abbrev|
         |comments| |domname| |heading| |conform| |pakname| |domList| |cAlist|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (|htpProperty| |htPage| '|parts|))
      (SETQ |kind| (CAR |LETTMP#1|))
      (SETQ |name| (CADR . #1=(|LETTMP#1|)))
      (SETQ |nargs| (CADDR . #1#))
      (SETQ |xpart| (CADDDR . #1#))
      (SETQ |sig| (CAR #2=(CDDDDR . #1#)))
      (SETQ |args| (CADR . #3=(#2#)))
      (SETQ |abbrev| (CADDR . #3#))
      (SETQ |comments| (CADDDR . #3#))
      (SETQ |domname| (|kDomainName| |htPage| |kind| |name| |nargs|))
      (COND
       ((AND (CONSP |domname|) (EQ (CAR |domname|) '|error|))
        (|errorPage| |htPage| |domname|))
       (#4='T
        (PROGN
         (SETQ |heading|
                 (COND ((NULL |domname|) (|htpProperty| |htPage| '|heading|))
                       (#4#
                        (LIST "{\\sf " (|form2HtString| |domname| NIL T)
                              "}"))))
         (COND
          (|domname| (|htpSetProperty| |htPage| '|domname| |domname|)
           (|htpSetProperty| |htPage| '|heading| |heading|)))
         (SETQ |conform| (|htpProperty| |htPage| '|conform|))
         (SETQ |pakname|
                 (COND
                  ((EQUAL |kind| "category")
                   (INTERN (STRCONC (PNAME |conname|) (|char| '&))))
                  (#4# (|opOf| |conform|))))
         (SETQ |domList| (|getImports| |pakname|))
         (COND
          (|domname|
           (SETQ |domList|
                   (SUBLISLIS (CONS |domname| (CDR |domname|))
                    (CONS '$ (CDR |conform|)) |domList|))))
         (SETQ |cAlist|
                 ((LAMBDA (|bfVar#36| |bfVar#35| |x|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#35|)
                           (PROGN (SETQ |x| (CAR |bfVar#35|)) NIL))
                       (RETURN (NREVERSE |bfVar#36|)))
                      (#4# (SETQ |bfVar#36| (CONS (CONS |x| T) |bfVar#36|))))
                     (SETQ |bfVar#35| (CDR |bfVar#35|))))
                  NIL |domList| NIL))
         (|htpSetProperty| |htPage| '|cAlist| |cAlist|)
         (|htpSetProperty| |htPage| '|thing| "benefactor")
         (|dbShowCons| |htPage| '|names|))))))))
 
; koPageInputAreaUnchanged?(htPage, nargs) ==
;   [htpLabelInputString(htPage,INTERN STRCONC('"*",STRINGIMAGE i)) for i in 1..nargs]
;       = htpProperty(htPage,'inputAreaList)
 
(DEFUN |koPageInputAreaUnchanged?| (|htPage| |nargs|)
  (PROG ()
    (RETURN
     (EQUAL
      ((LAMBDA (|bfVar#37| |i|)
         (LOOP
          (COND ((> |i| |nargs|) (RETURN (NREVERSE |bfVar#37|)))
                ('T
                 (SETQ |bfVar#37|
                         (CONS
                          (|htpLabelInputString| |htPage|
                           (INTERN (STRCONC "*" (STRINGIMAGE |i|))))
                          |bfVar#37|))))
          (SETQ |i| (+ |i| 1))))
       NIL 1)
      (|htpProperty| |htPage| '|inputAreaList|)))))
 
; kDomainName(htPage,kind,name,nargs) ==
;   htpSetProperty(htPage,'domname,nil)
;   inputAreaList :=
;     [htpLabelInputString(htPage,var) for i in 1..nargs for var in $PatternVariableList]
;   htpSetProperty(htPage,'inputAreaList,inputAreaList)
;   conname := INTERN name
;   args := [kArgumentCheck(domain?,x) or nil for x in inputAreaList
;               for domain? in rest GETDATABASE(conname,'COSIG)]
;   or/[null x for x in args] =>
;     (n := +/[1 for x in args | x]) > 0 =>
;       ['error,nil,'"\centerline{You gave values for only {\em ",n,'" } of the {\em ",#args,'"}}",'"\centerline{parameters of {\sf ",name,'"}}\vspace{1}\centerline{Please enter either {\em all} or {\em none} of the type parameters}"]
;     nil
;   argString :=
;     null args => '"()"
;     argTailPart :=
;       "STRCONC"/["STRCONC"/ ['",", :x] for x in IFCDR args]
;     "STRCONC"/['"(",:first args,argTailPart,'")"]
;   typeForm := CATCH('SPAD_READER, unabbrev mkConform(kind, name, argString)) or
;     ['error,'invalidType,STRCONC(name,argString)]
;   null (evaluatedTypeForm := kisValidType typeForm) =>
;     ['error,'invalidType,STRCONC(name,argString)]
;   dbMkEvalable evaluatedTypeForm
 
(DEFUN |kDomainName| (|htPage| |kind| |name| |nargs|)
  (PROG (|inputAreaList| |conname| |args| |n| |argTailPart| |argString|
         |typeForm| |evaluatedTypeForm|)
    (RETURN
     (PROGN
      (|htpSetProperty| |htPage| '|domname| NIL)
      (SETQ |inputAreaList|
              ((LAMBDA (|bfVar#39| |i| |bfVar#38| |var|)
                 (LOOP
                  (COND
                   ((OR (> |i| |nargs|) (ATOM |bfVar#38|)
                        (PROGN (SETQ |var| (CAR |bfVar#38|)) NIL))
                    (RETURN (NREVERSE |bfVar#39|)))
                   (#1='T
                    (SETQ |bfVar#39|
                            (CONS (|htpLabelInputString| |htPage| |var|)
                                  |bfVar#39|))))
                  (SETQ |i| (+ |i| 1))
                  (SETQ |bfVar#38| (CDR |bfVar#38|))))
               NIL 1 |$PatternVariableList| NIL))
      (|htpSetProperty| |htPage| '|inputAreaList| |inputAreaList|)
      (SETQ |conname| (INTERN |name|))
      (SETQ |args|
              ((LAMBDA (|bfVar#42| |bfVar#40| |x| |bfVar#41| |domain?|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#40|)
                        (PROGN (SETQ |x| (CAR |bfVar#40|)) NIL)
                        (ATOM |bfVar#41|)
                        (PROGN (SETQ |domain?| (CAR |bfVar#41|)) NIL))
                    (RETURN (NREVERSE |bfVar#42|)))
                   (#1#
                    (SETQ |bfVar#42|
                            (CONS (OR (|kArgumentCheck| |domain?| |x|) NIL)
                                  |bfVar#42|))))
                  (SETQ |bfVar#40| (CDR |bfVar#40|))
                  (SETQ |bfVar#41| (CDR |bfVar#41|))))
               NIL |inputAreaList| NIL (CDR (GETDATABASE |conname| 'COSIG))
               NIL))
      (COND
       (((LAMBDA (|bfVar#44| |bfVar#43| |x|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#43|) (PROGN (SETQ |x| (CAR |bfVar#43|)) NIL))
              (RETURN |bfVar#44|))
             (#1#
              (PROGN
               (SETQ |bfVar#44| (NULL |x|))
               (COND (|bfVar#44| (RETURN |bfVar#44|))))))
            (SETQ |bfVar#43| (CDR |bfVar#43|))))
         NIL |args| NIL)
        (COND
         ((< 0
             (SETQ |n|
                     ((LAMBDA (|bfVar#46| |bfVar#45| |x|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#45|)
                               (PROGN (SETQ |x| (CAR |bfVar#45|)) NIL))
                           (RETURN |bfVar#46|))
                          (#1# (AND |x| (SETQ |bfVar#46| (+ |bfVar#46| 1)))))
                         (SETQ |bfVar#45| (CDR |bfVar#45|))))
                      0 |args| NIL)))
          (LIST '|error| NIL "\\centerline{You gave values for only {\\em " |n|
                " } of the {\\em " (LENGTH |args|) "}}"
                "\\centerline{parameters of {\\sf " |name|
                "}}\\vspace{1}\\centerline{Please enter either {\\em all} or {\\em none} of the type parameters}"))
         (#1# NIL)))
       (#1#
        (PROGN
         (SETQ |argString|
                 (COND ((NULL |args|) "()")
                       (#1#
                        (PROGN
                         (SETQ |argTailPart|
                                 ((LAMBDA (|bfVar#51| |bfVar#50| |x|)
                                    (LOOP
                                     (COND
                                      ((OR (ATOM |bfVar#50|)
                                           (PROGN
                                            (SETQ |x| (CAR |bfVar#50|))
                                            NIL))
                                       (RETURN |bfVar#51|))
                                      (#1#
                                       (SETQ |bfVar#51|
                                               (STRCONC |bfVar#51|
                                                ((LAMBDA
                                                     (|bfVar#47| |bfVar#49|
                                                      |bfVar#48|)
                                                   (LOOP
                                                    (COND
                                                     ((OR (ATOM |bfVar#49|)
                                                          (PROGN
                                                           (SETQ |bfVar#48|
                                                                   (CAR
                                                                    |bfVar#49|))
                                                           NIL))
                                                      (RETURN |bfVar#47|))
                                                     (#1#
                                                      (SETQ |bfVar#47|
                                                              (STRCONC
                                                               |bfVar#47|
                                                               |bfVar#48|))))
                                                    (SETQ |bfVar#49|
                                                            (CDR |bfVar#49|))))
                                                 #2="" (CONS "," |x|) NIL)))))
                                     (SETQ |bfVar#50| (CDR |bfVar#50|))))
                                  #2# (IFCDR |args|) NIL))
                         ((LAMBDA (|bfVar#52| |bfVar#54| |bfVar#53|)
                            (LOOP
                             (COND
                              ((OR (ATOM |bfVar#54|)
                                   (PROGN
                                    (SETQ |bfVar#53| (CAR |bfVar#54|))
                                    NIL))
                               (RETURN |bfVar#52|))
                              (#1#
                               (SETQ |bfVar#52|
                                       (STRCONC |bfVar#52| |bfVar#53|))))
                             (SETQ |bfVar#54| (CDR |bfVar#54|))))
                          #2#
                          (CONS "("
                                (APPEND (CAR |args|)
                                        (CONS |argTailPart| (CONS ")" NIL))))
                          NIL)))))
         (SETQ |typeForm|
                 (OR
                  (CATCH 'SPAD_READER
                    (|unabbrev| (|mkConform| |kind| |name| |argString|)))
                  (LIST '|error| '|invalidType| (STRCONC |name| |argString|))))
         (COND
          ((NULL (SETQ |evaluatedTypeForm| (|kisValidType| |typeForm|)))
           (LIST '|error| '|invalidType| (STRCONC |name| |argString|)))
          (#1# (|dbMkEvalable| |evaluatedTypeForm|))))))))))
 
; kArgumentCheck(domain?,s) ==
;   s = '"" => nil
;   domain? and (form := conSpecialString? s) =>
;     null IFCDR form => [STRINGIMAGE opOf form]
;     form2String form
;   [s]
 
(DEFUN |kArgumentCheck| (|domain?| |s|)
  (PROG (|form|)
    (RETURN
     (COND ((EQUAL |s| "") NIL)
           ((AND |domain?| (SETQ |form| (|conSpecialString?| |s|)))
            (COND ((NULL (IFCDR |form|)) (LIST (STRINGIMAGE (|opOf| |form|))))
                  (#1='T (|form2String| |form|))))
           (#1# (LIST |s|))))))
 
; dbMkEvalable form ==
; --like mkEvalable except that it does NOT quote domains
; --does not do "loadIfNecessary"
;   [op,:.] := form
;   kind := GETDATABASE(op,'CONSTRUCTORKIND)
;   kind = 'category => form
;   mkEvalable form
 
(DEFUN |dbMkEvalable| (|form|)
  (PROG (|op| |kind|)
    (RETURN
     (PROGN
      (SETQ |op| (CAR |form|))
      (SETQ |kind| (GETDATABASE |op| 'CONSTRUCTORKIND))
      (COND ((EQ |kind| '|category|) |form|) ('T (|mkEvalable| |form|)))))))
 
; topLevelInterpEval x ==
;   $ProcessInteractiveValue: fluid := true
;   $noEvalTypeMsg: fluid := true
;   processInteractive(x,nil)
 
(DEFUN |topLevelInterpEval| (|x|)
  (PROG (|$noEvalTypeMsg| |$ProcessInteractiveValue|)
    (DECLARE (SPECIAL |$noEvalTypeMsg| |$ProcessInteractiveValue|))
    (RETURN
     (PROGN
      (SETQ |$ProcessInteractiveValue| T)
      (SETQ |$noEvalTypeMsg| T)
      (|processInteractive| |x| NIL)))))
 
; kisValidType typeForm ==
;   $ProcessInteractiveValue: fluid := true
;   $noEvalTypeMsg: fluid := true
;   $BreakMode : local := 'throw_reader
;   CATCH('SPAD_READER, processInteractive(typeForm, nil))
;     is [[h,:.],:t] and member(h,'(Type Category)) =>
;       kCheckArgumentNumbers t and t
;   false
 
(DEFUN |kisValidType| (|typeForm|)
  (PROG (|$BreakMode| |$noEvalTypeMsg| |$ProcessInteractiveValue| |t| |h|
         |ISTMP#2| |ISTMP#1|)
    (DECLARE
     (SPECIAL |$BreakMode| |$noEvalTypeMsg| |$ProcessInteractiveValue|))
    (RETURN
     (PROGN
      (SETQ |$ProcessInteractiveValue| T)
      (SETQ |$noEvalTypeMsg| T)
      (SETQ |$BreakMode| '|throw_reader|)
      (COND
       ((AND
         (PROGN
          (SETQ |ISTMP#1|
                  (CATCH 'SPAD_READER (|processInteractive| |typeForm| NIL)))
          (AND (CONSP |ISTMP#1|)
               (PROGN
                (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                (AND (CONSP |ISTMP#2|)
                     (PROGN (SETQ |h| (CAR |ISTMP#2|)) #1='T)))
               (PROGN (SETQ |t| (CDR |ISTMP#1|)) #1#)))
         (|member| |h| '(|Type| |Category|)))
        (AND (|kCheckArgumentNumbers| |t|) |t|))
       (#1# NIL))))))
 
; kCheckArgumentNumbers t ==
;   [conname,:args] := t
;   cosig := IFCDR GETDATABASE(conname, 'COSIG)
;   #cosig ~= #args => false
;   and/[foo for domain? in cosig for x in args] where foo ==
;     domain? => kCheckArgumentNumbers x
;     true
 
(DEFUN |kCheckArgumentNumbers| (|t|)
  (PROG (|conname| |args| |cosig|)
    (RETURN
     (PROGN
      (SETQ |conname| (CAR |t|))
      (SETQ |args| (CDR |t|))
      (SETQ |cosig| (IFCDR (GETDATABASE |conname| 'COSIG)))
      (COND ((NOT (EQL (LENGTH |cosig|) (LENGTH |args|))) NIL)
            (#1='T
             ((LAMBDA (|bfVar#57| |bfVar#55| |domain?| |bfVar#56| |x|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#55|)
                       (PROGN (SETQ |domain?| (CAR |bfVar#55|)) NIL)
                       (ATOM |bfVar#56|)
                       (PROGN (SETQ |x| (CAR |bfVar#56|)) NIL))
                   (RETURN |bfVar#57|))
                  (#1#
                   (PROGN
                    (SETQ |bfVar#57|
                            (COND (|domain?| (|kCheckArgumentNumbers| |x|))
                                  (#1# T)))
                    (COND ((NOT |bfVar#57|) (RETURN NIL))))))
                 (SETQ |bfVar#55| (CDR |bfVar#55|))
                 (SETQ |bfVar#56| (CDR |bfVar#56|))))
              T |cosig| NIL |args| NIL)))))))
 
; parseNoMacroFromString(s) ==
;    s := next(function ncloopParse,
;         next(function lineoftoks,incString s))
;    StreamNull s => nil
;    pf2Sex first rest first s
 
(DEFUN |parseNoMacroFromString| (|s|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |s|
              (|next| #'|ncloopParse|
               (|next| #'|lineoftoks| (|incString| |s|))))
      (COND ((|StreamNull| |s|) NIL) ('T (|pf2Sex| (CAR (CDR (CAR |s|))))))))))
 
; mkConform(kind,name,argString) ==
;   kind ~= '"default package" =>
;     form := STRCONC(name,argString)
;     parse := parseNoMacroFromString form
;     null parse =>
;       sayBrightlyNT '"Won't parse: "
;       pp form
;       systemError '"Keywords in argument list?"
;     ATOM parse => [parse]
;     parse
;   [INTERN name,:rest ncParseFromString STRCONC(char 'd,argString)]  --& case
 
(DEFUN |mkConform| (|kind| |name| |argString|)
  (PROG (|form| |parse|)
    (RETURN
     (COND
      ((NOT (EQUAL |kind| "default package"))
       (PROGN
        (SETQ |form| (STRCONC |name| |argString|))
        (SETQ |parse| (|parseNoMacroFromString| |form|))
        (COND
         ((NULL |parse|)
          (PROGN
           (|sayBrightlyNT| "Won't parse: ")
           (|pp| |form|)
           (|systemError| "Keywords in argument list?")))
         ((ATOM |parse|) (LIST |parse|)) (#1='T |parse|))))
      (#1#
       (CONS (INTERN |name|)
             (CDR
              (|ncParseFromString| (STRCONC (|char| '|d|) |argString|)))))))))
 
; conOpPage(htPage,conform) ==
;   updown := dbCompositeWithMap htPage
;   updown = '"DOWN" =>
;     domname := htpProperty(htPage,'domname)
;     conOpPage1(dbExtractUnderlyingDomain domname,[['updomain,:domname]])
;   domname := htpProperty(htPage,'updomain)
;   conOpPage1(domname,nil)
 
(DEFUN |conOpPage| (|htPage| |conform|)
  (PROG (|updown| |domname|)
    (RETURN
     (PROGN
      (SETQ |updown| (|dbCompositeWithMap| |htPage|))
      (COND
       ((EQUAL |updown| "DOWN")
        (PROGN
         (SETQ |domname| (|htpProperty| |htPage| '|domname|))
         (|conOpPage1| (|dbExtractUnderlyingDomain| |domname|)
          (LIST (CONS '|updomain| |domname|)))))
       ('T
        (PROGN
         (SETQ |domname| (|htpProperty| |htPage| '|updomain|))
         (|conOpPage1| |domname| NIL))))))))
 
; dbCompositeWithMap htPage ==
;   htpProperty(htPage,'updomain) => '"UP"
;   domain := htpProperty(htPage,'domname)
;   null domain => false
;   opAlist := htpProperty(htPage,'opAlist)
; --not LASSOC('map,opAlist) => false
;   dbExtractUnderlyingDomain htpProperty(htPage,'domname) => '"DOWN"
;   false
 
(DEFUN |dbCompositeWithMap| (|htPage|)
  (PROG (|domain| |opAlist|)
    (RETURN
     (COND ((|htpProperty| |htPage| '|updomain|) "UP")
           (#1='T
            (PROGN
             (SETQ |domain| (|htpProperty| |htPage| '|domname|))
             (COND ((NULL |domain|) NIL)
                   (#1#
                    (PROGN
                     (SETQ |opAlist| (|htpProperty| |htPage| '|opAlist|))
                     (COND
                      ((|dbExtractUnderlyingDomain|
                        (|htpProperty| |htPage| '|domname|))
                       "DOWN")
                      (#1# NIL)))))))))))
 
; dbExtractUnderlyingDomain domain == or/[x for x in IFCDR domain | isValidType x]
 
(DEFUN |dbExtractUnderlyingDomain| (|domain|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#59| |bfVar#58| |x|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#58|) (PROGN (SETQ |x| (CAR |bfVar#58|)) NIL))
           (RETURN |bfVar#59|))
          ('T
           (AND (|isValidType| |x|)
                (PROGN
                 (SETQ |bfVar#59| |x|)
                 (COND (|bfVar#59| (RETURN |bfVar#59|)))))))
         (SETQ |bfVar#58| (CDR |bfVar#58|))))
      NIL (IFCDR |domain|) NIL))))
 
; conOpPage1(conform,:options) ==
; --constructors    Cname\#\E\sig \args   \abb \comments (C is C, D, P, X)
;   bindingsAlist := IFCAR options
;   conname       := opOf conform
;   MEMQ(conname,$Primitives) =>
;      dbSpecialOperations conname
;   domname         :=                        --> !!note!! <--
;     null atom conform => conform
;     nil
;   line := conPageFastPath conname
;   [kind,name,nargs,xflag,sig,args,abbrev,comments]:=parts:= dbXParts(line,7,1)
;   isFile := null kind
;   kind := kind or '"package"
;   RPLACA(parts,kind)
;   constring       := STRCONC(name,args)
;   conform         := mkConform(kind,name,args)
;   capitalKind     := capitalize kind
;   signature       := ncParseFromString sig
;   sourceFileName  := dbSourceFile INTERN name
;   emString        := ['"{\sf ",constring,'"}"]
;   heading := [capitalKind,'" ",:emString]
;   if not isExposedConstructor conname then heading := ['"Unexposed ",:heading]
;   page := htInitPage(heading,nil)
;   htpSetProperty(page,'isFile,true)
;   htpSetProperty(page,'fromConOpPage1,true)
;   htpSetProperty(page,'parts,parts)
;   htpSetProperty(page,'heading,heading)
;   htpSetProperty(page,'kind,kind)
;   htpSetProperty(page,'domname,domname)         --> !!note!! <--
;   htpSetProperty(page,'conform,conform)
;   htpSetProperty(page,'signature,signature)
;   if selectedOperation := LASSOC('selectedOperation,IFCDR options) then
;     htpSetProperty(page,'selectedOperation,selectedOperation)
;   for [a,:b] in bindingsAlist repeat htpSetProperty(page,a,b)
;   koPage(page,'"operation")
 
(DEFUN |conOpPage1| (|conform| &REST |options|)
  (PROG (|bindingsAlist| |conname| |domname| |line| |parts| |kind| |name|
         |nargs| |xflag| |sig| |args| |abbrev| |comments| |isFile| |constring|
         |capitalKind| |signature| |sourceFileName| |emString| |heading| |page|
         |selectedOperation| |a| |b|)
    (RETURN
     (PROGN
      (SETQ |bindingsAlist| (IFCAR |options|))
      (SETQ |conname| (|opOf| |conform|))
      (COND ((MEMQ |conname| |$Primitives|) (|dbSpecialOperations| |conname|))
            (#1='T
             (PROGN
              (SETQ |domname|
                      (COND ((NULL (ATOM |conform|)) |conform|) (#1# NIL)))
              (SETQ |line| (|conPageFastPath| |conname|))
              (SETQ |parts| (|dbXParts| |line| 7 1))
              (SETQ |kind| (CAR |parts|))
              (SETQ |name| (CADR . #2=(|parts|)))
              (SETQ |nargs| (CADDR . #2#))
              (SETQ |xflag| (CADDDR . #2#))
              (SETQ |sig| (CAR #3=(CDDDDR . #2#)))
              (SETQ |args| (CADR . #4=(#3#)))
              (SETQ |abbrev| (CADDR . #4#))
              (SETQ |comments| (CADDDR . #4#))
              (SETQ |isFile| (NULL |kind|))
              (SETQ |kind| (OR |kind| "package"))
              (RPLACA |parts| |kind|)
              (SETQ |constring| (STRCONC |name| |args|))
              (SETQ |conform| (|mkConform| |kind| |name| |args|))
              (SETQ |capitalKind| (|capitalize| |kind|))
              (SETQ |signature| (|ncParseFromString| |sig|))
              (SETQ |sourceFileName| (|dbSourceFile| (INTERN |name|)))
              (SETQ |emString| (LIST "{\\sf " |constring| "}"))
              (SETQ |heading| (CONS |capitalKind| (CONS " " |emString|)))
              (COND
               ((NULL (|isExposedConstructor| |conname|))
                (SETQ |heading| (CONS "Unexposed " |heading|))))
              (SETQ |page| (|htInitPage| |heading| NIL))
              (|htpSetProperty| |page| '|isFile| T)
              (|htpSetProperty| |page| '|fromConOpPage1| T)
              (|htpSetProperty| |page| '|parts| |parts|)
              (|htpSetProperty| |page| '|heading| |heading|)
              (|htpSetProperty| |page| '|kind| |kind|)
              (|htpSetProperty| |page| '|domname| |domname|)
              (|htpSetProperty| |page| '|conform| |conform|)
              (|htpSetProperty| |page| '|signature| |signature|)
              (COND
               ((SETQ |selectedOperation|
                        (LASSOC '|selectedOperation| (IFCDR |options|)))
                (|htpSetProperty| |page| '|selectedOperation|
                 |selectedOperation|)))
              ((LAMBDA (|bfVar#61| |bfVar#60|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#61|)
                        (PROGN (SETQ |bfVar#60| (CAR |bfVar#61|)) NIL))
                    (RETURN NIL))
                   (#1#
                    (AND (CONSP |bfVar#60|)
                         (PROGN
                          (SETQ |a| (CAR |bfVar#60|))
                          (SETQ |b| (CDR |bfVar#60|))
                          #1#)
                         (|htpSetProperty| |page| |a| |b|))))
                  (SETQ |bfVar#61| (CDR |bfVar#61|))))
               |bindingsAlist| NIL)
              (|koPage| |page| "operation"))))))))
 
; koPage(htPage,which) ==
;   [kind,name,nargs,xflag,sig,args,abbrev,comments] := htpProperty(htPage,'parts)
;   constring       := STRCONC(name,args)
;   conname         := INTERN name
;   domname         :=
;     (u := htpProperty(htPage,'domname)) is [=conname,:.]
;       and  (htpProperty(htPage,'fromConOpPage1) = true or
;              koPageInputAreaUnchanged?(htPage,nargs)) => u
;     kDomainName(htPage,kind,name,nargs)
;   domname is ['error,:.] => errorPage(htPage,domname)
;   htpSetProperty(htPage,'domname,domname)
;   headingString :=
;     domname => form2HtString(domname,nil,true)
;     constring
;   heading := [capitalize kind,'" {\sf ",headingString,'"}"]
;   htpSetProperty(htPage,'which,which)
;   htpSetProperty(htPage,'heading,heading)
;   koPageAux(htPage,which,domname,heading)
 
(DEFUN |koPage| (|htPage| |which|)
  (PROG (|LETTMP#1| |kind| |name| |nargs| |xflag| |sig| |args| |abbrev|
         |comments| |constring| |conname| |u| |ISTMP#1| |domname|
         |headingString| |heading|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (|htpProperty| |htPage| '|parts|))
      (SETQ |kind| (CAR |LETTMP#1|))
      (SETQ |name| (CADR . #1=(|LETTMP#1|)))
      (SETQ |nargs| (CADDR . #1#))
      (SETQ |xflag| (CADDDR . #1#))
      (SETQ |sig| (CAR #2=(CDDDDR . #1#)))
      (SETQ |args| (CADR . #3=(#2#)))
      (SETQ |abbrev| (CADDR . #3#))
      (SETQ |comments| (CADDDR . #3#))
      (SETQ |constring| (STRCONC |name| |args|))
      (SETQ |conname| (INTERN |name|))
      (SETQ |domname|
              (COND
               ((AND
                 (PROGN
                  (SETQ |ISTMP#1|
                          (SETQ |u| (|htpProperty| |htPage| '|domname|)))
                  (AND (CONSP |ISTMP#1|) (EQUAL (CAR |ISTMP#1|) |conname|)))
                 (OR (EQUAL (|htpProperty| |htPage| '|fromConOpPage1|) T)
                     (|koPageInputAreaUnchanged?| |htPage| |nargs|)))
                |u|)
               (#4='T (|kDomainName| |htPage| |kind| |name| |nargs|))))
      (COND
       ((AND (CONSP |domname|) (EQ (CAR |domname|) '|error|))
        (|errorPage| |htPage| |domname|))
       (#4#
        (PROGN
         (|htpSetProperty| |htPage| '|domname| |domname|)
         (SETQ |headingString|
                 (COND (|domname| (|form2HtString| |domname| NIL T))
                       (#4# |constring|)))
         (SETQ |heading|
                 (LIST (|capitalize| |kind|) " {\\sf " |headingString| "}"))
         (|htpSetProperty| |htPage| '|which| |which|)
         (|htpSetProperty| |htPage| '|heading| |heading|)
         (|koPageAux| |htPage| |which| |domname| |heading|))))))))
 
; koPageFromKKPage(htPage,ao) ==
;   koPageAux(htPage,ao,htpProperty(htPage,'domname),htpProperty(htPage,'heading))
 
(DEFUN |koPageFromKKPage| (|htPage| |ao|)
  (PROG ()
    (RETURN
     (|koPageAux| |htPage| |ao| (|htpProperty| |htPage| '|domname|)
      (|htpProperty| |htPage| '|heading|)))))
 
; koPageAux(htPage,which,domname,heading) == --from koPage, koPageFromKKPage
;   htpSetProperty(htPage,'which,which)
;   domname := htpProperty(htPage,'domname)
;   conform := htpProperty(htPage,'conform)
;   heading := htpProperty(htPage,'heading)
;   opAlist          :=
;     which = '"attribute" => koAttrs(conform,domname)
;     which = '"general operation" => koOps(conform,domname,true)
;     koOps(conform,domname)
;   if selectedOperation := htpProperty(htPage,'selectedOperation) then
;     opAlist := [assoc(selectedOperation,opAlist) or systemError()]
;   dbShowOperationsFromConform(htPage,which,opAlist)
 
(DEFUN |koPageAux| (|htPage| |which| |domname| |heading|)
  (PROG (|conform| |opAlist| |selectedOperation|)
    (RETURN
     (PROGN
      (|htpSetProperty| |htPage| '|which| |which|)
      (SETQ |domname| (|htpProperty| |htPage| '|domname|))
      (SETQ |conform| (|htpProperty| |htPage| '|conform|))
      (SETQ |heading| (|htpProperty| |htPage| '|heading|))
      (SETQ |opAlist|
              (COND
               ((EQUAL |which| "attribute") (|koAttrs| |conform| |domname|))
               ((EQUAL |which| "general operation")
                (|koOps| |conform| |domname| T))
               ('T (|koOps| |conform| |domname|))))
      (COND
       ((SETQ |selectedOperation|
                (|htpProperty| |htPage| '|selectedOperation|))
        (SETQ |opAlist|
                (LIST
                 (OR (|assoc| |selectedOperation| |opAlist|)
                     (|systemError|))))))
      (|dbShowOperationsFromConform| |htPage| |which| |opAlist|)))))
 
; koPageAux1(htPage,opAlist) ==
;   which   := htpProperty(htPage,'which)
;   dbShowOperationsFromConform(htPage,which,opAlist)
 
(DEFUN |koPageAux1| (|htPage| |opAlist|)
  (PROG (|which|)
    (RETURN
     (PROGN
      (SETQ |which| (|htpProperty| |htPage| '|which|))
      (|dbShowOperationsFromConform| |htPage| |which| |opAlist|)))))
 
; koaPageFilterByName(htPage,functionToCall) ==
;   htpLabelInputString(htPage,'filter) = '"" =>
;     koaPageFilterByCategory(htPage,functionToCall)
;   filter := pmTransFilter(dbGetInputString htPage)
; --WARNING: this call should check for ['error,:.] returned
;   which   := htpProperty(htPage,'which)
;   opAlist :=
;       [x for x in htpProperty(htPage,'opAlist) | superMatch?(filter,DOWNCASE STRINGIMAGE first x)]
;   htpSetProperty(htPage,'opAlist,opAlist)
;   FUNCALL(functionToCall,htPage,nil)
 
(DEFUN |koaPageFilterByName| (|htPage| |functionToCall|)
  (PROG (|filter| |which| |opAlist|)
    (RETURN
     (COND
      ((EQUAL (|htpLabelInputString| |htPage| '|filter|) "")
       (|koaPageFilterByCategory| |htPage| |functionToCall|))
      (#1='T
       (PROGN
        (SETQ |filter| (|pmTransFilter| (|dbGetInputString| |htPage|)))
        (SETQ |which| (|htpProperty| |htPage| '|which|))
        (SETQ |opAlist|
                ((LAMBDA (|bfVar#63| |bfVar#62| |x|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#62|)
                          (PROGN (SETQ |x| (CAR |bfVar#62|)) NIL))
                      (RETURN (NREVERSE |bfVar#63|)))
                     (#1#
                      (AND
                       (|superMatch?| |filter|
                        (DOWNCASE (STRINGIMAGE (CAR |x|))))
                       (SETQ |bfVar#63| (CONS |x| |bfVar#63|)))))
                    (SETQ |bfVar#62| (CDR |bfVar#62|))))
                 NIL (|htpProperty| |htPage| '|opAlist|) NIL))
        (|htpSetProperty| |htPage| '|opAlist| |opAlist|)
        (FUNCALL |functionToCall| |htPage| NIL)))))))
 
; dbConstructorDoc(conform,$op,$sig) == fn conform where
;   fn (conform := [conname,:$args]) ==
;     or/[gn y for y in GETDATABASE(conname,'DOCUMENTATION)]
;   gn([op,:alist]) ==
;     op = $op and or/[doc or '("") for [sig,:doc] in alist | hn sig]
;   hn sig ==
;     #$sig = #sig and $sig = SUBLISLIS($args,$FormalMapVariableList,sig)
 
(DEFUN |dbConstructorDoc| (|conform| |$op| |$sig|)
  (DECLARE (SPECIAL |$op| |$sig|))
  (PROG () (RETURN (|dbConstructorDoc,fn| |conform|))))
(DEFUN |dbConstructorDoc,fn| (|conform|)
  (PROG (|conname|)
    (RETURN
     (PROGN
      (SETQ |conname| (CAR |conform|))
      (SETQ |$args| (CDR |conform|))
      ((LAMBDA (|bfVar#65| |bfVar#64| |y|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#64|) (PROGN (SETQ |y| (CAR |bfVar#64|)) NIL))
            (RETURN |bfVar#65|))
           ('T
            (PROGN
             (SETQ |bfVar#65| (|dbConstructorDoc,gn| |y|))
             (COND (|bfVar#65| (RETURN |bfVar#65|))))))
          (SETQ |bfVar#64| (CDR |bfVar#64|))))
       NIL (GETDATABASE |conname| 'DOCUMENTATION) NIL)))))
(DEFUN |dbConstructorDoc,gn| (|bfVar#69|)
  (PROG (|op| |alist| |sig| |doc|)
    (RETURN
     (PROGN
      (SETQ |op| (CAR |bfVar#69|))
      (SETQ |alist| (CDR |bfVar#69|))
      (AND (EQUAL |op| |$op|)
           ((LAMBDA (|bfVar#68| |bfVar#67| |bfVar#66|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#67|)
                     (PROGN (SETQ |bfVar#66| (CAR |bfVar#67|)) NIL))
                 (RETURN |bfVar#68|))
                (#1='T
                 (AND (CONSP |bfVar#66|)
                      (PROGN
                       (SETQ |sig| (CAR |bfVar#66|))
                       (SETQ |doc| (CDR |bfVar#66|))
                       #1#)
                      (|dbConstructorDoc,hn| |sig|)
                      (PROGN
                       (SETQ |bfVar#68| (OR |doc| '("")))
                       (COND (|bfVar#68| (RETURN |bfVar#68|)))))))
               (SETQ |bfVar#67| (CDR |bfVar#67|))))
            NIL |alist| NIL))))))
(DEFUN |dbConstructorDoc,hn| (|sig|)
  (PROG ()
    (RETURN
     (AND (EQL (LENGTH |$sig|) (LENGTH |sig|))
          (EQUAL |$sig| (SUBLISLIS |$args| |$FormalMapVariableList| |sig|))))))
 
; dbDocTable conform ==
; --assumes $docTableHash bound --see dbExpandOpAlistIfNecessary
;   table := HGET($docTableHash,conform) => table
;   $docTable : local := MAKE_-HASHTABLE 'ID
;   --process in reverse order so that closest cover up farthest
;   for x in originsInOrder conform repeat dbAddDocTable x
;   dbAddDocTable conform
;   HPUT($docTableHash,conform,$docTable)
;   $docTable
 
(DEFUN |dbDocTable| (|conform|)
  (PROG (|$docTable| |table|)
    (DECLARE (SPECIAL |$docTable|))
    (RETURN
     (COND ((SETQ |table| (HGET |$docTableHash| |conform|)) |table|)
           (#1='T
            (PROGN
             (SETQ |$docTable| (MAKE-HASHTABLE 'ID))
             ((LAMBDA (|bfVar#70| |x|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#70|)
                       (PROGN (SETQ |x| (CAR |bfVar#70|)) NIL))
                   (RETURN NIL))
                  (#1# (|dbAddDocTable| |x|)))
                 (SETQ |bfVar#70| (CDR |bfVar#70|))))
              (|originsInOrder| |conform|) NIL)
             (|dbAddDocTable| |conform|)
             (HPUT |$docTableHash| |conform| |$docTable|)
             |$docTable|))))))
 
; originsInOrder conform ==  --domain = nil or set to live domain
; --from dcCats
;   [con,:argl] := conform
;   GETDATABASE(con,'CONSTRUCTORKIND) = 'category =>
;       ASSOCLEFT ancestorsOf(conform,nil)
;   acc := ASSOCLEFT parentsOf con
;   for x in acc repeat
;     for y in originsInOrder x repeat acc := insert(y,acc)
;   acc
 
(DEFUN |originsInOrder| (|conform|)
  (PROG (|con| |argl| |acc|)
    (RETURN
     (PROGN
      (SETQ |con| (CAR |conform|))
      (SETQ |argl| (CDR |conform|))
      (COND
       ((EQ (GETDATABASE |con| 'CONSTRUCTORKIND) '|category|)
        (ASSOCLEFT (|ancestorsOf| |conform| NIL)))
       (#1='T
        (PROGN
         (SETQ |acc| (ASSOCLEFT (|parentsOf| |con|)))
         ((LAMBDA (|bfVar#71| |x|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#71|) (PROGN (SETQ |x| (CAR |bfVar#71|)) NIL))
               (RETURN NIL))
              (#1#
               ((LAMBDA (|bfVar#72| |y|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#72|)
                         (PROGN (SETQ |y| (CAR |bfVar#72|)) NIL))
                     (RETURN NIL))
                    (#1# (SETQ |acc| (|insert| |y| |acc|))))
                   (SETQ |bfVar#72| (CDR |bfVar#72|))))
                (|originsInOrder| |x|) NIL)))
             (SETQ |bfVar#71| (CDR |bfVar#71|))))
          |acc| NIL)
         |acc|)))))))
 
; dbAddDocTable conform ==
;   conname := opOf conform
;   storedArgs := rest getConstructorForm conname
;   for [op,:alist] in SUBLISLIS(["$",:rest conform],
;     ["%",:storedArgs],GETDATABASE(opOf conform,'DOCUMENTATION))
;       repeat
;        op1 :=
;          op = '(Zero) => 0
;          op = '(One) => 1
;          op
;        for [sig,doc] in alist repeat
;          HPUT($docTable,op1,[[conform,:alist],:HGET($docTable,op1)])
 
(DEFUN |dbAddDocTable| (|conform|)
  (PROG (|conname| |storedArgs| |op| |alist| |op1| |sig| |ISTMP#1| |doc|)
    (RETURN
     (PROGN
      (SETQ |conname| (|opOf| |conform|))
      (SETQ |storedArgs| (CDR (|getConstructorForm| |conname|)))
      ((LAMBDA (|bfVar#74| |bfVar#73|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#74|)
                (PROGN (SETQ |bfVar#73| (CAR |bfVar#74|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#73|)
                 (PROGN
                  (SETQ |op| (CAR |bfVar#73|))
                  (SETQ |alist| (CDR |bfVar#73|))
                  #1#)
                 (PROGN
                  (SETQ |op1|
                          (COND ((EQUAL |op| '(|Zero|)) 0)
                                ((EQUAL |op| '(|One|)) 1) (#1# |op|)))
                  ((LAMBDA (|bfVar#76| |bfVar#75|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#76|)
                            (PROGN (SETQ |bfVar#75| (CAR |bfVar#76|)) NIL))
                        (RETURN NIL))
                       (#1#
                        (AND (CONSP |bfVar#75|)
                             (PROGN
                              (SETQ |sig| (CAR |bfVar#75|))
                              (SETQ |ISTMP#1| (CDR |bfVar#75|))
                              (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                                   (PROGN (SETQ |doc| (CAR |ISTMP#1|)) #1#)))
                             (HPUT |$docTable| |op1|
                                   (CONS (CONS |conform| |alist|)
                                         (HGET |$docTable| |op1|))))))
                      (SETQ |bfVar#76| (CDR |bfVar#76|))))
                   |alist| NIL)))))
          (SETQ |bfVar#74| (CDR |bfVar#74|))))
       (SUBLISLIS (CONS '$ (CDR |conform|)) (CONS '% |storedArgs|)
        (GETDATABASE (|opOf| |conform|) 'DOCUMENTATION))
       NIL)))))
 
; dbGetDocTable(op,$sig,docTable,$which,aux) == main where
; --docTable is [[origin,entry1,...,:code] ...] where
; --  each entry is [sig,doc] and code is NIL or else a topic code for op
;   main ==
;     if null FIXP op and DIGITP (s := STRINGIMAGE op).0 then
;           BREAK()
;           op := string2Integer s
;     -- the above hack should be removed after 3/94 when 0 is not |0|
;     aux is [[packageName,:.],:pred] =>
;       doc := dbConstructorDoc(first aux,$op,$sig)
;       origin :=
;         pred => ['ifp,:aux]
;         first aux
;       [origin,:doc]
;     or/[gn x for x in HGET(docTable,op)]
;   gn u ==  --u is [origin,entry1,...,:code]
;     $conform := first u              --origin
;     if ATOM $conform then $conform := [$conform]
;     code     := LASTATOM u         --optional topic code
;     comments := or/[p for entry in rest u | p := hn entry] or return nil
;     [$conform,first comments,:code]
;   hn [sig,:doc] ==
;     $which = '"attribute" => sig is ['attribute,: =$sig] and doc
;     pred := #$sig = #sig and
;       alteredSig := SUBLISLIS(IFCDR $conform, $FormalMapVariableList, sig)
;       alteredSig = $sig
;     pred =>
;       doc =>
;         doc is ['constant,:r] => r
;         doc
;       '("")
;     false
 
(DEFUN |dbGetDocTable| (|op| |$sig| |docTable| |$which| |aux|)
  (DECLARE (SPECIAL |$sig| |$which|))
  (PROG (|s| |ISTMP#1| |packageName| |pred| |doc| |origin|)
    (RETURN
     (PROGN
      (COND
       ((AND (NULL (FIXP |op|)) (DIGITP (ELT (SETQ |s| (STRINGIMAGE |op|)) 0)))
        (BREAK) (SETQ |op| (|string2Integer| |s|))))
      (COND
       ((AND (CONSP |aux|)
             (PROGN
              (SETQ |ISTMP#1| (CAR |aux|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN (SETQ |packageName| (CAR |ISTMP#1|)) #1='T)))
             (PROGN (SETQ |pred| (CDR |aux|)) #1#))
        (PROGN
         (SETQ |doc| (|dbConstructorDoc| (CAR |aux|) |$op| |$sig|))
         (SETQ |origin| (COND (|pred| (CONS '|ifp| |aux|)) (#1# (CAR |aux|))))
         (CONS |origin| |doc|)))
       (#1#
        ((LAMBDA (|bfVar#78| |bfVar#77| |x|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#77|) (PROGN (SETQ |x| (CAR |bfVar#77|)) NIL))
              (RETURN |bfVar#78|))
             (#1#
              (PROGN
               (SETQ |bfVar#78| (|dbGetDocTable,gn| |x|))
               (COND (|bfVar#78| (RETURN |bfVar#78|))))))
            (SETQ |bfVar#77| (CDR |bfVar#77|))))
         NIL (HGET |docTable| |op|) NIL)))))))
(DEFUN |dbGetDocTable,gn| (|u|)
  (PROG (|code| |p| |comments|)
    (RETURN
     (PROGN
      (SETQ |$conform| (CAR |u|))
      (COND ((ATOM |$conform|) (SETQ |$conform| (LIST |$conform|))))
      (SETQ |code| (LASTATOM |u|))
      (SETQ |comments|
              (OR
               ((LAMBDA (|bfVar#80| |bfVar#79| |entry|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#79|)
                         (PROGN (SETQ |entry| (CAR |bfVar#79|)) NIL))
                     (RETURN |bfVar#80|))
                    ('T
                     (AND (SETQ |p| (|dbGetDocTable,hn| |entry|))
                          (PROGN
                           (SETQ |bfVar#80| |p|)
                           (COND (|bfVar#80| (RETURN |bfVar#80|)))))))
                   (SETQ |bfVar#79| (CDR |bfVar#79|))))
                NIL (CDR |u|) NIL)
               (RETURN NIL)))
      (CONS |$conform| (CONS (CAR |comments|) |code|))))))
(DEFUN |dbGetDocTable,hn| (|bfVar#81|)
  (PROG (|sig| |doc| |alteredSig| |pred| |r|)
    (RETURN
     (PROGN
      (SETQ |sig| (CAR |bfVar#81|))
      (SETQ |doc| (CDR |bfVar#81|))
      (COND
       ((EQUAL |$which| "attribute")
        (AND (CONSP |sig|) (EQ (CAR |sig|) '|attribute|)
             (EQUAL (CDR |sig|) |$sig|) |doc|))
       (#1='T
        (PROGN
         (SETQ |pred|
                 (AND (EQL (LENGTH |$sig|) (LENGTH |sig|))
                      (PROGN
                       (SETQ |alteredSig|
                               (SUBLISLIS (IFCDR |$conform|)
                                |$FormalMapVariableList| |sig|))
                       (EQUAL |alteredSig| |$sig|))))
         (COND
          (|pred|
           (COND
            (|doc|
             (COND
              ((AND (CONSP |doc|) (EQ (CAR |doc|) '|constant|)
                    (PROGN (SETQ |r| (CDR |doc|)) #1#))
               |r|)
              (#1# |doc|)))
            (#1# '(""))))
          (#1# NIL)))))))))
 
; kTestPred n ==
;   n = 0 => true
;   $domain => testBitVector($predvec,n)
;   simpHasPred $predvec.(n - 1)
 
(DEFUN |kTestPred| (|n|)
  (PROG ()
    (RETURN
     (COND ((EQL |n| 0) T) (|$domain| (|testBitVector| |$predvec| |n|))
           ('T (|simpHasPred| (ELT |$predvec| (- |n| 1))))))))
 
; dbAddChainDomain conform ==
;   [name,:args] := conform
;   $infovec := dbInfovec name or return nil  --exit for categories
;   template := $infovec . 0
;   null (form := template . 5) => nil
;   dbSubConform(args,kFormatSlotDomain devaluate form)
 
(DEFUN |dbAddChainDomain| (|conform|)
  (PROG (|name| |args| |template| |form|)
    (RETURN
     (PROGN
      (SETQ |name| (CAR |conform|))
      (SETQ |args| (CDR |conform|))
      (SETQ |$infovec| (OR (|dbInfovec| |name|) (RETURN NIL)))
      (SETQ |template| (ELT |$infovec| 0))
      (COND ((NULL (SETQ |form| (ELT |template| 5))) NIL)
            ('T
             (|dbSubConform| |args|
              (|kFormatSlotDomain| (|devaluate| |form|)))))))))
 
; dbSubConform(args,u) ==
;   atom u =>
;     (n := position(u,$FormalMapVariableList)) >= 0 => args . n
;     u
;   u is ['local,y] => dbSubConform(args,y)
;   [dbSubConform(args,x) for x in u]
 
(DEFUN |dbSubConform| (|args| |u|)
  (PROG (|n| |ISTMP#1| |y|)
    (RETURN
     (COND
      ((ATOM |u|)
       (COND
        ((NOT (MINUSP (SETQ |n| (|position| |u| |$FormalMapVariableList|))))
         (ELT |args| |n|))
        (#1='T |u|)))
      ((AND (CONSP |u|) (EQ (CAR |u|) '|local|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |u|))
             (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                  (PROGN (SETQ |y| (CAR |ISTMP#1|)) #1#))))
       (|dbSubConform| |args| |y|))
      (#1#
       ((LAMBDA (|bfVar#83| |bfVar#82| |x|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#82|) (PROGN (SETQ |x| (CAR |bfVar#82|)) NIL))
             (RETURN (NREVERSE |bfVar#83|)))
            (#1#
             (SETQ |bfVar#83| (CONS (|dbSubConform| |args| |x|) |bfVar#83|))))
           (SETQ |bfVar#82| (CDR |bfVar#82|))))
        NIL |u| NIL))))))
 
; dbAddChain conform ==
;   u := dbAddChainDomain conform =>
;     atom u => nil
;     [[u,:true],:dbAddChain u]
;   nil
 
(DEFUN |dbAddChain| (|conform|)
  (PROG (|u|)
    (RETURN
     (COND
      ((SETQ |u| (|dbAddChainDomain| |conform|))
       (COND ((ATOM |u|) NIL) (#1='T (CONS (CONS |u| T) (|dbAddChain| |u|)))))
      (#1# NIL)))))
 
; dbShowCons(htPage,key,:options) ==
;   cAlist  := htpProperty(htPage,'cAlist)
;   key = 'filter =>
;     --if $saturn, IFCAR options is the filter string
;     filter := pmTransFilter(IFCAR options or dbGetInputString htPage)
;     filter is ['error,:.] => bcErrorPage filter
;     abbrev? := htpProperty(htPage,'exclusion) = 'abbrs
;     u := [x for x in cAlist | test] where test ==
;       conname := CAAR x
;       subject := (abbrev? => constructor? conname; conname)
;       superMatch?(filter,DOWNCASE STRINGIMAGE subject)
;     null u => emptySearchPage('"constructor",filter)
;     htPage := htInitPageNoScroll(htCopyProplist htPage)
;     htpSetProperty(htPage,'cAlist,u)
;     dbShowCons(htPage,htpProperty(htPage,'exclusion))
;   if MEMQ(key,'(exposureOn exposureOff)) then
;     $exposedOnlyIfTrue :=
;       key = 'exposureOn => 'T
;       NIL
;     key := htpProperty(htPage,'exclusion)
;   dbShowCons1(htPage,cAlist,key)
 
(DEFUN |dbShowCons| (|htPage| |key| &REST |options|)
  (PROG (|cAlist| |filter| |abbrev?| |conname| |subject| |u|)
    (RETURN
     (PROGN
      (SETQ |cAlist| (|htpProperty| |htPage| '|cAlist|))
      (COND
       ((EQ |key| '|filter|)
        (PROGN
         (SETQ |filter|
                 (|pmTransFilter|
                  (OR (IFCAR |options|) (|dbGetInputString| |htPage|))))
         (COND
          ((AND (CONSP |filter|) (EQ (CAR |filter|) '|error|))
           (|bcErrorPage| |filter|))
          (#1='T
           (PROGN
            (SETQ |abbrev?|
                    (EQ (|htpProperty| |htPage| '|exclusion|) '|abbrs|))
            (SETQ |u|
                    ((LAMBDA (|bfVar#85| |bfVar#84| |x|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#84|)
                              (PROGN (SETQ |x| (CAR |bfVar#84|)) NIL))
                          (RETURN (NREVERSE |bfVar#85|)))
                         (#1#
                          (AND
                           (PROGN
                            (SETQ |conname| (CAAR |x|))
                            (SETQ |subject|
                                    (COND
                                     (|abbrev?| (|constructor?| |conname|))
                                     (#1# |conname|)))
                            (|superMatch?| |filter|
                             (DOWNCASE (STRINGIMAGE |subject|))))
                           (SETQ |bfVar#85| (CONS |x| |bfVar#85|)))))
                        (SETQ |bfVar#84| (CDR |bfVar#84|))))
                     NIL |cAlist| NIL))
            (COND ((NULL |u|) (|emptySearchPage| "constructor" |filter|))
                  (#1#
                   (PROGN
                    (SETQ |htPage|
                            (|htInitPageNoScroll| (|htCopyProplist| |htPage|)))
                    (|htpSetProperty| |htPage| '|cAlist| |u|)
                    (|dbShowCons| |htPage|
                     (|htpProperty| |htPage| '|exclusion|))))))))))
       (#1#
        (PROGN
         (COND
          ((MEMQ |key| '(|exposureOn| |exposureOff|))
           (SETQ |$exposedOnlyIfTrue|
                   (COND ((EQ |key| '|exposureOn|) 'T) (#1# NIL)))
           (SETQ |key| (|htpProperty| |htPage| '|exclusion|))))
         (|dbShowCons1| |htPage| |cAlist| |key|))))))))
 
; conPageChoose conname ==
;   cAlist := [[getConstructorForm conname,:true]]
;   dbShowCons1(nil,cAlist,'names)
 
(DEFUN |conPageChoose| (|conname|)
  (PROG (|cAlist|)
    (RETURN
     (PROGN
      (SETQ |cAlist| (LIST (CONS (|getConstructorForm| |conname|) T)))
      (|dbShowCons1| NIL |cAlist| '|names|)))))
 
; dbShowCons1(htPage,cAlist,key) ==
;   conlist := REMDUP [item for x in cAlist | pred] where
;     pred ==
;       item := first x
;       $exposedOnlyIfTrue => isExposedConstructor opOf item
;       item
;   conlist is [.] => conPage
;     htPage and htpProperty(htPage,'domname) => first conlist
;     opOf first conlist
;   conlist := [opOf x for x in conlist]
;   kinds := "union"/[dbConstructorKind x for x in conlist]
;   kind :=
;     kinds is [a] => a
;     'constructor
;   proplist :=
;     htPage => htCopyProplist htPage
;     nil
;   page := htInitPageNoScroll(proplist,dbConsHeading(htPage,conlist,key,kind))
;   if u := htpProperty(page,'specialMessage) then APPLY(first u,rest u)
;   htSayStandard('"\beginscroll ")
;   htpSetProperty(page,'cAlist,cAlist)
;   $conformsAreDomains: local := htpProperty(page,'domname)
;   do
;   --key = 'catfilter => dbShowCatFilter(page,key)
;     key = 'names => bcNameConTable conlist
;     key = 'abbrs =>
;       bcAbbTable [getCDTEntry(con,true) for con in conlist]
;     key = 'files =>
;       flist :=
;         [y for con in conlist |
;           y := (fn := GETDATABASE(con,'SOURCEFILE))]
;       bcUnixTable(listSort(function GLESSEQP,REMDUP flist))
;     key = 'documentation   => dbShowConsDoc(page,conlist)
;     if $exposedOnlyIfTrue then
;       cAlist := [x for x in cAlist | isExposedConstructor opOf first x]
;     key = 'conditions =>     dbShowConditions(page,cAlist,kind)
;     key = 'parameters => bcConTable REMDUP ASSOCLEFT cAlist
;     key = 'kinds => dbShowConsKinds cAlist
;   dbConsExposureMessage()
;   htSayStandard("\endscroll ")
;   dbPresentCons(page,kind,key)
;   htShowPageNoScroll()
 
(DEFUN |dbShowCons1| (|htPage| |cAlist| |key|)
  (PROG (|$conformsAreDomains| |flist| |y| |fn| |u| |page| |proplist| |kind|
         |a| |kinds| |conlist| |item|)
    (DECLARE (SPECIAL |$conformsAreDomains|))
    (RETURN
     (PROGN
      (SETQ |conlist|
              (REMDUP
               ((LAMBDA (|bfVar#87| |bfVar#86| |x|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#86|)
                         (PROGN (SETQ |x| (CAR |bfVar#86|)) NIL))
                     (RETURN (NREVERSE |bfVar#87|)))
                    (#1='T
                     (AND
                      (PROGN
                       (SETQ |item| (CAR |x|))
                       (COND
                        (|$exposedOnlyIfTrue|
                         (|isExposedConstructor| (|opOf| |item|)))
                        (#1# |item|)))
                      (SETQ |bfVar#87| (CONS |item| |bfVar#87|)))))
                   (SETQ |bfVar#86| (CDR |bfVar#86|))))
                NIL |cAlist| NIL)))
      (COND
       ((AND (CONSP |conlist|) (EQ (CDR |conlist|) NIL))
        (|conPage|
         (COND
          ((AND |htPage| (|htpProperty| |htPage| '|domname|)) (CAR |conlist|))
          (#1# (|opOf| (CAR |conlist|))))))
       (#1#
        (PROGN
         (SETQ |conlist|
                 ((LAMBDA (|bfVar#89| |bfVar#88| |x|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#88|)
                           (PROGN (SETQ |x| (CAR |bfVar#88|)) NIL))
                       (RETURN (NREVERSE |bfVar#89|)))
                      (#1# (SETQ |bfVar#89| (CONS (|opOf| |x|) |bfVar#89|))))
                     (SETQ |bfVar#88| (CDR |bfVar#88|))))
                  NIL |conlist| NIL))
         (SETQ |kinds|
                 ((LAMBDA (|bfVar#91| |bfVar#90| |x|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#90|)
                           (PROGN (SETQ |x| (CAR |bfVar#90|)) NIL))
                       (RETURN |bfVar#91|))
                      (#1#
                       (SETQ |bfVar#91|
                               (|union| |bfVar#91|
                                (|dbConstructorKind| |x|)))))
                     (SETQ |bfVar#90| (CDR |bfVar#90|))))
                  NIL |conlist| NIL))
         (SETQ |kind|
                 (COND
                  ((AND (CONSP |kinds|) (EQ (CDR |kinds|) NIL)
                        (PROGN (SETQ |a| (CAR |kinds|)) #1#))
                   |a|)
                  (#1# '|constructor|)))
         (SETQ |proplist|
                 (COND (|htPage| (|htCopyProplist| |htPage|)) (#1# NIL)))
         (SETQ |page|
                 (|htInitPageNoScroll| |proplist|
                  (|dbConsHeading| |htPage| |conlist| |key| |kind|)))
         (COND
          ((SETQ |u| (|htpProperty| |page| '|specialMessage|))
           (APPLY (CAR |u|) (CDR |u|))))
         (|htSayStandard| "\\beginscroll ")
         (|htpSetProperty| |page| '|cAlist| |cAlist|)
         (SETQ |$conformsAreDomains| (|htpProperty| |page| '|domname|))
         (|do|
          (COND ((EQ |key| '|names|) (|bcNameConTable| |conlist|))
                ((EQ |key| '|abbrs|)
                 (|bcAbbTable|
                  ((LAMBDA (|bfVar#93| |bfVar#92| |con|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#92|)
                            (PROGN (SETQ |con| (CAR |bfVar#92|)) NIL))
                        (RETURN (NREVERSE |bfVar#93|)))
                       (#1#
                        (SETQ |bfVar#93|
                                (CONS (|getCDTEntry| |con| T) |bfVar#93|))))
                      (SETQ |bfVar#92| (CDR |bfVar#92|))))
                   NIL |conlist| NIL)))
                ((EQ |key| '|files|)
                 (PROGN
                  (SETQ |flist|
                          ((LAMBDA (|bfVar#95| |bfVar#94| |con|)
                             (LOOP
                              (COND
                               ((OR (ATOM |bfVar#94|)
                                    (PROGN (SETQ |con| (CAR |bfVar#94|)) NIL))
                                (RETURN (NREVERSE |bfVar#95|)))
                               (#1#
                                (AND
                                 (SETQ |y|
                                         (SETQ |fn|
                                                 (GETDATABASE |con|
                                                  'SOURCEFILE)))
                                 (SETQ |bfVar#95| (CONS |y| |bfVar#95|)))))
                              (SETQ |bfVar#94| (CDR |bfVar#94|))))
                           NIL |conlist| NIL))
                  (|bcUnixTable| (|listSort| #'GLESSEQP (REMDUP |flist|)))))
                ((EQ |key| '|documentation|)
                 (|dbShowConsDoc| |page| |conlist|))
                (#1#
                 (PROGN
                  (COND
                   (|$exposedOnlyIfTrue|
                    (SETQ |cAlist|
                            ((LAMBDA (|bfVar#97| |bfVar#96| |x|)
                               (LOOP
                                (COND
                                 ((OR (ATOM |bfVar#96|)
                                      (PROGN (SETQ |x| (CAR |bfVar#96|)) NIL))
                                  (RETURN (NREVERSE |bfVar#97|)))
                                 (#1#
                                  (AND
                                   (|isExposedConstructor| (|opOf| (CAR |x|)))
                                   (SETQ |bfVar#97| (CONS |x| |bfVar#97|)))))
                                (SETQ |bfVar#96| (CDR |bfVar#96|))))
                             NIL |cAlist| NIL))))
                  (COND
                   ((EQ |key| '|conditions|)
                    (|dbShowConditions| |page| |cAlist| |kind|))
                   ((EQ |key| '|parameters|)
                    (|bcConTable| (REMDUP (ASSOCLEFT |cAlist|))))
                   ((EQ |key| '|kinds|) (|dbShowConsKinds| |cAlist|)))))))
         (|dbConsExposureMessage|)
         (|htSayStandard| '|\\endscroll |)
         (|dbPresentCons| |page| |kind| |key|)
         (|htShowPageNoScroll|))))))))
 
; dbConsExposureMessage() ==
;   $atLeastOneUnexposed =>
;       htSay '"\newline{}-------------\newline{}{\em *} = unexposed"
 
(DEFUN |dbConsExposureMessage| #1=()
  (PROG #1#
    (RETURN
     (COND
      (|$atLeastOneUnexposed|
       (IDENTITY
        (|htSay|
         "\\newline{}-------------\\newline{}{\\em *} = unexposed")))))))
 
; dbShowConsKindsFilter(htPage,[kind,cAlist]) ==
;   htpSetProperty(htPage,'cAlist,cAlist)
;   dbShowCons(htPage,htpProperty(htPage,'exclusion))
 
(DEFUN |dbShowConsKindsFilter| (|htPage| |bfVar#98|)
  (PROG (|kind| |cAlist|)
    (RETURN
     (PROGN
      (SETQ |kind| (CAR |bfVar#98|))
      (SETQ |cAlist| (CADR |bfVar#98|))
      (|htpSetProperty| |htPage| '|cAlist| |cAlist|)
      (|dbShowCons| |htPage| (|htpProperty| |htPage| '|exclusion|))))))
 
; dbShowConsDoc(htPage,conlist) ==
;   null rest conlist => dbShowConsDoc1(htPage,getConstructorForm opOf first conlist,nil)
;   cAlist := htpProperty(htPage,'cAlist)
;   --the following code is necessary to skip over duplicates on cAlist
;   index := 0
;   for x in REMDUP conlist repeat
;   -- for x in conlist repeat
;     dbShowConsDoc1(htPage,getConstructorForm x,i) where i ==
;       while CAAAR cAlist ~= x repeat
;         index := index + 1
;         cAlist := rest cAlist
;         null cAlist => systemError ()
;       index
 
(DEFUN |dbShowConsDoc| (|htPage| |conlist|)
  (PROG (|cAlist| |index|)
    (RETURN
     (COND
      ((NULL (CDR |conlist|))
       (|dbShowConsDoc1| |htPage|
        (|getConstructorForm| (|opOf| (CAR |conlist|))) NIL))
      (#1='T
       (PROGN
        (SETQ |cAlist| (|htpProperty| |htPage| '|cAlist|))
        (SETQ |index| 0)
        ((LAMBDA (|bfVar#99| |x|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#99|) (PROGN (SETQ |x| (CAR |bfVar#99|)) NIL))
              (RETURN NIL))
             (#1#
              (|dbShowConsDoc1| |htPage| (|getConstructorForm| |x|)
               (PROGN
                ((LAMBDA ()
                   (LOOP
                    (COND ((EQUAL (CAAAR |cAlist|) |x|) (RETURN NIL))
                          (#1#
                           (PROGN
                            (SETQ |index| (+ |index| 1))
                            (SETQ |cAlist| (CDR |cAlist|))
                            (COND ((NULL |cAlist|) (|systemError|)))))))))
                |index|))))
            (SETQ |bfVar#99| (CDR |bfVar#99|))))
         (REMDUP |conlist|) NIL)))))))
 
; dbShowConsDoc1(htPage,conform,indexOrNil) ==
;   [conname,:conargs] := conform
;   MEMQ(conname,$Primitives) =>
;     conname := htpProperty(htPage,'conname)
;     [["constructor",["NIL",doc]],:.] := GETL(conname,'documentation)
;     sig := '((CATEGORY domain) (SetCategory) (SetCategory))
;     displayDomainOp(htPage,'"constructor",conform,conname,sig,true,doc,indexOrNil,'dbSelectCon,nil,nil)
;   exposeFlag := isExposedConstructor conname
;   doc := [getConstructorDocumentation conname]
;   signature := getConstructorSignature conname
;   sig :=
;     GETDATABASE(conname,'CONSTRUCTORKIND) = 'category =>
;       SUBLISLIS(conargs,$TriangleVariableList,signature)
;     sublisFormal(conargs,signature)
;   htSaySaturn '"\begin{description}"
;   displayDomainOp(htPage,'"constructor",conform,conname,sig,true,doc,indexOrNil,'dbSelectCon,null exposeFlag,nil)
;   htSaySaturn '"\end{description}"
 
(DEFUN |dbShowConsDoc1| (|htPage| |conform| |indexOrNil|)
  (PROG (|conname| |conargs| |LETTMP#1| |doc| |sig| |exposeFlag| |signature|)
    (RETURN
     (PROGN
      (SETQ |conname| (CAR |conform|))
      (SETQ |conargs| (CDR |conform|))
      (COND
       ((MEMQ |conname| |$Primitives|)
        (PROGN
         (SETQ |conname| (|htpProperty| |htPage| '|conname|))
         (SETQ |LETTMP#1| (GETL |conname| '|documentation|))
         (SETQ |doc| (CAR (CDADAR |LETTMP#1|)))
         (SETQ |sig| '((CATEGORY |domain|) (|SetCategory|) (|SetCategory|)))
         (|displayDomainOp| |htPage| "constructor" |conform| |conname| |sig| T
          |doc| |indexOrNil| '|dbSelectCon| NIL NIL)))
       (#1='T
        (PROGN
         (SETQ |exposeFlag| (|isExposedConstructor| |conname|))
         (SETQ |doc| (LIST (|getConstructorDocumentation| |conname|)))
         (SETQ |signature| (|getConstructorSignature| |conname|))
         (SETQ |sig|
                 (COND
                  ((EQ (GETDATABASE |conname| 'CONSTRUCTORKIND) '|category|)
                   (SUBLISLIS |conargs| |$TriangleVariableList| |signature|))
                  (#1# (|sublisFormal| |conargs| |signature|))))
         (|htSaySaturn| "\\begin{description}")
         (|displayDomainOp| |htPage| "constructor" |conform| |conname| |sig| T
          |doc| |indexOrNil| '|dbSelectCon| (NULL |exposeFlag|) NIL)
         (|htSaySaturn| "\\end{description}"))))))))
 
; getConstructorDocumentation conname ==
;   LASSOC('constructor,GETDATABASE(conname,'DOCUMENTATION))
;     is [[nil,line,:.],:.] and line or '""
 
(DEFUN |getConstructorDocumentation| (|conname|)
  (PROG (|ISTMP#1| |ISTMP#2| |ISTMP#3| |line|)
    (RETURN
     (OR
      (AND
       (PROGN
        (SETQ |ISTMP#1|
                (LASSOC '|constructor| (GETDATABASE |conname| 'DOCUMENTATION)))
        (AND (CONSP |ISTMP#1|)
             (PROGN
              (SETQ |ISTMP#2| (CAR |ISTMP#1|))
              (AND (CONSP |ISTMP#2|) (NULL (CAR |ISTMP#2|))
                   (PROGN
                    (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                    (AND (CONSP |ISTMP#3|)
                         (PROGN (SETQ |line| (CAR |ISTMP#3|)) 'T)))))))
       |line|)
      ""))))
 
; dbSelectCon(htPage,which,index) ==
;   conPage opOf first (htpProperty(htPage, 'cAlist)) . index
 
(DEFUN |dbSelectCon| (|htPage| |which| |index|)
  (PROG ()
    (RETURN
     (|conPage|
      (|opOf| (CAR (ELT (|htpProperty| |htPage| '|cAlist|) |index|)))))))
 
; dbShowConditions(htPage,cAlist,kind) ==
;   conform := htpProperty(htPage,'conform)
;   conname := opOf conform
;   article := htpProperty(htPage,'article)
;   whichever := htpProperty(htPage,'whichever)
;   [consNoPred,:consPred] := splitConTable cAlist
;   singular := [kind,'" is"]
;   plural   := [pluralize STRINGIMAGE kind,'" are"]
;   dbSayItems(#consNoPred,singular,plural,'" unconditional")
;   htSaySaturn '"\\"
;   bcConPredTable(consNoPred,conname)
;   htSayHrule()
;   dbSayItems(#consPred,singular,plural,'" conditional")
;   htSaySaturn '"\\"
;   bcConPredTable(consPred,conname)
 
(DEFUN |dbShowConditions| (|htPage| |cAlist| |kind|)
  (PROG (|conform| |conname| |article| |whichever| |LETTMP#1| |consNoPred|
         |consPred| |singular| |plural|)
    (RETURN
     (PROGN
      (SETQ |conform| (|htpProperty| |htPage| '|conform|))
      (SETQ |conname| (|opOf| |conform|))
      (SETQ |article| (|htpProperty| |htPage| '|article|))
      (SETQ |whichever| (|htpProperty| |htPage| '|whichever|))
      (SETQ |LETTMP#1| (|splitConTable| |cAlist|))
      (SETQ |consNoPred| (CAR |LETTMP#1|))
      (SETQ |consPred| (CDR |LETTMP#1|))
      (SETQ |singular| (LIST |kind| " is"))
      (SETQ |plural| (LIST (|pluralize| (STRINGIMAGE |kind|)) " are"))
      (|dbSayItems| (LENGTH |consNoPred|) |singular| |plural| " unconditional")
      (|htSaySaturn| "\\\\")
      (|bcConPredTable| |consNoPred| |conname|)
      (|htSayHrule|)
      (|dbSayItems| (LENGTH |consPred|) |singular| |plural| " conditional")
      (|htSaySaturn| "\\\\")
      (|bcConPredTable| |consPred| |conname|)))))
 
; dbConsHeading(htPage,conlist,view,kind) ==
;   thing := htPage and htpProperty(htPage,'thing) or '"constructor"
;   place :=
;     htPage => htpProperty(htPage,'domname) or htpProperty(htPage,'conform)
;     nil
;   count := #(REMDUP conlist)
;   -- count := #conlist
;   thing = '"benefactor" =>
;     [STRINGIMAGE count,'" Constructors Used by ",form2HtString(place,nil,true)]
;   modifier :=
;     thing = '"argument" =>
;       rank := htPage and htpProperty(htPage,'rank)
;       ['" Possible ",rank,'" "]
;     kind = 'constructor => ['" "]
;     ['" ",capitalize STRINGIMAGE kind,'" "]
; --  count = 1 =>
; --    ['"Select name or a {\em view} at the bottom"]
;   exposureWord :=
;     $exposedOnlyIfTrue => '(" Exposed ")
;     nil
;   prefix :=
;     count = 1 => [STRINGIMAGE count,:modifier,capitalize thing]
;     firstWord := (count = 0 => '"No "; STRINGIMAGE count)
;     [firstWord,:exposureWord, :modifier,capitalize pluralize thing]
;   placepart :=
;     place => ['" of {\em ",form2HtString(place,nil,true),"}"]
;     nil
;   heading := [:prefix,:placepart]
;   connective :=
;     member(view,'(abbrs files kinds)) => '" as "
;     '" with "
;   if count ~= 0 and member(view,'(abbrs files parameters conditions)) then heading:= [:heading,'" viewed",connective,'"{\em ",STRINGIMAGE view,'"}"]
;   heading
 
(DEFUN |dbConsHeading| (|htPage| |conlist| |view| |kind|)
  (PROG (|thing| |place| |count| |rank| |modifier| |exposureWord| |firstWord|
         |prefix| |placepart| |heading| |connective|)
    (RETURN
     (PROGN
      (SETQ |thing|
              (OR (AND |htPage| (|htpProperty| |htPage| '|thing|))
                  "constructor"))
      (SETQ |place|
              (COND
               (|htPage|
                (OR (|htpProperty| |htPage| '|domname|)
                    (|htpProperty| |htPage| '|conform|)))
               (#1='T NIL)))
      (SETQ |count| (LENGTH (REMDUP |conlist|)))
      (COND
       ((EQUAL |thing| "benefactor")
        (LIST (STRINGIMAGE |count|) " Constructors Used by "
              (|form2HtString| |place| NIL T)))
       (#1#
        (PROGN
         (SETQ |modifier|
                 (COND
                  ((EQUAL |thing| "argument")
                   (PROGN
                    (SETQ |rank|
                            (AND |htPage| (|htpProperty| |htPage| '|rank|)))
                    (LIST " Possible " |rank| " ")))
                  ((EQ |kind| '|constructor|) (LIST " "))
                  (#1# (LIST " " (|capitalize| (STRINGIMAGE |kind|)) " "))))
         (SETQ |exposureWord|
                 (COND (|$exposedOnlyIfTrue| '(" Exposed ")) (#1# NIL)))
         (SETQ |prefix|
                 (COND
                  ((EQL |count| 1)
                   (CONS (STRINGIMAGE |count|)
                         (APPEND |modifier|
                                 (CONS (|capitalize| |thing|) NIL))))
                  (#1#
                   (PROGN
                    (SETQ |firstWord|
                            (COND ((EQL |count| 0) "No ")
                                  (#1# (STRINGIMAGE |count|))))
                    (CONS |firstWord|
                          (APPEND |exposureWord|
                                  (APPEND |modifier|
                                          (CONS
                                           (|capitalize| (|pluralize| |thing|))
                                           NIL))))))))
         (SETQ |placepart|
                 (COND
                  (|place|
                   (LIST " of {\\em " (|form2HtString| |place| NIL T) '}))
                  (#1# NIL)))
         (SETQ |heading| (APPEND |prefix| |placepart|))
         (SETQ |connective|
                 (COND ((|member| |view| '(|abbrs| |files| |kinds|)) " as ")
                       (#1# " with ")))
         (COND
          ((AND (NOT (EQL |count| 0))
                (|member| |view| '(|abbrs| |files| |parameters| |conditions|)))
           (SETQ |heading|
                   (APPEND |heading|
                           (CONS " viewed"
                                 (CONS |connective|
                                       (CONS "{\\em "
                                             (CONS (STRINGIMAGE |view|)
                                                   (CONS "}" NIL)))))))))
         |heading|)))))))
 
; dbShowConstructorLines lines ==
;   cAlist := [[getConstructorForm intern dbName line,:true] for line in lines]
;   dbShowCons1(nil,listSort(function GLESSEQP,cAlist),'names)
 
(DEFUN |dbShowConstructorLines| (|lines|)
  (PROG (|cAlist|)
    (RETURN
     (PROGN
      (SETQ |cAlist|
              ((LAMBDA (|bfVar#101| |bfVar#100| |line|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#100|)
                        (PROGN (SETQ |line| (CAR |bfVar#100|)) NIL))
                    (RETURN (NREVERSE |bfVar#101|)))
                   ('T
                    (SETQ |bfVar#101|
                            (CONS
                             (CONS
                              (|getConstructorForm|
                               (|intern| (|dbName| |line|)))
                              T)
                             |bfVar#101|))))
                  (SETQ |bfVar#100| (CDR |bfVar#100|))))
               NIL |lines| NIL))
      (|dbShowCons1| NIL (|listSort| #'GLESSEQP |cAlist|) '|names|)))))
 
; bcUnixTable(u) ==
;   htSay '"\newline"
;   htBeginTable()
;   firstTime := true
;   for x in u repeat
;     if firstTime then firstTime := false
;     else htSaySaturn '"&"
;     htSay '"{"
;     ft :=
;       isAsharpFileName? x => '("AS")
;       '("SPAD")
;     filename := NAMESTRING find_file(STRINGIMAGE x, ft)
;     htMakePage [['text, '"\unixcommand{",PATHNAME_-NAME x, '"}{$AXIOM/lib/SPADEDIT ", filename, '"} "]]
;     htSay '"}"
;   htEndTable()
 
(DEFUN |bcUnixTable| (|u|)
  (PROG (|firstTime| |ft| |filename|)
    (RETURN
     (PROGN
      (|htSay| "\\newline")
      (|htBeginTable|)
      (SETQ |firstTime| T)
      ((LAMBDA (|bfVar#102| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#102|) (PROGN (SETQ |x| (CAR |bfVar#102|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (COND (|firstTime| (SETQ |firstTime| NIL))
                   (#1# (|htSaySaturn| "&")))
             (|htSay| "{")
             (SETQ |ft|
                     (COND ((|isAsharpFileName?| |x|) '("AS"))
                           (#1# '("SPAD"))))
             (SETQ |filename|
                     (NAMESTRING (|find_file| (STRINGIMAGE |x|) |ft|)))
             (|htMakePage|
              (LIST
               (LIST '|text| "\\unixcommand{" (PATHNAME-NAME |x|)
                     "}{$AXIOM/lib/SPADEDIT " |filename| "} ")))
             (|htSay| "}"))))
          (SETQ |bfVar#102| (CDR |bfVar#102|))))
       |u| NIL)
      (|htEndTable|)))))
 
; isAsharpFileName? con == false
 
(DEFUN |isAsharpFileName?| (|con|) (PROG () (RETURN NIL)))
 
; dbSpecialDescription(conname) ==
;   conform := getConstructorForm conname
;   heading := ['"Description of Domain {\sf ",form2HtString conform,'"}"]
;   page := htInitPage(heading,nil)
;   htpSetProperty(page,'conname,conname)
;   $conformsAreDomains := nil
;   dbShowConsDoc1(page,conform,nil)
;   htShowPage()
 
(DEFUN |dbSpecialDescription| (|conname|)
  (PROG (|conform| |heading| |page|)
    (RETURN
     (PROGN
      (SETQ |conform| (|getConstructorForm| |conname|))
      (SETQ |heading|
              (LIST "Description of Domain {\\sf " (|form2HtString| |conform|)
                    "}"))
      (SETQ |page| (|htInitPage| |heading| NIL))
      (|htpSetProperty| |page| '|conname| |conname|)
      (SETQ |$conformsAreDomains| NIL)
      (|dbShowConsDoc1| |page| |conform| NIL)
      (|htShowPage|)))))
 
; dbSpecialOperations(conname) ==
;   page := htInitPage(nil,nil)
;   conform := getConstructorForm conname
;   opAlist := dbSpecialExpandIfNecessary(conform,rest GETL(conname,'documentation))
;   fromHeading := ['" from domain {\sf ",form2HtString conform,'"}"]
;   htpSetProperty(page,'fromHeading,fromHeading)
;   htpSetProperty(page,'conform,conform)
;   htpSetProperty(page,'opAlist,opAlist)
;   htpSetProperty(page,'noUsage,true)
;   htpSetProperty(page,'condition?,'no)
;   dbShowOp1(page,opAlist,'"operation",'names)
 
(DEFUN |dbSpecialOperations| (|conname|)
  (PROG (|page| |conform| |opAlist| |fromHeading|)
    (RETURN
     (PROGN
      (SETQ |page| (|htInitPage| NIL NIL))
      (SETQ |conform| (|getConstructorForm| |conname|))
      (SETQ |opAlist|
              (|dbSpecialExpandIfNecessary| |conform|
               (CDR (GETL |conname| '|documentation|))))
      (SETQ |fromHeading|
              (LIST " from domain {\\sf " (|form2HtString| |conform|) "}"))
      (|htpSetProperty| |page| '|fromHeading| |fromHeading|)
      (|htpSetProperty| |page| '|conform| |conform|)
      (|htpSetProperty| |page| '|opAlist| |opAlist|)
      (|htpSetProperty| |page| '|noUsage| T)
      (|htpSetProperty| |page| '|condition?| '|no|)
      (|dbShowOp1| |page| |opAlist| "operation" '|names|)))))
 
; dbSpecialExports(conname) ==
;   conform := getConstructorForm conname
;   page := htInitPage(['"Exports of {\sf ",form2HtString conform,'"}"],nil)
;   opAlist := dbSpecialExpandIfNecessary(conform,rest GETL(conname,'documentation))
;   kePageDisplay(page,'"operation",opAlist)
;   htShowPage()
 
(DEFUN |dbSpecialExports| (|conname|)
  (PROG (|conform| |page| |opAlist|)
    (RETURN
     (PROGN
      (SETQ |conform| (|getConstructorForm| |conname|))
      (SETQ |page|
              (|htInitPage|
               (LIST "Exports of {\\sf " (|form2HtString| |conform|) "}") NIL))
      (SETQ |opAlist|
              (|dbSpecialExpandIfNecessary| |conform|
               (CDR (GETL |conname| '|documentation|))))
      (|kePageDisplay| |page| "operation" |opAlist|)
      (|htShowPage|)))))
 
; dbSpecialExpandIfNecessary(conform,opAlist) ==
;   opAlist is [[op,[sig,:r],:.],:.] and rest r => opAlist
;   for [op,:u] in opAlist repeat
;     for pair in u repeat
;       [sig,comments] := pair
;       RPLACD(pair,['T,conform,'T,comments]) --[sig,pred,origin,exposeFg,doc]
;   opAlist
 
(DEFUN |dbSpecialExpandIfNecessary| (|conform| |opAlist|)
  (PROG (|ISTMP#1| |op| |ISTMP#2| |ISTMP#3| |sig| |r| |u| |comments|)
    (RETURN
     (COND
      ((AND (CONSP |opAlist|)
            (PROGN
             (SETQ |ISTMP#1| (CAR |opAlist|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |op| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|)
                        (PROGN
                         (SETQ |ISTMP#3| (CAR |ISTMP#2|))
                         (AND (CONSP |ISTMP#3|)
                              (PROGN
                               (SETQ |sig| (CAR |ISTMP#3|))
                               (SETQ |r| (CDR |ISTMP#3|))
                               #1='T)))))))
            (CDR |r|))
       |opAlist|)
      (#1#
       (PROGN
        ((LAMBDA (|bfVar#104| |bfVar#103|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#104|)
                  (PROGN (SETQ |bfVar#103| (CAR |bfVar#104|)) NIL))
              (RETURN NIL))
             (#1#
              (AND (CONSP |bfVar#103|)
                   (PROGN
                    (SETQ |op| (CAR |bfVar#103|))
                    (SETQ |u| (CDR |bfVar#103|))
                    #1#)
                   ((LAMBDA (|bfVar#105| |pair|)
                      (LOOP
                       (COND
                        ((OR (ATOM |bfVar#105|)
                             (PROGN (SETQ |pair| (CAR |bfVar#105|)) NIL))
                         (RETURN NIL))
                        (#1#
                         (PROGN
                          (SETQ |sig| (CAR |pair|))
                          (SETQ |comments| (CADR |pair|))
                          (RPLACD |pair| (LIST 'T |conform| 'T |comments|)))))
                       (SETQ |bfVar#105| (CDR |bfVar#105|))))
                    |u| NIL))))
            (SETQ |bfVar#104| (CDR |bfVar#104|))))
         |opAlist| NIL)
        |opAlist|))))))
 
; X := '"{\sf Record(a:A,b:B)} is used to create the class of pairs of objects made up of a value of type {\em A} selected by the symbol {\em a} and a value of type {\em B} selected by the symbol {\em b}. "
 
(EVAL-WHEN (EVAL LOAD)
  (SETQ X
          "{\\sf Record(a:A,b:B)} is used to create the class of pairs of objects made up of a value of type {\\em A} selected by the symbol {\\em a} and a value of type {\\em B} selected by the symbol {\\em b}. "))
 
; Y := '"In general, the {\sf Record} constructor can take any number of arguments and thus can be used to create aggregates of heterogeneous components of arbitrary size selectable by name. "
 
(EVAL-WHEN (EVAL LOAD)
  (SETQ Y
          "In general, the {\\sf Record} constructor can take any number of arguments and thus can be used to create aggregates of heterogeneous components of arbitrary size selectable by name. "))
 
; Z := '"{\sf Record} is a primitive domain of \Language{} which cannot be defined in the \Language{} language."
 
(EVAL-WHEN (EVAL LOAD)
  (SETQ Z
          "{\\sf Record} is a primitive domain of \\Language{} which cannot be defined in the \\Language{} language."))
 
; MESSAGE := STRCONC(X,Y,Z)
 
(EVAL-WHEN (EVAL LOAD) (SETQ MESSAGE (STRCONC X Y Z)))
 
; PUT('Record,'documentation,SUBST(MESSAGE,'MESSAGE,'(
;   (constructor (NIL MESSAGE))
;  (_=  (((Boolean) _$ _$)
;    "\spad{r = s} tests for equality of two records \spad{r} and \spad{s}"))
;  (coerce (((OutputForm) _$)
;    "\spad{coerce(r)} returns an representation of \spad{r} as an output form")
;          ((_$ (List (Any)))
;    "\spad{coerce(u)}, where \spad{u} is the list \spad{[x,y]} for \spad{x} of type \spad{A} and \spad{y} of type \spad{B}, returns the record \spad{[a:x,b:y]}"))
;  (construct ((_$ A B)
;    "\spad{construct(x, y)} returns the record \spad{[a:x,b:y]}"))
;  (elt ((A $ "a")
;    "\spad{r . a} returns the value stored in record \spad{r} under selector \spad{a}.")
;       ((B $ "b")
;    "\spad{r . b} returns the value stored in record \spad{r} under selector \spad{b}."))
;  (setelt ((A $ "a" A)
;    "\spad{r . a := x} destructively replaces the value stored in record \spad{r} under selector \spad{a} by the value of \spad{x}. Error: if \spad{r} has not been previously assigned a value.")
;          ((B $ "b" B)
;    "\spad{r . b := y} destructively replaces the value stored in record \spad{r} under selector \spad{b} by the value of \spad{y}. Error: if \spad{r} has not been previously assigned a value."))
;    )))
 
(EVAL-WHEN (EVAL LOAD)
  (PROG ()
    (RETURN
     (PUT '|Record| '|documentation|
      (SUBST MESSAGE 'MESSAGE
             '((|constructor| (NIL MESSAGE))
               (=
                (((|Boolean|) $ $)
                 "\\spad{r = s} tests for equality of two records \\spad{r} and \\spad{s}"))
               (|coerce|
                (((|OutputForm|) $)
                 "\\spad{coerce(r)} returns an representation of \\spad{r} as an output form")
                (($ (|List| (|Any|)))
                 "\\spad{coerce(u)}, where \\spad{u} is the list \\spad{[x,y]} for \\spad{x} of type \\spad{A} and \\spad{y} of type \\spad{B}, returns the record \\spad{[a:x,b:y]}"))
               (|construct|
                (($ A B)
                 "\\spad{construct(x, y)} returns the record \\spad{[a:x,b:y]}"))
               (|elt|
                ((A $ "a")
                 "\\spad{r . a} returns the value stored in record \\spad{r} under selector \\spad{a}.")
                ((B $ "b")
                 "\\spad{r . b} returns the value stored in record \\spad{r} under selector \\spad{b}."))
               (|setelt|
                ((A $ "a" A)
                 "\\spad{r . a := x} destructively replaces the value stored in record \\spad{r} under selector \\spad{a} by the value of \\spad{x}. Error: if \\spad{r} has not been previously assigned a value.")
                ((B $ "b" B)
                 "\\spad{r . b := y} destructively replaces the value stored in record \\spad{r} under selector \\spad{b} by the value of \\spad{y}. Error: if \\spad{r} has not been previously assigned a value."))))))))
 
; X := '"{\sf Union(A,B)} denotes the class of objects which are which are either members of domain {\em A} or of domain {\em B}. The {\sf Union} constructor can take any number of arguments. "
 
(EVAL-WHEN (EVAL LOAD)
  (SETQ X
          "{\\sf Union(A,B)} denotes the class of objects which are which are either members of domain {\\em A} or of domain {\\em B}. The {\\sf Union} constructor can take any number of arguments. "))
 
; Y := '"For an alternate form of {\sf Union} with _"tags_", see \downlink{Union(a:A,b:B)}{DomainUnion}. {\sf Union} is a primitive domain of \Language{} which cannot be defined in the \Language{} language."
 
(EVAL-WHEN (EVAL LOAD)
  (SETQ Y
          "For an alternate form of {\\sf Union} with \"tags\", see \\downlink{Union(a:A,b:B)}{DomainUnion}. {\\sf Union} is a primitive domain of \\Language{} which cannot be defined in the \\Language{} language."))
 
; MESSAGE := STRCONC(X,Y)
 
(EVAL-WHEN (EVAL LOAD) (SETQ MESSAGE (STRCONC X Y)))
 
; PUT('UntaggedUnion,'documentation,SUBST(MESSAGE,'MESSAGE,'(
;   (constructor (NIL MESSAGE))
;   (_=  (((Boolean) $ $)
;     "\spad{u = v} tests if two objects of the union are equal, that is, u and v are hold objects of same branch which are equal."))
;   (case (((Boolean) $ "A")
;     "\spad{u case A} tests if \spad{u} is of the type \spad{A} branch of the union.")
;         (((Boolean) $ "B")
;     "\spad{u case B} tests if \spad{u} is of the \spad{B} branch of the union."))
;   (coerce ((A $)
;     "\spad{coerce(u)} returns \spad{x} of type \spad{A} if \spad{x} is of the \spad{A} branch of the union. Error: if \spad{u} is of the \spad{B} branch of the union.")
;           ((B $)
;     "\spad{coerce(u)} returns \spad{x} of type \spad{B} if \spad{x} is of the \spad{B} branch of the union. Error: if \spad{u} is of the \spad{A} branch of the union.")
;           (($ A)
;     "\spad{coerce(x)}, where \spad{x} has type \spad{A}, returns \spad{x} as a union type.")
;           (($ B)
;     "\spad{coerce(y)}, where \spad{y} has type \spad{B}, returns \spad{y} as a union type."))
;   )))
 
(EVAL-WHEN (EVAL LOAD)
  (PROG ()
    (RETURN
     (PUT '|UntaggedUnion| '|documentation|
      (SUBST MESSAGE 'MESSAGE
             '((|constructor| (NIL MESSAGE))
               (=
                (((|Boolean|) $ $)
                 "\\spad{u = v} tests if two objects of the union are equal, that is, u and v are hold objects of same branch which are equal."))
               (CASE
                   (((|Boolean|) $ "A")
                    "\\spad{u case A} tests if \\spad{u} is of the type \\spad{A} branch of the union.")
                 (((|Boolean|) $ "B")
                  "\\spad{u case B} tests if \\spad{u} is of the \\spad{B} branch of the union."))
               (|coerce|
                ((A $)
                 "\\spad{coerce(u)} returns \\spad{x} of type \\spad{A} if \\spad{x} is of the \\spad{A} branch of the union. Error: if \\spad{u} is of the \\spad{B} branch of the union.")
                ((B $)
                 "\\spad{coerce(u)} returns \\spad{x} of type \\spad{B} if \\spad{x} is of the \\spad{B} branch of the union. Error: if \\spad{u} is of the \\spad{A} branch of the union.")
                (($ A)
                 "\\spad{coerce(x)}, where \\spad{x} has type \\spad{A}, returns \\spad{x} as a union type.")
                (($ B)
                 "\\spad{coerce(y)}, where \\spad{y} has type \\spad{B}, returns \\spad{y} as a union type."))))))))
 
; X := '"{\sf Union(a:A,b:B)} denotes the class of objects which are either members of domain {\em A} or of domain {\em B}. "
 
(EVAL-WHEN (EVAL LOAD)
  (SETQ X
          "{\\sf Union(a:A,b:B)} denotes the class of objects which are either members of domain {\\em A} or of domain {\\em B}. "))
 
; Y := '"The symbols {\em a} and {\em b} are called _"tags_" and are used to identify the two _"branches_" of the union. "
 
(EVAL-WHEN (EVAL LOAD)
  (SETQ Y
          "The symbols {\\em a} and {\\em b} are called \"tags\" and are used to identify the two \"branches\" of the union. "))
 
; Z := '"The {\sf Union} constructor can take any number of arguments and has an alternate form without {\em tags} (see \downlink{Union(A,B)}{UntaggedUnion}). "
 
(EVAL-WHEN (EVAL LOAD)
  (SETQ Z
          "The {\\sf Union} constructor can take any number of arguments and has an alternate form without {\\em tags} (see \\downlink{Union(A,B)}{UntaggedUnion}). "))
 
; W := '"This tagged {\sf Union} type is necessary, for example, to disambiguate two branches of a union where {\em A} and {\em B} denote the same type. "
 
(EVAL-WHEN (EVAL LOAD)
  (SETQ W
          "This tagged {\\sf Union} type is necessary, for example, to disambiguate two branches of a union where {\\em A} and {\\em B} denote the same type. "))
 
; A := '"{\sf Union} is a primitive domain of \Language{} which cannot be defined in the \Language{} language."
 
(EVAL-WHEN (EVAL LOAD)
  (SETQ A
          "{\\sf Union} is a primitive domain of \\Language{} which cannot be defined in the \\Language{} language."))
 
; MESSAGE := STRCONC(X,Y,Z,W,A)
 
(EVAL-WHEN (EVAL LOAD) (SETQ MESSAGE (STRCONC X Y Z W A)))
 
; PUT('Union,'documentation,SUBST(MESSAGE,'MESSAGE,'(
;   (constructor (NIL MESSAGE))
;   (_=  (((Boolean) $ $)
;     "\spad{u = v} tests if two objects of the union are equal, that is, \spad{u} and \spad{v} are objects of same branch which are equal."))
;   (case (((Boolean) $ "A")
;     "\spad{u case a} tests if \spad{u} is of branch \spad{a} of the union.")
;                 (((Boolean) $ "B")
;     "\spad{u case b} tests if \spad{u} is of branch \spad{b} of the union."))
;   (coerce ((A $)
;     "\spad{coerce(u)} returns \spad{x} of type \spad{A} if \spad{x} is of branch \spad{a} of the union. Error: if \spad{u} is of branch \spad{b} of the union.")
;           ((B $)
;     "\spad{coerce(u)} returns \spad{x} of type \spad{B} if \spad{x} is of branch \spad{b} branch of the union. Error: if \spad{u} is of the \spad{a} branch of the union.")
;           (($ A)
;     "\spad{coerce(x)}, where \spad{x} has type \spad{A}, returns \spad{x} as a union type.")
;           (($ B)
;     "\spad{coerce(y)}, where \spad{y} has type \spad{B}, returns \spad{y} as a union type."))
;   )))
 
(EVAL-WHEN (EVAL LOAD)
  (PROG ()
    (RETURN
     (PUT '|Union| '|documentation|
      (SUBST MESSAGE 'MESSAGE
             '((|constructor| (NIL MESSAGE))
               (=
                (((|Boolean|) $ $)
                 "\\spad{u = v} tests if two objects of the union are equal, that is, \\spad{u} and \\spad{v} are objects of same branch which are equal."))
               (CASE
                   (((|Boolean|) $ "A")
                    "\\spad{u case a} tests if \\spad{u} is of branch \\spad{a} of the union.")
                 (((|Boolean|) $ "B")
                  "\\spad{u case b} tests if \\spad{u} is of branch \\spad{b} of the union."))
               (|coerce|
                ((A $)
                 "\\spad{coerce(u)} returns \\spad{x} of type \\spad{A} if \\spad{x} is of branch \\spad{a} of the union. Error: if \\spad{u} is of branch \\spad{b} of the union.")
                ((B $)
                 "\\spad{coerce(u)} returns \\spad{x} of type \\spad{B} if \\spad{x} is of branch \\spad{b} branch of the union. Error: if \\spad{u} is of the \\spad{a} branch of the union.")
                (($ A)
                 "\\spad{coerce(x)}, where \\spad{x} has type \\spad{A}, returns \\spad{x} as a union type.")
                (($ B)
                 "\\spad{coerce(y)}, where \\spad{y} has type \\spad{B}, returns \\spad{y} as a union type."))))))))
 
; X := '"{\sf Mapping(T,S,...)} denotes the class of objects which are mappings from a source domain ({\em S,...}) into a target domain {\em T}. The {\sf Mapping} constructor can take any number of arguments."
 
(EVAL-WHEN (EVAL LOAD)
  (SETQ X
          "{\\sf Mapping(T,S,...)} denotes the class of objects which are mappings from a source domain ({\\em S,...}) into a target domain {\\em T}. The {\\sf Mapping} constructor can take any number of arguments."))
 
; Y := '" All but the first argument is regarded as part of a source tuple for the mapping. For example, {\sf Mapping(T,A,B)} denotes the class of mappings from {\em (A,B)} into {\em T}. "
 
(EVAL-WHEN (EVAL LOAD)
  (SETQ Y
          " All but the first argument is regarded as part of a source tuple for the mapping. For example, {\\sf Mapping(T,A,B)} denotes the class of mappings from {\\em (A,B)} into {\\em T}. "))
 
; Z := '"{\sf Mapping} is a primitive domain of \Language{} which cannot be defined in the \Language{} language."
 
(EVAL-WHEN (EVAL LOAD)
  (SETQ Z
          "{\\sf Mapping} is a primitive domain of \\Language{} which cannot be defined in the \\Language{} language."))
 
; MESSAGE := STRCONC(X,Y,Z)
 
(EVAL-WHEN (EVAL LOAD) (SETQ MESSAGE (STRCONC X Y Z)))
 
; PUT('Mapping,'documentation, SUBST(MESSAGE,'MESSAGE,'(
;   (constructor (NIL MESSAGE))
;   (_=  (((Boolean) $ $)
;     "\spad{u = v} tests if mapping objects are equal."))
;    )))
 
(EVAL-WHEN (EVAL LOAD)
  (PROG ()
    (RETURN
     (PUT '|Mapping| '|documentation|
      (SUBST MESSAGE 'MESSAGE
             '((|constructor| (NIL MESSAGE))
               (=
                (((|Boolean|) $ $)
                 "\\spad{u = v} tests if mapping objects are equal."))))))))
 
; X := '"{\em Enumeration(a1, a2 ,..., aN)} creates an object which is exactly one of the N symbols {\em a1}, {\em a2}, ..., or {\em aN}, N > 0. "
 
(EVAL-WHEN (EVAL LOAD)
  (SETQ X
          "{\\em Enumeration(a1, a2 ,..., aN)} creates an object which is exactly one of the N symbols {\\em a1}, {\\em a2}, ..., or {\\em aN}, N > 0. "))
 
; Y := '" The {\em Enumeration} can constructor can take any number of symbols as arguments."
 
(EVAL-WHEN (EVAL LOAD)
  (SETQ Y
          " The {\\em Enumeration} can constructor can take any number of symbols as arguments."))
 
; MESSAGE := STRCONC(X, Y)
 
(EVAL-WHEN (EVAL LOAD) (SETQ MESSAGE (STRCONC X Y)))
 
; PUT('Enumeration, 'documentation, SUBST(MESSAGE, 'MESSAGE, '(
;   (constructor (NIL MESSAGE))
;   (_= (((Boolean) _$ _$)
;     "\spad{e = f} tests for equality of two enumerations \spad{e} and \spad{f}"))
;   (_^_= (((Boolean) _$ _$)
;     "\spad{e ~= f} tests that two enumerations \spad{e} and \spad{f} are nont equal"))
;   (coerce (((OutputForm) _$)
;      "\spad{coerce(e)} returns a representation of enumeration \spad{r} as an output form")
;           ((_$ (Symbol))
;      "\spad{coerce(s)} converts a symbol \spad{s} into an enumeration which has \spad{s} as a member symbol"))
;   )))
 
(EVAL-WHEN (EVAL LOAD)
  (PROG ()
    (RETURN
     (PUT '|Enumeration| '|documentation|
      (SUBST MESSAGE 'MESSAGE
             '((|constructor| (NIL MESSAGE))
               (=
                (((|Boolean|) $ $)
                 "\\spad{e = f} tests for equality of two enumerations \\spad{e} and \\spad{f}"))
               (^=
                (((|Boolean|) $ $)
                 "\\spad{e ~= f} tests that two enumerations \\spad{e} and \\spad{f} are nont equal"))
               (|coerce|
                (((|OutputForm|) $)
                 "\\spad{coerce(e)} returns a representation of enumeration \\spad{r} as an output form")
                (($ (|Symbol|))
                 "\\spad{coerce(s)} converts a symbol \\spad{s} into an enumeration which has \\spad{s} as a member symbol"))))))))
 
; mkConArgSublis args ==
;   [[arg,:INTERN digits2Names PNAME arg] for arg in args
;      | (s := PNAME arg) and or/[DIGITP ELT(s,i) for i in 0..MAXINDEX s]]
 
(DEFUN |mkConArgSublis| (|args|)
  (PROG (|s|)
    (RETURN
     ((LAMBDA (|bfVar#109| |bfVar#106| |arg|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#106|) (PROGN (SETQ |arg| (CAR |bfVar#106|)) NIL))
           (RETURN (NREVERSE |bfVar#109|)))
          (#1='T
           (AND (SETQ |s| (PNAME |arg|))
                ((LAMBDA (|bfVar#108| |bfVar#107| |i|)
                   (LOOP
                    (COND ((> |i| |bfVar#107|) (RETURN |bfVar#108|))
                          (#1#
                           (PROGN
                            (SETQ |bfVar#108| (DIGITP (ELT |s| |i|)))
                            (COND (|bfVar#108| (RETURN |bfVar#108|))))))
                    (SETQ |i| (+ |i| 1))))
                 NIL (MAXINDEX |s|) 0)
                (SETQ |bfVar#109|
                        (CONS
                         (CONS |arg| (INTERN (|digits2Names| (PNAME |arg|))))
                         |bfVar#109|)))))
         (SETQ |bfVar#106| (CDR |bfVar#106|))))
      NIL |args| NIL))))
 
; digits2Names s ==
; --This is necessary since arguments of conforms CANNOT have digits in TechExplorer
;   str := '""
;   for i in 0..MAXINDEX s repeat
;     c := s.i
;     segment :=
;       n := DIGIT_-CHAR_-P c =>
;         ('("Zero" "One" "Two" "Three" "Four" "Five" "Six" "Seven" "Eight" "Nine")).n
;       c
;     CONCAT(str, segment)
;   str
 
(DEFUN |digits2Names| (|s|)
  (PROG (|str| |c| |n| |segment|)
    (RETURN
     (PROGN
      (SETQ |str| "")
      ((LAMBDA (|bfVar#110| |i|)
         (LOOP
          (COND ((> |i| |bfVar#110|) (RETURN NIL))
                (#1='T
                 (PROGN
                  (SETQ |c| (ELT |s| |i|))
                  (SETQ |segment|
                          (COND
                           ((SETQ |n| (DIGIT-CHAR-P |c|))
                            (ELT
                             '("Zero" "One" "Two" "Three" "Four" "Five" "Six"
                               "Seven" "Eight" "Nine")
                             |n|))
                           (#1# |c|)))
                  (CONCAT |str| |segment|))))
          (SETQ |i| (+ |i| 1))))
       (MAXINDEX |s|) 0)
      |str|))))
