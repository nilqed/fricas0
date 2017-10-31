
(SDEFUN |POSET-;addObject;ASA;1| ((|s| A) (|n| S) ($ A))
        (SPROG
         ((|arrows| (|List| (|List| (|Boolean|))))
          (|emptyRow| (|List| (|Boolean|))) (#1=#:G769 NIL) (|x| NIL)
          (#2=#:G768 NIL) (|a| (|List| (|Boolean|))) (#3=#:G767 NIL)
          (|diff| (|NonNegativeInteger|)) (#4=#:G752 NIL)
          (|padding| (|Union| (|NonNegativeInteger|) "failed"))
          (|width| (|NonNegativeInteger|)) (#5=#:G766 NIL) (|obs| (|List| S))
          (|dim| (|NonNegativeInteger|)))
         (SEQ
          (LETT |dim| (+ (LENGTH (SPADCALL |s| (QREFELT $ 9))) 1)
                . #6=(|POSET-;addObject;ASA;1|))
          (LETT |obs|
                (SPADCALL (SPADCALL |s| (QREFELT $ 9)) |n| (QREFELT $ 10))
                . #6#)
          (LETT |arrows| NIL . #6#)
          (SEQ (LETT |a| NIL . #6#)
               (LETT #5# (SPADCALL |s| (QREFELT $ 12)) . #6#) G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |a| (CAR #5#) . #6#) NIL))
                 (GO G191)))
               (SEQ (LETT |width| (LENGTH |a|) . #6#)
                    (LETT |padding| (SPADCALL |dim| |width| (QREFELT $ 15))
                          . #6#)
                    (COND
                     ((SPADCALL |padding| (CONS 1 "failed") (QREFELT $ 18))
                      (SEQ
                       (LETT |diff|
                             (PROG2 (LETT #4# |padding| . #6#)
                                 (QCDR #4#)
                               (|check_union2| (QEQCAR #4# 0)
                                               (|NonNegativeInteger|)
                                               (|Union| (|NonNegativeInteger|)
                                                        "failed")
                                               #4#))
                             . #6#)
                       (EXIT
                        (SEQ (LETT |x| 1 . #6#) (LETT #3# |diff| . #6#) G190
                             (COND ((|greater_SI| |x| #3#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |a| (SPADCALL |a| NIL (QREFELT $ 20))
                                     . #6#)))
                             (LETT |x| (|inc_SI| |x|) . #6#) (GO G190) G191
                             (EXIT NIL))))))
                    (EXIT
                     (COND ((NULL |arrows|) (LETT |arrows| (LIST |a|) . #6#))
                           ('T
                            (LETT |arrows|
                                  (SPADCALL |arrows| |a| (QREFELT $ 21))
                                  . #6#)))))
               (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
          (LETT |emptyRow|
                (PROGN
                 (LETT #2# NIL . #6#)
                 (SEQ (LETT |x| 1 . #6#) (LETT #1# |dim| . #6#) G190
                      (COND ((|greater_SI| |x| #1#) (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS NIL #2#) . #6#)))
                      (LETT |x| (|inc_SI| |x|) . #6#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #6#)
          (LETT |arrows| (SPADCALL |arrows| |emptyRow| (QREFELT $ 21)) . #6#)
          (EXIT (SPADCALL |obs| |arrows| (QREFELT $ 22)))))) 

(SDEFUN |POSET-;addArrow;A2NniA;2|
        ((|s| A) (|n1| |NonNegativeInteger|) (|n2| |NonNegativeInteger|) ($ A))
        (SPROG ((|a| (|List| (|Boolean|))))
               (SEQ
                (LETT |a|
                      (SPADCALL (SPADCALL |s| (QREFELT $ 12)) |n1|
                                (QREFELT $ 25))
                      |POSET-;addArrow;A2NniA;2|)
                (SPADCALL |a| |n2| 'T (QREFELT $ 26))
                (SPADCALL (SPADCALL |s| (QREFELT $ 12)) |n1| |a|
                          (QREFELT $ 27))
                (EXIT
                 (SPADCALL (SPADCALL |s| (QREFELT $ 9))
                           (SPADCALL |s| (QREFELT $ 12)) (QREFELT $ 22)))))) 

(SDEFUN |POSET-;isArrow?|
        ((|arr| |List| (|List| (|Boolean|))) (|a| |NonNegativeInteger|)
         (|b| |NonNegativeInteger|) ($ |Boolean|))
        (SPROG
         ((#1=#:G777 NIL) (|val| (|Boolean|)) (#2=#:G778 NIL) (|x| NIL)
          (|row| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |row| 1 . #3=(|POSET-;isArrow?|))
                (SEQ (LETT |x| NIL . #3#) (LETT #2# |arr| . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (COND
                       ((EQL |row| |a|)
                        (SEQ
                         (LETT |val| (SPADCALL |x| |b| (QREFELT $ 29)) . #3#)
                         (EXIT
                          (PROGN (LETT #1# |val| . #3#) (GO #4=#:G776))))))
                      (EXIT (EQL |row| (+ |row| 1))))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT NIL)))
          #4# (EXIT #1#)))) 

(SDEFUN |POSET-;le;A2NniB;4|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |Boolean|))
        (|POSET-;isArrow?| (SPADCALL |s| (QREFELT $ 12)) |a| |b| $)) 

(SDEFUN |POSET-;setArrow!|
        ((|arr| |List| (|List| (|Boolean|))) (|a| |NonNegativeInteger|)
         (|b| |NonNegativeInteger|) (|c| |Boolean|) ($ |Void|))
        (SPROG
         ((#1=#:G785 NIL) (#2=#:G786 NIL) (|x| NIL)
          (|row| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |row| 1 . #3=(|POSET-;setArrow!|))
                (SEQ (LETT |x| NIL . #3#) (LETT #2# |arr| . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (COND
                       ((EQL |row| |a|)
                        (SEQ (SPADCALL |x| |b| |c| (QREFELT $ 26))
                             (EXIT
                              (PROGN
                               (LETT #1# (SPADCALL (QREFELT $ 32)) . #3#)
                               (GO #4=#:G784))))))
                      (EXIT (EQL |row| (+ |row| 1))))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT (SPADCALL (QREFELT $ 32)))))
          #4# (EXIT #1#)))) 

(SDEFUN |POSET-;addObject!;ASA;6| ((|s| A) (|n| S) ($ A))
        (SPROG
         ((|arrows| (|List| (|List| (|Boolean|))))
          (|emptyRow| (|List| (|Boolean|))) (#1=#:G801 NIL) (|x| NIL)
          (#2=#:G800 NIL) (|a| (|List| (|Boolean|))) (#3=#:G799 NIL)
          (|diff| (|NonNegativeInteger|)) (#4=#:G788 NIL)
          (|padding| (|Union| (|NonNegativeInteger|) "failed"))
          (|width| (|NonNegativeInteger|)) (#5=#:G798 NIL) (|obs| (|List| S))
          (|dim| (|NonNegativeInteger|)))
         (SEQ
          (LETT |dim| (+ (LENGTH (SPADCALL |s| (QREFELT $ 9))) 1)
                . #6=(|POSET-;addObject!;ASA;6|))
          (LETT |obs|
                (SPADCALL (SPADCALL |s| (QREFELT $ 9)) |n| (QREFELT $ 10))
                . #6#)
          (LETT |arrows| NIL . #6#)
          (SEQ (LETT |a| NIL . #6#)
               (LETT #5# (SPADCALL |s| (QREFELT $ 12)) . #6#) G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |a| (CAR #5#) . #6#) NIL))
                 (GO G191)))
               (SEQ (LETT |width| (LENGTH |a|) . #6#)
                    (LETT |padding| (SPADCALL |dim| |width| (QREFELT $ 15))
                          . #6#)
                    (COND
                     ((SPADCALL |padding| (CONS 1 "failed") (QREFELT $ 18))
                      (SEQ
                       (LETT |diff|
                             (PROG2 (LETT #4# |padding| . #6#)
                                 (QCDR #4#)
                               (|check_union2| (QEQCAR #4# 0)
                                               (|NonNegativeInteger|)
                                               (|Union| (|NonNegativeInteger|)
                                                        "failed")
                                               #4#))
                             . #6#)
                       (EXIT
                        (SEQ (LETT |x| 1 . #6#) (LETT #3# |diff| . #6#) G190
                             (COND ((|greater_SI| |x| #3#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |a| (SPADCALL |a| NIL (QREFELT $ 20))
                                     . #6#)))
                             (LETT |x| (|inc_SI| |x|) . #6#) (GO G190) G191
                             (EXIT NIL))))))
                    (EXIT
                     (COND ((NULL |arrows|) (LETT |arrows| (LIST |a|) . #6#))
                           ('T
                            (LETT |arrows|
                                  (SPADCALL |arrows| |a| (QREFELT $ 21))
                                  . #6#)))))
               (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
          (LETT |emptyRow|
                (PROGN
                 (LETT #2# NIL . #6#)
                 (SEQ (LETT |x| 1 . #6#) (LETT #1# |dim| . #6#) G190
                      (COND ((|greater_SI| |x| #1#) (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS NIL #2#) . #6#)))
                      (LETT |x| (|inc_SI| |x|) . #6#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #6#)
          (LETT |arrows| (SPADCALL |arrows| |emptyRow| (QREFELT $ 21)) . #6#)
          (SPADCALL |s| |obs| (QREFELT $ 33))
          (SPADCALL |s| |arrows| (QREFELT $ 34)) (EXIT |s|)))) 

(SDEFUN |POSET-;addObject!;ARA;7|
        ((|s| A)
         (|n| |Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
          (|:| |posY| (|NonNegativeInteger|)))
         ($ A))
        (SPROG ((|ob| (S)))
               (SEQ (LETT |ob| (QVELT |n| 0) |POSET-;addObject!;ARA;7|)
                    (EXIT (SPADCALL |s| |ob| (QREFELT $ 36)))))) 

(SDEFUN |POSET-;addArrow!;AS2NniA;8|
        ((|s| A) (|name| |String|) (|n1| |NonNegativeInteger|)
         (|n2| |NonNegativeInteger|) ($ A))
        (SPROG ((|a| (|List| (|Boolean|))))
               (SEQ
                (LETT |a|
                      (SPADCALL (SPADCALL |s| (QREFELT $ 12)) |n1|
                                (QREFELT $ 25))
                      |POSET-;addArrow!;AS2NniA;8|)
                (SPADCALL |a| |n2| 'T (QREFELT $ 26))
                (SPADCALL (SPADCALL |s| (QREFELT $ 12)) |n1| |a|
                          (QREFELT $ 27))
                (EXIT
                 (SPADCALL (SPADCALL |s| (QREFELT $ 9))
                           (SPADCALL |s| (QREFELT $ 12)) (QREFELT $ 22)))))) 

(SDEFUN |POSET-;addArrow!;AS2NniLA;9|
        ((|s| A) (|name| |String|) (|n1| |NonNegativeInteger|)
         (|n2| |NonNegativeInteger|) (|mp| |List| (|NonNegativeInteger|))
         ($ A))
        (SPADCALL |s| |name| |n1| |n2| (QREFELT $ 41))) 

(SDEFUN |POSET-;getVertices;AL;10|
        ((|s| A)
         ($ |List|
          (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|)))))
        (SPROG ((#1=#:G814 NIL) (|x| NIL) (#2=#:G813 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|POSET-;getVertices;AL;10|))
                 (SEQ (LETT |x| NIL . #3#)
                      (LETT #1# (SPADCALL |s| (QREFELT $ 9)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (VECTOR |x| 0 0) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |POSET-;getArrows;AL;11|
        ((|s| A)
         ($ |List|
          #1=(|Record| (|:| |name| (|String|))
                       (|:| |arrType| (|NonNegativeInteger|))
                       (|:| |fromOb| (|NonNegativeInteger|))
                       (|:| |toOb| (|NonNegativeInteger|))
                       (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                       (|:| |map| (|List| (|NonNegativeInteger|))))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arr| #1#) (#2=#:G824 NIL) (|y| NIL) (#3=#:G825 NIL) (|val| NIL)
          (#4=#:G822 NIL) (|x| NIL) (#5=#:G823 NIL) (|row| NIL)
          (|dim| (|NonNegativeInteger|)))
         (SEQ (LETT |res| NIL . #6=(|POSET-;getArrows;AL;11|))
              (LETT |dim| (LENGTH (SPADCALL |s| (QREFELT $ 12))) . #6#)
              (SEQ (LETT |row| NIL . #6#)
                   (LETT #5# (SPADCALL |s| (QREFELT $ 12)) . #6#)
                   (LETT |x| 1 . #6#) (LETT #4# |dim| . #6#) G190
                   (COND
                    ((OR (|greater_SI| |x| #4#) (ATOM #5#)
                         (PROGN (LETT |row| (CAR #5#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |val| NIL . #6#) (LETT #3# |row| . #6#)
                          (LETT |y| 1 . #6#) (LETT #2# |dim| . #6#) G190
                          (COND
                           ((OR (|greater_SI| |y| #2#) (ATOM #3#)
                                (PROGN (LETT |val| (CAR #3#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             (|val|
                              (SEQ
                               (LETT |arr| (VECTOR "x" 0 |x| |y| 0 0 NIL)
                                     . #6#)
                               (EXIT
                                (LETT |res|
                                      (SPADCALL |res| |arr| (QREFELT $ 48))
                                      . #6#)))))))
                          (LETT |y|
                                (PROG1 (|inc_SI| |y|)
                                  (LETT #3# (CDR #3#) . #6#))
                                . #6#)
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |x| (PROG1 (|inc_SI| |x|) (LETT #5# (CDR #5#) . #6#))
                         . #6#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |POSET-;flatten;DgA;12| ((|n| |DirectedGraph| A) ($ A))
        (SPADCALL NIL (LIST NIL) (QREFELT $ 22))) 

(SDEFUN |POSET-;initial;A;13| (($ A)) (SPADCALL NIL NIL (QREFELT $ 22))) 

(SDEFUN |POSET-;terminal;SA;14| ((|a| S) ($ A))
        (SPADCALL (LIST |a|) (LIST (LIST 'T)) (QREFELT $ 22))) 

(SDEFUN |POSET-;cycleOpen;LSA;15|
        ((|objs| |List| S) (|arrowName| |String|) ($ A))
        (SPADCALL NIL (LIST NIL) (QREFELT $ 22))) 

(SDEFUN |POSET-;cycleClosed;LSA;16|
        ((|objs| |List| S) (|arrowName| |String|) ($ A))
        (SPADCALL NIL (LIST NIL) (QREFELT $ 22))) 

(SDEFUN |POSET-;unit;LSA;17| ((|objs| |List| S) (|arrowName| |String|) ($ A))
        (SPROG
         ((|arrs| (|List| (|List| (|Boolean|)))) (|row| (|List| (|Boolean|)))
          (|val| (|Boolean|)) (#1=#:G838 NIL) (|y| NIL) (#2=#:G837 NIL)
          (|x| NIL) (|dim| (|NonNegativeInteger|)))
         (SEQ (LETT |dim| (LENGTH |objs|) . #3=(|POSET-;unit;LSA;17|))
              (LETT |arrs| (LIST NIL) . #3#)
              (SEQ (LETT |x| 1 . #3#) (LETT #2# |dim| . #3#) G190
                   (COND ((|greater_SI| |x| #2#) (GO G191)))
                   (SEQ (LETT |row| NIL . #3#)
                        (SEQ (LETT |y| 1 . #3#) (LETT #1# |dim| . #3#) G190
                             (COND ((|greater_SI| |y| #1#) (GO G191)))
                             (SEQ (LETT |val| (EQL |x| |y|) . #3#)
                                  (EXIT
                                   (LETT |row|
                                         (SPADCALL |row| |val| (QREFELT $ 20))
                                         . #3#)))
                             (LETT |y| (|inc_SI| |y|) . #3#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (LETT |arrs| (SPADCALL |arrs| |row| (QREFELT $ 21))
                               . #3#)))
                   (LETT |x| (|inc_SI| |x|) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |objs| |arrs| (QREFELT $ 22)))))) 

(SDEFUN |POSET-;kgraph;LSA;18| ((|objs| |List| S) (|arrowName| |String|) ($ A))
        (SPADCALL NIL (LIST (LIST NIL)) (QREFELT $ 22))) 

(SDEFUN |POSET-;isDirectSuccessor?;A2NniB;19|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |Boolean|))
        (SPROG ((|row| (|List| (|Boolean|))))
               (SEQ
                (LETT |row|
                      (SPADCALL (SPADCALL |s| (QREFELT $ 12)) |a|
                                (QREFELT $ 25))
                      |POSET-;isDirectSuccessor?;A2NniB;19|)
                (EXIT (SPADCALL |row| |b| (QREFELT $ 29)))))) 

(SDEFUN |POSET-;isGreaterThan?;A2NniB;20|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |Boolean|))
        (SPROG ((|row| (|List| (|Boolean|))))
               (SEQ
                (LETT |row|
                      (SPADCALL (SPADCALL |s| (QREFELT $ 12)) |a|
                                (QREFELT $ 25))
                      |POSET-;isGreaterThan?;A2NniB;20|)
                (EXIT (SPADCALL |row| |b| (QREFELT $ 29)))))) 

(SDEFUN |POSET-;max;ANni;21| ((|s| A) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G847 NIL) (#2=#:G851 NIL)
          (|res| (|Union| (|NonNegativeInteger|) "failed"))
          (|index| (|NonNegativeInteger|))
          (|arr| (|List| (|NonNegativeInteger|))) (#3=#:G852 NIL) (|x| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |arr| NIL . #4=(|POSET-;max;ANni;21|))
                (LETT |index| 1 . #4#)
                (SEQ (LETT |x| NIL . #4#)
                     (LETT #3# (SPADCALL |s| (QREFELT $ 12)) . #4#) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #4#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |arr| (SPADCALL |arr| |index| (QREFELT $ 60))
                            . #4#)
                      (EXIT (LETT |index| (+ |index| 1) . #4#)))
                     (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
                (LETT |res| (SPADCALL |s| |arr| (QREFELT $ 61)) . #4#)
                (COND
                 ((SPADCALL |res| (CONS 1 "failed") (QREFELT $ 62))
                  (PROGN (LETT #2# 0 . #4#) (GO #5=#:G850))))
                (EXIT
                 (PROG2 (LETT #1# |res| . #4#)
                     (QCDR #1#)
                   (|check_union2| (QEQCAR #1# 0) (|NonNegativeInteger|)
                                   (|Union| (|NonNegativeInteger|) "failed")
                                   #1#)))))
          #5# (EXIT #2#)))) 

(SDEFUN |POSET-;max;ALNni;22|
        ((|s| A) (|sub| |List| (|NonNegativeInteger|))
         ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G854 NIL) (#2=#:G858 NIL)
          (|res| (|Union| (|NonNegativeInteger|) "failed")))
         (SEQ
          (EXIT
           (SEQ
            (LETT |res| (SPADCALL |s| |sub| (QREFELT $ 61))
                  . #3=(|POSET-;max;ALNni;22|))
            (COND
             ((SPADCALL |res| (CONS 1 "failed") (QREFELT $ 62))
              (PROGN (LETT #2# 0 . #3#) (GO #4=#:G857))))
            (EXIT
             (PROG2 (LETT #1# |res| . #3#)
                 (QCDR #1#)
               (|check_union2| (QEQCAR #1# 0) (|NonNegativeInteger|)
                               (|Union| (|NonNegativeInteger|) "failed")
                               #1#)))))
          #4# (EXIT #2#)))) 

(SDEFUN |POSET-;min;ANni;23| ((|s| A) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G862 NIL) (#2=#:G866 NIL)
          (|res| (|Union| (|NonNegativeInteger|) "failed"))
          (|index| (|NonNegativeInteger|))
          (|arr| (|List| (|NonNegativeInteger|))) (#3=#:G867 NIL) (|x| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |arr| NIL . #4=(|POSET-;min;ANni;23|))
                (LETT |index| 1 . #4#)
                (SEQ (LETT |x| NIL . #4#)
                     (LETT #3# (SPADCALL |s| (QREFELT $ 12)) . #4#) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #4#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |arr| (SPADCALL |arr| |index| (QREFELT $ 60))
                            . #4#)
                      (EXIT (LETT |index| (+ |index| 1) . #4#)))
                     (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
                (LETT |res| (SPADCALL |s| |arr| (QREFELT $ 65)) . #4#)
                (COND
                 ((SPADCALL |res| (CONS 1 "failed") (QREFELT $ 62))
                  (PROGN (LETT #2# 0 . #4#) (GO #5=#:G865))))
                (EXIT
                 (PROG2 (LETT #1# |res| . #4#)
                     (QCDR #1#)
                   (|check_union2| (QEQCAR #1# 0) (|NonNegativeInteger|)
                                   (|Union| (|NonNegativeInteger|) "failed")
                                   #1#)))))
          #5# (EXIT #2#)))) 

(SDEFUN |POSET-;min;ALNni;24|
        ((|s| A) (|sub| |List| (|NonNegativeInteger|))
         ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G869 NIL) (#2=#:G873 NIL)
          (|res| (|Union| (|NonNegativeInteger|) "failed")))
         (SEQ
          (EXIT
           (SEQ
            (LETT |res| (SPADCALL |s| |sub| (QREFELT $ 65))
                  . #3=(|POSET-;min;ALNni;24|))
            (COND
             ((SPADCALL |res| (CONS 1 "failed") (QREFELT $ 62))
              (PROGN (LETT #2# 0 . #3#) (GO #4=#:G872))))
            (EXIT
             (PROG2 (LETT #1# |res| . #3#)
                 (QCDR #1#)
               (|check_union2| (QEQCAR #1# 0) (|NonNegativeInteger|)
                               (|Union| (|NonNegativeInteger|) "failed")
                               #1#)))))
          #4# (EXIT #2#)))) 

(PUT '|POSET-;isFixPoint?;ANniB;25| '|SPADreplace| '(XLAM (|s| |a|) 'T)) 

(SDEFUN |POSET-;isFixPoint?;ANniB;25|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |Boolean|)) 'T) 

(PUT '|POSET-;arrowName;A2NniS;26| '|SPADreplace| '(XLAM (|s| |a| |b|) "?")) 

(SDEFUN |POSET-;arrowName;A2NniS;26|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |String|))
        "?") 

(PUT '|POSET-;getArrowIndex;A3Nni;27| '|SPADreplace| '(XLAM (|s| |a| |b|) 0)) 

(SDEFUN |POSET-;getArrowIndex;A3Nni;27|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |NonNegativeInteger|))
        0) 

(PUT '|POSET-;inDegree;A2Nni;28| '|SPADreplace| '(XLAM (|s| |a|) 0)) 

(SDEFUN |POSET-;inDegree;A2Nni;28|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |NonNegativeInteger|)) 0) 

(PUT '|POSET-;outDegree;A2Nni;29| '|SPADreplace| '(XLAM (|s| |a|) 0)) 

(SDEFUN |POSET-;outDegree;A2Nni;29|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |NonNegativeInteger|)) 0) 

(PUT '|POSET-;nodeFromNode;ANniL;30| '|SPADreplace| '(XLAM (|s| |a|) (LIST 0))) 

(SDEFUN |POSET-;nodeFromNode;ANniL;30|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (LIST 0)) 

(PUT '|POSET-;nodeToNode;ANniL;31| '|SPADreplace| '(XLAM (|s| |a|) (LIST 0))) 

(SDEFUN |POSET-;nodeToNode;ANniL;31|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (LIST 0)) 

(PUT '|POSET-;arrowsFromNode;ANniL;32| '|SPADreplace|
     '(XLAM (|s| |a|) (LIST 0))) 

(SDEFUN |POSET-;arrowsFromNode;ANniL;32|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (LIST 0)) 

(PUT '|POSET-;arrowsToNode;ANniL;33| '|SPADreplace| '(XLAM (|s| |a|) (LIST 0))) 

(SDEFUN |POSET-;arrowsToNode;ANniL;33|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (LIST 0)) 

(PUT '|POSET-;nodeFromArrow;ANniL;34| '|SPADreplace| '(XLAM (|s| |a|) (LIST 0))) 

(SDEFUN |POSET-;nodeFromArrow;ANniL;34|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (LIST 0)) 

(PUT '|POSET-;nodeToArrow;ANniL;35| '|SPADreplace| '(XLAM (|s| |a|) (LIST 0))) 

(SDEFUN |POSET-;nodeToArrow;ANniL;35|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (LIST 0)) 

(PUT '|POSET-;arrowsFromArrow;ANniL;36| '|SPADreplace|
     '(XLAM (|s| |a|) (LIST 0))) 

(SDEFUN |POSET-;arrowsFromArrow;ANniL;36|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (LIST 0)) 

(PUT '|POSET-;arrowsToArrow;ANniL;37| '|SPADreplace| '(XLAM (|s| |a|) (LIST 0))) 

(SDEFUN |POSET-;arrowsToArrow;ANniL;37|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (LIST 0)) 

(PUT '|POSET-;routeNodes;A2NniL;38| '|SPADreplace|
     '(XLAM (|s| |a| |b|) (LIST 0))) 

(SDEFUN |POSET-;routeNodes;A2NniL;38|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |List| (|NonNegativeInteger|)))
        (LIST 0)) 

(PUT '|POSET-;routeArrows;A2NniL;39| '|SPADreplace|
     '(XLAM (|s| |a| |b|) (LIST 0))) 

(SDEFUN |POSET-;routeArrows;A2NniL;39|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |List| (|NonNegativeInteger|)))
        (LIST 0)) 

(PUT '|POSET-;distance;A2NniI;40| '|SPADreplace| '(XLAM (|s| |a| |b|) 0)) 

(SDEFUN |POSET-;distance;A2NniI;40|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |Integer|))
        0) 

(PUT '|POSET-;+| '|SPADreplace| '(XLAM (|a| |b|) |a|)) 

(SDEFUN |POSET-;+| ((|a| A) (|b| A) ($ A)) |a|) 

(PUT '|POSET-;merge;3A;42| '|SPADreplace| '(XLAM (|a| |b|) |a|)) 

(SDEFUN |POSET-;merge;3A;42| ((|a| A) (|b| A) ($ A)) |a|) 

(PUT '|POSET-;isDirected?;B;43| '|SPADreplace| '(XLAM NIL 'T)) 

(SDEFUN |POSET-;isDirected?;B;43| (($ |Boolean|)) 'T) 

(PUT '|POSET-;createWidth;2Nni;44| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |POSET-;createWidth;2Nni;44|
        ((|x| |NonNegativeInteger|) ($ |NonNegativeInteger|)) 0) 

(PUT '|POSET-;createX;3Nni;45| '|SPADreplace| '(XLAM (|x| |n|) 0)) 

(SDEFUN |POSET-;createX;3Nni;45|
        ((|x| |NonNegativeInteger|) (|n| |NonNegativeInteger|)
         ($ |NonNegativeInteger|))
        0) 

(PUT '|POSET-;createY;3Nni;46| '|SPADreplace| '(XLAM (|x| |n|) 0)) 

(SDEFUN |POSET-;createY;3Nni;46|
        ((|x| |NonNegativeInteger|) (|n| |NonNegativeInteger|)
         ($ |NonNegativeInteger|))
        0) 

(PUT '|POSET-;looseEquals;2AB;47| '|SPADreplace| '(XLAM (|x| |y|) NIL)) 

(SDEFUN |POSET-;looseEquals;2AB;47| ((|x| A) (|y| A) ($ |Boolean|)) NIL) 

(PUT '|POSET-;map;ALL2IA;48| '|SPADreplace|
     '(XLAM (|s| |m| |newOb| |offsetX| |offsetY|) |s|)) 

(SDEFUN |POSET-;map;ALL2IA;48|
        ((|s| A) (|m| |List| (|NonNegativeInteger|)) (|newOb| |List| S)
         (|offsetX| |Integer|) (|offsetY| |Integer|) ($ A))
        |s|) 

(PUT '|POSET-;mapContra;ALL2IA;49| '|SPADreplace|
     '(XLAM (|s| |m| |newOb| |offsetX| |offsetY|) |s|)) 

(SDEFUN |POSET-;mapContra;ALL2IA;49|
        ((|s| A) (|m| |List| (|NonNegativeInteger|)) (|newOb| |List| S)
         (|offsetX| |Integer|) (|offsetY| |Integer|) ($ A))
        |s|) 

(SDEFUN |POSET-;opposite;2A;50| ((|s| A) ($ A))
        (SPROG
         ((#1=#:G910 NIL) (|b| NIL) (#2=#:G909 NIL) (|a| NIL)
          (|arr2| (|List| (|List| (|Boolean|)))) (|row| (|List| (|Boolean|)))
          (#3=#:G908 NIL) (|y| NIL) (#4=#:G907 NIL) (|x| NIL))
         (SEQ (LETT |arr2| (LIST NIL) . #5=(|POSET-;opposite;2A;50|))
              (SEQ (LETT |x| NIL . #5#)
                   (LETT #4# (SPADCALL |s| (QREFELT $ 12)) . #5#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ (LETT |row| NIL . #5#)
                        (SEQ (LETT |y| NIL . #5#) (LETT #3# |x| . #5#) G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |y| (CAR #3#) . #5#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |row| (SPADCALL |row| NIL (QREFELT $ 20))
                                     . #5#)))
                             (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (LETT |arr2| (SPADCALL |arr2| |row| (QREFELT $ 21))
                               . #5#)))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |a| 1 . #5#)
                   (LETT #2# (LENGTH (SPADCALL |s| (QREFELT $ 12))) . #5#) G190
                   (COND ((|greater_SI| |a| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |b| 1 . #5#)
                          (LETT #1# (LENGTH (SPADCALL |s| (QREFELT $ 12)))
                                . #5#)
                          G190 (COND ((|greater_SI| |b| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((|POSET-;isArrow?| (SPADCALL |s| (QREFELT $ 12))
                               |a| |b| $)
                              (|POSET-;setArrow!| |arr2| |b| |a| 'T $)))))
                          (LETT |b| (|inc_SI| |b|) . #5#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |a| (|inc_SI| |a|) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (SPADCALL |s| (QREFELT $ 9)) |arr2| (QREFELT $ 22)))))) 

(SDEFUN |POSET-;implies;A2NniB;51|
        ((|s| A) (|left| |NonNegativeInteger|) (|right| |NonNegativeInteger|)
         ($ |Boolean|))
        (SPROG ((|b| (|Boolean|)) (|a| (|List| (|Boolean|))))
               (SEQ
                (LETT |a|
                      (SPADCALL (SPADCALL |s| (QREFELT $ 12)) |left|
                                (QREFELT $ 25))
                      . #1=(|POSET-;implies;A2NniB;51|))
                (LETT |b| (SPADCALL |a| |right| (QREFELT $ 29)) . #1#)
                (EXIT |b|)))) 

(SDEFUN |POSET-;joinIfCan;A2NniU;52|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |Union| (|NonNegativeInteger|) "failed"))
        (SPROG
         ((|res| (|List| (|NonNegativeInteger|)))
          (|index| (|NonNegativeInteger|))
          (|candidatesb| (|List| (|NonNegativeInteger|))) (#1=#:G923 NIL)
          (|x| NIL) (|flagb| #2=(|List| (|Boolean|)))
          (|candidatesa| (|List| (|NonNegativeInteger|))) (#3=#:G922 NIL)
          (|flaga| #2#))
         (SEQ (LETT |res| NIL . #4=(|POSET-;joinIfCan;A2NniU;52|))
              (LETT |flaga|
                    (SPADCALL (SPADCALL |s| (QREFELT $ 12)) |a| (QREFELT $ 25))
                    . #4#)
              (LETT |candidatesa| NIL . #4#) (LETT |index| 1 . #4#)
              (SEQ (LETT |x| NIL . #4#) (LETT #3# |flaga| . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     (|x|
                      (LETT |candidatesa|
                            (SPADCALL |candidatesa| |index| (QREFELT $ 60))
                            . #4#)))
                    (EXIT (LETT |index| (+ |index| 1) . #4#)))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (LETT |flagb|
                    (SPADCALL (SPADCALL |s| (QREFELT $ 12)) |b| (QREFELT $ 25))
                    . #4#)
              (LETT |candidatesb| NIL . #4#) (LETT |index| 1 . #4#)
              (SEQ (LETT |x| NIL . #4#) (LETT #1# |flagb| . #4#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     (|x|
                      (LETT |candidatesb|
                            (SPADCALL |candidatesb| |index| (QREFELT $ 60))
                            . #4#)))
                    (EXIT (LETT |index| (+ |index| 1) . #4#)))
                   (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
              (LETT |res| (SPADCALL |candidatesa| |candidatesb| (QREFELT $ 94))
                    . #4#)
              (EXIT (SPADCALL |s| |res| (QREFELT $ 95)))))) 

(SDEFUN |POSET-;meetIfCan;A2NniU;53|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |Union| (|NonNegativeInteger|) "failed"))
        (SPROG
         ((|res| (|List| (|NonNegativeInteger|)))
          (|index| (|NonNegativeInteger|))
          (|candidatesb| (|List| (|NonNegativeInteger|))) (#1=#:G938 NIL)
          (|x| NIL) (|flagb| (|List| (|Boolean|))) (#2=#:G937 NIL)
          (|candidatesa| (|List| (|NonNegativeInteger|))) (#3=#:G936 NIL)
          (|flaga| (|List| (|Boolean|))) (#4=#:G935 NIL))
         (SEQ (LETT |res| NIL . #5=(|POSET-;meetIfCan;A2NniU;53|))
              (LETT |flaga| NIL . #5#) (LETT |flagb| NIL . #5#)
              (SEQ (LETT |x| NIL . #5#)
                   (LETT #4# (SPADCALL |s| (QREFELT $ 12)) . #5#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |flaga|
                           (SPADCALL |flaga| (SPADCALL |x| |a| (QREFELT $ 29))
                                     (QREFELT $ 20))
                           . #5#)))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
              (LETT |candidatesa| NIL . #5#) (LETT |index| 1 . #5#)
              (SEQ (LETT |x| NIL . #5#) (LETT #3# |flaga| . #5#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     (|x|
                      (LETT |candidatesa|
                            (SPADCALL |candidatesa| |index| (QREFELT $ 60))
                            . #5#)))
                    (EXIT (LETT |index| (+ |index| 1) . #5#)))
                   (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |x| NIL . #5#)
                   (LETT #2# (SPADCALL |s| (QREFELT $ 12)) . #5#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |flagb|
                           (SPADCALL |flagb| (SPADCALL |x| |b| (QREFELT $ 29))
                                     (QREFELT $ 20))
                           . #5#)))
                   (LETT #2# (CDR #2#) . #5#) (GO G190) G191 (EXIT NIL))
              (LETT |candidatesb| NIL . #5#) (LETT |index| 1 . #5#)
              (SEQ (LETT |x| NIL . #5#) (LETT #1# |flagb| . #5#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     (|x|
                      (LETT |candidatesb|
                            (SPADCALL |candidatesb| |index| (QREFELT $ 60))
                            . #5#)))
                    (EXIT (LETT |index| (+ |index| 1) . #5#)))
                   (LETT #1# (CDR #1#) . #5#) (GO G190) G191 (EXIT NIL))
              (LETT |res| (SPADCALL |candidatesa| |candidatesb| (QREFELT $ 94))
                    . #5#)
              (EXIT (SPADCALL |s| |res| (QREFELT $ 97)))))) 

(SDEFUN |POSET-;meetIfCan;ALU;54|
        ((|s| A) (|elements| |List| (|NonNegativeInteger|))
         ($ |Union| (|NonNegativeInteger|) "failed"))
        (SPROG
         ((|res| (|List| (|NonNegativeInteger|)))
          (|index| (|NonNegativeInteger|))
          (|candidates| (|List| (|NonNegativeInteger|))) (#1=#:G951 NIL)
          (|x| NIL) (|flage| (|List| (|Boolean|))) (#2=#:G950 NIL)
          (#3=#:G949 NIL) (|e| NIL))
         (SEQ (LETT |res| NIL . #4=(|POSET-;meetIfCan;ALU;54|))
              (SEQ (LETT |e| NIL . #4#) (LETT #3# |elements| . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |e| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (LETT |flage| NIL . #4#)
                        (SEQ (LETT |x| NIL . #4#)
                             (LETT #2# (SPADCALL |s| (QREFELT $ 12)) . #4#)
                             G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |x| (CAR #2#) . #4#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |flage|
                                     (SPADCALL |flage|
                                               (SPADCALL |x| |e|
                                                         (QREFELT $ 29))
                                               (QREFELT $ 20))
                                     . #4#)))
                             (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |candidates| NIL . #4#) (LETT |index| 1 . #4#)
                        (EXIT
                         (SEQ (LETT |x| NIL . #4#) (LETT #1# |flage| . #4#)
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |x| (CAR #1#) . #4#) NIL))
                                (GO G191)))
                              (SEQ
                               (COND
                                (|x|
                                 (LETT |candidates|
                                       (SPADCALL |candidates| |index|
                                                 (QREFELT $ 60))
                                       . #4#)))
                               (EXIT (LETT |index| (+ |index| 1) . #4#)))
                              (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (LETT |res| (SPADCALL |res| |candidates| (QREFELT $ 94)) . #4#)
              (EXIT (SPADCALL |s| |res| (QREFELT $ 97)))))) 

(SDEFUN |POSET-;joinIfCan;ALU;55|
        ((|s| A) (|elements| |List| (|NonNegativeInteger|))
         ($ |Union| (|NonNegativeInteger|) "failed"))
        (SPROG
         ((|res| (|List| (|NonNegativeInteger|)))
          (|index| (|NonNegativeInteger|))
          (|candidates| (|List| (|NonNegativeInteger|))) (#1=#:G962 NIL)
          (|x| NIL) (|flage| (|List| (|Boolean|))) (#2=#:G961 NIL) (|e| NIL))
         (SEQ (LETT |res| NIL . #3=(|POSET-;joinIfCan;ALU;55|))
              (SEQ (LETT |e| NIL . #3#) (LETT #2# |elements| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |e| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |flage|
                          (SPADCALL (SPADCALL |s| (QREFELT $ 12)) |e|
                                    (QREFELT $ 25))
                          . #3#)
                    (LETT |candidates| NIL . #3#) (LETT |index| 1 . #3#)
                    (SEQ (LETT |x| NIL . #3#) (LETT #1# |flage| . #3#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                           (GO G191)))
                         (SEQ
                          (COND
                           (|x|
                            (LETT |candidates|
                                  (SPADCALL |candidates| |index|
                                            (QREFELT $ 60))
                                  . #3#)))
                          (EXIT (LETT |index| (+ |index| 1) . #3#)))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (LETT |res| (SPADCALL |res| |candidates| (QREFELT $ 94))
                           . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |s| |res| (QREFELT $ 95)))))) 

(SDEFUN |POSET-;glb;ALU;56|
        ((|s| A) (|a| |List| (|NonNegativeInteger|))
         ($ |Union| (|NonNegativeInteger|) "failed"))
        (SPROG
         ((#1=#:G978 NIL) (|resultList| (|List| (|NonNegativeInteger|)))
          (#2=#:G980 NIL) (|y| NIL) (#3=#:G979 NIL) (|x| NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((NULL |a|)
              (PROGN
               (LETT #1# (CONS 0 0) . #4=(|POSET-;glb;ALU;56|))
               (GO #5=#:G977))))
            (COND
             ((EQL (SPADCALL |a| (QREFELT $ 101)) 1)
              (PROGN (LETT #1# (CONS 0 (|SPADfirst| |a|)) . #4#) (GO #5#))))
            (LETT |resultList| (SPADCALL |a| (QREFELT $ 102)) . #4#)
            (SEQ (LETT |x| NIL . #4#) (LETT #3# |a| . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |y| NIL . #4#) (LETT #2# |a| . #4#) G190
                        (COND
                         ((OR (ATOM #2#)
                              (PROGN (LETT |y| (CAR #2#) . #4#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL |s| |x| |y| (QREFELT $ 103))
                            (COND
                             ((SPADCALL |x| |y| (QREFELT $ 104))
                              (COND
                               ((SPADCALL |x| |resultList| (QREFELT $ 105))
                                (LETT |resultList|
                                      (SPADCALL |y| |resultList|
                                                (QREFELT $ 106))
                                      . #4#)))))))))
                        (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (COND
             ((SPADCALL (SPADCALL |resultList| (QREFELT $ 101)) 1
                        (QREFELT $ 104))
              (PROGN (LETT #1# (CONS 0 0) . #4#) (GO #5#))))
            (EXIT (CONS 0 (|SPADfirst| |resultList|)))))
          #5# (EXIT #1#)))) 

(SDEFUN |POSET-;lub;ALU;57|
        ((|s| A) (|a| |List| (|NonNegativeInteger|))
         ($ |Union| (|NonNegativeInteger|) "failed"))
        (SPROG
         ((#1=#:G994 NIL) (|resultList| (|List| (|NonNegativeInteger|)))
          (#2=#:G996 NIL) (|y| NIL) (#3=#:G995 NIL) (|x| NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((NULL |a|)
              (PROGN
               (LETT #1# (CONS 0 0) . #4=(|POSET-;lub;ALU;57|))
               (GO #5=#:G993))))
            (COND
             ((EQL (SPADCALL |a| (QREFELT $ 101)) 1)
              (PROGN (LETT #1# (CONS 0 (|SPADfirst| |a|)) . #4#) (GO #5#))))
            (LETT |resultList| (SPADCALL |a| (QREFELT $ 102)) . #4#)
            (SEQ (LETT |x| NIL . #4#) (LETT #3# |a| . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |y| NIL . #4#) (LETT #2# |a| . #4#) G190
                        (COND
                         ((OR (ATOM #2#)
                              (PROGN (LETT |y| (CAR #2#) . #4#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL |s| |x| |y| (QREFELT $ 103))
                            (COND
                             ((SPADCALL |x| |y| (QREFELT $ 104))
                              (COND
                               ((SPADCALL |y| |resultList| (QREFELT $ 105))
                                (LETT |resultList|
                                      (SPADCALL |x| |resultList|
                                                (QREFELT $ 106))
                                      . #4#)))))))))
                        (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (COND
             ((SPADCALL (SPADCALL |resultList| (QREFELT $ 101)) 1
                        (QREFELT $ 104))
              (PROGN (LETT #1# (CONS 0 0) . #4#) (GO #5#))))
            (EXIT (CONS 0 (|SPADfirst| |resultList|)))))
          #5# (EXIT #1#)))) 

(SDEFUN |POSET-;indexToObject;ANniS;58|
        ((|s| A) (|index| |NonNegativeInteger|) ($ S))
        (SPADCALL (SPADCALL |s| (QREFELT $ 9)) |index| (QREFELT $ 109))) 

(SDEFUN |POSET-;objectToIndex;ASNni;59|
        ((|s| A) (|obj| S) ($ |NonNegativeInteger|))
        (SPADCALL |obj| (SPADCALL |s| (QREFELT $ 9)) (QREFELT $ 111))) 

(SDEFUN |POSET-;completeReflexivity;2A;60| ((|s| A) ($ A))
        (SPROG
         ((#1=#:G1002 NIL) (|a| NIL) (|struct2| (|List| (|List| (|Boolean|))))
          (|set2| (|List| S)))
         (SEQ
          (LETT |set2| (SPADCALL |s| (QREFELT $ 9))
                . #2=(|POSET-;completeReflexivity;2A;60|))
          (LETT |struct2|
                (SPADCALL (SPADCALL |s| (QREFELT $ 12)) (QREFELT $ 113)) . #2#)
          (SEQ (LETT |a| 1 . #2#) (LETT #1# (LENGTH |set2|) . #2#) G190
               (COND ((|greater_SI| |a| #1#) (GO G191)))
               (SEQ (EXIT (|POSET-;setArrow!| |struct2| |a| |a| 'T $)))
               (LETT |a| (|inc_SI| |a|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |set2| |struct2| (QREFELT $ 22)))))) 

(SDEFUN |POSET-;completeTransitivity;2A;61| ((|s| A) ($ A))
        (SPROG
         ((#1=#:G1013 NIL) (|c| NIL) (#2=#:G1012 NIL) (|b| NIL)
          (#3=#:G1011 NIL) (|a| NIL) (|struct2| (|List| (|List| (|Boolean|))))
          (|dim| (|NonNegativeInteger|)) (|set2| (|List| S)))
         (SEQ
          (LETT |set2| (SPADCALL |s| (QREFELT $ 9))
                . #4=(|POSET-;completeTransitivity;2A;61|))
          (LETT |dim| (LENGTH |set2|) . #4#)
          (LETT |struct2|
                (SPADCALL (SPADCALL |s| (QREFELT $ 12)) (QREFELT $ 113)) . #4#)
          (SEQ (LETT |a| 1 . #4#) (LETT #3# |dim| . #4#) G190
               (COND ((|greater_SI| |a| #3#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |b| 1 . #4#) (LETT #2# |dim| . #4#) G190
                      (COND ((|greater_SI| |b| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |c| 1 . #4#) (LETT #1# |dim| . #4#) G190
                             (COND ((|greater_SI| |c| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((|POSET-;isArrow?| |struct2| |a| |b| $)
                                 (COND
                                  ((|POSET-;isArrow?| |struct2| |b| |c| $)
                                   (COND
                                    ((NULL
                                      (|POSET-;isArrow?| |struct2| |a| |c| $))
                                     (|POSET-;setArrow!| |struct2| |a| |c| 'T
                                      $)))))))))
                             (LETT |c| (|inc_SI| |c|) . #4#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |b| (|inc_SI| |b|) . #4#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |a| (|inc_SI| |a|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |set2| |struct2| (QREFELT $ 22)))))) 

(SDEFUN |POSET-;isAntisymmetric?;AB;62| ((|s| A) ($ |Boolean|))
        (SPROG
         ((#1=#:G1021 NIL) (#2=#:G1023 NIL) (|b| NIL) (#3=#:G1022 NIL)
          (|a| NIL) (|struct2| (|List| (|List| (|Boolean|))))
          (|dim| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |dim| (LENGTH (SPADCALL |s| (QREFELT $ 9)))
                  . #4=(|POSET-;isAntisymmetric?;AB;62|))
            (LETT |struct2|
                  (SPADCALL (SPADCALL |s| (QREFELT $ 12)) (QREFELT $ 113))
                  . #4#)
            (SEQ (LETT |a| 1 . #4#) (LETT #3# |dim| . #4#) G190
                 (COND ((|greater_SI| |a| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |b| 1 . #4#) (LETT #2# |dim| . #4#) G190
                        (COND ((|greater_SI| |b| #2#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((|POSET-;isArrow?| |struct2| |a| |b| $)
                            (COND
                             ((|POSET-;isArrow?| |struct2| |b| |a| $)
                              (COND
                               ((SPADCALL |a| |b| (QREFELT $ 104))
                                (PROGN
                                 (LETT #1# NIL . #4#)
                                 (GO #5=#:G1020))))))))))
                        (LETT |b| (|inc_SI| |b|) . #4#) (GO G190) G191
                        (EXIT NIL))))
                 (LETT |a| (|inc_SI| |a|) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #5# (EXIT #1#)))) 

(SDEFUN |POSET-;zetaMatrix;AIa;63|
        ((|s| A) ($ |IncidenceAlgebra| (|Integer|) S))
        (SPROG
         ((|zf| (|Matrix| (|Integer|))) (#1=#:G1037 NIL) (|y| NIL)
          (#2=#:G1036 NIL) (#3=#:G1035 NIL) (|x| NIL) (#4=#:G1034 NIL)
          (|xxi| (|List| (|NonNegativeInteger|))) (#5=#:G1024 NIL)
          (#6=#:G1033 NIL) (|xxoi| NIL) (#7=#:G1032 NIL) (|xxo| (|List| S))
          (|arr| (|List| (|List| (|Boolean|)))) (|xx| (|List| S)))
         (SEQ
          (LETT |xx| (SPADCALL |s| (QREFELT $ 9))
                . #8=(|POSET-;zetaMatrix;AIa;63|))
          (LETT |arr| (SPADCALL |s| (QREFELT $ 12)) . #8#)
          (LETT |xxo|
                (SPADCALL (SPADCALL |arr| |xx| (QREFELT $ 118))
                          (QREFELT $ 119))
                . #8#)
          (LETT |xxi|
                (PROGN
                 (LETT #7# NIL . #8#)
                 (SEQ (LETT |xxoi| NIL . #8#) (LETT #6# |xxo| . #8#) G190
                      (COND
                       ((OR (ATOM #6#)
                            (PROGN (LETT |xxoi| (CAR #6#) . #8#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #7#
                              (CONS
                               (PROG1
                                   (LETT #5#
                                         (SPADCALL |xxoi| |xx| (QREFELT $ 111))
                                         . #8#)
                                 (|check_subtype2| (>= #5# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #5#))
                               #7#)
                              . #8#)))
                      (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                      (EXIT (NREVERSE #7#))))
                . #8#)
          (LETT |zf|
                (SPADCALL
                 (PROGN
                  (LETT #4# NIL . #8#)
                  (SEQ (LETT |x| NIL . #8#) (LETT #3# |xxi| . #8#) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #8#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #4#
                               (CONS
                                (PROGN
                                 (LETT #2# NIL . #8#)
                                 (SEQ (LETT |y| NIL . #8#)
                                      (LETT #1# |xxi| . #8#) G190
                                      (COND
                                       ((OR (ATOM #1#)
                                            (PROGN
                                             (LETT |y| (CAR #1#) . #8#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #2#
                                              (CONS
                                               (COND
                                                ((SPADCALL
                                                  (SPADCALL |arr| |x|
                                                            (QREFELT $ 25))
                                                  |y| (QREFELT $ 29))
                                                 1)
                                                ('T 0))
                                               #2#)
                                              . #8#)))
                                      (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                                      (EXIT (NREVERSE #2#))))
                                #4#)
                               . #8#)))
                       (LETT #3# (CDR #3#) . #8#) (GO G190) G191
                       (EXIT (NREVERSE #4#))))
                 (QREFELT $ 122))
                . #8#)
          (EXIT (SPADCALL |zf| |xxo| (QREFELT $ 124)))))) 

(SDEFUN |POSET-;moebius;AIa;64| ((|s| A) ($ |IncidenceAlgebra| (|Integer|) S))
        (SPROG
         ((|mf| (|Matrix| (|Integer|)))
          (|z| (|IncidenceAlgebra| (|Integer|) S)))
         (SEQ
          (LETT |z| (SPADCALL |s| (QREFELT $ 126))
                . #1=(|POSET-;moebius;AIa;64|))
          (LETT |mf|
                (SPADCALL (SPADCALL |z| (QREFELT $ 127)) 1 (QREFELT $ 129))
                . #1#)
          (EXIT
           (SPADCALL |mf| (SPADCALL |z| (QREFELT $ 131)) (QREFELT $ 132)))))) 

(SDEFUN |POSET-;coverMatrix;AIa;65|
        ((|s| A) ($ |IncidenceAlgebra| (|Integer|) S))
        (SPROG
         ((|tabx| (|List| (|Integer|))) (#1=#:G1051 NIL) (|j| NIL)
          (#2=#:G1050 NIL) (|i| NIL) (|ni| (|Integer|))
          (|res| (|Matrix| (|Integer|))) (|n| (|NonNegativeInteger|))
          (|zf| (|Matrix| (|Integer|)))
          (|z| (|IncidenceAlgebra| (|Integer|) S)))
         (SEQ
          (LETT |z| (SPADCALL |s| (QREFELT $ 126))
                . #3=(|POSET-;coverMatrix;AIa;65|))
          (LETT |zf| (SPADCALL |z| (QREFELT $ 127)) . #3#)
          (LETT |n| (ANROWS |zf|) . #3#)
          (LETT |res| (SPADCALL |n| |n| (QREFELT $ 134)) . #3#)
          (LETT |ni| |n| . #3#)
          (SEQ (LETT |i| 1 . #3#) (LETT #2# (- |ni| 1) . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ (LETT |tabx| NIL . #3#)
                    (EXIT
                     (SEQ (LETT |j| (+ |i| 1) . #3#) (LETT #1# |ni| . #3#) G190
                          (COND ((> |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((EQL (SPADCALL |zf| |i| |j| (QREFELT $ 135)) 1)
                              (COND
                               ((NULL
                                 (SPADCALL
                                  (CONS #'|POSET-;coverMatrix;AIa;65!0|
                                        (VECTOR $ |j| |zf|))
                                  |tabx| (QREFELT $ 139)))
                                (SEQ (LETT |tabx| (CONS |j| |tabx|) . #3#)
                                     (EXIT
                                      (SPADCALL |res| |i| |j| 1
                                                (QREFELT $ 140))))))))))
                          (LETT |j| (+ |j| 1) . #3#) (GO G190) G191
                          (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL |res| (SPADCALL |z| (QREFELT $ 131)) (QREFELT $ 132)))))) 

(SDEFUN |POSET-;coverMatrix;AIa;65!0| ((|u| NIL) ($$ NIL))
        (PROG (|zf| |j| $)
          (LETT |zf| (QREFELT $$ 2) . #1=(|POSET-;coverMatrix;AIa;65|))
          (LETT |j| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |zf| |u| |j| (QREFELT $ 135))
                      (QREFELT $ 136)))))) 

(PUT '|POSET-;hash;ASi;66| '|SPADreplace| '(XLAM (|s|) 0)) 

(SDEFUN |POSET-;hash;ASi;66| ((|s| A) ($ |SingleInteger|)) 0) 

(SDEFUN |POSET-;latex;AS;67| ((|n| A) ($ |String|))
        (SPROG ((|s| (|String|)))
               (SEQ (LETT |s| "" |POSET-;latex;AS;67|) (EXIT |s|)))) 

(SDEFUN |POSET-;=;2AB;68| ((|x| A) (|y| A) ($ |Boolean|))
        (SPROG ((#1=#:G1059 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL (SPADCALL |x| (QREFELT $ 9))
                              (SPADCALL |y| (QREFELT $ 9)) (QREFELT $ 145))
                    (PROGN
                     (LETT #1# NIL . #2=(|POSET-;=;2AB;68|))
                     (GO #3=#:G1058))))
                  (COND
                   ((SPADCALL (SPADCALL |x| (QREFELT $ 12))
                              (SPADCALL |y| (QREFELT $ 12)) (QREFELT $ 146))
                    (PROGN (LETT #1# NIL . #2#) (GO #3#))))
                  (EXIT 'T)))
                #3# (EXIT #1#)))) 

(SDEFUN |POSET-;~=;2AB;69| ((|x| A) (|y| A) ($ |Boolean|))
        (NULL (SPADCALL |x| |y| (QREFELT $ 148)))) 

(SDEFUN |POSET-;coerce;AOf;70| ((|s| A) ($ |OutputForm|))
        (SPROG
         ((#1=#:G1071 NIL) (|mat| (|List| (|List| (|OutputForm|))))
          (|row| (|List| (|OutputForm|))) (|c| (|Symbol|)) (#2=#:G1073 NIL)
          (|b| NIL) (#3=#:G1072 NIL) (|a| NIL) (|dim| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |dim| (LENGTH (SPADCALL |s| (QREFELT $ 9)))
                  . #4=(|POSET-;coerce;AOf;70|))
            (COND
             ((NULL (SPADCALL |s| (QREFELT $ 12)))
              (PROGN
               (LETT #1# (SPADCALL (SPADCALL (QREFELT $ 151)) (QREFELT $ 152))
                     . #4#)
               (GO #5=#:G1070))))
            (LETT |mat| NIL . #4#)
            (SEQ (LETT |a| NIL . #4#)
                 (LETT #3# (SPADCALL |s| (QREFELT $ 12)) . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |a| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ (LETT |row| NIL . #4#)
                      (COND
                       ((SPADCALL |a| (QREFELT $ 153))
                        (LETT |row|
                              (SPADCALL |row|
                                        (SPADCALL (SPADCALL (QREFELT $ 151))
                                                  (QREFELT $ 152))
                                        (QREFELT $ 155))
                              . #4#))
                       ('T
                        (SEQ (LETT |b| NIL . #4#) (LETT #2# |a| . #4#) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |b| (CAR #2#) . #4#) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |c| (COND (|b| '|true|) ('T '|false|))
                                    . #4#)
                              (EXIT
                               (LETT |row|
                                     (SPADCALL |row|
                                               (SPADCALL |c| (QREFELT $ 157))
                                               (QREFELT $ 155))
                                     . #4#)))
                             (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                             (EXIT NIL))))
                      (COND
                       ((SPADCALL (LENGTH |row|) |dim| (QREFELT $ 104))
                        (PROGN
                         (LETT #1#
                               (SPADCALL "wrong number of cols"
                                         (QREFELT $ 158))
                               . #4#)
                         (GO #5#))))
                      (EXIT
                       (LETT |mat| (SPADCALL |mat| |row| (QREFELT $ 160))
                             . #4#)))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (COND
             ((SPADCALL (LENGTH |mat|) |dim| (QREFELT $ 104))
              (PROGN
               (LETT #1# (SPADCALL "wrong number of rows" (QREFELT $ 158))
                     . #4#)
               (GO #5#))))
            (EXIT (SPADCALL |mat| (QREFELT $ 162)))))
          #5# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |Poset&;|)) 

(DEFUN |Poset&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|Poset&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|Poset&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 164) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|Poset&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|List| 7)
              (0 . |getVert|) (5 . |concat|) (|List| 19) (11 . |getArr|)
              (|Union| $ '"failed") (|NonNegativeInteger|)
              (16 . |subtractIfCan|) (|Boolean|) (|Union| 14 '"failed")
              (22 . ~=) (|List| 16) (28 . |concat|) (34 . |concat|)
              (40 . |finitePoset|) |POSET-;addObject;ASA;1| (|Integer|)
              (46 . |qelt|) (52 . |setelt!|) (59 . |setelt!|)
              |POSET-;addArrow;A2NniA;2| (66 . |qelt|) |POSET-;le;A2NniB;4|
              (|Void|) (72 . |void|) (76 . |setVert|) (82 . |setArr|)
              |POSET-;addObject!;ASA;6| (88 . |addObject!|)
              (|Record| (|:| |value| 7) (|:| |posX| 14) (|:| |posY| 14))
              |POSET-;addObject!;ARA;7| (|String|) |POSET-;addArrow!;AS2NniA;8|
              (94 . |addArrow!|) (|List| 14) |POSET-;addArrow!;AS2NniLA;9|
              (|List| 37) |POSET-;getVertices;AL;10|
              (|Record| (|:| |name| 39) (|:| |arrType| 14) (|:| |fromOb| 14)
                        (|:| |toOb| 14) (|:| |xOffset| 24) (|:| |yOffset| 24)
                        (|:| |map| 42))
              (|List| 46) (102 . |concat|) |POSET-;getArrows;AL;11|
              (|DirectedGraph| $) |POSET-;flatten;DgA;12| |POSET-;initial;A;13|
              |POSET-;terminal;SA;14| |POSET-;cycleOpen;LSA;15|
              |POSET-;cycleClosed;LSA;16| |POSET-;unit;LSA;17|
              |POSET-;kgraph;LSA;18| |POSET-;isDirectSuccessor?;A2NniB;19|
              |POSET-;isGreaterThan?;A2NniB;20| (108 . |concat|)
              (114 . |meetIfCan|) (120 . =) |POSET-;max;ANni;21|
              |POSET-;max;ALNni;22| (126 . |joinIfCan|) |POSET-;min;ANni;23|
              |POSET-;min;ALNni;24| |POSET-;isFixPoint?;ANniB;25|
              |POSET-;arrowName;A2NniS;26| |POSET-;getArrowIndex;A3Nni;27|
              |POSET-;inDegree;A2Nni;28| |POSET-;outDegree;A2Nni;29|
              |POSET-;nodeFromNode;ANniL;30| |POSET-;nodeToNode;ANniL;31|
              |POSET-;arrowsFromNode;ANniL;32| |POSET-;arrowsToNode;ANniL;33|
              |POSET-;nodeFromArrow;ANniL;34| |POSET-;nodeToArrow;ANniL;35|
              |POSET-;arrowsFromArrow;ANniL;36| |POSET-;arrowsToArrow;ANniL;37|
              |POSET-;routeNodes;A2NniL;38| |POSET-;routeArrows;A2NniL;39|
              |POSET-;distance;A2NniI;40| |POSET-;merge;3A;42|
              |POSET-;isDirected?;B;43| |POSET-;createWidth;2Nni;44|
              |POSET-;createX;3Nni;45| |POSET-;createY;3Nni;46|
              |POSET-;looseEquals;2AB;47| |POSET-;map;ALL2IA;48|
              |POSET-;mapContra;ALL2IA;49| |POSET-;opposite;2A;50|
              |POSET-;implies;A2NniB;51| (132 . |setIntersection|)
              (138 . |glb|) |POSET-;joinIfCan;A2NniU;52| (144 . |lub|)
              |POSET-;meetIfCan;A2NniU;53| |POSET-;meetIfCan;ALU;54|
              |POSET-;joinIfCan;ALU;55| (150 . |#|) (155 . |copy|)
              (160 . |implies|) (167 . ~=) (173 . |entry?|) (179 . |remove|)
              |POSET-;glb;ALU;56| |POSET-;lub;ALU;57| (185 . |qelt|)
              |POSET-;indexToObject;ANniS;58| (191 . |position|)
              |POSET-;objectToIndex;ASNni;59| (197 . |copy|)
              |POSET-;completeReflexivity;2A;60|
              |POSET-;completeTransitivity;2A;61|
              |POSET-;isAntisymmetric?;AB;62| (|ListPackage| 7)
              (202 . |topologicalSort|) (208 . |removeDuplicates|) (|List| 138)
              (|Matrix| 24) (213 . |matrix|) (|IncidenceAlgebra| 24 7)
              (218 . |incidenceAlgebra|) |POSET-;zetaMatrix;AIa;63|
              (224 . |zetaMatrix|) (229 . |matrix|)
              (|TriangularMatrixOperations| 24 (|Vector| 24) (|Vector| 24) 121)
              (234 . |UpTriBddDenomInv|) (|OneDimensionalArray| 7)
              (240 . |indices|) (245 . |incidenceAlgebra|)
              |POSET-;moebius;AIa;64| (251 . |zero|) (257 . |elt|)
              (264 . |one?|) (|Mapping| 16 24) (|List| 24) (269 . |any?|)
              (275 . |setelt!|) |POSET-;coverMatrix;AIa;65| (|SingleInteger|)
              |POSET-;hash;ASi;66| |POSET-;latex;AS;67| (283 . ~=) (289 . ~=)
              |POSET-;=;2AB;68| (295 . =) |POSET-;~=;2AB;69| (|OutputForm|)
              (301 . |empty|) (305 . |bracket|) (310 . |empty?|) (|List| 150)
              (315 . |concat|) (|Symbol|) (321 . |outputForm|)
              (326 . |outputForm|) (|List| 154) (331 . |concat|)
              (|List| (|List| $)) (337 . |matrix|) |POSET-;coerce;AOf;70|)
           '#(~= 342 |zetaMatrix| 348 |unit| 353 |terminal| 359 |routeNodes|
              364 |routeArrows| 371 |outDegree| 378 |opposite| 384
              |objectToIndex| 389 |nodeToNode| 395 |nodeToArrow| 401
              |nodeFromNode| 407 |nodeFromArrow| 413 |moebius| 419 |min| 424
              |merge| 435 |meetIfCan| 441 |max| 454 |mapContra| 465 |map| 474
              |lub| 483 |looseEquals| 489 |le| 495 |latex| 502 |kgraph| 507
              |joinIfCan| 513 |isGreaterThan?| 526 |isFixPoint?| 533
              |isDirected?| 539 |isDirectSuccessor?| 543 |isAntisymmetric?| 550
              |initial| 555 |indexToObject| 559 |inDegree| 565 |implies| 571
              |hash| 578 |glb| 583 |getVertices| 589 |getArrows| 594
              |getArrowIndex| 599 |flatten| 606 |distance| 611 |cycleOpen| 618
              |cycleClosed| 624 |createY| 630 |createX| 636 |createWidth| 642
              |coverMatrix| 647 |completeTransitivity| 652
              |completeReflexivity| 657 |coerce| 662 |arrowsToNode| 672
              |arrowsToArrow| 678 |arrowsFromNode| 684 |arrowsFromArrow| 690
              |arrowName| 696 |addObject!| 703 |addObject| 715 |addArrow!| 721
              |addArrow| 738 = 745)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 163
                                                 '(1 6 8 0 9 2 8 0 0 7 10 1 6
                                                   11 0 12 2 14 13 0 0 15 2 17
                                                   16 0 0 18 2 19 0 0 16 20 2
                                                   11 0 0 19 21 2 6 0 8 11 22 2
                                                   11 19 0 24 25 3 19 16 0 24
                                                   16 26 3 11 19 0 24 19 27 2
                                                   19 16 0 24 29 0 31 0 32 2 6
                                                   31 0 8 33 2 6 31 0 11 34 2 6
                                                   0 0 7 36 4 6 0 0 39 14 14 41
                                                   2 47 0 0 46 48 2 42 0 0 14
                                                   60 2 6 17 0 42 61 2 17 16 0
                                                   0 62 2 6 17 0 42 65 2 42 0 0
                                                   0 94 2 6 17 0 42 95 2 6 17 0
                                                   42 97 1 42 14 0 101 1 42 0 0
                                                   102 3 6 16 0 14 14 103 2 14
                                                   16 0 0 104 2 42 16 14 0 105
                                                   2 42 0 14 0 106 2 8 7 0 24
                                                   109 2 8 24 7 0 111 1 11 0 0
                                                   113 2 117 8 11 8 118 1 8 0 0
                                                   119 1 121 0 120 122 2 123 0
                                                   121 8 124 1 6 123 0 126 1
                                                   123 121 0 127 2 128 121 121
                                                   24 129 1 123 130 0 131 2 123
                                                   0 121 130 132 2 121 0 14 14
                                                   134 3 121 24 0 24 24 135 1
                                                   24 16 0 136 2 138 16 137 0
                                                   139 4 121 24 0 24 24 24 140
                                                   2 8 16 0 0 145 2 11 16 0 0
                                                   146 2 6 16 0 0 148 0 150 0
                                                   151 1 150 0 0 152 1 19 16 0
                                                   153 2 154 0 0 150 155 1 150
                                                   0 156 157 1 150 0 39 158 2
                                                   159 0 0 154 160 1 150 0 161
                                                   162 2 0 16 0 0 149 1 0 123 0
                                                   125 2 0 0 8 39 56 1 0 0 7 53
                                                   3 0 42 0 14 14 81 3 0 42 0
                                                   14 14 82 2 0 14 0 14 72 1 0
                                                   0 0 92 2 0 14 0 7 112 2 0 42
                                                   0 14 74 2 0 42 0 14 78 2 0
                                                   42 0 14 73 2 0 42 0 14 77 1
                                                   0 123 0 133 2 0 14 0 42 67 1
                                                   0 14 0 66 2 0 0 0 0 84 2 0
                                                   17 0 42 99 3 0 17 0 14 14 98
                                                   2 0 14 0 42 64 1 0 14 0 63 5
                                                   0 0 0 42 8 24 24 91 5 0 0 0
                                                   42 8 24 24 90 2 0 17 0 42
                                                   108 2 0 16 0 0 89 3 0 16 0
                                                   14 14 30 1 0 39 0 144 2 0 0
                                                   8 39 57 2 0 17 0 42 100 3 0
                                                   17 0 14 14 96 3 0 16 0 14 14
                                                   59 2 0 16 0 14 68 0 0 16 85
                                                   3 0 16 0 14 14 58 1 0 16 0
                                                   116 0 0 0 52 2 0 7 0 14 110
                                                   2 0 14 0 14 71 3 0 16 0 14
                                                   14 93 1 0 142 0 143 2 0 17 0
                                                   42 107 1 0 44 0 45 1 0 47 0
                                                   49 3 0 14 0 14 14 70 1 0 0
                                                   50 51 3 0 24 0 14 14 83 2 0
                                                   0 8 39 54 2 0 0 8 39 55 2 0
                                                   14 14 14 88 2 0 14 14 14 87
                                                   1 0 14 14 86 1 0 123 0 141 1
                                                   0 0 0 115 1 0 0 0 114 1 0
                                                   150 0 163 1 0 150 0 163 2 0
                                                   42 0 14 76 2 0 42 0 14 80 2
                                                   0 42 0 14 75 2 0 42 0 14 79
                                                   3 0 39 0 14 14 69 2 0 0 0 37
                                                   38 2 0 0 0 7 35 2 0 0 0 7 23
                                                   5 0 0 0 39 14 14 42 43 4 0 0
                                                   0 39 14 14 40 3 0 0 0 14 14
                                                   28 2 0 16 0 0 147)))))
           '|lookupComplete|)) 
