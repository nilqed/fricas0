
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
         ((|g| (F)) (|h| (|Expression| (|Complex| R))) (#1=#:G411 NIL)
          (|k| NIL) (#2=#:G410 NIL) (#3=#:G409 NIL) (#4=#:G408 NIL))
         (SEQ
          (LETT |f|
                (SPADCALL |f| (SPADCALL |x| (QREFELT $ 37)) (QREFELT $ 38)))
          (EXIT
           (COND
            ((SPADCALL
              (CONS #'|FSCINT;internalIntegrate;FSIr;7!0|
                    (VECTOR (QREFELT $ 8) $))
              (PROGN
               (LETT #4# NIL)
               (SEQ (LETT |k| NIL)
                    (LETT #3#
                          (SPADCALL
                           (LETT |g| (SPADCALL |f| |x| (QREFELT $ 44)))
                           (QREFELT $ 46)))
                    G190
                    (COND
                     ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#)) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL |x|
                                  (SPADCALL (SPADCALL |k| (QREFELT $ 47))
                                            (QREFELT $ 49))
                                  (QREFELT $ 50))
                        (LETT #4# (CONS |k| #4#))))))
                    (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT (NREVERSE #4#))))
              (QREFELT $ 53))
             (SEQ
              (LETT |h|
                    (SPADCALL (SPADCALL |g| (QREFELT $ 14))
                              (PROGN
                               (LETT #2# NIL)
                               (SEQ (LETT |k| NIL)
                                    (LETT #1# (SPADCALL |f| (QREFELT $ 46)))
                                    G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN (LETT |k| (CAR #1#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((COND
                                         ((SPADCALL |k| '|tan| (QREFELT $ 54))
                                          'T)
                                         (#5='T
                                          (SPADCALL |k| '|cot|
                                                    (QREFELT $ 54))))
                                        (LETT #2#
                                              (CONS (|FSCINT;K2KG| |k| $)
                                                    #2#))))))
                                    (LETT #1# (CDR #1#)) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT $ 56)))
              (EXIT
               (COND
                ((SPADCALL (LETT |g| (SPADCALL |h| (QREFELT $ 57)))
                           (QREFELT $ 59))
                 (SPADCALL (QVELT (SPADCALL |g| |x| (QREFELT $ 61)) 0) |x|
                           (QREFELT $ 36)))
                ((SPADCALL
                  (LETT |g|
                        (SPADCALL
                         (LETT |h| (QVELT (SPADCALL |h| |x| (QREFELT $ 64)) 0))
                         (QREFELT $ 57)))
                  (QREFELT $ 59))
                 (SPADCALL |g| |x| (QREFELT $ 36)))
                (#5#
                 (SPADCALL (ELT $ 57) (SPADCALL |h| |x| (QREFELT $ 67))
                           (QREFELT $ 70)))))))
            (#5#
             (SPADCALL (QVELT (SPADCALL |g| |x| (QREFELT $ 61)) 0) |x|
                       (QREFELT $ 36)))))))) 

(SDEFUN |FSCINT;internalIntegrate;FSIr;7!0| ((|x1| NIL) ($$ NIL))
        (PROG ($ RTRIG)
          (LETT $ (QREFELT $$ 1))
          (LETT RTRIG (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x1| (QREFELT $ 40)) RTRIG (QREFELT $ 42)))))) 

(DECLAIM (NOTINLINE |FunctionSpaceComplexIntegration;|)) 

(DEFUN |FunctionSpaceComplexIntegration| (&REST #1=#:G412)
  (SPROG NIL
         (PROG (#2=#:G413)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FunctionSpaceComplexIntegration|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |FunctionSpaceComplexIntegration;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FunctionSpaceComplexIntegration|)))))))))) 

(DEFUN |FunctionSpaceComplexIntegration;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|FunctionSpaceComplexIntegration| DV$1 DV$2))
          (LETT $ (GETREFV 71))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
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
              |FSCINT;complexIntegrate;FSF;2| '#:G378
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
              (134 . |rischNormalize|)
              (|Record| (|:| |func| 12) (|:| |kers| 55)
                        (|:| |vals| (|List| 12)))
              (|ElementaryFunctionStructurePackage| (|Complex| 6) 12)
              (140 . |rischNormalize|) (|IntegrationResult| 12)
              (|ElementaryIntegration| (|Complex| 6) 12) (146 . |lfintegrate|)
              (|Mapping| 7 12) (|IntegrationResultFunctions2| 12 7)
              (152 . |map|))
           '#(|internalIntegrate0| 158 |internalIntegrate| 164
              |complexIntegrate| 170)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|internalIntegrate|
                                 ((|IntegrationResult| |#2|) |#2| (|Symbol|)))
                                T)
                              '((|internalIntegrate0|
                                 ((|IntegrationResult| |#2|) |#2| (|Symbol|)))
                                T)
                              '((|complexIntegrate| (|#2| |#2| (|Symbol|))) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 70
                                            '(1 10 9 0 11 1 13 12 7 14 1 12 0 0
                                              15 1 12 16 0 17 1 21 7 18 22 2 23
                                              7 7 19 24 2 27 18 7 19 28 2 31 30
                                              7 19 32 4 23 18 7 19 33 34 35 2 0
                                              18 7 19 36 1 7 0 19 37 2 7 0 0 0
                                              38 1 10 39 0 40 2 39 41 0 19 42 2
                                              43 7 7 19 44 1 7 45 0 46 1 7 0 16
                                              47 1 7 48 0 49 2 48 41 19 0 50 2
                                              52 41 51 0 53 2 10 41 0 19 54 2
                                              13 12 12 55 56 1 13 7 12 57 1 58
                                              41 7 59 2 43 60 7 19 61 2 63 62
                                              12 19 64 2 66 65 12 19 67 2 69 18
                                              68 65 70 2 0 18 7 19 36 2 0 18 7
                                              19 20 2 0 7 7 19 25)))))
           '|lookupComplete|)) 
