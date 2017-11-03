
(SDEFUN |TESTCNT;testsuite;SV;1| ((|s| |String|) ($ |Void|))
        (SEQ (SPADCALL "clear all" (QREFELT $ 19))
             (EXIT (SPADCALL |s| (QREFELT $ 20))))) 

(SDEFUN |TESTCNT;testsuiteNoClear;SV;2| ((|s| |String|) ($ |Void|))
        (SEQ
         (COND
          ((SPADCALL (QCSIZE |s|) 15 (QREFELT $ 24))
           (SPADCALL
            (SPADCALL "WARNING: string for testsuite should have less than "
                      "15 characters!" (QREFELT $ 25))
            (QREFELT $ 27))))
         (SETELT $ 15 |s|)
         (EXIT
          (SPADCALL (CONS (QREFELT $ 15) (SPADCALL (QREFELT $ 29)))
                    (QREFELT $ 12) (QREFELT $ 31))))) 

(SDEFUN |TESTCNT;testcaseNoClear;SV;3| ((|s| |String|) ($ |Void|))
        (SEQ
         (COND
          ((SPADCALL (QCSIZE |s|) (- (QREFELT $ 6) (QCSIZE "  Testcase: "))
                     (QREFELT $ 33))
           (SPADCALL
            (SPADCALL "WARNING: string for testcase should have less than "
                      (SPADCALL
                       (STRINGIMAGE (- (QREFELT $ 6) (QCSIZE "  Testcase: ")))
                       " characters!" (QREFELT $ 25))
                      (QREFELT $ 25))
            (QREFELT $ 27))))
         (SETELT $ 14 |s|)
         (EXIT
          (SPADCALL (CONS (QREFELT $ 14) (VECTOR 0 0 0 0 NIL NIL NIL))
                    (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 34))
                    (QREFELT $ 36))))) 

(SDEFUN |TESTCNT;testcase;SV;4| ((|s| |String|) ($ |Void|))
        (SEQ (SPADCALL "clear all" (QREFELT $ 19))
             (EXIT (SPADCALL |s| (QREFELT $ 37))))) 

(SDEFUN |TESTCNT;incPass;V;5| (($ |Void|))
        (SPROG
         ((|cur|
           (|Record| (|:| |total| (|Integer|)) (|:| |fail| (|Integer|))
                     (|:| |xfail| (|Integer|)) (|:| |xfpass| (|Integer|))
                     (|:| |fatalities|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|)))))
                     (|:| |xfpassed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output| (|List| (|OutputForm|))))))
                     (|:| |failed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output|
                                          (|List| (|OutputForm|)))))))))
         (SEQ
          (LETT |cur|
                (SPADCALL
                 (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 34))
                 (QREFELT $ 14) (QREFELT $ 39))
                |TESTCNT;incPass;V;5|)
          (EXIT (QSETVELT |cur| 0 (+ (QVELT |cur| 0) 1)))))) 

(SDEFUN |TESTCNT;chkLibraryError;V;6| (($ |Void|))
        (SPROG
         ((|cur|
           (|Record| (|:| |total| (|Integer|)) (|:| |fail| (|Integer|))
                     (|:| |xfail| (|Integer|)) (|:| |xfpass| (|Integer|))
                     (|:| |fatalities|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|)))))
                     (|:| |xfpassed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output| (|List| (|OutputForm|))))))
                     (|:| |failed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output|
                                          (|List| (|OutputForm|)))))))))
         (SEQ
          (LETT |cur|
                (SPADCALL
                 (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 34))
                 (QREFELT $ 14) (QREFELT $ 39))
                |TESTCNT;chkLibraryError;V;6|)
          (EXIT (QSETVELT |cur| 0 (+ (QVELT |cur| 0) 1)))))) 

(SDEFUN |TESTCNT;incLibraryError;SLV;7|
        ((|inp| |String|) (|out| |List| (|OutputForm|)) ($ |Void|))
        (SPROG
         ((|cur|
           (|Record| (|:| |total| (|Integer|)) (|:| |fail| (|Integer|))
                     (|:| |xfail| (|Integer|)) (|:| |xfpass| (|Integer|))
                     (|:| |fatalities|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|)))))
                     (|:| |xfpassed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output| (|List| (|OutputForm|))))))
                     (|:| |failed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output|
                                          (|List| (|OutputForm|)))))))))
         (SEQ
          (LETT |cur|
                (SPADCALL
                 (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 34))
                 (QREFELT $ 14) (QREFELT $ 39))
                |TESTCNT;incLibraryError;SLV;7|)
          (QSETVELT |cur| 1 (+ (QVELT |cur| 1) 1))
          (EXIT
           (QSETVELT |cur| 6
                     (CONS (VECTOR (QVELT |cur| 0) |inp| |out|)
                           (QVELT |cur| 6))))))) 

(SDEFUN |TESTCNT;incXfLibraryError;SLV;8|
        ((|inp| |String|) (|out| |List| (|OutputForm|)) ($ |Void|))
        (SPROG
         ((|cur|
           (|Record| (|:| |total| (|Integer|)) (|:| |fail| (|Integer|))
                     (|:| |xfail| (|Integer|)) (|:| |xfpass| (|Integer|))
                     (|:| |fatalities|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|)))))
                     (|:| |xfpassed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output| (|List| (|OutputForm|))))))
                     (|:| |failed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output|
                                          (|List| (|OutputForm|)))))))))
         (SEQ
          (LETT |cur|
                (SPADCALL
                 (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 34))
                 (QREFELT $ 14) (QREFELT $ 39))
                |TESTCNT;incXfLibraryError;SLV;8|)
          (EXIT (QSETVELT |cur| 2 (+ (QVELT |cur| 2) 1)))))) 

(SDEFUN |TESTCNT;incXfFail;V;9| (($ |Void|))
        (SPROG
         ((|cur|
           (|Record| (|:| |total| (|Integer|)) (|:| |fail| (|Integer|))
                     (|:| |xfail| (|Integer|)) (|:| |xfpass| (|Integer|))
                     (|:| |fatalities|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|)))))
                     (|:| |xfpassed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output| (|List| (|OutputForm|))))))
                     (|:| |failed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output|
                                          (|List| (|OutputForm|)))))))))
         (SEQ
          (LETT |cur|
                (SPADCALL
                 (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 34))
                 (QREFELT $ 14) (QREFELT $ 39))
                |TESTCNT;incXfFail;V;9|)
          (QSETVELT |cur| 2 (+ (QVELT |cur| 2) 1))
          (EXIT (QSETVELT |cur| 0 (+ (QVELT |cur| 0) 1)))))) 

(SDEFUN |TESTCNT;incFail;SLV;10|
        ((|inp| |String|) (|out| |List| (|OutputForm|)) ($ |Void|))
        (SPROG
         ((|cur|
           (|Record| (|:| |total| (|Integer|)) (|:| |fail| (|Integer|))
                     (|:| |xfail| (|Integer|)) (|:| |xfpass| (|Integer|))
                     (|:| |fatalities|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|)))))
                     (|:| |xfpassed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output| (|List| (|OutputForm|))))))
                     (|:| |failed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output|
                                          (|List| (|OutputForm|)))))))))
         (SEQ
          (LETT |cur|
                (SPADCALL
                 (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 34))
                 (QREFELT $ 14) (QREFELT $ 39))
                |TESTCNT;incFail;SLV;10|)
          (QSETVELT |cur| 1 (+ (QVELT |cur| 1) 1))
          (QSETVELT |cur| 6
                    (CONS (VECTOR (QVELT |cur| 0) |inp| |out|)
                          (QVELT |cur| 6)))
          (EXIT (QSETVELT |cur| 0 (+ (QVELT |cur| 0) 1)))))) 

(SDEFUN |TESTCNT;incXfPass;SLV;11|
        ((|inp| |String|) (|out| |List| (|OutputForm|)) ($ |Void|))
        (SPROG
         ((|cur|
           (|Record| (|:| |total| (|Integer|)) (|:| |fail| (|Integer|))
                     (|:| |xfail| (|Integer|)) (|:| |xfpass| (|Integer|))
                     (|:| |fatalities|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|)))))
                     (|:| |xfpassed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output| (|List| (|OutputForm|))))))
                     (|:| |failed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output|
                                          (|List| (|OutputForm|)))))))))
         (SEQ
          (LETT |cur|
                (SPADCALL
                 (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 34))
                 (QREFELT $ 14) (QREFELT $ 39))
                |TESTCNT;incXfPass;SLV;11|)
          (QSETVELT |cur| 3 (+ (QVELT |cur| 3) 1))
          (QSETVELT |cur| 5
                    (CONS (VECTOR (QVELT |cur| 0) |inp| |out|)
                          (QVELT |cur| 5)))
          (EXIT (QSETVELT |cur| 0 (+ (QVELT |cur| 0) 1)))))) 

(SDEFUN |TESTCNT;decXfPass;V;12| (($ |Void|))
        (SPROG
         ((|cur|
           (|Record| (|:| |total| (|Integer|)) (|:| |fail| (|Integer|))
                     (|:| |xfail| (|Integer|)) (|:| |xfpass| (|Integer|))
                     (|:| |fatalities|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|)))))
                     (|:| |xfpassed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output| (|List| (|OutputForm|))))))
                     (|:| |failed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output|
                                          (|List| (|OutputForm|)))))))))
         (SEQ
          (LETT |cur|
                (SPADCALL
                 (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 34))
                 (QREFELT $ 14) (QREFELT $ 39))
                |TESTCNT;decXfPass;V;12|)
          (QSETVELT |cur| 0 (- (QVELT |cur| 0) 1))
          (QSETVELT |cur| 5 (CDR (QVELT |cur| 5)))
          (EXIT (QSETVELT |cur| 3 (- (QVELT |cur| 3) 1)))))) 

(SDEFUN |TESTCNT;incFatal;SV;13| ((|inp| |String|) ($ |Void|))
        (SPROG
         ((|cur|
           (|Record| (|:| |total| (|Integer|)) (|:| |fail| (|Integer|))
                     (|:| |xfail| (|Integer|)) (|:| |xfpass| (|Integer|))
                     (|:| |fatalities|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|)))))
                     (|:| |xfpassed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output| (|List| (|OutputForm|))))))
                     (|:| |failed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output|
                                          (|List| (|OutputForm|)))))))))
         (SEQ
          (LETT |cur|
                (SPADCALL
                 (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 34))
                 (QREFELT $ 14) (QREFELT $ 39))
                |TESTCNT;incFatal;SV;13|)
          (QSETVELT |cur| 0 (+ (QVELT |cur| 0) 1))
          (QSETVELT |cur| 1 (+ (QVELT |cur| 1) 1))
          (EXIT
           (QSETVELT |cur| 4
                     (CONS (CONS (QVELT |cur| 0) |inp|) (QVELT |cur| 4))))))) 

(SDEFUN |TESTCNT;decFatal;V;14| (($ |Void|))
        (SPROG
         ((|cur|
           (|Record| (|:| |total| (|Integer|)) (|:| |fail| (|Integer|))
                     (|:| |xfail| (|Integer|)) (|:| |xfpass| (|Integer|))
                     (|:| |fatalities|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|)))))
                     (|:| |xfpassed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output| (|List| (|OutputForm|))))))
                     (|:| |failed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output|
                                          (|List| (|OutputForm|)))))))))
         (SEQ
          (LETT |cur|
                (SPADCALL
                 (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 34))
                 (QREFELT $ 14) (QREFELT $ 39))
                |TESTCNT;decFatal;V;14|)
          (QSETVELT |cur| 0 (- (QVELT |cur| 0) 1))
          (QSETVELT |cur| 1 (- (QVELT |cur| 1) 1))
          (EXIT (QSETVELT |cur| 4 (CDR (QVELT |cur| 4))))))) 

(SDEFUN |TESTCNT;incXfFatal;SV;15| ((|inp| |String|) ($ |Void|))
        (SPROG
         ((|cur|
           (|Record| (|:| |total| (|Integer|)) (|:| |fail| (|Integer|))
                     (|:| |xfail| (|Integer|)) (|:| |xfpass| (|Integer|))
                     (|:| |fatalities|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|)))))
                     (|:| |xfpassed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output| (|List| (|OutputForm|))))))
                     (|:| |failed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output|
                                          (|List| (|OutputForm|)))))))))
         (SEQ
          (LETT |cur|
                (SPADCALL
                 (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 34))
                 (QREFELT $ 14) (QREFELT $ 39))
                |TESTCNT;incXfFatal;SV;15|)
          (QSETVELT |cur| 0 (+ (QVELT |cur| 0) 1))
          (EXIT (QSETVELT |cur| 2 (+ (QVELT |cur| 2) 1)))))) 

(SDEFUN |TESTCNT;decXfFatal;V;16| (($ |Void|))
        (SPROG
         ((|cur|
           (|Record| (|:| |total| (|Integer|)) (|:| |fail| (|Integer|))
                     (|:| |xfail| (|Integer|)) (|:| |xfpass| (|Integer|))
                     (|:| |fatalities|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|)))))
                     (|:| |xfpassed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output| (|List| (|OutputForm|))))))
                     (|:| |failed|
                          (|List|
                           (|Record| (|:| |index| (|Integer|))
                                     (|:| |input| (|String|))
                                     (|:| |output|
                                          (|List| (|OutputForm|)))))))))
         (SEQ
          (LETT |cur|
                (SPADCALL
                 (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 34))
                 (QREFELT $ 14) (QREFELT $ 39))
                |TESTCNT;decXfFatal;V;16|)
          (QSETVELT |cur| 0 (- (QVELT |cur| 0) 1))
          (EXIT (QSETVELT |cur| 2 (- (QVELT |cur| 2) 1)))))) 

(SDEFUN |TESTCNT;addWarning;OfV;17| ((|s| |OutputForm|) ($ |Void|))
        (SPROG ((|idx| (|Integer|)))
               (SEQ
                (LETT |idx|
                      (QVELT
                       (SPADCALL
                        (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 34))
                        (QREFELT $ 14) (QREFELT $ 39))
                       0)
                      |TESTCNT;addWarning;OfV;17|)
                (EXIT
                 (SETELT $ 13
                         (CONS
                          (SPADCALL
                           (LIST
                            (SPADCALL
                             (SPADCALL "Testsuite: " (QREFELT $ 15)
                                       (QREFELT $ 25))
                             (QREFELT $ 53))
                            (SPADCALL
                             (SPADCALL "Testcase: " (QREFELT $ 14)
                                       (QREFELT $ 25))
                             (QREFELT $ 53))
                            (SPADCALL
                             (SPADCALL "test: " (STRINGIMAGE |idx|)
                                       (QREFELT $ 25))
                             (QREFELT $ 53))
                            |s|)
                           (QREFELT $ 55))
                          (QREFELT $ 13))))))) 

(SDEFUN |TESTCNT;statistics;V;18| (($ |Void|))
        (SPROG
         ((#1=#:G853 NIL) (#2=#:G849 NIL) (#3=#:G845 NIL) (#4=#:G841 NIL)
          (#5=#:G837 NIL) (|stotalTests| #6=(|String|)) (|sfailedTests| #6#)
          (|stotalCases| #6#) (|sfailedCases| #6#)
          (|tsfailedTests| (|Integer|)) (|tstotalTests| (|Integer|))
          (|failedCases| (|Integer|)) (|totalCases| (|Integer|))
          (#7=#:G869 NIL) (|tstcase| NIL) (#8=#:G868 NIL) (|tstsuite| NIL)
          (#9=#:G867 NIL) (|f| NIL) (#10=#:G817 NIL) (#11=#:G866 NIL)
          (#12=#:G865 NIL) (|outstring| (|String|)) (#13=#:G863 NIL) (|o| NIL)
          (#14=#:G864 NIL) (|i| NIL) (#15=#:G862 NIL) (#16=#:G798 NIL)
          (#17=#:G861 NIL) (|xfpassedTests| (|Integer|))
          (|xfailedTests| (|Integer|)) (|failedTests| (|Integer|))
          (|totalTests| (|Integer|)) (|xfpassedCases| (|Integer|))
          (#18=#:G860 NIL) (#19=#:G859 NIL) (#20=#:G858 NIL) (|w| NIL))
         (SEQ
          (SPADCALL (|make_full_CVEC| (QREFELT $ 6) (|STR_to_CHAR| "="))
                    (QREFELT $ 27))
          (SPADCALL "General WARNINGS:" (QREFELT $ 27))
          (SPADCALL
           (SPADCALL "* do not use ')clear completely' before having used "
                     "'statistics()'" (QREFELT $ 25))
           (QREFELT $ 27))
          (SPADCALL "  It clears the statistics without warning!"
                    (QREFELT $ 27))
          (SPADCALL
           (SPADCALL "* do not forget to pass the arguments of the testXxxx "
                     "functions as Strings!" (QREFELT $ 25))
           (QREFELT $ 27))
          (SPADCALL
           (SPADCALL "  Otherwise, the test will fail and statistics() will "
                     "not notice!" (QREFELT $ 25))
           (QREFELT $ 27))
          (SPADCALL
           (SPADCALL "* testLibraryError does not prevent FriCAS from "
                     "aborting the current block." (QREFELT $ 25))
           (QREFELT $ 27))
          (SPADCALL
           (SPADCALL "  Thus, if a block contains other test functions, they "
                     "will not be executed" (QREFELT $ 25))
           (QREFELT $ 27))
          (SPADCALL "  and statistics() will not notice!" (QREFELT $ 27))
          (COND
           ((SPADCALL (LENGTH (QREFELT $ 13)) 0 (QREFELT $ 24))
            (SEQ
             (SPADCALL (|make_full_CVEC| (QREFELT $ 6) (|STR_to_CHAR| "="))
                       (QREFELT $ 27))
             (SPADCALL "WARNINGS:" (QREFELT $ 27))
             (EXIT
              (SEQ (LETT |w| NIL . #21=(|TESTCNT;statistics;V;18|))
                   (LETT #20# (REVERSE (QREFELT $ 13)) . #21#) G190
                   (COND
                    ((OR (ATOM #20#) (PROGN (LETT |w| (CAR #20#) . #21#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |w| (QREFELT $ 58))))
                   (LETT #20# (CDR #20#) . #21#) (GO G190) G191 (EXIT NIL))))))
          (SPADCALL "" (QREFELT $ 59)) (LETT |totalTests| 0 . #21#)
          (LETT |failedTests| 0 . #21#) (LETT |xfailedTests| 0 . #21#)
          (LETT |xfpassedTests| 0 . #21#)
          (SEQ (LETT |tstsuite| NIL . #21#)
               (LETT #19# (REVERSE (SPADCALL (QREFELT $ 12) (QREFELT $ 61)))
                     . #21#)
               G190
               (COND
                ((OR (ATOM #19#)
                     (PROGN (LETT |tstsuite| (CAR #19#) . #21#) NIL))
                 (GO G191)))
               (SEQ (LETT |failedCases| 0 . #21#)
                    (LETT |xfpassedCases| 0 . #21#)
                    (LETT |totalCases| 0 . #21#)
                    (SEQ (LETT |tstcase| NIL . #21#)
                         (LETT #18#
                               (REVERSE
                                (SPADCALL (QCDR |tstsuite|) (QREFELT $ 63)))
                               . #21#)
                         G190
                         (COND
                          ((OR (ATOM #18#)
                               (PROGN (LETT |tstcase| (CAR #18#) . #21#) NIL))
                           (GO G191)))
                         (SEQ (LETT |totalCases| (+ |totalCases| 1) . #21#)
                              (COND
                               ((SPADCALL (QVELT (QCDR |tstcase|) 1) 0
                                          (QREFELT $ 33))
                                (LETT |failedCases| (+ |failedCases| 1)
                                      . #21#)))
                              (COND
                               ((SPADCALL (QVELT (QCDR |tstcase|) 3) 0
                                          (QREFELT $ 33))
                                (LETT |xfpassedCases| (+ |xfpassedCases| 1)
                                      . #21#)))
                              (LETT |totalTests|
                                    (+ |totalTests| (QVELT (QCDR |tstcase|) 0))
                                    . #21#)
                              (LETT |failedTests|
                                    (+ |failedTests|
                                       (QVELT (QCDR |tstcase|) 1))
                                    . #21#)
                              (LETT |xfailedTests|
                                    (+ |xfailedTests|
                                       (QVELT (QCDR |tstcase|) 2))
                                    . #21#)
                              (EXIT
                               (LETT |xfpassedTests|
                                     (+ |xfpassedTests|
                                        (QVELT (QCDR |tstcase|) 3))
                                     . #21#)))
                         (LETT #18# (CDR #18#) . #21#) (GO G190) G191
                         (EXIT NIL))
                    (SPADCALL
                     (|make_full_CVEC| (QREFELT $ 6) (|STR_to_CHAR| "="))
                     (QREFELT $ 27))
                    (SPADCALL
                     (SPADCALL "Testsuite: " (QCAR |tstsuite|) (QREFELT $ 25))
                     (QREFELT $ 27))
                    (SPADCALL
                     (SPADCALL "  failed (total): "
                               (SPADCALL (STRINGIMAGE |failedCases|)
                                         (SPADCALL " ("
                                                   (SPADCALL
                                                    (STRINGIMAGE |totalCases|)
                                                    ")" (QREFELT $ 25))
                                                   (QREFELT $ 25))
                                         (QREFELT $ 25))
                               (QREFELT $ 25))
                     (QREFELT $ 27))
                    (COND
                     ((SPADCALL |failedCases| 0 (QREFELT $ 33))
                      (SEQ (SPADCALL "" (QREFELT $ 59))
                           (SPADCALL "  failed testcases were:" (QREFELT $ 27))
                           (EXIT
                            (SEQ (LETT |tstcase| NIL . #21#)
                                 (LETT #17#
                                       (REVERSE
                                        (SPADCALL (QCDR |tstsuite|)
                                                  (QREFELT $ 63)))
                                       . #21#)
                                 G190
                                 (COND
                                  ((OR (ATOM #17#)
                                       (PROGN
                                        (LETT |tstcase| (CAR #17#) . #21#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL (QVELT (QCDR |tstcase|) 1) 0
                                               (QREFELT $ 33))
                                     (SEQ
                                      (SPADCALL
                                       (SPADCALL "  "
                                                 (|make_full_CVEC|
                                                  (PROG1
                                                      (LETT #16#
                                                            (- (QREFELT $ 6) 2)
                                                            . #21#)
                                                    (|check_subtype2|
                                                     (>= #16# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #16#))
                                                  (|STR_to_CHAR| "-"))
                                                 (QREFELT $ 25))
                                       (QREFELT $ 27))
                                      (SPADCALL
                                       (SPADCALL "  Testcase: "
                                                 (QCAR |tstcase|)
                                                 (QREFELT $ 25))
                                       (QREFELT $ 27))
                                      (SPADCALL
                                       (SPADCALL "    failed (total): "
                                                 (SPADCALL
                                                  (STRINGIMAGE
                                                   (QVELT (QCDR |tstcase|) 1))
                                                  (SPADCALL " ("
                                                            (SPADCALL
                                                             (STRINGIMAGE
                                                              (QVELT
                                                               (QCDR |tstcase|)
                                                               0))
                                                             ")"
                                                             (QREFELT $ 25))
                                                            (QREFELT $ 25))
                                                  (QREFELT $ 25))
                                                 (QREFELT $ 25))
                                       (QREFELT $ 27))
                                      (COND
                                       ((NULL
                                         (NULL (QVELT (QCDR |tstcase|) 6)))
                                        (SEQ (SPADCALL "" (QREFELT $ 59))
                                             (SPADCALL "    failed tests were:"
                                                       (QREFELT $ 27))
                                             (EXIT
                                              (SEQ (LETT |f| NIL . #21#)
                                                   (LETT #15#
                                                         (REVERSE
                                                          (QVELT
                                                           (QCDR |tstcase|) 6))
                                                         . #21#)
                                                   G190
                                                   (COND
                                                    ((OR (ATOM #15#)
                                                         (PROGN
                                                          (LETT |f| (CAR #15#)
                                                                . #21#)
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (SPADCALL ""
                                                              (QREFELT $ 59))
                                                    (SPADCALL
                                                     (SPADCALL "      "
                                                               (SPADCALL
                                                                (STRINGIMAGE
                                                                 (QVELT |f| 0))
                                                                (SPADCALL ": "
                                                                          (QVELT
                                                                           |f|
                                                                           1)
                                                                          (QREFELT
                                                                           $
                                                                           25))
                                                                (QREFELT $ 25))
                                                               (QREFELT $ 25))
                                                     (QREFELT $ 27))
                                                    (EXIT
                                                     (SEQ (LETT |i| 1 . #21#)
                                                          (LETT #14#
                                                                (LENGTH
                                                                 (QVELT |f| 2))
                                                                . #21#)
                                                          (LETT |o| NIL . #21#)
                                                          (LETT #13#
                                                                (QVELT |f| 2)
                                                                . #21#)
                                                          G190
                                                          (COND
                                                           ((OR (ATOM #13#)
                                                                (PROGN
                                                                 (LETT |o|
                                                                       (CAR
                                                                        #13#)
                                                                       . #21#)
                                                                 NIL)
                                                                (|greater_SI|
                                                                 |i| #14#))
                                                            (GO G191)))
                                                          (SEQ
                                                           (LETT |outstring|
                                                                 (SPADCALL
                                                                  "      Output"
                                                                  (SPADCALL
                                                                   (STRINGIMAGE
                                                                    |i|)
                                                                   ": "
                                                                   (QREFELT $
                                                                            25))
                                                                  (QREFELT $
                                                                           25))
                                                                 . #21#)
                                                           (EXIT
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               |outstring|
                                                               (QREFELT $ 53))
                                                              |o|
                                                              (QREFELT $ 64))
                                                             (QREFELT $ 58))))
                                                          (LETT #13#
                                                                (PROG1
                                                                    (CDR #13#)
                                                                  (LETT |i|
                                                                        (|inc_SI|
                                                                         |i|)
                                                                        . #21#))
                                                                . #21#)
                                                          (GO G190) G191
                                                          (EXIT NIL))))
                                                   (LETT #15# (CDR #15#)
                                                         . #21#)
                                                   (GO G190) G191
                                                   (EXIT NIL))))))
                                      (EXIT
                                       (COND
                                        ((NULL
                                          (NULL (QVELT (QCDR |tstcase|) 4)))
                                         (SEQ (SPADCALL "" (QREFELT $ 59))
                                              (SPADCALL "  fatal tests were:"
                                                        (QREFELT $ 27))
                                              (EXIT
                                               (SEQ (LETT |f| NIL . #21#)
                                                    (LETT #12#
                                                          (REVERSE
                                                           (QVELT
                                                            (QCDR |tstcase|)
                                                            4))
                                                          . #21#)
                                                    G190
                                                    (COND
                                                     ((OR (ATOM #12#)
                                                          (PROGN
                                                           (LETT |f| (CAR #12#)
                                                                 . #21#)
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (SPADCALL ""
                                                               (QREFELT $ 59))
                                                     (EXIT
                                                      (SPADCALL
                                                       (SPADCALL "      "
                                                                 (SPADCALL
                                                                  (STRINGIMAGE
                                                                   (QCAR |f|))
                                                                  (SPADCALL
                                                                   ": "
                                                                   (QCDR |f|)
                                                                   (QREFELT $
                                                                            25))
                                                                  (QREFELT $
                                                                           25))
                                                                 (QREFELT $
                                                                          25))
                                                       (QREFELT $ 27))))
                                                    (LETT #12# (CDR #12#)
                                                          . #21#)
                                                    (GO G190) G191
                                                    (EXIT NIL))))))))))))
                                 (LETT #17# (CDR #17#) . #21#) (GO G190) G191
                                 (EXIT NIL))))))
                    (EXIT
                     (COND
                      ((SPADCALL |xfpassedCases| 0 (QREFELT $ 33))
                       (SEQ (SPADCALL "" (QREFELT $ 59))
                            (SPADCALL
                             "  testcases with unexpected passed tests were:"
                             (QREFELT $ 27))
                            (EXIT
                             (SEQ (LETT |tstcase| NIL . #21#)
                                  (LETT #11#
                                        (REVERSE
                                         (SPADCALL (QCDR |tstsuite|)
                                                   (QREFELT $ 63)))
                                        . #21#)
                                  G190
                                  (COND
                                   ((OR (ATOM #11#)
                                        (PROGN
                                         (LETT |tstcase| (CAR #11#) . #21#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL (QVELT (QCDR |tstcase|) 3) 0
                                                (QREFELT $ 33))
                                      (SEQ
                                       (SPADCALL
                                        (SPADCALL "  "
                                                  (|make_full_CVEC|
                                                   (PROG1
                                                       (LETT #10#
                                                             (- (QREFELT $ 6)
                                                                2)
                                                             . #21#)
                                                     (|check_subtype2|
                                                      (>= #10# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #10#))
                                                   (|STR_to_CHAR| "-"))
                                                  (QREFELT $ 25))
                                        (QREFELT $ 27))
                                       (SPADCALL
                                        (SPADCALL "  Testcase: "
                                                  (QCAR |tstcase|)
                                                  (QREFELT $ 25))
                                        (QREFELT $ 27))
                                       (EXIT
                                        (COND
                                         ((NULL
                                           (NULL (QVELT (QCDR |tstcase|) 5)))
                                          (SEQ (SPADCALL "" (QREFELT $ 59))
                                               (SPADCALL
                                                "  unexpected passed tests were:"
                                                (QREFELT $ 27))
                                               (EXIT
                                                (SEQ (LETT |f| NIL . #21#)
                                                     (LETT #9#
                                                           (REVERSE
                                                            (QVELT
                                                             (QCDR |tstcase|)
                                                             5))
                                                           . #21#)
                                                     G190
                                                     (COND
                                                      ((OR (ATOM #9#)
                                                           (PROGN
                                                            (LETT |f| (CAR #9#)
                                                                  . #21#)
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (SPADCALL ""
                                                                (QREFELT $ 59))
                                                      (EXIT
                                                       (SPADCALL
                                                        (SPADCALL "      "
                                                                  (SPADCALL
                                                                   (STRINGIMAGE
                                                                    (QVELT |f|
                                                                           0))
                                                                   (SPADCALL
                                                                    ": "
                                                                    (QVELT |f|
                                                                           1)
                                                                    (QREFELT $
                                                                             25))
                                                                   (QREFELT $
                                                                            25))
                                                                  (QREFELT $
                                                                           25))
                                                        (QREFELT $ 27))))
                                                     (LETT #9# (CDR #9#)
                                                           . #21#)
                                                     (GO G190) G191
                                                     (EXIT NIL))))))))))))
                                  (LETT #11# (CDR #11#) . #21#) (GO G190) G191
                                  (EXIT NIL))))))))
               (LETT #19# (CDR #19#) . #21#) (GO G190) G191 (EXIT NIL))
          (SPADCALL "" (QREFELT $ 59))
          (SPADCALL (|make_full_CVEC| (QREFELT $ 6) (|STR_to_CHAR| "="))
                    (QREFELT $ 27))
          (SPADCALL
           "testsuite | testcases: failed (total) | tests: failed (total)"
           (QREFELT $ 27))
          (SEQ (LETT |tstsuite| NIL . #21#)
               (LETT #8# (REVERSE (SPADCALL (QREFELT $ 12) (QREFELT $ 61)))
                     . #21#)
               G190
               (COND
                ((OR (ATOM #8#) (PROGN (LETT |tstsuite| (CAR #8#) . #21#) NIL))
                 (GO G191)))
               (SEQ (LETT |failedCases| 0 . #21#) (LETT |totalCases| 0 . #21#)
                    (LETT |tsfailedTests| 0 . #21#)
                    (LETT |tstotalTests| 0 . #21#)
                    (SEQ (LETT |tstcase| NIL . #21#)
                         (LETT #7#
                               (REVERSE
                                (SPADCALL (QCDR |tstsuite|) (QREFELT $ 63)))
                               . #21#)
                         G190
                         (COND
                          ((OR (ATOM #7#)
                               (PROGN (LETT |tstcase| (CAR #7#) . #21#) NIL))
                           (GO G191)))
                         (SEQ (LETT |totalCases| (+ |totalCases| 1) . #21#)
                              (COND
                               ((SPADCALL (QVELT (QCDR |tstcase|) 1) 0
                                          (QREFELT $ 33))
                                (LETT |failedCases| (+ |failedCases| 1)
                                      . #21#)))
                              (LETT |tstotalTests|
                                    (+ |tstotalTests|
                                       (QVELT (QCDR |tstcase|) 0))
                                    . #21#)
                              (EXIT
                               (LETT |tsfailedTests|
                                     (+ |tsfailedTests|
                                        (QVELT (QCDR |tstcase|) 1))
                                     . #21#)))
                         (LETT #7# (CDR #7#) . #21#) (GO G190) G191 (EXIT NIL))
                    (LETT |sfailedCases| (STRINGIMAGE |failedCases|) . #21#)
                    (LETT |stotalCases| (STRINGIMAGE |totalCases|) . #21#)
                    (LETT |sfailedTests| (STRINGIMAGE |tsfailedTests|) . #21#)
                    (LETT |stotalTests| (STRINGIMAGE |tstotalTests|) . #21#)
                    (EXIT
                     (SPADCALL
                      (SPADCALL (QCAR |tstsuite|)
                                (SPADCALL
                                 (|make_full_CVEC|
                                  (PROG1
                                      (LETT #5#
                                            (MAX
                                             (- 24 (QCSIZE (QCAR |tstsuite|)))
                                             0)
                                            . #21#)
                                    (|check_subtype2| (>= #5# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #5#))
                                  (|STR_to_CHAR| " "))
                                 (SPADCALL
                                  (|make_full_CVEC|
                                   (PROG1
                                       (LETT #4#
                                             (MAX (- 5 (QCSIZE |sfailedCases|))
                                                  0)
                                             . #21#)
                                     (|check_subtype2| (>= #4# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #4#))
                                   (|STR_to_CHAR| " "))
                                  (SPADCALL |sfailedCases|
                                            (SPADCALL
                                             (|make_full_CVEC|
                                              (PROG1
                                                  (LETT #3#
                                                        (MAX
                                                         (- 6
                                                            (QCSIZE
                                                             |stotalCases|))
                                                         0)
                                                        . #21#)
                                                (|check_subtype2| (>= #3# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #3#))
                                              (|STR_to_CHAR| " "))
                                             (SPADCALL "("
                                                       (SPADCALL |stotalCases|
                                                                 (SPADCALL ")"
                                                                           (SPADCALL
                                                                            (|make_full_CVEC|
                                                                             (PROG1
                                                                                 (LETT
                                                                                  #2#
                                                                                  (MAX
                                                                                   (-
                                                                                    16
                                                                                    (QCSIZE
                                                                                     |sfailedTests|))
                                                                                   0)
                                                                                  . #21#)
                                                                               (|check_subtype2|
                                                                                (>=
                                                                                 #2#
                                                                                 0)
                                                                                '(|NonNegativeInteger|)
                                                                                '(|Integer|)
                                                                                #2#))
                                                                             (|STR_to_CHAR|
                                                                              " "))
                                                                            (SPADCALL
                                                                             |sfailedTests|
                                                                             (SPADCALL
                                                                              (|make_full_CVEC|
                                                                               (PROG1
                                                                                   (LETT
                                                                                    #1#
                                                                                    (MAX
                                                                                     (-
                                                                                      6
                                                                                      (QCSIZE
                                                                                       |stotalTests|))
                                                                                     0)
                                                                                    . #21#)
                                                                                 (|check_subtype2|
                                                                                  (>=
                                                                                   #1#
                                                                                   0)
                                                                                  '(|NonNegativeInteger|)
                                                                                  '(|Integer|)
                                                                                  #1#))
                                                                               (|STR_to_CHAR|
                                                                                " "))
                                                                              (SPADCALL
                                                                               "("
                                                                               (SPADCALL
                                                                                |stotalTests|
                                                                                ")"
                                                                                (QREFELT
                                                                                 $
                                                                                 25))
                                                                               (QREFELT
                                                                                $
                                                                                25))
                                                                              (QREFELT
                                                                               $
                                                                               25))
                                                                             (QREFELT
                                                                              $
                                                                              25))
                                                                            (QREFELT
                                                                             $
                                                                             25))
                                                                           (QREFELT
                                                                            $
                                                                            25))
                                                                 (QREFELT $
                                                                          25))
                                                       (QREFELT $ 25))
                                             (QREFELT $ 25))
                                            (QREFELT $ 25))
                                  (QREFELT $ 25))
                                 (QREFELT $ 25))
                                (QREFELT $ 25))
                      (QREFELT $ 27))))
               (LETT #8# (CDR #8#) . #21#) (GO G190) G191 (EXIT NIL))
          (SPADCALL (|make_full_CVEC| (QREFELT $ 6) (|STR_to_CHAR| "="))
                    (QREFELT $ 27))
          (SPADCALL "File summary." (QREFELT $ 27))
          (SPADCALL
           (SPADCALL "unexpected failures: " (STRINGIMAGE |failedTests|)
                     (QREFELT $ 25))
           (QREFELT $ 27))
          (SPADCALL
           (SPADCALL "expected failures: " (STRINGIMAGE |xfailedTests|)
                     (QREFELT $ 25))
           (QREFELT $ 27))
          (SPADCALL
           (SPADCALL "unexpected passes: " (STRINGIMAGE |xfpassedTests|)
                     (QREFELT $ 25))
           (QREFELT $ 27))
          (EXIT
           (SPADCALL
            (SPADCALL "total tests: " (STRINGIMAGE |totalTests|)
                      (QREFELT $ 25))
            (QREFELT $ 27)))))) 

(DECLAIM (NOTINLINE |UnittestCount;|)) 

(DEFUN |UnittestCount| ()
  (SPROG NIL
         (PROG (#1=#:G871)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|UnittestCount|)
                    . #2=(|UnittestCount|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|UnittestCount|
                             (LIST (CONS NIL (CONS 1 (|UnittestCount;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|UnittestCount|)))))))))) 

(DEFUN |UnittestCount;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|UnittestCount|) . #1=(|UnittestCount|))
          (LETT $ (GETREFV 66) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|UnittestCount| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 77)
          (QSETREFV $ 12 (SPADCALL (QREFELT $ 11)))
          (QSETREFV $ 13 NIL)
          (QSETREFV $ 14 #2="")
          (QSETREFV $ 15 #2#)
          $))) 

(MAKEPROP '|UnittestCount| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|maxWidth|
              (|Record| (|:| |index| 32) (|:| |input| 17))
              (|Record| (|:| |index| 32) (|:| |input| 17) (|:| |output| 42))
              (|Record| (|:| |total| 32) (|:| |fail| 32) (|:| |xfail| 32)
                        (|:| |xfpass| 32) (|:| |fatalities| (|List| 7))
                        (|:| |xfpassed| (|List| 8)) (|:| |failed| (|List| 8)))
              (|AssociationList| 17 28) (0 . |empty|) '|tests| '|warnings|
              '|currentTestcase| '|currentTestsuite| (|Void|) (|String|)
              (|MoreSystemCommands|) (4 . |systemCommand|)
              |TESTCNT;testsuiteNoClear;SV;2| |TESTCNT;testsuite;SV;1|
              (|Boolean|) (|NonNegativeInteger|) (9 . >) (15 . |elt|)
              (|OutputForm|) (21 . |messagePrint|) (|AssociationList| 17 9)
              (26 . |empty|) (|Record| (|:| |key| 17) (|:| |entry| 28))
              (30 . |insert!|) (|Integer|) (36 . >) (42 . |elt|)
              (|Record| (|:| |key| 17) (|:| |entry| 9)) (48 . |insert!|)
              |TESTCNT;testcaseNoClear;SV;3| |TESTCNT;testcase;SV;4|
              (54 . |elt|) |TESTCNT;incPass;V;5| |TESTCNT;chkLibraryError;V;6|
              (|List| 26) |TESTCNT;incLibraryError;SLV;7|
              |TESTCNT;incXfLibraryError;SLV;8| |TESTCNT;incXfFail;V;9|
              |TESTCNT;incFail;SLV;10| |TESTCNT;incXfPass;SLV;11|
              |TESTCNT;decXfPass;V;12| |TESTCNT;incFatal;SV;13|
              |TESTCNT;decFatal;V;14| |TESTCNT;incXfFatal;SV;15|
              |TESTCNT;decXfFatal;V;16| (60 . |message|) (|List| $)
              (65 . |pile|) |TESTCNT;addWarning;OfV;17| (|OutputPackage|)
              (70 . |output|) (75 . |output|) (|List| 30) (80 . |parts|)
              (|List| 35) (85 . |parts|) (90 . |hconcat|)
              |TESTCNT;statistics;V;18|)
           '#(|testsuiteNoClear| 96 |testsuite| 101 |testcaseNoClear| 106
              |testcase| 111 |statistics| 116 |incXfPass| 120
              |incXfLibraryError| 126 |incXfFatal| 132 |incXfFail| 137
              |incPass| 141 |incLibraryError| 145 |incFatal| 151 |incFail| 156
              |decXfPass| 162 |decXfFatal| 166 |decFatal| 170 |chkLibraryError|
              174 |addWarning| 178)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 65
                                                 '(0 10 0 11 1 18 16 17 19 2 23
                                                   22 0 0 24 2 17 0 0 0 25 1 26
                                                   16 17 27 0 28 0 29 2 10 0 30
                                                   0 31 2 32 22 0 0 33 2 10 28
                                                   0 17 34 2 28 0 35 0 36 2 28
                                                   9 0 17 39 1 26 0 17 53 1 26
                                                   0 54 55 1 57 16 26 58 1 57
                                                   16 17 59 1 10 60 0 61 1 28
                                                   62 0 63 2 26 0 0 0 64 1 0 16
                                                   17 20 1 0 16 17 21 1 0 16 17
                                                   37 1 0 16 17 38 0 0 16 65 2
                                                   0 16 17 42 47 2 0 16 17 42
                                                   44 1 0 16 17 51 0 0 16 45 0
                                                   0 16 40 2 0 16 17 42 43 1 0
                                                   16 17 49 2 0 16 17 42 46 0 0
                                                   16 48 0 0 16 52 0 0 16 50 0
                                                   0 16 41 1 0 16 26 56)))))
           '|lookupComplete|)) 

(MAKEPROP '|UnittestCount| 'NILADIC T) 
