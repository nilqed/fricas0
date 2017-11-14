 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; Category() == nil --sorry to say, this hack is needed by isCategoryType
 
(DEFUN |Category| #1=() (PROG #1# (RETURN NIL)))
 
; CategoryPrint(D,$e) ==
;   SAY "--------------------------------------"
;   SAY "Name (and arguments) of category:"
;   PRETTYPRINT D.(0)
;   SAY "operations:"
;   PRETTYPRINT D.(1)
;   SAY "attributes:"
;   PRETTYPRINT D.2
;   SAY "This is a sub-category of"
;   PRETTYPRINT first D.4
;   for u in CADR D.4 repeat
;     SAY("This has an alternate view: slot ",rest u," corresponds to ",first u)
;   for u in CADDR D.4 repeat
;     SAY("This has a local domain: slot ",rest u," corresponds to ",first u)
;   for j in 6..MAXINDEX D repeat
;     u:= D.j
;     null u => SAY "another domain"
;     atom first u => SAY("Alternate View corresponding to: ",u)
;     PRETTYPRINT u
 
(DEFUN |CategoryPrint| (D |$e|)
  (DECLARE (SPECIAL |$e|))
  (PROG (|u|)
    (RETURN
     (PROGN
      (SAY '--------------------------------------)
      (SAY '|Name (and arguments) of category:|)
      (PRETTYPRINT (ELT D 0))
      (SAY '|operations:|)
      (PRETTYPRINT (ELT D 1))
      (SAY '|attributes:|)
      (PRETTYPRINT (ELT D 2))
      (SAY '|This is a sub-category of|)
      (PRETTYPRINT (CAR (ELT D 4)))
      ((LAMBDA (|bfVar#1| |u|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#1|) (PROGN (SETQ |u| (CAR |bfVar#1|)) NIL))
            (RETURN NIL))
           (#1='T
            (SAY '|This has an alternate view: slot | (CDR |u|)
             '| corresponds to | (CAR |u|))))
          (SETQ |bfVar#1| (CDR |bfVar#1|))))
       (CADR (ELT D 4)) NIL)
      ((LAMBDA (|bfVar#2| |u|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#2|) (PROGN (SETQ |u| (CAR |bfVar#2|)) NIL))
            (RETURN NIL))
           (#1#
            (SAY '|This has a local domain: slot | (CDR |u|)
             '| corresponds to | (CAR |u|))))
          (SETQ |bfVar#2| (CDR |bfVar#2|))))
       (CADDR (ELT D 4)) NIL)
      ((LAMBDA (|bfVar#3| |j|)
         (LOOP
          (COND ((> |j| |bfVar#3|) (RETURN NIL))
                (#1#
                 (PROGN
                  (SETQ |u| (ELT D |j|))
                  (COND ((NULL |u|) (SAY '|another domain|))
                        ((ATOM (CAR |u|))
                         (SAY '|Alternate View corresponding to: | |u|))
                        (#1# (PRETTYPRINT |u|))))))
          (SETQ |j| (+ |j| 1))))
       (MAXINDEX D) 6)))))
 
; sigParams(sigList) ==
;   result := nil
;   myhash := MAKE_-HASHTABLE 'EQUAL
;   NewLocals:= nil
;   for s in sigList repeat
;     (NewLocals := Prepare (CADAR s, NewLocals)) where
;       Prepare (u, l) == for v in u repeat l := Prepare2(v, l)
;       Prepare2 (v,l) ==
;           v is "$" => l
;           STRINGP v => l
;           atom v => [v,:l]
;           MEMQ(first v,$PrimitiveDomainNames) => l
;             --This variable is set in INIT LISP
;             --It is a list of all the domains that we need not cache
;           v is ["Union",:w] =>
;             for x in stripUnionTags w repeat l := Prepare2 (x, l)
;             l
;           v is ["Mapping",:w] =>
;             for x in w repeat l := Prepare2 (x, l)
;             l
;           v is ["List",w] => Prepare2 (w, l)
;           v is ["Record",.,:w] =>
;             for x in w repeat l := Prepare2 (CADDR x, l)
;             l
;           [v,:l]
;   for s in NewLocals repeat
;      if null(HGET(myhash, s)) then
;         HPUT(myhash, s, true)
;         result := [s,:result]
;   result
 
(DEFUN |sigParams| (|sigList|)
  (PROG (|result| |myhash| |NewLocals|)
    (RETURN
     (PROGN
      (SETQ |result| NIL)
      (SETQ |myhash| (MAKE-HASHTABLE 'EQUAL))
      (SETQ |NewLocals| NIL)
      ((LAMBDA (|bfVar#4| |s|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#4|) (PROGN (SETQ |s| (CAR |bfVar#4|)) NIL))
            (RETURN NIL))
           (#1='T
            (SETQ |NewLocals| (|sigParams,Prepare| (CADAR |s|) |NewLocals|))))
          (SETQ |bfVar#4| (CDR |bfVar#4|))))
       |sigList| NIL)
      ((LAMBDA (|bfVar#9| |s|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#9|) (PROGN (SETQ |s| (CAR |bfVar#9|)) NIL))
            (RETURN NIL))
           (#1#
            (COND
             ((NULL (HGET |myhash| |s|)) (HPUT |myhash| |s| T)
              (SETQ |result| (CONS |s| |result|))))))
          (SETQ |bfVar#9| (CDR |bfVar#9|))))
       |NewLocals| NIL)
      |result|))))
(DEFUN |sigParams,Prepare| (|u| |l|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#5| |v|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#5|) (PROGN (SETQ |v| (CAR |bfVar#5|)) NIL))
           (RETURN NIL))
          ('T (SETQ |l| (|sigParams,Prepare2| |v| |l|))))
         (SETQ |bfVar#5| (CDR |bfVar#5|))))
      |u| NIL))))
(DEFUN |sigParams,Prepare2| (|v| |l|)
  (PROG (|w| |ISTMP#1|)
    (RETURN
     (COND ((EQ |v| '$) |l|) ((STRINGP |v|) |l|) ((ATOM |v|) (CONS |v| |l|))
           ((MEMQ (CAR |v|) |$PrimitiveDomainNames|) |l|)
           ((AND (CONSP |v|) (EQ (CAR |v|) '|Union|)
                 (PROGN (SETQ |w| (CDR |v|)) #1='T))
            (PROGN
             ((LAMBDA (|bfVar#6| |x|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#6|) (PROGN (SETQ |x| (CAR |bfVar#6|)) NIL))
                   (RETURN NIL))
                  (#1# (SETQ |l| (|sigParams,Prepare2| |x| |l|))))
                 (SETQ |bfVar#6| (CDR |bfVar#6|))))
              (|stripUnionTags| |w|) NIL)
             |l|))
           ((AND (CONSP |v|) (EQ (CAR |v|) '|Mapping|)
                 (PROGN (SETQ |w| (CDR |v|)) #1#))
            (PROGN
             ((LAMBDA (|bfVar#7| |x|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#7|) (PROGN (SETQ |x| (CAR |bfVar#7|)) NIL))
                   (RETURN NIL))
                  (#1# (SETQ |l| (|sigParams,Prepare2| |x| |l|))))
                 (SETQ |bfVar#7| (CDR |bfVar#7|))))
              |w| NIL)
             |l|))
           ((AND (CONSP |v|) (EQ (CAR |v|) '|List|)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |v|))
                  (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                       (PROGN (SETQ |w| (CAR |ISTMP#1|)) #1#))))
            (|sigParams,Prepare2| |w| |l|))
           ((AND (CONSP |v|) (EQ (CAR |v|) '|Record|)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |v|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN (SETQ |w| (CDR |ISTMP#1|)) #1#))))
            (PROGN
             ((LAMBDA (|bfVar#8| |x|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#8|) (PROGN (SETQ |x| (CAR |bfVar#8|)) NIL))
                   (RETURN NIL))
                  (#1# (SETQ |l| (|sigParams,Prepare2| (CADDR |x|) |l|))))
                 (SETQ |bfVar#8| (CDR |bfVar#8|))))
              |w| NIL)
             |l|))
           (#1# (CONS |v| |l|))))))
 
; mkCategory(sigList, attList, domList, PrincipalAncestor) ==
;   NSigList := nil
;   count := 6
;   sigList:=
;     [if s is [sig,pred]
;        then
;          or/[x is [[ =sig,.,:impl],:num] for x in NSigList] => [sig,pred,:impl]
;                  --only needed for multiple copies of sig
;          nsig:= mkOperatorEntry(sig,pred,count)
;          NSigList:= [[nsig,:count],:NSigList]
;          count:= count+1
;          nsig
;      else s for s in sigList]
;   NewLocals := sigParams(sigList)
;   OldLocals:= nil
;   if PrincipalAncestor then for u in (OldLocals:= CADDR PrincipalAncestor.4)
;      repeat NewLocals:= delete(first u,NewLocals)
;   for u in NewLocals repeat
;     (OldLocals:= [[u,:count],:OldLocals]; count:= count+1)
;   v:= GETREFV 6
;   v.(0):= nil
;   v.(1):= sigList
;   v.2:= attList
;   v.3:= ["Category"]
;   if not(PrincipalAncestor = nil) then
;       v.4 := [first PrincipalAncestor.4, CADR PrincipalAncestor.4, OldLocals]
;    else v.4 := [nil,nil,OldLocals] --associated categories and domains
;   v.5:= domList
;   v
 
(DEFUN |mkCategory| (|sigList| |attList| |domList| |PrincipalAncestor|)
  (PROG (|NSigList| |count| |sig| |ISTMP#1| |pred| |ISTMP#2| |impl| |num|
         |nsig| |NewLocals| |OldLocals| |v|)
    (RETURN
     (PROGN
      (SETQ |NSigList| NIL)
      (SETQ |count| 6)
      (SETQ |sigList|
              ((LAMBDA (|bfVar#13| |bfVar#12| |s|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#12|)
                        (PROGN (SETQ |s| (CAR |bfVar#12|)) NIL))
                    (RETURN (NREVERSE |bfVar#13|)))
                   (#1='T
                    (SETQ |bfVar#13|
                            (CONS
                             (COND
                              ((AND (CONSP |s|)
                                    (PROGN
                                     (SETQ |sig| (CAR |s|))
                                     (SETQ |ISTMP#1| (CDR |s|))
                                     (AND (CONSP |ISTMP#1|)
                                          (EQ (CDR |ISTMP#1|) NIL)
                                          (PROGN
                                           (SETQ |pred| (CAR |ISTMP#1|))
                                           #1#))))
                               (COND
                                (((LAMBDA (|bfVar#11| |bfVar#10| |x|)
                                    (LOOP
                                     (COND
                                      ((OR (ATOM |bfVar#10|)
                                           (PROGN
                                            (SETQ |x| (CAR |bfVar#10|))
                                            NIL))
                                       (RETURN |bfVar#11|))
                                      (#1#
                                       (PROGN
                                        (SETQ |bfVar#11|
                                                (AND (CONSP |x|)
                                                     (PROGN
                                                      (SETQ |ISTMP#1|
                                                              (CAR |x|))
                                                      (AND (CONSP |ISTMP#1|)
                                                           (EQUAL
                                                            (CAR |ISTMP#1|)
                                                            |sig|)
                                                           (PROGN
                                                            (SETQ |ISTMP#2|
                                                                    (CDR
                                                                     |ISTMP#1|))
                                                            (AND
                                                             (CONSP |ISTMP#2|)
                                                             (PROGN
                                                              (SETQ |impl|
                                                                      (CDR
                                                                       |ISTMP#2|))
                                                              #1#)))))
                                                     (PROGN
                                                      (SETQ |num| (CDR |x|))
                                                      #1#)))
                                        (COND
                                         (|bfVar#11| (RETURN |bfVar#11|))))))
                                     (SETQ |bfVar#10| (CDR |bfVar#10|))))
                                  NIL |NSigList| NIL)
                                 (CONS |sig| (CONS |pred| |impl|)))
                                (#1#
                                 (PROGN
                                  (SETQ |nsig|
                                          (|mkOperatorEntry| |sig| |pred|
                                           |count|))
                                  (SETQ |NSigList|
                                          (CONS (CONS |nsig| |count|)
                                                |NSigList|))
                                  (SETQ |count| (+ |count| 1))
                                  |nsig|))))
                              (#1# |s|))
                             |bfVar#13|))))
                  (SETQ |bfVar#12| (CDR |bfVar#12|))))
               NIL |sigList| NIL))
      (SETQ |NewLocals| (|sigParams| |sigList|))
      (SETQ |OldLocals| NIL)
      (COND
       (|PrincipalAncestor|
        ((LAMBDA (|bfVar#14| |u|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#14|) (PROGN (SETQ |u| (CAR |bfVar#14|)) NIL))
              (RETURN NIL))
             (#1# (SETQ |NewLocals| (|delete| (CAR |u|) |NewLocals|))))
            (SETQ |bfVar#14| (CDR |bfVar#14|))))
         (SETQ |OldLocals| (CADDR (ELT |PrincipalAncestor| 4))) NIL)))
      ((LAMBDA (|bfVar#15| |u|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#15|) (PROGN (SETQ |u| (CAR |bfVar#15|)) NIL))
            (RETURN NIL))
           (#1#
            (PROGN
             (SETQ |OldLocals| (CONS (CONS |u| |count|) |OldLocals|))
             (SETQ |count| (+ |count| 1)))))
          (SETQ |bfVar#15| (CDR |bfVar#15|))))
       |NewLocals| NIL)
      (SETQ |v| (GETREFV 6))
      (SETF (ELT |v| 0) NIL)
      (SETF (ELT |v| 1) |sigList|)
      (SETF (ELT |v| 2) |attList|)
      (SETF (ELT |v| 3) (LIST '|Category|))
      (COND
       ((NULL (NULL |PrincipalAncestor|))
        (SETF (ELT |v| 4)
                (LIST (CAR (ELT |PrincipalAncestor| 4))
                      (CADR (ELT |PrincipalAncestor| 4)) |OldLocals|)))
       (#1# (SETF (ELT |v| 4) (LIST NIL NIL |OldLocals|))))
      (SETF (ELT |v| 5) |domList|)
      |v|))))
 
; isCategory a == REFVECP a and #a>5 and a.3=["Category"]
 
(DEFUN |isCategory| (|a|)
  (PROG ()
    (RETURN
     (AND (REFVECP |a|) (< 5 (LENGTH |a|))
          (EQUAL (ELT |a| 3) (LIST '|Category|))))))
 
; DropImplementations (a is [sig,pred,:implem]) ==
;   if implem is [[q,:.]] and (q="ELT" or q="CONST")
;      then if (q="ELT")  then [sig,pred]
;                         else [[:sig,:'(constant)],pred]
;      else a
 
(DEFUN |DropImplementations| (|a|)
  (PROG (|sig| |pred| |implem| |ISTMP#1| |q|)
    (RETURN
     (PROGN
      (SETQ |sig| (CAR |a|))
      (SETQ |pred| (CADR . #1=(|a|)))
      (SETQ |implem| (CDDR . #1#))
      (COND
       ((AND (CONSP |implem|) (EQ (CDR |implem|) NIL)
             (PROGN
              (SETQ |ISTMP#1| (CAR |implem|))
              (AND (CONSP |ISTMP#1|) (PROGN (SETQ |q| (CAR |ISTMP#1|)) #2='T)))
             (OR (EQ |q| 'ELT) (EQ |q| 'CONST)))
        (COND ((EQ |q| 'ELT) (LIST |sig| |pred|))
              (#2# (LIST (APPEND |sig| '(|constant|)) |pred|))))
       (#2# |a|))))))
 
; SigListUnion(extra,original) ==
;   --augments original with everything in extra that is not in original
;   for (o:=[[ofn,osig,:.],opred,:.]) in original repeat
;     -- The purpose of this loop is to detect cases when
;     -- original list already contains given operation
;     for x in SigListOpSubsume(o,extra) repeat
;       [[xfn,xsig,:.],xpred,:.]:=x
;       xfn=ofn and xsig=osig =>
;               --checking name and signature, but not a 'constant' marker
;         xpred=opred => extra:= delete(x,extra)
;              --same signature and same predicate
;         opred = true => extra:= delete(x,extra)
;   for e in extra repeat
;       [esig, epred, :.] := e
;       for x in SigListOpSubsume(e, original) repeat
;         --PRETTYPRINT(LIST("SigListOpSubsume",e,x))
;           original := delete(x,original)
;           [xsig, xpred, :ximplem] := x
;           if ximplem then esig := [first esig, CADR esig]
;              -- in case there's a constant marker
;           e := [esig, mkOr(epred, xpred), :ximplem]
;       original := [e, :original]
;   original
 
(DEFUN |SigListUnion| (|extra| |original|)
  (PROG (|ISTMP#1| |ofn| |ISTMP#2| |osig| |ISTMP#3| |opred| |xfn| |xsig|
         |xpred| |esig| |epred| |ximplem|)
    (RETURN
     (PROGN
      ((LAMBDA (|bfVar#16| |o|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#16|) (PROGN (SETQ |o| (CAR |bfVar#16|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |o|)
                 (PROGN
                  (SETQ |ISTMP#1| (CAR |o|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |ofn| (CAR |ISTMP#1|))
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|)
                             (PROGN (SETQ |osig| (CAR |ISTMP#2|)) #1#)))))
                 (PROGN
                  (SETQ |ISTMP#3| (CDR |o|))
                  (AND (CONSP |ISTMP#3|)
                       (PROGN (SETQ |opred| (CAR |ISTMP#3|)) #1#)))
                 ((LAMBDA (|bfVar#17| |x|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#17|)
                           (PROGN (SETQ |x| (CAR |bfVar#17|)) NIL))
                       (RETURN NIL))
                      (#1#
                       (PROGN
                        (SETQ |xfn| (CAAR . #2=(|x|)))
                        (SETQ |xsig| (CADAR . #2#))
                        (SETQ |xpred| (CADR |x|))
                        (COND
                         ((AND (EQUAL |xfn| |ofn|) (EQUAL |xsig| |osig|))
                          (COND
                           ((EQUAL |xpred| |opred|)
                            (SETQ |extra| (|delete| |x| |extra|)))
                           ((EQUAL |opred| T)
                            (SETQ |extra| (|delete| |x| |extra|)))))))))
                     (SETQ |bfVar#17| (CDR |bfVar#17|))))
                  (|SigListOpSubsume| |o| |extra|) NIL))))
          (SETQ |bfVar#16| (CDR |bfVar#16|))))
       |original| NIL)
      ((LAMBDA (|bfVar#18| |e|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#18|) (PROGN (SETQ |e| (CAR |bfVar#18|)) NIL))
            (RETURN NIL))
           (#1#
            (PROGN
             (SETQ |esig| (CAR |e|))
             (SETQ |epred| (CADR |e|))
             ((LAMBDA (|bfVar#19| |x|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#19|)
                       (PROGN (SETQ |x| (CAR |bfVar#19|)) NIL))
                   (RETURN NIL))
                  (#1#
                   (PROGN
                    (SETQ |original| (|delete| |x| |original|))
                    (SETQ |xsig| (CAR |x|))
                    (SETQ |xpred| (CADR . #3=(|x|)))
                    (SETQ |ximplem| (CDDR . #3#))
                    (COND
                     (|ximplem|
                      (SETQ |esig| (LIST (CAR |esig|) (CADR |esig|)))))
                    (SETQ |e|
                            (CONS |esig|
                                  (CONS (|mkOr| |epred| |xpred|)
                                        |ximplem|))))))
                 (SETQ |bfVar#19| (CDR |bfVar#19|))))
              (|SigListOpSubsume| |e| |original|) NIL)
             (SETQ |original| (CONS |e| |original|)))))
          (SETQ |bfVar#18| (CDR |bfVar#18|))))
       |extra| NIL)
      |original|))))
 
; mkOr(a,b) ==
;   a=true => true
;   b=true => true
;   b=a => a
; --PRETTYPRINT ("Condition merging",a,b)
;   l:=
;     a is ["OR",:a'] =>
;       (b is ["OR",:b'] => union(a',b'); mkOr2(b,a') )
;     b is ["OR",:b'] => mkOr2(a,b')
;     (a is ["has",avar,acat]) and (b is ["has",=avar,bcat]) =>
;       DescendantP(acat,bcat) => LIST b
;       DescendantP(bcat,acat) => LIST a
;       [a,b]
;     a is ['AND,:a'] and member(b,a') => LIST b
;     b is ['AND,:b'] and member(a,b') => LIST a
;     a is ["and",:a'] and member(b,a') => LIST b
;     b is ["and",:b'] and member(a,b') => LIST a
;     [a,b]
;   LENGTH l = 1 => first l
;   ["OR",:l]
 
(DEFUN |mkOr| (|a| |b|)
  (PROG (|a'| |b'| |ISTMP#1| |avar| |ISTMP#2| |acat| |bcat| |l|)
    (RETURN
     (COND ((EQUAL |a| T) T) ((EQUAL |b| T) T) ((EQUAL |b| |a|) |a|)
           (#1='T
            (PROGN
             (SETQ |l|
                     (COND
                      ((AND (CONSP |a|) (EQ (CAR |a|) 'OR)
                            (PROGN (SETQ |a'| (CDR |a|)) #1#))
                       (COND
                        ((AND (CONSP |b|) (EQ (CAR |b|) 'OR)
                              (PROGN (SETQ |b'| (CDR |b|)) #1#))
                         (|union| |a'| |b'|))
                        (#1# (|mkOr2| |b| |a'|))))
                      ((AND (CONSP |b|) (EQ (CAR |b|) 'OR)
                            (PROGN (SETQ |b'| (CDR |b|)) #1#))
                       (|mkOr2| |a| |b'|))
                      ((AND (CONSP |a|) (EQ (CAR |a|) '|has|)
                            (PROGN
                             (SETQ |ISTMP#1| (CDR |a|))
                             (AND (CONSP |ISTMP#1|)
                                  (PROGN
                                   (SETQ |avar| (CAR |ISTMP#1|))
                                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                   (AND (CONSP |ISTMP#2|)
                                        (EQ (CDR |ISTMP#2|) NIL)
                                        (PROGN
                                         (SETQ |acat| (CAR |ISTMP#2|))
                                         #1#)))))
                            (CONSP |b|) (EQ (CAR |b|) '|has|)
                            (PROGN
                             (SETQ |ISTMP#1| (CDR |b|))
                             (AND (CONSP |ISTMP#1|)
                                  (EQUAL (CAR |ISTMP#1|) |avar|)
                                  (PROGN
                                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                   (AND (CONSP |ISTMP#2|)
                                        (EQ (CDR |ISTMP#2|) NIL)
                                        (PROGN
                                         (SETQ |bcat| (CAR |ISTMP#2|))
                                         #1#))))))
                       (COND ((|DescendantP| |acat| |bcat|) (LIST |b|))
                             ((|DescendantP| |bcat| |acat|) (LIST |a|))
                             (#1# (LIST |a| |b|))))
                      ((AND (CONSP |a|) (EQ (CAR |a|) 'AND)
                            (PROGN (SETQ |a'| (CDR |a|)) #1#)
                            (|member| |b| |a'|))
                       (LIST |b|))
                      ((AND (CONSP |b|) (EQ (CAR |b|) 'AND)
                            (PROGN (SETQ |b'| (CDR |b|)) #1#)
                            (|member| |a| |b'|))
                       (LIST |a|))
                      ((AND (CONSP |a|) (EQ (CAR |a|) '|and|)
                            (PROGN (SETQ |a'| (CDR |a|)) #1#)
                            (|member| |b| |a'|))
                       (LIST |b|))
                      ((AND (CONSP |b|) (EQ (CAR |b|) '|and|)
                            (PROGN (SETQ |b'| (CDR |b|)) #1#)
                            (|member| |a| |b'|))
                       (LIST |a|))
                      (#1# (LIST |a| |b|))))
             (COND ((EQL (LENGTH |l|) 1) (CAR |l|)) (#1# (CONS 'OR |l|)))))))))
 
; mkOr2(a,b) ==
;   --a is a condition, "b" a list of them
;   member(a,b) => b
;   a is ["has",avar,acat] =>
;     aRedundant:=false
;     for c in b | c is ["has",=avar,ccat] repeat
;       DescendantP(acat,ccat) =>
;         return (aRedundant:=true)
;       if DescendantP(ccat,acat) then b := delete(c,b)
;     aRedundant => b
;     [a,:b]
;   [a,:b]
 
(DEFUN |mkOr2| (|a| |b|)
  (PROG (|ISTMP#1| |avar| |ISTMP#2| |acat| |aRedundant| |ccat|)
    (RETURN
     (COND ((|member| |a| |b|) |b|)
           ((AND (CONSP |a|) (EQ (CAR |a|) '|has|)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |a|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |avar| (CAR |ISTMP#1|))
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                             (PROGN (SETQ |acat| (CAR |ISTMP#2|)) #1='T))))))
            (PROGN
             (SETQ |aRedundant| NIL)
             ((LAMBDA (|bfVar#20| |c|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#20|)
                       (PROGN (SETQ |c| (CAR |bfVar#20|)) NIL))
                   (RETURN NIL))
                  (#1#
                   (AND (CONSP |c|) (EQ (CAR |c|) '|has|)
                        (PROGN
                         (SETQ |ISTMP#1| (CDR |c|))
                         (AND (CONSP |ISTMP#1|) (EQUAL (CAR |ISTMP#1|) |avar|)
                              (PROGN
                               (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                               (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                                    (PROGN
                                     (SETQ |ccat| (CAR |ISTMP#2|))
                                     #1#)))))
                        (COND
                         ((|DescendantP| |acat| |ccat|)
                          (RETURN (SETQ |aRedundant| T)))
                         (#1#
                          (COND
                           ((|DescendantP| |ccat| |acat|)
                            (SETQ |b| (|delete| |c| |b|)))))))))
                 (SETQ |bfVar#20| (CDR |bfVar#20|))))
              |b| NIL)
             (COND (|aRedundant| |b|) (#1# (CONS |a| |b|)))))
           (#1# (CONS |a| |b|))))))
 
; mkAnd(a,b) ==
;   a=true => b
;   b=true => a
;   b=a => a
;   --PRETTYPRINT ("Condition merging",a,b)
;   l:=
;     a is ["AND",:a'] =>
;       (b is ["AND",:b'] => union(a',b'); mkAnd2(b,a') )
;     b is ["AND",:b'] => mkAnd2(a,b')
;     (a is ["has",avar,acat]) and (b is ["has",=avar,bcat]) =>
;       DescendantP(acat,bcat) => LIST a
;       DescendantP(bcat,acat) => LIST b
;       [a,b]
;     [a,b]
;   LENGTH l = 1 => first l
;   ["AND",:l]
 
(DEFUN |mkAnd| (|a| |b|)
  (PROG (|a'| |b'| |ISTMP#1| |avar| |ISTMP#2| |acat| |bcat| |l|)
    (RETURN
     (COND ((EQUAL |a| T) |b|) ((EQUAL |b| T) |a|) ((EQUAL |b| |a|) |a|)
           (#1='T
            (PROGN
             (SETQ |l|
                     (COND
                      ((AND (CONSP |a|) (EQ (CAR |a|) 'AND)
                            (PROGN (SETQ |a'| (CDR |a|)) #1#))
                       (COND
                        ((AND (CONSP |b|) (EQ (CAR |b|) 'AND)
                              (PROGN (SETQ |b'| (CDR |b|)) #1#))
                         (|union| |a'| |b'|))
                        (#1# (|mkAnd2| |b| |a'|))))
                      ((AND (CONSP |b|) (EQ (CAR |b|) 'AND)
                            (PROGN (SETQ |b'| (CDR |b|)) #1#))
                       (|mkAnd2| |a| |b'|))
                      ((AND (CONSP |a|) (EQ (CAR |a|) '|has|)
                            (PROGN
                             (SETQ |ISTMP#1| (CDR |a|))
                             (AND (CONSP |ISTMP#1|)
                                  (PROGN
                                   (SETQ |avar| (CAR |ISTMP#1|))
                                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                   (AND (CONSP |ISTMP#2|)
                                        (EQ (CDR |ISTMP#2|) NIL)
                                        (PROGN
                                         (SETQ |acat| (CAR |ISTMP#2|))
                                         #1#)))))
                            (CONSP |b|) (EQ (CAR |b|) '|has|)
                            (PROGN
                             (SETQ |ISTMP#1| (CDR |b|))
                             (AND (CONSP |ISTMP#1|)
                                  (EQUAL (CAR |ISTMP#1|) |avar|)
                                  (PROGN
                                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                   (AND (CONSP |ISTMP#2|)
                                        (EQ (CDR |ISTMP#2|) NIL)
                                        (PROGN
                                         (SETQ |bcat| (CAR |ISTMP#2|))
                                         #1#))))))
                       (COND ((|DescendantP| |acat| |bcat|) (LIST |a|))
                             ((|DescendantP| |bcat| |acat|) (LIST |b|))
                             (#1# (LIST |a| |b|))))
                      (#1# (LIST |a| |b|))))
             (COND ((EQL (LENGTH |l|) 1) (CAR |l|)) (#1# (CONS 'AND |l|)))))))))
 
; mkAnd2(a,b) ==
;   --a is a condition, "b" a list of them
;   member(a,b) => b
;   a is ["has",avar,acat] =>
;     aRedundant:=false
;     for c in b | c is ["has",=avar,ccat] repeat
;       DescendantP(ccat,acat) =>
;         return (aRedundant:=true)
;       if DescendantP(acat,ccat) then b := delete(c,b)
;     aRedundant => b
;     [a,:b]
;   [a,:b]
 
(DEFUN |mkAnd2| (|a| |b|)
  (PROG (|ISTMP#1| |avar| |ISTMP#2| |acat| |aRedundant| |ccat|)
    (RETURN
     (COND ((|member| |a| |b|) |b|)
           ((AND (CONSP |a|) (EQ (CAR |a|) '|has|)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |a|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |avar| (CAR |ISTMP#1|))
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                             (PROGN (SETQ |acat| (CAR |ISTMP#2|)) #1='T))))))
            (PROGN
             (SETQ |aRedundant| NIL)
             ((LAMBDA (|bfVar#21| |c|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#21|)
                       (PROGN (SETQ |c| (CAR |bfVar#21|)) NIL))
                   (RETURN NIL))
                  (#1#
                   (AND (CONSP |c|) (EQ (CAR |c|) '|has|)
                        (PROGN
                         (SETQ |ISTMP#1| (CDR |c|))
                         (AND (CONSP |ISTMP#1|) (EQUAL (CAR |ISTMP#1|) |avar|)
                              (PROGN
                               (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                               (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                                    (PROGN
                                     (SETQ |ccat| (CAR |ISTMP#2|))
                                     #1#)))))
                        (COND
                         ((|DescendantP| |ccat| |acat|)
                          (RETURN (SETQ |aRedundant| T)))
                         (#1#
                          (COND
                           ((|DescendantP| |acat| |ccat|)
                            (SETQ |b| (|delete| |c| |b|)))))))))
                 (SETQ |bfVar#21| (CDR |bfVar#21|))))
              |b| NIL)
             (COND (|aRedundant| |b|) (#1# (CONS |a| |b|)))))
           (#1# (CONS |a| |b|))))))
 
; PredImplies(a,b) ==
;     --true if a => b in the sense of logical implication
;   a = false => true
;   b = true => true
;   a=b => true
;   a is ["OR", :al] =>
;       res := true
;       for a1 in al while res repeat
;           res := PredImplies(a1, b)
;       res
;   b is ["OR", :bl] =>
;       for b1 in bl while not(res) repeat
;           res := PredImplies(a, b1)
;       res
;   b is ["AND", :bl] =>
;       res := true
;       for b1 in bl while res repeat
;           res := PredImplies(a, b1)
;       res
;   a is ["AND", :al] =>
;       for a1 in al while not(res) repeat
;           res := PredImplies(a1, b)
;       res
;   false         -- added by RDJ: 12/21/82
 
(DEFUN |PredImplies| (|a| |b|)
  (PROG (|al| |res| |bl|)
    (RETURN
     (COND ((NULL |a|) T) ((EQUAL |b| T) T) ((EQUAL |a| |b|) T)
           ((AND (CONSP |a|) (EQ (CAR |a|) 'OR)
                 (PROGN (SETQ |al| (CDR |a|)) #1='T))
            (PROGN
             (SETQ |res| T)
             ((LAMBDA (|bfVar#22| |a1|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#22|)
                       (PROGN (SETQ |a1| (CAR |bfVar#22|)) NIL) (NOT |res|))
                   (RETURN NIL))
                  (#1# (SETQ |res| (|PredImplies| |a1| |b|))))
                 (SETQ |bfVar#22| (CDR |bfVar#22|))))
              |al| NIL)
             |res|))
           ((AND (CONSP |b|) (EQ (CAR |b|) 'OR)
                 (PROGN (SETQ |bl| (CDR |b|)) #1#))
            (PROGN
             ((LAMBDA (|bfVar#23| |b1|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#23|)
                       (PROGN (SETQ |b1| (CAR |bfVar#23|)) NIL) |res|)
                   (RETURN NIL))
                  (#1# (SETQ |res| (|PredImplies| |a| |b1|))))
                 (SETQ |bfVar#23| (CDR |bfVar#23|))))
              |bl| NIL)
             |res|))
           ((AND (CONSP |b|) (EQ (CAR |b|) 'AND)
                 (PROGN (SETQ |bl| (CDR |b|)) #1#))
            (PROGN
             (SETQ |res| T)
             ((LAMBDA (|bfVar#24| |b1|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#24|)
                       (PROGN (SETQ |b1| (CAR |bfVar#24|)) NIL) (NOT |res|))
                   (RETURN NIL))
                  (#1# (SETQ |res| (|PredImplies| |a| |b1|))))
                 (SETQ |bfVar#24| (CDR |bfVar#24|))))
              |bl| NIL)
             |res|))
           ((AND (CONSP |a|) (EQ (CAR |a|) 'AND)
                 (PROGN (SETQ |al| (CDR |a|)) #1#))
            (PROGN
             ((LAMBDA (|bfVar#25| |a1|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#25|)
                       (PROGN (SETQ |a1| (CAR |bfVar#25|)) NIL) |res|)
                   (RETURN NIL))
                  (#1# (SETQ |res| (|PredImplies| |a1| |b|))))
                 (SETQ |bfVar#25| (CDR |bfVar#25|))))
              |al| NIL)
             |res|))
           (#1# NIL)))))
 
; SigListOpSubsume([[name1,sig1,:.],:.],list) ==
;   --does m subsume another operator in the list?
;         --see "operator subsumption" in SYSTEM SCRIPT
;         --if it does, returns the subsumed member
;   lsig1:=LENGTH sig1
;   ans:=[]
;   for (n:=[[name2,sig2,:.],:.]) in list repeat
;     EQ(name1, name2) and EQL(lsig1,LENGTH sig2) and SourceLevelSubsume(sig1,sig2) =>
;       ans:=[n,:ans]
;   return ans
 
(DEFUN |SigListOpSubsume| (|bfVar#27| LIST)
  (PROG (|name1| |sig1| |lsig1| |ans| |ISTMP#1| |name2| |ISTMP#2| |sig2|)
    (RETURN
     (PROGN
      (SETQ |name1| (CAAR . #1=(|bfVar#27|)))
      (SETQ |sig1| (CADAR . #1#))
      (SETQ |lsig1| (LENGTH |sig1|))
      (SETQ |ans| NIL)
      ((LAMBDA (|bfVar#26| |n|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#26|) (PROGN (SETQ |n| (CAR |bfVar#26|)) NIL))
            (RETURN NIL))
           (#2='T
            (AND (CONSP |n|)
                 (PROGN
                  (SETQ |ISTMP#1| (CAR |n|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |name2| (CAR |ISTMP#1|))
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|)
                             (PROGN (SETQ |sig2| (CAR |ISTMP#2|)) #2#)))))
                 (COND
                  ((AND (EQ |name1| |name2|) (EQL |lsig1| (LENGTH |sig2|))
                        (|SourceLevelSubsume| |sig1| |sig2|))
                   (IDENTITY (SETQ |ans| (CONS |n| |ans|))))))))
          (SETQ |bfVar#26| (CDR |bfVar#26|))))
       LIST NIL)
      (RETURN |ans|)))))
 
; SourceLevelSubsume([out1,:in1],[out2,:in2]) ==
;   -- Checks for source-level subsumption in the sense of SYSTEM SCRIPT
;   --   true if the first signature subsumes the second
;   SourceLevelSubset(out1,out2) and
;     (and/[SourceLevelSubset(inarg2,inarg1) for inarg1 in in1 for inarg2 in in2])
 
(DEFUN |SourceLevelSubsume| (|bfVar#31| |bfVar#32|)
  (PROG (|out2| |in2| |out1| |in1|)
    (RETURN
     (PROGN
      (SETQ |out2| (CAR |bfVar#32|))
      (SETQ |in2| (CDR |bfVar#32|))
      (SETQ |out1| (CAR |bfVar#31|))
      (SETQ |in1| (CDR |bfVar#31|))
      (AND (|SourceLevelSubset| |out1| |out2|)
           ((LAMBDA (|bfVar#30| |bfVar#28| |inarg1| |bfVar#29| |inarg2|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#28|)
                     (PROGN (SETQ |inarg1| (CAR |bfVar#28|)) NIL)
                     (ATOM |bfVar#29|)
                     (PROGN (SETQ |inarg2| (CAR |bfVar#29|)) NIL))
                 (RETURN |bfVar#30|))
                ('T
                 (PROGN
                  (SETQ |bfVar#30| (|SourceLevelSubset| |inarg2| |inarg1|))
                  (COND ((NOT |bfVar#30|) (RETURN NIL))))))
               (SETQ |bfVar#28| (CDR |bfVar#28|))
               (SETQ |bfVar#29| (CDR |bfVar#29|))))
            T |in1| NIL |in2| NIL))))))
 
; SourceLevelSubset(a,b) ==
;   --true if a is a source-level subset of b
;   a=b => true
;   false
 
(DEFUN |SourceLevelSubset| (|a| |b|)
  (PROG () (RETURN (COND ((EQUAL |a| |b|) T) ('T NIL)))))
 
; get_cond(x) ==
;     rest(x) => CADR x
;     true
 
(DEFUN |get_cond| (|x|) (PROG () (RETURN (COND ((CDR |x|) (CADR |x|)) ('T T)))))
 
; FindFundAncs l ==
;   --l is a list of categories and associated conditions (a list of 2-lists
;   --returns a list of them and all their fundamental ancestors
;   --also as two-lists with the appropriate conditions
;   l=nil => nil
;   [l1, cond1] := first l
;   f1:= CatEval l1
;   ans := FindFundAncs rest l
;   -- Does not work with Shoe (garbage items ???)
;   --  ll := [[CatEval xf, mkAnd(cond1, xc)] for [xf, xc] in CADR f1.4]
;   ll := [[CatEval first x, mkAnd(cond1, get_cond(x))] for x in CADR f1.4]
;   for u in ll repeat
;         [u1, uc] := u
;         x:= ASSQ(u1, ans) =>
;             ans:= [[u1, mkOr(CADR x, uc)],:delete(x,ans)]
;         ans:= [u,:ans]
;   f1.(0) = nil => ans
;   --testing to see if l1 is already there
;   x := ASSQ(l1, ans) => [[l1, mkOr(cond1, CADR x)],:delete(x,ans)]
;   cond1 = true =>
;       for x in first f1.4 repeat
;             if y:= ASSQ(CatEval x,ans) then ans:= delete(y,ans)
;       [first l,:ans]
;   for x in first f1.4 repeat
;     if y:= ASSQ(CatEval x,ans) then ans:=
;       [[first y, mkOr(cond1, CADR y)], :delete(y, ans)]
;   [first l,:ans]
 
(DEFUN |FindFundAncs| (|l|)
  (PROG (|LETTMP#1| |l1| |cond1| |f1| |ans| |ll| |u1| |uc| |x| |y|)
    (RETURN
     (COND ((NULL |l|) NIL)
           (#1='T
            (PROGN
             (SETQ |LETTMP#1| (CAR |l|))
             (SETQ |l1| (CAR |LETTMP#1|))
             (SETQ |cond1| (CADR |LETTMP#1|))
             (SETQ |f1| (|CatEval| |l1|))
             (SETQ |ans| (|FindFundAncs| (CDR |l|)))
             (SETQ |ll|
                     ((LAMBDA (|bfVar#34| |bfVar#33| |x|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#33|)
                               (PROGN (SETQ |x| (CAR |bfVar#33|)) NIL))
                           (RETURN (NREVERSE |bfVar#34|)))
                          (#1#
                           (SETQ |bfVar#34|
                                   (CONS
                                    (LIST (|CatEval| (CAR |x|))
                                          (|mkAnd| |cond1| (|get_cond| |x|)))
                                    |bfVar#34|))))
                         (SETQ |bfVar#33| (CDR |bfVar#33|))))
                      NIL (CADR (ELT |f1| 4)) NIL))
             ((LAMBDA (|bfVar#35| |u|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#35|)
                       (PROGN (SETQ |u| (CAR |bfVar#35|)) NIL))
                   (RETURN NIL))
                  (#1#
                   (PROGN
                    (SETQ |u1| (CAR |u|))
                    (SETQ |uc| (CADR |u|))
                    (COND
                     ((SETQ |x| (ASSQ |u1| |ans|))
                      (SETQ |ans|
                              (CONS (LIST |u1| (|mkOr| (CADR |x|) |uc|))
                                    (|delete| |x| |ans|))))
                     (#1# (SETQ |ans| (CONS |u| |ans|)))))))
                 (SETQ |bfVar#35| (CDR |bfVar#35|))))
              |ll| NIL)
             (COND ((NULL (ELT |f1| 0)) |ans|)
                   ((SETQ |x| (ASSQ |l1| |ans|))
                    (CONS (LIST |l1| (|mkOr| |cond1| (CADR |x|)))
                          (|delete| |x| |ans|)))
                   ((EQUAL |cond1| T)
                    (PROGN
                     ((LAMBDA (|bfVar#36| |x|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#36|)
                               (PROGN (SETQ |x| (CAR |bfVar#36|)) NIL))
                           (RETURN NIL))
                          (#1#
                           (COND
                            ((SETQ |y| (ASSQ (|CatEval| |x|) |ans|))
                             (SETQ |ans| (|delete| |y| |ans|))))))
                         (SETQ |bfVar#36| (CDR |bfVar#36|))))
                      (CAR (ELT |f1| 4)) NIL)
                     (CONS (CAR |l|) |ans|)))
                   (#1#
                    (PROGN
                     ((LAMBDA (|bfVar#37| |x|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#37|)
                               (PROGN (SETQ |x| (CAR |bfVar#37|)) NIL))
                           (RETURN NIL))
                          (#1#
                           (COND
                            ((SETQ |y| (ASSQ (|CatEval| |x|) |ans|))
                             (SETQ |ans|
                                     (CONS
                                      (LIST (CAR |y|)
                                            (|mkOr| |cond1| (CADR |y|)))
                                      (|delete| |y| |ans|)))))))
                         (SETQ |bfVar#37| (CDR |bfVar#37|))))
                      (CAR (ELT |f1| 4)) NIL)
                     (CONS (CAR |l|) |ans|))))))))))
 
; CatEval x ==
;   REFVECP x => x
;   $InteractiveMode => first compMakeCategoryObject(x, $CategoryFrame)
;   first compMakeCategoryObject(x, $e)
 
(DEFUN |CatEval| (|x|)
  (PROG ()
    (RETURN
     (COND ((REFVECP |x|) |x|)
           (|$InteractiveMode|
            (CAR (|compMakeCategoryObject| |x| |$CategoryFrame|)))
           ('T (CAR (|compMakeCategoryObject| |x| |$e|)))))))
 
; AncestorP(xname,leaves) ==
;   -- checks for being a principal ancestor of one of the leaves
;   member(xname,leaves) => xname
;   for y in leaves repeat
;     member(xname,first (CatEval y).4) => return y
 
(DEFUN |AncestorP| (|xname| |leaves|)
  (PROG ()
    (RETURN
     (COND ((|member| |xname| |leaves|) |xname|)
           (#1='T
            ((LAMBDA (|bfVar#38| |y|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#38|)
                      (PROGN (SETQ |y| (CAR |bfVar#38|)) NIL))
                  (RETURN NIL))
                 (#1#
                  (COND
                   ((|member| |xname| (CAR (ELT (|CatEval| |y|) 4)))
                    (IDENTITY (RETURN |y|))))))
                (SETQ |bfVar#38| (CDR |bfVar#38|))))
             |leaves| NIL))))))
 
; CondAncestorP(xname,leaves,condition) ==
;   -- checks for being a principal ancestor of one of the leaves
;   for u in leaves repeat
;     u':=first u
;     ucond:=
;       null rest u => true
;       first rest u
;     xname = u' or member(xname,first (CatEval u').4) =>
;       PredImplies(condition, ucond) => return u'
 
(DEFUN |CondAncestorP| (|xname| |leaves| |condition|)
  (PROG (|u'| |ucond|)
    (RETURN
     ((LAMBDA (|bfVar#39| |u|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#39|) (PROGN (SETQ |u| (CAR |bfVar#39|)) NIL))
           (RETURN NIL))
          (#1='T
           (PROGN
            (SETQ |u'| (CAR |u|))
            (SETQ |ucond| (COND ((NULL (CDR |u|)) T) (#1# (CAR (CDR |u|)))))
            (COND
             ((OR (EQUAL |xname| |u'|)
                  (|member| |xname| (CAR (ELT (|CatEval| |u'|) 4))))
              (COND
               ((|PredImplies| |condition| |ucond|)
                (IDENTITY (RETURN |u'|)))))))))
         (SETQ |bfVar#39| (CDR |bfVar#39|))))
      |leaves| NIL))))
 
; DescendantP(a,b) ==
;   -- checks to see if a is any kind of Descendant of b
;   a=b => true
;   a is ["ATTRIBUTE",:.] => BREAK()
;   a is ["SIGNATURE",:.] => nil
;   a:= CatEval a
;   b is ["ATTRIBUTE",b'] => BREAK()
;   member(b,first a.4) => true
;   AncestorP(b,[first u for u in CADR a.4]) => true
;   nil
 
(DEFUN |DescendantP| (|a| |b|)
  (PROG (|ISTMP#1| |b'|)
    (RETURN
     (COND ((EQUAL |a| |b|) T)
           ((AND (CONSP |a|) (EQ (CAR |a|) 'ATTRIBUTE)) (BREAK))
           ((AND (CONSP |a|) (EQ (CAR |a|) 'SIGNATURE)) NIL)
           (#1='T
            (PROGN
             (SETQ |a| (|CatEval| |a|))
             (COND
              ((AND (CONSP |b|) (EQ (CAR |b|) 'ATTRIBUTE)
                    (PROGN
                     (SETQ |ISTMP#1| (CDR |b|))
                     (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                          (PROGN (SETQ |b'| (CAR |ISTMP#1|)) #1#))))
               (BREAK))
              ((|member| |b| (CAR (ELT |a| 4))) T)
              ((|AncestorP| |b|
                ((LAMBDA (|bfVar#41| |bfVar#40| |u|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#40|)
                          (PROGN (SETQ |u| (CAR |bfVar#40|)) NIL))
                      (RETURN (NREVERSE |bfVar#41|)))
                     (#1# (SETQ |bfVar#41| (CONS (CAR |u|) |bfVar#41|))))
                    (SETQ |bfVar#40| (CDR |bfVar#40|))))
                 NIL (CADR (ELT |a| 4)) NIL))
               T)
              (#1# NIL))))))))
 
; simplify_cond1(catname, cond) ==
;     -- FIXME: this is ugly hack to get around compiler bug.
;     -- Namely, sometimes '$' is not what it should be...
;     $compForModeIfTrue => cond
;     cond is ["has", "$", =catname] => nil
;     cond is ["OR", :l] =>
;         rl := []
;         for c1 in l repeat
;             nc := simplify_cond1(catname, c1)
;             not(nc) => "iterate"
;             rl := cons(nc, rl)
;         rl = [] => nil
;         #rl = 1 => first(rl)
;         ["OR", :rl]
;     cond is ["AND", :l] =>
;         rl := []
;         for c1 in l repeat
;             nc := simplify_cond1(catname, c1)
;             not(nc) =>
;                 rl := [nil]
;                 return nil
;             rl := cons(nc, rl)
;         rl = [] => true
;         #rl = 1 => first(rl)
;         ["AND", :rl]
;     cond
 
(DEFUN |simplify_cond1| (|catname| |cond|)
  (PROG (|ISTMP#1| |ISTMP#2| |l| |rl| |nc|)
    (RETURN
     (COND (|$compForModeIfTrue| |cond|)
           ((AND (CONSP |cond|) (EQ (CAR |cond|) '|has|)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |cond|))
                  (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '$)
                       (PROGN
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                             (EQUAL (CAR |ISTMP#2|) |catname|))))))
            NIL)
           ((AND (CONSP |cond|) (EQ (CAR |cond|) 'OR)
                 (PROGN (SETQ |l| (CDR |cond|)) #1='T))
            (PROGN
             (SETQ |rl| NIL)
             ((LAMBDA (|bfVar#42| |c1|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#42|)
                       (PROGN (SETQ |c1| (CAR |bfVar#42|)) NIL))
                   (RETURN NIL))
                  (#1#
                   (PROGN
                    (SETQ |nc| (|simplify_cond1| |catname| |c1|))
                    (COND ((NULL |nc|) '|iterate|)
                          (#1# (SETQ |rl| (CONS |nc| |rl|)))))))
                 (SETQ |bfVar#42| (CDR |bfVar#42|))))
              |l| NIL)
             (COND ((NULL |rl|) NIL) ((EQL (LENGTH |rl|) 1) (CAR |rl|))
                   (#1# (CONS 'OR |rl|)))))
           ((AND (CONSP |cond|) (EQ (CAR |cond|) 'AND)
                 (PROGN (SETQ |l| (CDR |cond|)) #1#))
            (PROGN
             (SETQ |rl| NIL)
             ((LAMBDA (|bfVar#43| |c1|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#43|)
                       (PROGN (SETQ |c1| (CAR |bfVar#43|)) NIL))
                   (RETURN NIL))
                  (#1#
                   (PROGN
                    (SETQ |nc| (|simplify_cond1| |catname| |c1|))
                    (COND
                     ((NULL |nc|) (PROGN (SETQ |rl| (LIST NIL)) (RETURN NIL)))
                     (#1# (SETQ |rl| (CONS |nc| |rl|)))))))
                 (SETQ |bfVar#43| (CDR |bfVar#43|))))
              |l| NIL)
             (COND ((NULL |rl|) T) ((EQL (LENGTH |rl|) 1) (CAR |rl|))
                   (#1# (CONS 'AND |rl|)))))
           (#1# |cond|)))))
 
; simplify_cond2(vec, cond) ==
;     vec.(0) = nil => cond
;     simplify_cond1(vec.(0), cond)
 
(DEFUN |simplify_cond2| (|vec| |cond|)
  (PROG ()
    (RETURN
     (COND ((NULL (ELT |vec| 0)) |cond|)
           ('T (|simplify_cond1| (ELT |vec| 0) |cond|))))))
 
; join_fundamental_ancestors(vec0, l) ==
;   FundamentalAncestors := [[v, c] for x in CADR vec0.4 | (v := first x;
;                               c := simplify_cond2(v, get_cond(x)))]
;   if vec0.(0) then FundamentalAncestors:=
;     [[vec0.(0)],:FundamentalAncestors]
;                     --principal ancestor . all those already included
;   -- Copy to avoid corrupting original vector
; 
;   for [b, condition] in FindFundAncs l repeat
;       --This loop implements Category Subsumption
;           --as described in SYSTEM SCRIPT
;     if not (b.(0)=nil) then
;                    --It's a named category
;       bname:= b.(0)
;       condition := simplify_cond1(bname, condition)
;       not(condition) => "iterate"
;       CondAncestorP(bname,FundamentalAncestors,condition) => nil
;       if (uu := ASSQ(bname, FundamentalAncestors)) then
;           FundamentalAncestors := delete(uu, FundamentalAncestors)
;           condition := mkOr(condition, CADR(uu))
;       PrinAncb:= first(b.4)
;                --Principal Ancestors of b
;       for anc in FundamentalAncestors repeat
;         if member(first anc,PrinAncb) then
;                   --This is the check for "Category Subsumption"
;           anccond :=
;               rest anc => CADR anc
;               true
;           if PredImplies(anccond, condition) then
;               -- the new 'b' is more often true than the old one 'anc'
;               FundamentalAncestors := delete(anc, FundamentalAncestors)
;       FundamentalAncestors := [[b.(0), condition], :FundamentalAncestors]
;   FundamentalAncestors
 
(DEFUN |join_fundamental_ancestors| (|vec0| |l|)
  (PROG (|v| |c| |FundamentalAncestors| |b| |ISTMP#1| |condition| |bname| |uu|
         |PrinAncb| |anccond|)
    (RETURN
     (PROGN
      (SETQ |FundamentalAncestors|
              ((LAMBDA (|bfVar#45| |bfVar#44| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#44|)
                        (PROGN (SETQ |x| (CAR |bfVar#44|)) NIL))
                    (RETURN (NREVERSE |bfVar#45|)))
                   (#1='T
                    (AND
                     (PROGN
                      (SETQ |v| (CAR |x|))
                      (SETQ |c| (|simplify_cond2| |v| (|get_cond| |x|))))
                     (SETQ |bfVar#45| (CONS (LIST |v| |c|) |bfVar#45|)))))
                  (SETQ |bfVar#44| (CDR |bfVar#44|))))
               NIL (CADR (ELT |vec0| 4)) NIL))
      (COND
       ((ELT |vec0| 0)
        (SETQ |FundamentalAncestors|
                (CONS (LIST (ELT |vec0| 0)) |FundamentalAncestors|))))
      ((LAMBDA (|bfVar#47| |bfVar#46|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#47|)
                (PROGN (SETQ |bfVar#46| (CAR |bfVar#47|)) NIL))
            (RETURN NIL))
           (#1#
            (AND (CONSP |bfVar#46|)
                 (PROGN
                  (SETQ |b| (CAR |bfVar#46|))
                  (SETQ |ISTMP#1| (CDR |bfVar#46|))
                  (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                       (PROGN (SETQ |condition| (CAR |ISTMP#1|)) #1#)))
                 (COND
                  ((NULL (NULL (ELT |b| 0))) (SETQ |bname| (ELT |b| 0))
                   (SETQ |condition| (|simplify_cond1| |bname| |condition|))
                   (COND ((NULL |condition|) '|iterate|)
                         ((|CondAncestorP| |bname| |FundamentalAncestors|
                           |condition|)
                          NIL)
                         (#1#
                          (PROGN
                           (COND
                            ((SETQ |uu| (ASSQ |bname| |FundamentalAncestors|))
                             (SETQ |FundamentalAncestors|
                                     (|delete| |uu| |FundamentalAncestors|))
                             (SETQ |condition|
                                     (|mkOr| |condition| (CADR |uu|)))))
                           (SETQ |PrinAncb| (CAR (ELT |b| 4)))
                           ((LAMBDA (|bfVar#48| |anc|)
                              (LOOP
                               (COND
                                ((OR (ATOM |bfVar#48|)
                                     (PROGN (SETQ |anc| (CAR |bfVar#48|)) NIL))
                                 (RETURN NIL))
                                (#1#
                                 (COND
                                  ((|member| (CAR |anc|) |PrinAncb|)
                                   (SETQ |anccond|
                                           (COND ((CDR |anc|) (CADR |anc|))
                                                 (#1# T)))
                                   (COND
                                    ((|PredImplies| |anccond| |condition|)
                                     (SETQ |FundamentalAncestors|
                                             (|delete| |anc|
                                              |FundamentalAncestors|))))))))
                               (SETQ |bfVar#48| (CDR |bfVar#48|))))
                            |FundamentalAncestors| NIL)
                           (SETQ |FundamentalAncestors|
                                   (CONS (LIST (ELT |b| 0) |condition|)
                                         |FundamentalAncestors|))))))))))
          (SETQ |bfVar#47| (CDR |bfVar#47|))))
       (|FindFundAncs| |l|) NIL)
      |FundamentalAncestors|))))
 
; JoinInner(l,$e) ==
;   NewCatVec := nil
;   CondList := nil
;   for u in l repeat
;     for at in u.2 repeat
;       at2:= first at
;       if atom at2 then BREAK()
;       null isCategoryForm(at2,$e) => BREAK()
; 
;       pred:= first rest at
;         -- The predicate under which this category is conditional
;       -- member(pred,get("$Information","special",$e)) => l:= [:l,CatEval at2]
;           --It's true, so we add this as unconditional
;       -- not (pred is ["and",:.]) => CondList:= [[CatEval at2,pred],:CondList]
;       CondList:= [[CatEval at2,pred],:CondList]
;   [NewCatVec, :l] := l
;   l':= [:CondList,:[[u,true] for u in l]]
;     -- This is a list of all the categories that this extends
;     -- conditionally or unconditionally
;   sigl := NewCatVec.(1)
;   globalDomains := NewCatVec.5
;   NewCatVec := COPY_-SEQ NewCatVec
;   FundamentalAncestors := join_fundamental_ancestors(NewCatVec, l')
; 
;   for b in l repeat
;     sigl:= SigListUnion([DropImplementations u for u in b.(1)],sigl)
;     globalDomains:= [:globalDomains,:S_-(b.5,globalDomains)]
;   for b in CondList repeat
;     newpred:= first rest b
;     sigl:=
;       SigListUnion(
;         [AddPredicate(DropImplementations u,newpred) for u in (first b).(1)],sigl) where
;           AddPredicate(op is [sig,oldpred,:implem],newpred) ==
;             newpred=true => op
;             oldpred=true => [sig,newpred,:implem]
;             [sig,MKPF([oldpred,newpred],"and"),:implem]
;   c := first NewCatVec.4
;   pName := NewCatVec.(0)
;   if pName and not member(pName,c) then c:= [pName,:c]
;   -- strip out the pointer to Principal Ancestor
;   if pName then
;       FundamentalAncestors :=
;           [x for x in FundamentalAncestors | first(x) ~= pName]
;   NewCatVec.4 := [c,FundamentalAncestors, CADDR NewCatVec.4]
;   mkCategory(sigl, nil, globalDomains, NewCatVec)
 
(DEFUN |JoinInner| (|l| |$e|)
  (DECLARE (SPECIAL |$e|))
  (PROG (|NewCatVec| |CondList| |at2| |pred| |LETTMP#1| |l'| |sigl|
         |globalDomains| |FundamentalAncestors| |newpred| |c| |pName|)
    (RETURN
     (PROGN
      (SETQ |NewCatVec| NIL)
      (SETQ |CondList| NIL)
      ((LAMBDA (|bfVar#49| |u|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#49|) (PROGN (SETQ |u| (CAR |bfVar#49|)) NIL))
            (RETURN NIL))
           (#1='T
            ((LAMBDA (|bfVar#50| |at|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#50|)
                      (PROGN (SETQ |at| (CAR |bfVar#50|)) NIL))
                  (RETURN NIL))
                 (#1#
                  (PROGN
                   (SETQ |at2| (CAR |at|))
                   (COND ((ATOM |at2|) (BREAK)))
                   (COND ((NULL (|isCategoryForm| |at2| |$e|)) (BREAK))
                         (#1#
                          (PROGN
                           (SETQ |pred| (CAR (CDR |at|)))
                           (SETQ |CondList|
                                   (CONS (LIST (|CatEval| |at2|) |pred|)
                                         |CondList|))))))))
                (SETQ |bfVar#50| (CDR |bfVar#50|))))
             (ELT |u| 2) NIL)))
          (SETQ |bfVar#49| (CDR |bfVar#49|))))
       |l| NIL)
      (SETQ |LETTMP#1| |l|)
      (SETQ |NewCatVec| (CAR |LETTMP#1|))
      (SETQ |l| (CDR |LETTMP#1|))
      (SETQ |l'|
              (APPEND |CondList|
                      ((LAMBDA (|bfVar#52| |bfVar#51| |u|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#51|)
                                (PROGN (SETQ |u| (CAR |bfVar#51|)) NIL))
                            (RETURN (NREVERSE |bfVar#52|)))
                           (#1#
                            (SETQ |bfVar#52| (CONS (LIST |u| T) |bfVar#52|))))
                          (SETQ |bfVar#51| (CDR |bfVar#51|))))
                       NIL |l| NIL)))
      (SETQ |sigl| (ELT |NewCatVec| 1))
      (SETQ |globalDomains| (ELT |NewCatVec| 5))
      (SETQ |NewCatVec| (COPY-SEQ |NewCatVec|))
      (SETQ |FundamentalAncestors|
              (|join_fundamental_ancestors| |NewCatVec| |l'|))
      ((LAMBDA (|bfVar#53| |b|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#53|) (PROGN (SETQ |b| (CAR |bfVar#53|)) NIL))
            (RETURN NIL))
           (#1#
            (PROGN
             (SETQ |sigl|
                     (|SigListUnion|
                      ((LAMBDA (|bfVar#55| |bfVar#54| |u|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#54|)
                                (PROGN (SETQ |u| (CAR |bfVar#54|)) NIL))
                            (RETURN (NREVERSE |bfVar#55|)))
                           (#1#
                            (SETQ |bfVar#55|
                                    (CONS (|DropImplementations| |u|)
                                          |bfVar#55|))))
                          (SETQ |bfVar#54| (CDR |bfVar#54|))))
                       NIL (ELT |b| 1) NIL)
                      |sigl|))
             (SETQ |globalDomains|
                     (APPEND |globalDomains|
                             (S- (ELT |b| 5) |globalDomains|))))))
          (SETQ |bfVar#53| (CDR |bfVar#53|))))
       |l| NIL)
      ((LAMBDA (|bfVar#56| |b|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#56|) (PROGN (SETQ |b| (CAR |bfVar#56|)) NIL))
            (RETURN NIL))
           (#1#
            (PROGN
             (SETQ |newpred| (CAR (CDR |b|)))
             (SETQ |sigl|
                     (|SigListUnion|
                      ((LAMBDA (|bfVar#58| |bfVar#57| |u|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#57|)
                                (PROGN (SETQ |u| (CAR |bfVar#57|)) NIL))
                            (RETURN (NREVERSE |bfVar#58|)))
                           (#1#
                            (SETQ |bfVar#58|
                                    (CONS
                                     (|JoinInner,AddPredicate|
                                      (|DropImplementations| |u|) |newpred|)
                                     |bfVar#58|))))
                          (SETQ |bfVar#57| (CDR |bfVar#57|))))
                       NIL (ELT (CAR |b|) 1) NIL)
                      |sigl|)))))
          (SETQ |bfVar#56| (CDR |bfVar#56|))))
       |CondList| NIL)
      (SETQ |c| (CAR (ELT |NewCatVec| 4)))
      (SETQ |pName| (ELT |NewCatVec| 0))
      (COND
       ((AND |pName| (NULL (|member| |pName| |c|)))
        (SETQ |c| (CONS |pName| |c|))))
      (COND
       (|pName|
        (SETQ |FundamentalAncestors|
                ((LAMBDA (|bfVar#60| |bfVar#59| |x|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#59|)
                          (PROGN (SETQ |x| (CAR |bfVar#59|)) NIL))
                      (RETURN (NREVERSE |bfVar#60|)))
                     (#1#
                      (AND (NOT (EQUAL (CAR |x|) |pName|))
                           (SETQ |bfVar#60| (CONS |x| |bfVar#60|)))))
                    (SETQ |bfVar#59| (CDR |bfVar#59|))))
                 NIL |FundamentalAncestors| NIL))))
      (SETF (ELT |NewCatVec| 4)
              (LIST |c| |FundamentalAncestors| (CADDR (ELT |NewCatVec| 4))))
      (|mkCategory| |sigl| NIL |globalDomains| |NewCatVec|)))))
(DEFUN |JoinInner,AddPredicate| (|op| |newpred|)
  (PROG (|sig| |oldpred| |implem|)
    (RETURN
     (PROGN
      (SETQ |sig| (CAR |op|))
      (SETQ |oldpred| (CADR . #1=(|op|)))
      (SETQ |implem| (CDDR . #1#))
      (COND ((EQUAL |newpred| T) |op|)
            ((EQUAL |oldpred| T) (CONS |sig| (CONS |newpred| |implem|)))
            ('T
             (CONS |sig|
                   (CONS (MKPF (LIST |oldpred| |newpred|) '|and|)
                         |implem|))))))))
 
; Join(:L) ==
;   env :=
;      not(BOUNDP('$e)) or NULL($e) or $InteractiveMode => $CategoryFrame
;      $e
;   JoinInner(L, env)
 
(DEFUN |Join| (&REST L)
  (PROG (|env|)
    (RETURN
     (PROGN
      (SETQ |env|
              (COND
               ((OR (NULL (BOUNDP '|$e|)) (NULL |$e|) |$InteractiveMode|)
                |$CategoryFrame|)
               ('T |$e|)))
      (|JoinInner| L |env|)))))
 
; isCategoryForm(x,e) ==
;   x is [name,:.] => categoryForm? name
;   atom x => u:= get(x,"macro",e) => isCategoryForm(u,e)
 
(DEFUN |isCategoryForm| (|x| |e|)
  (PROG (|name| |u|)
    (RETURN
     (COND
      ((AND (CONSP |x|) (PROGN (SETQ |name| (CAR |x|)) 'T))
       (|categoryForm?| |name|))
      ((ATOM |x|)
       (COND
        ((SETQ |u| (|get| |x| '|macro| |e|))
         (IDENTITY (|isCategoryForm| |u| |e|)))))))))
