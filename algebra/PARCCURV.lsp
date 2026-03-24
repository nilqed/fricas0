
(PUT '|PARCCURV;complex_curve;VT%;1| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |PARCCURV;complex_curve;VT%;1| ((|x| (VT)) (% (%))) |x|) 

(PUT '|PARCCURV;get_value;%VT;2| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |PARCCURV;get_value;%VT;2| ((|x| (%)) (% (VT))) |x|) 

(DECLAIM (NOTINLINE |ParametricComplexCurve;|)) 

(DEFUN |ParametricComplexCurve;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|ParametricComplexCurve| DV$1))
          (LETT % (GETREFV 9))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ParametricComplexCurve| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |ParametricComplexCurve| (#1=#:G2)
  (SPROG NIL
         (PROG (#2=#:G3)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|ParametricComplexCurve|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|ParametricComplexCurve;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ParametricComplexCurve|)))))))))) 

(MAKEPROP '|ParametricComplexCurve| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|)
              |PARCCURV;complex_curve;VT%;1| |PARCCURV;get_value;%VT;2|)
           '#(|get_value| 0 |complex_curve| 5) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|complex_curve| ($$ |#1|)) T)
                                   '((|get_value| (|#1| $$)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 8 '(1 0 6 0 8 1 0 0 6 7)))))
           '|lookupComplete|)) 
