 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; kciPage(htPage,junk) ==
;   --info alist must have NEW format with [op,:sig] in its CAARs
;   which:= '"operation"
;   htpSetProperty(htPage,'which,which)
;   domname := htpProperty(htPage,'domname)
;   conform := htpProperty(htPage,'conform)
;   heading := ['"Capsule Cross Reference for ",:htpProperty(htPage,'heading)]
;   page := htInitPage(heading,htCopyProplist htPage)
;   conname := opOf conform
;   htpSetProperty(page,'infoAlist,infoAlist := getInfoAlist conname)
;   dbGetExpandedOpAlist page      --expand opAlist "in place"
;   opAlist := kciReduceOpAlist(htpProperty(page,'opAlist),infoAlist)
;   dbShowOperationsFromConform(page,which,opAlist)
 
(DEFUN |kciPage| (|htPage| |junk|)
  (PROG (|which| |domname| |conform| |heading| |page| |conname| |infoAlist|
         |opAlist|)
    (RETURN
     (PROGN
      (SETQ |which| "operation")
      (|htpSetProperty| |htPage| '|which| |which|)
      (SETQ |domname| (|htpProperty| |htPage| '|domname|))
      (SETQ |conform| (|htpProperty| |htPage| '|conform|))
      (SETQ |heading|
              (CONS "Capsule Cross Reference for "
                    (|htpProperty| |htPage| '|heading|)))
      (SETQ |page| (|htInitPage| |heading| (|htCopyProplist| |htPage|)))
      (SETQ |conname| (|opOf| |conform|))
      (|htpSetProperty| |page| '|infoAlist|
       (SETQ |infoAlist| (|getInfoAlist| |conname|)))
      (|dbGetExpandedOpAlist| |page|)
      (SETQ |opAlist|
              (|kciReduceOpAlist| (|htpProperty| |page| '|opAlist|)
               |infoAlist|))
      (|dbShowOperationsFromConform| |page| |which| |opAlist|)))))
 
; kciReduceOpAlist(opAlist,infoAlist) ==
; --count opAlist
;   res := [pair for [op,:items] in opAlist | pair] where pair ==
;     u := LASSOC(op,infoAlist) =>
;       y := [x for x in items
;             | x is [sig,:.] and or/[sig = sig1 for [sig1,:.] in u]] => [op,:y]
;       nil
;     nil
;   res
 
(DEFUN |kciReduceOpAlist| (|opAlist| |infoAlist|)
  (PROG (|op| |items| |u| |sig| |sig1| |y| |res|)
    (RETURN
     (PROGN
      (SETQ |res|
              ((LAMBDA (|bfVar#3| |bfVar#2| |bfVar#1|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#2|)
                        (PROGN (SETQ |bfVar#1| (CAR |bfVar#2|)) NIL))
                    (RETURN (NREVERSE |bfVar#3|)))
                   (#1='T
                    (AND (CONSP |bfVar#1|)
                         (PROGN
                          (SETQ |op| (CAR |bfVar#1|))
                          (SETQ |items| (CDR |bfVar#1|))
                          #1#)
                         #2=(COND
                             ((SETQ |u| (LASSOC |op| |infoAlist|))
                              (COND
                               ((SETQ |y|
                                        ((LAMBDA (|bfVar#8| |bfVar#4| |x|)
                                           (LOOP
                                            (COND
                                             ((OR (ATOM |bfVar#4|)
                                                  (PROGN
                                                   (SETQ |x| (CAR |bfVar#4|))
                                                   NIL))
                                              (RETURN (NREVERSE |bfVar#8|)))
                                             (#1#
                                              (AND (CONSP |x|)
                                                   (PROGN
                                                    (SETQ |sig| (CAR |x|))
                                                    #1#)
                                                   ((LAMBDA
                                                        (|bfVar#7| |bfVar#6|
                                                         |bfVar#5|)
                                                      (LOOP
                                                       (COND
                                                        ((OR (ATOM |bfVar#6|)
                                                             (PROGN
                                                              (SETQ |bfVar#5|
                                                                      (CAR
                                                                       |bfVar#6|))
                                                              NIL))
                                                         (RETURN |bfVar#7|))
                                                        (#1#
                                                         (AND (CONSP |bfVar#5|)
                                                              (PROGN
                                                               (SETQ |sig1|
                                                                       (CAR
                                                                        |bfVar#5|))
                                                               #1#)
                                                              (PROGN
                                                               (SETQ |bfVar#7|
                                                                       (EQUAL
                                                                        |sig|
                                                                        |sig1|))
                                                               (COND
                                                                (|bfVar#7|
                                                                 (RETURN
                                                                  |bfVar#7|)))))))
                                                       (SETQ |bfVar#6|
                                                               (CDR
                                                                |bfVar#6|))))
                                                    NIL |u| NIL)
                                                   (SETQ |bfVar#8|
                                                           (CONS |x|
                                                                 |bfVar#8|)))))
                                            (SETQ |bfVar#4| (CDR |bfVar#4|))))
                                         NIL |items| NIL))
                                (CONS |op| |y|))
                               (#1# NIL)))
                             (#1# NIL))
                         (SETQ |bfVar#3| (CONS #2# |bfVar#3|)))))
                  (SETQ |bfVar#2| (CDR |bfVar#2|))))
               NIL |opAlist| NIL))
      |res|))))
 
; displayInfoOp(htPage,infoAlist,op,sig) ==
;   (sigAlist := LASSOC(op,infoAlist)) and (itemlist := LASSOC(sig,sigAlist)) =>
;      dbShowInfoOp(htPage,op,sig,itemlist)
;   nil
 
(DEFUN |displayInfoOp| (|htPage| |infoAlist| |op| |sig|)
  (PROG (|sigAlist| |itemlist|)
    (RETURN
     (COND
      ((AND (SETQ |sigAlist| (LASSOC |op| |infoAlist|))
            (SETQ |itemlist| (LASSOC |sig| |sigAlist|)))
       (|dbShowInfoOp| |htPage| |op| |sig| |itemlist|))
      ('T NIL)))))
 
; dbShowInfoOp(htPage,op,sig,alist) ==
;   heading := htpProperty(htPage,'heading)
;   domname := htpProperty(htPage,'domname)
;   conform := htpProperty(htPage,'conform)
;   opAlist := htpProperty(htPage,'opAlist)
;   conname := opOf conform
;   kind     := GETDATABASE(conname,'CONSTRUCTORKIND)
;   honestConform :=
;     kind = 'category =>
;       [INTERN STRCONC(PNAME conname, '"&"), "$", :rest conform]
;     conform
;   faTypes  := CDDAR GETDATABASE(conname,'CONSTRUCTORMODEMAP)
; 
;   conArgTypes :=
;     SUBLISLIS(IFCDR conform,TAKE(#faTypes,$FormalMapVariableList),faTypes)
;   conform := htpProperty(htPage,'conform)
;   conname := opOf conform
; --argTypes := REVERSE ASSOCRIGHT LASSOC('arguments,alist)
; --sig := or/[sig for [sig,:.] in LASSOC(op,opAlist) | rest sig = argTypes]
;   ops := escapeSpecialChars STRINGIMAGE zeroOneConvert op
;   oppart := ['"{\em ", ops, '"}"]
;   head :=
;     sig => [:oppart,'": ",:dbConformGen dbInfoSig sig]
;     oppart
;   heading := [:head,'" from {\sf ",form2HtString conform,'"}"]
;   for u in alist repeat
;     [x,:y] := u
;     x = 'locals => locals := y
;     x = 'arguments => arguments := y
;     fromAlist := [[x,:zeroOneConvertAlist y], :fromAlist]
;   fromAlist :=
;     cons := args := nil
;     for (p := [x,:y]) in fromAlist repeat
;       x = $ => dollar := [[honestConform,:y]]
;       x = 'Rep => rep := [['Rep,:y]]
;       IDENTP x => args := [dbInfoFindCat(conform,conArgTypes,p), :args]
;       cons := [dbInfoTran(x,y), :cons]
;     [:mySort args, :dollar, :rep, :mySort cons]
;   sigAlist  := LASSOC(op,opAlist)
;   item := or/[x for x in sigAlist | x is [sig1,:.] and sig1 = sig] or
;     systemError '"cannot find signature"
;   --item is [sig,pred,origin,exposeFlag,comments]
;   [sig,pred,origin,exposeFlag,doc] := item
;   htpSetProperty(htPage,'fromAlist,fromAlist)
;   htSayHline()
;   htSay('"\center{Cross Reference for definition of {\em ",ops,'"}}\beginmenu ")
; --  if arguments then
; --    htSay '"\item\menuitemstyle{}{\em arguments:}\newline"
; --    dbShowInfoList(arguments,0,false)
;   if locals then
;     htSay '"\item\menuitemstyle{}{\em local variables:}\newline"
;     dbShowInfoList(locals,8192,false)
;   bincount := 2
;   for [con,:fns] in fromAlist repeat
;     htSay '"\item"
;     if IDENTP con then
;         htSay '"\menuitemstyle{} {\em calls to} "
;         if con ~= 'Rep then htSay '"{\em argument} "
;         htSay con
;         if and/[fn is ['origin,orig,.] and
;           (null origin and (origin := orig) or origin = orig) for fn in fns] then
;             htSay '" {\em of type} "
;             bcConform orig
;         buttonForOp := false
;     else
;       htMakePage [['bcLinks,['"\menuitemstyle{}",'"",'dbInfoChoose,bincount]]]
;       htSay '"{\em calls to} "
;       bcConform con
;       buttonForOp := true
;     htSay('":\newline ")
;     dbShowInfoList(fns, bincount * 8192,buttonForOp)
;     bincount := bincount + 1
;   htSay '"\endmenu "
 
(DEFUN |dbShowInfoOp| (|htPage| |op| |sig| |alist|)
  (PROG (|heading| |domname| |conform| |opAlist| |conname| |kind|
         |honestConform| |faTypes| |conArgTypes| |ops| |oppart| |head| |x| |y|
         |locals| |arguments| |fromAlist| |args| CONS |dollar| |rep| |sigAlist|
         |sig1| |item| |pred| |origin| |exposeFlag| |doc| |bincount| |con|
         |fns| |ISTMP#1| |orig| |ISTMP#2| |buttonForOp|)
    (RETURN
     (PROGN
      (SETQ |heading| (|htpProperty| |htPage| '|heading|))
      (SETQ |domname| (|htpProperty| |htPage| '|domname|))
      (SETQ |conform| (|htpProperty| |htPage| '|conform|))
      (SETQ |opAlist| (|htpProperty| |htPage| '|opAlist|))
      (SETQ |conname| (|opOf| |conform|))
      (SETQ |kind| (GETDATABASE |conname| 'CONSTRUCTORKIND))
      (SETQ |honestConform|
              (COND
               ((EQ |kind| '|category|)
                (CONS (INTERN (STRCONC (PNAME |conname|) "&"))
                      (CONS '$ (CDR |conform|))))
               (#1='T |conform|)))
      (SETQ |faTypes| (CDDAR (GETDATABASE |conname| 'CONSTRUCTORMODEMAP)))
      (SETQ |conArgTypes|
              (SUBLISLIS (IFCDR |conform|)
               (TAKE (LENGTH |faTypes|) |$FormalMapVariableList|) |faTypes|))
      (SETQ |conform| (|htpProperty| |htPage| '|conform|))
      (SETQ |conname| (|opOf| |conform|))
      (SETQ |ops| (|escapeSpecialChars| (STRINGIMAGE (|zeroOneConvert| |op|))))
      (SETQ |oppart| (LIST "{\\em " |ops| "}"))
      (SETQ |head|
              (COND
               (|sig|
                (APPEND |oppart|
                        (CONS ": " (|dbConformGen| (|dbInfoSig| |sig|)))))
               (#1# |oppart|)))
      (SETQ |heading|
              (APPEND |head|
                      (CONS " from {\\sf "
                            (CONS (|form2HtString| |conform|)
                                  (CONS "}" NIL)))))
      ((LAMBDA (|bfVar#9| |u|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#9|) (PROGN (SETQ |u| (CAR |bfVar#9|)) NIL))
            (RETURN NIL))
           (#1#
            (PROGN
             (SETQ |x| (CAR |u|))
             (SETQ |y| (CDR |u|))
             (COND ((EQ |x| '|locals|) (SETQ |locals| |y|))
                   ((EQ |x| '|arguments|) (SETQ |arguments| |y|))
                   (#1#
                    (SETQ |fromAlist|
                            (CONS (CONS |x| (|zeroOneConvertAlist| |y|))
                                  |fromAlist|)))))))
          (SETQ |bfVar#9| (CDR |bfVar#9|))))
       |alist| NIL)
      (SETQ |fromAlist|
              (PROGN
               (SETQ CONS (SETQ |args| NIL))
               ((LAMBDA (|bfVar#10| |p|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#10|)
                         (PROGN (SETQ |p| (CAR |bfVar#10|)) NIL))
                     (RETURN NIL))
                    (#1#
                     (AND (CONSP |p|)
                          (PROGN (SETQ |x| (CAR |p|)) (SETQ |y| (CDR |p|)) #1#)
                          (COND
                           ((EQUAL |x| $)
                            (SETQ |dollar| (LIST (CONS |honestConform| |y|))))
                           ((EQ |x| '|Rep|)
                            (SETQ |rep| (LIST (CONS '|Rep| |y|))))
                           ((IDENTP |x|)
                            (SETQ |args|
                                    (CONS
                                     (|dbInfoFindCat| |conform| |conArgTypes|
                                      |p|)
                                     |args|)))
                           (#1#
                            (SETQ CONS (CONS (|dbInfoTran| |x| |y|) CONS)))))))
                   (SETQ |bfVar#10| (CDR |bfVar#10|))))
                |fromAlist| NIL)
               (APPEND (|mySort| |args|)
                       (APPEND |dollar| (APPEND |rep| (|mySort| CONS))))))
      (SETQ |sigAlist| (LASSOC |op| |opAlist|))
      (SETQ |item|
              (OR
               ((LAMBDA (|bfVar#12| |bfVar#11| |x|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#11|)
                         (PROGN (SETQ |x| (CAR |bfVar#11|)) NIL))
                     (RETURN |bfVar#12|))
                    (#1#
                     (AND (CONSP |x|) (PROGN (SETQ |sig1| (CAR |x|)) #1#)
                          (EQUAL |sig1| |sig|)
                          (PROGN
                           (SETQ |bfVar#12| |x|)
                           (COND (|bfVar#12| (RETURN |bfVar#12|)))))))
                   (SETQ |bfVar#11| (CDR |bfVar#11|))))
                NIL |sigAlist| NIL)
               (|systemError| "cannot find signature")))
      (SETQ |sig| (CAR |item|))
      (SETQ |pred| (CADR . #2=(|item|)))
      (SETQ |origin| (CADDR . #2#))
      (SETQ |exposeFlag| (CADDDR . #2#))
      (SETQ |doc| (CAR (CDDDDR . #2#)))
      (|htpSetProperty| |htPage| '|fromAlist| |fromAlist|)
      (|htSayHline|)
      (|htSay| "\\center{Cross Reference for definition of {\\em " |ops|
       "}}\\beginmenu ")
      (COND
       (|locals|
        (|htSay| "\\item\\menuitemstyle{}{\\em local variables:}\\newline")
        (|dbShowInfoList| |locals| 8192 NIL)))
      (SETQ |bincount| 2)
      ((LAMBDA (|bfVar#14| |bfVar#13|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#14|)
                (PROGN (SETQ |bfVar#13| (CAR |bfVar#14|)) NIL))
            (RETURN NIL))
           (#1#
            (AND (CONSP |bfVar#13|)
                 (PROGN
                  (SETQ |con| (CAR |bfVar#13|))
                  (SETQ |fns| (CDR |bfVar#13|))
                  #1#)
                 (PROGN
                  (|htSay| "\\item")
                  (COND
                   ((IDENTP |con|)
                    (|htSay| "\\menuitemstyle{} {\\em calls to} ")
                    (COND
                     ((NOT (EQ |con| '|Rep|)) (|htSay| "{\\em argument} ")))
                    (|htSay| |con|)
                    (COND
                     (((LAMBDA (|bfVar#16| |bfVar#15| |fn|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#15|)
                                (PROGN (SETQ |fn| (CAR |bfVar#15|)) NIL))
                            (RETURN |bfVar#16|))
                           (#1#
                            (PROGN
                             (SETQ |bfVar#16|
                                     (AND (CONSP |fn|)
                                          (EQ (CAR |fn|) '|origin|)
                                          (PROGN
                                           (SETQ |ISTMP#1| (CDR |fn|))
                                           (AND (CONSP |ISTMP#1|)
                                                (PROGN
                                                 (SETQ |orig| (CAR |ISTMP#1|))
                                                 (SETQ |ISTMP#2|
                                                         (CDR |ISTMP#1|))
                                                 (AND (CONSP |ISTMP#2|)
                                                      (EQ (CDR |ISTMP#2|)
                                                          NIL)))))
                                          (OR
                                           (AND (NULL |origin|)
                                                (SETQ |origin| |orig|))
                                           (EQUAL |origin| |orig|))))
                             (COND ((NOT |bfVar#16|) (RETURN NIL))))))
                          (SETQ |bfVar#15| (CDR |bfVar#15|))))
                       T |fns| NIL)
                      (|htSay| " {\\em of type} ") (|bcConform| |orig|)))
                    (SETQ |buttonForOp| NIL))
                   (#1#
                    (|htMakePage|
                     (LIST
                      (LIST '|bcLinks|
                            (LIST "\\menuitemstyle{}" "" '|dbInfoChoose|
                                  |bincount|))))
                    (|htSay| "{\\em calls to} ") (|bcConform| |con|)
                    (SETQ |buttonForOp| T)))
                  (|htSay| ":\\newline ")
                  (|dbShowInfoList| |fns| (* |bincount| 8192) |buttonForOp|)
                  (SETQ |bincount| (+ |bincount| 1))))))
          (SETQ |bfVar#14| (CDR |bfVar#14|))))
       |fromAlist| NIL)
      (|htSay| "\\endmenu ")))))
 
; dbShowInfoList(dataItems,count,buttonForOp?) ==
; --dataItems are [op,:sig]
;   single? := null rest dataItems
;   htSay '"\table{"
;   for item in dataItems repeat
;     [op,:sig] :=
;        item is ['origin,.,s] =>
;          buttonForOp? := true
;          s
;        item
;     ops := escapeSpecialChars STRINGIMAGE op
;     htSay '"{"
;     if count < 16384 or not buttonForOp? then
;       htSay [ops,'": "]
;       atom sig => bcConform sig
;       bcConform dbInfoSig sig
;     else
;       htMakePage [['bcLinks,[ops,'"",'dbInfoChooseSingle,count]]]
;       htSay '": "
;       if atom sig then htSay sig else
;         bcConform dbInfoSig sig
;     htSay '"}"
;     count := count + 1
;   htSay '"} "
;   count
 
(DEFUN |dbShowInfoList| (|dataItems| |count| |buttonForOp?|)
  (PROG (|single?| |ISTMP#1| |ISTMP#2| |s| |LETTMP#1| |op| |sig| |ops|)
    (RETURN
     (PROGN
      (SETQ |single?| (NULL (CDR |dataItems|)))
      (|htSay| "\\table{")
      ((LAMBDA (|bfVar#17| |item|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#17|) (PROGN (SETQ |item| (CAR |bfVar#17|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (SETQ |LETTMP#1|
                     (COND
                      ((AND (CONSP |item|) (EQ (CAR |item|) '|origin|)
                            (PROGN
                             (SETQ |ISTMP#1| (CDR |item|))
                             (AND (CONSP |ISTMP#1|)
                                  (PROGN
                                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                   (AND (CONSP |ISTMP#2|)
                                        (EQ (CDR |ISTMP#2|) NIL)
                                        (PROGN
                                         (SETQ |s| (CAR |ISTMP#2|))
                                         #1#))))))
                       (PROGN (SETQ |buttonForOp?| T) |s|))
                      (#1# |item|)))
             (SETQ |op| (CAR |LETTMP#1|))
             (SETQ |sig| (CDR |LETTMP#1|))
             (SETQ |ops| (|escapeSpecialChars| (STRINGIMAGE |op|)))
             (|htSay| "{")
             (COND
              ((OR (< |count| 16384) (NULL |buttonForOp?|))
               (|htSay| (LIST |ops| ": "))
               (COND ((ATOM |sig|) (|bcConform| |sig|))
                     (#1# (|bcConform| (|dbInfoSig| |sig|)))))
              (#1#
               (|htMakePage|
                (LIST
                 (LIST '|bcLinks|
                       (LIST |ops| "" '|dbInfoChooseSingle| |count|))))
               (|htSay| ": ")
               (COND ((ATOM |sig|) (|htSay| |sig|))
                     (#1# (|bcConform| (|dbInfoSig| |sig|))))))
             (|htSay| "}")
             (SETQ |count| (+ |count| 1)))))
          (SETQ |bfVar#17| (CDR |bfVar#17|))))
       |dataItems| NIL)
      (|htSay| "} ")
      |count|))))
 
; dbInfoFindCat(conform,conArgTypes,u) ==
;   [argName,:opSigList] := u
;   n := POSITION(argName,IFCDR conform) or systemError()
;   t := conArgTypes . n
;   [argName,:[dbInfoWrapOrigin(x,t) for x in opSigList]]
 
(DEFUN |dbInfoFindCat| (|conform| |conArgTypes| |u|)
  (PROG (|argName| |opSigList| |n| |t|)
    (RETURN
     (PROGN
      (SETQ |argName| (CAR |u|))
      (SETQ |opSigList| (CDR |u|))
      (SETQ |n| (OR (POSITION |argName| (IFCDR |conform|)) (|systemError|)))
      (SETQ |t| (ELT |conArgTypes| |n|))
      (CONS |argName|
            ((LAMBDA (|bfVar#19| |bfVar#18| |x|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#18|)
                      (PROGN (SETQ |x| (CAR |bfVar#18|)) NIL))
                  (RETURN (NREVERSE |bfVar#19|)))
                 ('T
                  (SETQ |bfVar#19|
                          (CONS (|dbInfoWrapOrigin| |x| |t|) |bfVar#19|))))
                (SETQ |bfVar#18| (CDR |bfVar#18|))))
             NIL |opSigList| NIL))))))
 
; dbInfoWrapOrigin(x, t) ==
;   [op, :sig] := x
;   origin := dbInfoOrigin(op,sig,t) => ['origin, origin, x]
;   x
 
(DEFUN |dbInfoWrapOrigin| (|x| |t|)
  (PROG (|op| |sig| |origin|)
    (RETURN
     (PROGN
      (SETQ |op| (CAR |x|))
      (SETQ |sig| (CDR |x|))
      (COND
       ((SETQ |origin| (|dbInfoOrigin| |op| |sig| |t|))
        (LIST '|origin| |origin| |x|))
       ('T |x|))))))
 
; dbInfoOrigin(op,sig,t) ==
;   t is ['Join, :r] => or/[dbInfoOrigin(op,sig,x) for x in r]
;   t is ['CATEGORY,:.] => false
;   [sig = sig1 for [sig1,:.] in LASSOC(op, koOps(t,nil))] => t
;   false
 
(DEFUN |dbInfoOrigin| (|op| |sig| |t|)
  (PROG (|r| |sig1|)
    (RETURN
     (COND
      ((AND (CONSP |t|) (EQ (CAR |t|) '|Join|)
            (PROGN (SETQ |r| (CDR |t|)) #1='T))
       ((LAMBDA (|bfVar#21| |bfVar#20| |x|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#20|) (PROGN (SETQ |x| (CAR |bfVar#20|)) NIL))
             (RETURN |bfVar#21|))
            (#1#
             (PROGN
              (SETQ |bfVar#21| (|dbInfoOrigin| |op| |sig| |x|))
              (COND (|bfVar#21| (RETURN |bfVar#21|))))))
           (SETQ |bfVar#20| (CDR |bfVar#20|))))
        NIL |r| NIL))
      ((AND (CONSP |t|) (EQ (CAR |t|) 'CATEGORY)) NIL)
      (((LAMBDA (|bfVar#24| |bfVar#23| |bfVar#22|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#23|)
                 (PROGN (SETQ |bfVar#22| (CAR |bfVar#23|)) NIL))
             (RETURN (NREVERSE |bfVar#24|)))
            (#1#
             (AND (CONSP |bfVar#22|) (PROGN (SETQ |sig1| (CAR |bfVar#22|)) #1#)
                  (SETQ |bfVar#24| (CONS (EQUAL |sig| |sig1|) |bfVar#24|)))))
           (SETQ |bfVar#23| (CDR |bfVar#23|))))
        NIL (LASSOC |op| (|koOps| |t| NIL)) NIL)
       |t|)
      (#1# NIL)))))
 
; dbInfoTran(con, opSigList) == [con, :substitute("$", con, mySort opSigList)]
 
(DEFUN |dbInfoTran| (|con| |opSigList|)
  (PROG ()
    (RETURN (CONS |con| (|substitute| '$ |con| (|mySort| |opSigList|))))))
 
; zeroOneConvertAlist u == [[zeroOneConvert x,:y] for [x,:y] in u]
 
(DEFUN |zeroOneConvertAlist| (|u|)
  (PROG (|x| |y|)
    (RETURN
     ((LAMBDA (|bfVar#27| |bfVar#26| |bfVar#25|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#26|)
               (PROGN (SETQ |bfVar#25| (CAR |bfVar#26|)) NIL))
           (RETURN (NREVERSE |bfVar#27|)))
          (#1='T
           (AND (CONSP |bfVar#25|)
                (PROGN
                 (SETQ |x| (CAR |bfVar#25|))
                 (SETQ |y| (CDR |bfVar#25|))
                 #1#)
                (SETQ |bfVar#27|
                        (CONS (CONS (|zeroOneConvert| |x|) |y|) |bfVar#27|)))))
         (SETQ |bfVar#26| (CDR |bfVar#26|))))
      NIL |u| NIL))))
 
; dbInfoChoose(htPage,count) ==
;   fromAlist := htpProperty(htPage,'fromAlist)
;   index := count - 2
;   [con, :alist] := fromAlist.index
;   dbInfoChoose1(htPage,con,alist)
 
(DEFUN |dbInfoChoose| (|htPage| |count|)
  (PROG (|fromAlist| |index| |LETTMP#1| |con| |alist|)
    (RETURN
     (PROGN
      (SETQ |fromAlist| (|htpProperty| |htPage| '|fromAlist|))
      (SETQ |index| (- |count| 2))
      (SETQ |LETTMP#1| (ELT |fromAlist| |index|))
      (SETQ |con| (CAR |LETTMP#1|))
      (SETQ |alist| (CDR |LETTMP#1|))
      (|dbInfoChoose1| |htPage| |con| |alist|)))))
 
; dbInfoChooseSingle(htPage,count) ==
;   fromAlist := htpProperty(htPage,'fromAlist)
;   [index, binkey] := DIVIDE(count, 8192)
;   [con, :alist] := fromAlist.(index - 2)
;   item := alist . binkey
;   alist :=
;     item is ['origin,origin,s] =>
;       con := origin
;       [s]
;     [item]
;   dbInfoChoose1(htPage,con,alist)
 
(DEFUN |dbInfoChooseSingle| (|htPage| |count|)
  (PROG (|fromAlist| |LETTMP#1| |index| |binkey| |con| |alist| |item| |ISTMP#1|
         |origin| |ISTMP#2| |s|)
    (RETURN
     (PROGN
      (SETQ |fromAlist| (|htpProperty| |htPage| '|fromAlist|))
      (SETQ |LETTMP#1| (DIVIDE |count| 8192))
      (SETQ |index| (CAR |LETTMP#1|))
      (SETQ |binkey| (CADR |LETTMP#1|))
      (SETQ |LETTMP#1| (ELT |fromAlist| (- |index| 2)))
      (SETQ |con| (CAR |LETTMP#1|))
      (SETQ |alist| (CDR |LETTMP#1|))
      (SETQ |item| (ELT |alist| |binkey|))
      (SETQ |alist|
              (COND
               ((AND (CONSP |item|) (EQ (CAR |item|) '|origin|)
                     (PROGN
                      (SETQ |ISTMP#1| (CDR |item|))
                      (AND (CONSP |ISTMP#1|)
                           (PROGN
                            (SETQ |origin| (CAR |ISTMP#1|))
                            (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                            (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                                 (PROGN (SETQ |s| (CAR |ISTMP#2|)) #1='T))))))
                (PROGN (SETQ |con| |origin|) (LIST |s|)))
               (#1# (LIST |item|))))
      (|dbInfoChoose1| |htPage| |con| |alist|)))))
 
; dbInfoChoose1(htPage,con,alist) ==
;   $conform: local := con
;   opAlist := [pair for x in koOps(con,nil) | pair:=dbInfoSigMatch(x,alist)]
;   page := htInitPage(nil,nil)
;   htpSetProperty(page,'conform,con)
;   htpSetProperty(page,'kind,PNAME GETDATABASE(opOf con,'CONSTRUCTORKIND))
;   dbShowOperationsFromConform(page,'"operation",opAlist)
 
(DEFUN |dbInfoChoose1| (|htPage| |con| |alist|)
  (PROG (|$conform| |page| |opAlist| |pair|)
    (DECLARE (SPECIAL |$conform|))
    (RETURN
     (PROGN
      (SETQ |$conform| |con|)
      (SETQ |opAlist|
              ((LAMBDA (|bfVar#29| |bfVar#28| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#28|)
                        (PROGN (SETQ |x| (CAR |bfVar#28|)) NIL))
                    (RETURN (NREVERSE |bfVar#29|)))
                   ('T
                    (AND (SETQ |pair| (|dbInfoSigMatch| |x| |alist|))
                         (SETQ |bfVar#29| (CONS |pair| |bfVar#29|)))))
                  (SETQ |bfVar#28| (CDR |bfVar#28|))))
               NIL (|koOps| |con| NIL) NIL))
      (SETQ |page| (|htInitPage| NIL NIL))
      (|htpSetProperty| |page| '|conform| |con|)
      (|htpSetProperty| |page| '|kind|
       (PNAME (GETDATABASE (|opOf| |con|) 'CONSTRUCTORKIND)))
      (|dbShowOperationsFromConform| |page| "operation" |opAlist|)))))
 
; dbInfoSigMatch(x,alist) ==
;   [op,:sigAlist] := x
;   candidates := [sig for [op1,:sig] in alist | op1 = op] or return nil
;   sigs := [s for s in sigAlist | "or"/[first s = s1 for s1 in candidates] or
;     (s2 := SUBST($conform,"$",s)) and "or"/[first s2 = s1 for s1 in candidates]]
;   sigs and [op,:sigs]
 
(DEFUN |dbInfoSigMatch| (|x| |alist|)
  (PROG (|op| |sigAlist| |op1| |sig| |candidates| |s2| |sigs|)
    (RETURN
     (PROGN
      (SETQ |op| (CAR |x|))
      (SETQ |sigAlist| (CDR |x|))
      (SETQ |candidates|
              (OR
               ((LAMBDA (|bfVar#32| |bfVar#31| |bfVar#30|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#31|)
                         (PROGN (SETQ |bfVar#30| (CAR |bfVar#31|)) NIL))
                     (RETURN (NREVERSE |bfVar#32|)))
                    (#1='T
                     (AND (CONSP |bfVar#30|)
                          (PROGN
                           (SETQ |op1| (CAR |bfVar#30|))
                           (SETQ |sig| (CDR |bfVar#30|))
                           #1#)
                          (EQUAL |op1| |op|)
                          (SETQ |bfVar#32| (CONS |sig| |bfVar#32|)))))
                   (SETQ |bfVar#31| (CDR |bfVar#31|))))
                NIL |alist| NIL)
               (RETURN NIL)))
      (SETQ |sigs|
              ((LAMBDA (|bfVar#38| |bfVar#33| |s|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#33|)
                        (PROGN (SETQ |s| (CAR |bfVar#33|)) NIL))
                    (RETURN (NREVERSE |bfVar#38|)))
                   (#1#
                    (AND
                     (OR
                      ((LAMBDA (|bfVar#35| |bfVar#34| |s1|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#34|)
                                (PROGN (SETQ |s1| (CAR |bfVar#34|)) NIL))
                            (RETURN |bfVar#35|))
                           (#1#
                            (PROGN
                             (SETQ |bfVar#35| (EQUAL (CAR |s|) |s1|))
                             (COND (|bfVar#35| (RETURN |bfVar#35|))))))
                          (SETQ |bfVar#34| (CDR |bfVar#34|))))
                       NIL |candidates| NIL)
                      (AND (SETQ |s2| (SUBST |$conform| '$ |s|))
                           ((LAMBDA (|bfVar#37| |bfVar#36| |s1|)
                              (LOOP
                               (COND
                                ((OR (ATOM |bfVar#36|)
                                     (PROGN (SETQ |s1| (CAR |bfVar#36|)) NIL))
                                 (RETURN |bfVar#37|))
                                (#1#
                                 (PROGN
                                  (SETQ |bfVar#37| (EQUAL (CAR |s2|) |s1|))
                                  (COND (|bfVar#37| (RETURN |bfVar#37|))))))
                               (SETQ |bfVar#36| (CDR |bfVar#36|))))
                            NIL |candidates| NIL)))
                     (SETQ |bfVar#38| (CONS |s| |bfVar#38|)))))
                  (SETQ |bfVar#33| (CDR |bfVar#33|))))
               NIL |sigAlist| NIL))
      (AND |sigs| (CONS |op| |sigs|))))))
 
; dbInfoSig sig ==
;   null rest sig => first sig
;   ['Mapping,:sig]
 
(DEFUN |dbInfoSig| (|sig|)
  (PROG ()
    (RETURN
     (COND ((NULL (CDR |sig|)) (CAR |sig|)) ('T (CONS '|Mapping| |sig|))))))
 
; dbGetExpandedOpAlist htPage ==
;   expand := htpProperty(htPage,'expandOperations)
;   if expand ~= 'fullyExpanded then
;     if null expand then htpSetProperty(htPage,'expandOperations,'lists)
;     opAlist := koOps(htpProperty(htPage,'conform),nil)
;     htpSetProperty(htPage,'opAlist,opAlist)
;     dbExpandOpAlistIfNecessary(htPage,opAlist,'"operation",false,false)
;   htpProperty(htPage,'opAlist)
 
(DEFUN |dbGetExpandedOpAlist| (|htPage|)
  (PROG (|expand| |opAlist|)
    (RETURN
     (PROGN
      (SETQ |expand| (|htpProperty| |htPage| '|expandOperations|))
      (COND
       ((NOT (EQ |expand| '|fullyExpanded|))
        (COND
         ((NULL |expand|)
          (|htpSetProperty| |htPage| '|expandOperations| '|lists|)))
        (SETQ |opAlist| (|koOps| (|htpProperty| |htPage| '|conform|) NIL))
        (|htpSetProperty| |htPage| '|opAlist| |opAlist|)
        (|dbExpandOpAlistIfNecessary| |htPage| |opAlist| "operation" NIL NIL)))
      (|htpProperty| |htPage| '|opAlist|)))))
 
; hasNewInfoAlist conname ==
;   (u := getInfoAlist conname) and hasNewInfoText u
 
(DEFUN |hasNewInfoAlist| (|conname|)
  (PROG (|u|)
    (RETURN
     (AND (SETQ |u| (|getInfoAlist| |conname|)) (|hasNewInfoText| |u|)))))
 
; hasNewInfoText u ==
;   and/[ATOM op and and/[item is [sig,:alist] and
;     null sig or null atom sig and null atom alist for item in items] for [op,:items] in u]
 
(DEFUN |hasNewInfoText| (|u|)
  (PROG (|op| |items| |sig| |alist|)
    (RETURN
     ((LAMBDA (|bfVar#43| |bfVar#42| |bfVar#41|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#42|)
               (PROGN (SETQ |bfVar#41| (CAR |bfVar#42|)) NIL))
           (RETURN |bfVar#43|))
          (#1='T
           (AND (CONSP |bfVar#41|)
                (PROGN
                 (SETQ |op| (CAR |bfVar#41|))
                 (SETQ |items| (CDR |bfVar#41|))
                 #1#)
                (PROGN
                 (SETQ |bfVar#43|
                         (AND (ATOM |op|)
                              ((LAMBDA (|bfVar#40| |bfVar#39| |item|)
                                 (LOOP
                                  (COND
                                   ((OR (ATOM |bfVar#39|)
                                        (PROGN
                                         (SETQ |item| (CAR |bfVar#39|))
                                         NIL))
                                    (RETURN |bfVar#40|))
                                   (#1#
                                    (PROGN
                                     (SETQ |bfVar#40|
                                             (OR
                                              (AND (CONSP |item|)
                                                   (PROGN
                                                    (SETQ |sig| (CAR |item|))
                                                    (SETQ |alist| (CDR |item|))
                                                    #1#)
                                                   (NULL |sig|))
                                              (AND (NULL (ATOM |sig|))
                                                   (NULL (ATOM |alist|)))))
                                     (COND ((NOT |bfVar#40|) (RETURN NIL))))))
                                  (SETQ |bfVar#39| (CDR |bfVar#39|))))
                               T |items| NIL)))
                 (COND ((NOT |bfVar#43|) (RETURN NIL)))))))
         (SETQ |bfVar#42| (CDR |bfVar#42|))))
      T |u| NIL))))
 
; getInfoAlist conname ==
;   cat? := GETDATABASE(conname,'CONSTRUCTORKIND) = 'category
;   if cat? then conname := INTERN STRCONC(STRINGIMAGE conname,'"&")
;   abb := constructor? conname or return '"not a constructor"
;   fs  := STRCONC(PNAME abb,'".NRLIB/info")
;   inStream :=
;     PROBE_-FILE fs => OPEN fs
;     filename := STRCONC('"/spad/int/algebra/",PNAME abb,'".NRLIB/info")
;     PROBE_-FILE filename => OPEN filename
;     return nil
;   alist := mySort VMREAD inStream
;   if cat? then
;     [.,dollarName,:.] := GETDATABASE(conname,'CONSTRUCTORFORM)
;     alist := substitute("$", dollarName, alist)
;   alist
 
(DEFUN |getInfoAlist| (|conname|)
  (PROG (|cat?| |abb| |fs| |filename| |inStream| |alist| |LETTMP#1|
         |dollarName|)
    (RETURN
     (PROGN
      (SETQ |cat?| (EQ (GETDATABASE |conname| 'CONSTRUCTORKIND) '|category|))
      (COND
       (|cat?|
        (SETQ |conname| (INTERN (STRCONC (STRINGIMAGE |conname|) "&")))))
      (SETQ |abb| (OR (|constructor?| |conname|) (RETURN "not a constructor")))
      (SETQ |fs| (STRCONC (PNAME |abb|) ".NRLIB/info"))
      (SETQ |inStream|
              (COND ((PROBE-FILE |fs|) (OPEN |fs|))
                    (#1='T
                     (PROGN
                      (SETQ |filename|
                              (STRCONC "/spad/int/algebra/" (PNAME |abb|)
                               ".NRLIB/info"))
                      (COND ((PROBE-FILE |filename|) (OPEN |filename|))
                            (#1# (RETURN NIL)))))))
      (SETQ |alist| (|mySort| (VMREAD |inStream|)))
      (COND
       (|cat?| (SETQ |LETTMP#1| (GETDATABASE |conname| 'CONSTRUCTORFORM))
        (SETQ |dollarName| (CADR |LETTMP#1|))
        (SETQ |alist| (|substitute| '$ |dollarName| |alist|))))
      |alist|))))
