
(SDEFUN |TESTUNIT;interpretFunction1|
        ((|f| (|Symbol|)) (|info| (|String|)) (|arg| (|String|)) (% (|Any|)))
        (SPROG
         ((|info_f| (|InputForm|)) (|ff| (|InputForm|)) (|if1| (|InputForm|)))
         (SEQ (LETT |if1| (SPADCALL |arg| (QREFELT % 8)))
              (LETT |ff| (SPADCALL |f| (QREFELT % 10))) (LETT |info_f| |info|)
              (EXIT
               (SPADCALL (SPADCALL (LIST |ff| |info_f| |if1|) (QREFELT % 12))
                         (QREFELT % 14)))))) 

(SDEFUN |TESTUNIT;interpretFunction2|
        ((|f| (|Symbol|)) (|info| (|String|)) (|arg1| (|String|))
         (|arg2| (|String|)) (% (|Any|)))
        (SPROG
         ((|info_f| (|InputForm|)) (|ff| (|InputForm|))
          (|if2| #1=(|InputForm|)) (|if1| #1#))
         (SEQ (LETT |if1| (SPADCALL |arg1| (QREFELT % 8)))
              (LETT |if2| (SPADCALL |arg2| (QREFELT % 8)))
              (LETT |ff| (SPADCALL |f| (QREFELT % 10))) (LETT |info_f| |info|)
              (EXIT
               (SPADCALL
                (SPADCALL (LIST |ff| |info_f| |if1| |if2|) (QREFELT % 12))
                (QREFELT % 14)))))) 

(SDEFUN |TESTUNIT;do_interpret1|
        ((|label| (|String|)) (|fun| (|Symbol|)) (|arg| (|String|))
         (|upd| (|Mapping| (|Void|) (|String|))) (% (|Void|)))
        (SPROG ((|ru| (|Union| (|None|) "failed")) (|inp| (|String|)))
               (SEQ (SPADCALL (QREFELT % 17))
                    (LETT |inp|
                          (SPADCALL |label|
                                    (SPADCALL ": ("
                                              (SPADCALL |arg| ")"
                                                        (QREFELT % 18))
                                              (QREFELT % 18))
                                    (QREFELT % 18)))
                    (LETT |ru|
                          (|trappedSpadEval|
                           (|TESTUNIT;interpretFunction1| |fun| |inp| |arg|
                            %)))
                    (EXIT (COND ((QEQCAR |ru| 1) (SPADCALL |inp| |upd|))))))) 

(SDEFUN |TESTUNIT;do_interpret2|
        ((|label| (|String|)) (|fun| (|Symbol|)) (|a1| (|String|))
         (|a2| (|String|)) (|upd| (|Mapping| (|Void|) (|String|)))
         (% (|Void|)))
        (SPROG ((|ru| (|Union| (|None|) "failed")) (|inp| (|String|)))
               (SEQ (SPADCALL (QREFELT % 17))
                    (LETT |inp|
                          (SPADCALL |label|
                                    (SPADCALL ": ("
                                              (SPADCALL |a1|
                                                        (SPADCALL ", "
                                                                  (SPADCALL
                                                                   |a2| ")"
                                                                   (QREFELT %
                                                                            18))
                                                                  (QREFELT %
                                                                           18))
                                                        (QREFELT % 18))
                                              (QREFELT % 18))
                                    (QREFELT % 18)))
                    (LETT |ru|
                          (|trappedSpadEval|
                           (|TESTUNIT;interpretFunction2| |fun| |inp| |a1| |a2|
                            %)))
                    (EXIT (COND ((QEQCAR |ru| 1) (SPADCALL |inp| |upd|))))))) 

(SDEFUN |TESTUNIT;do_test2|
        ((|label| (|String|)) (|fun| (|Symbol|)) (|a1| (|String|))
         (|a2| (|String|)) (% (|Void|)))
        (|TESTUNIT;do_interpret2| |label| |fun| |a1| |a2| (ELT % 19) %)) 

(SDEFUN |TESTUNIT;do_xf_test2|
        ((|label| (|String|)) (|fun| (|Symbol|)) (|a1| (|String|))
         (|a2| (|String|)) (% (|Void|)))
        (|TESTUNIT;do_interpret2| |label| |fun| |a1| |a2| (ELT % 20) %)) 

(SDEFUN |TESTUNIT;testEquals;2SV;7|
        ((|s1| (|String|)) (|s2| (|String|)) (% (|Void|)))
        (|TESTUNIT;do_test2| "EQUL" '|testEqualsAux| |s1| |s2| %)) 

(SDEFUN |TESTUNIT;xftestEquals;2SV;8|
        ((|s1| (|String|)) (|s2| (|String|)) (% (|Void|)))
        (|TESTUNIT;do_xf_test2| "EQUL" '|xftestEqualsAux| |s1| |s2| %)) 

(SDEFUN |TESTUNIT;testRealEquals;2SV;9|
        ((|s1| (|String|)) (|s2| (|String|)) (% (|Void|)))
        (|TESTUNIT;do_test2| "EQLR" '|testRealEqualsAux| |s1| |s2| %)) 

(SDEFUN |TESTUNIT;xftestRealEquals;2SV;10|
        ((|s1| (|String|)) (|s2| (|String|)) (% (|Void|)))
        (|TESTUNIT;do_xf_test2| "EQLR" '|xftestRealEqualsAux| |s1| |s2| %)) 

(SDEFUN |TESTUNIT;testComplexEquals;2SV;11|
        ((|s1| (|String|)) (|s2| (|String|)) (% (|Void|)))
        (|TESTUNIT;do_test2| "EQLC" '|testComplexEqualsAux| |s1| |s2| %)) 

(SDEFUN |TESTUNIT;xftestComplexEquals;2SV;12|
        ((|s1| (|String|)) (|s2| (|String|)) (% (|Void|)))
        (|TESTUNIT;do_xf_test2| "EQLC" '|xftestComplexEqualsAux| |s1| |s2| %)) 

(SDEFUN |TESTUNIT;testNotEquals;2SV;13|
        ((|s1| (|String|)) (|s2| (|String|)) (% (|Void|)))
        (|TESTUNIT;do_test2| "DIFF" '|testNotEqualsAux| |s1| |s2| %)) 

(SDEFUN |TESTUNIT;xftestNotEquals;2SV;14|
        ((|s1| (|String|)) (|s2| (|String|)) (% (|Void|)))
        (|TESTUNIT;do_xf_test2| "DIFF" '|xftestNotEqualsAux| |s1| |s2| %)) 

(SDEFUN |TESTUNIT;testTrue;SV;15| ((|s| (|String|)) (% (|Void|)))
        (|TESTUNIT;do_interpret1| "TRUE" '|testTrueAux| |s| (ELT % 19) %)) 

(SDEFUN |TESTUNIT;xftestTrue;SV;16| ((|s| (|String|)) (% (|Void|)))
        (|TESTUNIT;do_interpret1| "TRUE" '|xftestTrueAux| |s| (ELT % 20) %)) 

(SDEFUN |TESTUNIT;testLibraryError;SV;17| ((|s| (|String|)) (% (|Void|)))
        (|TESTUNIT;do_interpret1| "ERROR" '|testLibraryErrorAux| |s|
         (CONS #'|TESTUNIT;testLibraryError;SV;17!0| %) %)) 

(SDEFUN |TESTUNIT;testLibraryError;SV;17!0| ((|dummy| NIL) (% NIL))
        (SPADCALL (QREFELT % 31))) 

(SDEFUN |TESTUNIT;xftestLibraryError;SV;18| ((|s| (|String|)) (% (|Void|)))
        (|TESTUNIT;do_interpret1| "ERROR" '|xftestLibraryErrorAux| |s|
         (CONS #'|TESTUNIT;xftestLibraryError;SV;18!0| %) %)) 

(SDEFUN |TESTUNIT;xftestLibraryError;SV;18!0| ((|inp| NIL) (% NIL))
        (SPADCALL |inp| (SPADCALL (QREFELT % 34)) (QREFELT % 35))) 

(DECLAIM (NOTINLINE |Unittest;|)) 

(DEFUN |Unittest;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Unittest|))
          (LETT % (GETREFV 37))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|Unittest| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |Unittest| ()
  (SPROG NIL
         (PROG (#1=#:G35)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Unittest|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Unittest|
                             (LIST (CONS NIL (CONS 1 (|Unittest;|))))))
                    (LETT #1# T))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Unittest|)))))))))) 

(MAKEPROP '|Unittest| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|String|) (|InputForm|) (0 . |parse|)
              (|Symbol|) (5 . |convert|) (|List| %) (10 . |convert|) (|Any|)
              (15 . |interpret|) (|Void|) (|UnittestCount|) (20 . |incTest|)
              (24 . |elt|) (30 . |incFatal|) (35 . |incXfFatal|)
              |TESTUNIT;testEquals;2SV;7| |TESTUNIT;xftestEquals;2SV;8|
              |TESTUNIT;testRealEquals;2SV;9|
              |TESTUNIT;xftestRealEquals;2SV;10|
              |TESTUNIT;testComplexEquals;2SV;11|
              |TESTUNIT;xftestComplexEquals;2SV;12|
              |TESTUNIT;testNotEquals;2SV;13| |TESTUNIT;xftestNotEquals;2SV;14|
              |TESTUNIT;testTrue;SV;15| |TESTUNIT;xftestTrue;SV;16|
              (40 . |void|) |TESTUNIT;testLibraryError;SV;17|
              (|List| (|OutputForm|)) (44 . |empty|) (48 . |incXfPass|)
              |TESTUNIT;xftestLibraryError;SV;18|)
           '#(|xftestTrue| 54 |xftestRealEquals| 59 |xftestNotEquals| 65
              |xftestLibraryError| 71 |xftestEquals| 76 |xftestComplexEquals|
              82 |testTrue| 88 |testRealEquals| 93 |testNotEquals| 99
              |testLibraryError| 105 |testEquals| 110 |testComplexEquals| 116)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|testEquals| ((|Void|) (|String|) (|String|)))
                                T)
                              '((|xftestEquals|
                                 ((|Void|) (|String|) (|String|)))
                                T)
                              '((|testRealEquals|
                                 ((|Void|) (|String|) (|String|)))
                                T)
                              '((|xftestRealEquals|
                                 ((|Void|) (|String|) (|String|)))
                                T)
                              '((|testComplexEquals|
                                 ((|Void|) (|String|) (|String|)))
                                T)
                              '((|xftestComplexEquals|
                                 ((|Void|) (|String|) (|String|)))
                                T)
                              '((|testNotEquals|
                                 ((|Void|) (|String|) (|String|)))
                                T)
                              '((|xftestNotEquals|
                                 ((|Void|) (|String|) (|String|)))
                                T)
                              '((|testTrue| ((|Void|) (|String|))) T)
                              '((|xftestTrue| ((|Void|) (|String|))) T)
                              '((|testLibraryError| ((|Void|) (|String|))) T)
                              '((|xftestLibraryError| ((|Void|) (|String|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 36
                                            '(1 7 0 6 8 1 9 7 0 10 1 7 0 11 12
                                              1 7 13 0 14 0 16 15 17 2 6 0 0 0
                                              18 1 16 15 6 19 1 16 15 6 20 0 15
                                              0 31 0 33 0 34 2 16 15 6 33 35 1
                                              0 15 6 30 2 0 15 6 6 24 2 0 15 6
                                              6 28 1 0 15 6 36 2 0 15 6 6 22 2
                                              0 15 6 6 26 1 0 15 6 29 2 0 15 6
                                              6 23 2 0 15 6 6 27 1 0 15 6 32 2
                                              0 15 6 6 21 2 0 15 6 6 25)))))
           '|lookupComplete|)) 
