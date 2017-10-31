
(SDEFUN |FRMOD;One;$;1| (($ $)) (QREFELT $ 10)) 

(PUT '|FRMOD;module;V$;2| '|SPADreplace| '(XLAM (|v|) |v|)) 

(SDEFUN |FRMOD;module;V$;2| ((|v| |Vector| A) ($ $)) |v|) 

(PUT '|FRMOD;basis;$V;3| '|SPADreplace| '(XLAM (|m|) |m|)) 

(SDEFUN |FRMOD;basis;$V;3| ((|m| $) ($ |Vector| A)) |m|) 

(SDEFUN |FRMOD;rowdiv| ((|r| |Vector| R) (|f| R) ($ |Vector| F))
        (SPROG ((#1=#:G703 NIL) (#2=#:G705 NIL) (|i| NIL) (#3=#:G704 NIL))
               (SEQ
                (PROGN
                 (LETT #3#
                       (GETREFV
                        (|inc_SI|
                         (- #4=(QVSIZE |r|) #5=(SPADCALL |r| (QREFELT $ 26)))))
                       . #6=(|FRMOD;rowdiv|))
                 (SEQ (LETT |i| #5# . #6#) (LETT #2# #4# . #6#)
                      (LETT #1# 0 . #6#) G190 (COND ((> |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #3# #1#
                                (SPADCALL (SPADCALL |r| |i| (QREFELT $ 27)) |f|
                                          (QREFELT $ 28)))))
                      (LETT #1#
                            (PROG1 (|inc_SI| #1#) (LETT |i| (+ |i| 1) . #6#))
                            . #6#)
                      (GO G190) G191 (EXIT NIL))
                 #3#)))) 

(SDEFUN |FRMOD;coerce;$Of;5| ((|m| $) ($ |OutputForm|))
        (SPADCALL (SPADCALL |m| (QREFELT $ 23)) (QREFELT $ 30))) 

(SDEFUN |FRMOD;W2A| ((|v| |Vector| F) ($ A))
        (SPADCALL (SPADCALL |v| (|FRMOD;intmat| $) (QREFELT $ 34))
                  (QREFELT $ 35))) 

(SDEFUN |FRMOD;wmatrix| ((|v| |Vector| A) ($ |Matrix| F))
        (SPADCALL (SPADCALL |v| (QREFELT $ 37)) (|FRMOD;invintmat| $)
                  (QREFELT $ 38))) 

(SDEFUN |FRMOD;getinvintmat| (($ |Boolean|))
        (SPROG
         ((#1=#:G717 NIL) (|j| NIL) (#2=#:G716 NIL) (|i| NIL)
          (|m| (|Matrix| F)) (#3=#:G710 NIL))
         (SEQ
          (LETT |m|
                (PROG2
                    (LETT #3# (SPADCALL (|FRMOD;intmat| $) (QREFELT $ 40))
                          . #4=(|FRMOD;getinvintmat|))
                    (QCDR #3#)
                  (|check_union2| (QEQCAR #3# 0) (|Matrix| (QREFELT $ 7))
                                  (|Union| (|Matrix| (QREFELT $ 7)) "failed")
                                  #3#))
                . #4#)
          (SEQ (LETT |i| 1 . #4#)
               (LETT #2# (SPADCALL |m| (QREFELT $ 41)) . #4#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #4#)
                      (LETT #1# (SPADCALL |m| (QREFELT $ 42)) . #4#) G190
                      (COND ((|greater_SI| |j| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL (QREFELT $ 18) |i| |j|
                                  (QAREF2O |m| |i| |j| 1 1) (QREFELT $ 43))))
                      (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT NIL)))) 

(SDEFUN |FRMOD;getintmat| (($ |Boolean|))
        (SPROG
         ((#1=#:G723 NIL) (|j| NIL) (#2=#:G722 NIL) (|i| NIL)
          (|m| (|Matrix| F)))
         (SEQ
          (LETT |m| (SPADCALL (QREFELT $ 10) (QREFELT $ 37))
                . #3=(|FRMOD;getintmat|))
          (SEQ (LETT |i| 1 . #3#)
               (LETT #2# (SPADCALL |m| (QREFELT $ 41)) . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #3#)
                      (LETT #1# (SPADCALL |m| (QREFELT $ 42)) . #3#) G190
                      (COND ((|greater_SI| |j| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL (QREFELT $ 19) |i| |j|
                                  (QAREF2O |m| |i| |j| 1 1) (QREFELT $ 43))))
                      (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT NIL)))) 

(SDEFUN |FRMOD;invintmat| (($ |Matrix| F))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 15) (QREFELT $ 44))
           (SPADCALL (QREFELT $ 15) (|FRMOD;getinvintmat| $) (QREFELT $ 45))))
         (EXIT (QREFELT $ 18)))) 

(SDEFUN |FRMOD;intmat| (($ |Matrix| F))
        (SEQ
         (COND
          ((SPADCALL (QREFELT $ 16) (QREFELT $ 44))
           (SPADCALL (QREFELT $ 16) (|FRMOD;getintmat| $) (QREFELT $ 45))))
         (EXIT (QREFELT $ 19)))) 

(SDEFUN |FRMOD;vectProd| ((|v1| |Vector| A) (|v2| |Vector| A) ($ |Vector| A))
        (SPROG
         ((|k| (|Integer|)) (#1=#:G734 NIL) (|j| NIL) (#2=#:G733 NIL) (|i| NIL)
          (|v| (|Vector| A)))
         (SEQ
          (LETT |k|
                (SPADCALL
                 (LETT |v|
                       (MAKEARR1 (* (QVSIZE |v1|) (QVSIZE |v2|))
                                 (|spadConstant| $ 46))
                       . #3=(|FRMOD;vectProd|))
                 (QREFELT $ 47))
                . #3#)
          (SEQ (LETT |i| (SPADCALL |v1| (QREFELT $ 48)) . #3#)
               (LETT #2# (QVSIZE |v1|) . #3#) G190
               (COND ((> |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |v2| (QREFELT $ 48)) . #3#)
                      (LETT #1# (QVSIZE |v2|) . #3#) G190
                      (COND ((> |j| #1#) (GO G191)))
                      (SEQ
                       (QSETAREF1O |v| |k|
                                   (SPADCALL (QAREF1O |v1| |i| 1)
                                             (QAREF1O |v2| |j| 1)
                                             (QREFELT $ 49))
                                   1)
                       (EXIT (LETT |k| (+ |k| 1) . #3#)))
                      (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |v|)))) 

(SDEFUN |FRMOD;norm;$F;13| ((|m| $) ($ F))
        (COND
         ((SPADCALL (QVSIZE (SPADCALL |m| (QREFELT $ 23)))
                    (QVSIZE (QREFELT $ 10)) (QREFELT $ 52))
          (|error| "Module not of rank n"))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL (SPADCALL |m| (QREFELT $ 23)) (QREFELT $ 37))
                     (|FRMOD;invintmat| $) (QREFELT $ 38))
           (QREFELT $ 53))))) 

(SDEFUN |FRMOD;*;3$;14| ((|m1| $) (|m2| $) ($ $))
        (SPROG
         ((|u| (A)) (#1=#:G742 NIL) (|i| NIL) (#2=#:G741 NIL)
          (|m| (|Matrix| R))
          (|cd| (|Record| (|:| |num| (|Matrix| R)) (|:| |den| R))))
         (SEQ
          (LETT |m|
                (SPADCALL
                 (QCAR
                  (LETT |cd|
                        (SPADCALL
                         (|FRMOD;wmatrix|
                          (|FRMOD;vectProd| (SPADCALL |m1| (QREFELT $ 23))
                           (SPADCALL |m2| (QREFELT $ 23)) $)
                          $)
                         (QREFELT $ 57))
                        . #3=(|FRMOD;*;3$;14|)))
                 (QREFELT $ 60))
                . #3#)
          (EXIT
           (SPADCALL
            (LIST2VEC
             (PROGN
              (LETT #2# NIL . #3#)
              (SEQ (LETT |i| 1 . #3#)
                   (LETT #1# (SPADCALL |m| (QREFELT $ 61)) . #3#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL
                        (LETT |u|
                              (|FRMOD;W2A|
                               (|FRMOD;rowdiv|
                                (SPADCALL |m| |i| (QREFELT $ 62)) (QCDR |cd|)
                                $)
                               $)
                              . #3#)
                        (|spadConstant| $ 46) (QREFELT $ 63))
                       (LETT #2# (CONS |u| #2#) . #3#)))))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                   (EXIT (NREVERSE #2#)))))
            (QREFELT $ 22)))))) 

(SDEFUN |FRMOD;module;Fi$;15| ((|i| |FractionalIdeal| R F UP A) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |i| (QREFELT $ 66)) (QREFELT $ 22))
                  (SPADCALL (QREFELT $ 10) (QREFELT $ 22)) (QREFELT $ 64))) 

(DECLAIM (NOTINLINE |FramedModule;|)) 

(DEFUN |FramedModule| (&REST #1=#:G744)
  (SPROG NIL
         (PROG (#2=#:G745)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FramedModule|)
                                               '|domainEqualList|)
                    . #3=(|FramedModule|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FramedModule;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|FramedModule|)))))))))) 

(DEFUN |FramedModule;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|FramedModule|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT DV$5 (|devaluate| |#5|) . #1#)
    (LETT |dv$| (LIST '|FramedModule| DV$1 DV$2 DV$3 DV$4 DV$5) . #1#)
    (LETT $ (GETREFV 72) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#4|
                                                       (LIST '|RetractableTo|
                                                             (|devaluate|
                                                              |#2|)))))
                    . #1#))
    (|haddProp| |$ConstructorCache| '|FramedModule|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 11 (|Vector| |#4|))
    (QSETREFV $ 15 (SPADCALL 'T (QREFELT $ 14)))
    (QSETREFV $ 16 (SPADCALL 'T (QREFELT $ 14)))
    (QSETREFV $ 18
              (MAKE_MATRIX1 (QVSIZE |#5|) (QVSIZE |#5|) (|spadConstant| $ 17)))
    (QSETREFV $ 19
              (MAKE_MATRIX1 (QVSIZE |#5|) (QVSIZE |#5|) (|spadConstant| $ 17)))
    (COND
     ((|testBitVector| |pv$| 1)
      (QSETREFV $ 67 (CONS (|dispatchFunction| |FRMOD;module;Fi$;15|) $))))
    $))) 

(MAKEPROP '|FramedModule| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) '|Rep| (|Boolean|)
              (|Reference| 12) (0 . |ref|) '|iflag?| '|wflag?| (5 . |Zero|)
              '|imat| '|wmat|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FRMOD;One;$;1|) $))
              (|Vector| 9) |FRMOD;module;V$;2| |FRMOD;basis;$V;3| (|Integer|)
              (|Vector| 6) (9 . |minIndex|) (14 . |elt|) (20 . /)
              (|OutputForm|) (26 . |coerce|) |FRMOD;coerce;$Of;5| (|Vector| 7)
              (|Matrix| 7) (31 . *) (37 . |represents|) (|Vector| $)
              (42 . |coordinates|) (47 . *) (|Union| $ '"failed")
              (53 . |inverse|) (58 . |maxRowIndex|) (63 . |maxColIndex|)
              (68 . |setelt!|) (76 . |elt|) (81 . |setelt!|) (87 . |Zero|)
              (91 . |minIndex|) (96 . |minIndex|) (101 . *) (107 . |One|)
              (|NonNegativeInteger|) (111 . ~=) (117 . |determinant|)
              |FRMOD;norm;$F;13| (|Record| (|:| |num| 58) (|:| |den| 6))
              (|MatrixCommonDenominator| 6 7) (122 . |splitDenominator|)
              (|Matrix| 6) (|ModularHermitianRowReduction| 6) (127 . |rowEch|)
              (132 . |maxRowIndex|) (137 . |row|) (143 . ~=) |FRMOD;*;3$;14|
              (|FractionalIdeal| 6 7 8 9) (149 . |basis|) (154 . |module|)
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 159 |sample| 165 |recip| 169 |one?| 174 |norm| 179 |module|
              184 |latex| 194 |hashUpdate!| 199 |hash| 205 |coerce| 210 |basis|
              215 ^ 220 |One| 232 = 236 * 242)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0))
                 (CONS
                  '#(|Monoid&| |SemiGroup&| |SetCategory&| |BasicType&| NIL)
                  (CONS
                   '#((|Monoid|) (|SemiGroup|) (|SetCategory|) (|BasicType|)
                      (|CoercibleTo| 29))
                   (|makeByteWordVec2| 71
                                       '(1 13 0 12 14 0 7 0 17 1 25 24 0 26 2
                                         25 6 0 24 27 2 7 0 6 6 28 1 21 29 0 30
                                         2 33 32 32 0 34 1 9 0 32 35 1 9 33 36
                                         37 2 33 0 0 0 38 1 33 39 0 40 1 33 24
                                         0 41 1 33 24 0 42 4 33 7 0 24 24 7 43
                                         1 13 12 0 44 2 13 12 0 12 45 0 9 0 46
                                         1 21 24 0 47 1 11 24 0 48 2 9 0 0 0 49
                                         0 9 0 50 2 51 12 0 0 52 1 33 7 0 53 1
                                         56 55 33 57 1 59 58 58 60 1 58 24 0 61
                                         2 58 25 0 24 62 2 9 12 0 0 63 1 65 21
                                         0 66 1 0 0 65 67 2 0 12 0 0 1 0 0 0 1
                                         1 0 39 0 1 1 0 12 0 1 1 0 7 0 54 1 1 0
                                         65 67 1 0 0 21 22 1 0 69 0 1 2 0 71 71
                                         0 1 1 0 70 0 1 1 0 29 0 31 1 0 21 0 23
                                         2 0 0 0 51 1 2 0 0 0 68 1 0 0 0 20 2 0
                                         12 0 0 1 2 0 0 0 0 64)))))
           '|lookupComplete|)) 
