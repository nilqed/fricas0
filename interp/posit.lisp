
; )package "BOOT"

(IN-PACKAGE "BOOT")

; poNoPosition()    == $nopos

(DEFUN |poNoPosition| () (PROG () (RETURN |$nopos|)))

; pfNoPosition() == poNoPosition()

(DEFUN |pfNoPosition| () (PROG () (RETURN (|poNoPosition|))))

; poNoPosition? pos == EQCAR(pos,'noposition)

(DEFUN |poNoPosition?| (|pos|) (PROG () (RETURN (EQCAR |pos| '|noposition|))))

; pfNoPosition? pos == poNoPosition? pos

(DEFUN |pfNoPosition?| (|pos|) (PROG () (RETURN (|poNoPosition?| |pos|))))

; pfSourceText pf ==
;     lnString poGetLineObject pfPosn pf

(DEFUN |pfSourceText| (|pf|)
  (PROG () (RETURN (|lnString| (|poGetLineObject| (|pfPosn| |pf|))))))

; pfPosOrNopos pf ==
;     poIsPos? (pos := pfSourcePosition pf) => pos
;     poNoPosition()

(DEFUN |pfPosOrNopos| (|pf|)
  (PROG (|pos|)
    (RETURN
     (COND ((|poIsPos?| (SETQ |pos| (|pfSourcePosition| |pf|))) |pos|)
           ('T (|poNoPosition|))))))

; poIsPos? pos ==
;     PAIRP pos and PAIRP first pos and LENGTH first pos = 5

(DEFUN |poIsPos?| (|pos|)
  (PROG ()
    (RETURN
     (AND (CONSP |pos|) (CONSP (CAR |pos|)) (EQL (LENGTH (CAR |pos|)) 5)))))

; lnCreate(extBl, st, gNo, :optFileStuff) ==
;     lNo :=
;         num := IFCAR optFileStuff => num
;         0
;     fN  := IFCAR IFCDR optFileStuff
;     [extBl, st, gNo, lNo, fN]

(DEFUN |lnCreate| (|extBl| |st| |gNo| &REST |optFileStuff|)
  (PROG (|num| |lNo| |fN|)
    (RETURN
     (PROGN
      (SETQ |lNo| (COND ((SETQ |num| (IFCAR |optFileStuff|)) |num|) ('T 0)))
      (SETQ |fN| (IFCAR (IFCDR |optFileStuff|)))
      (LIST |extBl| |st| |gNo| |lNo| |fN|)))))

; lnString lineObject ==
;     lineObject.1

(DEFUN |lnString| (|lineObject|) (PROG () (RETURN (ELT |lineObject| 1))))

; lnExtraBlanks lineObject ==
;     lineObject.0

(DEFUN |lnExtraBlanks| (|lineObject|) (PROG () (RETURN (ELT |lineObject| 0))))

; lnGlobalNum lineObject   ==
;     lineObject.2

(DEFUN |lnGlobalNum| (|lineObject|) (PROG () (RETURN (ELT |lineObject| 2))))

; lnSetGlobalNum(lineObject, num) ==
;     lineObject.2 := num

(DEFUN |lnSetGlobalNum| (|lineObject| |num|)
  (PROG () (RETURN (SETF (ELT |lineObject| 2) |num|))))

; lnLocalNum lineObject    ==
;     lineObject.3

(DEFUN |lnLocalNum| (|lineObject|) (PROG () (RETURN (ELT |lineObject| 3))))

; lnFileName lineObject    ==
;     (fN := lnFileName? lineObject)  => fN
;     ncBug('"there is no file name in %1", [lineObject] )

(DEFUN |lnFileName| (|lineObject|)
  (PROG (|fN|)
    (RETURN
     (COND ((SETQ |fN| (|lnFileName?| |lineObject|)) |fN|)
           ('T (|ncBug| "there is no file name in %1" (LIST |lineObject|)))))))

; lnFileName? lineObject   ==
;     NOT PAIRP (fN := lineObject.4)  => NIL
;     fN

(DEFUN |lnFileName?| (|lineObject|)
  (PROG (|fN|)
    (RETURN
     (COND ((NULL (CONSP (SETQ |fN| (ELT |lineObject| 4)))) NIL) ('T |fN|)))))

; lnPlaceOfOrigin lineObject ==
;     lineObject.4

(DEFUN |lnPlaceOfOrigin| (|lineObject|) (PROG () (RETURN (ELT |lineObject| 4))))

; lnImmediate? lineObject  ==
;     not lnFileName? lineObject

(DEFUN |lnImmediate?| (|lineObject|)
  (PROG () (RETURN (NULL (|lnFileName?| |lineObject|)))))

; poGetLineObject posn ==
;     first posn

(DEFUN |poGetLineObject| (|posn|) (PROG () (RETURN (CAR |posn|))))

; pfPosn pf == pfSourcePosition pf

(DEFUN |pfPosn| (|pf|) (PROG () (RETURN (|pfSourcePosition| |pf|))))

; pfSourcePosition form ==
;     --null form => pfNoPosition()
;     pfLeaf? form => pfLeafPosition form
;     parts := pfParts form
;     pos := $nopos
;     for p in parts while poNoPosition? pos repeat
;         pos := pfSourcePosition p
;     pos

(DEFUN |pfSourcePosition| (|form|)
  (PROG (|parts| |pos|)
    (RETURN
     (COND ((|pfLeaf?| |form|) (|pfLeafPosition| |form|))
           (#1='T
            (PROGN
             (SETQ |parts| (|pfParts| |form|))
             (SETQ |pos| |$nopos|)
             ((LAMBDA (|bfVar#1| |p|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#1|) (PROGN (SETQ |p| (CAR |bfVar#1|)) NIL)
                       (NOT (|poNoPosition?| |pos|)))
                   (RETURN NIL))
                  (#1# (SETQ |pos| (|pfSourcePosition| |p|))))
                 (SETQ |bfVar#1| (CDR |bfVar#1|))))
              |parts| NIL)
             |pos|))))))

; pfSourcePositions form ==
;     if pfLeaf? form
;     then
;      a:=tokPosn form
;      if null a
;      then nil
;      else [a]
;     else  pfSourcePositionlist pfParts form

(DEFUN |pfSourcePositions| (|form|)
  (PROG (|a|)
    (RETURN
     (COND
      ((|pfLeaf?| |form|) (SETQ |a| (|tokPosn| |form|))
       (COND ((NULL |a|) NIL) (#1='T (LIST |a|))))
      (#1# (|pfSourcePositionlist| (|pfParts| |form|)))))))

; pfSourcePositionlist x==
;       if null x
;       then nil
;       else APPEND(pfSourcePositions first x,pfSourcePositionlist rest x)

(DEFUN |pfSourcePositionlist| (|x|)
  (PROG ()
    (RETURN
     (COND ((NULL |x|) NIL)
           ('T
            (APPEND (|pfSourcePositions| (CAR |x|))
                    (|pfSourcePositionlist| (CDR |x|))))))))

; poCharPosn posn == rest posn

(DEFUN |poCharPosn| (|posn|) (PROG () (RETURN (CDR |posn|))))

; pfCharPosn posn == poCharPosn posn

(DEFUN |pfCharPosn| (|posn|) (PROG () (RETURN (|poCharPosn| |posn|))))

; poLinePosn posn       ==
;     posn => lnLocalNum  poGetLineObject posn  --VECP posn =>
;     CDAR posn

(DEFUN |poLinePosn| (|posn|)
  (PROG ()
    (RETURN
     (COND (|posn| (|lnLocalNum| (|poGetLineObject| |posn|)))
           ('T (CDAR |posn|))))))

; pfLinePosn posn == poLinePosn posn

(DEFUN |pfLinePosn| (|posn|) (PROG () (RETURN (|poLinePosn| |posn|))))

; poGlobalLinePosn posn ==
;     posn => lnGlobalNum poGetLineObject posn
;     ncBug('"old style pos objects have no global positions",[])

(DEFUN |poGlobalLinePosn| (|posn|)
  (PROG ()
    (RETURN
     (COND (|posn| (|lnGlobalNum| (|poGetLineObject| |posn|)))
           ('T
            (|ncBug| "old style pos objects have no global positions" NIL))))))

; pfGlobalLinePosn posn == poGlobalLinePosn posn

(DEFUN |pfGlobalLinePosn| (|posn|)
  (PROG () (RETURN (|poGlobalLinePosn| |posn|))))

; poFileName posn       ==
;     posn => lnFileName poGetLineObject posn
;     CAAR posn

(DEFUN |poFileName| (|posn|)
  (PROG ()
    (RETURN
     (COND (|posn| (|lnFileName| (|poGetLineObject| |posn|)))
           ('T (CAAR |posn|))))))

; pfFileName posn == poFileName posn

(DEFUN |pfFileName| (|posn|) (PROG () (RETURN (|poFileName| |posn|))))

; poPlaceOfOrigin posn ==
;     lnPlaceOfOrigin poGetLineObject posn

(DEFUN |poPlaceOfOrigin| (|posn|)
  (PROG () (RETURN (|lnPlaceOfOrigin| (|poGetLineObject| |posn|)))))

; poNopos? posn ==
;     posn = ['noposition]

(DEFUN |poNopos?| (|posn|)
  (PROG () (RETURN (EQUAL |posn| (LIST '|noposition|)))))

; poPosImmediate? txp==
;     poNopos? txp => NIL
;     lnImmediate? poGetLineObject txp

(DEFUN |poPosImmediate?| (|txp|)
  (PROG ()
    (RETURN
     (COND ((|poNopos?| |txp|) NIL)
           ('T (|lnImmediate?| (|poGetLineObject| |txp|)))))))

; poImmediate? txp==
;     lnImmediate? poGetLineObject txp

(DEFUN |poImmediate?| (|txp|)
  (PROG () (RETURN (|lnImmediate?| (|poGetLineObject| |txp|)))))

; pfImmediate? txp == poImmediate? txp

(DEFUN |pfImmediate?| (|txp|) (PROG () (RETURN (|poImmediate?| |txp|))))

; compareposns(a,b)==
;  c:=poGlobalLinePosn a
;  d:=poGlobalLinePosn b
;  if c=d then poCharPosn a>=poCharPosn b else c>=d

(DEFUN |compareposns| (|a| |b|)
  (PROG (|c| |d|)
    (RETURN
     (PROGN
      (SETQ |c| (|poGlobalLinePosn| |a|))
      (SETQ |d| (|poGlobalLinePosn| |b|))
      (COND ((EQUAL |c| |d|) (NOT (< (|poCharPosn| |a|) (|poCharPosn| |b|))))
            ('T (NOT (< |c| |d|))))))))

; pfPrintSrcLines(pf) ==
;   lines := pfSourcePositions pf
;   lno := 0
;   for l in lines repeat
;     line := car l
;     if lno < lnGlobalNum(line) then
;       FORMAT(true, '"   ~A~%",  lnString line)
;       lno := lnGlobalNum(line)

(DEFUN |pfPrintSrcLines| (|pf|)
  (PROG (|lines| |lno| |line|)
    (RETURN
     (PROGN
      (SETQ |lines| (|pfSourcePositions| |pf|))
      (SETQ |lno| 0)
      ((LAMBDA (|bfVar#2| |l|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#2|) (PROGN (SETQ |l| (CAR |bfVar#2|)) NIL))
            (RETURN NIL))
           ('T
            (PROGN
             (SETQ |line| (CAR |l|))
             (COND
              ((< |lno| (|lnGlobalNum| |line|))
               (FORMAT T "   ~A~%" (|lnString| |line|))
               (SETQ |lno| (|lnGlobalNum| |line|)))))))
          (SETQ |bfVar#2| (CDR |bfVar#2|))))
       |lines| NIL)))))
