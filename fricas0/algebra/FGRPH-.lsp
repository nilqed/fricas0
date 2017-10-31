
(SDEFUN |FGRPH-;getVertexIndex;ASNni;1|
        ((|s| A) (|o| S) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G767 NIL) (|i| NIL) (#2=#:G768 NIL) (|v| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |v| NIL . #3=(|FGRPH-;getVertexIndex;ASNni;1|))
                      (LETT #2# (SPADCALL |s| (QREFELT $ 10)) . #3#)
                      (LETT |i| 1 . #3#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (QVELT |v| 0) |o| (QREFELT $ 12))
                          (PROGN (LETT #1# |i| . #3#) (GO #4=#:G766))))))
                      (LETT |i|
                            (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #3#))
                            . #3#)
                      (GO G190) G191 (EXIT NIL)))
                #4# (EXIT #1#)))) 

(SDEFUN |FGRPH-;addArrow!;AS2SA;2|
        ((|s| A) (|aname| |String|) (|o1| S) (|o2| S) ($ A))
        (SPADCALL |s| |aname| (SPADCALL |s| |o1| (QREFELT $ 15))
                  (SPADCALL |s| |o2| (QREFELT $ 15)) (QREFELT $ 17))) 

(PUT '|FGRPH-;isDirected?;B;3| '|SPADreplace| '(XLAM NIL 'T)) 

(SDEFUN |FGRPH-;isDirected?;B;3| (($ |Boolean|)) 'T) 

(SDEFUN |FGRPH-;incidenceMatrix;AM;4| ((|s| A) ($ |Matrix| (|Integer|)))
        (SPROG
         ((#1=#:G782 NIL) (|ar| NIL) (|j| NIL) (|ss| (|Integer|))
          (|res| (|Matrix| (|Integer|)))
          (|al|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|vl|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |vl| (SPADCALL |s| (QREFELT $ 10))
                . #2=(|FGRPH-;incidenceMatrix;AM;4|))
          (LETT |al| (SPADCALL |s| (QREFELT $ 22)) . #2#)
          (LETT |res| (SPADCALL (LENGTH |vl|) (LENGTH |al|) (QREFELT $ 24))
                . #2#)
          (LETT |ss| (COND ((SPADCALL (QREFELT $ 25)) -1) ('T 1)) . #2#)
          (SEQ (LETT |j| 1 . #2#) (LETT |ar| NIL . #2#) (LETT #1# |al| . #2#)
               G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |ar| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (SPADCALL |res| (QVELT |ar| 2) |j| |ss| (QREFELT $ 27))
                    (EXIT
                     (SPADCALL |res| (QVELT |ar| 3) |j| 1 (QREFELT $ 27))))
               (LETT #1# (PROG1 (CDR #1#) (LETT |j| (|inc_SI| |j|) . #2#))
                     . #2#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |FGRPH-;adjacencyMatrix;AM;5|
        ((|s| A) ($ |Matrix| (|NonNegativeInteger|)))
        (SPROG
         ((|m| (|List| (|List| (|NonNegativeInteger|)))) (#1=#:G792 NIL)
          (|u| NIL) (#2=#:G791 NIL) (#3=#:G790 NIL) (|v| NIL) (#4=#:G789 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n| (LENGTH (SPADCALL |s| (QREFELT $ 10)))
                . #5=(|FGRPH-;adjacencyMatrix;AM;5|))
          (LETT |m|
                (PROGN
                 (LETT #4# NIL . #5#)
                 (SEQ (LETT |v| 1 . #5#) (LETT #3# |n| . #5#) G190
                      (COND ((|greater_SI| |v| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (PROGN
                                (LETT #2# NIL . #5#)
                                (SEQ (LETT |u| 1 . #5#) (LETT #1# |n| . #5#)
                                     G190
                                     (COND ((|greater_SI| |u| #1#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #2#
                                             (CONS
                                              (COND
                                               ((SPADCALL |s| |u| |v|
                                                          (QREFELT $ 29))
                                                1)
                                               ('T 0))
                                              #2#)
                                             . #5#)))
                                     (LETT |u| (|inc_SI| |u|) . #5#) (GO G190)
                                     G191 (EXIT (NREVERSE #2#))))
                               #4#)
                              . #5#)))
                      (LETT |v| (|inc_SI| |v|) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (EXIT (SPADCALL |m| (QREFELT $ 32)))))) 

(SDEFUN |FGRPH-;laplacianEntry|
        ((|s| A) (|i| |NonNegativeInteger|) (|j| |NonNegativeInteger|)
         ($ |Integer|))
        (SPROG ((#1=#:G796 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((EQL |i| |j|)
                    (PROGN
                     (LETT #1# (SPADCALL |s| |i| (QREFELT $ 34))
                           . #2=(|FGRPH-;laplacianEntry|))
                     (GO #3=#:G795))))
                  (COND
                   ((SPADCALL |s| |i| |j| (QREFELT $ 29))
                    (PROGN (LETT #1# -1 . #2#) (GO #3#))))
                  (EXIT 0)))
                #3# (EXIT #1#)))) 

(SDEFUN |FGRPH-;laplacianMatrix;AM;7| ((|s| A) ($ |Matrix| (|Integer|)))
        (SPROG
         ((|m| (|List| (|List| (|Integer|)))) (#1=#:G806 NIL) (|u| NIL)
          (#2=#:G805 NIL) (#3=#:G804 NIL) (|v| NIL) (#4=#:G803 NIL))
         (SEQ
          (LETT |m|
                (PROGN
                 (LETT #4# NIL . #5=(|FGRPH-;laplacianMatrix;AM;7|))
                 (SEQ (LETT |v| 1 . #5#)
                      (LETT #3# (LENGTH (SPADCALL |s| (QREFELT $ 10))) . #5#)
                      G190 (COND ((|greater_SI| |v| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (PROGN
                                (LETT #2# NIL . #5#)
                                (SEQ (LETT |u| 1 . #5#)
                                     (LETT #1#
                                           (LENGTH
                                            (SPADCALL |s| (QREFELT $ 10)))
                                           . #5#)
                                     G190
                                     (COND ((|greater_SI| |u| #1#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #2#
                                             (CONS
                                              (|FGRPH-;laplacianEntry| |s| |u|
                                               |v| $)
                                              #2#)
                                             . #5#)))
                                     (LETT |u| (|inc_SI| |u|) . #5#) (GO G190)
                                     G191 (EXIT (NREVERSE #2#))))
                               #4#)
                              . #5#)))
                      (LETT |v| (|inc_SI| |v|) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (EXIT (SPADCALL |m| (QREFELT $ 36)))))) 

(SDEFUN |FGRPH-;distanceMatrix;AM;8| ((|s| A) ($ |Matrix| (|Integer|)))
        (SPROG
         ((|m| (|List| (|List| (|Integer|)))) (#1=#:G816 NIL) (|u| NIL)
          (#2=#:G815 NIL) (#3=#:G814 NIL) (|v| NIL) (#4=#:G813 NIL))
         (SEQ
          (LETT |m|
                (PROGN
                 (LETT #4# NIL . #5=(|FGRPH-;distanceMatrix;AM;8|))
                 (SEQ (LETT |v| 1 . #5#)
                      (LETT #3# (LENGTH (SPADCALL |s| (QREFELT $ 10))) . #5#)
                      G190 (COND ((|greater_SI| |v| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (PROGN
                                (LETT #2# NIL . #5#)
                                (SEQ (LETT |u| 1 . #5#)
                                     (LETT #1#
                                           (LENGTH
                                            (SPADCALL |s| (QREFELT $ 10)))
                                           . #5#)
                                     G190
                                     (COND ((|greater_SI| |u| #1#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #2#
                                             (CONS
                                              (SPADCALL |s| |u| |v|
                                                        (QREFELT $ 38))
                                              #2#)
                                             . #5#)))
                                     (LETT |u| (|inc_SI| |u|) . #5#) (GO G190)
                                     G191 (EXIT (NREVERSE #2#))))
                               #4#)
                              . #5#)))
                      (LETT |v| (|inc_SI| |v|) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (EXIT (SPADCALL |m| (QREFELT $ 36)))))) 

(SDEFUN |FGRPH-;spanningTreeArrowRecursive|
        ((|s| A) (|i| |NonNegativeInteger|)
         (|visited| |Reference| (|List| (|NonNegativeInteger|)))
         ($ |Tree| (|Integer|)))
        (SPROG
         ((|ch| (|List| (|Tree| (|Integer|))))
          (|visited1| (|List| (|NonNegativeInteger|))) (#1=#:G831 NIL)
          (|x| NIL) (|aa| (|List| (|NonNegativeInteger|))))
         (SEQ
          (LETT |aa| (SPADCALL |s| |i| (QREFELT $ 41))
                . #2=(|FGRPH-;spanningTreeArrowRecursive|))
          (LETT |ch| NIL . #2#)
          (LETT |visited1| (SPADCALL |visited| (QREFELT $ 43)) . #2#)
          (SEQ (LETT |x| NIL . #2#) (LETT #1# |aa| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |x| |visited1| (QREFELT $ 44))
                   (LETT |ch|
                         (SPADCALL |ch| (SPADCALL (- |x|) (QREFELT $ 46))
                                   (QREFELT $ 48))
                         . #2#))
                  ('T
                   (SEQ
                    (LETT |visited1| (SPADCALL |visited1| |x| (QREFELT $ 49))
                          . #2#)
                    (SPADCALL |visited| |visited1| (QREFELT $ 50))
                    (EXIT
                     (LETT |ch|
                           (SPADCALL |ch|
                                     (|FGRPH-;spanningTreeArrowRecursive| |s|
                                      |x| |visited| $)
                                     (QREFELT $ 48))
                           . #2#)))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |i| |ch| (QREFELT $ 52)))))) 

(SDEFUN |FGRPH-;spanningTreeArrow;ANniT;10|
        ((|s| A) (|i| |NonNegativeInteger|) ($ |Tree| (|Integer|)))
        (|FGRPH-;spanningTreeArrowRecursive| |s| |i|
         (SPADCALL (LIST |i|) (QREFELT $ 53)) $)) 

(SDEFUN |FGRPH-;spanningForestArrow;AL;11|
        ((|s| A) ($ |List| (|Tree| (|Integer|))))
        (SPROG ((#1=#:G837 NIL) (|i| NIL) (#2=#:G836 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|FGRPH-;spanningForestArrow;AL;11|))
                 (SEQ (LETT |i| 1 . #3#)
                      (LETT #1# (LENGTH (SPADCALL |s| (QREFELT $ 22))) . #3#)
                      G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |s| |i| (QREFELT $ 55)) #2#)
                              . #3#)))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |FGRPH-;spanningTreeNodeRecursive|
        ((|s| A) (|i| |NonNegativeInteger|)
         (|visited| |Reference| (|List| (|NonNegativeInteger|)))
         ($ |Tree| (|Integer|)))
        (SPROG
         ((|ch| (|List| (|Tree| (|Integer|)))) (#1=#:G845 NIL) (|n| NIL)
          (#2=#:G846 NIL) (|flag| NIL)
          (|visited1| (|List| (|NonNegativeInteger|)))
          (|flags| (|List| (|Boolean|))) (#3=#:G844 NIL)
          (|oa| (|List| (|NonNegativeInteger|))))
         (SEQ
          (LETT |oa| (SPADCALL |s| |i| (QREFELT $ 57))
                . #4=(|FGRPH-;spanningTreeNodeRecursive|))
          (LETT |ch| NIL . #4#) (LETT |flags| NIL . #4#)
          (LETT |visited1| (SPADCALL |visited| (QREFELT $ 43)) . #4#)
          (SEQ (LETT |n| NIL . #4#) (LETT #3# |oa| . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |n| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |n| |visited1| (QREFELT $ 44))
                   (LETT |flags| (SPADCALL |flags| NIL (QREFELT $ 59)) . #4#))
                  ('T
                   (SEQ
                    (LETT |flags| (SPADCALL |flags| 'T (QREFELT $ 59)) . #4#)
                    (EXIT
                     (LETT |visited1| (SPADCALL |visited1| |n| (QREFELT $ 49))
                           . #4#)))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (SPADCALL |visited| |visited1| (QREFELT $ 50))
          (SEQ (LETT |flag| NIL . #4#) (LETT #2# |flags| . #4#)
               (LETT |n| NIL . #4#) (LETT #1# |oa| . #4#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#) . #4#) NIL)
                     (ATOM #2#) (PROGN (LETT |flag| (CAR #2#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  (|flag|
                   (LETT |ch|
                         (SPADCALL |ch|
                                   (|FGRPH-;spanningTreeNodeRecursive| |s| |n|
                                    |visited| $)
                                   (QREFELT $ 48))
                         . #4#)))))
               (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #4#)) . #4#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |i| |ch| (QREFELT $ 52)))))) 

(SDEFUN |FGRPH-;spanningTreeNode;ANniT;13|
        ((|s| A) (|i| |NonNegativeInteger|) ($ |Tree| (|Integer|)))
        (|FGRPH-;spanningTreeNodeRecursive| |s| |i|
         (SPADCALL (LIST |i|) (QREFELT $ 53)) $)) 

(SDEFUN |FGRPH-;spanningForestNode;AL;14|
        ((|s| A) ($ |List| (|Tree| (|Integer|))))
        (SPROG ((#1=#:G852 NIL) (|i| NIL) (#2=#:G851 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|FGRPH-;spanningForestNode;AL;14|))
                 (SEQ (LETT |i| 1 . #3#)
                      (LETT #1# (LENGTH (SPADCALL |s| (QREFELT $ 10))) . #3#)
                      G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |s| |i| (QREFELT $ 61)) #2#)
                              . #3#)))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |FGRPH-;loopsNodesRecursive|
        ((|t| |Tree| (|Integer|)) (|visited| |List| (|NonNegativeInteger|))
         ($ . #1=(|List| (|Loop|))))
        (SPROG
         ((|res| (|List| (|Loop|))) (|ll| #1#) (#2=#:G860 NIL) (#3=#:G866 NIL)
          (|x| NIL) (#4=#:G865 NIL) (#5=#:G857 NIL) (|afterIndex| (|Integer|))
          (|i| (|Integer|)) (|v2| (|NonNegativeInteger|)) (#6=#:G853 NIL)
          (|v| (|Integer|)) (|c| (|List| (|Tree| (|Integer|)))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |c| (SPADCALL |t| (QREFELT $ 63))
                  . #7=(|FGRPH-;loopsNodesRecursive|))
            (LETT |v| (SPADCALL |t| (QREFELT $ 64)) . #7#)
            (COND
             ((< |v| 0)
              (SEQ
               (LETT |v2|
                     (PROG1 (LETT #6# (- |v|) . #7#)
                       (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #6#))
                     . #7#)
               (LETT |i| (SPADCALL |v2| |visited| (QREFELT $ 65)) . #7#)
               (COND
                ((< |i| 1)
                 (PROGN
                  (LETT #4# (LIST (SPADCALL |visited| (QREFELT $ 67))) . #7#)
                  (GO #8=#:G864))))
               (LETT |afterIndex|
                     (- (+ (SPADCALL |visited| (QREFELT $ 68)) 1) |i|) . #7#)
               (COND
                ((< |afterIndex| 1)
                 (PROGN
                  (LETT #4# (LIST (SPADCALL |visited| (QREFELT $ 67))) . #7#)
                  (GO #8#))))
               (EXIT
                (PROGN
                 (LETT #4#
                       (LIST
                        (SPADCALL
                         (SPADCALL |visited|
                                   (PROG1 (LETT #5# |afterIndex| . #7#)
                                     (|check_subtype2| (>= #5# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #5#))
                                   (QREFELT $ 69))
                         (QREFELT $ 67)))
                       . #7#)
                 (GO #8#))))))
            (LETT |res| NIL . #7#)
            (SEQ (LETT |x| NIL . #7#) (LETT #3# |c| . #7#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #7#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |ll|
                        (|FGRPH-;loopsNodesRecursive| |x|
                         (SPADCALL |visited|
                                   (PROG1 (LETT #2# |v| . #7#)
                                     (|check_subtype2| (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #2#))
                                   (QREFELT $ 49))
                         $)
                        . #7#)
                  (EXIT
                   (LETT |res| (SPADCALL |res| |ll| (QREFELT $ 71)) . #7#)))
                 (LETT #3# (CDR #3#) . #7#) (GO G190) G191 (EXIT NIL))
            (EXIT |res|)))
          #8# (EXIT #4#)))) 

(SDEFUN |FGRPH-;loopsNodes;AL;16| ((|s| A) ($ |List| (|Loop|)))
        (SPROG
         ((|res| (|List| (|Loop|))) (#1=#:G870 NIL) (|x| NIL)
          (|sf| (|List| (|Tree| (|Integer|)))))
         (SEQ (LETT |res| NIL . #2=(|FGRPH-;loopsNodes;AL;16|))
              (LETT |sf| (SPADCALL |s| (QREFELT $ 72)) . #2#)
              (SEQ (LETT |x| NIL . #2#) (LETT #1# |sf| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (|FGRPH-;loopsNodesRecursive| |x| NIL $)
                                     (QREFELT $ 71))
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT $ 73)))))) 

(SDEFUN |FGRPH-;loopsAtNode;ANniL;17|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |List| (|Loop|)))
        (SPROG ((|st| (|Tree| (|Integer|))))
               (SEQ
                (LETT |st| (SPADCALL |s| |a| (QREFELT $ 61))
                      |FGRPH-;loopsAtNode;ANniL;17|)
                (EXIT
                 (SPADCALL (|FGRPH-;loopsNodesRecursive| |st| NIL $)
                           (QREFELT $ 73)))))) 

(SDEFUN |FGRPH-;loopsArrowsRecursive|
        ((|t| |Tree| (|Integer|)) (|visited| |List| (|NonNegativeInteger|))
         ($ . #1=(|List| (|Loop|))))
        (SPROG
         ((|res| (|List| (|Loop|))) (|ll| #1#) (#2=#:G878 NIL) (#3=#:G884 NIL)
          (|x| NIL) (#4=#:G883 NIL) (#5=#:G875 NIL) (|afterIndex| (|Integer|))
          (|i| (|Integer|)) (|v2| (|NonNegativeInteger|)) (#6=#:G873 NIL)
          (|v| (|Integer|)) (|c| (|List| (|Tree| (|Integer|)))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |c| (SPADCALL |t| (QREFELT $ 63))
                  . #7=(|FGRPH-;loopsArrowsRecursive|))
            (LETT |v| (SPADCALL |t| (QREFELT $ 64)) . #7#)
            (COND
             ((< |v| 0)
              (SEQ
               (LETT |v2|
                     (PROG1 (LETT #6# (- |v|) . #7#)
                       (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #6#))
                     . #7#)
               (LETT |i| (SPADCALL |v2| |visited| (QREFELT $ 65)) . #7#)
               (COND
                ((< |i| 1)
                 (PROGN
                  (LETT #4# (LIST (SPADCALL |visited| (QREFELT $ 67))) . #7#)
                  (GO #8=#:G882))))
               (LETT |afterIndex|
                     (- (+ (SPADCALL |visited| (QREFELT $ 68)) 1) |i|) . #7#)
               (COND
                ((< |afterIndex| 1)
                 (PROGN
                  (LETT #4# (LIST (SPADCALL |visited| (QREFELT $ 67))) . #7#)
                  (GO #8#))))
               (EXIT
                (PROGN
                 (LETT #4#
                       (LIST
                        (SPADCALL
                         (SPADCALL |visited|
                                   (PROG1 (LETT #5# |afterIndex| . #7#)
                                     (|check_subtype2| (>= #5# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #5#))
                                   (QREFELT $ 69))
                         (QREFELT $ 67)))
                       . #7#)
                 (GO #8#))))))
            (LETT |res| NIL . #7#)
            (SEQ (LETT |x| NIL . #7#) (LETT #3# |c| . #7#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #7#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |ll|
                        (|FGRPH-;loopsArrowsRecursive| |x|
                         (SPADCALL |visited|
                                   (PROG1 (LETT #2# |v| . #7#)
                                     (|check_subtype2| (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #2#))
                                   (QREFELT $ 49))
                         $)
                        . #7#)
                  (EXIT
                   (LETT |res| (SPADCALL |res| |ll| (QREFELT $ 71)) . #7#)))
                 (LETT #3# (CDR #3#) . #7#) (GO G190) G191 (EXIT NIL))
            (EXIT |res|)))
          #8# (EXIT #4#)))) 

(SDEFUN |FGRPH-;loopsArrows;AL;19| ((|s| A) ($ |List| (|Loop|)))
        (SPROG
         ((|res| (|List| (|Loop|))) (#1=#:G888 NIL) (|x| NIL)
          (|sf| (|List| (|Tree| (|Integer|)))))
         (SEQ (LETT |res| NIL . #2=(|FGRPH-;loopsArrows;AL;19|))
              (LETT |sf| (SPADCALL |s| (QREFELT $ 76)) . #2#)
              (SEQ (LETT |x| NIL . #2#) (LETT #1# |sf| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (|FGRPH-;loopsArrowsRecursive| |x| NIL $)
                                     (QREFELT $ 71))
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT $ 73)))))) 

(SDEFUN |FGRPH-;isAcyclic?;AB;20| ((|s| A) ($ |Boolean|))
        (SPADCALL (SPADCALL |s| (QREFELT $ 78)) NIL (QREFELT $ 79))) 

(SDEFUN |FGRPH-;isDirectSuccessor?;A2NniB;21|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |Boolean|))
        (SPROG ((#1=#:G895 NIL) (#2=#:G896 NIL) (|arr| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |arr| NIL
                         . #3=(|FGRPH-;isDirectSuccessor?;A2NniB;21|))
                   (LETT #2# (SPADCALL |s| (QREFELT $ 22)) . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |arr| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL (QVELT |arr| 2) |a|)
                       (COND
                        ((EQL (QVELT |arr| 3) |b|)
                         (PROGN (LETT #1# 'T . #3#) (GO #4=#:G894))))))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #4# (EXIT #1#)))) 

(SDEFUN |FGRPH-;isFixPoint?;ANniB;22|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |Boolean|))
        (SPROG ((#1=#:G902 NIL) (#2=#:G903 NIL) (|arr| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |arr| NIL . #3=(|FGRPH-;isFixPoint?;ANniB;22|))
                       (LETT #2# (SPADCALL |s| (QREFELT $ 22)) . #3#) G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |arr| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((EQL (QVELT |arr| 2) |a|)
                           (COND
                            ((EQL (QVELT |arr| 3) |a|)
                             (PROGN (LETT #1# 'T . #3#) (GO #4=#:G901))))))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #4# (EXIT #1#)))) 

(SDEFUN |FGRPH-;getArrowIndex;A3Nni;23|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G910 NIL) (#2=#:G911 NIL) (|arrn| NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |arrs| (SPADCALL |s| (QREFELT $ 22))
                  . #3=(|FGRPH-;getArrowIndex;A3Nni;23|))
            (SEQ (LETT |arrn| 1 . #3#) (LETT #2# (LENGTH |arrs|) . #3#) G190
                 (COND ((|greater_SI| |arrn| #2#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((EQL (QVELT (SPADCALL |arrs| |arrn| (QREFELT $ 83)) 2)
                          |a|)
                     (COND
                      ((EQL (QVELT (SPADCALL |arrs| |arrn| (QREFELT $ 83)) 3)
                            |b|)
                       (PROGN (LETT #1# |arrn| . #3#) (GO #4=#:G909))))))))
                 (LETT |arrn| (|inc_SI| |arrn|) . #3#) (GO G190) G191
                 (EXIT NIL))
            (EXIT 0)))
          #4# (EXIT #1#)))) 

(SDEFUN |FGRPH-;arrowName;A2NniS;24|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |String|))
        (SPROG ((#1=#:G917 NIL) (#2=#:G918 NIL) (|arr| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |arr| NIL . #3=(|FGRPH-;arrowName;A2NniS;24|))
                       (LETT #2# (SPADCALL |s| (QREFELT $ 22)) . #3#) G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |arr| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((EQL (QVELT |arr| 2) |a|)
                           (COND
                            ((EQL (QVELT |arr| 3) |b|)
                             (PROGN
                              (LETT #1# (QVELT |arr| 0) . #3#)
                              (GO #4=#:G916))))))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT "?")))
                #4# (EXIT #1#)))) 

(SDEFUN |FGRPH-;inDegree;A2Nni;25|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG ((|count| (|NonNegativeInteger|)) (#1=#:G923 NIL) (|arr| NIL))
               (SEQ (LETT |count| 0 . #2=(|FGRPH-;inDegree;A2Nni;25|))
                    (SEQ (LETT |arr| NIL . #2#)
                         (LETT #1# (SPADCALL |s| (QREFELT $ 22)) . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |arr| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((EQL (QVELT |arr| 3) |a|)
                             (LETT |count| (+ |count| 1) . #2#)))))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT |count|)))) 

(SDEFUN |FGRPH-;outDegree;A2Nni;26|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG ((|count| (|NonNegativeInteger|)) (#1=#:G928 NIL) (|arr| NIL))
               (SEQ (LETT |count| 0 . #2=(|FGRPH-;outDegree;A2Nni;26|))
                    (SEQ (LETT |arr| NIL . #2#)
                         (LETT #1# (SPADCALL |s| (QREFELT $ 22)) . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |arr| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((EQL (QVELT |arr| 2) |a|)
                             (LETT |count| (+ |count| 1) . #2#)))))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT |count|)))) 

(SDEFUN |FGRPH-;nodeFromNode;ANniL;27|
        ((|s| A) (|v| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|i| (|List| (|NonNegativeInteger|))) (#1=#:G933 NIL) (|arr| NIL))
         (SEQ (LETT |i| NIL . #2=(|FGRPH-;nodeFromNode;ANniL;27|))
              (SEQ (LETT |arr| NIL . #2#)
                   (LETT #1# (SPADCALL |s| (QREFELT $ 22)) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |arr| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL (QVELT |arr| 3) |v|)
                       (LETT |i| (SPADCALL |i| (QVELT |arr| 2) (QREFELT $ 49))
                             . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |i|)))) 

(SDEFUN |FGRPH-;nodeToNode;ANniL;28|
        ((|s| A) (|v| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|i| (|List| (|NonNegativeInteger|))) (#1=#:G938 NIL) (|arr| NIL))
         (SEQ (LETT |i| NIL . #2=(|FGRPH-;nodeToNode;ANniL;28|))
              (SEQ (LETT |arr| NIL . #2#)
                   (LETT #1# (SPADCALL |s| (QREFELT $ 22)) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |arr| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL (QVELT |arr| 2) |v|)
                       (LETT |i| (SPADCALL |i| (QVELT |arr| 3) (QREFELT $ 49))
                             . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |i|)))) 

(SDEFUN |FGRPH-;arrowsFromNode;ANniL;29|
        ((|s| A) (|v| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|i| (|List| (|NonNegativeInteger|))) (#1=#:G944 NIL) (|arrn| NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ (LETT |i| NIL . #2=(|FGRPH-;arrowsFromNode;ANniL;29|))
              (LETT |arrs| (SPADCALL |s| (QREFELT $ 22)) . #2#)
              (SEQ (LETT |arrn| 1 . #2#) (LETT #1# (LENGTH |arrs|) . #2#) G190
                   (COND ((|greater_SI| |arrn| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL (QVELT (SPADCALL |arrs| |arrn| (QREFELT $ 83)) 3)
                            |v|)
                       (LETT |i| (SPADCALL |i| |arrn| (QREFELT $ 49))
                             . #2#)))))
                   (LETT |arrn| (|inc_SI| |arrn|) . #2#) (GO G190) G191
                   (EXIT NIL))
              (EXIT |i|)))) 

(SDEFUN |FGRPH-;arrowsToNode;ANniL;30|
        ((|s| A) (|v| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|i| (|List| (|NonNegativeInteger|))) (#1=#:G950 NIL) (|arrn| NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ (LETT |i| NIL . #2=(|FGRPH-;arrowsToNode;ANniL;30|))
              (LETT |arrs| (SPADCALL |s| (QREFELT $ 22)) . #2#)
              (SEQ (LETT |arrn| 1 . #2#) (LETT #1# (LENGTH |arrs|) . #2#) G190
                   (COND ((|greater_SI| |arrn| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL (QVELT (SPADCALL |arrs| |arrn| (QREFELT $ 83)) 2)
                            |v|)
                       (LETT |i| (SPADCALL |i| |arrn| (QREFELT $ 49))
                             . #2#)))))
                   (LETT |arrn| (|inc_SI| |arrn|) . #2#) (GO G190) G191
                   (EXIT NIL))
              (EXIT |i|)))) 

(SDEFUN |FGRPH-;nodeFromArrow;ANniL;31|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ
          (LETT |arrs| (SPADCALL |s| (QREFELT $ 22))
                |FGRPH-;nodeFromArrow;ANniL;31|)
          (EXIT (LIST (QVELT (SPADCALL |arrs| |a| (QREFELT $ 83)) 3)))))) 

(SDEFUN |FGRPH-;nodeToArrow;ANniL;32|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ
          (LETT |arrs| (SPADCALL |s| (QREFELT $ 22))
                |FGRPH-;nodeToArrow;ANniL;32|)
          (EXIT (LIST (QVELT (SPADCALL |arrs| |a| (QREFELT $ 83)) 2)))))) 

(SDEFUN |FGRPH-;arrowsFromArrow;ANniL;33|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|i| (|List| (|NonNegativeInteger|))) (#1=#:G960 NIL) (|arrn| NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ (LETT |i| NIL . #2=(|FGRPH-;arrowsFromArrow;ANniL;33|))
              (LETT |arrs| (SPADCALL |s| (QREFELT $ 22)) . #2#)
              (SEQ (LETT |arrn| 1 . #2#) (LETT #1# (LENGTH |arrs|) . #2#) G190
                   (COND ((|greater_SI| |arrn| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL (QVELT (SPADCALL |arrs| |arrn| (QREFELT $ 83)) 3)
                            (QVELT (SPADCALL |arrs| |a| (QREFELT $ 83)) 2))
                       (LETT |i| (SPADCALL |i| |arrn| (QREFELT $ 49))
                             . #2#)))))
                   (LETT |arrn| (|inc_SI| |arrn|) . #2#) (GO G190) G191
                   (EXIT NIL))
              (EXIT |i|)))) 

(SDEFUN |FGRPH-;arrowsToArrow;ANniL;34|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|i| (|List| (|NonNegativeInteger|))) (#1=#:G966 NIL) (|arrn| NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ (LETT |i| NIL . #2=(|FGRPH-;arrowsToArrow;ANniL;34|))
              (LETT |arrs| (SPADCALL |s| (QREFELT $ 22)) . #2#)
              (SEQ (LETT |arrn| 1 . #2#) (LETT #1# (LENGTH |arrs|) . #2#) G190
                   (COND ((|greater_SI| |arrn| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL (QVELT (SPADCALL |arrs| |arrn| (QREFELT $ 83)) 2)
                            (QVELT (SPADCALL |arrs| |a| (QREFELT $ 83)) 3))
                       (LETT |i| (SPADCALL |i| |arrn| (QREFELT $ 49))
                             . #2#)))))
                   (LETT |arrn| (|inc_SI| |arrn|) . #2#) (GO G190) G191
                   (EXIT NIL))
              (EXIT |i|)))) 

(SDEFUN |FGRPH-;routeNodeRecursive|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         (|visited| |List| (|NonNegativeInteger|))
         ($ . #1=(|List| (|NonNegativeInteger|))))
        (SPROG
         ((#2=#:G977 NIL) (|shortest| (|List| (|NonNegativeInteger|)))
          (|d| #1#) (#3=#:G978 NIL) (|arr| NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (SPADCALL |visited| (QREFELT $ 68))
                        (LENGTH (SPADCALL |s| (QREFELT $ 10))) (QREFELT $ 96))
              (PROGN
               (LETT #2# NIL . #4=(|FGRPH-;routeNodeRecursive|))
               (GO #5=#:G976))))
            (LETT |shortest| NIL . #4#)
            (COND ((EQL |a| |b|) (PROGN (LETT #2# (LIST |a|) . #4#) (GO #5#))))
            (COND
             ((SPADCALL |s| |a| |b| (QREFELT $ 29))
              (PROGN (LETT #2# (LIST |a| |b|) . #4#) (GO #5#))))
            (SEQ (LETT |arr| NIL . #4#)
                 (LETT #3# (SPADCALL |s| (QREFELT $ 22)) . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |arr| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |s| |a| (QVELT |arr| 2) (QREFELT $ 29))
                     (SEQ
                      (LETT |d|
                            (|FGRPH-;routeNodeRecursive| |s| (QVELT |arr| 2)
                             |b| (SPADCALL |visited| |a| (QREFELT $ 49)) $)
                            . #4#)
                      (EXIT
                       (COND
                        ((SPADCALL |shortest| NIL (QREFELT $ 97))
                         (LETT |shortest| |d| . #4#))
                        ((SPADCALL |d| NIL (QREFELT $ 98))
                         (COND
                          ((< (SPADCALL |d| (QREFELT $ 68))
                              (SPADCALL |shortest| (QREFELT $ 68)))
                           (LETT |shortest| |d| . #4#)))))))))))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (COND
             ((SPADCALL |shortest| NIL (QREFELT $ 97))
              (PROGN (LETT #2# NIL . #4#) (GO #5#))))
            (EXIT (CONS |a| |shortest|))))
          #5# (EXIT #2#)))) 

(SDEFUN |FGRPH-;routeNodes;A2NniL;36|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |List| (|NonNegativeInteger|)))
        (|FGRPH-;routeNodeRecursive| |s| |a| |b| NIL $)) 

(SDEFUN |FGRPH-;routeArrowRecursive|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         (|visited| |List| (|NonNegativeInteger|))
         ($ . #1=(|List| (|NonNegativeInteger|))))
        (SPROG
         ((#2=#:G993 NIL)
          (|shortestFullPath| (|List| #3=(|NonNegativeInteger|)))
          (|shortest| (|List| #3#))
          (|fullPath| (|List| (|NonNegativeInteger|))) (|d| #1#) (|aa| #3#)
          (#4=#:G994 NIL) (|arr| NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arrn| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (SPADCALL |visited| (QREFELT $ 68))
                        (LENGTH (SPADCALL |s| (QREFELT $ 10))) (QREFELT $ 96))
              (PROGN
               (LETT #2# (LIST 0) . #5=(|FGRPH-;routeArrowRecursive|))
               (GO #6=#:G992))))
            (LETT |shortest| (LIST 0) . #5#)
            (COND ((EQL |a| |b|) (PROGN (LETT #2# NIL . #5#) (GO #6#))))
            (LETT |arrn| (SPADCALL |s| |a| |b| (QREFELT $ 100)) . #5#)
            (COND
             ((SPADCALL |arrn| 0 (QREFELT $ 101))
              (PROGN (LETT #2# (LIST |arrn|) . #5#) (GO #6#))))
            (LETT |aa| 0 . #5#) (LETT |shortestFullPath| (LIST 0) . #5#)
            (LETT |arrs| (SPADCALL |s| (QREFELT $ 22)) . #5#)
            (SEQ (LETT |arr| NIL . #5#) (LETT #4# |arrs| . #5#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |arr| (CAR #4#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |s| |a| (QVELT |arr| 2) (QREFELT $ 29))
                     (SEQ
                      (LETT |aa|
                            (SPADCALL |s| |a| (QVELT |arr| 2) (QREFELT $ 100))
                            . #5#)
                      (LETT |d|
                            (|FGRPH-;routeArrowRecursive| |s| (QVELT |arr| 2)
                             |b| (SPADCALL |visited| |a| (QREFELT $ 49)) $)
                            . #5#)
                      (LETT |fullPath| (CONS |aa| |d|) . #5#)
                      (EXIT
                       (COND
                        ((SPADCALL |shortest| (LIST 0) (QREFELT $ 97))
                         (SEQ (LETT |shortest| |d| . #5#)
                              (EXIT
                               (LETT |shortestFullPath| |fullPath| . #5#))))
                        ((SPADCALL |d| (LIST 0) (QREFELT $ 98))
                         (COND
                          ((< (SPADCALL |fullPath| (QREFELT $ 68))
                              (SPADCALL |shortestFullPath| (QREFELT $ 68)))
                           (SEQ (LETT |shortest| |d| . #5#)
                                (EXIT
                                 (LETT |shortestFullPath| |fullPath|
                                       . #5#)))))))))))))
                 (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
            (COND
             ((SPADCALL |shortest| (LIST 0) (QREFELT $ 97))
              (PROGN (LETT #2# (LIST 0) . #5#) (GO #6#))))
            (EXIT |shortestFullPath|)))
          #6# (EXIT #2#)))) 

(SDEFUN |FGRPH-;routeArrows;A2NniL;38|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |List| (|NonNegativeInteger|)))
        (|FGRPH-;routeArrowRecursive| |s| |a| |b| NIL $)) 

(SDEFUN |FGRPH-;isGreaterThan?;A2NniB;39|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |Boolean|))
        (SPROG ((#1=#:G1000 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL (|FGRPH-;routeNodeRecursive| |s| |a| |b| NIL $)
                              NIL (QREFELT $ 97))
                    (PROGN
                     (LETT #1# NIL . #2=(|FGRPH-;isGreaterThan?;A2NniB;39|))
                     (GO #3=#:G999))))
                  (COND
                   ((SPADCALL (|FGRPH-;routeNodeRecursive| |s| |b| |a| NIL $)
                              NIL (QREFELT $ 98))
                    (PROGN (LETT #1# NIL . #2#) (GO #3#))))
                  (EXIT 'T)))
                #3# (EXIT #1#)))) 

(SDEFUN |FGRPH-;max;ANni;40| ((|s| A) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G1010 NIL) (|fail| (|Boolean|)) (#2=#:G1012 NIL) (|j| NIL)
          (#3=#:G1011 NIL) (|i| NIL)
          (|ls|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ls| (SPADCALL |s| (QREFELT $ 10))
                  . #4=(|FGRPH-;max;ANni;40|))
            (SEQ (LETT |i| 1 . #4#) (LETT #3# (LENGTH |ls|) . #4#) G190
                 (COND ((|greater_SI| |i| #3#) (GO G191)))
                 (SEQ (LETT |fail| NIL . #4#)
                      (SEQ (LETT |j| 1 . #4#) (LETT #2# (LENGTH |ls|) . #4#)
                           G190 (COND ((|greater_SI| |j| #2#) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |i| |j| (QREFELT $ 101))
                               (COND
                                ((NULL (SPADCALL |s| |j| |i| (QREFELT $ 104)))
                                 (LETT |fail| 'T . #4#)))))))
                           (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (COND
                        ((NULL |fail|)
                         (PROGN (LETT #1# |i| . #4#) (GO #5=#:G1009))))))
                 (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT 0)))
          #5# (EXIT #1#)))) 

(SDEFUN |FGRPH-;max;ALNni;41|
        ((|s| A) (|sub| |List| (|NonNegativeInteger|))
         ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G1020 NIL) (|fail| (|Boolean|)) (#2=#:G1022 NIL) (|j| NIL)
          (#3=#:G1021 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| NIL . #4=(|FGRPH-;max;ALNni;41|))
                 (LETT #3# |sub| . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ (LETT |fail| NIL . #4#)
                      (SEQ (LETT |j| NIL . #4#) (LETT #2# |sub| . #4#) G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |j| (CAR #2#) . #4#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |i| |j| (QREFELT $ 101))
                               (COND
                                ((NULL (SPADCALL |s| |j| |i| (QREFELT $ 104)))
                                 (LETT |fail| 'T . #4#)))))))
                           (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (COND
                        ((NULL |fail|)
                         (PROGN (LETT #1# |i| . #4#) (GO #5=#:G1019))))))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT 0)))
          #5# (EXIT #1#)))) 

(SDEFUN |FGRPH-;min;ANni;42| ((|s| A) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G1032 NIL) (|fail| (|Boolean|)) (#2=#:G1034 NIL) (|j| NIL)
          (#3=#:G1033 NIL) (|i| NIL)
          (|ls|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ls| (SPADCALL |s| (QREFELT $ 10))
                  . #4=(|FGRPH-;min;ANni;42|))
            (SEQ (LETT |i| 1 . #4#) (LETT #3# (LENGTH |ls|) . #4#) G190
                 (COND ((|greater_SI| |i| #3#) (GO G191)))
                 (SEQ (LETT |fail| NIL . #4#)
                      (SEQ (LETT |j| 1 . #4#) (LETT #2# (LENGTH |ls|) . #4#)
                           G190 (COND ((|greater_SI| |j| #2#) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |i| |j| (QREFELT $ 101))
                               (COND
                                ((NULL (SPADCALL |s| |i| |j| (QREFELT $ 104)))
                                 (LETT |fail| 'T . #4#)))))))
                           (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (COND
                        ((NULL |fail|)
                         (PROGN (LETT #1# |i| . #4#) (GO #5=#:G1031))))))
                 (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT 0)))
          #5# (EXIT #1#)))) 

(SDEFUN |FGRPH-;min;ALNni;43|
        ((|s| A) (|sub| |List| (|NonNegativeInteger|))
         ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G1042 NIL) (|fail| (|Boolean|)) (#2=#:G1044 NIL) (|j| NIL)
          (#3=#:G1043 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| NIL . #4=(|FGRPH-;min;ALNni;43|))
                 (LETT #3# |sub| . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ (LETT |fail| NIL . #4#)
                      (SEQ (LETT |j| NIL . #4#) (LETT #2# |sub| . #4#) G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |j| (CAR #2#) . #4#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |i| |j| (QREFELT $ 101))
                               (COND
                                ((NULL (SPADCALL |s| |i| |j| (QREFELT $ 104)))
                                 (LETT |fail| 'T . #4#)))))))
                           (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (COND
                        ((NULL |fail|)
                         (PROGN (LETT #1# |i| . #4#) (GO #5=#:G1041))))))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT 0)))
          #5# (EXIT #1#)))) 

(SDEFUN |FGRPH-;distance;A2NniI;44|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |Integer|))
        (-
         (SPADCALL (|FGRPH-;routeNodeRecursive| |s| |a| |b| NIL $)
                   (QREFELT $ 68))
         1)) 

(SDEFUN |FGRPH-;isFunctional?;AB;45| ((|s| A) ($ |Boolean|))
        (SPROG
         ((#1=#:G1052 NIL) (#2=#:G1056 NIL) (|x| NIL)
          (|fromI| (|NonNegativeInteger|)) (#3=#:G1055 NIL) (|arr| NIL)
          (|counts| (|List| (|NonNegativeInteger|))) (#4=#:G1054 NIL)
          (#5=#:G1053 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |counts|
                  (PROGN
                   (LETT #5# NIL . #6=(|FGRPH-;isFunctional?;AB;45|))
                   (SEQ (LETT |x| NIL . #6#)
                        (LETT #4# (SPADCALL |s| (QREFELT $ 10)) . #6#) G190
                        (COND
                         ((OR (ATOM #4#)
                              (PROGN (LETT |x| (CAR #4#) . #6#) NIL))
                          (GO G191)))
                        (SEQ (EXIT (LETT #5# (CONS 0 #5#) . #6#)))
                        (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                        (EXIT (NREVERSE #5#))))
                  . #6#)
            (SEQ (LETT |arr| NIL . #6#)
                 (LETT #3# (SPADCALL |s| (QREFELT $ 22)) . #6#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |arr| (CAR #3#) . #6#) NIL))
                   (GO G191)))
                 (SEQ (LETT |fromI| (QVELT |arr| 2) . #6#)
                      (EXIT
                       (SPADCALL |counts| |fromI|
                                 (+ (SPADCALL |counts| |fromI| (QREFELT $ 110))
                                    1)
                                 (QREFELT $ 111))))
                 (LETT #3# (CDR #3#) . #6#) (GO G190) G191 (EXIT NIL))
            (SEQ (LETT |x| NIL . #6#) (LETT #2# |counts| . #6#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #6#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((NULL (EQL |x| 1))
                     (PROGN (LETT #1# NIL . #6#) (GO #7=#:G1051))))))
                 (LETT #2# (CDR #2#) . #6#) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #7# (EXIT #1#)))) 

(SDEFUN |FGRPH-;createWidth;2Nni;46|
        ((|x| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G1061 NIL) (|w| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |w| 1 . #2=(|FGRPH-;createWidth;2Nni;46|)) G190
                       (COND ((|greater_SI| |w| 100) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((>= (* |w| |w|) |x|)
                           (PROGN (LETT #1# |w| . #2#) (GO #3=#:G1060))))))
                       (LETT |w| (|inc_SI| |w|) . #2#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT 100)))
                #3# (EXIT #1#)))) 

(SDEFUN |FGRPH-;createX;3Nni;47|
        ((|x| |NonNegativeInteger|) (|n| |NonNegativeInteger|)
         ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G1069 NIL) (#2=#:G1063 NIL)
          (|d|
           (|Record| (|:| |quotient| (|NonNegativeInteger|))
                     (|:| |remainder| (|NonNegativeInteger|))))
          (|r| (|Union| (|NonNegativeInteger|) #3="failed"))
          (|w| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |w| (SPADCALL |x| (QREFELT $ 114))
                  . #4=(|FGRPH-;createX;3Nni;47|))
            (LETT |r| (SPADCALL |n| 1 (QREFELT $ 116)) . #4#)
            (LETT |d|
                  (DIVIDE2
                   (PROG2 (LETT #2# |r| . #4#)
                       (QCDR #2#)
                     (|check_union2| (QEQCAR #2# 0) (|NonNegativeInteger|)
                                     (|Union| (|NonNegativeInteger|) #3#) #2#))
                   |w|)
                  . #4#)
            (COND
             ((ODDP (QCAR |d|))
              (PROGN
               (LETT #1#
                     (*
                      (PROG2
                          (LETT #2# (SPADCALL |w| (QCDR |d|) (QREFELT $ 116))
                                . #4#)
                          (QCDR #2#)
                        (|check_union2| (QEQCAR #2# 0) (|NonNegativeInteger|)
                                        (|Union| (|NonNegativeInteger|) #3#)
                                        #2#))
                      2)
                     . #4#)
               (GO #5=#:G1068))))
            (EXIT (* (+ (QCDR |d|) 1) 2))))
          #5# (EXIT #1#)))) 

(SDEFUN |FGRPH-;createY;3Nni;48|
        ((|x| |NonNegativeInteger|) (|n| |NonNegativeInteger|)
         ($ |NonNegativeInteger|))
        (SPROG
         ((|d|
           (|Record| (|:| |quotient| (|NonNegativeInteger|))
                     (|:| |remainder| (|NonNegativeInteger|))))
          (#1=#:G1071 NIL) (|r| (|Union| (|NonNegativeInteger|) #2="failed"))
          (|w| (|NonNegativeInteger|)))
         (SEQ
          (LETT |w| (SPADCALL |x| (QREFELT $ 114))
                . #3=(|FGRPH-;createY;3Nni;48|))
          (LETT |r| (SPADCALL |n| 1 (QREFELT $ 116)) . #3#)
          (LETT |d|
                (DIVIDE2
                 (PROG2 (LETT #1# |r| . #3#)
                     (QCDR #1#)
                   (|check_union2| (QEQCAR #1# 0) (|NonNegativeInteger|)
                                   (|Union| (|NonNegativeInteger|) #2#) #1#))
                 |w|)
                . #3#)
          (EXIT (* (+ (QCAR |d|) 1) 2))))) 

(SDEFUN |FGRPH-;subdiagramSvg;SA2BV;49|
        ((|sc| |Scene| (|SCartesian| 2)) (|n| A) (|dispArrowName| |Boolean|)
         (|deep| |Boolean|) ($ |Void|))
        (SPROG
         ((#1=#:G1109 NIL) (|s| (|String|))
          (|arrNode| (|Scene| (|SCartesian| 2))) (|offset| (|SCartesian| 2))
          (|tnode| #2=(|Scene| (|SCartesian| 2))) (|fnode| #2#)
          (|subArrNode| (|Scene| (|SCartesian| 2)))
          (|subToY| #3=(|DoubleFloat|)) (|subFromY| #3#) (|subToX| #3#)
          (|subFromX| #3#)
          (|innerObTo|
           #4=(|Record| (|:| |value| (|DirectedGraph| (|String|)))
                        (|:| |posX| (|NonNegativeInteger|))
                        (|:| |posY| (|NonNegativeInteger|))))
          (|innerObFrom| #4#) (#5=#:G1114 NIL) (|subArrow| NIL)
          (#6=#:G1115 NIL) (|subArrowN| NIL)
          (|mp| (|List| (|NonNegativeInteger|)))
          (|mt| #7=(|Scene| (|SCartesian| 2))) (|rema| (|Integer|))
          (|arrNumber| (|Integer|))
          (|arrIndex| (|List| (|NonNegativeInteger|)))
          (|midY| #8=(|NonNegativeInteger|)) (|midX| #8#)
          (|toY| #9=(|NonNegativeInteger|)) (#10=#:G1095 NIL) (|fromY| #9#)
          (#11=#:G1094 NIL) (|toX| #9#) (#12=#:G1093 NIL) (|fromX| #9#)
          (#13=#:G1092 NIL) (#14=#:G1112 NIL) (|arrow| NIL) (#15=#:G1113 NIL)
          (|arrn| NIL)
          (|innerOb|
           (|List|
            (|List|
             (|Record| (|:| |value| (|DirectedGraph| (|String|)))
                       (|:| |posX| (|NonNegativeInteger|))
                       (|:| |posY| (|NonNegativeInteger|))))))
          (|innerObs|
           (|List|
            (|Record| (|:| |value| (|DirectedGraph| (|String|)))
                      (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|subNd| (|DirectedGraph| (|String|))) (#16=#:G1111 NIL) (|nd| NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|indexBounds| (|List| (|Scene| (|SCartesian| 2))))
          (|tn| (|Scene| (|SCartesian| 2)))
          (|ellip| (|Scene| (|SCartesian| 2)))
          (|sh|
           (|Record| (|:| |shptype| (|Symbol|)) (|:| |centre| (|SCartesian| 2))
                     (|:| |size| (|SCartesian| 2)) (|:| |fill| (|Boolean|))))
          (|subgraph| (|DirectedGraph| (|String|)))
          (|indexPointy| (|List| (|NonNegativeInteger|)))
          (|indexPointx| (|List| (|NonNegativeInteger|)))
          (|y| (|NonNegativeInteger|)) (|x| (|NonNegativeInteger|))
          (|indexNodes| (|List| S)) (#17=#:G1110 NIL) (|i| NIL)
          (|ls|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|mt8| #7#) (|mt7| #7#) (|mt6| #7#) (|mt5| #7#) (|mt4| #7#)
          (|mt3| #7#) (|mt2| #7#) (|mt1| #7#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |mt1|
                  (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "black"
                            "black" (QREFELT $ 121))
                  . #18=(|FGRPH-;subdiagramSvg;SA2BV;49|))
            (LETT |mt2|
                  (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "blue"
                            "blue" (QREFELT $ 121))
                  . #18#)
            (LETT |mt3|
                  (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "orange"
                            "orange" (QREFELT $ 121))
                  . #18#)
            (LETT |mt4|
                  (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "green"
                            "green" (QREFELT $ 121))
                  . #18#)
            (LETT |mt5|
                  (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "brown"
                            "brown" (QREFELT $ 121))
                  . #18#)
            (LETT |mt6|
                  (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "grey"
                            "grey" (QREFELT $ 121))
                  . #18#)
            (LETT |mt7|
                  (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "red"
                            "red" (QREFELT $ 121))
                  . #18#)
            (LETT |mt8|
                  (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "purple"
                            "purple" (QREFELT $ 121))
                  . #18#)
            (LETT |ls| (SPADCALL |n| (QREFELT $ 10)) . #18#)
            (LETT |indexPointx| NIL . #18#) (LETT |indexPointy| NIL . #18#)
            (LETT |indexBounds| NIL . #18#) (LETT |indexNodes| NIL . #18#)
            (SEQ (LETT |i| NIL . #18#) (LETT #17# |ls| . #18#) G190
                 (COND
                  ((OR (ATOM #17#) (PROGN (LETT |i| (CAR #17#) . #18#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |indexNodes|
                        (SPADCALL |indexNodes| (QVELT |i| 0) (QREFELT $ 123))
                        . #18#)
                  (LETT |s| (|mathObject2String| (QVELT |i| 0)) . #18#)
                  (LETT |x| (QVELT |i| 1) . #18#)
                  (LETT |y| (QVELT |i| 2) . #18#)
                  (LETT |indexPointx|
                        (SPADCALL |indexPointx| |x| (QREFELT $ 49)) . #18#)
                  (LETT |indexPointy|
                        (SPADCALL |indexPointy| |y| (QREFELT $ 49)) . #18#)
                  (EXIT
                   (COND
                    ((EQUAL (QREFELT $ 7) (|DirectedGraph| (|String|)))
                     (SEQ (LETT |subgraph| (QVELT |i| 0) . #18#)
                          (LETT |sh|
                                (VECTOR '|ellipse|
                                        (SPADCALL
                                         (SPADCALL |x| |y| (QREFELT $ 125))
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL 7 -1 10 (QREFELT $ 128))
                                           (QREFELT $ 129))
                                          (SPADCALL
                                           (SPADCALL 7 -1 10 (QREFELT $ 128))
                                           (QREFELT $ 129))
                                          (QREFELT $ 130))
                                         (QREFELT $ 131))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL 7 -1 10 (QREFELT $ 128))
                                          (QREFELT $ 129))
                                         (SPADCALL
                                          (SPADCALL 7 -1 10 (QREFELT $ 128))
                                          (QREFELT $ 129))
                                         (QREFELT $ 130))
                                        NIL)
                                . #18#)
                          (LETT |ellip| (SPADCALL |sc| |sh| (QREFELT $ 133))
                                . #18#)
                          (LETT |tn|
                                (SPADCALL |sc| |subgraph| |x| |y|
                                          |dispArrowName| (QREFELT $ 135))
                                . #18#)
                          (EXIT
                           (LETT |indexBounds|
                                 (SPADCALL |indexBounds| |ellip|
                                           (QREFELT $ 137))
                                 . #18#))))
                    ('T
                     (SEQ
                      (LETT |tn|
                            (SPADCALL |sc| |s| 32
                                      (SPADCALL |x| |y| (QREFELT $ 125))
                                      (QREFELT $ 138))
                            . #18#)
                      (EXIT
                       (LETT |indexBounds|
                             (SPADCALL |indexBounds| |tn| (QREFELT $ 137))
                             . #18#)))))))
                 (LETT #17# (CDR #17#) . #18#) (GO G190) G191 (EXIT NIL))
            (LETT |arrs| (SPADCALL |n| (QREFELT $ 22)) . #18#)
            (COND
             ((SPADCALL |arrs| NIL (QREFELT $ 139))
              (PROGN
               (LETT #1# (SPADCALL (QREFELT $ 141)) . #18#)
               (GO #19=#:G1108))))
            (LETT |innerOb| NIL . #18#)
            (COND
             (|deep|
              (COND
               ((EQUAL (QREFELT $ 7) (|DirectedGraph| (|String|)))
                (SEQ (LETT |nd| NIL . #18#) (LETT #16# |indexNodes| . #18#)
                     G190
                     (COND
                      ((OR (ATOM #16#)
                           (PROGN (LETT |nd| (CAR #16#) . #18#) NIL))
                       (GO G191)))
                     (SEQ (LETT |subNd| |nd| . #18#)
                          (LETT |innerObs| (SPADCALL |subNd| (QREFELT $ 144))
                                . #18#)
                          (EXIT
                           (LETT |innerOb|
                                 (SPADCALL |innerOb| |innerObs|
                                           (QREFELT $ 148))
                                 . #18#)))
                     (LETT #16# (CDR #16#) . #18#) (GO G190) G191
                     (EXIT NIL))))))
            (SEQ (LETT |arrn| 1 . #18#) (LETT #15# (LENGTH |arrs|) . #18#)
                 (LETT |arrow| NIL . #18#) (LETT #14# |arrs| . #18#) G190
                 (COND
                  ((OR (ATOM #14#) (PROGN (LETT |arrow| (CAR #14#) . #18#) NIL)
                       (|greater_SI| |arrn| #15#))
                   (GO G191)))
                 (SEQ
                  (LETT |fromX|
                        (SPADCALL |indexPointx| (QVELT |arrow| 2)
                                  (QREFELT $ 110))
                        . #18#)
                  (LETT |toX|
                        (SPADCALL |indexPointx| (QVELT |arrow| 3)
                                  (QREFELT $ 110))
                        . #18#)
                  (LETT |fromX|
                        (PROG1 (LETT #13# (+ |fromX| (QVELT |arrow| 4)) . #18#)
                          (|check_subtype2| (>= #13# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #13#))
                        . #18#)
                  (LETT |toX|
                        (PROG1 (LETT #12# (+ |toX| (QVELT |arrow| 4)) . #18#)
                          (|check_subtype2| (>= #12# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #12#))
                        . #18#)
                  (LETT |fromY|
                        (SPADCALL |indexPointy| (QVELT |arrow| 2)
                                  (QREFELT $ 110))
                        . #18#)
                  (LETT |toY|
                        (SPADCALL |indexPointy| (QVELT |arrow| 3)
                                  (QREFELT $ 110))
                        . #18#)
                  (LETT |fromY|
                        (PROG1 (LETT #11# (+ |fromY| (QVELT |arrow| 5)) . #18#)
                          (|check_subtype2| (>= #11# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #11#))
                        . #18#)
                  (LETT |toY|
                        (PROG1 (LETT #10# (+ |toY| (QVELT |arrow| 5)) . #18#)
                          (|check_subtype2| (>= #10# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #10#))
                        . #18#)
                  (LETT |midX| (ASH (+ |toX| |fromX|) -1) . #18#)
                  (LETT |midY| (ASH (+ |toY| |fromY|) -1) . #18#)
                  (LETT |arrIndex|
                        (SPADCALL |n| (QVELT |arrow| 2) (QREFELT $ 149))
                        . #18#)
                  (LETT |arrNumber| (SPADCALL |arrn| |arrIndex| (QREFELT $ 65))
                        . #18#)
                  (LETT |rema| (QCDR (DIVIDE2 |arrNumber| 8)) . #18#)
                  (LETT |mt| |mt1| . #18#)
                  (COND ((EQL |rema| 0) (LETT |mt| |mt1| . #18#)))
                  (COND ((EQL |rema| 1) (LETT |mt| |mt2| . #18#)))
                  (COND ((EQL |rema| 2) (LETT |mt| |mt3| . #18#)))
                  (COND ((EQL |rema| 3) (LETT |mt| |mt4| . #18#)))
                  (COND ((EQL |rema| 4) (LETT |mt| |mt5| . #18#)))
                  (COND ((EQL |rema| 5) (LETT |mt| |mt6| . #18#)))
                  (COND ((EQL |rema| 6) (LETT |mt| |mt7| . #18#)))
                  (COND ((EQL |rema| 7) (LETT |mt| |mt8| . #18#)))
                  (COND
                   (|deep|
                    (COND
                     ((EQUAL (QREFELT $ 7) (|DirectedGraph| (|String|)))
                      (SEQ (LETT |mp| (QVELT |arrow| 6) . #18#)
                           (EXIT
                            (SEQ (LETT |subArrowN| 1 . #18#)
                                 (LETT #6# (SPADCALL |mp| (QREFELT $ 68))
                                       . #18#)
                                 (LETT |subArrow| NIL . #18#)
                                 (LETT #5# |mp| . #18#) G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN
                                        (LETT |subArrow| (CAR #5#) . #18#)
                                        NIL)
                                       (|greater_SI| |subArrowN| #6#))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |innerObFrom|
                                        (SPADCALL
                                         (SPADCALL |innerOb| (QVELT |arrow| 2)
                                                   (QREFELT $ 150))
                                         |subArrowN| (QREFELT $ 151))
                                        . #18#)
                                  (LETT |innerObTo|
                                        (SPADCALL
                                         (SPADCALL |innerOb| (QVELT |arrow| 3)
                                                   (QREFELT $ 150))
                                         |subArrow| (QREFELT $ 151))
                                        . #18#)
                                  (LETT |subFromX|
                                        (|add_DF|
                                         (FLOAT |fromX|
                                                MOST-POSITIVE-DOUBLE-FLOAT)
                                         (|mul_DF|
                                          (FLOAT (QVELT |innerObFrom| 1)
                                                 MOST-POSITIVE-DOUBLE-FLOAT)
                                          (SPADCALL
                                           (SPADCALL 25 -2 10 (QREFELT $ 128))
                                           (QREFELT $ 129))))
                                        . #18#)
                                  (LETT |subToX|
                                        (|add_DF|
                                         (FLOAT |toX|
                                                MOST-POSITIVE-DOUBLE-FLOAT)
                                         (|mul_DF|
                                          (FLOAT (QVELT |innerObFrom| 2)
                                                 MOST-POSITIVE-DOUBLE-FLOAT)
                                          (SPADCALL
                                           (SPADCALL 25 -2 10 (QREFELT $ 128))
                                           (QREFELT $ 129))))
                                        . #18#)
                                  (LETT |subFromY|
                                        (|add_DF|
                                         (FLOAT |fromY|
                                                MOST-POSITIVE-DOUBLE-FLOAT)
                                         (|mul_DF|
                                          (FLOAT (QVELT |innerObTo| 1)
                                                 MOST-POSITIVE-DOUBLE-FLOAT)
                                          (SPADCALL
                                           (SPADCALL 25 -2 10 (QREFELT $ 128))
                                           (QREFELT $ 129))))
                                        . #18#)
                                  (LETT |subToY|
                                        (|add_DF|
                                         (FLOAT |toY|
                                                MOST-POSITIVE-DOUBLE-FLOAT)
                                         (|mul_DF|
                                          (FLOAT (QVELT |innerObTo| 2)
                                                 MOST-POSITIVE-DOUBLE-FLOAT)
                                          (SPADCALL
                                           (SPADCALL 25 -2 10 (QREFELT $ 128))
                                           (QREFELT $ 129))))
                                        . #18#)
                                  (EXIT
                                   (LETT |subArrNode|
                                         (SPADCALL |mt|
                                                   (LIST
                                                    (LIST
                                                     (SPADCALL |subFromX|
                                                               |subFromY|
                                                               (QREFELT $ 152))
                                                     (SPADCALL |subToX|
                                                               |subToY|
                                                               (QREFELT $
                                                                        152))))
                                                   '|fixed|
                                                   (SPADCALL
                                                    (SPADCALL 1 -1 10
                                                              (QREFELT $ 128))
                                                    (QREFELT $ 129))
                                                   (QREFELT $ 155))
                                         . #18#)))
                                 (LETT #5#
                                       (PROG1 (CDR #5#)
                                         (LETT |subArrowN|
                                               (|inc_SI| |subArrowN|) . #18#))
                                       . #18#)
                                 (GO G190) G191 (EXIT NIL))))))))
                  (EXIT
                   (COND
                    ((NULL |deep|)
                     (SEQ
                      (LETT |fnode|
                            (SPADCALL |indexBounds| (QVELT |arrow| 2)
                                      (QREFELT $ 156))
                            . #18#)
                      (LETT |tnode|
                            (SPADCALL |indexBounds| (QVELT |arrow| 3)
                                      (QREFELT $ 156))
                            . #18#)
                      (LETT |offset|
                            (SPADCALL (QVELT |arrow| 4) (QVELT |arrow| 5)
                                      (QREFELT $ 125))
                            . #18#)
                      (COND
                       ((EQUAL (QREFELT $ 7) (|DirectedGraph| (|String|)))
                        (LETT |arrNode|
                              (SPADCALL |mt| |fnode| |tnode| |offset| '|fixed|
                                        (SPADCALL
                                         (SPADCALL 1 -1 10 (QREFELT $ 128))
                                         (QREFELT $ 129))
                                        (FLOAT
                                         (+ (SPADCALL |n| (QREFELT $ 157)) 10)
                                         MOST-POSITIVE-DOUBLE-FLOAT)
                                        (QREFELT $ 158))
                              . #18#))
                       ('T
                        (LETT |arrNode|
                              (SPADCALL |mt| |fnode| |tnode| |offset|
                                        '|proportional|
                                        (SPADCALL
                                         (SPADCALL 1 -1 10 (QREFELT $ 128))
                                         (QREFELT $ 129))
                                        (FLOAT
                                         (+ (SPADCALL |n| (QREFELT $ 157)) 10)
                                         MOST-POSITIVE-DOUBLE-FLOAT)
                                        (QREFELT $ 158))
                              . #18#)))
                      (EXIT
                       (COND
                        (|dispArrowName|
                         (SEQ (LETT |s| (QVELT |arrow| 0) . #18#)
                              (EXIT
                               (SPADCALL |mt| |s| 32
                                         (SPADCALL |midX| |midY|
                                                   (QREFELT $ 125))
                                         (QREFELT $ 138))))))))))))
                 (LETT #14#
                       (PROG1 (CDR #14#)
                         (LETT |arrn| (|inc_SI| |arrn|) . #18#))
                       . #18#)
                 (GO G190) G191 (EXIT NIL))
            (EXIT
             (PROGN (LETT #1# (SPADCALL (QREFELT $ 141)) . #18#) (GO #19#)))))
          #19# (EXIT #1#)))) 

(SDEFUN |FGRPH-;diagramSvg;SABV;50|
        ((|fileName| |String|) (|n| A) (|dispArrowName| |Boolean|) ($ |Void|))
        (SPROG
         ((|sc| (|Scene| (|SCartesian| 2)))
          (|view| (|SBoundary| (|SCartesian| 2))))
         (SEQ
          (LETT |view|
                (SPADCALL (SPADCALL 0 0 (QREFELT $ 125))
                          (SPADCALL (+ (SPADCALL |n| (QREFELT $ 157)) 10)
                                    (+ (SPADCALL |n| (QREFELT $ 160)) 10)
                                    (QREFELT $ 125))
                          (QREFELT $ 162))
                . #1=(|FGRPH-;diagramSvg;SABV;50|))
          (LETT |sc| (SPADCALL |view| (QREFELT $ 163)) . #1#)
          (SPADCALL |sc| |n| |dispArrowName| NIL (QREFELT $ 164))
          (EXIT (SPADCALL |sc| |fileName| (QREFELT $ 165)))))) 

(SDEFUN |FGRPH-;deepDiagramSvg;SABV;51|
        ((|fileName| |String|) (|n| A) (|dispArrowName| |Boolean|) ($ |Void|))
        (SPROG
         ((|sc| (|Scene| (|SCartesian| 2)))
          (|view| (|SBoundary| (|SCartesian| 2))))
         (SEQ
          (LETT |view|
                (SPADCALL (SPADCALL 0 0 (QREFELT $ 125))
                          (SPADCALL (+ (SPADCALL |n| (QREFELT $ 157)) 10)
                                    (+ (SPADCALL |n| (QREFELT $ 160)) 10)
                                    (QREFELT $ 125))
                          (QREFELT $ 162))
                . #1=(|FGRPH-;deepDiagramSvg;SABV;51|))
          (LETT |sc| (SPADCALL |view| (QREFELT $ 163)) . #1#)
          (SPADCALL |sc| |n| |dispArrowName| 'T (QREFELT $ 164))
          (EXIT (SPADCALL |sc| |fileName| (QREFELT $ 165)))))) 

(SDEFUN |FGRPH-;diagramWidth;ANni;52| ((|s| A) ($ |NonNegativeInteger|))
        (SPROG
         ((|maxx| (|NonNegativeInteger|)) (#1=#:G1124 NIL) (|i| NIL)
          (|ls|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ (LETT |maxx| 0 . #2=(|FGRPH-;diagramWidth;ANni;52|))
              (LETT |ls| (SPADCALL |s| (QREFELT $ 10)) . #2#)
              (SEQ (LETT |i| NIL . #2#) (LETT #1# |ls| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (QVELT |i| 1) |maxx| (QREFELT $ 96))
                       (LETT |maxx| (QVELT |i| 1) . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |maxx|)))) 

(SDEFUN |FGRPH-;diagramHeight;ANni;53| ((|s| A) ($ |NonNegativeInteger|))
        (SPROG
         ((|maxy| (|NonNegativeInteger|)) (#1=#:G1129 NIL) (|i| NIL)
          (|ls|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ (LETT |maxy| 0 . #2=(|FGRPH-;diagramHeight;ANni;53|))
              (LETT |ls| (SPADCALL |s| (QREFELT $ 10)) . #2#)
              (SEQ (LETT |i| NIL . #2#) (LETT #1# |ls| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (QVELT |i| 2) |maxy| (QREFELT $ 96))
                       (LETT |maxy| (QVELT |i| 2) . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |maxy|)))) 

(SDEFUN |FGRPH-;looseEquals;2AB;54| ((|x| A) (|y| A) ($ |Boolean|))
        (SPROG
         ((#1=#:G1142 NIL) (#2=#:G1143 NIL) (|i| NIL)
          (|ary|
           #3=(|List|
               (|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arx| #3#))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (LENGTH (SPADCALL |x| (QREFELT $ 10)))
                        (LENGTH (SPADCALL |y| (QREFELT $ 10))) (QREFELT $ 101))
              (PROGN
               (LETT #1# NIL . #4=(|FGRPH-;looseEquals;2AB;54|))
               (GO #5=#:G1141))))
            (LETT |arx| (SPADCALL |x| (QREFELT $ 22)) . #4#)
            (LETT |ary| (SPADCALL |y| (QREFELT $ 22)) . #4#)
            (COND
             ((SPADCALL (LENGTH |arx|) (LENGTH |ary|) (QREFELT $ 101))
              (PROGN (LETT #1# NIL . #4#) (GO #5#))))
            (SEQ (LETT |i| 1 . #4#) (LETT #2# (LENGTH |arx|) . #4#) G190
                 (COND ((|greater_SI| |i| #2#) (GO G191)))
                 (SEQ
                  (COND
                   ((SPADCALL (QVELT (SPADCALL |arx| |i| (QREFELT $ 83)) 2)
                              (QVELT (SPADCALL |ary| |i| (QREFELT $ 83)) 2)
                              (QREFELT $ 101))
                    (PROGN (LETT #1# NIL . #4#) (GO #5#))))
                  (EXIT
                   (COND
                    ((SPADCALL (QVELT (SPADCALL |arx| |i| (QREFELT $ 83)) 3)
                               (QVELT (SPADCALL |ary| |i| (QREFELT $ 83)) 3)
                               (QREFELT $ 101))
                     (PROGN (LETT #1# NIL . #4#) (GO #5#))))))
                 (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #5# (EXIT #1#)))) 

(PUT '|FGRPH-;hash;ASi;55| '|SPADreplace| '(XLAM (|s|) 0)) 

(SDEFUN |FGRPH-;hash;ASi;55| ((|s| A) ($ |SingleInteger|)) 0) 

(SDEFUN |FGRPH-;latex;AS;56| ((|n| A) ($ |String|))
        (SPROG
         ((|fst| (|Boolean|)) (|s| (|String|)) (#1=#:G1156 NIL) (|arrow| NIL)
          (|arrStr| (|String|)) (#2=#:G1154 NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (#3=#:G1155 NIL) (|i| NIL)
          (|ls|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ
          (EXIT
           (SEQ (LETT |s| "" . #4=(|FGRPH-;latex;AS;56|))
                (LETT |ls| (SPADCALL |n| (QREFELT $ 10)) . #4#)
                (SEQ (LETT |i| NIL . #4#) (LETT #3# |ls| . #4#) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#) . #4#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((EQUAL |s| "")
                         (LETT |s| (SPADCALL (QVELT |i| 0) (QREFELT $ 173))
                               . #4#))
                        ('T
                         (LETT |s|
                               (SPADCALL
                                (LIST |s| ","
                                      (SPADCALL (QVELT |i| 0) (QREFELT $ 173)))
                                (QREFELT $ 174))
                               . #4#)))))
                     (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
                (LETT |arrs| (SPADCALL |n| (QREFELT $ 22)) . #4#)
                (COND
                 ((SPADCALL |arrs| NIL (QREFELT $ 139))
                  (PROGN (LETT #2# |s| . #4#) (GO #5=#:G1153))))
                (COND
                 ((SPADCALL |arrs| NIL (QREFELT $ 139))
                  (PROGN (LETT #2# |s| . #4#) (GO #5#))))
                (LETT |s| (SPADCALL (LIST |s| "|") (QREFELT $ 174)) . #4#)
                (LETT |fst| 'T . #4#) (LETT |arrStr| "->" . #4#)
                (SEQ (LETT |arrow| NIL . #4#) (LETT #1# |arrs| . #4#) G190
                     (COND
                      ((OR (ATOM #1#)
                           (PROGN (LETT |arrow| (CAR #1#) . #4#) NIL))
                       (GO G191)))
                     (SEQ
                      (COND ((NULL |fst|) (LETT |s| (STRCONC |s| ",") . #4#)))
                      (LETT |s|
                            (SPADCALL
                             (LIST |s| (QVELT |arrow| 0) ":"
                                   (SPADCALL
                                    (QVELT
                                     (SPADCALL |ls| (QVELT |arrow| 2)
                                               (QREFELT $ 175))
                                     0)
                                    (QREFELT $ 173))
                                   |arrStr|
                                   (SPADCALL
                                    (QVELT
                                     (SPADCALL |ls| (QVELT |arrow| 3)
                                               (QREFELT $ 175))
                                     0)
                                    (QREFELT $ 173)))
                             (QREFELT $ 174))
                            . #4#)
                      (EXIT (LETT |fst| 'NIL . #4#)))
                     (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT |s|)))
          #5# (EXIT #2#)))) 

(SDEFUN |FGRPH-;=;2AB;57| ((|x| A) (|y| A) ($ |Boolean|))
        (SPROG ((#1=#:G1165 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL (SPADCALL |x| (QREFELT $ 10))
                              (SPADCALL |y| (QREFELT $ 10)) (QREFELT $ 177))
                    (PROGN
                     (LETT #1# NIL . #2=(|FGRPH-;=;2AB;57|))
                     (GO #3=#:G1164))))
                  (COND
                   ((SPADCALL (SPADCALL |x| (QREFELT $ 22))
                              (SPADCALL |y| (QREFELT $ 22)) (QREFELT $ 178))
                    (PROGN (LETT #1# NIL . #2#) (GO #3#))))
                  (EXIT 'T)))
                #3# (EXIT #1#)))) 

(SDEFUN |FGRPH-;~=;2AB;58| ((|x| A) (|y| A) ($ |Boolean|))
        (NULL (SPADCALL |x| |y| (QREFELT $ 180)))) 

(SDEFUN |FGRPH-;coerceSubgraph| ((|n| A) ($ |OutputForm|))
        (SPROG
         ((|fst| (|Boolean|)) (|s| (|OutputForm|)) (|stTo| (|OutputForm|))
          (|stFrom| (|OutputForm|)) (#1=#:G1180 NIL) (|arrow| NIL)
          (|arrStr| (|OutputForm|)) (#2=#:G1178 NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|st| (|OutputForm|)) (#3=#:G1179 NIL) (|i| NIL)
          (|ls|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |s| (SPADCALL (QREFELT $ 183))
                  . #4=(|FGRPH-;coerceSubgraph|))
            (LETT |ls| (SPADCALL |n| (QREFELT $ 10)) . #4#)
            (SEQ (LETT |i| 1 . #4#) (LETT #3# (LENGTH |ls|) . #4#) G190
                 (COND ((|greater_SI| |i| #3#) (GO G191)))
                 (SEQ (LETT |st| (SPADCALL |i| (QREFELT $ 184)) . #4#)
                      (EXIT
                       (COND
                        ((SPADCALL |s| (SPADCALL (QREFELT $ 183))
                                   (QREFELT $ 185))
                         (LETT |s| |st| . #4#))
                        ('T
                         (LETT |s|
                               (SPADCALL (LIST |s| "," |st|) (QREFELT $ 186))
                               . #4#)))))
                 (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
            (LETT |arrs| (SPADCALL |n| (QREFELT $ 22)) . #4#)
            (COND
             ((SPADCALL |arrs| NIL (QREFELT $ 139))
              (PROGN (LETT #2# |s| . #4#) (GO #5=#:G1177))))
            (COND
             ((SPADCALL |arrs| NIL (QREFELT $ 139))
              (PROGN (LETT #2# |s| . #4#) (GO #5#))))
            (LETT |s| (SPADCALL (LIST |s| "|") (QREFELT $ 186)) . #4#)
            (LETT |fst| 'T . #4#) (LETT |arrStr| "->" . #4#)
            (SEQ (LETT |arrow| NIL . #4#) (LETT #1# |arrs| . #4#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |arrow| (CAR #1#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |stFrom| (SPADCALL (QVELT |arrow| 2) (QREFELT $ 184))
                        . #4#)
                  (LETT |stTo| (SPADCALL (QVELT |arrow| 3) (QREFELT $ 184))
                        . #4#)
                  (COND
                   ((NULL |fst|)
                    (LETT |s| (SPADCALL |s| "," (QREFELT $ 187)) . #4#)))
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| (SPADCALL (QVELT |arrow| 0) (QREFELT $ 188))
                               ":" |stFrom| |arrStr| |stTo|)
                         (QREFELT $ 186))
                        . #4#)
                  (EXIT (LETT |fst| 'NIL . #4#)))
                 (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT |s|)))
          #5# (EXIT #2#)))) 

(SDEFUN |FGRPH-;coerce;AOf;60| ((|n| A) ($ |OutputForm|))
        (SPROG
         ((|fst| (|Boolean|)) (|s| (|OutputForm|)) (|stTo| (|OutputForm|))
          (|stFrom| (|OutputForm|)) (#1=#:G1193 NIL) (|arrow| NIL)
          (|arrStr| (|OutputForm|)) (#2=#:G1191 NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|st| (|OutputForm|)) (#3=#:G1192 NIL) (|i| NIL)
          (|ls|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((EQUAL (QREFELT $ 7) (|DirectedGraph| (|String|)))
              (PROGN
               (LETT #2# (|FGRPH-;coerceSubgraph| |n| $)
                     . #4=(|FGRPH-;coerce;AOf;60|))
               (GO #5=#:G1190))))
            (LETT |s| (SPADCALL (QREFELT $ 183)) . #4#)
            (LETT |ls| (SPADCALL |n| (QREFELT $ 10)) . #4#)
            (SEQ (LETT |i| NIL . #4#) (LETT #3# |ls| . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |st| (SPADCALL (QVELT |i| 0) (QREFELT $ 189)) . #4#)
                  (EXIT
                   (COND
                    ((SPADCALL |s| (SPADCALL (QREFELT $ 183)) (QREFELT $ 185))
                     (LETT |s| |st| . #4#))
                    ('T
                     (LETT |s| (SPADCALL (LIST |s| "," |st|) (QREFELT $ 186))
                           . #4#)))))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (LETT |arrs| (SPADCALL |n| (QREFELT $ 22)) . #4#)
            (COND
             ((SPADCALL |arrs| NIL (QREFELT $ 139))
              (PROGN (LETT #2# |s| . #4#) (GO #5#))))
            (COND
             ((SPADCALL |arrs| NIL (QREFELT $ 139))
              (PROGN (LETT #2# |s| . #4#) (GO #5#))))
            (LETT |s| (SPADCALL (LIST |s| "|") (QREFELT $ 186)) . #4#)
            (LETT |fst| 'T . #4#) (LETT |arrStr| "->" . #4#)
            (SEQ (LETT |arrow| NIL . #4#) (LETT #1# |arrs| . #4#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |arrow| (CAR #1#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |stFrom|
                        (SPADCALL
                         (QVELT
                          (SPADCALL |ls| (QVELT |arrow| 2) (QREFELT $ 175)) 0)
                         (QREFELT $ 189))
                        . #4#)
                  (LETT |stTo|
                        (SPADCALL
                         (QVELT
                          (SPADCALL |ls| (QVELT |arrow| 3) (QREFELT $ 175)) 0)
                         (QREFELT $ 189))
                        . #4#)
                  (COND
                   ((NULL |fst|)
                    (LETT |s| (SPADCALL |s| "," (QREFELT $ 187)) . #4#)))
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| (SPADCALL (QVELT |arrow| 0) (QREFELT $ 188))
                               ":" |stFrom| |arrStr| |stTo|)
                         (QREFELT $ 186))
                        . #4#)
                  (EXIT (LETT |fst| 'NIL . #4#)))
                 (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT |s|)))
          #5# (EXIT #2#)))) 

(DECLAIM (NOTINLINE |FiniteGraph&;|)) 

(DEFUN |FiniteGraph&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteGraph&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|FiniteGraph&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 191) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|FiniteGraph&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Record| (|:| |value| 7) (|:| |posX| 13) (|:| |posY| 13))
              (|List| 8) (0 . |getVertices|) (|Boolean|) (5 . =)
              (|NonNegativeInteger|) |FGRPH-;getVertexIndex;ASNni;1|
              (11 . |getVertexIndex|) (|String|) (17 . |addArrow!|)
              |FGRPH-;addArrow!;AS2SA;2| |FGRPH-;isDirected?;B;3|
              (|Record| (|:| |name| 16) (|:| |arrType| 13) (|:| |fromOb| 13)
                        (|:| |toOb| 13) (|:| |xOffset| 26) (|:| |yOffset| 26)
                        (|:| |map| 40))
              (|List| 20) (25 . |getArrows|) (|Matrix| 26) (30 . |zero|)
              (36 . |isDirected?|) (|Integer|) (40 . |setelt!|)
              |FGRPH-;incidenceMatrix;AM;4| (48 . |isDirectSuccessor?|)
              (|List| 40) (|Matrix| 13) (55 . |matrix|)
              |FGRPH-;adjacencyMatrix;AM;5| (60 . |inDegree|)
              (|List| (|List| 26)) (66 . |matrix|)
              |FGRPH-;laplacianMatrix;AM;7| (71 . |distance|)
              |FGRPH-;distanceMatrix;AM;8| (|List| 13) (78 . |arrowsToArrow|)
              (|Reference| 40) (84 . |deref|) (89 . |entry?|) (|Tree| 26)
              (95 . |tree|) (|List| 45) (100 . |concat|) (106 . |concat|)
              (112 . |setref|) (|List| $) (118 . |tree|) (124 . |ref|)
              |FGRPH-;spanningTreeArrow;ANniT;10| (129 . |spanningTreeArrow|)
              |FGRPH-;spanningForestArrow;AL;11| (135 . |nodeToNode|)
              (|List| 11) (141 . |concat|) |FGRPH-;spanningTreeNode;ANniT;13|
              (147 . |spanningTreeNode|) |FGRPH-;spanningForestNode;AL;14|
              (153 . |children|) (158 . |value|) (163 . |position|) (|Loop|)
              (169 . |loop|) (174 . |#|) (179 . |last|) (|List| 66)
              (185 . |concat|) (191 . |spanningForestNode|)
              (196 . |removeDuplicates|) |FGRPH-;loopsNodes;AL;16|
              |FGRPH-;loopsAtNode;ANniL;17| (201 . |spanningForestArrow|)
              |FGRPH-;loopsArrows;AL;19| (206 . |loopsNodes|) (211 . =)
              |FGRPH-;isAcyclic?;AB;20| |FGRPH-;isDirectSuccessor?;A2NniB;21|
              |FGRPH-;isFixPoint?;ANniB;22| (217 . |elt|)
              |FGRPH-;getArrowIndex;A3Nni;23| |FGRPH-;arrowName;A2NniS;24|
              |FGRPH-;inDegree;A2Nni;25| |FGRPH-;outDegree;A2Nni;26|
              |FGRPH-;nodeFromNode;ANniL;27| |FGRPH-;nodeToNode;ANniL;28|
              |FGRPH-;arrowsFromNode;ANniL;29| |FGRPH-;arrowsToNode;ANniL;30|
              |FGRPH-;nodeFromArrow;ANniL;31| |FGRPH-;nodeToArrow;ANniL;32|
              |FGRPH-;arrowsFromArrow;ANniL;33| |FGRPH-;arrowsToArrow;ANniL;34|
              (223 . >) (229 . =) (235 . ~=) |FGRPH-;routeNodes;A2NniL;36|
              (241 . |getArrowIndex|) (248 . ~=) |FGRPH-;routeArrows;A2NniL;38|
              |FGRPH-;isGreaterThan?;A2NniB;39| (254 . |isGreaterThan?|)
              |FGRPH-;max;ANni;40| |FGRPH-;max;ALNni;41| |FGRPH-;min;ANni;42|
              |FGRPH-;min;ALNni;43| |FGRPH-;distance;A2NniI;44| (261 . |elt|)
              (267 . |setelt!|) |FGRPH-;isFunctional?;AB;45|
              |FGRPH-;createWidth;2Nni;46| (274 . |createWidth|)
              (|Union| $ '"failed") (279 . |subtractIfCan|)
              |FGRPH-;createX;3Nni;47| |FGRPH-;createY;3Nni;48| (|DoubleFloat|)
              (|Scene| 124) (285 . |addSceneMaterial|) (|List| 7)
              (293 . |concat|) (|SCartesian| '2) (299 . |sipnt|)
              (|PositiveInteger|) (|Float|) (305 . |float|) (312 . |coerce|)
              (317 . |svec|) (323 . +)
              (|Record| (|:| |shptype| 154) (|:| |centre| 124) (|:| |size| 124)
                        (|:| |fill| 11))
              (329 . |addSceneShape|) (|DirectedGraph| 16)
              (335 . |addSceneGraph|) (|List| 120) (344 . |concat|)
              (350 . |addSceneText|) (358 . =) (|Void|) (364 . |void|)
              (|Record| (|:| |value| 16) (|:| |posX| 13) (|:| |posY| 13))
              (|List| 142) (368 . |getVertices|)
              (|Record| (|:| |value| 134) (|:| |posX| 13) (|:| |posY| 13))
              (|List| 145) (|List| 146) (373 . |concat|) (379 . |arrowsToNode|)
              (385 . |elt|) (391 . |elt|) (397 . |spnt|) (|List| (|List| 124))
              (|Symbol|) (403 . |addSceneArrows|) (411 . |elt|)
              (417 . |diagramWidth|) (422 . |addSceneArrow|)
              |FGRPH-;subdiagramSvg;SA2BV;49| (433 . |diagramHeight|)
              (|SBoundary| 124) (438 . |boxBoundary|) (444 . |createSceneRoot|)
              (449 . |subdiagramSvg|) (457 . |writeSvg|)
              |FGRPH-;diagramSvg;SABV;50| |FGRPH-;deepDiagramSvg;SABV;51|
              |FGRPH-;diagramWidth;ANni;52| |FGRPH-;diagramHeight;ANni;53|
              |FGRPH-;looseEquals;2AB;54| (|SingleInteger|)
              |FGRPH-;hash;ASi;55| (463 . |latex|) (468 . |concat|)
              (473 . |elt|) |FGRPH-;latex;AS;56| (479 . ~=) (485 . ~=)
              |FGRPH-;=;2AB;57| (491 . =) |FGRPH-;~=;2AB;58| (|OutputForm|)
              (497 . |empty|) (501 . |coerce|) (506 . =) (512 . |hconcat|)
              (517 . |hconcat|) (523 . |coerce|) (528 . |coerce|)
              |FGRPH-;coerce;AOf;60|)
           '#(~= 533 |subdiagramSvg| 539 |spanningTreeNode| 547
              |spanningTreeArrow| 553 |spanningForestNode| 559
              |spanningForestArrow| 564 |routeNodes| 569 |routeArrows| 576
              |outDegree| 583 |nodeToNode| 589 |nodeToArrow| 595 |nodeFromNode|
              601 |nodeFromArrow| 607 |min| 613 |max| 624 |looseEquals| 635
              |loopsNodes| 641 |loopsAtNode| 646 |loopsArrows| 652 |latex| 657
              |laplacianMatrix| 662 |isGreaterThan?| 667 |isFunctional?| 674
              |isFixPoint?| 679 |isDirected?| 685 |isDirectSuccessor?| 689
              |isAcyclic?| 696 |incidenceMatrix| 701 |inDegree| 706 |hash| 712
              |getVertexIndex| 717 |getArrowIndex| 723 |distanceMatrix| 730
              |distance| 735 |diagramWidth| 742 |diagramSvg| 747
              |diagramHeight| 754 |deepDiagramSvg| 759 |createY| 766 |createX|
              772 |createWidth| 778 |coerce| 783 |arrowsToNode| 793
              |arrowsToArrow| 799 |arrowsFromNode| 805 |arrowsFromArrow| 811
              |arrowName| 817 |adjacencyMatrix| 824 |addArrow!| 829 = 837)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 190
                                                 '(1 6 9 0 10 2 7 11 0 0 12 2 6
                                                   13 0 7 15 4 6 0 0 16 13 13
                                                   17 1 6 21 0 22 2 23 0 13 13
                                                   24 0 6 11 25 4 23 26 0 26 26
                                                   26 27 3 6 11 0 13 13 29 1 31
                                                   0 30 32 2 6 13 0 13 34 1 23
                                                   0 35 36 3 6 26 0 13 13 38 2
                                                   6 40 0 13 41 1 42 40 0 43 2
                                                   40 11 13 0 44 1 45 0 26 46 2
                                                   47 0 0 45 48 2 40 0 0 13 49
                                                   2 42 40 0 40 50 2 45 0 26 51
                                                   52 1 42 0 40 53 2 6 45 0 13
                                                   55 2 6 40 0 13 57 2 58 0 0
                                                   11 59 2 6 45 0 13 61 1 45 51
                                                   0 63 1 45 26 0 64 2 40 26 13
                                                   0 65 1 66 0 40 67 1 40 13 0
                                                   68 2 40 0 0 13 69 2 70 0 0 0
                                                   71 1 6 47 0 72 1 70 0 0 73 1
                                                   6 47 0 76 1 6 70 0 78 2 70
                                                   11 0 0 79 2 21 20 0 26 83 2
                                                   13 11 0 0 96 2 40 11 0 0 97
                                                   2 40 11 0 0 98 3 6 13 0 13
                                                   13 100 2 13 11 0 0 101 3 6
                                                   11 0 13 13 104 2 40 13 0 26
                                                   110 3 40 13 0 26 13 111 1 6
                                                   13 13 114 2 13 115 0 0 116 4
                                                   120 0 0 119 16 16 121 2 122
                                                   0 0 7 123 2 124 0 26 26 125
                                                   3 127 0 26 26 126 128 1 127
                                                   119 0 129 2 124 0 119 119
                                                   130 2 124 0 0 0 131 2 120 0
                                                   0 132 133 5 120 0 0 134 13
                                                   13 11 135 2 136 0 0 120 137
                                                   4 120 0 0 16 13 124 138 2 21
                                                   11 0 0 139 0 140 0 141 1 134
                                                   143 0 144 2 147 0 0 146 148
                                                   2 6 40 0 13 149 2 147 146 0
                                                   26 150 2 146 145 0 26 151 2
                                                   124 0 119 119 152 4 120 0 0
                                                   153 154 119 155 2 136 120 0
                                                   26 156 1 6 13 0 157 7 120 0
                                                   0 0 0 124 154 119 119 158 1
                                                   6 13 0 160 2 161 0 124 124
                                                   162 1 120 0 161 163 4 6 140
                                                   120 0 11 11 164 2 120 140 0
                                                   16 165 1 7 16 0 173 1 16 0
                                                   51 174 2 9 8 0 26 175 2 9 11
                                                   0 0 177 2 21 11 0 0 178 2 6
                                                   11 0 0 180 0 182 0 183 1 13
                                                   182 0 184 2 182 11 0 0 185 1
                                                   182 0 51 186 2 182 0 0 0 187
                                                   1 16 182 0 188 1 7 182 0 189
                                                   2 0 11 0 0 181 4 0 140 120 0
                                                   11 11 159 2 0 45 0 13 60 2 0
                                                   45 0 13 54 1 0 47 0 62 1 0
                                                   47 0 56 3 0 40 0 13 13 99 3
                                                   0 40 0 13 13 102 2 0 13 0 13
                                                   87 2 0 40 0 13 89 2 0 40 0
                                                   13 93 2 0 40 0 13 88 2 0 40
                                                   0 13 92 1 0 13 0 107 2 0 13
                                                   0 40 108 2 0 13 0 40 106 1 0
                                                   13 0 105 2 0 11 0 0 170 1 0
                                                   70 0 74 2 0 70 0 13 75 1 0
                                                   70 0 77 1 0 16 0 176 1 0 23
                                                   0 37 3 0 11 0 13 13 103 1 0
                                                   11 0 112 2 0 11 0 13 82 0 0
                                                   11 19 3 0 11 0 13 13 81 1 0
                                                   11 0 80 1 0 23 0 28 2 0 13 0
                                                   13 86 1 0 171 0 172 2 0 13 0
                                                   7 14 3 0 13 0 13 13 84 1 0
                                                   23 0 39 3 0 26 0 13 13 109 1
                                                   0 13 0 168 3 0 140 16 0 11
                                                   166 1 0 13 0 169 3 0 140 16
                                                   0 11 167 2 0 13 13 13 118 2
                                                   0 13 13 13 117 1 0 13 13 113
                                                   1 0 182 0 190 1 0 182 0 190
                                                   2 0 40 0 13 91 2 0 40 0 13
                                                   95 2 0 40 0 13 90 2 0 40 0
                                                   13 94 3 0 16 0 13 13 85 1 0
                                                   31 0 33 4 0 0 0 16 7 7 18 2
                                                   0 11 0 0 179)))))
           '|lookupComplete|)) 
