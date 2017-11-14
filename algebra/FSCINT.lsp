
(SDEFUN |FSCINT;K2KG|
        ((|k| |Kernel| F) ($ |Kernel| (|Expression| (|Complex| R))))
        (SPADCALL
         (SPADCALL
          (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 11))) (QREFELT $ 14))
          (QREFELT $ 15))
         (QREFELT $ 17))) 

(SDEFUN |FSCINT;complexIntegrate;FSF;2| ((|f| F) (|x| |Symbol|) ($ F))
        (SPADCALL (SPADCALL (SPADCALL |f| |x| (QREFELT $ 20)) (QREFELT $ 22))
                  |x| (QREFELT $ 24))) 

(SDEFUN |FSCINT;internalIntegrate0;FSIr;3|
        ((|f| F) (|x| |Symbol|) ($ |IntegrationResult| F))
        (SPADCALL |f| |x| (ELT $ 28) (ELT $ 32) (QREFELT $ 35))) 

(SDEFUN |FSCINT;internalIntegrate0;FSIr;4|
        ((|f| F) (|x| |Symbol|) ($ |IntegrationResult| F))
        (SPADCALL |f| |x| (QREFELT $ 28))) 

(SDEFUN |FSCINT;internalIntegrate0;FSIr;5|
        ((|f| F) (|x| |Symbol|) ($ |IntegrationResult| F))
        (SPADCALL |f| |x| (QREFELT $ 28))) 

(SDEFUN |FSCINT;internalIntegrate0;FSIr;6|
        ((|f| F) (|x| |Symbol|) ($ |IntegrationResult| F))
        (SPADCALL |f| |x| (QREFELT $ 28))) 

(SDEFUN |FSCINT;internalIntegrate;FSIr;7|
        ((|f| F) (|x| |Symbol|) ($ |IntegrationResult| F))
        (SPROG
         ((|g| (F)) (|h| (|Expression| (|Complex| R))) (#1=#:G740 NIL)
          (|k| NIL) (#2=#:G739 NIL) (#3=#:G738 NIL) (#4=#:G737 NIL))
         (SEQ
          (LETT |f| (SPADCALL |f| (SPADCALL |x| (QREFELT $ 37)) (QREFELT $ 38))
                . #5=(|FSCINT;internalIntegrate;FSIr;7|))
          (EXIT
           (COND
            ((SPADCALL
              (CONS #'|FSCINT;internalIntegrate;FSIr;7!0|
                    (VECTOR (QREFELT $ 8) $))
              (PROGN
               (LETT #4# NIL . #5#)
               (SEQ (LETT |k| NIL . #5#)
                    (LETT #3#
                          (SPADCALL
                           (LETT |g| (SPADCALL |f| |x| (QREFELT $ 44)) . #5#)
                           (QREFELT $ 46))
                          . #5#)
                    G190
                    (COND
                     ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#) . #5#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL |x|
                                  (SPADCALL (SPADCALL |k| (QREFELT $ 47))
                                            (QREFELT $ 49))
                                  (QREFELT $ 50))
                        (LETT #4# (CONS |k| #4#) . #5#)))))
                    (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                    (EXIT (NREVERSE #4#))))
              (QREFELT $ 53))
             (SEQ
              (LETT |h|
                    (SPADCALL (SPADCALL |g| (QREFELT $ 14))
                              (PROGN
                               (LETT #2# NIL . #5#)
                               (SEQ (LETT |k| NIL . #5#)
                                    (LETT #1# (SPADCALL |f| (QREFELT $ 46))
                                          . #5#)
                                    G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |k| (CAR #1#) . #5#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((COND
                                         ((SPADCALL |k| '|tan| (QREFELT $ 54))
                                          'T)
                                         (#6='T
                                          (SPADCALL |k| '|cot|
                                                    (QREFELT $ 54))))
                                        (LETT #2#
                                              (CONS (|FSCINT;K2KG| |k| $) #2#)
                                              . #5#)))))
                                    (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT $ 56))
                    . #5#)
              (EXIT
               (COND
                ((SPADCALL (LETT |g| (SPADCALL |h| (QREFELT $ 57)) . #5#)
                           (QREFELT $ 59))
                 (SPADCALL
                  (SPADCALL (QVELT (SPADCALL |g| |x| (QREFELT $ 61)) 0)
                            (QREFELT $ 63))
                  |x| (QREFELT $ 36)))
                ((SPADCALL
                  (LETT |g|
                        (SPADCALL
                         (LETT |h|
                               (SPADCALL
                                (QVELT (SPADCALL |h| |x| (QREFELT $ 66)) 0)
                                (QREFELT $ 68))
                               . #5#)
                         (QREFELT $ 57))
                        . #5#)
                  (QREFELT $ 59))
                 (SPADCALL |g| |x| (QREFELT $ 36)))
                (#6#
                 (SPADCALL (ELT $ 57) (SPADCALL |h| |x| (QREFELT $ 71))
                           (QREFELT $ 74)))))))
            (#6#
             (SPADCALL
              (SPADCALL (QVELT (SPADCALL |g| |x| (QREFELT $ 61)) 0)
                        (QREFELT $ 63))
              |x| (QREFELT $ 36)))))))) 

(SDEFUN |FSCINT;internalIntegrate;FSIr;7!0| ((|x1| NIL) ($$ NIL))
        (PROG ($ RTRIG)
          (LETT $ (QREFELT $$ 1) . #1=(|FSCINT;internalIntegrate;FSIr;7|))
          (LETT RTRIG (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x1| (QREFELT $ 40)) RTRIG (QREFELT $ 42)))))) 

(DECLAIM (NOTINLINE |FunctionSpaceComplexIntegration;|)) 

(DEFUN |FunctionSpaceComplexIntegration| (&REST #1=#:G741)
  (SPROG NIL
         (PROG (#2=#:G742)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FunctionSpaceComplexIntegration|)
                                               '|domainEqualList|)
                    . #3=(|FunctionSpaceComplexIntegration|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |FunctionSpaceComplexIntegration;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FunctionSpaceComplexIntegration|)))))))))) 

(DEFUN |FunctionSpaceComplexIntegration;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|FunctionSpaceComplexIntegration|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|FunctionSpaceComplexIntegration| DV$1 DV$2)
                . #1#)
          (LETT $ (GETREFV 75) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FunctionSpaceComplexIntegration|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 '|rtrig|)
          (COND
           ((|HasCategory| |#1| '(|ConvertibleTo| (|Pattern| (|Integer|))))
            (COND
             ((|HasCategory| |#1| '(|PatternMatchable| (|Integer|)))
              (PROGN
               (QSETREFV $ 26
                         (COND
                          ((|HasCategory| |#2|
                                          '(|LiouvillianFunctionCategory|))
                           (|HasCategory| |#2| '(|RetractableTo| (|Symbol|))))
                          ('T NIL)))
               (COND
                ((QREFELT $ 26)
                 (PROGN
                  (QSETREFV $ 36
                            (CONS
                             (|dispatchFunction|
                              |FSCINT;internalIntegrate0;FSIr;3|)
                             $))))
                ('T
                 (QSETREFV $ 36
                           (CONS
                            (|dispatchFunction|
                             |FSCINT;internalIntegrate0;FSIr;4|)
                            $))))))
             ('T
              (QSETREFV $ 36
                        (CONS
                         (|dispatchFunction|
                          |FSCINT;internalIntegrate0;FSIr;5|)
                         $)))))
           ('T
            (QSETREFV $ 36
                      (CONS
                       (|dispatchFunction| |FSCINT;internalIntegrate0;FSIr;6|)
                       $))))
          $))) 

(MAKEPROP '|FunctionSpaceComplexIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'RTRIG
              (|List| 7) (|Kernel| 7) (0 . |argument|)
              (|Expression| (|Complex| 6))
              (|InnerTrigonometricManipulations| 6 7 12) (5 . F2FG)
              (10 . |tan|) (|Kernel| $) (15 . |retract|)
              (|IntegrationResult| 7) (|Symbol|)
              |FSCINT;internalIntegrate;FSIr;7|
              (|IntegrationResultToFunction| 6 7) (20 . |complexExpand|)
              (|IntegrationTools| 6 7) (25 . |removeConstantTerm|)
              |FSCINT;complexIntegrate;FSF;2| '#:G690
              (|ElementaryIntegration| 6 7) (31 . |lfintegrate|)
              (|Record| (|:| |special| 7) (|:| |integrand| 7))
              (|Union| 29 '"failed") (|PatternMatchIntegration| 6 7)
              (37 . |pmComplexintegrate|) (|Mapping| 18 7 19)
              (|Mapping| 30 7 19) (43 . |intPatternMatch|)
              (51 . |internalIntegrate0|) (57 . |coerce|) (62 . |distribute|)
              (|BasicOperator|) (68 . |operator|) (|Boolean|) (73 . |has?|)
              (|ElementaryFunctionStructurePackage| 6 7)
              (79 . |realElementary|) (|List| 16) (85 . |tower|)
              (90 . |coerce|) (|List| 19) (95 . |variables|) (100 . |member?|)
              (|Mapping| 41 10) (|List| 10) (106 . |any?|) (112 . |is?|)
              (|List| (|Kernel| 12)) (118 . |trigs2explogs|) (124 . FG2F)
              (|TrigonometricManipulations| 6 7) (129 . |real?|)
              (|Record| (|:| |func| 7) (|:| |kers| 52) (|:| |vals| 9))
              (134 . |rischNormalize|) (|AlgebraicManipulations| 6 7)
              (140 . |rootSimp|)
              (|Record| (|:| |func| 12) (|:| |kers| 55)
                        (|:| |vals| (|List| 12)))
              (|ElementaryFunctionStructurePackage| (|Complex| 6) 12)
              (145 . |rischNormalize|)
              (|AlgebraicManipulations| (|Complex| 6) 12) (151 . |rootSimp|)
              (|IntegrationResult| 12)
              (|ElementaryIntegration| (|Complex| 6) 12) (156 . |lfintegrate|)
              (|Mapping| 7 12) (|IntegrationResultFunctions2| 12 7)
              (162 . |map|))
           '#(|internalIntegrate0| 168 |internalIntegrate| 174
              |complexIntegrate| 180)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 74
                                                 '(1 10 9 0 11 1 13 12 7 14 1
                                                   12 0 0 15 1 12 16 0 17 1 21
                                                   7 18 22 2 23 7 7 19 24 2 27
                                                   18 7 19 28 2 31 30 7 19 32 4
                                                   23 18 7 19 33 34 35 2 0 18 7
                                                   19 36 1 7 0 19 37 2 7 0 0 0
                                                   38 1 10 39 0 40 2 39 41 0 19
                                                   42 2 43 7 7 19 44 1 7 45 0
                                                   46 1 7 0 16 47 1 7 48 0 49 2
                                                   48 41 19 0 50 2 52 41 51 0
                                                   53 2 10 41 0 19 54 2 13 12
                                                   12 55 56 1 13 7 12 57 1 58
                                                   41 7 59 2 43 60 7 19 61 1 62
                                                   7 7 63 2 65 64 12 19 66 1 67
                                                   12 12 68 2 70 69 12 19 71 2
                                                   73 18 72 69 74 2 0 18 7 19
                                                   36 2 0 18 7 19 20 2 0 7 7 19
                                                   25)))))
           '|lookupComplete|)) 
