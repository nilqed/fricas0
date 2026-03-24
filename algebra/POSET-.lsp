
(SDEFUN |POSET-;addObject;ASA;1| ((|s| (A)) (|n| (S)) (% (A)))
        (SPROG
         ((|arrows| (|List| (|List| (|Boolean|))))
          (|emptyRow| (|List| (|Boolean|))) (#1=#:G44 NIL) (|i| NIL)
          (#2=#:G43 NIL) (|row2| (|List| (|Boolean|))) (#3=#:G42 NIL)
          (|row| NIL) (|verts| (|List| S)) (|dim| (|NonNegativeInteger|)))
         (SEQ (LETT |verts| (SPADCALL |s| (QREFELT % 9)))
              (EXIT
               (COND ((SPADCALL |n| |verts| (QREFELT % 11)) |s|)
                     ('T
                      (SEQ (LETT |dim| (+ (LENGTH |verts|) 1))
                           (LETT |verts| (SPADCALL |verts| |n| (QREFELT % 12)))
                           (LETT |arrows| NIL)
                           (SEQ (LETT |row| NIL)
                                (LETT #3# (SPADCALL |s| (QREFELT % 14))) G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |row| (CAR #3#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (LETT |row2|
                                       (SPADCALL |row| NIL (QREFELT % 16)))
                                 (EXIT (LETT |arrows| (CONS |row2| |arrows|))))
                                (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                           (LETT |emptyRow|
                                 (PROGN
                                  (LETT #2# NIL)
                                  (SEQ (LETT |i| 1) (LETT #1# |dim|) G190
                                       (COND
                                        ((|greater_SI| |i| #1#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS (EQL |i| |dim|) #2#))))
                                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                       (EXIT (NREVERSE #2#)))))
                           (LETT |arrows| (CONS |emptyRow| |arrows|))
                           (EXIT
                            (SPADCALL |verts| (NREVERSE |arrows|)
                                      (QREFELT % 17)))))))))) 

(SDEFUN |POSET-;bll_to_mat|
        ((|dim| (|NonNegativeInteger|)) (|arr| (|List| (|List| (|Boolean|))))
         (% (|TwoDimensionalArray| (|Boolean|))))
        (SPROG
         ((#1=#:G53 NIL) (|y| NIL) (#2=#:G54 NIL) (|j| NIL) (#3=#:G51 NIL)
          (|row| NIL) (#4=#:G52 NIL) (|i| NIL)
          (|mat| (|TwoDimensionalArray| (|Boolean|))))
         (SEQ (LETT |mat| (MAKE_MATRIX1 |dim| |dim| NIL))
              (SEQ (LETT |i| 1) (LETT #4# |dim|) (LETT |row| NIL)
                   (LETT #3# |arr|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |row| (CAR #3#)) NIL)
                         (|greater_SI| |i| #4#))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #2# |dim|) (LETT |y| NIL)
                          (LETT #1# |row|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |y| (CAR #1#)) NIL)
                                (|greater_SI| |j| #2#))
                            (GO G191)))
                          (SEQ
                           (EXIT (SPADCALL |mat| |i| |j| |y| (QREFELT % 21))))
                          (LETT #1#
                                (PROG1 (CDR #1#) (LETT |j| (|inc_SI| |j|))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT #3# (PROG1 (CDR #3#) (LETT |i| (|inc_SI| |i|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |mat|)))) 

(SDEFUN |POSET-;mat_to_bll|
        ((|mat| (|TwoDimensionalArray| (|Boolean|)))
         (% (|List| (|List| (|Boolean|)))))
        (SPROG
         ((|arr| (|List| (|List| (|Boolean|)))) (|row| (|List| (|Boolean|)))
          (#1=#:G62 NIL) (|j| NIL) (|i| NIL) (|dim| (|NonNegativeInteger|)))
         (SEQ (LETT |dim| (ANROWS |mat|)) (LETT |arr| NIL)
              (SEQ (LETT |i| |dim|) G190 (COND ((< |i| 1) (GO G191)))
                   (SEQ (LETT |row| NIL)
                        (SEQ (LETT |j| 1) (LETT #1# |dim|) G190
                             (COND ((|greater_SI| |j| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |row|
                                     (CONS
                                      (SPADCALL |mat| |i| |j| (QREFELT % 22))
                                      |row|))))
                             (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (LETT |arr| (CONS (NREVERSE |row|) |arr|))))
                   (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
              (EXIT |arr|)))) 

(SDEFUN |POSET-;transitive_closure!|
        ((|mat| (|TwoDimensionalArray| (|Boolean|))) (% (|Void|)))
        (SPROG
         ((#1=#:G75 NIL) (|k| NIL) (#2=#:G74 NIL) (|i| NIL) (#3=#:G73 NIL)
          (|j| NIL) (|dim| (|NonNegativeInteger|)))
         (SEQ (LETT |dim| (ANROWS |mat|))
              (EXIT
               (SEQ (LETT |j| 1) (LETT #3# |dim|) G190
                    (COND ((|greater_SI| |j| #3#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |i| 1) (LETT #2# |dim|) G190
                           (COND ((|greater_SI| |i| #2#) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |mat| |i| |j| (QREFELT % 22))
                               (SEQ (LETT |k| 1) (LETT #1# |dim|) G190
                                    (COND ((|greater_SI| |k| #1#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SPADCALL |mat| |i| |k|
                                                (COND
                                                 ((SPADCALL |mat| |i| |k|
                                                            (QREFELT % 22))
                                                  'T)
                                                 ('T
                                                  (SPADCALL |mat| |j| |k|
                                                            (QREFELT % 22))))
                                                (QREFELT % 21))))
                                    (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                    (EXIT NIL))))))
                           (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                           (EXIT NIL))))
                    (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |POSET-;anitsymmetric?|
        ((|mat| (|TwoDimensionalArray| (|Boolean|))) (% (|Boolean|)))
        (SPROG
         ((#1=#:G85 NIL) (#2=#:G84 NIL) (#3=#:G87 NIL) (|j| NIL) (#4=#:G86 NIL)
          (|i| NIL) (|dim| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |dim| (ANROWS |mat|))
                (SEQ (LETT |i| 1) (LETT #4# |dim|) G190
                     (COND ((|greater_SI| |i| #4#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #3# |dim|) G190
                            (COND ((|greater_SI| |j| #3#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((EQL |i| |j|)
                                (PROGN (LETT #2# |$NoValue|) (GO #5=#:G77)))
                               ((SPADCALL |mat| |i| |j| (QREFELT % 22))
                                (COND
                                 ((SPADCALL |mat| |j| |i| (QREFELT % 22))
                                  (PROGN (LETT #1# NIL) (GO #6=#:G83)))))))
                             #5# (EXIT #2#))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #6# (EXIT #1#)))) 

(SDEFUN |POSET-;add_arrow|
        ((|s| (A)) (|n1| (|NonNegativeInteger|)) (|n2| (|NonNegativeInteger|))
         (% (A)))
        (SPROG
         ((|mat| (|TwoDimensionalArray| (|Boolean|)))
          (|dim| (|NonNegativeInteger|)))
         (SEQ (LETT |dim| (LENGTH (SPADCALL |s| (QREFELT % 9))))
              (LETT |mat|
                    (|POSET-;bll_to_mat| |dim| (SPADCALL |s| (QREFELT % 14))
                     %))
              (SPADCALL |mat| |n1| |n2| 'T (QREFELT % 21))
              (|POSET-;transitive_closure!| |mat| %)
              (COND
               ((NULL (|POSET-;anitsymmetric?| |mat| %))
                (EXIT (|error| "add_arrow: incompatible arrow"))))
              (EXIT
               (SPADCALL (SPADCALL |s| (QREFELT % 9))
                         (|POSET-;mat_to_bll| |mat| %) (QREFELT % 17)))))) 

(SDEFUN |POSET-;addArrow;A2SA;7| ((|s| (A)) (|n1| (S)) (|n2| (S)) (% (A)))
        (|POSET-;add_arrow| |s| (SPADCALL |s| |n1| (QREFELT % 24))
         (SPADCALL |s| |n2| (QREFELT % 24)) %)) 

(SDEFUN |POSET-;isArrow?|
        ((|arr| (|List| (|List| (|Boolean|)))) (|a| (|NonNegativeInteger|))
         (|b| (|NonNegativeInteger|)) (% (|Boolean|)))
        (SPADCALL (SPADCALL |arr| |a| (QREFELT % 26)) |b| (QREFELT % 27))) 

(SDEFUN |POSET-;le;A2SB;9| ((|s| (A)) (|a| (S)) (|b| (S)) (% (|Boolean|)))
        (|POSET-;isArrow?| (SPADCALL |s| (QREFELT % 14))
         (SPADCALL |s| |a| (QREFELT % 24)) (SPADCALL |s| |b| (QREFELT % 24)) %)) 

(SDEFUN |POSET-;addObject!;ARA;10|
        ((|s| (A))
         (|n|
          (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|))))
         (% (A)))
        (SPROG ((|ob| (S)))
               (SEQ (LETT |ob| (QVELT |n| 0))
                    (EXIT (SPADCALL |s| |ob| (QREFELT % 29)))))) 

(SDEFUN |POSET-;addArrow!;AS2NniA;11|
        ((|s| (A)) (|name| (|String|)) (|n1| (|NonNegativeInteger|))
         (|n2| (|NonNegativeInteger|)) (% (A)))
        (|POSET-;add_arrow| |s| |n1| |n2| %)) 

(SDEFUN |POSET-;addArrow!;AS2NniLA;12|
        ((|s| (A)) (|name| (|String|)) (|n1| (|NonNegativeInteger|))
         (|n2| (|NonNegativeInteger|)) (|mp| (|List| (|NonNegativeInteger|)))
         (% (A)))
        (SPADCALL |s| |name| |n1| |n2| (QREFELT % 34))) 

(SDEFUN |POSET-;getVertices;AL;13|
        ((|s| (A))
         (%
          (|List|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))))
        (SPROG ((#1=#:G106 NIL) (|x| NIL) (#2=#:G105 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |x| NIL) (LETT #1# (SPADCALL |s| (QREFELT % 9)))
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (VECTOR |x| 0 0) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |POSET-;getArrows;AL;14|
        ((|s| (A))
         (%
          (|List|
           #1=(|Record| (|:| |name| (|String|))
                        (|:| |arrType| (|NonNegativeInteger|))
                        (|:| |fromOb| (|NonNegativeInteger|))
                        (|:| |toOb| (|NonNegativeInteger|))
                        (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                        (|:| |map| (|List| (|NonNegativeInteger|)))))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arr| #1#) (#2=#:G121 NIL) (|y| NIL) (#3=#:G122 NIL) (|val| NIL)
          (#4=#:G119 NIL) (|x| NIL) (#5=#:G120 NIL) (|row| NIL)
          (|dim| (|NonNegativeInteger|)))
         (SEQ (LETT |res| NIL)
              (LETT |dim| (LENGTH (SPADCALL |s| (QREFELT % 14))))
              (SEQ (LETT |row| NIL) (LETT #5# (SPADCALL |s| (QREFELT % 14)))
                   (LETT |x| 1) (LETT #4# |dim|) G190
                   (COND
                    ((OR (|greater_SI| |x| #4#) (ATOM #5#)
                         (PROGN (LETT |row| (CAR #5#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |val| NIL) (LETT #3# |row|) (LETT |y| 1)
                          (LETT #2# |dim|) G190
                          (COND
                           ((OR (|greater_SI| |y| #2#) (ATOM #3#)
                                (PROGN (LETT |val| (CAR #3#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             (|val|
                              (SEQ (LETT |arr| (VECTOR "x" 0 |x| |y| 0 0 NIL))
                                   (EXIT (LETT |res| (CONS |arr| |res|))))))))
                          (LETT |y|
                                (PROG1 (|inc_SI| |y|) (LETT #3# (CDR #3#))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |x| (PROG1 (|inc_SI| |x|) (LETT #5# (CDR #5#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |POSET-;flatten;DgA;15| ((|n| (|DirectedGraph| A)) (% (A)))
        (SPADCALL NIL (LIST NIL) (QREFELT % 17))) 

(SDEFUN |POSET-;initial;A;16| ((% (A))) (SPADCALL NIL NIL (QREFELT % 17))) 

(SDEFUN |POSET-;terminal;SA;17| ((|a| (S)) (% (A)))
        (SPADCALL (LIST |a|) (LIST (LIST 'T)) (QREFELT % 17))) 

(SDEFUN |POSET-;cycleOpen;LSA;18|
        ((|objs| (|List| S)) (|arrowName| (|String|)) (% (A)))
        (SPADCALL NIL (LIST NIL) (QREFELT % 17))) 

(SDEFUN |POSET-;cycleClosed;LSA;19|
        ((|objs| (|List| S)) (|arrowName| (|String|)) (% (A)))
        (SPADCALL NIL (LIST NIL) (QREFELT % 17))) 

(SDEFUN |POSET-;unit;LSA;20|
        ((|objs| (|List| S)) (|arrowName| (|String|)) (% (A)))
        (SPROG
         ((|arrs| (|List| (|List| (|Boolean|)))) (|row| (|List| (|Boolean|)))
          (#1=#:G136 NIL) (|j| NIL) (#2=#:G135 NIL) (|i| NIL)
          (|dim| (|NonNegativeInteger|)))
         (SEQ (LETT |dim| (LENGTH |objs|)) (LETT |arrs| (LIST NIL))
              (SEQ (LETT |i| |dim|) G190 (COND ((< |i| 1) (GO G191)))
                   (SEQ
                    (LETT |row|
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |j| 1) (LETT #1# |dim|) G190
                                (COND ((|greater_SI| |j| #1#) (GO G191)))
                                (SEQ
                                 (EXIT (LETT #2# (CONS (EQL |i| |j|) #2#))))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT (NREVERSE #2#)))))
                    (EXIT (LETT |arrs| (CONS |row| |arrs|))))
                   (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |objs| |arrs| (QREFELT % 17)))))) 

(SDEFUN |POSET-;kgraph;LSA;21|
        ((|objs| (|List| S)) (|arrowName| (|String|)) (% (A)))
        (SPADCALL NIL (LIST (LIST NIL)) (QREFELT % 17))) 

(SDEFUN |POSET-;isDirectSuccessor?;A2NniB;22|
        ((|s| (A)) (|a| (|NonNegativeInteger|)) (|b| (|NonNegativeInteger|))
         (% (|Boolean|)))
        (SPROG ((|row| (|List| (|Boolean|))))
               (SEQ
                (LETT |row|
                      (SPADCALL (SPADCALL |s| (QREFELT % 14)) |a|
                                (QREFELT % 26)))
                (EXIT (SPADCALL |row| |b| (QREFELT % 27)))))) 

(SDEFUN |POSET-;isGreaterThan?;A2NniB;23|
        ((|s| (A)) (|a| (|NonNegativeInteger|)) (|b| (|NonNegativeInteger|))
         (% (|Boolean|)))
        (SPROG ((|row| (|List| (|Boolean|))))
               (SEQ
                (LETT |row|
                      (SPADCALL (SPADCALL |s| (QREFELT % 14)) |a|
                                (QREFELT % 26)))
                (EXIT (SPADCALL |row| |b| (QREFELT % 27)))))) 

(SDEFUN |POSET-;max;ANni;24| ((|s| (A)) (% (|NonNegativeInteger|)))
        (SPROG
         ((#1=#:G146 NIL) (#2=#:G150 NIL)
          (|res| (|Union| (|NonNegativeInteger|) "failed"))
          (|index| (|NonNegativeInteger|))
          (|arr| (|List| (|NonNegativeInteger|))) (#3=#:G151 NIL) (|x| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |arr| NIL) (LETT |index| 1)
                (SEQ (LETT |x| NIL) (LETT #3# (SPADCALL |s| (QREFELT % 14)))
                     G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |arr| (SPADCALL |arr| |index| (QREFELT % 52)))
                          (EXIT (LETT |index| (+ |index| 1))))
                     (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                (LETT |res| (SPADCALL |s| |arr| (QREFELT % 54)))
                (COND
                 ((SPADCALL |res| (CONS 1 "failed") (QREFELT % 55))
                  (PROGN (LETT #2# 0) (GO #4=#:G149))))
                (EXIT
                 (PROG2 (LETT #1# |res|)
                     (QCDR #1#)
                   (|check_union2| (QEQCAR #1# 0) (|NonNegativeInteger|)
                                   (|Union| (|NonNegativeInteger|) "failed")
                                   #1#)))))
          #4# (EXIT #2#)))) 

(SDEFUN |POSET-;max;ALNni;25|
        ((|s| (A)) (|sub| (|List| (|NonNegativeInteger|)))
         (% (|NonNegativeInteger|)))
        (SPROG
         ((#1=#:G153 NIL) (#2=#:G157 NIL)
          (|res| (|Union| (|NonNegativeInteger|) "failed")))
         (SEQ
          (EXIT
           (SEQ (LETT |res| (SPADCALL |s| |sub| (QREFELT % 54)))
                (COND
                 ((SPADCALL |res| (CONS 1 "failed") (QREFELT % 55))
                  (PROGN (LETT #2# 0) (GO #3=#:G156))))
                (EXIT
                 (PROG2 (LETT #1# |res|)
                     (QCDR #1#)
                   (|check_union2| (QEQCAR #1# 0) (|NonNegativeInteger|)
                                   (|Union| (|NonNegativeInteger|) "failed")
                                   #1#)))))
          #3# (EXIT #2#)))) 

(SDEFUN |POSET-;min;ANni;26| ((|s| (A)) (% (|NonNegativeInteger|)))
        (SPROG
         ((#1=#:G162 NIL) (#2=#:G166 NIL)
          (|res| (|Union| (|NonNegativeInteger|) "failed"))
          (|index| (|NonNegativeInteger|))
          (|arr| (|List| (|NonNegativeInteger|))) (#3=#:G167 NIL) (|x| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |arr| NIL) (LETT |index| 1)
                (SEQ (LETT |x| NIL) (LETT #3# (SPADCALL |s| (QREFELT % 14)))
                     G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |arr| (SPADCALL |arr| |index| (QREFELT % 52)))
                          (EXIT (LETT |index| (+ |index| 1))))
                     (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                (LETT |res| (SPADCALL |s| |arr| (QREFELT % 58)))
                (COND
                 ((SPADCALL |res| (CONS 1 "failed") (QREFELT % 55))
                  (PROGN (LETT #2# 0) (GO #4=#:G165))))
                (EXIT
                 (PROG2 (LETT #1# |res|)
                     (QCDR #1#)
                   (|check_union2| (QEQCAR #1# 0) (|NonNegativeInteger|)
                                   (|Union| (|NonNegativeInteger|) "failed")
                                   #1#)))))
          #4# (EXIT #2#)))) 

(SDEFUN |POSET-;min;ALNni;27|
        ((|s| (A)) (|sub| (|List| (|NonNegativeInteger|)))
         (% (|NonNegativeInteger|)))
        (SPROG
         ((#1=#:G169 NIL) (#2=#:G173 NIL)
          (|res| (|Union| (|NonNegativeInteger|) "failed")))
         (SEQ
          (EXIT
           (SEQ (LETT |res| (SPADCALL |s| |sub| (QREFELT % 58)))
                (COND
                 ((SPADCALL |res| (CONS 1 "failed") (QREFELT % 55))
                  (PROGN (LETT #2# 0) (GO #3=#:G172))))
                (EXIT
                 (PROG2 (LETT #1# |res|)
                     (QCDR #1#)
                   (|check_union2| (QEQCAR #1# 0) (|NonNegativeInteger|)
                                   (|Union| (|NonNegativeInteger|) "failed")
                                   #1#)))))
          #3# (EXIT #2#)))) 

(PUT '|POSET-;isFixPoint?;ANniB;28| '|SPADreplace| '(XLAM (|s| |a|) 'T)) 

(SDEFUN |POSET-;isFixPoint?;ANniB;28|
        ((|s| (A)) (|a| (|NonNegativeInteger|)) (% (|Boolean|))) 'T) 

(PUT '|POSET-;arrowName;A2NniS;29| '|SPADreplace| '(XLAM (|s| |a| |b|) "?")) 

(SDEFUN |POSET-;arrowName;A2NniS;29|
        ((|s| (A)) (|a| (|NonNegativeInteger|)) (|b| (|NonNegativeInteger|))
         (% (|String|)))
        "?") 

(PUT '|POSET-;getArrowIndex;A3Nni;30| '|SPADreplace| '(XLAM (|s| |a| |b|) 0)) 

(SDEFUN |POSET-;getArrowIndex;A3Nni;30|
        ((|s| (A)) (|a| (|NonNegativeInteger|)) (|b| (|NonNegativeInteger|))
         (% (|NonNegativeInteger|)))
        0) 

(PUT '|POSET-;inDegree;A2Nni;31| '|SPADreplace| '(XLAM (|s| |a|) 0)) 

(SDEFUN |POSET-;inDegree;A2Nni;31|
        ((|s| (A)) (|a| (|NonNegativeInteger|)) (% (|NonNegativeInteger|))) 0) 

(PUT '|POSET-;outDegree;A2Nni;32| '|SPADreplace| '(XLAM (|s| |a|) 0)) 

(SDEFUN |POSET-;outDegree;A2Nni;32|
        ((|s| (A)) (|a| (|NonNegativeInteger|)) (% (|NonNegativeInteger|))) 0) 

(PUT '|POSET-;nodeFromNode;ANniL;33| '|SPADreplace| '(XLAM (|s| |a|) (LIST 0))) 

(SDEFUN |POSET-;nodeFromNode;ANniL;33|
        ((|s| (A)) (|a| (|NonNegativeInteger|))
         (% (|List| (|NonNegativeInteger|))))
        (LIST 0)) 

(PUT '|POSET-;nodeToNode;ANniL;34| '|SPADreplace| '(XLAM (|s| |a|) (LIST 0))) 

(SDEFUN |POSET-;nodeToNode;ANniL;34|
        ((|s| (A)) (|a| (|NonNegativeInteger|))
         (% (|List| (|NonNegativeInteger|))))
        (LIST 0)) 

(PUT '|POSET-;arrowsFromNode;ANniL;35| '|SPADreplace|
     '(XLAM (|s| |a|) (LIST 0))) 

(SDEFUN |POSET-;arrowsFromNode;ANniL;35|
        ((|s| (A)) (|a| (|NonNegativeInteger|))
         (% (|List| (|NonNegativeInteger|))))
        (LIST 0)) 

(PUT '|POSET-;arrowsToNode;ANniL;36| '|SPADreplace| '(XLAM (|s| |a|) (LIST 0))) 

(SDEFUN |POSET-;arrowsToNode;ANniL;36|
        ((|s| (A)) (|a| (|NonNegativeInteger|))
         (% (|List| (|NonNegativeInteger|))))
        (LIST 0)) 

(PUT '|POSET-;nodeFromArrow;ANniL;37| '|SPADreplace| '(XLAM (|s| |a|) (LIST 0))) 

(SDEFUN |POSET-;nodeFromArrow;ANniL;37|
        ((|s| (A)) (|a| (|NonNegativeInteger|))
         (% (|List| (|NonNegativeInteger|))))
        (LIST 0)) 

(PUT '|POSET-;nodeToArrow;ANniL;38| '|SPADreplace| '(XLAM (|s| |a|) (LIST 0))) 

(SDEFUN |POSET-;nodeToArrow;ANniL;38|
        ((|s| (A)) (|a| (|NonNegativeInteger|))
         (% (|List| (|NonNegativeInteger|))))
        (LIST 0)) 

(PUT '|POSET-;arrowsFromArrow;ANniL;39| '|SPADreplace|
     '(XLAM (|s| |a|) (LIST 0))) 

(SDEFUN |POSET-;arrowsFromArrow;ANniL;39|
        ((|s| (A)) (|a| (|NonNegativeInteger|))
         (% (|List| (|NonNegativeInteger|))))
        (LIST 0)) 

(PUT '|POSET-;arrowsToArrow;ANniL;40| '|SPADreplace| '(XLAM (|s| |a|) (LIST 0))) 

(SDEFUN |POSET-;arrowsToArrow;ANniL;40|
        ((|s| (A)) (|a| (|NonNegativeInteger|))
         (% (|List| (|NonNegativeInteger|))))
        (LIST 0)) 

(PUT '|POSET-;routeNodes;A2NniL;41| '|SPADreplace|
     '(XLAM (|s| |a| |b|) (LIST 0))) 

(SDEFUN |POSET-;routeNodes;A2NniL;41|
        ((|s| (A)) (|a| (|NonNegativeInteger|)) (|b| (|NonNegativeInteger|))
         (% (|List| (|NonNegativeInteger|))))
        (LIST 0)) 

(PUT '|POSET-;routeArrows;A2NniL;42| '|SPADreplace|
     '(XLAM (|s| |a| |b|) (LIST 0))) 

(SDEFUN |POSET-;routeArrows;A2NniL;42|
        ((|s| (A)) (|a| (|NonNegativeInteger|)) (|b| (|NonNegativeInteger|))
         (% (|List| (|NonNegativeInteger|))))
        (LIST 0)) 

(PUT '|POSET-;distance;A2NniI;43| '|SPADreplace| '(XLAM (|s| |a| |b|) 0)) 

(SDEFUN |POSET-;distance;A2NniI;43|
        ((|s| (A)) (|a| (|NonNegativeInteger|)) (|b| (|NonNegativeInteger|))
         (% (|Integer|)))
        0) 

(PUT '|POSET-;+| '|SPADreplace| '(XLAM (|a| |b|) |a|)) 

(SDEFUN |POSET-;+| ((|a| (A)) (|b| (A)) (% (A))) |a|) 

(PUT '|POSET-;merge;3A;45| '|SPADreplace| '(XLAM (|a| |b|) |a|)) 

(SDEFUN |POSET-;merge;3A;45| ((|a| (A)) (|b| (A)) (% (A))) |a|) 

(PUT '|POSET-;isDirected?;B;46| '|SPADreplace| '(XLAM NIL 'T)) 

(SDEFUN |POSET-;isDirected?;B;46| ((% (|Boolean|))) 'T) 

(PUT '|POSET-;createWidth;2Nni;47| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |POSET-;createWidth;2Nni;47|
        ((|x| (|NonNegativeInteger|)) (% (|NonNegativeInteger|))) 0) 

(PUT '|POSET-;createX;3Nni;48| '|SPADreplace| '(XLAM (|x| |n|) 0)) 

(SDEFUN |POSET-;createX;3Nni;48|
        ((|x| (|NonNegativeInteger|)) (|n| (|NonNegativeInteger|))
         (% (|NonNegativeInteger|)))
        0) 

(PUT '|POSET-;createY;3Nni;49| '|SPADreplace| '(XLAM (|x| |n|) 0)) 

(SDEFUN |POSET-;createY;3Nni;49|
        ((|x| (|NonNegativeInteger|)) (|n| (|NonNegativeInteger|))
         (% (|NonNegativeInteger|)))
        0) 

(PUT '|POSET-;looseEquals;2AB;50| '|SPADreplace| '(XLAM (|x| |y|) NIL)) 

(SDEFUN |POSET-;looseEquals;2AB;50| ((|x| (A)) (|y| (A)) (% (|Boolean|))) NIL) 

(PUT '|POSET-;map;ALL2IA;51| '|SPADreplace|
     '(XLAM (|s| |m| |newOb| |offsetX| |offsetY|) |s|)) 

(SDEFUN |POSET-;map;ALL2IA;51|
        ((|s| (A)) (|m| (|List| (|NonNegativeInteger|))) (|newOb| (|List| S))
         (|offsetX| (|Integer|)) (|offsetY| (|Integer|)) (% (A)))
        |s|) 

(PUT '|POSET-;mapContra;ALL2IA;52| '|SPADreplace|
     '(XLAM (|s| |m| |newOb| |offsetX| |offsetY|) |s|)) 

(SDEFUN |POSET-;mapContra;ALL2IA;52|
        ((|s| (A)) (|m| (|List| (|NonNegativeInteger|))) (|newOb| (|List| S))
         (|offsetX| (|Integer|)) (|offsetY| (|Integer|)) (% (A)))
        |s|) 

(SDEFUN |POSET-;opposite;2A;53| ((|s| (A)) (% (A)))
        (SPROG
         ((#1=#:G206 NIL) (|y| NIL) (|j| NIL) (#2=#:G205 NIL) (|row| NIL)
          (|i| NIL) (|mat| (|TwoDimensionalArray| (|Boolean|)))
          (|dim| (|NonNegativeInteger|))
          (|arr2| (|List| (|List| (|Boolean|)))))
         (SEQ (LETT |arr2| (LIST NIL))
              (LETT |dim| (LENGTH (SPADCALL |s| (QREFELT % 9))))
              (LETT |mat| (MAKE_MATRIX1 |dim| |dim| NIL))
              (SEQ (LETT |i| 1) (LETT |row| NIL)
                   (LETT #2# (SPADCALL |s| (QREFELT % 14))) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |row| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT |y| NIL) (LETT #1# |row|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |y| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT (SPADCALL |mat| |j| |i| |y| (QREFELT % 21))))
                          (LETT #1#
                                (PROG1 (CDR #1#) (LETT |j| (|inc_SI| |j|))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (SPADCALL |s| (QREFELT % 9))
                         (|POSET-;mat_to_bll| |mat| %) (QREFELT % 17)))))) 

(SDEFUN |POSET-;implies;A2NniB;54|
        ((|s| (A)) (|left| (|NonNegativeInteger|))
         (|right| (|NonNegativeInteger|)) (% (|Boolean|)))
        (SPROG ((|b| (|Boolean|)) (|a| (|List| (|Boolean|))))
               (SEQ
                (LETT |a|
                      (SPADCALL (SPADCALL |s| (QREFELT % 14)) |left|
                                (QREFELT % 26)))
                (LETT |b| (SPADCALL |a| |right| (QREFELT % 27))) (EXIT |b|)))) 

(SDEFUN |POSET-;joinIfCan;A2NniU;55|
        ((|s| (A)) (|a| (|NonNegativeInteger|)) (|b| (|NonNegativeInteger|))
         (% (|Union| (|NonNegativeInteger|) "failed")))
        (SPROG
         ((|res| (|List| (|NonNegativeInteger|)))
          (|index| (|NonNegativeInteger|))
          (|candidatesb| (|List| (|NonNegativeInteger|))) (#1=#:G221 NIL)
          (|x| NIL) (|flagb| #2=(|List| (|Boolean|)))
          (|candidatesa| (|List| (|NonNegativeInteger|))) (#3=#:G220 NIL)
          (|flaga| #2#))
         (SEQ (LETT |res| NIL)
              (LETT |flaga|
                    (SPADCALL (SPADCALL |s| (QREFELT % 14)) |a|
                              (QREFELT % 26)))
              (LETT |candidatesa| NIL) (LETT |index| 1)
              (SEQ (LETT |x| NIL) (LETT #3# |flaga|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     (|x|
                      (LETT |candidatesa|
                            (SPADCALL |candidatesa| |index| (QREFELT % 52)))))
                    (EXIT (LETT |index| (+ |index| 1))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (LETT |flagb|
                    (SPADCALL (SPADCALL |s| (QREFELT % 14)) |b|
                              (QREFELT % 26)))
              (LETT |candidatesb| NIL) (LETT |index| 1)
              (SEQ (LETT |x| NIL) (LETT #1# |flagb|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     (|x|
                      (LETT |candidatesb|
                            (SPADCALL |candidatesb| |index| (QREFELT % 52)))))
                    (EXIT (LETT |index| (+ |index| 1))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |res|
                    (SPADCALL |candidatesa| |candidatesb| (QREFELT % 87)))
              (EXIT (SPADCALL |s| |res| (QREFELT % 88)))))) 

(SDEFUN |POSET-;meetIfCan;A2NniU;56|
        ((|s| (A)) (|a| (|NonNegativeInteger|)) (|b| (|NonNegativeInteger|))
         (% (|Union| (|NonNegativeInteger|) "failed")))
        (SPROG
         ((|res| (|List| (|NonNegativeInteger|)))
          (|index| (|NonNegativeInteger|))
          (|candidatesb| (|List| (|NonNegativeInteger|))) (#1=#:G240 NIL)
          (|x| NIL) (|flagb| (|List| (|Boolean|))) (#2=#:G239 NIL)
          (|candidatesa| (|List| (|NonNegativeInteger|))) (#3=#:G238 NIL)
          (|flaga| (|List| (|Boolean|))) (#4=#:G237 NIL))
         (SEQ (LETT |res| NIL) (LETT |flaga| NIL) (LETT |flagb| NIL)
              (SEQ (LETT |x| NIL) (LETT #4# (SPADCALL |s| (QREFELT % 14))) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |flaga|
                           (SPADCALL |flaga| (SPADCALL |x| |a| (QREFELT % 27))
                                     (QREFELT % 16)))))
                   (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
              (LETT |candidatesa| NIL) (LETT |index| 1)
              (SEQ (LETT |x| NIL) (LETT #3# |flaga|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     (|x|
                      (LETT |candidatesa|
                            (SPADCALL |candidatesa| |index| (QREFELT % 52)))))
                    (EXIT (LETT |index| (+ |index| 1))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |x| NIL) (LETT #2# (SPADCALL |s| (QREFELT % 14))) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |flagb|
                           (SPADCALL |flagb| (SPADCALL |x| |b| (QREFELT % 27))
                                     (QREFELT % 16)))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (LETT |candidatesb| NIL) (LETT |index| 1)
              (SEQ (LETT |x| NIL) (LETT #1# |flagb|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     (|x|
                      (LETT |candidatesb|
                            (SPADCALL |candidatesb| |index| (QREFELT % 52)))))
                    (EXIT (LETT |index| (+ |index| 1))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |res|
                    (SPADCALL |candidatesa| |candidatesb| (QREFELT % 87)))
              (EXIT (SPADCALL |s| |res| (QREFELT % 90)))))) 

(SDEFUN |POSET-;meetIfCan;ALU;57|
        ((|s| (A)) (|elements| (|List| (|NonNegativeInteger|)))
         (% (|Union| (|NonNegativeInteger|) "failed")))
        (SPROG
         ((|res| (|List| (|NonNegativeInteger|)))
          (|index| (|NonNegativeInteger|))
          (|candidates| (|List| (|NonNegativeInteger|))) (#1=#:G256 NIL)
          (|x| NIL) (|flage| (|List| (|Boolean|))) (#2=#:G255 NIL)
          (#3=#:G254 NIL) (|e| NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |e| NIL) (LETT #3# |elements|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |e| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |flage| NIL)
                        (SEQ (LETT |x| NIL)
                             (LETT #2# (SPADCALL |s| (QREFELT % 14))) G190
                             (COND
                              ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |flage|
                                     (SPADCALL |flage|
                                               (SPADCALL |x| |e|
                                                         (QREFELT % 27))
                                               (QREFELT % 16)))))
                             (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                        (LETT |candidates| NIL) (LETT |index| 1)
                        (EXIT
                         (SEQ (LETT |x| NIL) (LETT #1# |flage|) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |x| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (COND
                                (|x|
                                 (LETT |candidates|
                                       (SPADCALL |candidates| |index|
                                                 (QREFELT % 52)))))
                               (EXIT (LETT |index| (+ |index| 1))))
                              (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (LETT |res| (SPADCALL |res| |candidates| (QREFELT % 87)))
              (EXIT (SPADCALL |s| |res| (QREFELT % 90)))))) 

(SDEFUN |POSET-;joinIfCan;ALU;58|
        ((|s| (A)) (|elements| (|List| (|NonNegativeInteger|)))
         (% (|Union| (|NonNegativeInteger|) "failed")))
        (SPROG
         ((|res| (|List| (|NonNegativeInteger|)))
          (|index| (|NonNegativeInteger|))
          (|candidates| (|List| (|NonNegativeInteger|))) (#1=#:G269 NIL)
          (|x| NIL) (|flage| (|List| (|Boolean|))) (#2=#:G268 NIL) (|e| NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |e| NIL) (LETT #2# |elements|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |e| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |flage|
                          (SPADCALL (SPADCALL |s| (QREFELT % 14)) |e|
                                    (QREFELT % 26)))
                    (LETT |candidates| NIL) (LETT |index| 1)
                    (SEQ (LETT |x| NIL) (LETT #1# |flage|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (COND
                           (|x|
                            (LETT |candidates|
                                  (SPADCALL |candidates| |index|
                                            (QREFELT % 52)))))
                          (EXIT (LETT |index| (+ |index| 1))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res| |candidates| (QREFELT % 87)))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |s| |res| (QREFELT % 88)))))) 

(SDEFUN |POSET-;glb;ALU;59|
        ((|s| (A)) (|a| (|List| (|NonNegativeInteger|)))
         (% (|Union| (|NonNegativeInteger|) "failed")))
        (SPROG
         ((#1=#:G285 NIL) (|resultList| (|List| (|NonNegativeInteger|)))
          (#2=#:G287 NIL) (|y| NIL) (#3=#:G286 NIL) (|x| NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND ((NULL |a|) (PROGN (LETT #1# (CONS 0 0)) (GO #4=#:G284))))
            (COND
             ((EQL (SPADCALL |a| (QREFELT % 94)) 1)
              (PROGN (LETT #1# (CONS 0 (|SPADfirst| |a|))) (GO #4#))))
            (LETT |resultList| (SPADCALL |a| (QREFELT % 95)))
            (SEQ (LETT |x| NIL) (LETT #3# |a|) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#)) NIL)) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |y| NIL) (LETT #2# |a|) G190
                        (COND
                         ((OR (ATOM #2#) (PROGN (LETT |y| (CAR #2#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL |s| |x| |y| (QREFELT % 96))
                            (COND
                             ((SPADCALL |x| |y| (QREFELT % 97))
                              (COND
                               ((SPADCALL |x| |resultList| (QREFELT % 98))
                                (LETT |resultList|
                                      (SPADCALL |y| |resultList|
                                                (QREFELT % 99)))))))))))
                        (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
                 (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
            (COND
             ((SPADCALL (SPADCALL |resultList| (QREFELT % 94)) 1
                        (QREFELT % 97))
              (PROGN (LETT #1# (CONS 0 0)) (GO #4#))))
            (EXIT (CONS 0 (|SPADfirst| |resultList|)))))
          #4# (EXIT #1#)))) 

(SDEFUN |POSET-;lub;ALU;60|
        ((|s| (A)) (|a| (|List| (|NonNegativeInteger|)))
         (% (|Union| (|NonNegativeInteger|) "failed")))
        (SPROG
         ((#1=#:G303 NIL) (|resultList| (|List| (|NonNegativeInteger|)))
          (#2=#:G305 NIL) (|y| NIL) (#3=#:G304 NIL) (|x| NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND ((NULL |a|) (PROGN (LETT #1# (CONS 0 0)) (GO #4=#:G302))))
            (COND
             ((EQL (SPADCALL |a| (QREFELT % 94)) 1)
              (PROGN (LETT #1# (CONS 0 (|SPADfirst| |a|))) (GO #4#))))
            (LETT |resultList| (SPADCALL |a| (QREFELT % 95)))
            (SEQ (LETT |x| NIL) (LETT #3# |a|) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#)) NIL)) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |y| NIL) (LETT #2# |a|) G190
                        (COND
                         ((OR (ATOM #2#) (PROGN (LETT |y| (CAR #2#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL |s| |x| |y| (QREFELT % 96))
                            (COND
                             ((SPADCALL |x| |y| (QREFELT % 97))
                              (COND
                               ((SPADCALL |y| |resultList| (QREFELT % 98))
                                (LETT |resultList|
                                      (SPADCALL |x| |resultList|
                                                (QREFELT % 99)))))))))))
                        (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
                 (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
            (COND
             ((SPADCALL (SPADCALL |resultList| (QREFELT % 94)) 1
                        (QREFELT % 97))
              (PROGN (LETT #1# (CONS 0 0)) (GO #4#))))
            (EXIT (CONS 0 (|SPADfirst| |resultList|)))))
          #4# (EXIT #1#)))) 

(SDEFUN |POSET-;indexToObject;ANniS;61|
        ((|s| (A)) (|index| (|NonNegativeInteger|)) (% (S)))
        (SPADCALL (SPADCALL |s| (QREFELT % 9)) |index| (QREFELT % 102))) 

(SDEFUN |POSET-;objectToIndex;ASNni;62|
        ((|s| (A)) (|obj| (S)) (% (|NonNegativeInteger|)))
        (SPADCALL |obj| (SPADCALL |s| (QREFELT % 9)) (QREFELT % 104))) 

(SDEFUN |POSET-;zetaMatrix;AIa;63|
        ((|s| (A)) (% (|IncidenceAlgebra| (|Integer|) S)))
        (SPROG
         ((|zf| (|Matrix| (|Integer|))) (#1=#:G324 NIL) (|y| NIL)
          (#2=#:G323 NIL) (#3=#:G322 NIL) (|x| NIL) (#4=#:G321 NIL)
          (|xxi| (|List| (|NonNegativeInteger|))) (#5=#:G309 NIL)
          (#6=#:G320 NIL) (|xxoi| NIL) (#7=#:G319 NIL) (|xxo| (|List| S))
          (|arr| (|List| (|List| (|Boolean|)))) (|xx| (|List| S)))
         (SEQ (LETT |xx| (SPADCALL |s| (QREFELT % 9)))
              (LETT |arr| (SPADCALL |s| (QREFELT % 14)))
              (LETT |xxo|
                    (SPADCALL (SPADCALL |arr| |xx| (QREFELT % 107))
                              (QREFELT % 108)))
              (LETT |xxi|
                    (PROGN
                     (LETT #7# NIL)
                     (SEQ (LETT |xxoi| NIL) (LETT #6# |xxo|) G190
                          (COND
                           ((OR (ATOM #6#) (PROGN (LETT |xxoi| (CAR #6#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7#
                                  (CONS
                                   (PROG1
                                       (LETT #5#
                                             (SPADCALL |xxoi| |xx|
                                                       (QREFELT % 104)))
                                     (|check_subtype2| (>= #5# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #5#))
                                   #7#))))
                          (LETT #6# (CDR #6#)) (GO G190) G191
                          (EXIT (NREVERSE #7#)))))
              (LETT |zf|
                    (SPADCALL
                     (PROGN
                      (LETT #4# NIL)
                      (SEQ (LETT |x| NIL) (LETT #3# |xxi|) G190
                           (COND
                            ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #4#
                                   (CONS
                                    (PROGN
                                     (LETT #2# NIL)
                                     (SEQ (LETT |y| NIL) (LETT #1# |xxi|) G190
                                          (COND
                                           ((OR (ATOM #1#)
                                                (PROGN
                                                 (LETT |y| (CAR #1#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #2#
                                                  (CONS
                                                   (COND
                                                    ((SPADCALL
                                                      (SPADCALL |arr| |x|
                                                                (QREFELT % 26))
                                                      |y| (QREFELT % 27))
                                                     1)
                                                    ('T 0))
                                                   #2#))))
                                          (LETT #1# (CDR #1#)) (GO G190) G191
                                          (EXIT (NREVERSE #2#))))
                                    #4#))))
                           (LETT #3# (CDR #3#)) (GO G190) G191
                           (EXIT (NREVERSE #4#))))
                     (QREFELT % 111)))
              (EXIT (SPADCALL |zf| |xxo| (QREFELT % 113)))))) 

(SDEFUN |POSET-;moebius;AIa;64|
        ((|s| (A)) (% (|IncidenceAlgebra| (|Integer|) S)))
        (SPROG
         ((|mf| (|Matrix| (|Integer|)))
          (|z| (|IncidenceAlgebra| (|Integer|) S)))
         (SEQ (LETT |z| (SPADCALL |s| (QREFELT % 115)))
              (LETT |mf|
                    (SPADCALL (SPADCALL |z| (QREFELT % 116)) 1
                              (QREFELT % 118)))
              (EXIT
               (SPADCALL |mf| (SPADCALL |z| (QREFELT % 120))
                         (QREFELT % 121)))))) 

(SDEFUN |POSET-;coverMatrix;AIa;65|
        ((|s| (A)) (% (|IncidenceAlgebra| (|Integer|) S)))
        (SPROG
         ((|tabx| (|List| (|Integer|))) (#1=#:G346 NIL) (|j| NIL)
          (#2=#:G345 NIL) (|i| NIL) (|ni| (|Integer|))
          (|res| (|Matrix| (|Integer|))) (|n| (|NonNegativeInteger|))
          (|zf| (|Matrix| (|Integer|)))
          (|z| (|IncidenceAlgebra| (|Integer|) S)))
         (SEQ (LETT |z| (SPADCALL |s| (QREFELT % 115)))
              (LETT |zf| (SPADCALL |z| (QREFELT % 116)))
              (LETT |n| (ANROWS |zf|))
              (LETT |res| (SPADCALL |n| |n| (QREFELT % 123))) (LETT |ni| |n|)
              (SEQ (LETT |i| 1) (LETT #2# (- |ni| 1)) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ (LETT |tabx| NIL)
                        (EXIT
                         (SEQ (LETT |j| (+ |i| 1)) (LETT #1# |ni|) G190
                              (COND ((> |j| #1#) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((EQL (SPADCALL |zf| |i| |j| (QREFELT % 124))
                                       1)
                                  (COND
                                   ((NULL
                                     (SPADCALL
                                      (CONS #'|POSET-;coverMatrix;AIa;65!0|
                                            (VECTOR % |j| |zf|))
                                      |tabx| (QREFELT % 128)))
                                    (SEQ (LETT |tabx| (CONS |j| |tabx|))
                                         (EXIT
                                          (SPADCALL |res| |i| |j| 1
                                                    (QREFELT % 129))))))))))
                              (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL |res| (SPADCALL |z| (QREFELT % 120))
                         (QREFELT % 121)))))) 

(SDEFUN |POSET-;coverMatrix;AIa;65!0| ((|u| NIL) ($$ NIL))
        (PROG (|zf| |j| %)
          (LETT |zf| (QREFELT $$ 2))
          (LETT |j| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |zf| |u| |j| (QREFELT % 124))
                      (QREFELT % 125)))))) 

(PUT '|POSET-;hash| '|SPADreplace| '(XLAM (|s|) 0)) 

(SDEFUN |POSET-;hash| ((|s| (A)) (% (|SingleInteger|))) 0) 

(SDEFUN |POSET-;=;2AB;67| ((|x| (A)) (|y| (A)) (% (|Boolean|)))
        (SPROG ((#1=#:G352 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL (SPADCALL |x| (QREFELT % 9))
                              (SPADCALL |y| (QREFELT % 9)) (QREFELT % 131))
                    (PROGN (LETT #1# NIL) (GO #2=#:G351))))
                  (COND
                   ((SPADCALL (SPADCALL |x| (QREFELT % 14))
                              (SPADCALL |y| (QREFELT % 14)) (QREFELT % 132))
                    (PROGN (LETT #1# NIL) (GO #2#))))
                  (EXIT 'T)))
                #2# (EXIT #1#)))) 

(SDEFUN |POSET-;~=;2AB;68| ((|x| (A)) (|y| (A)) (% (|Boolean|)))
        (NULL (SPADCALL |x| |y| (QREFELT % 134)))) 

(SDEFUN |POSET-;coerce;AOf;69| ((|s| (A)) (% (|OutputForm|)))
        (SPROG
         ((#1=#:G366 NIL) (|mat| (|List| (|List| (|OutputForm|))))
          (|row| (|List| (|OutputForm|))) (|c| (|Symbol|)) (#2=#:G368 NIL)
          (|b| NIL) (#3=#:G367 NIL) (|a| NIL) (|dim| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |dim| (LENGTH (SPADCALL |s| (QREFELT % 9))))
                (COND
                 ((NULL (SPADCALL |s| (QREFELT % 14)))
                  (PROGN
                   (LETT #1#
                         (SPADCALL (SPADCALL (QREFELT % 137)) (QREFELT % 138)))
                   (GO #4=#:G365))))
                (LETT |mat| NIL)
                (SEQ (LETT |a| NIL) (LETT #3# (SPADCALL |s| (QREFELT % 14)))
                     G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |a| (CAR #3#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |row| NIL)
                          (COND
                           ((SPADCALL |a| (QREFELT % 139))
                            (LETT |row|
                                  (SPADCALL |row|
                                            (SPADCALL
                                             (SPADCALL (QREFELT % 137))
                                             (QREFELT % 138))
                                            (QREFELT % 141))))
                           ('T
                            (SEQ (LETT |b| NIL) (LETT #2# |a|) G190
                                 (COND
                                  ((OR (ATOM #2#)
                                       (PROGN (LETT |b| (CAR #2#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |c| (COND (|b| '|true|) ('T '|false|)))
                                  (EXIT
                                   (LETT |row|
                                         (SPADCALL |row|
                                                   (SPADCALL |c|
                                                             (QREFELT % 143))
                                                   (QREFELT % 141)))))
                                 (LETT #2# (CDR #2#)) (GO G190) G191
                                 (EXIT NIL))))
                          (COND
                           ((SPADCALL (LENGTH |row|) |dim| (QREFELT % 97))
                            (PROGN
                             (LETT #1#
                                   (SPADCALL "wrong number of cols"
                                             (QREFELT % 144)))
                             (GO #4#))))
                          (EXIT
                           (LETT |mat|
                                 (SPADCALL |mat| |row| (QREFELT % 146)))))
                     (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                (COND
                 ((SPADCALL (LENGTH |mat|) |dim| (QREFELT % 97))
                  (PROGN
                   (LETT #1# (SPADCALL "wrong number of rows" (QREFELT % 144)))
                   (GO #4#))))
                (EXIT (SPADCALL |mat| (QREFELT % 148)))))
          #4# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |Poset&;|)) 

(DEFUN |Poset&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|Poset&| DV$1 DV$2))
          (LETT % (GETREFV 150))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(MAKEPROP '|Poset&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|List| 7)
              (0 . |getVert|) (|Boolean|) (5 . |member?|) (11 . |concat|)
              (|List| 15) (17 . |getArr|) (|List| 10) (22 . |concat|)
              (28 . |finitePoset|) |POSET-;addObject;ASA;1| (|Integer|)
              (|TwoDimensionalArray| 10) (34 . |setelt!|) (42 . |elt|)
              (|NonNegativeInteger|) (49 . |objectToIndex|)
              |POSET-;addArrow;A2SA;7| (55 . |qelt|) (61 . |qelt|)
              |POSET-;le;A2SB;9| (67 . |addObject!|)
              (|Record| (|:| |value| 7) (|:| |posX| 23) (|:| |posY| 23))
              |POSET-;addObject!;ARA;10| (|String|)
              |POSET-;addArrow!;AS2NniA;11| (73 . |addArrow!|) (|List| 23)
              |POSET-;addArrow!;AS2NniLA;12| (|List| 30)
              |POSET-;getVertices;AL;13|
              (|Record| (|:| |name| 32) (|:| |arrType| 23) (|:| |fromOb| 23)
                        (|:| |toOb| 23) (|:| |xOffset| 19) (|:| |yOffset| 19)
                        (|:| |map| 35))
              (|List| 39) |POSET-;getArrows;AL;14| (|DirectedGraph| %)
              |POSET-;flatten;DgA;15| |POSET-;initial;A;16|
              |POSET-;terminal;SA;17| |POSET-;cycleOpen;LSA;18|
              |POSET-;cycleClosed;LSA;19| |POSET-;unit;LSA;20|
              |POSET-;kgraph;LSA;21| |POSET-;isDirectSuccessor?;A2NniB;22|
              |POSET-;isGreaterThan?;A2NniB;23| (81 . |concat|)
              (|Union| 23 '#1="failed") (87 . |meetIfCan|) (93 . =)
              |POSET-;max;ANni;24| |POSET-;max;ALNni;25| (99 . |joinIfCan|)
              |POSET-;min;ANni;26| |POSET-;min;ALNni;27|
              |POSET-;isFixPoint?;ANniB;28| |POSET-;arrowName;A2NniS;29|
              |POSET-;getArrowIndex;A3Nni;30| |POSET-;inDegree;A2Nni;31|
              |POSET-;outDegree;A2Nni;32| |POSET-;nodeFromNode;ANniL;33|
              |POSET-;nodeToNode;ANniL;34| |POSET-;arrowsFromNode;ANniL;35|
              |POSET-;arrowsToNode;ANniL;36| |POSET-;nodeFromArrow;ANniL;37|
              |POSET-;nodeToArrow;ANniL;38| |POSET-;arrowsFromArrow;ANniL;39|
              |POSET-;arrowsToArrow;ANniL;40| |POSET-;routeNodes;A2NniL;41|
              |POSET-;routeArrows;A2NniL;42| |POSET-;distance;A2NniI;43|
              |POSET-;merge;3A;45| |POSET-;isDirected?;B;46|
              |POSET-;createWidth;2Nni;47| |POSET-;createX;3Nni;48|
              |POSET-;createY;3Nni;49| |POSET-;looseEquals;2AB;50|
              |POSET-;map;ALL2IA;51| |POSET-;mapContra;ALL2IA;52|
              |POSET-;opposite;2A;53| |POSET-;implies;A2NniB;54|
              (105 . |setIntersection|) (111 . |glb|)
              |POSET-;joinIfCan;A2NniU;55| (117 . |lub|)
              |POSET-;meetIfCan;A2NniU;56| |POSET-;meetIfCan;ALU;57|
              |POSET-;joinIfCan;ALU;58| (123 . |#|) (128 . |copy|)
              (133 . |implies|) (140 . ~=) (146 . |entry?|) (152 . |remove|)
              |POSET-;glb;ALU;59| |POSET-;lub;ALU;60| (158 . |qelt|)
              |POSET-;indexToObject;ANniS;61| (164 . |position|)
              |POSET-;objectToIndex;ASNni;62| (|ListPackage| 7)
              (170 . |topologicalSort|) (176 . |removeDuplicates|) (|List| 127)
              (|Matrix| 19) (181 . |matrix|) (|IncidenceAlgebra| 19 7)
              (186 . |incidenceAlgebra|) |POSET-;zetaMatrix;AIa;63|
              (192 . |zetaMatrix|) (197 . |matrix|)
              (|TriangularMatrixOperations| 19 (|Vector| 19) (|Vector| 19) 110)
              (202 . |UpTriBddDenomInv|) (|OneDimensionalArray| 7)
              (208 . |indices|) (213 . |incidenceAlgebra|)
              |POSET-;moebius;AIa;64| (219 . |zero|) (225 . |elt|)
              (232 . |one?|) (|Mapping| 10 19) (|List| 19) (237 . |any?|)
              (243 . |setelt!|) |POSET-;coverMatrix;AIa;65| (251 . ~=)
              (257 . ~=) |POSET-;=;2AB;67| (263 . =) |POSET-;~=;2AB;68|
              (|OutputForm|) (269 . |empty|) (273 . |bracket|) (278 . |empty?|)
              (|List| 136) (283 . |concat|) (|Symbol|) (289 . |outputForm|)
              (294 . |outputForm|) (|List| 140) (299 . |concat|)
              (|List| (|List| %)) (305 . |matrix|) |POSET-;coerce;AOf;69|)
           '#(~= 310 |zetaMatrix| 316 |unit| 321 |terminal| 327 |routeNodes|
              332 |routeArrows| 339 |outDegree| 346 |opposite| 352
              |objectToIndex| 357 |nodeToNode| 363 |nodeToArrow| 369
              |nodeFromNode| 375 |nodeFromArrow| 381 |moebius| 387 |min| 392
              |merge| 403 |meetIfCan| 409 |max| 422 |mapContra| 433 |map| 442
              |lub| 451 |looseEquals| 457 |le| 463 |kgraph| 470 |joinIfCan| 476
              |isGreaterThan?| 489 |isFixPoint?| 496 |isDirected?| 502
              |isDirectSuccessor?| 506 |initial| 513 |indexToObject| 517
              |inDegree| 523 |implies| 529 |glb| 536 |getVertices| 542
              |getArrows| 547 |getArrowIndex| 552 |flatten| 559 |distance| 564
              |cycleOpen| 571 |cycleClosed| 577 |createY| 583 |createX| 589
              |createWidth| 595 |coverMatrix| 600 |coerce| 605 |arrowsToNode|
              610 |arrowsToArrow| 616 |arrowsFromNode| 622 |arrowsFromArrow|
              628 |arrowName| 634 |addObject!| 641 |addObject| 647 |addArrow!|
              653 |addArrow| 670 = 677)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|coverMatrix|
                                 ((|IncidenceAlgebra| (|Integer|) |#2|) |#1|))
                                T)
                              '((|zetaMatrix|
                                 ((|IncidenceAlgebra| (|Integer|) |#2|) |#1|))
                                T)
                              '((|moebius|
                                 ((|IncidenceAlgebra| (|Integer|) |#2|) |#1|))
                                T)
                              '((|objectToIndex|
                                 ((|NonNegativeInteger|) |#1| |#2|))
                                T)
                              '((|indexToObject|
                                 (|#2| |#1| (|NonNegativeInteger|)))
                                T)
                              '((|lub|
                                 ((|Union| (|NonNegativeInteger|) "failed")
                                  |#1| (|List| (|NonNegativeInteger|))))
                                T)
                              '((|glb|
                                 ((|Union| (|NonNegativeInteger|) "failed")
                                  |#1| (|List| (|NonNegativeInteger|))))
                                T)
                              '((|joinIfCan|
                                 ((|Union| (|NonNegativeInteger|) "failed")
                                  |#1| (|List| (|NonNegativeInteger|))))
                                T)
                              '((|meetIfCan|
                                 ((|Union| (|NonNegativeInteger|) #1#) |#1|
                                  (|List| (|NonNegativeInteger|))))
                                T)
                              '((|joinIfCan|
                                 ((|Union| (|NonNegativeInteger|) "failed")
                                  |#1| (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|meetIfCan|
                                 ((|Union| (|NonNegativeInteger|) "failed")
                                  |#1| (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|implies|
                                 ((|Boolean|) |#1| (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|opposite| (|#1| |#1|)) T)
                              '((|addArrow| (|#1| |#1| |#2| |#2|)) T)
                              '((|addObject| (|#1| |#1| |#2|)) T)
                              '((|le| ((|Boolean|) |#1| |#2| |#2|)) T)
                              '((|mapContra|
                                 (|#1| |#1| (|List| (|NonNegativeInteger|))
                                  (|List| |#2|) (|Integer|) (|Integer|)))
                                T)
                              '((|map|
                                 (|#1| |#1| (|List| (|NonNegativeInteger|))
                                  (|List| |#2|) (|Integer|) (|Integer|)))
                                T)
                              '((|looseEquals| ((|Boolean|) |#1| |#1|)) T)
                              '((|createY|
                                 ((|NonNegativeInteger|) (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|createX|
                                 ((|NonNegativeInteger|) (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|createWidth|
                                 ((|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|isDirected?| ((|Boolean|))) T)
                              '((|merge| (|#1| |#1| |#1|)) T)
                              '((|distance|
                                 ((|Integer|) |#1| (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|routeArrows|
                                 ((|List| (|NonNegativeInteger|)) |#1|
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|routeNodes|
                                 ((|List| (|NonNegativeInteger|)) |#1|
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|arrowsToArrow|
                                 ((|List| (|NonNegativeInteger|)) |#1|
                                  (|NonNegativeInteger|)))
                                T)
                              '((|arrowsFromArrow|
                                 ((|List| (|NonNegativeInteger|)) |#1|
                                  (|NonNegativeInteger|)))
                                T)
                              '((|nodeToArrow|
                                 ((|List| (|NonNegativeInteger|)) |#1|
                                  (|NonNegativeInteger|)))
                                T)
                              '((|nodeFromArrow|
                                 ((|List| (|NonNegativeInteger|)) |#1|
                                  (|NonNegativeInteger|)))
                                T)
                              '((|arrowsToNode|
                                 ((|List| (|NonNegativeInteger|)) |#1|
                                  (|NonNegativeInteger|)))
                                T)
                              '((|arrowsFromNode|
                                 ((|List| (|NonNegativeInteger|)) |#1|
                                  (|NonNegativeInteger|)))
                                T)
                              '((|nodeToNode|
                                 ((|List| (|NonNegativeInteger|)) |#1|
                                  (|NonNegativeInteger|)))
                                T)
                              '((|nodeFromNode|
                                 ((|List| (|NonNegativeInteger|)) |#1|
                                  (|NonNegativeInteger|)))
                                T)
                              '((|outDegree|
                                 ((|NonNegativeInteger|) |#1|
                                  (|NonNegativeInteger|)))
                                T)
                              '((|inDegree|
                                 ((|NonNegativeInteger|) |#1|
                                  (|NonNegativeInteger|)))
                                T)
                              '((|getArrowIndex|
                                 ((|NonNegativeInteger|) |#1|
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|arrowName|
                                 ((|String|) |#1| (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|isFixPoint?|
                                 ((|Boolean|) |#1| (|NonNegativeInteger|)))
                                T)
                              '((|min|
                                 ((|NonNegativeInteger|) |#1|
                                  (|List| (|NonNegativeInteger|))))
                                T)
                              '((|min| ((|NonNegativeInteger|) |#1|)) T)
                              '((|max|
                                 ((|NonNegativeInteger|) |#1|
                                  (|List| (|NonNegativeInteger|))))
                                T)
                              '((|max| ((|NonNegativeInteger|) |#1|)) T)
                              '((|isGreaterThan?|
                                 ((|Boolean|) |#1| (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|isDirectSuccessor?|
                                 ((|Boolean|) |#1| (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|kgraph| (|#1| (|List| |#2|) (|String|))) T)
                              '((|unit| (|#1| (|List| |#2|) (|String|))) T)
                              '((|cycleClosed| (|#1| (|List| |#2|) (|String|)))
                                T)
                              '((|cycleOpen| (|#1| (|List| |#2|) (|String|)))
                                T)
                              '((|terminal| (|#1| |#2|)) T)
                              '((|initial| (|#1|)) T)
                              '((|flatten| (|#1| (|DirectedGraph| |#1|))) T)
                              '((|getArrows|
                                 ((|List|
                                   (|Record| (|:| |name| (|String|))
                                             (|:| |arrType|
                                                  (|NonNegativeInteger|))
                                             (|:| |fromOb|
                                                  (|NonNegativeInteger|))
                                             (|:| |toOb|
                                                  (|NonNegativeInteger|))
                                             (|:| |xOffset| (|Integer|))
                                             (|:| |yOffset| (|Integer|))
                                             (|:| |map|
                                                  (|List|
                                                   (|NonNegativeInteger|)))))
                                  |#1|))
                                T)
                              '((|getVertices|
                                 ((|List|
                                   (|Record| (|:| |value| |#2|)
                                             (|:| |posX|
                                                  (|NonNegativeInteger|))
                                             (|:| |posY|
                                                  (|NonNegativeInteger|))))
                                  |#1|))
                                T)
                              '((|addArrow!| (|#1| |#1| (|String|) |#2| |#2|))
                                T)
                              '((|addArrow!|
                                 (|#1| |#1| (|String|) (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)
                                  (|List| (|NonNegativeInteger|))))
                                T)
                              '((|addArrow!|
                                 (|#1| |#1| (|String|) (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|addArrow!|
                                 (|#1| |#1|
                                  (|Record| (|:| |name| (|String|))
                                            (|:| |arrType|
                                                 (|NonNegativeInteger|))
                                            (|:| |fromOb|
                                                 (|NonNegativeInteger|))
                                            (|:| |toOb| (|NonNegativeInteger|))
                                            (|:| |xOffset| (|Integer|))
                                            (|:| |yOffset| (|Integer|))
                                            (|:| |map|
                                                 (|List|
                                                  (|NonNegativeInteger|))))))
                                T)
                              '((|addObject!|
                                 (|#1| |#1|
                                  (|Record| (|:| |value| |#2|)
                                            (|:| |posX| (|NonNegativeInteger|))
                                            (|:| |posY|
                                                 (|NonNegativeInteger|)))))
                                T)
                              '((|addObject!| (|#1| |#1| |#2|)) T)
                              '((|coerce| ((|OutputForm|) |#1|)) T)
                              '((= ((|Boolean|) |#1| |#1|)) T)
                              '((~= ((|Boolean|) |#1| |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 149
                                            '(1 6 8 0 9 2 8 10 7 0 11 2 8 0 0 7
                                              12 1 6 13 0 14 2 15 0 0 10 16 2 6
                                              0 8 13 17 4 20 10 0 19 19 10 21 3
                                              20 10 0 19 19 22 2 6 23 0 7 24 2
                                              13 15 0 19 26 2 15 10 0 19 27 2 6
                                              0 0 7 29 4 6 0 0 32 23 23 34 2 35
                                              0 0 23 52 2 6 53 0 35 54 2 53 10
                                              0 0 55 2 6 53 0 35 58 2 35 0 0 0
                                              87 2 6 53 0 35 88 2 6 53 0 35 90
                                              1 35 23 0 94 1 35 0 0 95 3 6 10 0
                                              23 23 96 2 23 10 0 0 97 2 35 10
                                              23 0 98 2 35 0 23 0 99 2 8 7 0 19
                                              102 2 8 19 7 0 104 2 106 8 13 8
                                              107 1 8 0 0 108 1 110 0 109 111 2
                                              112 0 110 8 113 1 6 112 0 115 1
                                              112 110 0 116 2 117 110 110 19
                                              118 1 112 119 0 120 2 112 0 110
                                              119 121 2 110 0 23 23 123 3 110
                                              19 0 19 19 124 1 19 10 0 125 2
                                              127 10 126 0 128 4 110 19 0 19 19
                                              19 129 2 8 10 0 0 131 2 13 10 0 0
                                              132 2 6 10 0 0 134 0 136 0 137 1
                                              136 0 0 138 1 15 10 0 139 2 140 0
                                              0 136 141 1 136 0 142 143 1 136 0
                                              32 144 2 145 0 0 140 146 1 136 0
                                              147 148 2 0 10 0 0 135 1 0 112 0
                                              114 2 0 0 8 32 48 1 0 0 7 45 3 0
                                              35 0 23 23 74 3 0 35 0 23 23 75 2
                                              0 23 0 23 65 1 0 0 0 85 2 0 23 0
                                              7 105 2 0 35 0 23 67 2 0 35 0 23
                                              71 2 0 35 0 23 66 2 0 35 0 23 70
                                              1 0 112 0 122 2 0 23 0 35 60 1 0
                                              23 0 59 2 0 0 0 0 77 3 0 53 0 23
                                              23 91 2 0 53 0 35 92 2 0 23 0 35
                                              57 1 0 23 0 56 5 0 0 0 35 8 19 19
                                              84 5 0 0 0 35 8 19 19 83 2 0 53 0
                                              35 101 2 0 10 0 0 82 3 0 10 0 7 7
                                              28 2 0 0 8 32 49 3 0 53 0 23 23
                                              89 2 0 53 0 35 93 3 0 10 0 23 23
                                              51 2 0 10 0 23 61 0 0 10 78 3 0
                                              10 0 23 23 50 0 0 0 44 2 0 7 0 23
                                              103 2 0 23 0 23 64 3 0 10 0 23 23
                                              86 2 0 53 0 35 100 1 0 37 0 38 1
                                              0 40 0 41 3 0 23 0 23 23 63 1 0 0
                                              42 43 3 0 19 0 23 23 76 2 0 0 8
                                              32 46 2 0 0 8 32 47 2 0 23 23 23
                                              81 2 0 23 23 23 80 1 0 23 23 79 1
                                              0 112 0 130 1 0 136 0 149 2 0 35
                                              0 23 69 2 0 35 0 23 73 2 0 35 0
                                              23 68 2 0 35 0 23 72 3 0 32 0 23
                                              23 62 2 0 0 0 30 31 2 0 0 0 7 18
                                              5 0 0 0 32 23 23 35 36 4 0 0 0 32
                                              23 23 33 3 0 0 0 7 7 25 2 0 10 0
                                              0 133)))))
           '|lookupComplete|)) 
