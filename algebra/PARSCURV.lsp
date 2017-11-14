
(PUT '|PARSCURV;curve;3ComponentFunction$;1| '|SPADreplace| 'VECTOR) 

(SDEFUN |PARSCURV;curve;3ComponentFunction$;1|
        ((|x| |ComponentFunction|) (|y| |ComponentFunction|)
         (|z| |ComponentFunction|) ($ $))
        (VECTOR |x| |y| |z|)) 

(SDEFUN |PARSCURV;coordinate;$NniComponentFunction;2|
        ((|c| $) (|n| |NonNegativeInteger|) ($ |ComponentFunction|))
        (COND ((EQL |n| 1) (QVELT |c| 0)) ((EQL |n| 2) (QVELT |c| 1))
              ((EQL |n| 3) (QVELT |c| 2))
              ('T (|error| "coordinate: index out of bounds")))) 

(DECLAIM (NOTINLINE |ParametricSpaceCurve;|)) 

(DEFUN |ParametricSpaceCurve| (#1=#:G700)
  (SPROG NIL
         (PROG (#2=#:G701)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|ParametricSpaceCurve|)
                                               '|domainEqualList|)
                    . #3=(|ParametricSpaceCurve|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|ParametricSpaceCurve;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ParametricSpaceCurve|)))))))))) 

(DEFUN |ParametricSpaceCurve;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ParametricSpaceCurve|))
          (LETT |dv$| (LIST '|ParametricSpaceCurve| DV$1) . #1#)
          (LETT $ (GETREFV 11) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ParametricSpaceCurve| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| |xCoord| |#1|) (|:| |yCoord| |#1|)
                              (|:| |zCoord| |#1|)))
          $))) 

(MAKEPROP '|ParametricSpaceCurve| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              |PARSCURV;curve;3ComponentFunction$;1| (|NonNegativeInteger|)
              |PARSCURV;coordinate;$NniComponentFunction;2|)
           '#(|curve| 0 |coordinate| 7) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 10
                                                 '(3 0 0 6 6 6 8 2 0 6 0 9
                                                   10)))))
           '|lookupComplete|)) 
