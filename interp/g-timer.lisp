
; )package "BOOT"

(IN-PACKAGE "BOOT")

; $timerTicksPerSecond := INTERNAL_-TIME_-UNITS_-PER_-SECOND

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$timerTicksPerSecond| INTERNAL-TIME-UNITS-PER-SECOND))

; makeLongStatStringByProperty _
;  (listofnames, listofclasses, property, units, flag) ==
;   total := 0
;   str := '""
;   if property = 'TimeTotal then statsVec := $statsInfo.0
;   if property = 'SpaceTotal then statsVec := $statsInfo.1
;   otherStatTotal := statsVec.(GET('other, 'index))
;   insignificantStat := 0
;   classStats := GETZEROVEC(1 + # listofclasses)
;   for [name,class,:ab] in listofnames repeat
;     n := statsVec.(GET(name, 'index))
;     classStats.class := classStats.class + n
;     total := total + n
;     name = 'other or flag ~= 'long => 'iterate
;     if significantStat? n then
;         str := makeStatString(str, n, name, flag)
;     else
;         insignificantStat := insignificantStat + n
;   if flag = 'long then
;     str := makeStatString(str, otherStatTotal + insignificantStat, 'other, flag)
;   else
;     for [class,name,:ab] in listofclasses repeat
;       n := classStats.class
;       str := makeStatString(str, n, ab, flag)
;   total := STRCONC(normalizeStatAndStringify total,'" ", units)
;   str = '"" =>  total
;   STRCONC(str, '" = ", total)

(DEFUN |makeLongStatStringByProperty|
       (|listofnames| |listofclasses| |property| |units| |flag|)
  (PROG (|total| |str| |statsVec| |otherStatTotal| |insignificantStat|
         |classStats| |name| |ISTMP#1| |class| |ab| |n|)
    (RETURN
     (PROGN
      (SETQ |total| 0)
      (SETQ |str| "")
      (COND
       ((EQ |property| '|TimeTotal|) (SETQ |statsVec| (ELT |$statsInfo| 0))))
      (COND
       ((EQ |property| '|SpaceTotal|) (SETQ |statsVec| (ELT |$statsInfo| 1))))
      (SETQ |otherStatTotal| (ELT |statsVec| (GET '|other| '|index|)))
      (SETQ |insignificantStat| 0)
      (SETQ |classStats| (GETZEROVEC (+ 1 (LENGTH |listofclasses|))))
      ((LAMBDA (|bfVar#2| |bfVar#1|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#2|) (PROGN (SETQ |bfVar#1| (CAR |bfVar#2|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#1|)
                 (PROGN
                  (SETQ |name| (CAR |bfVar#1|))
                  (SETQ |ISTMP#1| (CDR |bfVar#1|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |class| (CAR |ISTMP#1|))
                        (SETQ |ab| (CDR |ISTMP#1|))
                        #1#)))
                 (PROGN
                  (SETQ |n| (ELT |statsVec| (GET |name| '|index|)))
                  (SETF (ELT |classStats| |class|)
                          (+ (ELT |classStats| |class|) |n|))
                  (SETQ |total| (+ |total| |n|))
                  (COND
                   ((OR (EQ |name| '|other|) (NOT (EQ |flag| '|long|)))
                    '|iterate|)
                   (#1#
                    (COND
                     ((|significantStat?| |n|)
                      (SETQ |str| (|makeStatString| |str| |n| |name| |flag|)))
                     (#1#
                      (SETQ |insignificantStat|
                              (+ |insignificantStat| |n|))))))))))
          (SETQ |bfVar#2| (CDR |bfVar#2|))))
       |listofnames| NIL)
      (COND
       ((EQ |flag| '|long|)
        (SETQ |str|
                (|makeStatString| |str|
                 (+ |otherStatTotal| |insignificantStat|) '|other| |flag|)))
       (#1#
        ((LAMBDA (|bfVar#4| |bfVar#3|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#4|)
                  (PROGN (SETQ |bfVar#3| (CAR |bfVar#4|)) NIL))
              (RETURN NIL))
             (#1#
              (AND (CONSP |bfVar#3|)
                   (PROGN
                    (SETQ |class| (CAR |bfVar#3|))
                    (SETQ |ISTMP#1| (CDR |bfVar#3|))
                    (AND (CONSP |ISTMP#1|)
                         (PROGN
                          (SETQ |name| (CAR |ISTMP#1|))
                          (SETQ |ab| (CDR |ISTMP#1|))
                          #1#)))
                   (PROGN
                    (SETQ |n| (ELT |classStats| |class|))
                    (SETQ |str| (|makeStatString| |str| |n| |ab| |flag|))))))
            (SETQ |bfVar#4| (CDR |bfVar#4|))))
         |listofclasses| NIL)))
      (SETQ |total|
              (STRCONC (|normalizeStatAndStringify| |total|) " " |units|))
      (COND ((EQUAL |str| "") |total|) (#1# (STRCONC |str| " = " |total|)))))))

; normalizeStatAndStringify t ==
;   FLOATP t =>
;       not significantStat? t => '"0"
;       fmtStr := STRCONC('"~,", STRINGIMAGE $timePrintDigits, '"F")
;       FORMAT(nil, fmtStr, t)
;   INTEGERP t => FORMAT(nil, '"~:d", t)
;   STRINGIMAGE t

(DEFUN |normalizeStatAndStringify| (|t|)
  (PROG (|fmtStr|)
    (RETURN
     (COND
      ((FLOATP |t|)
       (COND ((NULL (|significantStat?| |t|)) "0")
             (#1='T
              (PROGN
               (SETQ |fmtStr|
                       (STRCONC "~," (STRINGIMAGE |$timePrintDigits|) "F"))
               (FORMAT NIL |fmtStr| |t|)))))
      ((INTEGERP |t|) (FORMAT NIL "~:d" |t|)) (#1# (STRINGIMAGE |t|))))))

; makeStatString(oldstr,time,abb,flag) ==
;   not significantStat? time => oldstr
;   opening := (flag = 'long => '"("; '" (")
;   timestr := normalizeStatAndStringify time
;   oldstr = '"" => STRCONC(timestr, opening, abb, '")")
;   STRCONC(oldstr, '" + ", timestr, opening, abb, '")")

(DEFUN |makeStatString| (|oldstr| |time| |abb| |flag|)
  (PROG (|opening| |timestr|)
    (RETURN
     (COND ((NULL (|significantStat?| |time|)) |oldstr|)
           (#1='T
            (PROGN
             (SETQ |opening| (COND ((EQ |flag| '|long|) "(") (#1# " (")))
             (SETQ |timestr| (|normalizeStatAndStringify| |time|))
             (COND
              ((EQUAL |oldstr| "") (STRCONC |timestr| |opening| |abb| ")"))
              (#1#
               (STRCONC |oldstr| " + " |timestr| |opening| |abb| ")")))))))))

; significantStat? s ==
;   INTEGERP s => s ~= 0
;   s >= 0.1^$timePrintDigits

(DEFUN |significantStat?| (|s|)
  (PROG ()
    (RETURN
     (COND ((INTEGERP |s|) (NOT (EQL |s| 0)))
           ('T (NOT (< |s| (EXPT 0.1 |$timePrintDigits|))))))))

; peekTimedName() == IFCAR $timedNameStack

(DEFUN |peekTimedName| () (PROG () (RETURN (IFCAR |$timedNameStack|))))

; popTimedName() ==
;   name := IFCAR $timedNameStack
;   $timedNameStack := IFCDR $timedNameStack
;   name

(DEFUN |popTimedName| ()
  (PROG (|name|)
    (RETURN
     (PROGN
      (SETQ |name| (IFCAR |$timedNameStack|))
      (SETQ |$timedNameStack| (IFCDR |$timedNameStack|))
      |name|))))

; pushTimedName name ==
;   PUSH(name,$timedNameStack)

(DEFUN |pushTimedName| (|name|)
  (PROG () (RETURN (PUSH |name| |$timedNameStack|))))

; startTimingProcess name ==
;   updateTimedName peekTimedName()
;   pushTimedName name

(DEFUN |startTimingProcess| (|name|)
  (PROG ()
    (RETURN
     (PROGN (|updateTimedName| (|peekTimedName|)) (|pushTimedName| |name|)))))

; stopTimingProcess name ==
;   (name ~= peekTimedName()) and null $InteractiveMode =>
;     keyedSystemError("S2GL0015",[name,peekTimedName()])
;   updateTimedName peekTimedName()
;   popTimedName()

(DEFUN |stopTimingProcess| (|name|)
  (PROG ()
    (RETURN
     (COND
      ((AND (NOT (EQUAL |name| (|peekTimedName|))) (NULL |$InteractiveMode|))
       (|keyedSystemError| 'S2GL0015 (LIST |name| (|peekTimedName|))))
      ('T (PROGN (|updateTimedName| (|peekTimedName|)) (|popTimedName|)))))))

; DEFPARAMETER($timePrintDigits, 2)

(DEFPARAMETER |$timePrintDigits| 2)

; DEFPARAMETER($timedNameStack, '(other))

(DEFPARAMETER |$timedNameStack| '(|other|))

; DEFPARAMETER($interpreterTimedNames, '(
; -- name         class abbrev
;   (algebra        2 .   B) _
;   (analysis       1 .   A) _
;   (coercion       1 .   C) _
;   (compilation    3 .   T) _
;   (debug          3 .   D) _
;   (evaluation     2 .   E) _
;   (gc             4 .   G) _
;   (history        3 .   H) _
;   (instantiation  3 .   I) _
;   (load           3 .   L) _
;   (modemaps       1 .   M) _
;   (optimization   3 .   Z) _
;   (querycoerce    1 .   Q) _
;   (other          3 .   O) _
;   (diskread       3 .   K) _
;   (resolve        1 .   R) _
;   (print          3 .   P) _
;   ))

(DEFPARAMETER |$interpreterTimedNames|
  '((|algebra| 2 . B) (|analysis| 1 . A) (|coercion| 1 . C)
    (|compilation| 3 . T) (|debug| 3 . D) (|evaluation| 2 . E) (|gc| 4 . G)
    (|history| 3 . H) (|instantiation| 3 . I) (|load| 3 . L) (|modemaps| 1 . M)
    (|optimization| 3 . Z) (|querycoerce| 1 . Q) (|other| 3 . O)
    (|diskread| 3 . K) (|resolve| 1 . R) (|print| 3 . P)))

; DEFPARAMETER($interpreterTimedClasses, '(
; -- number class name    short name
;   ( 1    interpreter     .  IN) _
;   ( 2    evaluation      .  EV) _
;   ( 3    other           .  OT) _
;   ( 4    reclaim         .  GC) _
;   ))

(DEFPARAMETER |$interpreterTimedClasses|
  '((1 |interpreter| . IN) (2 |evaluation| . EV) (3 |other| . OT)
    (4 |reclaim| . GC)))

; DEFVAR($statsInfo)

(DEFVAR |$statsInfo|)

; initializeTimedNames() ==
;   for [name, :.] in $interpreterTimedNames for i in 0.. repeat
;     PUT(name, 'index, i)
;   initializeTimedStack()

(DEFUN |initializeTimedNames| ()
  (PROG (|name|)
    (RETURN
     (PROGN
      ((LAMBDA (|bfVar#6| |bfVar#5| |i|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#6|) (PROGN (SETQ |bfVar#5| (CAR |bfVar#6|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#5|) (PROGN (SETQ |name| (CAR |bfVar#5|)) #1#)
                 (PUT |name| '|index| |i|))))
          (SETQ |bfVar#6| (CDR |bfVar#6|))
          (SETQ |i| (+ |i| 1))))
       |$interpreterTimedNames| NIL 0)
      (|initializeTimedStack|)))))

; initializeTimedStack() ==
;   $timedNameStack := '(other)
;   len := # $interpreterTimedNames
;   $statsInfo := VECTOR(GETZEROVEC len, GETZEROVEC len, get_run_time(), _
;                        elapsedGcTime(), HEAPELAPSED())
;   NIL

(DEFUN |initializeTimedStack| ()
  (PROG (|len|)
    (RETURN
     (PROGN
      (SETQ |$timedNameStack| '(|other|))
      (SETQ |len| (LENGTH |$interpreterTimedNames|))
      (SETQ |$statsInfo|
              (VECTOR (GETZEROVEC |len|) (GETZEROVEC |len|) (|get_run_time|)
                      (|elapsedGcTime|) (HEAPELAPSED)))
      NIL))))

; updateTimedName name ==
;   oldTime := $statsInfo.2
;   oldGCTime := $statsInfo.3
;   oldSpace := $statsInfo.4
;   newTime := $statsInfo.2 := get_run_time()
;   newGCTime := $statsInfo.3 := elapsedGcTime()
;   newSpace := $statsInfo.4 := HEAPELAPSED()
;
;   i := GET(name, 'index)
;   timeVec := $statsInfo.0
;   spaceVec := $statsInfo.1
;   gcDelta := newGCTime - oldGCTime
;   timeVec.i := timeVec.i + (newTime - oldTime - gcDelta)*$inverseTimerTicksPerSecond
;   i2 := GET('gc, 'index)
;   timeVec.i2 := timeVec.i2 + gcDelta * $inverseTimerTicksPerSecond
;   spaceVec.i := spaceVec.i + newSpace - oldSpace

(DEFUN |updateTimedName| (|name|)
  (PROG (|oldTime| |oldGCTime| |oldSpace| |newTime| |newGCTime| |newSpace| |i|
         |timeVec| |spaceVec| |gcDelta| |i2|)
    (RETURN
     (PROGN
      (SETQ |oldTime| (ELT |$statsInfo| 2))
      (SETQ |oldGCTime| (ELT |$statsInfo| 3))
      (SETQ |oldSpace| (ELT |$statsInfo| 4))
      (SETQ |newTime| (SETF (ELT |$statsInfo| 2) (|get_run_time|)))
      (SETQ |newGCTime| (SETF (ELT |$statsInfo| 3) (|elapsedGcTime|)))
      (SETQ |newSpace| (SETF (ELT |$statsInfo| 4) (HEAPELAPSED)))
      (SETQ |i| (GET |name| '|index|))
      (SETQ |timeVec| (ELT |$statsInfo| 0))
      (SETQ |spaceVec| (ELT |$statsInfo| 1))
      (SETQ |gcDelta| (- |newGCTime| |oldGCTime|))
      (SETF (ELT |timeVec| |i|)
              (+ (ELT |timeVec| |i|)
                 (* (- (- |newTime| |oldTime|) |gcDelta|)
                    |$inverseTimerTicksPerSecond|)))
      (SETQ |i2| (GET '|gc| '|index|))
      (SETF (ELT |timeVec| |i2|)
              (+ (ELT |timeVec| |i2|)
                 (* |gcDelta| |$inverseTimerTicksPerSecond|)))
      (SETF (ELT |spaceVec| |i|)
              (- (+ (ELT |spaceVec| |i|) |newSpace|) |oldSpace|))))))

; makeLongTimeString(listofnames,listofclasses) ==
;   makeLongStatStringByProperty(listofnames, listofclasses,  _
;                                'TimeTotal, _
;                                '"sec", $printTimeIfTrue)

(DEFUN |makeLongTimeString| (|listofnames| |listofclasses|)
  (PROG ()
    (RETURN
     (|makeLongStatStringByProperty| |listofnames| |listofclasses| '|TimeTotal|
      "sec" |$printTimeIfTrue|))))

; makeLongSpaceString(listofnames,listofclasses) ==
;   makeLongStatStringByProperty(listofnames, listofclasses,    _
;                                'SpaceTotal, _
;                                '"bytes", $printStorageIfTrue)

(DEFUN |makeLongSpaceString| (|listofnames| |listofclasses|)
  (PROG ()
    (RETURN
     (|makeLongStatStringByProperty| |listofnames| |listofclasses|
      '|SpaceTotal| "bytes" |$printStorageIfTrue|))))

; DEFPARAMETER($inverseTimerTicksPerSecond, 1.0/$timerTicksPerSecond)

(DEFPARAMETER |$inverseTimerTicksPerSecond| (/ 1.0 |$timerTicksPerSecond|))

; timedAlgebraEvaluation(code) ==
;   startTimingProcess 'algebra
;   r := eval code
;   stopTimingProcess 'algebra
;   r

(DEFUN |timedAlgebraEvaluation| (|code|)
  (PROG (|r|)
    (RETURN
     (PROGN
      (|startTimingProcess| '|algebra|)
      (SETQ |r| (|eval| |code|))
      (|stopTimingProcess| '|algebra|)
      |r|))))

; timedOptimization(code) ==
;   startTimingProcess 'optimization
;   r := lispize code
;   if $reportOptimization then
;     sayBrightlyI bright '"Optimized LISP code:"
;     pp r
;   stopTimingProcess 'optimization
;   r

(DEFUN |timedOptimization| (|code|)
  (PROG (|r|)
    (RETURN
     (PROGN
      (|startTimingProcess| '|optimization|)
      (SETQ |r| (|lispize| |code|))
      (COND
       (|$reportOptimization|
        (|sayBrightlyI| (|bright| "Optimized LISP code:")) (|pp| |r|)))
      (|stopTimingProcess| '|optimization|)
      |r|))))

; timedEVALFUN(code) ==
;   startTimingProcess 'evaluation
;   r := timedEvaluate code
;   stopTimingProcess 'evaluation
;   r

(DEFUN |timedEVALFUN| (|code|)
  (PROG (|r|)
    (RETURN
     (PROGN
      (|startTimingProcess| '|evaluation|)
      (SETQ |r| (|timedEvaluate| |code|))
      (|stopTimingProcess| '|evaluation|)
      |r|))))

; timedEvaluate code ==
;   code is ["LIST",:a] and #a > 200 =>
;     "append"/[eval ["LIST",:x] for x in splitIntoBlocksOf200 a]
;   eval code

(DEFUN |timedEvaluate| (|code|)
  (PROG (|a|)
    (RETURN
     (COND
      ((AND (CONSP |code|) (EQ (CAR |code|) 'LIST)
            (PROGN (SETQ |a| (CDR |code|)) #1='T) (< 200 (LENGTH |a|)))
       ((LAMBDA (|bfVar#8| |bfVar#7| |x|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#7|) (PROGN (SETQ |x| (CAR |bfVar#7|)) NIL))
             (RETURN |bfVar#8|))
            (#1#
             (SETQ |bfVar#8| (APPEND |bfVar#8| (|eval| (CONS 'LIST |x|))))))
           (SETQ |bfVar#7| (CDR |bfVar#7|))))
        NIL (|splitIntoBlocksOf200| |a|) NIL))
      (#1# (|eval| |code|))))))
