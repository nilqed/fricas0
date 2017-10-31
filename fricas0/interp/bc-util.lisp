 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; bcFinish(name,arg,:args) == bcGen bcMkFunction(name,arg,args)
 
(DEFUN |bcFinish| (|name| |arg| &REST |args|)
  (PROG () (RETURN (|bcGen| (|bcMkFunction| |name| |arg| |args|)))))
 
; bcMkFunction(name,arg,args) ==
;   args := [x for x in args | x]
;   STRCONC(name,'"(",arg,"STRCONC"/[STRCONC('",", x) for x in args],'")")
 
(DEFUN |bcMkFunction| (|name| |arg| |args|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |args|
              ((LAMBDA (|bfVar#2| |bfVar#1| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#1|)
                        (PROGN (SETQ |x| (CAR |bfVar#1|)) NIL))
                    (RETURN (NREVERSE |bfVar#2|)))
                   (#1='T (AND |x| (SETQ |bfVar#2| (CONS |x| |bfVar#2|)))))
                  (SETQ |bfVar#1| (CDR |bfVar#1|))))
               NIL |args| NIL))
      (STRCONC |name| "(" |arg|
       ((LAMBDA (|bfVar#4| |bfVar#3| |x|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#3|) (PROGN (SETQ |x| (CAR |bfVar#3|)) NIL))
             (RETURN |bfVar#4|))
            (#1# (SETQ |bfVar#4| (STRCONC |bfVar#4| (STRCONC "," |x|)))))
           (SETQ |bfVar#3| (CDR |bfVar#3|))))
        "" |args| NIL)
       ")")))))
 
; bcString2HyString2 s ==
;   (STRINGP s) and (s.0 = char '_")  =>
;     len := #s
;     STRCONC('"\_"", SUBSTRING(s, 1, len-2), '"\_"")
;   s
 
(DEFUN |bcString2HyString2| (|s|)
  (PROG (|len|)
    (RETURN
     (COND
      ((AND (STRINGP |s|) (EQUAL (ELT |s| 0) (|char| '|"|)))
       (PROGN
        (SETQ |len| (LENGTH |s|))
        (STRCONC "\\\"" (SUBSTRING |s| 1 (- |len| 2)) "\\\"")))
      ('T |s|)))))
 
; bcString2HyString s == s
 
(DEFUN |bcString2HyString| (|s|) (PROG () (RETURN |s|)))
 
; bcFindString(s,i,n,char) ==  or/[j for j in i..n | s.j = char]
 
(DEFUN |bcFindString| (|s| |i| |n| |char|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#5| |j|)
        (LOOP
         (COND ((> |j| |n|) (RETURN |bfVar#5|))
               ('T
                (AND (EQUAL (ELT |s| |j|) |char|)
                     (PROGN
                      (SETQ |bfVar#5| |j|)
                      (COND (|bfVar#5| (RETURN |bfVar#5|)))))))
         (SETQ |j| (+ |j| 1))))
      NIL |i|))))
 
; bcGen command ==
;   htInitPage('"Basic Command",nil)
;   string :=
;     #command < 50 => STRCONC('"{\centerline{\tt ",command,'" }}")
;     STRCONC('"{\tt ",command,'" }")
;   htMakePage [
;      '(text
;         "{Here is the FriCAS command you could have issued to compute this result:}"
;             "\vspace{2}\newline "),
;       ['text,:string]]
;   htMakeDoitButton('"Do It", command)
;   htShowPage()
 
(DEFUN |bcGen| (|command|)
  (PROG (|string|)
    (RETURN
     (PROGN
      (|htInitPage| "Basic Command" NIL)
      (SETQ |string|
              (COND
               ((< (LENGTH |command|) 50)
                (STRCONC "{\\centerline{\\tt " |command| " }}"))
               ('T (STRCONC "{\\tt " |command| " }"))))
      (|htMakePage|
       (LIST
        '(|text|
          "{Here is the FriCAS command you could have issued to compute this result:}"
          "\\vspace{2}\\newline ")
        (CONS '|text| |string|)))
      (|htMakeDoitButton| "Do It" |command|)
      (|htShowPage|)))))
 
; bcOptional s ==
;   s = '"" => '"2"
;   s
 
(DEFUN |bcOptional| (|s|)
  (PROG () (RETURN (COND ((EQUAL |s| "") "2") ('T |s|)))))
 
; bcvspace() == bcHt '"\vspace{1}\newline "
 
(DEFUN |bcvspace| #1=() (PROG #1# (RETURN (|bcHt| "\\vspace{1}\\newline "))))
 
; bcString2WordList s == fn(s,0,MAXINDEX s) where
;   fn(s,i,n) ==
;     i > n => nil
;     k := or/[j for j in i..n | s.j ~= char '_  ]
;     null INTEGERP k => nil
;     l := bcFindString(s,k + 1,n,char '_  )
;     null INTEGERP l => [SUBSTRING(s,k,nil)]
;     [SUBSTRING(s,k,l-k),:fn(s,l + 1,n)]
 
(DEFUN |bcString2WordList| (|s|)
  (PROG () (RETURN (|bcString2WordList,fn| |s| 0 (MAXINDEX |s|)))))
(DEFUN |bcString2WordList,fn| (|s| |i| |n|)
  (PROG (|k| |l|)
    (RETURN
     (COND ((< |n| |i|) NIL)
           (#1='T
            (PROGN
             (SETQ |k|
                     ((LAMBDA (|bfVar#6| |j|)
                        (LOOP
                         (COND ((> |j| |n|) (RETURN |bfVar#6|))
                               (#1#
                                (AND (NOT (EQUAL (ELT |s| |j|) (|char| '| |)))
                                     (PROGN
                                      (SETQ |bfVar#6| |j|)
                                      (COND (|bfVar#6| (RETURN |bfVar#6|)))))))
                         (SETQ |j| (+ |j| 1))))
                      NIL |i|))
             (COND ((NULL (INTEGERP |k|)) NIL)
                   (#1#
                    (PROGN
                     (SETQ |l|
                             (|bcFindString| |s| (+ |k| 1) |n| (|char| '| |)))
                     (COND
                      ((NULL (INTEGERP |l|)) (LIST (SUBSTRING |s| |k| NIL)))
                      (#1#
                       (CONS (SUBSTRING |s| |k| (- |l| |k|))
                             (|bcString2WordList,fn| |s| (+ |l| 1)
                              |n|)))))))))))))
 
; bcwords2liststring u ==
;   null u => nil
;   STRCONC('"[",first u,fn rest u) where
;     fn(u) ==
;       null u => '"]"
;       STRCONC('", ",first u,fn rest u)
 
(DEFUN |bcwords2liststring| (|u|)
  (PROG ()
    (RETURN
     (COND ((NULL |u|) NIL)
           ('T (STRCONC "[" (CAR |u|) (|bcwords2liststring,fn| (CDR |u|))))))))
(DEFUN |bcwords2liststring,fn| (|u|)
  (PROG ()
    (RETURN
     (COND ((NULL |u|) "]")
           ('T (STRCONC ", " (CAR |u|) (|bcwords2liststring,fn| (CDR |u|))))))))
 
; bcVectorGen vec == bcwords2liststring vec
 
(DEFUN |bcVectorGen| (|vec|) (PROG () (RETURN (|bcwords2liststring| |vec|))))
 
; bcError string ==
;   sayBrightlyNT '"NOTE: "
;   sayBrightly string
 
(DEFUN |bcError| (|string|)
  (PROG ()
    (RETURN (PROGN (|sayBrightlyNT| "NOTE: ") (|sayBrightly| |string|)))))
 
; bcDrawIt(ind,a,b) == STRCONC(ind,'"=",a,'"..",b)
 
(DEFUN |bcDrawIt| (|ind| |a| |b|)
  (PROG () (RETURN (STRCONC |ind| "=" |a| ".." |b|))))
 
; bcNotReady htPage ==
;   htInitPage('"Basic Command",nil)
;   htMakePage '(
;      (text .
;         "{\centerline{\em This facility will soon be available}}"))
;   htShowPage()
 
(DEFUN |bcNotReady| (|htPage|)
  (PROG ()
    (RETURN
     (PROGN
      (|htInitPage| "Basic Command" NIL)
      (|htMakePage|
       '((|text|
          . "{\\centerline{\\em This facility will soon be available}}")))
      (|htShowPage|)))))
 
; htStringPad(n,w) ==
;   s := STRINGIMAGE n
;   ws := #s
;   STRCONC('"\space{",STRINGIMAGE (w - ws + 1),'"}",s)
 
(DEFUN |htStringPad| (|n| |w|)
  (PROG (|s| |ws|)
    (RETURN
     (PROGN
      (SETQ |s| (STRINGIMAGE |n|))
      (SETQ |ws| (LENGTH |s|))
      (STRCONC "\\space{" (STRINGIMAGE (+ (- |w| |ws|) 1)) "}" |s|)))))
 
; stringList2String x ==
;   null x => '"()"
;   STRCONC('"(",first x,"STRCONC"/[STRCONC('",",y) for y in rest x],'")")
 
(DEFUN |stringList2String| (|x|)
  (PROG ()
    (RETURN
     (COND ((NULL |x|) "()")
           (#1='T
            (STRCONC "(" (CAR |x|)
             ((LAMBDA (|bfVar#8| |bfVar#7| |y|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#7|) (PROGN (SETQ |y| (CAR |bfVar#7|)) NIL))
                   (RETURN |bfVar#8|))
                  (#1# (SETQ |bfVar#8| (STRCONC |bfVar#8| (STRCONC "," |y|)))))
                 (SETQ |bfVar#7| (CDR |bfVar#7|))))
              "" (CDR |x|) NIL)
             ")"))))))
 
; htMkName(s,n) == STRCONC(s,STRINGIMAGE n)
 
(DEFUN |htMkName| (|s| |n|) (PROG () (RETURN (STRCONC |s| (STRINGIMAGE |n|)))))
