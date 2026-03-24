
; )package "BOOT"

(IN-PACKAGE "BOOT")

; conPage(a) ==
;   --The next 4 lines allow e.g. MATRIX INT  ==> Matrix Integer (see kPage)
;   form :=
;     atom a => [a]
;     a
;   $conArgstrings : local := [form2HtString x for x in IFCDR a]
;   a := first form
;   da := DOWNCASE a
;   pageName := QLASSQ(da, '((type . CategoryType) (union . DomainUnion) _
;                            (record . DomainRecord) (mapping . DomainMapping) _
;                            (enumeration . DomainEnumeration))) =>
;       downlink pageName       --special jump out for primitive domains
;   line := conPageFastPath da  => kPage(line, [form]) --lower case name of cons?
;   line := conPageFastPath UPCASE a => kPage(line, [form]) --upper case an abbr?
;   ySearch a       --slow search (include default packages)

(DEFUN |conPage| (|a|)
  (PROG (|$conArgstrings| |line| |pageName| |da| |form|)
    (DECLARE (SPECIAL |$conArgstrings|))
    (RETURN
     (PROGN
      (SETQ |form| (COND ((ATOM |a|) (LIST |a|)) (#1='T |a|)))
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
      (SETQ |a| (CAR |form|))
      (SETQ |da| (DOWNCASE |a|))
      (COND
       ((SETQ |pageName|
                (QLASSQ |da|
                 '((|type| . |CategoryType|) (|union| . |DomainUnion|)
                   (|record| . |DomainRecord|) (|mapping| . |DomainMapping|)
                   (|enumeration| . |DomainEnumeration|))))
        (|downlink| |pageName|))
       ((SETQ |line| (|conPageFastPath| |da|)) (|kPage| |line| (LIST |form|)))
       ((SETQ |line| (|conPageFastPath| (UPCASE |a|)))
        (|kPage| |line| (LIST |form|)))
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
                  ((LAMBDA (|bfVar#4| |bfVar#3| |t|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#3|)
                            (PROGN (SETQ |t| (CAR |bfVar#3|)) NIL))
                        (RETURN (NREVERSE |bfVar#4|)))
                       (#1#
                        (SETQ |bfVar#4|
                                (CONS (|mkDomTypeForm| |t| |conform| |domname|)
                                      |bfVar#4|))))
                      (SETQ |bfVar#3| (CDR |bfVar#3|))))
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
(DEFUN |domainDescendantsOf,jfn| (|bfVar#13| |domlist|)
  (PROG (|y| |r| |alist| |ISTMP#1| |keepList| |item| |pred| |u|)
    (RETURN
     (PROGN
      (SETQ |y| (CAR |bfVar#13|))
      (SETQ |r| (CDR |bfVar#13|))
      (SETQ |alist| (|domainsOf| |y| (IFCAR |domlist|)))
      ((LAMBDA (|bfVar#5| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#5|) (PROGN (SETQ |x| (CAR |bfVar#5|)) NIL))
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
                ((LAMBDA (|bfVar#7| |bfVar#6|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#7|)
                          (PROGN (SETQ |bfVar#6| (CAR |bfVar#7|)) NIL))
                      (RETURN NIL))
                     (#1#
                      (AND (CONSP |bfVar#6|)
                           (PROGN
                            (SETQ |item| (CAR |bfVar#6|))
                            (SETQ |pred| (CDR |bfVar#6|))
                            #1#)
                           (COND
                            ((SETQ |u| (|assoc| |item| |alist|))
                             (IDENTITY
                              (SETQ |keepList|
                                      (CONS
                                       (CONS |item|
                                             (|quickAnd| (CDR |u|) |pred|))
                                       |keepList|))))))))
                    (SETQ |bfVar#7| (CDR |bfVar#7|))))
                 (|domainsOf| |x| (IFCAR |domlist|)) NIL)
                (SETQ |alist| |keepList|)))))))
          (SETQ |bfVar#5| (CDR |bfVar#5|))))
       |r| NIL)
      ((LAMBDA (|bfVar#8| |pair|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#8|) (PROGN (SETQ |pair| (CAR |bfVar#8|)) NIL))
            (RETURN NIL))
           (#1# (RPLACD |pair| (|simpHasPred| (CDR |pair|)))))
          (SETQ |bfVar#8| (CDR |bfVar#8|))))
       |alist| NIL)
      (|listSort| #'GLESSEQP |alist|)))))
(DEFUN |domainDescendantsOf,catScreen| (|r| |alist|)
  (PROG (|op1| |item| |pred| |pred1| |npred|)
    (RETURN
     (PROGN
      ((LAMBDA (|bfVar#9| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#9|) (PROGN (SETQ |x| (CAR |bfVar#9|)) NIL))
            (RETURN NIL))
           (#1='T
            (COND
             ((AND (NOT (AND (CONSP |x|) (PROGN (SETQ |op1| (CAR |x|)) #1#)))
                   (MEMQ |op1| '(ATTRIBUTE SIGNATURE)))
              (|systemError| |x|))
             (#1#
              (SETQ |alist|
                      ((LAMBDA (|bfVar#12| |bfVar#11| |bfVar#10|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#11|)
                                (PROGN (SETQ |bfVar#10| (CAR |bfVar#11|)) NIL))
                            (RETURN (NREVERSE |bfVar#12|)))
                           (#1#
                            (AND (CONSP |bfVar#10|)
                                 (PROGN
                                  (SETQ |item| (CAR |bfVar#10|))
                                  (SETQ |pred| (CDR |bfVar#10|))
                                  #1#)
                                 (SETQ |pred1|
                                         (|simpHasPred|
                                          (LIST '|has| |item| |x|)))
                                 (SETQ |npred| (|quickAnd| |pred1| |pred|))
                                 (SETQ |bfVar#12|
                                         (CONS (CONS |item| |npred|)
                                               |bfVar#12|)))))
                          (SETQ |bfVar#11| (CDR |bfVar#11|))))
                       NIL |alist| NIL))))))
          (SETQ |bfVar#9| (CDR |bfVar#9|))))
       |r| NIL)
      |alist|))))

; kePage(htPage) ==
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
;   [conlist, :oplist] := data
;   if domname then
;     for x in conlist repeat  rplac(rest x, simpHasPred rest x)
;     for x in oplist   repeat rplac(CDDR x, simpHasPred CDDR x)
;   prefix := pluralSay(#conlist + #oplist, '"Export", '"Exports")
;   page := htInitPage([:prefix,'" of ",:heading],htCopyProplist htPage)
;   htSayStandard '"\beginmenu "
;   htpSetProperty(page,'data,data)
;   if conlist then
;     htMakePage [['bcLinks,[menuButton(),'"",'dbShowCons1,conlist,'names]]]
;     htSayStandard '"\tab{2}"
;     htSay  '"All attributes and operations from:"
;     bcConPredTable(conlist,opOf conform,rest conform)
;   if oplist then
;     if conlist then htBigSkip()
;     kePageDisplay(page, kePageOpAlist(oplist))
;   htSayStandard '" \endmenu "
;   htShowPage()

(DEFUN |kePage| (|htPage|)
  (PROG (|$conformsAreDomains| |page| |prefix| |oplist| |conlist| |data|
         |heading| |conname| |conform| |domname| |constring| |comments|
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
         (SETQ |oplist| (CDR |data|))
         (COND
          (|domname|
           ((LAMBDA (|bfVar#14| |x|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#14|) (PROGN (SETQ |x| (CAR |bfVar#14|)) NIL))
                 (RETURN NIL))
                (#4# (|rplac| (CDR |x|) (|simpHasPred| (CDR |x|)))))
               (SETQ |bfVar#14| (CDR |bfVar#14|))))
            |conlist| NIL)
           ((LAMBDA (|bfVar#15| |x|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#15|) (PROGN (SETQ |x| (CAR |bfVar#15|)) NIL))
                 (RETURN NIL))
                (#4# (|rplac| (CDDR |x|) (|simpHasPred| (CDDR |x|)))))
               (SETQ |bfVar#15| (CDR |bfVar#15|))))
            |oplist| NIL)))
         (SETQ |prefix|
                 (|pluralSay| (+ (LENGTH |conlist|) (LENGTH |oplist|)) "Export"
                  "Exports"))
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
          (|oplist| (COND (|conlist| (|htBigSkip|)))
           (|kePageDisplay| |page| (|kePageOpAlist| |oplist|))))
         (|htSayStandard| " \\endmenu ")
         (|htShowPage|))))))))

; kePageOpAlist oplist ==
;   opAlist := nil
;   for [op,sig,:pred] in oplist repeat
;     u := LASSOC(op,opAlist)
;     opAlist := insertAlist(zeroOneConvert op,[[sig,pred],:u],opAlist)
;   opAlist

(DEFUN |kePageOpAlist| (|oplist|)
  (PROG (|opAlist| |op| |ISTMP#1| |sig| |pred| |u|)
    (RETURN
     (PROGN
      (SETQ |opAlist| NIL)
      ((LAMBDA (|bfVar#17| |bfVar#16|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#17|)
                (PROGN (SETQ |bfVar#16| (CAR |bfVar#17|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#16|)
                 (PROGN
                  (SETQ |op| (CAR |bfVar#16|))
                  (SETQ |ISTMP#1| (CDR |bfVar#16|))
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
          (SETQ |bfVar#17| (CDR |bfVar#17|))))
       |oplist| NIL)
      |opAlist|))))

; kePageDisplay(htPage, opAlist) ==
;   count := #opAlist
;   total := +/[#(rest entry) for entry in opAlist]
;   count = 0 => nil
;   htpSetProperty(htPage, 'opAlist, opAlist)
;   htpSetProperty(htPage, 'expandOperations, 'lists)  --mark as unexpanded
;   which := '"operation"
;   htMakePage [['bcLinks, [menuButton(), '"", 'dbShowOps, 'names]]]
;   htSayStandard '"\tab{2}"
;   if count ~= total then
;     if count = 1
;     then htSay('"1 name for ")
;     else htSayList([STRINGIMAGE count, '" names for "])
;   if total > 1
;     then htSayList([STRINGIMAGE total, '" ", pluralize which,
;                    '" are explicitly exported:"])
;     else htSayList(['"1 ", which, '" is explicitly exported:"])
;   data := dbGatherData(htPage, opAlist, 'names)
;   dbShowOpItems(data, false)

(DEFUN |kePageDisplay| (|htPage| |opAlist|)
  (PROG (|count| |total| |which| |data|)
    (RETURN
     (PROGN
      (SETQ |count| (LENGTH |opAlist|))
      (SETQ |total|
              ((LAMBDA (|bfVar#19| |bfVar#18| |entry|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#18|)
                        (PROGN (SETQ |entry| (CAR |bfVar#18|)) NIL))
                    (RETURN |bfVar#19|))
                   (#1='T
                    (SETQ |bfVar#19| (+ |bfVar#19| (LENGTH (CDR |entry|))))))
                  (SETQ |bfVar#18| (CDR |bfVar#18|))))
               0 |opAlist| NIL))
      (COND ((EQL |count| 0) NIL)
            (#1#
             (PROGN
              (|htpSetProperty| |htPage| '|opAlist| |opAlist|)
              (|htpSetProperty| |htPage| '|expandOperations| '|lists|)
              (SETQ |which| "operation")
              (|htMakePage|
               (LIST
                (LIST '|bcLinks|
                      (LIST (|menuButton|) "" '|dbShowOps| '|names|))))
              (|htSayStandard| "\\tab{2}")
              (COND
               ((NOT (EQUAL |count| |total|))
                (COND ((EQL |count| 1) (|htSay| "1 name for "))
                      (#1#
                       (|htSayList|
                        (LIST (STRINGIMAGE |count|) " names for "))))))
              (COND
               ((< 1 |total|)
                (|htSayList|
                 (LIST (STRINGIMAGE |total|) " " (|pluralize| |which|)
                       " are explicitly exported:")))
               (#1#
                (|htSayList| (LIST "1 " |which| " is explicitly exported:"))))
              (SETQ |data| (|dbGatherData| |htPage| |opAlist| '|names|))
              (|dbShowOpItems| |data| NIL))))))))

; ksPage(htPage) ==
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

(DEFUN |ksPage| (|htPage|)
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
;   infovec := dbInfovec name or return nil  --exit for categories
;   u := infovec.3
;   $predvec:=
;         $domain => $domain.3
;         get_database(name, 'PREDICATES)
;   catpredvec := first u
;   catinfo    := CADR u
;   catvec     := CADDR u
;   catforms := [[pakform,:pred] for i in 0..MAXINDEX catvec | test ] where
;     test ==
;       pred := simpCatPredicate
;         p:=SUBLISLIS(rest conform,$FormalMapVariableList,kTestPred catpredvec.i)
;         $domain => EVAL p
;         p
;       if domname and CONTAINED('%, pred) then pred := SUBST(domname, '%, pred)
;       (pak := catinfo . i) and pred   --only those with default packages
;     pakform ==
;       pak and not IDENTP pak => devaluate pak --in case it has been instantiated
;       catform := kFormatSlotDomain1(catvec.i, infovec)
;       res := dbSubConform(rest(conform), [pak, "%", :rest(catform)])
;       if domname then res := SUBST(domname, '%, res)
;       res
;   [:dbAddChain conform,:catforms]

(DEFUN |dbSearchOrder| (|conform| |domname| |$domain|)
  (DECLARE (SPECIAL |$domain|))
  (PROG (|name| |infovec| |u| |catpredvec| |catinfo| |catvec| |p| |pred| |pak|
         |catform| |res| |catforms|)
    (RETURN
     (PROGN
      (SETQ |conform| (OR |domname| |conform|))
      (SETQ |name| (|opOf| |conform|))
      (SETQ |infovec| (OR (|dbInfovec| |name|) (RETURN NIL)))
      (SETQ |u| (ELT |infovec| 3))
      (SETQ |$predvec|
              (COND (|$domain| (ELT |$domain| 3))
                    (#1='T (|get_database| |name| 'PREDICATES))))
      (SETQ |catpredvec| (CAR |u|))
      (SETQ |catinfo| (CADR |u|))
      (SETQ |catvec| (CADDR |u|))
      (SETQ |catforms|
              ((LAMBDA (|bfVar#21| |bfVar#20| |i|)
                 (LOOP
                  (COND ((> |i| |bfVar#20|) (RETURN (NREVERSE |bfVar#21|)))
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
                            ((AND |domname| (CONTAINED '% |pred|))
                             (SETQ |pred| (SUBST |domname| '% |pred|))))
                           (AND (SETQ |pak| (ELT |catinfo| |i|)) |pred|))
                          (SETQ |bfVar#21|
                                  (CONS
                                   (CONS
                                    (COND
                                     ((AND |pak| (NULL (IDENTP |pak|)))
                                      (|devaluate| |pak|))
                                     (#1#
                                      (PROGN
                                       (SETQ |catform|
                                               (|kFormatSlotDomain1|
                                                (ELT |catvec| |i|) |infovec|))
                                       (SETQ |res|
                                               (|dbSubConform| (CDR |conform|)
                                                (CONS |pak|
                                                      (CONS '%
                                                            (CDR |catform|)))))
                                       (COND
                                        (|domname|
                                         (SETQ |res|
                                                 (SUBST |domname| '% |res|))))
                                       |res|)))
                                    |pred|)
                                   |bfVar#21|)))))
                  (SETQ |i| (+ |i| 1))))
               NIL (MAXINDEX |catvec|) 0))
      (APPEND (|dbAddChain| |conform|) |catforms|)))))

; kcpPage(htPage) ==
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

(DEFUN |kcpPage| (|htPage|)
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
;   for pair in alist repeat RPLACD(pair, simpHasPred2(rest pair, domform))
;   [pair for (pair := [.,:pred]) in alist | pred]

(DEFUN |reduceAlistForDomain| (|alist| |domform| |conform|)
  (PROG (|pred|)
    (RETURN
     (PROGN
      (SETQ |alist| (SUBLISLIS (CDR |domform|) (CDR |conform|) |alist|))
      ((LAMBDA (|bfVar#22| |pair|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#22|) (PROGN (SETQ |pair| (CAR |bfVar#22|)) NIL))
            (RETURN NIL))
           (#1='T (RPLACD |pair| (|simpHasPred2| (CDR |pair|) |domform|))))
          (SETQ |bfVar#22| (CDR |bfVar#22|))))
       |alist| NIL)
      ((LAMBDA (|bfVar#24| |bfVar#23| |pair|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#23|) (PROGN (SETQ |pair| (CAR |bfVar#23|)) NIL))
            (RETURN (NREVERSE |bfVar#24|)))
           (#1#
            (AND (CONSP |pair|) (PROGN (SETQ |pred| (CDR |pair|)) #1#) |pred|
                 (SETQ |bfVar#24| (CONS |pair| |bfVar#24|)))))
          (SETQ |bfVar#23| (CDR |bfVar#23|))))
       NIL |alist| NIL)))))

; kcaPage(htPage) ==
;     kcaPage1(htPage, '"category", '" an ", '"ancestor",
;              function ancestorsOf, false)

(DEFUN |kcaPage| (|htPage|)
  (PROG ()
    (RETURN
     (|kcaPage1| |htPage| "category" " an " "ancestor" #'|ancestorsOf| NIL))))

; kcdPage(htPage) ==
;     kcaPage1(htPage, '"category", '" a ", '"descendant",
;              function descendantsOf, true)

(DEFUN |kcdPage| (|htPage|)
  (PROG ()
    (RETURN
     (|kcaPage1| |htPage| "category" " a " "descendant" #'|descendantsOf| T))))

; kcdoPage(htPage)==
;     kcaPage1(htPage, '"domain", '" a ", '"descendant",
;              function domainsOf, false)

(DEFUN |kcdoPage| (|htPage|)
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
;   -- if domname then ancestors := SUBST(domname, '%, ancestors)
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

; kccPage(htPage) ==
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

(DEFUN |kccPage| (|htPage|)
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
      ((LAMBDA (|bfVar#27| |bfVar#26| |bfVar#25|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#26|)
                (PROGN (SETQ |bfVar#25| (CAR |bfVar#26|)) NIL))
            (RETURN (NREVERSE |bfVar#27|)))
           (#1='T
            (AND (CONSP |bfVar#25|)
                 (PROGN
                  (SETQ |name| (CAR |bfVar#25|))
                  (SETQ |p| (CDR |bfVar#25|))
                  #1#)
                 (SETQ |bfVar#27|
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
                          |bfVar#27|)))))
          (SETQ |bfVar#26| (CDR |bfVar#26|))))
       NIL |alist| NIL)))))

; kcdePage(htPage) ==
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

(DEFUN |kcdePage| (|htPage|)
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
              ((LAMBDA (|bfVar#29| |bfVar#28| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#28|)
                        (PROGN (SETQ |x| (CAR |bfVar#28|)) NIL))
                    (RETURN (NREVERSE |bfVar#29|)))
                   (#4#
                    (SETQ |bfVar#29|
                            (CONS (CONS (|getConstructorForm| |x|) T)
                                  |bfVar#29|))))
                  (SETQ |bfVar#28| (CDR |bfVar#28|))))
               NIL |domList| NIL))
      (|htpSetProperty| |htPage| '|cAlist| |cAlist|)
      (|htpSetProperty| |htPage| '|thing| "dependent")
      (|dbShowCons| |htPage| '|names|)))))

; kcuPage(htPage) ==
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

(DEFUN |kcuPage| (|htPage|)
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
              ((LAMBDA (|bfVar#31| |bfVar#30| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#30|)
                        (PROGN (SETQ |x| (CAR |bfVar#30|)) NIL))
                    (RETURN (NREVERSE |bfVar#31|)))
                   (#4#
                    (SETQ |bfVar#31|
                            (CONS (CONS (|getConstructorForm| |x|) T)
                                  |bfVar#31|))))
                  (SETQ |bfVar#30| (CDR |bfVar#30|))))
               NIL |domList| NIL))
      (|htpSetProperty| |htPage| '|cAlist| |cAlist|)
      (|htpSetProperty| |htPage| '|thing| "user")
      (|dbShowCons| |htPage| '|names|)))))

; kcnPage(htPage) ==
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
;       domList := SUBLISLIS([domname, :rest(domname)],
;                            ['%, :rest(conform)], domList)
;   cAlist := [[x,:true] for x in domList]
;   htpSetProperty(htPage,'cAlist,cAlist)
;   htpSetProperty(htPage,'thing,'"benefactor")
;   dbShowCons(htPage,'names)

(DEFUN |kcnPage| (|htPage|)
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
                    (CONS '% (CDR |conform|)) |domList|))))
         (SETQ |cAlist|
                 ((LAMBDA (|bfVar#33| |bfVar#32| |x|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#32|)
                           (PROGN (SETQ |x| (CAR |bfVar#32|)) NIL))
                       (RETURN (NREVERSE |bfVar#33|)))
                      (#4# (SETQ |bfVar#33| (CONS (CONS |x| T) |bfVar#33|))))
                     (SETQ |bfVar#32| (CDR |bfVar#32|))))
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
      ((LAMBDA (|bfVar#34| |i|)
         (LOOP
          (COND ((> |i| |nargs|) (RETURN (NREVERSE |bfVar#34|)))
                ('T
                 (SETQ |bfVar#34|
                         (CONS
                          (|htpLabelInputString| |htPage|
                           (INTERN (STRCONC "*" (STRINGIMAGE |i|))))
                          |bfVar#34|))))
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
;               for domain? in rest(get_database(conname, 'COSIG))]
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
              ((LAMBDA (|bfVar#36| |i| |bfVar#35| |var|)
                 (LOOP
                  (COND
                   ((OR (> |i| |nargs|) (ATOM |bfVar#35|)
                        (PROGN (SETQ |var| (CAR |bfVar#35|)) NIL))
                    (RETURN (NREVERSE |bfVar#36|)))
                   (#1='T
                    (SETQ |bfVar#36|
                            (CONS (|htpLabelInputString| |htPage| |var|)
                                  |bfVar#36|))))
                  (SETQ |i| (+ |i| 1))
                  (SETQ |bfVar#35| (CDR |bfVar#35|))))
               NIL 1 |$PatternVariableList| NIL))
      (|htpSetProperty| |htPage| '|inputAreaList| |inputAreaList|)
      (SETQ |conname| (INTERN |name|))
      (SETQ |args|
              ((LAMBDA (|bfVar#39| |bfVar#37| |x| |bfVar#38| |domain?|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#37|)
                        (PROGN (SETQ |x| (CAR |bfVar#37|)) NIL)
                        (ATOM |bfVar#38|)
                        (PROGN (SETQ |domain?| (CAR |bfVar#38|)) NIL))
                    (RETURN (NREVERSE |bfVar#39|)))
                   (#1#
                    (SETQ |bfVar#39|
                            (CONS (OR (|kArgumentCheck| |domain?| |x|) NIL)
                                  |bfVar#39|))))
                  (SETQ |bfVar#37| (CDR |bfVar#37|))
                  (SETQ |bfVar#38| (CDR |bfVar#38|))))
               NIL |inputAreaList| NIL (CDR (|get_database| |conname| 'COSIG))
               NIL))
      (COND
       (((LAMBDA (|bfVar#41| |bfVar#40| |x|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#40|) (PROGN (SETQ |x| (CAR |bfVar#40|)) NIL))
              (RETURN |bfVar#41|))
             (#1#
              (PROGN
               (SETQ |bfVar#41| (NULL |x|))
               (COND (|bfVar#41| (RETURN |bfVar#41|))))))
            (SETQ |bfVar#40| (CDR |bfVar#40|))))
         NIL |args| NIL)
        (COND
         ((< 0
             (SETQ |n|
                     ((LAMBDA (|bfVar#43| |bfVar#42| |x|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#42|)
                               (PROGN (SETQ |x| (CAR |bfVar#42|)) NIL))
                           (RETURN |bfVar#43|))
                          (#1# (AND |x| (SETQ |bfVar#43| (+ |bfVar#43| 1)))))
                         (SETQ |bfVar#42| (CDR |bfVar#42|))))
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
                                 ((LAMBDA (|bfVar#48| |bfVar#47| |x|)
                                    (LOOP
                                     (COND
                                      ((OR (ATOM |bfVar#47|)
                                           (PROGN
                                            (SETQ |x| (CAR |bfVar#47|))
                                            NIL))
                                       (RETURN |bfVar#48|))
                                      (#1#
                                       (SETQ |bfVar#48|
                                               (STRCONC |bfVar#48|
                                                ((LAMBDA
                                                     (|bfVar#44| |bfVar#46|
                                                      |bfVar#45|)
                                                   (LOOP
                                                    (COND
                                                     ((OR (ATOM |bfVar#46|)
                                                          (PROGN
                                                           (SETQ |bfVar#45|
                                                                   (CAR
                                                                    |bfVar#46|))
                                                           NIL))
                                                      (RETURN |bfVar#44|))
                                                     (#1#
                                                      (SETQ |bfVar#44|
                                                              (STRCONC
                                                               |bfVar#44|
                                                               |bfVar#45|))))
                                                    (SETQ |bfVar#46|
                                                            (CDR |bfVar#46|))))
                                                 #2="" (CONS "," |x|) NIL)))))
                                     (SETQ |bfVar#47| (CDR |bfVar#47|))))
                                  #2# (IFCDR |args|) NIL))
                         ((LAMBDA (|bfVar#49| |bfVar#51| |bfVar#50|)
                            (LOOP
                             (COND
                              ((OR (ATOM |bfVar#51|)
                                   (PROGN
                                    (SETQ |bfVar#50| (CAR |bfVar#51|))
                                    NIL))
                               (RETURN |bfVar#49|))
                              (#1#
                               (SETQ |bfVar#49|
                                       (STRCONC |bfVar#49| |bfVar#50|))))
                             (SETQ |bfVar#51| (CDR |bfVar#51|))))
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
;   kind := get_database(op, 'CONSTRUCTORKIND)
;   kind = 'category => form
;   mkEvalable form

(DEFUN |dbMkEvalable| (|form|)
  (PROG (|op| |kind|)
    (RETURN
     (PROGN
      (SETQ |op| (CAR |form|))
      (SETQ |kind| (|get_database| |op| 'CONSTRUCTORKIND))
      (COND ((EQ |kind| '|category|) |form|) ('T (|mkEvalable| |form|)))))))

; kisValidType typeForm ==
;   $ProcessInteractiveValue: fluid := true
;   $noEvalTypeMsg: fluid := true
;   $printTimeIfTrue : local := false
;   $printStorageIfTrue : local := false
;   $BreakMode : local := 'throw_reader
;   CATCH('SPAD_READER, processInteractive(typeForm, nil))
;     is [[h,:.],:t] and member(h,'(Type Category)) => t
;   false

(DEFUN |kisValidType| (|typeForm|)
  (PROG (|$BreakMode| |$printStorageIfTrue| |$printTimeIfTrue| |$noEvalTypeMsg|
         |$ProcessInteractiveValue| |t| |h| |ISTMP#2| |ISTMP#1|)
    (DECLARE
     (SPECIAL |$BreakMode| |$printStorageIfTrue| |$printTimeIfTrue|
      |$noEvalTypeMsg| |$ProcessInteractiveValue|))
    (RETURN
     (PROGN
      (SETQ |$ProcessInteractiveValue| T)
      (SETQ |$noEvalTypeMsg| T)
      (SETQ |$printTimeIfTrue| NIL)
      (SETQ |$printStorageIfTrue| NIL)
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
        |t|)
       (#1# NIL))))))

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
     ((LAMBDA (|bfVar#53| |bfVar#52| |x|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#52|) (PROGN (SETQ |x| (CAR |bfVar#52|)) NIL))
           (RETURN |bfVar#53|))
          ('T
           (AND (|isValidType| |x|)
                (PROGN
                 (SETQ |bfVar#53| |x|)
                 (COND (|bfVar#53| (RETURN |bfVar#53|)))))))
         (SETQ |bfVar#52| (CDR |bfVar#52|))))
      NIL (IFCDR |domain|) NIL))))

; conOpPage1(conform, options) ==
; --constructors    Cname\#\E\sig \args   \abb \comments (C is C, D, P, X)
;   bindingsAlist := options
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
;   for [a,:b] in bindingsAlist repeat htpSetProperty(page,a,b)
;   koPage(page)

(DEFUN |conOpPage1| (|conform| |options|)
  (PROG (|bindingsAlist| |conname| |domname| |line| |parts| |kind| |name|
         |nargs| |xflag| |sig| |args| |abbrev| |comments| |isFile| |constring|
         |capitalKind| |signature| |emString| |heading| |page| |a| |b|)
    (RETURN
     (PROGN
      (SETQ |bindingsAlist| |options|)
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
              ((LAMBDA (|bfVar#55| |bfVar#54|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#55|)
                        (PROGN (SETQ |bfVar#54| (CAR |bfVar#55|)) NIL))
                    (RETURN NIL))
                   (#1#
                    (AND (CONSP |bfVar#54|)
                         (PROGN
                          (SETQ |a| (CAR |bfVar#54|))
                          (SETQ |b| (CDR |bfVar#54|))
                          #1#)
                         (|htpSetProperty| |page| |a| |b|))))
                  (SETQ |bfVar#55| (CDR |bfVar#55|))))
               |bindingsAlist| NIL)
              (|koPage| |page|))))))))

; koPage(htPage) ==
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
;   htpSetProperty(htPage,'heading,heading)
;   conform := htpProperty(htPage,'conform)
;   opAlist := koOps(conform, domname)
;   if selectedOperation := htpProperty(htPage,'selectedOperation) then
;     opAlist := [assoc(selectedOperation,opAlist) or systemError()]
;   dbShowOperationsFromConform(htPage, opAlist)

(DEFUN |koPage| (|htPage|)
  (PROG (|LETTMP#1| |kind| |name| |nargs| |xflag| |sig| |args| |abbrev|
         |comments| |constring| |conname| |u| |ISTMP#1| |domname|
         |headingString| |heading| |conform| |opAlist| |selectedOperation|)
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
         (|htpSetProperty| |htPage| '|heading| |heading|)
         (SETQ |conform| (|htpProperty| |htPage| '|conform|))
         (SETQ |opAlist| (|koOps| |conform| |domname|))
         (COND
          ((SETQ |selectedOperation|
                   (|htpProperty| |htPage| '|selectedOperation|))
           (SETQ |opAlist|
                   (LIST
                    (OR (|assoc| |selectedOperation| |opAlist|)
                        (|systemError|))))))
         (|dbShowOperationsFromConform| |htPage| |opAlist|))))))))

; dbDocTable conform ==
; --assumes $docTableHash bound --see dbExpandOpAlistIfNecessary
;   table := HGET($docTableHash,conform) => table
;   $docTable : local := MAKE_HASHTABLE('EQ)
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
             (SETQ |$docTable| (MAKE_HASHTABLE 'EQ))
             ((LAMBDA (|bfVar#56| |x|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#56|)
                       (PROGN (SETQ |x| (CAR |bfVar#56|)) NIL))
                   (RETURN NIL))
                  (#1# (|dbAddDocTable| |x|)))
                 (SETQ |bfVar#56| (CDR |bfVar#56|))))
              (|originsInOrder| |conform|) NIL)
             (|dbAddDocTable| |conform|)
             (HPUT |$docTableHash| |conform| |$docTable|)
             |$docTable|))))))

; originsInOrder conform ==  --domain = nil or set to live domain
; --from dcCats
;   [con,:argl] := conform
;   get_database(con, 'CONSTRUCTORKIND) = 'category =>
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
       ((EQ (|get_database| |con| 'CONSTRUCTORKIND) '|category|)
        (ASSOCLEFT (|ancestorsOf| |conform| NIL)))
       (#1='T
        (PROGN
         (SETQ |acc| (ASSOCLEFT (|parentsOf| |con|)))
         ((LAMBDA (|bfVar#57| |x|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#57|) (PROGN (SETQ |x| (CAR |bfVar#57|)) NIL))
               (RETURN NIL))
              (#1#
               ((LAMBDA (|bfVar#58| |y|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#58|)
                         (PROGN (SETQ |y| (CAR |bfVar#58|)) NIL))
                     (RETURN NIL))
                    (#1# (SETQ |acc| (|insert| |y| |acc|))))
                   (SETQ |bfVar#58| (CDR |bfVar#58|))))
                (|originsInOrder| |x|) NIL)))
             (SETQ |bfVar#57| (CDR |bfVar#57|))))
          |acc| NIL)
         |acc|)))))))

; dbAddDocTable conform ==
;   conname := opOf conform
;   storedArgs := rest getConstructorForm conname
;   for [op, :alist] in SUBLISLIS(["%", :rest(conform)],
;     ["%", :storedArgs], get_database(opOf(conform), 'DOCUMENTATION))
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
      ((LAMBDA (|bfVar#60| |bfVar#59|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#60|)
                (PROGN (SETQ |bfVar#59| (CAR |bfVar#60|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#59|)
                 (PROGN
                  (SETQ |op| (CAR |bfVar#59|))
                  (SETQ |alist| (CDR |bfVar#59|))
                  #1#)
                 (PROGN
                  (SETQ |op1|
                          (COND ((EQUAL |op| '(|Zero|)) 0)
                                ((EQUAL |op| '(|One|)) 1) (#1# |op|)))
                  ((LAMBDA (|bfVar#62| |bfVar#61|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#62|)
                            (PROGN (SETQ |bfVar#61| (CAR |bfVar#62|)) NIL))
                        (RETURN NIL))
                       (#1#
                        (AND (CONSP |bfVar#61|)
                             (PROGN
                              (SETQ |sig| (CAR |bfVar#61|))
                              (SETQ |ISTMP#1| (CDR |bfVar#61|))
                              (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                                   (PROGN (SETQ |doc| (CAR |ISTMP#1|)) #1#)))
                             (HPUT |$docTable| |op1|
                                   (CONS (CONS |conform| |alist|)
                                         (HGET |$docTable| |op1|))))))
                      (SETQ |bfVar#62| (CDR |bfVar#62|))))
                   |alist| NIL)))))
          (SETQ |bfVar#60| (CDR |bfVar#60|))))
       (SUBLISLIS (CONS '% (CDR |conform|)) (CONS '% |storedArgs|)
        (|get_database| (|opOf| |conform|) 'DOCUMENTATION))
       NIL)))))

; dbGetDocTable(op, $sig, docTable) == main where
; --docTable is [[origin,entry1,...,:code] ...] where
; --  each entry is [sig,doc] and code is NIL or else a topic code for op
;   main == or/[gn(x) for x in HGET(docTable, op)]
;   gn u ==  --u is [origin,entry1,...,:code]
;     $conform := first u              --origin
;     if ATOM $conform then $conform := [$conform]
;     code     := LASTATOM u         --optional topic code
;     comments := or/[p for entry in rest u | p := hn entry] or return nil
;     [$conform,first comments,:code]
;   hn [sig,:doc] ==
;     pred := #$sig = #sig and
;       alteredSig := SUBLISLIS(IFCDR $conform, $FormalMapVariableList, sig)
;       alteredSig = $sig
;     pred =>
;       doc =>
;         doc is ['constant,:r] => r
;         doc
;       '("")
;     false

(DEFUN |dbGetDocTable| (|op| |$sig| |docTable|)
  (DECLARE (SPECIAL |$sig|))
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#64| |bfVar#63| |x|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#63|) (PROGN (SETQ |x| (CAR |bfVar#63|)) NIL))
           (RETURN |bfVar#64|))
          ('T
           (PROGN
            (SETQ |bfVar#64| (|dbGetDocTable,gn| |x|))
            (COND (|bfVar#64| (RETURN |bfVar#64|))))))
         (SETQ |bfVar#63| (CDR |bfVar#63|))))
      NIL (HGET |docTable| |op|) NIL))))
(DEFUN |dbGetDocTable,gn| (|u|)
  (PROG (|code| |p| |comments|)
    (RETURN
     (PROGN
      (SETQ |$conform| (CAR |u|))
      (COND ((ATOM |$conform|) (SETQ |$conform| (LIST |$conform|))))
      (SETQ |code| (LASTATOM |u|))
      (SETQ |comments|
              (OR
               ((LAMBDA (|bfVar#66| |bfVar#65| |entry|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#65|)
                         (PROGN (SETQ |entry| (CAR |bfVar#65|)) NIL))
                     (RETURN |bfVar#66|))
                    ('T
                     (AND (SETQ |p| (|dbGetDocTable,hn| |entry|))
                          (PROGN
                           (SETQ |bfVar#66| |p|)
                           (COND (|bfVar#66| (RETURN |bfVar#66|)))))))
                   (SETQ |bfVar#65| (CDR |bfVar#65|))))
                NIL (CDR |u|) NIL)
               (RETURN NIL)))
      (CONS |$conform| (CONS (CAR |comments|) |code|))))))
(DEFUN |dbGetDocTable,hn| (|bfVar#67|)
  (PROG (|sig| |doc| |alteredSig| |pred| |r|)
    (RETURN
     (PROGN
      (SETQ |sig| (CAR |bfVar#67|))
      (SETQ |doc| (CDR |bfVar#67|))
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
                 (PROGN (SETQ |r| (CDR |doc|)) #1='T))
            |r|)
           (#1# |doc|)))
         (#1# '(""))))
       (#1# NIL))))))

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
;   infovec := dbInfovec(name) or return nil  --exit for categories
;   template := infovec.0
;   null (form := template . 5) => nil
;   dbSubConform(args, kFormatSlotDomain1(devaluate(form), infovec))

(DEFUN |dbAddChainDomain| (|conform|)
  (PROG (|name| |args| |infovec| |template| |form|)
    (RETURN
     (PROGN
      (SETQ |name| (CAR |conform|))
      (SETQ |args| (CDR |conform|))
      (SETQ |infovec| (OR (|dbInfovec| |name|) (RETURN NIL)))
      (SETQ |template| (ELT |infovec| 0))
      (COND ((NULL (SETQ |form| (ELT |template| 5))) NIL)
            ('T
             (|dbSubConform| |args|
              (|kFormatSlotDomain1| (|devaluate| |form|) |infovec|))))))))

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
       ((LAMBDA (|bfVar#69| |bfVar#68| |x|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#68|) (PROGN (SETQ |x| (CAR |bfVar#68|)) NIL))
             (RETURN (NREVERSE |bfVar#69|)))
            (#1#
             (SETQ |bfVar#69| (CONS (|dbSubConform| |args| |x|) |bfVar#69|))))
           (SETQ |bfVar#68| (CDR |bfVar#68|))))
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

; dbShowCons(htPage, key) ==
;   cAlist  := htpProperty(htPage,'cAlist)
;   key = 'filter =>
;     filter := pmTransFilter(dbGetInputString(htPage))
;     filter is ['error,:.] => bcErrorPage filter
;     abbrev? := htpProperty(htPage,'exclusion) = 'abbrs
;     u := [x for x in cAlist | test] where test ==
;       conname := CAAR x
;       subject := (abbrev? => constructor? conname; conname)
;       superMatch?(filter,DOWNCASE STRINGIMAGE subject)
;     null u => emptySearchPage('"constructor", filter, false)
;     htPage := htInitPageNoHeading(htCopyProplist htPage)
;     htpSetProperty(htPage,'cAlist,u)
;     dbShowCons(htPage,htpProperty(htPage,'exclusion))
;   if MEMQ(key,'(exposureOn exposureOff)) then
;     $exposedOnlyIfTrue :=
;       key = 'exposureOn => 'T
;       NIL
;     key := htpProperty(htPage,'exclusion)
;   dbShowCons1(htPage,cAlist,key)

(DEFUN |dbShowCons| (|htPage| |key|)
  (PROG (|cAlist| |filter| |abbrev?| |conname| |subject| |u|)
    (RETURN
     (PROGN
      (SETQ |cAlist| (|htpProperty| |htPage| '|cAlist|))
      (COND
       ((EQ |key| '|filter|)
        (PROGN
         (SETQ |filter| (|pmTransFilter| (|dbGetInputString| |htPage|)))
         (COND
          ((AND (CONSP |filter|) (EQ (CAR |filter|) '|error|))
           (|bcErrorPage| |filter|))
          (#1='T
           (PROGN
            (SETQ |abbrev?|
                    (EQ (|htpProperty| |htPage| '|exclusion|) '|abbrs|))
            (SETQ |u|
                    ((LAMBDA (|bfVar#71| |bfVar#70| |x|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#70|)
                              (PROGN (SETQ |x| (CAR |bfVar#70|)) NIL))
                          (RETURN (NREVERSE |bfVar#71|)))
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
                           (SETQ |bfVar#71| (CONS |x| |bfVar#71|)))))
                        (SETQ |bfVar#70| (CDR |bfVar#70|))))
                     NIL |cAlist| NIL))
            (COND ((NULL |u|) (|emptySearchPage| "constructor" |filter| NIL))
                  (#1#
                   (PROGN
                    (SETQ |htPage|
                            (|htInitPageNoHeading|
                             (|htCopyProplist| |htPage|)))
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
;         bcAbbTable(page, [[con, get_database(con, 'ABBREVIATION)]
;                            for con in conlist])
;     key = 'files => BREAK()
;     key = 'documentation => dbShowConsDoc(page, conlist)
;     if $exposedOnlyIfTrue then
;       cAlist := [x for x in cAlist | isExposedConstructor opOf first x]
;     key = 'conditions => dbShowConditions(page, cAlist, kind)
;     key = 'parameters => bcConTable REMDUP ASSOCLEFT cAlist
;     key = 'kinds => dbShowConsKinds cAlist
;   dbConsExposureMessage()
;   htSayStandard('"\endscroll ")
;   dbPresentCons(page, kind, key)
;   htShowPageNoScroll()

(DEFUN |dbShowCons1| (|htPage| |cAlist| |key|)
  (PROG (|$conformsAreDomains| |u| |page| |proplist| |kind| |a| |kinds|
         |conlist| |item|)
    (DECLARE (SPECIAL |$conformsAreDomains|))
    (RETURN
     (PROGN
      (SETQ |conlist|
              (REMDUP
               ((LAMBDA (|bfVar#73| |bfVar#72| |x|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#72|)
                         (PROGN (SETQ |x| (CAR |bfVar#72|)) NIL))
                     (RETURN (NREVERSE |bfVar#73|)))
                    (#1='T
                     (AND
                      (PROGN
                       (SETQ |item| (CAR |x|))
                       (COND
                        (|$exposedOnlyIfTrue|
                         (|isExposedConstructor| (|opOf| |item|)))
                        (#1# |item|)))
                      (SETQ |bfVar#73| (CONS |item| |bfVar#73|)))))
                   (SETQ |bfVar#72| (CDR |bfVar#72|))))
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
                 ((LAMBDA (|bfVar#75| |bfVar#74| |x|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#74|)
                           (PROGN (SETQ |x| (CAR |bfVar#74|)) NIL))
                       (RETURN (NREVERSE |bfVar#75|)))
                      (#1# (SETQ |bfVar#75| (CONS (|opOf| |x|) |bfVar#75|))))
                     (SETQ |bfVar#74| (CDR |bfVar#74|))))
                  NIL |conlist| NIL))
         (SETQ |kinds|
                 ((LAMBDA (|bfVar#77| |bfVar#76| |x|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#76|)
                           (PROGN (SETQ |x| (CAR |bfVar#76|)) NIL))
                       (RETURN |bfVar#77|))
                      (#1#
                       (SETQ |bfVar#77|
                               (|union| |bfVar#77|
                                (|dbConstructorKind| |x|)))))
                     (SETQ |bfVar#76| (CDR |bfVar#76|))))
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
                 (|bcAbbTable| |page|
                  ((LAMBDA (|bfVar#79| |bfVar#78| |con|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#78|)
                            (PROGN (SETQ |con| (CAR |bfVar#78|)) NIL))
                        (RETURN (NREVERSE |bfVar#79|)))
                       (#1#
                        (SETQ |bfVar#79|
                                (CONS
                                 (LIST |con|
                                       (|get_database| |con| 'ABBREVIATION))
                                 |bfVar#79|))))
                      (SETQ |bfVar#78| (CDR |bfVar#78|))))
                   NIL |conlist| NIL)))
                ((EQ |key| '|files|) (BREAK))
                ((EQ |key| '|documentation|)
                 (|dbShowConsDoc| |page| |conlist|))
                (#1#
                 (PROGN
                  (COND
                   (|$exposedOnlyIfTrue|
                    (SETQ |cAlist|
                            ((LAMBDA (|bfVar#81| |bfVar#80| |x|)
                               (LOOP
                                (COND
                                 ((OR (ATOM |bfVar#80|)
                                      (PROGN (SETQ |x| (CAR |bfVar#80|)) NIL))
                                  (RETURN (NREVERSE |bfVar#81|)))
                                 (#1#
                                  (AND
                                   (|isExposedConstructor| (|opOf| (CAR |x|)))
                                   (SETQ |bfVar#81| (CONS |x| |bfVar#81|)))))
                                (SETQ |bfVar#80| (CDR |bfVar#80|))))
                             NIL |cAlist| NIL))))
                  (COND
                   ((EQ |key| '|conditions|)
                    (|dbShowConditions| |page| |cAlist| |kind|))
                   ((EQ |key| '|parameters|)
                    (|bcConTable| (REMDUP (ASSOCLEFT |cAlist|))))
                   ((EQ |key| '|kinds|) (|dbShowConsKinds| |cAlist|)))))))
         (|dbConsExposureMessage|)
         (|htSayStandard| "\\endscroll ")
         (|dbPresentCons| |page| |kind| |key|)
         (|htShowPageNoScroll|))))))))

; dbConsExposureMessage() ==
;   $atLeastOneUnexposed =>
;       htSay '"\newline{}-------------\newline{}{\em *} = unexposed"

(DEFUN |dbConsExposureMessage| ()
  (PROG ()
    (RETURN
     (COND
      (|$atLeastOneUnexposed|
       (IDENTITY
        (|htSay|
         "\\newline{}-------------\\newline{}{\\em *} = unexposed")))))))

; dbShowConsKindsFilter(htPage,[kind,cAlist]) ==
;   htpSetProperty(htPage,'cAlist,cAlist)
;   dbShowCons(htPage,htpProperty(htPage,'exclusion))

(DEFUN |dbShowConsKindsFilter| (|htPage| |bfVar#82|)
  (PROG (|kind| |cAlist|)
    (RETURN
     (PROGN
      (SETQ |kind| (CAR |bfVar#82|))
      (SETQ |cAlist| (CADR |bfVar#82|))
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
        ((LAMBDA (|bfVar#83| |x|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#83|) (PROGN (SETQ |x| (CAR |bfVar#83|)) NIL))
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
            (SETQ |bfVar#83| (CDR |bfVar#83|))))
         (REMDUP |conlist|) NIL)))))))

; dbShowConsDoc1(htPage,conform,indexOrNil) ==
;   [conname,:conargs] := conform
;   MEMQ(conname,$Primitives) =>
;       [["constructor", ["NIL", doc]], :.] := GET(conname, 'documentation)
;       sig :=
;          conname = 'Enumeration =>
;              '((CATEGORY domain) (Symbol) (Symbol))
;          '((CATEGORY domain) (SetCategory) (SetCategory))
;       displayDomainOp(htPage, '"constructor", conform, conname, sig, true,
;                       doc, indexOrNil, 'dbSelectCon, nil, nil)
;   exposeFlag := isExposedConstructor conname
;   doc := [getConstructorDocumentation conname]
;   signature := getConstructorSignature conname
;   sig :=
;     get_database(conname, 'CONSTRUCTORKIND) = 'category =>
;       SUBLISLIS(conargs,$TriangleVariableList,signature)
;     sublisFormal(conargs,signature)
;   displayDomainOp(htPage,'"constructor",conform,conname,sig,true,doc,indexOrNil,'dbSelectCon,null exposeFlag,nil)

(DEFUN |dbShowConsDoc1| (|htPage| |conform| |indexOrNil|)
  (PROG (|conname| |conargs| |LETTMP#1| |doc| |sig| |exposeFlag| |signature|)
    (RETURN
     (PROGN
      (SETQ |conname| (CAR |conform|))
      (SETQ |conargs| (CDR |conform|))
      (COND
       ((MEMQ |conname| |$Primitives|)
        (PROGN
         (SETQ |LETTMP#1| (GET |conname| '|documentation|))
         (SETQ |doc| (CAR (CDADAR |LETTMP#1|)))
         (SETQ |sig|
                 (COND
                  ((EQ |conname| '|Enumeration|)
                   '((CATEGORY |domain|) (|Symbol|) (|Symbol|)))
                  (#1='T
                   '((CATEGORY |domain|) (|SetCategory|) (|SetCategory|)))))
         (|displayDomainOp| |htPage| "constructor" |conform| |conname| |sig| T
          |doc| |indexOrNil| '|dbSelectCon| NIL NIL)))
       (#1#
        (PROGN
         (SETQ |exposeFlag| (|isExposedConstructor| |conname|))
         (SETQ |doc| (LIST (|getConstructorDocumentation| |conname|)))
         (SETQ |signature| (|getConstructorSignature| |conname|))
         (SETQ |sig|
                 (COND
                  ((EQ (|get_database| |conname| 'CONSTRUCTORKIND) '|category|)
                   (SUBLISLIS |conargs| |$TriangleVariableList| |signature|))
                  (#1# (|sublisFormal| |conargs| |signature|))))
         (|displayDomainOp| |htPage| "constructor" |conform| |conname| |sig| T
          |doc| |indexOrNil| '|dbSelectCon| (NULL |exposeFlag|) NIL))))))))

; getConstructorDocumentation conname ==
;   LASSOC('constructor, get_database(conname, 'DOCUMENTATION))
;     is [[nil,line,:.],:.] and line or '""

(DEFUN |getConstructorDocumentation| (|conname|)
  (PROG (|ISTMP#1| |ISTMP#2| |ISTMP#3| |line|)
    (RETURN
     (OR
      (AND
       (PROGN
        (SETQ |ISTMP#1|
                (LASSOC '|constructor|
                 (|get_database| |conname| 'DOCUMENTATION)))
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

; dbSelectCon(htPage, index) ==
;   conPage opOf first (htpProperty(htPage, 'cAlist)) . index

(DEFUN |dbSelectCon| (|htPage| |index|)
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
;   bcConPredTable(consNoPred,conname)
;   htSayHrule()
;   dbSayItems(#consPred,singular,plural,'" conditional")
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
      (|bcConPredTable| |consNoPred| |conname|)
      (|htSayHrule|)
      (|dbSayItems| (LENGTH |consPred|) |singular| |plural| " conditional")
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
              ((LAMBDA (|bfVar#85| |bfVar#84| |line|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#84|)
                        (PROGN (SETQ |line| (CAR |bfVar#84|)) NIL))
                    (RETURN (NREVERSE |bfVar#85|)))
                   ('T
                    (SETQ |bfVar#85|
                            (CONS
                             (CONS
                              (|getConstructorForm|
                               (|intern| (|dbName| |line|)))
                              T)
                             |bfVar#85|))))
                  (SETQ |bfVar#84| (CDR |bfVar#84|))))
               NIL |lines| NIL))
      (|dbShowCons1| NIL (|listSort| #'GLESSEQP |cAlist|) '|names|)))))

; isAsharpFileName? con == false

(DEFUN |isAsharpFileName?| (|con|) (PROG () (RETURN NIL)))

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
;   dbShowOp1(page, opAlist, 'names)

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
      (|dbShowOp1| |page| |opAlist| '|names|)))))

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
        ((LAMBDA (|bfVar#87| |bfVar#86|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#87|)
                  (PROGN (SETQ |bfVar#86| (CAR |bfVar#87|)) NIL))
              (RETURN NIL))
             (#1#
              (AND (CONSP |bfVar#86|)
                   (PROGN
                    (SETQ |op| (CAR |bfVar#86|))
                    (SETQ |u| (CDR |bfVar#86|))
                    #1#)
                   ((LAMBDA (|bfVar#88| |pair|)
                      (LOOP
                       (COND
                        ((OR (ATOM |bfVar#88|)
                             (PROGN (SETQ |pair| (CAR |bfVar#88|)) NIL))
                         (RETURN NIL))
                        (#1#
                         (PROGN
                          (SETQ |sig| (CAR |pair|))
                          (SETQ |comments| (CADR |pair|))
                          (RPLACD |pair| (LIST 'T |conform| 'T |comments|)))))
                       (SETQ |bfVar#88| (CDR |bfVar#88|))))
                    |u| NIL))))
            (SETQ |bfVar#87| (CDR |bfVar#87|))))
         |opAlist| NIL)
        |opAlist|))))))

; PUT('Record,'documentation,'(
;   (constructor (NIL NIL))
;   (_=  (((Boolean) _% _%)
;    "\spad{r = s} tests for equality of two records \spad{r} and \spad{s}"))
;   (coerce (((OutputForm) _%)
;    "\spad{coerce(r)} returns an representation of \spad{r} as an output form")
;          ((_% (List (Any)))
;    "\spad{coerce(u)}, where \spad{u} is the list \spad{[x,y]} for \spad{x} of type \spad{A} and \spad{y} of type \spad{B}, returns the record \spad{[a:x,b:y]}"))
;   (construct ((_% A B)
;    "\spad{construct(x, y)} returns the record \spad{[a:x,b:y]}"))
;   (elt ((A % "a")
;    "\spad{r . a} returns the value stored in record \spad{r} under selector \spad{a}.")
;       ((B % "b")
;    "\spad{r . b} returns the value stored in record \spad{r} under selector \spad{b}."))
;   (setelt_! ((A % "a" A)
;    "\spad{r . a := x} destructively replaces the value stored in record \spad{r} under selector \spad{a} by the value of \spad{x}. Error: if \spad{r} has not been previously assigned a value.")
;          ((B % "b" B)
;    "\spad{r . b := y} destructively replaces the value stored in record \spad{r} under selector \spad{b} by the value of \spad{y}. Error: if \spad{r} has not been previously assigned a value."))
;    ))

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (PROG ()
    (RETURN
     (PUT '|Record| '|documentation|
      '((|constructor| (NIL NIL))
        (=
         (((|Boolean|) % %)
          "\\spad{r = s} tests for equality of two records \\spad{r} and \\spad{s}"))
        (|coerce|
         (((|OutputForm|) %)
          "\\spad{coerce(r)} returns an representation of \\spad{r} as an output form")
         ((% (|List| (|Any|)))
          "\\spad{coerce(u)}, where \\spad{u} is the list \\spad{[x,y]} for \\spad{x} of type \\spad{A} and \\spad{y} of type \\spad{B}, returns the record \\spad{[a:x,b:y]}"))
        (|construct|
         ((% A B)
          "\\spad{construct(x, y)} returns the record \\spad{[a:x,b:y]}"))
        (|elt|
         ((A % "a")
          "\\spad{r . a} returns the value stored in record \\spad{r} under selector \\spad{a}.")
         ((B % "b")
          "\\spad{r . b} returns the value stored in record \\spad{r} under selector \\spad{b}."))
        (|setelt!|
         ((A % "a" A)
          "\\spad{r . a := x} destructively replaces the value stored in record \\spad{r} under selector \\spad{a} by the value of \\spad{x}. Error: if \\spad{r} has not been previously assigned a value.")
         ((B % "b" B)
          "\\spad{r . b := y} destructively replaces the value stored in record \\spad{r} under selector \\spad{b} by the value of \\spad{y}. Error: if \\spad{r} has not been previously assigned a value.")))))))

; PUT('UntaggedUnion, 'documentation, '(
;   (constructor (NIL NIL))
;   (_=  (((Boolean) % %)
;     "\spad{u = v} tests if two objects of the union are equal, that is, u and v are hold objects of same branch which are equal."))
;   (case (((Boolean) % "A")
;     "\spad{u case A} tests if \spad{u} is of the type \spad{A} branch of the union.")
;         (((Boolean) % "B")
;     "\spad{u case B} tests if \spad{u} is of the \spad{B} branch of the union."))
;   (coerce ((A %)
;     "\spad{coerce(u)} returns \spad{x} of type \spad{A} if \spad{x} is of the \spad{A} branch of the union. Error: if \spad{u} is of the \spad{B} branch of the union.")
;           ((B %)
;     "\spad{coerce(u)} returns \spad{x} of type \spad{B} if \spad{x} is of the \spad{B} branch of the union. Error: if \spad{u} is of the \spad{A} branch of the union.")
;           ((% A)
;     "\spad{coerce(x)}, where \spad{x} has type \spad{A}, returns \spad{x} as a union type.")
;           ((% B)
;     "\spad{coerce(y)}, where \spad{y} has type \spad{B}, returns \spad{y} as a union type."))
;   ))

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (PROG ()
    (RETURN
     (PUT '|UntaggedUnion| '|documentation|
      '((|constructor| (NIL NIL))
        (=
         (((|Boolean|) % %)
          "\\spad{u = v} tests if two objects of the union are equal, that is, u and v are hold objects of same branch which are equal."))
        (CASE
            (((|Boolean|) % "A")
             "\\spad{u case A} tests if \\spad{u} is of the type \\spad{A} branch of the union.")
          (((|Boolean|) % "B")
           "\\spad{u case B} tests if \\spad{u} is of the \\spad{B} branch of the union."))
        (|coerce|
         ((A %)
          "\\spad{coerce(u)} returns \\spad{x} of type \\spad{A} if \\spad{x} is of the \\spad{A} branch of the union. Error: if \\spad{u} is of the \\spad{B} branch of the union.")
         ((B %)
          "\\spad{coerce(u)} returns \\spad{x} of type \\spad{B} if \\spad{x} is of the \\spad{B} branch of the union. Error: if \\spad{u} is of the \\spad{A} branch of the union.")
         ((% A)
          "\\spad{coerce(x)}, where \\spad{x} has type \\spad{A}, returns \\spad{x} as a union type.")
         ((% B)
          "\\spad{coerce(y)}, where \\spad{y} has type \\spad{B}, returns \\spad{y} as a union type.")))))))

; PUT('Union, 'documentation, '(
;   (constructor (NIL NIL))
;   (_=  (((Boolean) % %)
;     "\spad{u = v} tests if two objects of the union are equal, that is, \spad{u} and \spad{v} are objects of same branch which are equal."))
;   (case (((Boolean) % "A")
;     "\spad{u case a} tests if \spad{u} is of branch \spad{a} of the union.")
;                 (((Boolean) % "B")
;     "\spad{u case b} tests if \spad{u} is of branch \spad{b} of the union."))
;   (coerce ((A %)
;     "\spad{coerce(u)} returns \spad{x} of type \spad{A} if \spad{x} is of branch \spad{a} of the union. Error: if \spad{u} is of branch \spad{b} of the union.")
;           ((B %)
;     "\spad{coerce(u)} returns \spad{x} of type \spad{B} if \spad{x} is of branch \spad{b} branch of the union. Error: if \spad{u} is of the \spad{a} branch of the union.")
;           ((% A)
;     "\spad{coerce(x)}, where \spad{x} has type \spad{A}, returns \spad{x} as a union type.")
;           ((% B)
;     "\spad{coerce(y)}, where \spad{y} has type \spad{B}, returns \spad{y} as a union type."))
;   ))

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (PROG ()
    (RETURN
     (PUT '|Union| '|documentation|
      '((|constructor| (NIL NIL))
        (=
         (((|Boolean|) % %)
          "\\spad{u = v} tests if two objects of the union are equal, that is, \\spad{u} and \\spad{v} are objects of same branch which are equal."))
        (CASE
            (((|Boolean|) % "A")
             "\\spad{u case a} tests if \\spad{u} is of branch \\spad{a} of the union.")
          (((|Boolean|) % "B")
           "\\spad{u case b} tests if \\spad{u} is of branch \\spad{b} of the union."))
        (|coerce|
         ((A %)
          "\\spad{coerce(u)} returns \\spad{x} of type \\spad{A} if \\spad{x} is of branch \\spad{a} of the union. Error: if \\spad{u} is of branch \\spad{b} of the union.")
         ((B %)
          "\\spad{coerce(u)} returns \\spad{x} of type \\spad{B} if \\spad{x} is of branch \\spad{b} branch of the union. Error: if \\spad{u} is of the \\spad{a} branch of the union.")
         ((% A)
          "\\spad{coerce(x)}, where \\spad{x} has type \\spad{A}, returns \\spad{x} as a union type.")
         ((% B)
          "\\spad{coerce(y)}, where \\spad{y} has type \\spad{B}, returns \\spad{y} as a union type.")))))))

; PUT('Mapping, 'documentation, '(
;   (constructor (NIL NIL))
;   (_=  (((Boolean) % %)
;     "\spad{u = v} tests if mapping objects are equal."))
;    ))

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (PROG ()
    (RETURN
     (PUT '|Mapping| '|documentation|
      '((|constructor| (NIL NIL))
        (=
         (((|Boolean|) % %)
          "\\spad{u = v} tests if mapping objects are equal.")))))))

; PUT('Enumeration, 'documentation, '(
;         (constructor (NIL NIL))
;   (_= (((Boolean) _% _%)
;     "\spad{e = f} tests for equality of two enumerations \spad{e} and \spad{f}"))
;   (_^_= (((Boolean) _% _%)
;     "\spad{e ~= f} tests that two enumerations \spad{e} and \spad{f} are nont equal"))
;   (coerce (((OutputForm) _%)
;      "\spad{coerce(e)} returns a representation of enumeration \spad{r} as an output form")
;           ((_% (Symbol))
;      "\spad{coerce(s)} converts a symbol \spad{s} into an enumeration which has \spad{s} as a member symbol"))
;   ))

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (PROG ()
    (RETURN
     (PUT '|Enumeration| '|documentation|
      '((|constructor| (NIL NIL))
        (=
         (((|Boolean|) % %)
          "\\spad{e = f} tests for equality of two enumerations \\spad{e} and \\spad{f}"))
        (^=
         (((|Boolean|) % %)
          "\\spad{e ~= f} tests that two enumerations \\spad{e} and \\spad{f} are nont equal"))
        (|coerce|
         (((|OutputForm|) %)
          "\\spad{coerce(e)} returns a representation of enumeration \\spad{r} as an output form")
         ((% (|Symbol|))
          "\\spad{coerce(s)} converts a symbol \\spad{s} into an enumeration which has \\spad{s} as a member symbol")))))))
