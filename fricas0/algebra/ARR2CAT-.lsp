
(SDEFUN |ARR2CAT-;any?;MSB;1|
        ((|f| |Mapping| (|Boolean|) R) (|m| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G809 NIL) (#2=#:G810 NIL) (#3=#:G812 NIL) (|j| NIL)
          (#4=#:G811 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |i| (SPADCALL |m| (QREFELT $ 11))
                   . #5=(|ARR2CAT-;any?;MSB;1|))
             (LETT #4# (SPADCALL |m| (QREFELT $ 12)) . #5#) G190
             (COND ((> |i| #4#) (GO G191)))
             (SEQ
              (EXIT
               (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #5#)
                    (LETT #3# (SPADCALL |m| (QREFELT $ 14)) . #5#) G190
                    (COND ((> |j| #3#) (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |m| |i| |j| (QREFELT $ 15)) |f|)
                        (PROGN
                         (LETT #1# (PROGN (LETT #2# 'T . #5#) (GO #6=#:G808))
                               . #5#)
                         (GO #7=#:G804))))))
                    (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL)))
              #7# (EXIT #1#))
             (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
            (EXIT NIL)))
          #6# (EXIT #2#)))) 

(SDEFUN |ARR2CAT-;every?;MSB;2|
        ((|f| |Mapping| (|Boolean|) R) (|m| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G818 NIL) (#2=#:G819 NIL) (#3=#:G821 NIL) (|j| NIL)
          (#4=#:G820 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |i| (SPADCALL |m| (QREFELT $ 11))
                   . #5=(|ARR2CAT-;every?;MSB;2|))
             (LETT #4# (SPADCALL |m| (QREFELT $ 12)) . #5#) G190
             (COND ((> |i| #4#) (GO G191)))
             (SEQ
              (EXIT
               (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #5#)
                    (LETT #3# (SPADCALL |m| (QREFELT $ 14)) . #5#) G190
                    (COND ((> |j| #3#) (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((NULL
                         (SPADCALL (SPADCALL |m| |i| |j| (QREFELT $ 15)) |f|))
                        (PROGN
                         (LETT #1# (PROGN (LETT #2# NIL . #5#) (GO #6=#:G817))
                               . #5#)
                         (GO #7=#:G814))))))
                    (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL)))
              #7# (EXIT #1#))
             (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |ARR2CAT-;size?;SNniB;3|
        ((|m| S) (|n| |NonNegativeInteger|) ($ |Boolean|))
        (EQL (* (SPADCALL |m| (QREFELT $ 21)) (SPADCALL |m| (QREFELT $ 22)))
             |n|)) 

(SDEFUN |ARR2CAT-;less?;SNniB;4|
        ((|m| S) (|n| |NonNegativeInteger|) ($ |Boolean|))
        (< (* (SPADCALL |m| (QREFELT $ 21)) (SPADCALL |m| (QREFELT $ 22))) |n|)) 

(SDEFUN |ARR2CAT-;more?;SNniB;5|
        ((|m| S) (|n| |NonNegativeInteger|) ($ |Boolean|))
        (SPADCALL
         (* (SPADCALL |m| (QREFELT $ 21)) (SPADCALL |m| (QREFELT $ 22))) |n|
         (QREFELT $ 25))) 

(SDEFUN |ARR2CAT-;smaller?;2SB;6| ((|m1| S) (|m2| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G834 NIL) (|el2| (R)) (|el1| (R)) (#2=#:G836 NIL) (|j| NIL)
          (#3=#:G835 NIL) (|i| NIL) (|maxColIndex| (|Integer|))
          (|mci2| #4=(|Integer|)) (|mci1| #4#) (|minColIndex| #4#)
          (|maxRowIndex| (|Integer|)) (|mri2| #5=(|Integer|)) (|mri1| #5#)
          (|minRowIndex| #5#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |mri1| (SPADCALL |m1| (QREFELT $ 11))
                  . #6=(|ARR2CAT-;smaller?;2SB;6|))
            (LETT |mri2| (SPADCALL |m2| (QREFELT $ 11)) . #6#)
            (EXIT
             (COND ((< |mri1| |mri2|) 'T) ((< |mri2| |mri1|) NIL)
                   (#7='T
                    (SEQ (LETT |minRowIndex| |mri1| . #6#)
                         (LETT |mri1| (SPADCALL |m1| (QREFELT $ 12)) . #6#)
                         (LETT |mri2| (SPADCALL |m2| (QREFELT $ 12)) . #6#)
                         (EXIT
                          (COND ((< |mri1| |mri2|) 'T) ((< |mri2| |mri1|) NIL)
                                (#7#
                                 (SEQ (LETT |maxRowIndex| |mri1| . #6#)
                                      (LETT |mci1|
                                            (SPADCALL |m1| (QREFELT $ 13))
                                            . #6#)
                                      (LETT |mci2|
                                            (SPADCALL |m2| (QREFELT $ 13))
                                            . #6#)
                                      (EXIT
                                       (COND ((< |mci1| |mci2|) 'T)
                                             ((< |mci2| |mci1|) NIL)
                                             (#7#
                                              (SEQ
                                               (LETT |minColIndex| |mci1|
                                                     . #6#)
                                               (LETT |mci1|
                                                     (SPADCALL |m1|
                                                               (QREFELT $ 14))
                                                     . #6#)
                                               (LETT |mci2|
                                                     (SPADCALL |m2|
                                                               (QREFELT $ 14))
                                                     . #6#)
                                               (EXIT
                                                (COND ((< |mci1| |mci2|) 'T)
                                                      ((< |mci2| |mci1|) NIL)
                                                      (#7#
                                                       (SEQ
                                                        (LETT |maxColIndex|
                                                              |mci1| . #6#)
                                                        (SEQ
                                                         (LETT |i|
                                                               |minRowIndex|
                                                               . #6#)
                                                         (LETT #3#
                                                               |maxRowIndex|
                                                               . #6#)
                                                         G190
                                                         (COND
                                                          ((> |i| #3#)
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (SEQ
                                                            (LETT |j|
                                                                  |minColIndex|
                                                                  . #6#)
                                                            (LETT #2#
                                                                  |maxColIndex|
                                                                  . #6#)
                                                            G190
                                                            (COND
                                                             ((> |j| #2#)
                                                              (GO G191)))
                                                            (SEQ
                                                             (LETT |el1|
                                                                   (SPADCALL
                                                                    |m1| |i|
                                                                    |j|
                                                                    (QREFELT $
                                                                             27))
                                                                   . #6#)
                                                             (LETT |el2|
                                                                   (SPADCALL
                                                                    |m2| |i|
                                                                    |j|
                                                                    (QREFELT $
                                                                             27))
                                                                   . #6#)
                                                             (EXIT
                                                              (COND
                                                               ((SPADCALL |el1|
                                                                          |el2|
                                                                          (QREFELT
                                                                           $
                                                                           28))
                                                                (PROGN
                                                                 (LETT #1# 'T
                                                                       . #6#)
                                                                 (GO
                                                                  #8=#:G833)))
                                                               ((NULL
                                                                 (SPADCALL
                                                                  |el1| |el2|
                                                                  (QREFELT $
                                                                           29)))
                                                                (PROGN
                                                                 (LETT #1# NIL
                                                                       . #6#)
                                                                 (GO #8#))))))
                                                            (LETT |j| (+ |j| 1)
                                                                  . #6#)
                                                            (GO G190) G191
                                                            (EXIT NIL))))
                                                         (LETT |i| (+ |i| 1)
                                                               . #6#)
                                                         (GO G190) G191
                                                         (EXIT NIL))
                                                        (EXIT
                                                         NIL)))))))))))))))))))
          #8# (EXIT #1#)))) 

(SDEFUN |ARR2CAT-;#;SNni;7| ((|m| S) ($ |NonNegativeInteger|))
        (* (SPADCALL |m| (QREFELT $ 21)) (SPADCALL |m| (QREFELT $ 22)))) 

(SDEFUN |ARR2CAT-;elt;S2I2R;8|
        ((|m| S) (|i| |Integer|) (|j| |Integer|) (|r| R) ($ R))
        (COND
         ((OR (< |i| (SPADCALL |m| (QREFELT $ 11)))
              (SPADCALL |i| (SPADCALL |m| (QREFELT $ 12)) (QREFELT $ 32)))
          |r|)
         ((OR (< |j| (SPADCALL |m| (QREFELT $ 13)))
              (SPADCALL |j| (SPADCALL |m| (QREFELT $ 14)) (QREFELT $ 32)))
          |r|)
         ('T (SPADCALL |m| |i| |j| (QREFELT $ 15))))) 

(SDEFUN |ARR2CAT-;count;MSNni;9|
        ((|f| |Mapping| (|Boolean|) R) (|m| S) ($ |NonNegativeInteger|))
        (SPROG
         ((|num| (|NonNegativeInteger|)) (#1=#:G850 NIL) (|j| NIL)
          (#2=#:G849 NIL) (|i| NIL))
         (SEQ (LETT |num| 0 . #3=(|ARR2CAT-;count;MSNni;9|))
              (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 11)) . #3#)
                   (LETT #2# (SPADCALL |m| (QREFELT $ 12)) . #3#) G190
                   (COND ((> |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #3#)
                          (LETT #1# (SPADCALL |m| (QREFELT $ 14)) . #3#) G190
                          (COND ((> |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL (SPADCALL |m| |i| |j| (QREFELT $ 15))
                                        |f|)
                              (LETT |num| (+ |num| 1) . #3#)))))
                          (LETT |j| (+ |j| 1) . #3#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |num|)))) 

(SDEFUN |ARR2CAT-;parts;SL;10| ((|m| S) ($ |List| R))
        (SPROG
         ((|entryList| (|List| R)) (#1=#:G864 NIL) (|j| NIL) (#2=#:G863 NIL)
          (|i| NIL))
         (SEQ (LETT |entryList| NIL . #3=(|ARR2CAT-;parts;SL;10|))
              (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 12)) . #3#)
                   (LETT #2# (SPADCALL |m| (QREFELT $ 11)) . #3#) G190
                   (COND ((< |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 14)) . #3#)
                          (LETT #1# (SPADCALL |m| (QREFELT $ 13)) . #3#) G190
                          (COND ((< |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT |entryList|
                                  (CONS (SPADCALL |m| |i| |j| (QREFELT $ 15))
                                        |entryList|)
                                  . #3#)))
                          (LETT |j| (+ |j| -1) . #3#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (+ |i| -1) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |entryList|)))) 

(SDEFUN |ARR2CAT-;listOfLists;SL;11| ((|x| S) ($ |List| (|List| R)))
        (SPROG
         ((|ll| (|List| (|List| R))) (|l| (|List| R)) (#1=#:G871 NIL) (|j| NIL)
          (#2=#:G870 NIL) (|i| NIL))
         (SEQ (LETT |ll| NIL . #3=(|ARR2CAT-;listOfLists;SL;11|))
              (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 12)) . #3#)
                   (LETT #2# (SPADCALL |x| (QREFELT $ 11)) . #3#) G190
                   (COND ((< |i| #2#) (GO G191)))
                   (SEQ (LETT |l| NIL . #3#)
                        (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 14)) . #3#)
                             (LETT #1# (SPADCALL |x| (QREFELT $ 13)) . #3#)
                             G190 (COND ((< |j| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |l|
                                     (CONS
                                      (SPADCALL |x| |i| |j| (QREFELT $ 15))
                                      |l|)
                                     . #3#)))
                             (LETT |j| (+ |j| -1) . #3#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (LETT |ll| (CONS |l| |ll|) . #3#)))
                   (LETT |i| (+ |i| -1) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |ll|)))) 

(SDEFUN |ARR2CAT-;subMatrix;S4IS;12|
        ((|x| S) (|i1| |Integer|) (|i2| |Integer|) (|j1| |Integer|)
         (|j2| |Integer|) ($ S))
        (SPROG
         ((#1=#:G884 NIL) (|j| NIL) (#2=#:G885 NIL) (|l| NIL) (#3=#:G882 NIL)
          (|i| NIL) (#4=#:G883 NIL) (|k| NIL) (|y| (S))
          (|cols| #5=(|NonNegativeInteger|)) (|rows| #5#))
         (SEQ
          (COND ((< (+ |i2| 1) |i1|) (|error| "subMatrix: bad row indices"))
                ((< (+ |j2| 1) |j1|) (|error| "subMatrix: bad column indices"))
                ('T
                 (SEQ
                  (LETT |rows| (+ (- |i2| |i1|) 1)
                        . #6=(|ARR2CAT-;subMatrix;S4IS;12|))
                  (LETT |cols| (+ (- |j2| |j1|) 1) . #6#)
                  (LETT |y| (SPADCALL |rows| |cols| (QREFELT $ 39)) . #6#)
                  (COND ((OR (EQL |rows| 0) (EQL |cols| 0)) (EXIT |y|)))
                  (COND
                   ((OR (< |i1| (SPADCALL |x| (QREFELT $ 11)))
                        (SPADCALL |i2| (SPADCALL |x| (QREFELT $ 12))
                                  (QREFELT $ 32)))
                    (EXIT (|error| "subMatrix: index out of range"))))
                  (COND
                   ((OR (< |j1| (SPADCALL |x| (QREFELT $ 13)))
                        (SPADCALL |j2| (SPADCALL |x| (QREFELT $ 14))
                                  (QREFELT $ 32)))
                    (EXIT (|error| "subMatrix: index out of range"))))
                  (SEQ (LETT |k| |i1| . #6#) (LETT #4# |i2| . #6#)
                       (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #6#)
                       (LETT #3# (SPADCALL |y| (QREFELT $ 12)) . #6#) G190
                       (COND ((OR (> |i| #3#) (> |k| #4#)) (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |l| |j1| . #6#) (LETT #2# |j2| . #6#)
                              (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #6#)
                              (LETT #1# (SPADCALL |y| (QREFELT $ 14)) . #6#)
                              G190
                              (COND ((OR (> |j| #1#) (> |l| #2#)) (GO G191)))
                              (SEQ
                               (EXIT
                                (SPADCALL |y| |i| |j|
                                          (SPADCALL |x| |k| |l| (QREFELT $ 15))
                                          (QREFELT $ 40))))
                              (LETT |j|
                                    (PROG1 (+ |j| 1)
                                      (LETT |l| (+ |l| 1) . #6#))
                                    . #6#)
                              (GO G190) G191 (EXIT NIL))))
                       (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #6#))
                             . #6#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT |y|))))))) 

(SDEFUN |ARR2CAT-;elt;SILS;13|
        ((|x| S) (|row| |Integer|) (|colList| |List| (|Integer|)) ($ S))
        (SPROG
         ((#1=#:G896 NIL) (|ej| NIL) (#2=#:G897 NIL) (|j| NIL) (|y| (S))
          (#3=#:G894 NIL) (#4=#:G895 NIL))
         (SEQ
          (COND
           ((OR (< |row| (SPADCALL |x| (QREFELT $ 11)))
                (SPADCALL |row| (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 32)))
            (|error| "elt: index out of range"))
           ('T
            (SEQ
             (SEQ
              (EXIT
               (SEQ (LETT |ej| NIL . #5=(|ARR2CAT-;elt;SILS;13|))
                    (LETT #4# |colList| . #5#) G190
                    (COND
                     ((OR (ATOM #4#) (PROGN (LETT |ej| (CAR #4#) . #5#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((OR (< |ej| (SPADCALL |x| (QREFELT $ 13)))
                            (SPADCALL |ej| (SPADCALL |x| (QREFELT $ 14))
                                      (QREFELT $ 32)))
                        (PROGN
                         (LETT #3# (|error| "elt: index out of range") . #5#)
                         (GO #6=#:G890))))))
                    (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL)))
              #6# (EXIT #3#))
             (LETT |y| (SPADCALL 1 (LENGTH |colList|) (QREFELT $ 39)) . #5#)
             (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #5#)
                  (LETT #2# (SPADCALL |y| (QREFELT $ 14)) . #5#)
                  (LETT |ej| NIL . #5#) (LETT #1# |colList| . #5#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |ej| (CAR #1#) . #5#) NIL)
                        (> |j| #2#))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |y| 1 |j|
                              (SPADCALL |x| |row| |ej| (QREFELT $ 15))
                              (QREFELT $ 40))))
                  (LETT #1# (PROG1 (CDR #1#) (LETT |j| (+ |j| 1) . #5#)) . #5#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT |y|))))))) 

(SDEFUN |ARR2CAT-;elt;SLIS;14|
        ((|x| S) (|rowList| |List| (|Integer|)) (|col| |Integer|) ($ S))
        (SPROG
         ((#1=#:G908 NIL) (|ei| NIL) (#2=#:G909 NIL) (|i| NIL) (|y| (S))
          (#3=#:G906 NIL) (#4=#:G907 NIL))
         (SEQ
          (SEQ
           (EXIT
            (SEQ (LETT |ei| NIL . #5=(|ARR2CAT-;elt;SLIS;14|))
                 (LETT #4# |rowList| . #5#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |ei| (CAR #4#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (< |ei| (SPADCALL |x| (QREFELT $ 11)))
                         (SPADCALL |ei| (SPADCALL |x| (QREFELT $ 12))
                                   (QREFELT $ 32)))
                     (PROGN
                      (LETT #3# (|error| "elt: index out of range") . #5#)
                      (GO #6=#:G900))))))
                 (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL)))
           #6# (EXIT #3#))
          (COND
           ((OR (< |col| (SPADCALL |x| (QREFELT $ 13)))
                (SPADCALL |col| (SPADCALL |x| (QREFELT $ 14)) (QREFELT $ 32)))
            (EXIT (|error| "elt: index out of range"))))
          (LETT |y| (SPADCALL (LENGTH |rowList|) 1 (QREFELT $ 39)) . #5#)
          (SEQ (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #5#)
               (LETT #2# (SPADCALL |y| (QREFELT $ 12)) . #5#)
               (LETT |ei| NIL . #5#) (LETT #1# |rowList| . #5#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |ei| (CAR #1#) . #5#) NIL)
                     (> |i| #2#))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |y| |i| 1 (SPADCALL |x| |ei| |col| (QREFELT $ 15))
                           (QREFELT $ 40))))
               (LETT #1# (PROG1 (CDR #1#) (LETT |i| (+ |i| 1) . #5#)) . #5#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;elt;S2LS;15|
        ((|x| S) (|rowList| |List| (|Integer|)) (|colList| |List| (|Integer|))
         ($ S))
        (SPROG
         ((#1=#:G926 NIL) (|ej| NIL) (#2=#:G927 NIL) (|j| NIL) (#3=#:G924 NIL)
          (|ei| NIL) (#4=#:G925 NIL) (|i| NIL) (|y| (S)) (#5=#:G920 NIL)
          (#6=#:G923 NIL) (#7=#:G921 NIL) (#8=#:G922 NIL))
         (SEQ
          (SEQ
           (EXIT
            (SEQ (LETT |ei| NIL . #9=(|ARR2CAT-;elt;S2LS;15|))
                 (LETT #8# |rowList| . #9#) G190
                 (COND
                  ((OR (ATOM #8#) (PROGN (LETT |ei| (CAR #8#) . #9#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (< |ei| (SPADCALL |x| (QREFELT $ 11)))
                         (SPADCALL |ei| (SPADCALL |x| (QREFELT $ 12))
                                   (QREFELT $ 32)))
                     (PROGN
                      (LETT #7# (|error| "elt: index out of range") . #9#)
                      (GO #10=#:G912))))))
                 (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL)))
           #10# (EXIT #7#))
          (SEQ
           (EXIT
            (SEQ (LETT |ej| NIL . #9#) (LETT #6# |colList| . #9#) G190
                 (COND
                  ((OR (ATOM #6#) (PROGN (LETT |ej| (CAR #6#) . #9#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (< |ej| (SPADCALL |x| (QREFELT $ 13)))
                         (SPADCALL |ej| (SPADCALL |x| (QREFELT $ 14))
                                   (QREFELT $ 32)))
                     (PROGN
                      (LETT #5# (|error| "elt: index out of range") . #9#)
                      (GO #11=#:G915))))))
                 (LETT #6# (CDR #6#) . #9#) (GO G190) G191 (EXIT NIL)))
           #11# (EXIT #5#))
          (LETT |y|
                (SPADCALL (LENGTH |rowList|) (LENGTH |colList|) (QREFELT $ 39))
                . #9#)
          (SEQ (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #9#)
               (LETT #4# (SPADCALL |y| (QREFELT $ 12)) . #9#)
               (LETT |ei| NIL . #9#) (LETT #3# |rowList| . #9#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |ei| (CAR #3#) . #9#) NIL)
                     (> |i| #4#))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #9#)
                      (LETT #2# (SPADCALL |y| (QREFELT $ 14)) . #9#)
                      (LETT |ej| NIL . #9#) (LETT #1# |colList| . #9#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |ej| (CAR #1#) . #9#) NIL)
                            (> |j| #2#))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |y| |i| |j|
                                  (SPADCALL |x| |ei| |ej| (QREFELT $ 15))
                                  (QREFELT $ 40))))
                      (LETT #1# (PROG1 (CDR #1#) (LETT |j| (+ |j| 1) . #9#))
                            . #9#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT #3# (PROG1 (CDR #3#) (LETT |i| (+ |i| 1) . #9#)) . #9#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;check_seg|
        ((|s| |Segment| (|Integer|)) (|lb| |Integer|) (|ub| |Integer|)
         ($ |NonNegativeInteger|))
        (SPROG
         ((|cc| (|NonNegativeInteger|)) (|ii| (|Integer|)) (|i2| (|Integer|))
          (|i1| (|Integer|)))
         (SEQ
          (LETT |ii| (SPADCALL |s| (QREFELT $ 47)) . #1=(|ARR2CAT-;check_seg|))
          (LETT |i1| (SPADCALL |s| (QREFELT $ 48)) . #1#)
          (LETT |i2| (SPADCALL |s| (QREFELT $ 49)) . #1#)
          (COND
           ((SPADCALL |ii| 0 (QREFELT $ 32))
            (COND
             ((< (+ |i2| 1) |i1|) (EXIT (|error| #2="check_seg: bad indices")))
             ((< |ii| 0) (COND ((< (+ |i1| 1) |i2|) (EXIT (|error| #2#)))))))
           ((< |ii| 0) (COND ((< (+ |i1| 1) |i2|) (EXIT (|error| #2#))))))
          (COND
           ((SPADCALL |i1| |i2| (QREFELT $ 32))
            (COND ((SPADCALL |ii| 0 (QREFELT $ 32)) (EXIT 0))
                  ((SPADCALL |i2| |i1| (QREFELT $ 32))
                   (COND ((< |ii| 0) (EXIT 0))))))
           ((SPADCALL |i2| |i1| (QREFELT $ 32)) (COND ((< |ii| 0) (EXIT 0)))))
          (EXIT
           (COND
            ((< 0 |ii|)
             (COND
              ((< (+ |i2| 1) |i1|) (|error| "check_seg: index out of range"))
              (#3='T
               (SEQ (LETT |cc| (+ (- |i2| |i1|) |ii|) . #1#)
                    (EXIT
                     (COND ((< |cc| |ii|) |cc|)
                           ((OR (< |i1| |lb|) (< |ub| |i2|))
                            (|error| "check_seg: index out of range"))
                           (#4='T
                            (COND ((EQL |ii| 1) |cc|)
                                  (#3# (QUOTIENT2 |cc| |ii|))))))))))
            ((< |ii| 0)
             (SEQ (LETT |ii| (- |ii|) . #1#)
                  (COND
                   ((OR (OR (< (+ |i1| 1) |i2|) (< |i2| |lb|)) (< |ub| |i1|))
                    (EXIT (|error| "check_seg: index out of range"))))
                  (LETT |cc| (+ (- |i1| |i2|) |ii|) . #1#)
                  (EXIT
                   (COND ((< |cc| |ii|) |cc|)
                         ((OR (< |i2| |lb|) (< |ub| |i1|))
                          (|error| "check_seg: index out of range"))
                         (#4#
                          (COND ((EQL |ii| 1) |cc|)
                                (#3# (QUOTIENT2 |cc| |ii|))))))))
            (#3# (|error| "chec_seg: zero increment"))))))) 

(SDEFUN |ARR2CAT-;elt;SLSS;17|
        ((|x| S) (|rowList| |List| (|Integer|)) (|sc| |Segment| (|Integer|))
         ($ S))
        (SPROG
         ((#1=#:G945 NIL) (|j| NIL) (#2=#:G946 NIL) (#3=#:G947 NIL) (|l| NIL)
          (#4=#:G943 NIL) (|i| NIL) (#5=#:G944 NIL) (|k| NIL) (|y| (S))
          (|nc| (|NonNegativeInteger|)) (|nr| (|NonNegativeInteger|))
          (|ic| (|Integer|)) (|uc| (|Integer|)) (|lc| (|Integer|)))
         (SEQ
          (LETT |lc| (SPADCALL |sc| (QREFELT $ 48))
                . #6=(|ARR2CAT-;elt;SLSS;17|))
          (LETT |uc| (SPADCALL |sc| (QREFELT $ 49)) . #6#)
          (LETT |ic| (SPADCALL |sc| (QREFELT $ 47)) . #6#)
          (LETT |nr| (LENGTH |rowList|) . #6#)
          (LETT |nc|
                (|ARR2CAT-;check_seg| |sc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $)
                . #6#)
          (LETT |y| (SPADCALL |nr| |nc| (QREFELT $ 39)) . #6#)
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (SEQ (LETT |k| NIL . #6#) (LETT #5# |rowList| . #6#)
               (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #6#)
               (LETT #4# (SPADCALL |y| (QREFELT $ 12)) . #6#) G190
               (COND
                ((OR (> |i| #4#) (ATOM #5#)
                     (PROGN (LETT |k| (CAR #5#) . #6#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |l| |lc| . #6#) (LETT #3# |uc| . #6#)
                      (LETT #2# |ic| . #6#)
                      (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #6#)
                      (LETT #1# (SPADCALL |y| (QREFELT $ 14)) . #6#) G190
                      (COND
                       ((OR (> |j| #1#)
                            (IF (MINUSP #2#)
                                (< |l| #3#)
                                (> |l| #3#)))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |y| |i| |j|
                                  (SPADCALL |x| |k| |l| (QREFELT $ 15))
                                  (QREFELT $ 40))))
                      (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| #2#) . #6#))
                            . #6#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT #5# (CDR #5#) . #6#)) . #6#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;elt;SSLS;18|
        ((|x| S) (|sr| |Segment| (|Integer|)) (|colList| |List| (|Integer|))
         ($ S))
        (SPROG
         ((#1=#:G955 NIL) (|j| NIL) (#2=#:G956 NIL) (|l| NIL) (#3=#:G952 NIL)
          (|i| NIL) (#4=#:G953 NIL) (#5=#:G954 NIL) (|k| NIL) (|y| (S))
          (|nc| (|NonNegativeInteger|)) (|nr| (|NonNegativeInteger|))
          (|ir| (|Integer|)) (|ur| (|Integer|)) (|lr| (|Integer|)))
         (SEQ
          (LETT |lr| (SPADCALL |sr| (QREFELT $ 48))
                . #6=(|ARR2CAT-;elt;SSLS;18|))
          (LETT |ur| (SPADCALL |sr| (QREFELT $ 49)) . #6#)
          (LETT |ir| (SPADCALL |sr| (QREFELT $ 47)) . #6#)
          (LETT |nr|
                (|ARR2CAT-;check_seg| |sr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $)
                . #6#)
          (LETT |nc| (LENGTH |colList|) . #6#)
          (LETT |y| (SPADCALL |nr| |nc| (QREFELT $ 39)) . #6#)
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (SEQ (LETT |k| |lr| . #6#) (LETT #5# |ur| . #6#)
               (LETT #4# |ir| . #6#)
               (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #6#)
               (LETT #3# (SPADCALL |y| (QREFELT $ 12)) . #6#) G190
               (COND
                ((OR (> |i| #3#)
                     (IF (MINUSP #4#)
                         (< |k| #5#)
                         (> |k| #5#)))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |l| NIL . #6#) (LETT #2# |colList| . #6#)
                      (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #6#)
                      (LETT #1# (SPADCALL |y| (QREFELT $ 14)) . #6#) G190
                      (COND
                       ((OR (> |j| #1#) (ATOM #2#)
                            (PROGN (LETT |l| (CAR #2#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |y| |i| |j|
                                  (SPADCALL |x| |k| |l| (QREFELT $ 15))
                                  (QREFELT $ 40))))
                      (LETT |j| (PROG1 (+ |j| 1) (LETT #2# (CDR #2#) . #6#))
                            . #6#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| #4#) . #6#)) . #6#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;elt;S2SS;19|
        ((|x| S) (|sr| |Segment| (|Integer|)) (|sc| |Segment| (|Integer|))
         ($ S))
        (SPROG
         ((#1=#:G964 NIL) (|j| NIL) (#2=#:G965 NIL) (#3=#:G966 NIL) (|l| NIL)
          (#4=#:G961 NIL) (|i| NIL) (#5=#:G962 NIL) (#6=#:G963 NIL) (|k| NIL)
          (|y| (S)) (|nc| #7=(|NonNegativeInteger|)) (|nr| #7#)
          (|ic| #8=(|Integer|)) (|ir| #8#) (|uc| #9=(|Integer|))
          (|lc| #10=(|Integer|)) (|ur| #9#) (|lr| #10#))
         (SEQ
          (LETT |lr| (SPADCALL |sr| (QREFELT $ 48))
                . #11=(|ARR2CAT-;elt;S2SS;19|))
          (LETT |ur| (SPADCALL |sr| (QREFELT $ 49)) . #11#)
          (LETT |lc| (SPADCALL |sc| (QREFELT $ 48)) . #11#)
          (LETT |uc| (SPADCALL |sc| (QREFELT $ 49)) . #11#)
          (LETT |ir| (SPADCALL |sr| (QREFELT $ 47)) . #11#)
          (LETT |ic| (SPADCALL |sc| (QREFELT $ 47)) . #11#)
          (COND
           ((EQL |ir| 1)
            (COND
             ((EQL |ic| 1)
              (EXIT (SPADCALL |x| |lr| |ur| |lc| |uc| (QREFELT $ 52)))))))
          (LETT |nr|
                (|ARR2CAT-;check_seg| |sr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $)
                . #11#)
          (LETT |nc|
                (|ARR2CAT-;check_seg| |sc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $)
                . #11#)
          (LETT |y| (SPADCALL |nr| |nc| (QREFELT $ 39)) . #11#)
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (SEQ (LETT |k| |lr| . #11#) (LETT #6# |ur| . #11#)
               (LETT #5# |ir| . #11#)
               (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #11#)
               (LETT #4# (SPADCALL |y| (QREFELT $ 12)) . #11#) G190
               (COND
                ((OR (> |i| #4#)
                     (IF (MINUSP #5#)
                         (< |k| #6#)
                         (> |k| #6#)))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |l| |lc| . #11#) (LETT #3# |uc| . #11#)
                      (LETT #2# |ic| . #11#)
                      (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #11#)
                      (LETT #1# (SPADCALL |y| (QREFELT $ 14)) . #11#) G190
                      (COND
                       ((OR (> |j| #1#)
                            (IF (MINUSP #2#)
                                (< |l| #3#)
                                (> |l| #3#)))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |y| |i| |j|
                                  (SPADCALL |x| |k| |l| (QREFELT $ 15))
                                  (QREFELT $ 40))))
                      (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| #2#) . #11#))
                            . #11#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| #5#) . #11#))
                     . #11#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;check_segs|
        ((|ls| |List| (|Segment| (|Integer|))) (|lb| |Integer|)
         (|ub| |Integer|) ($ |NonNegativeInteger|))
        (SPROG ((|res| (|NonNegativeInteger|)) (#1=#:G970 NIL) (|s| NIL))
               (SEQ (LETT |res| 0 . #2=(|ARR2CAT-;check_segs|))
                    (SEQ (LETT |s| NIL . #2#) (LETT #1# |ls| . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |s| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (+ |res|
                                    (|ARR2CAT-;check_seg| |s| |lb| |ub| $))
                                 . #2#)))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |ARR2CAT-;elt;SILS;21|
        ((|x| S) (|row| |Integer|) (|lsc| |List| (|Segment| (|Integer|)))
         ($ S))
        (SPROG
         ((|j| (|Integer|)) (#1=#:G978 NIL) (#2=#:G979 NIL) (|l| NIL)
          (#3=#:G977 NIL) (|sc| NIL) (|y| (S)) (|nc| (|NonNegativeInteger|)))
         (SEQ
          (LETT |nc|
                (|ARR2CAT-;check_segs| |lsc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $)
                . #4=(|ARR2CAT-;elt;SILS;21|))
          (LETT |y| (SPADCALL 1 |nc| (QREFELT $ 39)) . #4#)
          (EXIT
           (COND ((EQL |nc| 0) |y|)
                 ('T
                  (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #4#)
                       (SEQ (LETT |sc| NIL . #4#) (LETT #3# |lsc| . #4#) G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |sc| (CAR #3#) . #4#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ
                               (LETT |l| (SPADCALL |sc| (QREFELT $ 48)) . #4#)
                               (LETT #2# (SPADCALL |sc| (QREFELT $ 49)) . #4#)
                               (LETT #1# (SPADCALL |sc| (QREFELT $ 47)) . #4#)
                               G190
                               (COND
                                ((IF (MINUSP #1#)
                                     (< |l| #2#)
                                     (> |l| #2#))
                                 (GO G191)))
                               (SEQ
                                (SPADCALL |y| 1 |j|
                                          (SPADCALL |x| |row| |l|
                                                    (QREFELT $ 15))
                                          (QREFELT $ 40))
                                (EXIT (LETT |j| (+ |j| 1) . #4#)))
                               (LETT |l| (+ |l| #1#) . #4#) (GO G190) G191
                               (EXIT NIL))))
                            (LETT #3# (CDR #3#) . #4#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |y|)))))))) 

(SDEFUN |ARR2CAT-;elt;SLIS;22|
        ((|x| S) (|lsr| |List| (|Segment| (|Integer|))) (|col| |Integer|)
         ($ S))
        (SPROG
         ((|i| (|Integer|)) (#1=#:G987 NIL) (#2=#:G988 NIL) (|k| NIL)
          (#3=#:G986 NIL) (|sr| NIL) (|y| (S)) (|nr| (|NonNegativeInteger|)))
         (SEQ
          (LETT |nr|
                (|ARR2CAT-;check_segs| |lsr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $)
                . #4=(|ARR2CAT-;elt;SLIS;22|))
          (LETT |y| (SPADCALL |nr| 1 (QREFELT $ 39)) . #4#)
          (EXIT
           (COND ((EQL |nr| 0) |y|)
                 ('T
                  (SEQ (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #4#)
                       (SEQ (LETT |sr| NIL . #4#) (LETT #3# |lsr| . #4#) G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |sr| (CAR #3#) . #4#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ
                               (LETT |k| (SPADCALL |sr| (QREFELT $ 48)) . #4#)
                               (LETT #2# (SPADCALL |sr| (QREFELT $ 49)) . #4#)
                               (LETT #1# (SPADCALL |sr| (QREFELT $ 47)) . #4#)
                               G190
                               (COND
                                ((IF (MINUSP #1#)
                                     (< |k| #2#)
                                     (> |k| #2#))
                                 (GO G191)))
                               (SEQ
                                (SPADCALL |y| |i| 1
                                          (SPADCALL |x| |k| |col|
                                                    (QREFELT $ 15))
                                          (QREFELT $ 40))
                                (EXIT (LETT |i| (+ |i| 1) . #4#)))
                               (LETT |k| (+ |k| #1#) . #4#) (GO G190) G191
                               (EXIT NIL))))
                            (LETT #3# (CDR #3#) . #4#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |y|)))))))) 

(SDEFUN |ARR2CAT-;elt;SSLS;23|
        ((|x| S) (|sr| |Segment| (|Integer|))
         (|lsc| |List| (|Segment| (|Integer|))) ($ S))
        (SPROG
         ((|j| (|Integer|)) (#1=#:G998 NIL) (|i| NIL) (#2=#:G999 NIL)
          (#3=#:G1000 NIL) (|k| NIL) (#4=#:G996 NIL) (#5=#:G997 NIL) (|l| NIL)
          (#6=#:G995 NIL) (|sc| NIL) (|y| (S)) (|nc| (|NonNegativeInteger|))
          (|nr| (|NonNegativeInteger|)) (|ir| (|Integer|)) (|ur| (|Integer|))
          (|lr| (|Integer|)))
         (SEQ
          (LETT |lr| (SPADCALL |sr| (QREFELT $ 48))
                . #7=(|ARR2CAT-;elt;SSLS;23|))
          (LETT |ur| (SPADCALL |sr| (QREFELT $ 49)) . #7#)
          (LETT |ir| (SPADCALL |sr| (QREFELT $ 47)) . #7#)
          (LETT |nr|
                (|ARR2CAT-;check_seg| |sr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $)
                . #7#)
          (LETT |nc|
                (|ARR2CAT-;check_segs| |lsc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $)
                . #7#)
          (LETT |y| (SPADCALL |nr| |nc| (QREFELT $ 39)) . #7#)
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #7#)
          (SEQ (LETT |sc| NIL . #7#) (LETT #6# |lsc| . #7#) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |sc| (CAR #6#) . #7#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |l| (SPADCALL |sc| (QREFELT $ 48)) . #7#)
                      (LETT #5# (SPADCALL |sc| (QREFELT $ 49)) . #7#)
                      (LETT #4# (SPADCALL |sc| (QREFELT $ 47)) . #7#) G190
                      (COND
                       ((IF (MINUSP #4#)
                            (< |l| #5#)
                            (> |l| #5#))
                        (GO G191)))
                      (SEQ
                       (SEQ (LETT |k| |lr| . #7#) (LETT #3# |ur| . #7#)
                            (LETT #2# |ir| . #7#)
                            (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #7#)
                            (LETT #1# (SPADCALL |y| (QREFELT $ 12)) . #7#) G190
                            (COND
                             ((OR (> |i| #1#)
                                  (IF (MINUSP #2#)
                                      (< |k| #3#)
                                      (> |k| #3#)))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL |y| |i| |j|
                                        (SPADCALL |x| |k| |l| (QREFELT $ 15))
                                        (QREFELT $ 40))))
                            (LETT |i|
                                  (PROG1 (+ |i| 1)
                                    (LETT |k| (+ |k| #2#) . #7#))
                                  . #7#)
                            (GO G190) G191 (EXIT NIL))
                       (EXIT (LETT |j| (+ |j| 1) . #7#)))
                      (LETT |l| (+ |l| #4#) . #7#) (GO G190) G191 (EXIT NIL))))
               (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;elt;SLSS;24|
        ((|x| S) (|lsr| |List| (|Segment| (|Integer|)))
         (|sc| |Segment| (|Integer|)) ($ S))
        (SPROG
         ((|i| (|Integer|)) (#1=#:G1010 NIL) (|j| NIL) (#2=#:G1011 NIL)
          (#3=#:G1012 NIL) (|l| NIL) (#4=#:G1008 NIL) (#5=#:G1009 NIL)
          (|k| NIL) (#6=#:G1007 NIL) (|sr| NIL) (|y| (S))
          (|nc| (|NonNegativeInteger|)) (|nr| (|NonNegativeInteger|))
          (|ic| (|Integer|)) (|uc| (|Integer|)) (|lc| (|Integer|)))
         (SEQ
          (LETT |lc| (SPADCALL |sc| (QREFELT $ 48))
                . #7=(|ARR2CAT-;elt;SLSS;24|))
          (LETT |uc| (SPADCALL |sc| (QREFELT $ 49)) . #7#)
          (LETT |ic| (SPADCALL |sc| (QREFELT $ 47)) . #7#)
          (LETT |nr|
                (|ARR2CAT-;check_segs| |lsr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $)
                . #7#)
          (LETT |nc|
                (|ARR2CAT-;check_seg| |sc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $)
                . #7#)
          (LETT |y| (SPADCALL |nr| |nc| (QREFELT $ 39)) . #7#)
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #7#)
          (SEQ (LETT |sr| NIL . #7#) (LETT #6# |lsr| . #7#) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |sr| (CAR #6#) . #7#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |k| (SPADCALL |sr| (QREFELT $ 48)) . #7#)
                      (LETT #5# (SPADCALL |sr| (QREFELT $ 49)) . #7#)
                      (LETT #4# (SPADCALL |sr| (QREFELT $ 47)) . #7#) G190
                      (COND
                       ((IF (MINUSP #4#)
                            (< |k| #5#)
                            (> |k| #5#))
                        (GO G191)))
                      (SEQ
                       (SEQ (LETT |l| |lc| . #7#) (LETT #3# |uc| . #7#)
                            (LETT #2# |ic| . #7#)
                            (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #7#)
                            (LETT #1# (SPADCALL |y| (QREFELT $ 14)) . #7#) G190
                            (COND
                             ((OR (> |j| #1#)
                                  (IF (MINUSP #2#)
                                      (< |l| #3#)
                                      (> |l| #3#)))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL |y| |i| |j|
                                        (SPADCALL |x| |k| |l| (QREFELT $ 15))
                                        (QREFELT $ 40))))
                            (LETT |j|
                                  (PROG1 (+ |j| 1)
                                    (LETT |l| (+ |l| #2#) . #7#))
                                  . #7#)
                            (GO G190) G191 (EXIT NIL))
                       (EXIT (LETT |i| (+ |i| 1) . #7#)))
                      (LETT |k| (+ |k| #4#) . #7#) (GO G190) G191 (EXIT NIL))))
               (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;elt;S2LS;25|
        ((|x| S) (|lsr| |List| (|Segment| (|Integer|)))
         (|lsc| |List| (|Segment| (|Integer|))) ($ S))
        (SPROG
         ((|i| (|Integer|)) (|j| (|Integer|)) (#1=#:G1026 NIL) (#2=#:G1027 NIL)
          (|l| NIL) (#3=#:G1025 NIL) (|sc| NIL) (#4=#:G1023 NIL)
          (#5=#:G1024 NIL) (|k| NIL) (|ir| (|Integer|)) (|ur| (|Integer|))
          (|lr| (|Integer|)) (#6=#:G1022 NIL) (|sr| NIL) (|y| (S))
          (|nc| #7=(|NonNegativeInteger|)) (|nr| #7#))
         (SEQ
          (LETT |nr|
                (|ARR2CAT-;check_segs| |lsr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $)
                . #8=(|ARR2CAT-;elt;S2LS;25|))
          (LETT |nc|
                (|ARR2CAT-;check_segs| |lsc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $)
                . #8#)
          (LETT |y| (SPADCALL |nr| |nc| (QREFELT $ 39)) . #8#)
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #8#)
          (SEQ (LETT |sr| NIL . #8#) (LETT #6# |lsr| . #8#) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |sr| (CAR #6#) . #8#) NIL))
                 (GO G191)))
               (SEQ (LETT |lr| (SPADCALL |sr| (QREFELT $ 48)) . #8#)
                    (LETT |ur| (SPADCALL |sr| (QREFELT $ 49)) . #8#)
                    (LETT |ir| (SPADCALL |sr| (QREFELT $ 47)) . #8#)
                    (EXIT
                     (SEQ (LETT |k| |lr| . #8#) (LETT #5# |ur| . #8#)
                          (LETT #4# |ir| . #8#) G190
                          (COND
                           ((IF (MINUSP #4#)
                                (< |k| #5#)
                                (> |k| #5#))
                            (GO G191)))
                          (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #8#)
                               (SEQ (LETT |sc| NIL . #8#)
                                    (LETT #3# |lsc| . #8#) G190
                                    (COND
                                     ((OR (ATOM #3#)
                                          (PROGN
                                           (LETT |sc| (CAR #3#) . #8#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SEQ
                                       (LETT |l| (SPADCALL |sc| (QREFELT $ 48))
                                             . #8#)
                                       (LETT #2# (SPADCALL |sc| (QREFELT $ 49))
                                             . #8#)
                                       (LETT #1# (SPADCALL |sc| (QREFELT $ 47))
                                             . #8#)
                                       G190
                                       (COND
                                        ((IF (MINUSP #1#)
                                             (< |l| #2#)
                                             (> |l| #2#))
                                         (GO G191)))
                                       (SEQ
                                        (SPADCALL |y| |i| |j|
                                                  (SPADCALL |x| |k| |l|
                                                            (QREFELT $ 15))
                                                  (QREFELT $ 40))
                                        (EXIT (LETT |j| (+ |j| 1) . #8#)))
                                       (LETT |l| (+ |l| #1#) . #8#) (GO G190)
                                       G191 (EXIT NIL))))
                                    (LETT #3# (CDR #3#) . #8#) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (LETT |i| (+ |i| 1) . #8#)))
                          (LETT |k| (+ |k| #4#) . #8#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #6# (CDR #6#) . #8#) (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;rowSlice;SS;26| ((|x| S) ($ |Segment| (|Integer|)))
        (SPADCALL (SPADCALL |x| (QREFELT $ 11)) (SPADCALL |x| (QREFELT $ 12))
                  (QREFELT $ 60))) 

(SDEFUN |ARR2CAT-;colSlice;SS;27| ((|x| S) ($ |Segment| (|Integer|)))
        (SPADCALL (SPADCALL |x| (QREFELT $ 13)) (SPADCALL |x| (QREFELT $ 14))
                  (QREFELT $ 60))) 

(SDEFUN |ARR2CAT-;setelt!;SIL2S;28|
        ((|x| S) (|row| |Integer|) (|colList| |List| (|Integer|)) (|y| S)
         ($ S))
        (SPROG
         ((#1=#:G1042 NIL) (|ej| NIL) (#2=#:G1043 NIL) (|j| NIL)
          (|rowiy| (|Integer|)) (#3=#:G1040 NIL) (#4=#:G1041 NIL))
         (SEQ
          (COND
           ((OR (< |row| (SPADCALL |x| (QREFELT $ 11)))
                (SPADCALL |row| (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 32)))
            (|error| "setelt!: index out of range"))
           ('T
            (SEQ
             (SEQ
              (EXIT
               (SEQ (LETT |ej| NIL . #5=(|ARR2CAT-;setelt!;SIL2S;28|))
                    (LETT #4# |colList| . #5#) G190
                    (COND
                     ((OR (ATOM #4#) (PROGN (LETT |ej| (CAR #4#) . #5#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((OR (< |ej| (SPADCALL |x| (QREFELT $ 13)))
                            (SPADCALL |ej| (SPADCALL |x| (QREFELT $ 14))
                                      (QREFELT $ 32)))
                        (PROGN
                         (LETT #3# (|error| "setelt!: index out of range")
                               . #5#)
                         (GO #6=#:G1034))))))
                    (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL)))
              #6# (EXIT #3#))
             (COND
              ((OR (SPADCALL (SPADCALL |y| (QREFELT $ 21)) 1 (QREFELT $ 63))
                   (SPADCALL (LENGTH |colList|) (SPADCALL |y| (QREFELT $ 22))
                             (QREFELT $ 63)))
               (EXIT (|error| "setelt!: matrix has bad dimensions"))))
             (LETT |rowiy| (SPADCALL |y| (QREFELT $ 11)) . #5#)
             (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #5#)
                  (LETT #2# (SPADCALL |y| (QREFELT $ 14)) . #5#)
                  (LETT |ej| NIL . #5#) (LETT #1# |colList| . #5#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |ej| (CAR #1#) . #5#) NIL)
                        (> |j| #2#))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |x| |row| |ej|
                              (SPADCALL |y| |rowiy| |j| (QREFELT $ 15))
                              (QREFELT $ 40))))
                  (LETT #1# (PROG1 (CDR #1#) (LETT |j| (+ |j| 1) . #5#)) . #5#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT |y|))))))) 

(SDEFUN |ARR2CAT-;setelt!;SLI2S;29|
        ((|x| S) (|rowList| |List| (|Integer|)) (|col| |Integer|) (|y| S)
         ($ S))
        (SPROG
         ((#1=#:G1056 NIL) (|ei| NIL) (#2=#:G1057 NIL) (|i| NIL)
          (|coliy| (|Integer|)) (#3=#:G1054 NIL) (#4=#:G1055 NIL))
         (SEQ
          (SEQ
           (EXIT
            (SEQ (LETT |ei| NIL . #5=(|ARR2CAT-;setelt!;SLI2S;29|))
                 (LETT #4# |rowList| . #5#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |ei| (CAR #4#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (< |ei| (SPADCALL |x| (QREFELT $ 11)))
                         (SPADCALL |ei| (SPADCALL |x| (QREFELT $ 12))
                                   (QREFELT $ 32)))
                     (PROGN
                      (LETT #3# (|error| "setelt!: index out of range") . #5#)
                      (GO #6=#:G1046))))))
                 (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL)))
           #6# (EXIT #3#))
          (COND
           ((OR (< |col| (SPADCALL |x| (QREFELT $ 13)))
                (SPADCALL |col| (SPADCALL |x| (QREFELT $ 14)) (QREFELT $ 32)))
            (EXIT (|error| "setelt!: index out of range"))))
          (COND
           ((OR
             (SPADCALL (LENGTH |rowList|) (SPADCALL |y| (QREFELT $ 21))
                       (QREFELT $ 63))
             (SPADCALL (SPADCALL |y| (QREFELT $ 22)) 1 (QREFELT $ 63)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (LETT |coliy| (SPADCALL |y| (QREFELT $ 13)) . #5#)
          (SEQ (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #5#)
               (LETT #2# (SPADCALL |y| (QREFELT $ 12)) . #5#)
               (LETT |ei| NIL . #5#) (LETT #1# |rowList| . #5#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |ei| (CAR #1#) . #5#) NIL)
                     (> |i| #2#))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |x| |ei| |col|
                           (SPADCALL |y| |i| |coliy| (QREFELT $ 15))
                           (QREFELT $ 40))))
               (LETT #1# (PROG1 (CDR #1#) (LETT |i| (+ |i| 1) . #5#)) . #5#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;S2L2S;30|
        ((|x| S) (|rowList| |List| (|Integer|)) (|colList| |List| (|Integer|))
         (|y| S) ($ S))
        (SPROG
         ((#1=#:G1076 NIL) (|ej| NIL) (#2=#:G1077 NIL) (|j| NIL)
          (#3=#:G1074 NIL) (|ei| NIL) (#4=#:G1075 NIL) (|i| NIL)
          (#5=#:G1070 NIL) (#6=#:G1073 NIL) (#7=#:G1071 NIL) (#8=#:G1072 NIL))
         (SEQ
          (SEQ
           (EXIT
            (SEQ (LETT |ei| NIL . #9=(|ARR2CAT-;setelt!;S2L2S;30|))
                 (LETT #8# |rowList| . #9#) G190
                 (COND
                  ((OR (ATOM #8#) (PROGN (LETT |ei| (CAR #8#) . #9#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (< |ei| (SPADCALL |x| (QREFELT $ 11)))
                         (SPADCALL |ei| (SPADCALL |x| (QREFELT $ 12))
                                   (QREFELT $ 32)))
                     (PROGN
                      (LETT #7# (|error| "setelt!: index out of range") . #9#)
                      (GO #10=#:G1060))))))
                 (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL)))
           #10# (EXIT #7#))
          (SEQ
           (EXIT
            (SEQ (LETT |ej| NIL . #9#) (LETT #6# |colList| . #9#) G190
                 (COND
                  ((OR (ATOM #6#) (PROGN (LETT |ej| (CAR #6#) . #9#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (< |ej| (SPADCALL |x| (QREFELT $ 13)))
                         (SPADCALL |ej| (SPADCALL |x| (QREFELT $ 14))
                                   (QREFELT $ 32)))
                     (PROGN
                      (LETT #5# (|error| "setelt!: index out of range") . #9#)
                      (GO #11=#:G1063))))))
                 (LETT #6# (CDR #6#) . #9#) (GO G190) G191 (EXIT NIL)))
           #11# (EXIT #5#))
          (COND
           ((OR
             (SPADCALL (LENGTH |rowList|) (SPADCALL |y| (QREFELT $ 21))
                       (QREFELT $ 63))
             (SPADCALL (LENGTH |colList|) (SPADCALL |y| (QREFELT $ 22))
                       (QREFELT $ 63)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (SEQ (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #9#)
               (LETT #4# (SPADCALL |y| (QREFELT $ 12)) . #9#)
               (LETT |ei| NIL . #9#) (LETT #3# |rowList| . #9#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |ei| (CAR #3#) . #9#) NIL)
                     (> |i| #4#))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #9#)
                      (LETT #2# (SPADCALL |y| (QREFELT $ 14)) . #9#)
                      (LETT |ej| NIL . #9#) (LETT #1# |colList| . #9#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |ej| (CAR #1#) . #9#) NIL)
                            (> |j| #2#))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |x| |ei| |ej|
                                  (SPADCALL |y| |i| |j| (QREFELT $ 15))
                                  (QREFELT $ 40))))
                      (LETT #1# (PROG1 (CDR #1#) (LETT |j| (+ |j| 1) . #9#))
                            . #9#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT #3# (PROG1 (CDR #3#) (LETT |i| (+ |i| 1) . #9#)) . #9#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;S2S2S;31|
        ((|x| S) (|sr| |Segment| (|Integer|)) (|sc| |Segment| (|Integer|))
         (|y| S) ($ S))
        (SPROG
         ((#1=#:G1087 NIL) (|j| NIL) (#2=#:G1088 NIL) (#3=#:G1089 NIL)
          (|l| NIL) (#4=#:G1084 NIL) (|i| NIL) (#5=#:G1085 NIL)
          (#6=#:G1086 NIL) (|k| NIL) (|nc| #7=(|NonNegativeInteger|))
          (|nr| #7#) (|ic| #8=(|Integer|)) (|ir| #8#) (|uc| #9=(|Integer|))
          (|lc| #10=(|Integer|)) (|ur| #9#) (|lr| #10#))
         (SEQ
          (LETT |lr| (SPADCALL |sr| (QREFELT $ 48))
                . #11=(|ARR2CAT-;setelt!;S2S2S;31|))
          (LETT |ur| (SPADCALL |sr| (QREFELT $ 49)) . #11#)
          (LETT |lc| (SPADCALL |sc| (QREFELT $ 48)) . #11#)
          (LETT |uc| (SPADCALL |sc| (QREFELT $ 49)) . #11#)
          (LETT |ir| (SPADCALL |sr| (QREFELT $ 47)) . #11#)
          (LETT |ic| (SPADCALL |sc| (QREFELT $ 47)) . #11#)
          (LETT |nr|
                (|ARR2CAT-;check_seg| |sr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $)
                . #11#)
          (LETT |nc|
                (|ARR2CAT-;check_seg| |sc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $)
                . #11#)
          (COND
           ((OR (SPADCALL (SPADCALL |y| (QREFELT $ 21)) |nr| (QREFELT $ 67))
                (SPADCALL (SPADCALL |y| (QREFELT $ 22)) |nc| (QREFELT $ 67)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (SEQ (LETT |k| |lr| . #11#) (LETT #6# |ur| . #11#)
               (LETT #5# |ir| . #11#)
               (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #11#)
               (LETT #4# (SPADCALL |y| (QREFELT $ 12)) . #11#) G190
               (COND
                ((OR (> |i| #4#)
                     (IF (MINUSP #5#)
                         (< |k| #6#)
                         (> |k| #6#)))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |l| |lc| . #11#) (LETT #3# |uc| . #11#)
                      (LETT #2# |ic| . #11#)
                      (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #11#)
                      (LETT #1# (SPADCALL |y| (QREFELT $ 14)) . #11#) G190
                      (COND
                       ((OR (> |j| #1#)
                            (IF (MINUSP #2#)
                                (< |l| #3#)
                                (> |l| #3#)))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |x| |k| |l|
                                  (SPADCALL |y| |i| |j| (QREFELT $ 15))
                                  (QREFELT $ 40))))
                      (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| #2#) . #11#))
                            . #11#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| #5#) . #11#))
                     . #11#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;SLS2S;32|
        ((|x| S) (|rowList| |List| (|Integer|)) (|sc| |Segment| (|Integer|))
         (|y| S) ($ S))
        (SPROG
         ((#1=#:G1098 NIL) (|j| NIL) (#2=#:G1099 NIL) (#3=#:G1100 NIL)
          (|l| NIL) (#4=#:G1096 NIL) (|i| NIL) (#5=#:G1097 NIL) (|k| NIL)
          (|nc| (|NonNegativeInteger|)) (|nr| (|NonNegativeInteger|))
          (|ic| (|Integer|)) (|uc| (|Integer|)) (|lc| (|Integer|)))
         (SEQ
          (LETT |lc| (SPADCALL |sc| (QREFELT $ 48))
                . #6=(|ARR2CAT-;setelt!;SLS2S;32|))
          (LETT |uc| (SPADCALL |sc| (QREFELT $ 49)) . #6#)
          (LETT |ic| (SPADCALL |sc| (QREFELT $ 47)) . #6#)
          (LETT |nr| (LENGTH |rowList|) . #6#)
          (LETT |nc|
                (|ARR2CAT-;check_seg| |sc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $)
                . #6#)
          (COND
           ((OR (SPADCALL (SPADCALL |y| (QREFELT $ 21)) |nr| (QREFELT $ 67))
                (SPADCALL (SPADCALL |y| (QREFELT $ 22)) |nc| (QREFELT $ 67)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (SEQ (LETT |k| NIL . #6#) (LETT #5# |rowList| . #6#)
               (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #6#)
               (LETT #4# (SPADCALL |y| (QREFELT $ 12)) . #6#) G190
               (COND
                ((OR (> |i| #4#) (ATOM #5#)
                     (PROGN (LETT |k| (CAR #5#) . #6#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |l| |lc| . #6#) (LETT #3# |uc| . #6#)
                      (LETT #2# |ic| . #6#)
                      (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #6#)
                      (LETT #1# (SPADCALL |y| (QREFELT $ 14)) . #6#) G190
                      (COND
                       ((OR (> |j| #1#)
                            (IF (MINUSP #2#)
                                (< |l| #3#)
                                (> |l| #3#)))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |x| |k| |l|
                                  (SPADCALL |y| |i| |j| (QREFELT $ 15))
                                  (QREFELT $ 40))))
                      (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| #2#) . #6#))
                            . #6#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT #5# (CDR #5#) . #6#)) . #6#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;SSL2S;33|
        ((|x| S) (|sr| |Segment| (|Integer|)) (|colList| |List| (|Integer|))
         (|y| S) ($ S))
        (SPROG
         ((#1=#:G1110 NIL) (|j| NIL) (#2=#:G1111 NIL) (|l| NIL)
          (#3=#:G1107 NIL) (|i| NIL) (#4=#:G1108 NIL) (#5=#:G1109 NIL)
          (|k| NIL) (|nc| (|NonNegativeInteger|)) (|nr| (|NonNegativeInteger|))
          (|ir| (|Integer|)) (|ur| (|Integer|)) (|lr| (|Integer|)))
         (SEQ
          (LETT |lr| (SPADCALL |sr| (QREFELT $ 48))
                . #6=(|ARR2CAT-;setelt!;SSL2S;33|))
          (LETT |ur| (SPADCALL |sr| (QREFELT $ 49)) . #6#)
          (LETT |ir| (SPADCALL |sr| (QREFELT $ 47)) . #6#)
          (LETT |nr|
                (|ARR2CAT-;check_seg| |sr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $)
                . #6#)
          (LETT |nc| (LENGTH |colList|) . #6#)
          (COND
           ((OR (SPADCALL (SPADCALL |y| (QREFELT $ 21)) |nr| (QREFELT $ 67))
                (SPADCALL (SPADCALL |y| (QREFELT $ 22)) |nc| (QREFELT $ 67)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (SEQ (LETT |k| |lr| . #6#) (LETT #5# |ur| . #6#)
               (LETT #4# |ir| . #6#)
               (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #6#)
               (LETT #3# (SPADCALL |y| (QREFELT $ 12)) . #6#) G190
               (COND
                ((OR (> |i| #3#)
                     (IF (MINUSP #4#)
                         (< |k| #5#)
                         (> |k| #5#)))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |l| NIL . #6#) (LETT #2# |colList| . #6#)
                      (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #6#)
                      (LETT #1# (SPADCALL |y| (QREFELT $ 14)) . #6#) G190
                      (COND
                       ((OR (> |j| #1#) (ATOM #2#)
                            (PROGN (LETT |l| (CAR #2#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |x| |k| |l|
                                  (SPADCALL |y| |i| |j| (QREFELT $ 15))
                                  (QREFELT $ 40))))
                      (LETT |j| (PROG1 (+ |j| 1) (LETT #2# (CDR #2#) . #6#))
                            . #6#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| #4#) . #6#)) . #6#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;SIL2S;34|
        ((|x| S) (|row| |Integer|) (|lsc| |List| (|Segment| (|Integer|)))
         (|y| S) ($ S))
        (SPROG
         ((|j| (|Integer|)) (#1=#:G1121 NIL) (#2=#:G1122 NIL) (|l| NIL)
          (#3=#:G1120 NIL) (|sc| NIL) (|i| (|Integer|))
          (|nc| (|NonNegativeInteger|)))
         (SEQ
          (LETT |nc|
                (|ARR2CAT-;check_segs| |lsc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $)
                . #4=(|ARR2CAT-;setelt!;SIL2S;34|))
          (COND
           ((OR (SPADCALL (SPADCALL |y| (QREFELT $ 21)) 1 (QREFELT $ 67))
                (SPADCALL (SPADCALL |y| (QREFELT $ 22)) |nc| (QREFELT $ 67)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (EXIT
           (COND ((EQL |nc| 0) |y|)
                 ('T
                  (SEQ (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #4#)
                       (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #4#)
                       (SEQ (LETT |sc| NIL . #4#) (LETT #3# |lsc| . #4#) G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |sc| (CAR #3#) . #4#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ
                               (LETT |l| (SPADCALL |sc| (QREFELT $ 48)) . #4#)
                               (LETT #2# (SPADCALL |sc| (QREFELT $ 49)) . #4#)
                               (LETT #1# (SPADCALL |sc| (QREFELT $ 47)) . #4#)
                               G190
                               (COND
                                ((IF (MINUSP #1#)
                                     (< |l| #2#)
                                     (> |l| #2#))
                                 (GO G191)))
                               (SEQ
                                (SPADCALL |x| |row| |l|
                                          (SPADCALL |y| |i| |j| (QREFELT $ 15))
                                          (QREFELT $ 40))
                                (EXIT (LETT |j| (+ |j| 1) . #4#)))
                               (LETT |l| (+ |l| #1#) . #4#) (GO G190) G191
                               (EXIT NIL))))
                            (LETT #3# (CDR #3#) . #4#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |y|)))))))) 

(SDEFUN |ARR2CAT-;setelt!;SLI2S;35|
        ((|x| S) (|lsr| |List| (|Segment| (|Integer|))) (|col| |Integer|)
         (|y| S) ($ S))
        (SPROG
         ((|i| (|Integer|)) (#1=#:G1132 NIL) (#2=#:G1133 NIL) (|k| NIL)
          (#3=#:G1131 NIL) (|sr| NIL) (|j| (|Integer|))
          (|nr| (|NonNegativeInteger|)))
         (SEQ
          (LETT |nr|
                (|ARR2CAT-;check_segs| |lsr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $)
                . #4=(|ARR2CAT-;setelt!;SLI2S;35|))
          (COND
           ((OR (SPADCALL (SPADCALL |y| (QREFELT $ 21)) |nr| (QREFELT $ 67))
                (SPADCALL (SPADCALL |y| (QREFELT $ 22)) 1 (QREFELT $ 67)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (EXIT
           (COND ((EQL |nr| 0) |y|)
                 ('T
                  (SEQ (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #4#)
                       (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #4#)
                       (SEQ (LETT |sr| NIL . #4#) (LETT #3# |lsr| . #4#) G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |sr| (CAR #3#) . #4#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ
                               (LETT |k| (SPADCALL |sr| (QREFELT $ 48)) . #4#)
                               (LETT #2# (SPADCALL |sr| (QREFELT $ 49)) . #4#)
                               (LETT #1# (SPADCALL |sr| (QREFELT $ 47)) . #4#)
                               G190
                               (COND
                                ((IF (MINUSP #1#)
                                     (< |k| #2#)
                                     (> |k| #2#))
                                 (GO G191)))
                               (SEQ
                                (SPADCALL |x| |k| |col|
                                          (SPADCALL |y| |i| |j| (QREFELT $ 15))
                                          (QREFELT $ 40))
                                (EXIT (LETT |i| (+ |i| 1) . #4#)))
                               (LETT |k| (+ |k| #1#) . #4#) (GO G190) G191
                               (EXIT NIL))))
                            (LETT #3# (CDR #3#) . #4#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |y|)))))))) 

(SDEFUN |ARR2CAT-;setelt!;SSL2S;36|
        ((|x| S) (|sr| |Segment| (|Integer|))
         (|lsc| |List| (|Segment| (|Integer|))) (|y| S) ($ S))
        (SPROG
         ((|j| (|Integer|)) (#1=#:G1145 NIL) (|i| NIL) (#2=#:G1146 NIL)
          (#3=#:G1147 NIL) (|k| NIL) (#4=#:G1143 NIL) (#5=#:G1144 NIL)
          (|l| NIL) (#6=#:G1142 NIL) (|sc| NIL) (|nc| (|NonNegativeInteger|))
          (|nr| (|NonNegativeInteger|)) (|ir| (|Integer|)) (|ur| (|Integer|))
          (|lr| (|Integer|)))
         (SEQ
          (LETT |lr| (SPADCALL |sr| (QREFELT $ 48))
                . #7=(|ARR2CAT-;setelt!;SSL2S;36|))
          (LETT |ur| (SPADCALL |sr| (QREFELT $ 49)) . #7#)
          (LETT |ir| (SPADCALL |sr| (QREFELT $ 47)) . #7#)
          (LETT |nr|
                (|ARR2CAT-;check_seg| |sr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $)
                . #7#)
          (LETT |nc|
                (|ARR2CAT-;check_segs| |lsc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $)
                . #7#)
          (COND
           ((OR (SPADCALL (SPADCALL |y| (QREFELT $ 21)) |nr| (QREFELT $ 67))
                (SPADCALL (SPADCALL |y| (QREFELT $ 22)) |nc| (QREFELT $ 67)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #7#)
          (SEQ (LETT |sc| NIL . #7#) (LETT #6# |lsc| . #7#) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |sc| (CAR #6#) . #7#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |l| (SPADCALL |sc| (QREFELT $ 48)) . #7#)
                      (LETT #5# (SPADCALL |sc| (QREFELT $ 49)) . #7#)
                      (LETT #4# (SPADCALL |sc| (QREFELT $ 47)) . #7#) G190
                      (COND
                       ((IF (MINUSP #4#)
                            (< |l| #5#)
                            (> |l| #5#))
                        (GO G191)))
                      (SEQ
                       (SEQ (LETT |k| |lr| . #7#) (LETT #3# |ur| . #7#)
                            (LETT #2# |ir| . #7#)
                            (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #7#)
                            (LETT #1# (SPADCALL |y| (QREFELT $ 12)) . #7#) G190
                            (COND
                             ((OR (> |i| #1#)
                                  (IF (MINUSP #2#)
                                      (< |k| #3#)
                                      (> |k| #3#)))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL |x| |k| |l|
                                        (SPADCALL |y| |i| |j| (QREFELT $ 15))
                                        (QREFELT $ 40))))
                            (LETT |i|
                                  (PROG1 (+ |i| 1)
                                    (LETT |k| (+ |k| #2#) . #7#))
                                  . #7#)
                            (GO G190) G191 (EXIT NIL))
                       (EXIT (LETT |j| (+ |j| 1) . #7#)))
                      (LETT |l| (+ |l| #4#) . #7#) (GO G190) G191 (EXIT NIL))))
               (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;SLS2S;37|
        ((|x| S) (|lsr| |List| (|Segment| (|Integer|)))
         (|sc| |Segment| (|Integer|)) (|y| S) ($ S))
        (SPROG
         ((|i| (|Integer|)) (#1=#:G1159 NIL) (|j| NIL) (#2=#:G1160 NIL)
          (#3=#:G1161 NIL) (|l| NIL) (#4=#:G1157 NIL) (#5=#:G1158 NIL)
          (|k| NIL) (#6=#:G1156 NIL) (|sr| NIL) (|nc| (|NonNegativeInteger|))
          (|nr| (|NonNegativeInteger|)) (|ic| (|Integer|)) (|uc| (|Integer|))
          (|lc| (|Integer|)))
         (SEQ
          (LETT |lc| (SPADCALL |sc| (QREFELT $ 48))
                . #7=(|ARR2CAT-;setelt!;SLS2S;37|))
          (LETT |uc| (SPADCALL |sc| (QREFELT $ 49)) . #7#)
          (LETT |ic| (SPADCALL |sc| (QREFELT $ 47)) . #7#)
          (LETT |nr|
                (|ARR2CAT-;check_segs| |lsr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $)
                . #7#)
          (LETT |nc|
                (|ARR2CAT-;check_seg| |sc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $)
                . #7#)
          (COND
           ((OR (SPADCALL (SPADCALL |y| (QREFELT $ 21)) |nr| (QREFELT $ 67))
                (SPADCALL (SPADCALL |y| (QREFELT $ 22)) |nc| (QREFELT $ 67)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #7#)
          (SEQ (LETT |sr| NIL . #7#) (LETT #6# |lsr| . #7#) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |sr| (CAR #6#) . #7#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |k| (SPADCALL |sr| (QREFELT $ 48)) . #7#)
                      (LETT #5# (SPADCALL |sr| (QREFELT $ 49)) . #7#)
                      (LETT #4# (SPADCALL |sr| (QREFELT $ 47)) . #7#) G190
                      (COND
                       ((IF (MINUSP #4#)
                            (< |k| #5#)
                            (> |k| #5#))
                        (GO G191)))
                      (SEQ
                       (SEQ (LETT |l| |lc| . #7#) (LETT #3# |uc| . #7#)
                            (LETT #2# |ic| . #7#)
                            (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #7#)
                            (LETT #1# (SPADCALL |y| (QREFELT $ 14)) . #7#) G190
                            (COND
                             ((OR (> |j| #1#)
                                  (IF (MINUSP #2#)
                                      (< |l| #3#)
                                      (> |l| #3#)))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL |x| |k| |l|
                                        (SPADCALL |y| |i| |j| (QREFELT $ 15))
                                        (QREFELT $ 40))))
                            (LETT |j|
                                  (PROG1 (+ |j| 1)
                                    (LETT |l| (+ |l| #2#) . #7#))
                                  . #7#)
                            (GO G190) G191 (EXIT NIL))
                       (EXIT (LETT |i| (+ |i| 1) . #7#)))
                      (LETT |k| (+ |k| #4#) . #7#) (GO G190) G191 (EXIT NIL))))
               (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setelt!;S2L2S;38|
        ((|x| S) (|lsr| |List| (|Segment| (|Integer|)))
         (|lsc| |List| (|Segment| (|Integer|))) (|y| S) ($ S))
        (SPROG
         ((|i| (|Integer|)) (|j| (|Integer|)) (#1=#:G1177 NIL) (#2=#:G1178 NIL)
          (|l| NIL) (#3=#:G1176 NIL) (|sc| NIL) (#4=#:G1174 NIL)
          (#5=#:G1175 NIL) (|k| NIL) (|ir| (|Integer|)) (|ur| (|Integer|))
          (|lr| (|Integer|)) (#6=#:G1173 NIL) (|sr| NIL)
          (|nc| #7=(|NonNegativeInteger|)) (|nr| #7#))
         (SEQ
          (LETT |nr|
                (|ARR2CAT-;check_segs| |lsr| (SPADCALL |x| (QREFELT $ 11))
                 (SPADCALL |x| (QREFELT $ 12)) $)
                . #8=(|ARR2CAT-;setelt!;S2L2S;38|))
          (LETT |nc|
                (|ARR2CAT-;check_segs| |lsc| (SPADCALL |x| (QREFELT $ 13))
                 (SPADCALL |x| (QREFELT $ 14)) $)
                . #8#)
          (COND
           ((OR (SPADCALL (SPADCALL |y| (QREFELT $ 21)) |nr| (QREFELT $ 67))
                (SPADCALL (SPADCALL |y| (QREFELT $ 22)) |nc| (QREFELT $ 67)))
            (EXIT (|error| "setelt!: matrix has bad dimensions"))))
          (COND ((OR (EQL |nr| 0) (EQL |nc| 0)) (EXIT |y|)))
          (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #8#)
          (SEQ (LETT |sr| NIL . #8#) (LETT #6# |lsr| . #8#) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |sr| (CAR #6#) . #8#) NIL))
                 (GO G191)))
               (SEQ (LETT |lr| (SPADCALL |sr| (QREFELT $ 48)) . #8#)
                    (LETT |ur| (SPADCALL |sr| (QREFELT $ 49)) . #8#)
                    (LETT |ir| (SPADCALL |sr| (QREFELT $ 47)) . #8#)
                    (EXIT
                     (SEQ (LETT |k| |lr| . #8#) (LETT #5# |ur| . #8#)
                          (LETT #4# |ir| . #8#) G190
                          (COND
                           ((IF (MINUSP #4#)
                                (< |k| #5#)
                                (> |k| #5#))
                            (GO G191)))
                          (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #8#)
                               (SEQ (LETT |sc| NIL . #8#)
                                    (LETT #3# |lsc| . #8#) G190
                                    (COND
                                     ((OR (ATOM #3#)
                                          (PROGN
                                           (LETT |sc| (CAR #3#) . #8#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SEQ
                                       (LETT |l| (SPADCALL |sc| (QREFELT $ 48))
                                             . #8#)
                                       (LETT #2# (SPADCALL |sc| (QREFELT $ 49))
                                             . #8#)
                                       (LETT #1# (SPADCALL |sc| (QREFELT $ 47))
                                             . #8#)
                                       G190
                                       (COND
                                        ((IF (MINUSP #1#)
                                             (< |l| #2#)
                                             (> |l| #2#))
                                         (GO G191)))
                                       (SEQ
                                        (SPADCALL |x| |k| |l|
                                                  (SPADCALL |y| |i| |j|
                                                            (QREFELT $ 15))
                                                  (QREFELT $ 40))
                                        (EXIT (LETT |j| (+ |j| 1) . #8#)))
                                       (LETT |l| (+ |l| #1#) . #8#) (GO G190)
                                       G191 (EXIT NIL))))
                                    (LETT #3# (CDR #3#) . #8#) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (LETT |i| (+ |i| 1) . #8#)))
                          (LETT |k| (+ |k| #4#) . #8#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #6# (CDR #6#) . #8#) (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |ARR2CAT-;setsubMatrix!;S2I2S;39|
        ((|x| S) (|i1| |Integer|) (|j1| |Integer|) (|y| S) ($ S))
        (SPROG
         ((#1=#:G1189 NIL) (|j| NIL) (#2=#:G1190 NIL) (|l| NIL)
          (#3=#:G1187 NIL) (|i| NIL) (#4=#:G1188 NIL) (|k| NIL)
          (|j2| #5=(|Integer|)) (|i2| #5#))
         (SEQ
          (LETT |i2| (- (+ |i1| (SPADCALL |y| (QREFELT $ 21))) 1)
                . #6=(|ARR2CAT-;setsubMatrix!;S2I2S;39|))
          (LETT |j2| (- (+ |j1| (SPADCALL |y| (QREFELT $ 22))) 1) . #6#)
          (COND
           ((OR (< |i1| (SPADCALL |x| (QREFELT $ 11)))
                (SPADCALL |i2| (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 32)))
            (EXIT
             (|error|
              (SPADCALL "setsubMatrix!: inserted matrix too big, "
                        "use subMatrix to restrict it" (QREFELT $ 77))))))
          (COND
           ((OR (< |j1| (SPADCALL |x| (QREFELT $ 13)))
                (SPADCALL |j2| (SPADCALL |x| (QREFELT $ 14)) (QREFELT $ 32)))
            (EXIT
             (|error|
              (SPADCALL "setsubMatrix!: inserted matrix too big, "
                        "use subMatrix to restrict it" (QREFELT $ 77))))))
          (SEQ (LETT |k| |i1| . #6#) (LETT #4# |i2| . #6#)
               (LETT |i| (SPADCALL |y| (QREFELT $ 11)) . #6#)
               (LETT #3# (SPADCALL |y| (QREFELT $ 12)) . #6#) G190
               (COND ((OR (> |i| #3#) (> |k| #4#)) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |l| |j1| . #6#) (LETT #2# |j2| . #6#)
                      (LETT |j| (SPADCALL |y| (QREFELT $ 13)) . #6#)
                      (LETT #1# (SPADCALL |y| (QREFELT $ 14)) . #6#) G190
                      (COND ((OR (> |j| #1#) (> |l| #2#)) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |x| |k| |l|
                                  (SPADCALL |y| |i| |j| (QREFELT $ 15))
                                  (QREFELT $ 40))))
                      (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| 1) . #6#))
                            . #6#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #6#)) . #6#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |x|)))) 

(SDEFUN |ARR2CAT-;swapRows!;S2IS;40|
        ((|x| S) (|i1| |Integer|) (|i2| |Integer|) ($ S))
        (SPROG ((|r| (R)) (#1=#:G1200 NIL) (|j| NIL))
               (SEQ
                (COND
                 ((OR (< |i1| (SPADCALL |x| (QREFELT $ 11)))
                      (OR
                       (SPADCALL |i1| (SPADCALL |x| (QREFELT $ 12))
                                 (QREFELT $ 32))
                       (OR (< |i2| (SPADCALL |x| (QREFELT $ 11)))
                           (SPADCALL |i2| (SPADCALL |x| (QREFELT $ 12))
                                     (QREFELT $ 32)))))
                  (|error| "swapRows!: index out of range"))
                 ('T
                  (COND ((EQL |i1| |i2|) |x|)
                        ('T
                         (SEQ
                          (SEQ
                           (LETT |j| (SPADCALL |x| (QREFELT $ 13))
                                 . #2=(|ARR2CAT-;swapRows!;S2IS;40|))
                           (LETT #1# (SPADCALL |x| (QREFELT $ 14)) . #2#) G190
                           (COND ((> |j| #1#) (GO G191)))
                           (SEQ
                            (LETT |r| (SPADCALL |x| |i1| |j| (QREFELT $ 15))
                                  . #2#)
                            (SPADCALL |x| |i1| |j|
                                      (SPADCALL |x| |i2| |j| (QREFELT $ 15))
                                      (QREFELT $ 40))
                            (EXIT (SPADCALL |x| |i2| |j| |r| (QREFELT $ 40))))
                           (LETT |j| (+ |j| 1) . #2#) (GO G190) G191
                           (EXIT NIL))
                          (EXIT |x|))))))))) 

(SDEFUN |ARR2CAT-;swapColumns!;S2IS;41|
        ((|x| S) (|j1| |Integer|) (|j2| |Integer|) ($ S))
        (SPROG ((|r| (R)) (#1=#:G1210 NIL) (|i| NIL))
               (SEQ
                (COND
                 ((OR (< |j1| (SPADCALL |x| (QREFELT $ 13)))
                      (OR
                       (SPADCALL |j1| (SPADCALL |x| (QREFELT $ 14))
                                 (QREFELT $ 32))
                       (OR (< |j2| (SPADCALL |x| (QREFELT $ 13)))
                           (SPADCALL |j2| (SPADCALL |x| (QREFELT $ 14))
                                     (QREFELT $ 32)))))
                  (|error| "swapColumns!: index out of range"))
                 ('T
                  (COND ((EQL |j1| |j2|) |x|)
                        ('T
                         (SEQ
                          (SEQ
                           (LETT |i| (SPADCALL |x| (QREFELT $ 11))
                                 . #2=(|ARR2CAT-;swapColumns!;S2IS;41|))
                           (LETT #1# (SPADCALL |x| (QREFELT $ 12)) . #2#) G190
                           (COND ((> |i| #1#) (GO G191)))
                           (SEQ
                            (LETT |r| (SPADCALL |x| |i| |j1| (QREFELT $ 15))
                                  . #2#)
                            (SPADCALL |x| |i| |j1|
                                      (SPADCALL |x| |i| |j2| (QREFELT $ 15))
                                      (QREFELT $ 40))
                            (EXIT (SPADCALL |x| |i| |j2| |r| (QREFELT $ 40))))
                           (LETT |i| (+ |i| 1) . #2#) (GO G190) G191
                           (EXIT NIL))
                          (EXIT |x|))))))))) 

(SDEFUN |ARR2CAT-;transpose;2S;42| ((|x| S) ($ S))
        (SPROG
         ((#1=#:G1216 NIL) (|j| NIL) (#2=#:G1215 NIL) (|i| NIL) (|ans| (S)))
         (SEQ
          (LETT |ans|
                (SPADCALL (SPADCALL |x| (QREFELT $ 22))
                          (SPADCALL |x| (QREFELT $ 21)) (QREFELT $ 39))
                . #3=(|ARR2CAT-;transpose;2S;42|))
          (SEQ (LETT |i| (SPADCALL |ans| (QREFELT $ 11)) . #3#)
               (LETT #2# (SPADCALL |ans| (QREFELT $ 12)) . #3#) G190
               (COND ((> |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |ans| (QREFELT $ 13)) . #3#)
                      (LETT #1# (SPADCALL |ans| (QREFELT $ 14)) . #3#) G190
                      (COND ((> |j| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |ans| |i| |j|
                                  (SPADCALL |x| |j| |i| (QREFELT $ 15))
                                  (QREFELT $ 40))))
                      (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |ARR2CAT-;squareTop;2S;43| ((|x| S) ($ S))
        (SPROG
         ((#1=#:G1223 NIL) (|j| NIL) (#2=#:G1222 NIL) (|i| NIL) (|ans| (S))
          (|cols| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((< (SPADCALL |x| (QREFELT $ 21))
               (LETT |cols| (SPADCALL |x| (QREFELT $ 22))
                     . #3=(|ARR2CAT-;squareTop;2S;43|)))
            (|error| "squareTop: number of columns exceeds number of rows"))
           ('T
            (SEQ (LETT |ans| (SPADCALL |cols| |cols| (QREFELT $ 39)) . #3#)
                 (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 11)) . #3#)
                      (LETT #2# (- (+ (SPADCALL |x| (QREFELT $ 11)) |cols|) 1)
                            . #3#)
                      G190 (COND ((> |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 13)) . #3#)
                             (LETT #1# (SPADCALL |x| (QREFELT $ 14)) . #3#)
                             G190 (COND ((> |j| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |ans| |i| |j|
                                         (SPADCALL |x| |i| |j| (QREFELT $ 15))
                                         (QREFELT $ 40))))
                             (LETT |j| (+ |j| 1) . #3#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
                 (EXIT |ans|))))))) 

(SDEFUN |ARR2CAT-;horizConcat;3S;44| ((|x| S) (|y| S) ($ S))
        (SPADCALL (LIST |x| |y|) (QREFELT $ 84))) 

(SDEFUN |ARR2CAT-;horizConcat;LS;45| ((|la| |List| S) ($ S))
        (SPROG
         ((|l| (|Integer|)) (#1=#:G1238 NIL) (|j| NIL) (#2=#:G1237 NIL)
          (|a| NIL) (#3=#:G1236 NIL) (|i| NIL) (|ans| (S))
          (|nc| (|NonNegativeInteger|)) (#4=#:G1235 NIL)
          (|nr| (|NonNegativeInteger|)) (|a1| (S)))
         (SEQ
          (COND ((NULL |la|) (|error| "horizConcat: empty list"))
                ('T
                 (SEQ
                  (LETT |a1| (|SPADfirst| |la|)
                        . #5=(|ARR2CAT-;horizConcat;LS;45|))
                  (LETT |nr| (SPADCALL |a1| (QREFELT $ 21)) . #5#)
                  (LETT |nc| (SPADCALL |a1| (QREFELT $ 22)) . #5#)
                  (SEQ (LETT |a| NIL . #5#) (LETT #4# (CDR |la|) . #5#) G190
                       (COND
                        ((OR (ATOM #4#) (PROGN (LETT |a| (CAR #4#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |nr| (SPADCALL |a| (QREFELT $ 21))
                                     (QREFELT $ 67))
                           (|error|
                            "horizConcat: array must have same number of rows"))
                          ('T
                           (LETT |nc| (+ |nc| (SPADCALL |a| (QREFELT $ 22)))
                                 . #5#)))))
                       (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                  (LETT |ans| (SPADCALL |nr| |nc| (QREFELT $ 39)) . #5#)
                  (SEQ (LETT |i| (SPADCALL |a1| (QREFELT $ 11)) . #5#)
                       (LETT #3# (SPADCALL |a1| (QREFELT $ 12)) . #5#) G190
                       (COND ((> |i| #3#) (GO G191)))
                       (SEQ (LETT |l| (SPADCALL |ans| (QREFELT $ 13)) . #5#)
                            (EXIT
                             (SEQ (LETT |a| NIL . #5#) (LETT #2# |la| . #5#)
                                  G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |a| (CAR #2#) . #5#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SEQ
                                     (LETT |j| (SPADCALL |a| (QREFELT $ 13))
                                           . #5#)
                                     (LETT #1# (SPADCALL |a| (QREFELT $ 14))
                                           . #5#)
                                     G190 (COND ((> |j| #1#) (GO G191)))
                                     (SEQ
                                      (SPADCALL |ans| |i| |l|
                                                (SPADCALL |a| |i| |j|
                                                          (QREFELT $ 15))
                                                (QREFELT $ 40))
                                      (EXIT (LETT |l| (+ |l| 1) . #5#)))
                                     (LETT |j| (+ |j| 1) . #5#) (GO G190) G191
                                     (EXIT NIL))))
                                  (LETT #2# (CDR #2#) . #5#) (GO G190) G191
                                  (EXIT NIL))))
                       (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
                  (EXIT |ans|))))))) 

(SDEFUN |ARR2CAT-;vertConcat;3S;46| ((|x| S) (|y| S) ($ S))
        (SPADCALL (LIST |x| |y|) (QREFELT $ 87))) 

(SDEFUN |ARR2CAT-;vertConcat;LS;47| ((|la| |List| S) ($ S))
        (SPROG
         ((|l| (|Integer|)) (#1=#:G1252 NIL) (|j| NIL) (#2=#:G1251 NIL)
          (|i| NIL) (#3=#:G1250 NIL) (|a| NIL) (|ans| (S))
          (|nr| (|NonNegativeInteger|)) (#4=#:G1249 NIL)
          (|nc| (|NonNegativeInteger|)) (|a1| (S)))
         (SEQ
          (COND ((NULL |la|) (|error| "vertConcat: empty list"))
                ('T
                 (SEQ
                  (LETT |a1| (|SPADfirst| |la|)
                        . #5=(|ARR2CAT-;vertConcat;LS;47|))
                  (LETT |nr| (SPADCALL |a1| (QREFELT $ 21)) . #5#)
                  (LETT |nc| (SPADCALL |a1| (QREFELT $ 22)) . #5#)
                  (SEQ (LETT |a| NIL . #5#) (LETT #4# (CDR |la|) . #5#) G190
                       (COND
                        ((OR (ATOM #4#) (PROGN (LETT |a| (CAR #4#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |nc| (SPADCALL |a| (QREFELT $ 22))
                                     (QREFELT $ 67))
                           (|error|
                            "vertConcat: array must have same number of columns"))
                          ('T
                           (LETT |nr| (+ |nr| (SPADCALL |a| (QREFELT $ 21)))
                                 . #5#)))))
                       (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                  (LETT |ans| (SPADCALL |nr| |nc| (QREFELT $ 39)) . #5#)
                  (LETT |l| (SPADCALL |ans| (QREFELT $ 11)) . #5#)
                  (SEQ (LETT |a| NIL . #5#) (LETT #3# |la| . #5#) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |a| (CAR #3#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |i| (SPADCALL |a| (QREFELT $ 11)) . #5#)
                              (LETT #2# (SPADCALL |a| (QREFELT $ 12)) . #5#)
                              G190 (COND ((> |i| #2#) (GO G191)))
                              (SEQ
                               (SEQ
                                (LETT |j| (SPADCALL |a| (QREFELT $ 13)) . #5#)
                                (LETT #1# (SPADCALL |a| (QREFELT $ 14)) . #5#)
                                G190 (COND ((> |j| #1#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SPADCALL |ans| |l| |j|
                                            (SPADCALL |a| |i| |j|
                                                      (QREFELT $ 15))
                                            (QREFELT $ 40))))
                                (LETT |j| (+ |j| 1) . #5#) (GO G190) G191
                                (EXIT NIL))
                               (EXIT (LETT |l| (+ |l| 1) . #5#)))
                              (LETT |i| (+ |i| 1) . #5#) (GO G190) G191
                              (EXIT NIL))))
                       (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
                  (EXIT |ans|))))))) 

(SDEFUN |ARR2CAT-;blockConcat;LS;48| ((LLA |List| (|List| S)) ($ S))
        (SPROG ((#1=#:G1256 NIL) (LA NIL) (#2=#:G1255 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|ARR2CAT-;blockConcat;LS;48|))
                  (SEQ (LETT LA NIL . #3#) (LETT #1# LLA . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT LA (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL LA (QREFELT $ 84)) #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 87))))) 

(SDEFUN |ARR2CAT-;vertSplit;SPiL;49|
        ((A S) (|r| |PositiveInteger|) ($ |List| S))
        (SPROG
         ((#1=#:G1265 NIL) (|i| NIL) (#2=#:G1264 NIL) (|mac| (|Integer|))
          (|mic| (|Integer|)) (|mir| (|Integer|))
          (|dr| (|Union| (|NonNegativeInteger|) "failed")))
         (SEQ
          (LETT |dr| (SPADCALL (SPADCALL A (QREFELT $ 21)) |r| (QREFELT $ 93))
                . #3=(|ARR2CAT-;vertSplit;SPiL;49|))
          (EXIT
           (COND
            ((QEQCAR |dr| 1)
             (|error| "split does not result in an equal division"))
            ('T
             (SEQ (LETT |mir| (SPADCALL A (QREFELT $ 11)) . #3#)
                  (LETT |mic| (SPADCALL A (QREFELT $ 13)) . #3#)
                  (LETT |mac| (SPADCALL A (QREFELT $ 14)) . #3#)
                  (EXIT
                   (PROGN
                    (LETT #2# NIL . #3#)
                    (SEQ (LETT |i| 0 . #3#) (LETT #1# (- |r| 1) . #3#) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS
                                  (SPADCALL A (+ |mir| (* |i| (QCDR |dr|)))
                                            (-
                                             (+ |mir|
                                                (* (+ |i| 1) (QCDR |dr|)))
                                             1)
                                            |mic| |mac| (QREFELT $ 52))
                                  #2#)
                                 . #3#)))
                         (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                         (EXIT (NREVERSE #2#)))))))))))) 

(SDEFUN |ARR2CAT-;vertSplit;SLL;50|
        ((A S) (|lr| |List| (|NonNegativeInteger|)) ($ |List| S))
        (SPROG
         ((#1=#:G1293 NIL) (|i| NIL) (#2=#:G1292 NIL) (|mac| (|Integer|))
          (|mic| (|Integer|)) (|mir| (|Integer|))
          (|l| (|List| (|NonNegativeInteger|))))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL (ELT $ 96) |lr| (QREFELT $ 99))
                      (SPADCALL A (QREFELT $ 21)) (QREFELT $ 67))
            (|error| "split does not result in proper partition"))
           ('T
            (SEQ
             (LETT |l| (CONS 1 (SPADCALL (ELT $ 96) |lr| 1 (QREFELT $ 101)))
                   . #3=(|ARR2CAT-;vertSplit;SLL;50|))
             (LETT |mir| (- (SPADCALL A (QREFELT $ 11)) 1) . #3#)
             (LETT |mic| (SPADCALL A (QREFELT $ 13)) . #3#)
             (LETT |mac| (SPADCALL A (QREFELT $ 14)) . #3#)
             (EXIT
              (PROGN
               (LETT #2# NIL . #3#)
               (SEQ (LETT |i| 2 . #3#)
                    (LETT #1# (SPADCALL |l| (QREFELT $ 102)) . #3#) G190
                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2#
                            (CONS
                             (SPADCALL A
                                       (+ |mir|
                                          (SPADCALL |l| (- |i| 1)
                                                    (QREFELT $ 103)))
                                       (-
                                        (+ |mir|
                                           (SPADCALL |l| |i| (QREFELT $ 103)))
                                        1)
                                       |mic| |mac| (QREFELT $ 52))
                             #2#)
                            . #3#)))
                    (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                    (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |ARR2CAT-;horizSplit;SPiL;51|
        ((A S) (|c| |PositiveInteger|) ($ |List| S))
        (SPROG
         ((#1=#:G1302 NIL) (|i| NIL) (#2=#:G1301 NIL) (|mic| (|Integer|))
          (|mar| (|Integer|)) (|mir| (|Integer|))
          (|dc| (|Union| (|NonNegativeInteger|) "failed")))
         (SEQ
          (LETT |dc| (SPADCALL (SPADCALL A (QREFELT $ 22)) |c| (QREFELT $ 93))
                . #3=(|ARR2CAT-;horizSplit;SPiL;51|))
          (EXIT
           (COND
            ((QEQCAR |dc| 1)
             (|error| "split does not result in an equal division"))
            ('T
             (SEQ (LETT |mir| (SPADCALL A (QREFELT $ 11)) . #3#)
                  (LETT |mar| (SPADCALL A (QREFELT $ 12)) . #3#)
                  (LETT |mic| (SPADCALL A (QREFELT $ 13)) . #3#)
                  (EXIT
                   (PROGN
                    (LETT #2# NIL . #3#)
                    (SEQ (LETT |i| 0 . #3#) (LETT #1# (- |c| 1) . #3#) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS
                                  (SPADCALL A |mir| |mar|
                                            (+ |mic| (* |i| (QCDR |dc|)))
                                            (-
                                             (+ |mic|
                                                (* (+ |i| 1) (QCDR |dc|)))
                                             1)
                                            (QREFELT $ 52))
                                  #2#)
                                 . #3#)))
                         (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                         (EXIT (NREVERSE #2#)))))))))))) 

(SDEFUN |ARR2CAT-;horizSplit;SLL;52|
        ((A S) (|lc| |List| (|NonNegativeInteger|)) ($ |List| S))
        (SPROG
         ((#1=#:G1320 NIL) (|i| NIL) (#2=#:G1319 NIL) (|mic| (|Integer|))
          (|mar| (|Integer|)) (|mir| (|Integer|))
          (|l| (|List| (|NonNegativeInteger|))))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL (ELT $ 96) |lc| (QREFELT $ 99))
                      (SPADCALL A (QREFELT $ 22)) (QREFELT $ 67))
            (|error| "split does not result in proper partition"))
           ('T
            (SEQ
             (LETT |l| (CONS 1 (SPADCALL (ELT $ 96) |lc| 1 (QREFELT $ 101)))
                   . #3=(|ARR2CAT-;horizSplit;SLL;52|))
             (LETT |mir| (SPADCALL A (QREFELT $ 11)) . #3#)
             (LETT |mar| (SPADCALL A (QREFELT $ 12)) . #3#)
             (LETT |mic| (- (SPADCALL A (QREFELT $ 13)) 1) . #3#)
             (EXIT
              (PROGN
               (LETT #2# NIL . #3#)
               (SEQ (LETT |i| 2 . #3#)
                    (LETT #1# (SPADCALL |l| (QREFELT $ 102)) . #3#) G190
                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2#
                            (CONS
                             (SPADCALL A |mir| |mar|
                                       (+ |mic|
                                          (SPADCALL |l| (- |i| 1)
                                                    (QREFELT $ 103)))
                                       (-
                                        (+ |mic|
                                           (SPADCALL |l| |i| (QREFELT $ 103)))
                                        1)
                                       (QREFELT $ 52))
                             #2#)
                            . #3#)))
                    (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                    (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |ARR2CAT-;blockSplit;S2PiL;53|
        ((A S) (|nr| |PositiveInteger|) (|nc| |PositiveInteger|)
         ($ |List| (|List| S)))
        (SPROG ((#1=#:G1324 NIL) (X NIL) (#2=#:G1323 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|ARR2CAT-;blockSplit;S2PiL;53|))
                 (SEQ (LETT X NIL . #3#)
                      (LETT #1# (SPADCALL A |nr| (QREFELT $ 107)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT X (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL X |nc| (QREFELT $ 108)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |ARR2CAT-;blockSplit;S2LL;54|
        ((A S) (|lr| |List| (|NonNegativeInteger|))
         (|lc| |List| (|NonNegativeInteger|)) ($ |List| (|List| S)))
        (SPROG ((#1=#:G1328 NIL) (X NIL) (#2=#:G1327 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|ARR2CAT-;blockSplit;S2LL;54|))
                 (SEQ (LETT X NIL . #3#)
                      (LETT #1# (SPADCALL A |lr| (QREFELT $ 110)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT X (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL X |lc| (QREFELT $ 111)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |ARR2CAT-;copy;2S;55| ((|m| S) ($ S))
        (SPROG
         ((#1=#:G1334 NIL) (|j| NIL) (#2=#:G1333 NIL) (|i| NIL) (|ans| (S)))
         (SEQ
          (LETT |ans|
                (SPADCALL (SPADCALL |m| (QREFELT $ 21))
                          (SPADCALL |m| (QREFELT $ 22)) NIL (QREFELT $ 113))
                . #3=(|ARR2CAT-;copy;2S;55|))
          (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 11)) . #3#)
               (LETT #2# (SPADCALL |m| (QREFELT $ 12)) . #3#) G190
               (COND ((> |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #3#)
                      (LETT #1# (SPADCALL |m| (QREFELT $ 14)) . #3#) G190
                      (COND ((> |j| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |ans| |i| |j|
                                  (SPADCALL |m| |i| |j| (QREFELT $ 15))
                                  (QREFELT $ 40))))
                      (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |ARR2CAT-;fill!;SRS;56| ((|m| S) (|r| R) ($ S))
        (SPROG ((#1=#:G1340 NIL) (|j| NIL) (#2=#:G1339 NIL) (|i| NIL))
               (SEQ
                (SEQ
                 (LETT |i| (SPADCALL |m| (QREFELT $ 11))
                       . #3=(|ARR2CAT-;fill!;SRS;56|))
                 (LETT #2# (SPADCALL |m| (QREFELT $ 12)) . #3#) G190
                 (COND ((> |i| #2#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #3#)
                        (LETT #1# (SPADCALL |m| (QREFELT $ 14)) . #3#) G190
                        (COND ((> |j| #1#) (GO G191)))
                        (SEQ (EXIT (SPADCALL |m| |i| |j| |r| (QREFELT $ 40))))
                        (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT |m|)))) 

(SDEFUN |ARR2CAT-;map;M2S;57| ((|f| |Mapping| R R) (|m| S) ($ S))
        (SPROG
         ((#1=#:G1347 NIL) (|j| NIL) (#2=#:G1346 NIL) (|i| NIL) (|ans| (S)))
         (SEQ
          (LETT |ans|
                (SPADCALL (SPADCALL |m| (QREFELT $ 21))
                          (SPADCALL |m| (QREFELT $ 22)) NIL (QREFELT $ 113))
                . #3=(|ARR2CAT-;map;M2S;57|))
          (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 11)) . #3#)
               (LETT #2# (SPADCALL |m| (QREFELT $ 12)) . #3#) G190
               (COND ((> |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #3#)
                      (LETT #1# (SPADCALL |m| (QREFELT $ 14)) . #3#) G190
                      (COND ((> |j| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |ans| |i| |j|
                                  (SPADCALL
                                   (SPADCALL |m| |i| |j| (QREFELT $ 15)) |f|)
                                  (QREFELT $ 40))))
                      (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |ARR2CAT-;map!;M2S;58| ((|f| |Mapping| R R) (|m| S) ($ S))
        (SPROG ((#1=#:G1353 NIL) (|j| NIL) (#2=#:G1352 NIL) (|i| NIL))
               (SEQ
                (SEQ
                 (LETT |i| (SPADCALL |m| (QREFELT $ 11))
                       . #3=(|ARR2CAT-;map!;M2S;58|))
                 (LETT #2# (SPADCALL |m| (QREFELT $ 12)) . #3#) G190
                 (COND ((> |i| #2#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #3#)
                        (LETT #1# (SPADCALL |m| (QREFELT $ 14)) . #3#) G190
                        (COND ((> |j| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL |m| |i| |j|
                                    (SPADCALL
                                     (SPADCALL |m| |i| |j| (QREFELT $ 15)) |f|)
                                    (QREFELT $ 40))))
                        (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT |m|)))) 

(SDEFUN |ARR2CAT-;map;M3S;59| ((|f| |Mapping| R R R) (|m| S) (|n| S) ($ S))
        (SPROG
         ((#1=#:G1362 NIL) (|j| NIL) (#2=#:G1361 NIL) (|i| NIL) (|ans| (S)))
         (SEQ
          (COND
           ((OR
             (SPADCALL (SPADCALL |m| (QREFELT $ 21))
                       (SPADCALL |n| (QREFELT $ 21)) (QREFELT $ 63))
             (SPADCALL (SPADCALL |m| (QREFELT $ 22))
                       (SPADCALL |n| (QREFELT $ 22)) (QREFELT $ 63)))
            (|error| "map: arguments must have same dimensions"))
           ('T
            (SEQ
             (LETT |ans|
                   (SPADCALL (SPADCALL |m| (QREFELT $ 21))
                             (SPADCALL |m| (QREFELT $ 22)) NIL (QREFELT $ 113))
                   . #3=(|ARR2CAT-;map;M3S;59|))
             (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 11)) . #3#)
                  (LETT #2# (SPADCALL |m| (QREFELT $ 12)) . #3#) G190
                  (COND ((> |i| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #3#)
                         (LETT #1# (SPADCALL |m| (QREFELT $ 14)) . #3#) G190
                         (COND ((> |j| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |ans| |i| |j|
                                     (SPADCALL
                                      (SPADCALL |m| |i| |j| (QREFELT $ 15))
                                      (SPADCALL |n| |i| |j| (QREFELT $ 15))
                                      |f|)
                                     (QREFELT $ 40))))
                         (LETT |j| (+ |j| 1) . #3#) (GO G190) G191
                         (EXIT NIL))))
                  (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
             (EXIT |ans|))))))) 

(SDEFUN |ARR2CAT-;map;M2SRS;60|
        ((|f| |Mapping| R R R) (|m| S) (|n| S) (|r| R) ($ S))
        (SPROG
         ((#1=#:G1368 NIL) (|j| NIL) (#2=#:G1367 NIL) (|i| NIL) (|ans| (S))
          (|maxCol| #3=(|Integer|)) (|maxRow| #3#))
         (SEQ
          (LETT |maxRow|
                (MAX (SPADCALL |m| (QREFELT $ 12))
                     (SPADCALL |n| (QREFELT $ 12)))
                . #4=(|ARR2CAT-;map;M2SRS;60|))
          (LETT |maxCol|
                (MAX (SPADCALL |m| (QREFELT $ 14))
                     (SPADCALL |n| (QREFELT $ 14)))
                . #4#)
          (LETT |ans|
                (SPADCALL
                 (MAX (SPADCALL |m| (QREFELT $ 21))
                      (SPADCALL |n| (QREFELT $ 21)))
                 (MAX (SPADCALL |m| (QREFELT $ 22))
                      (SPADCALL |n| (QREFELT $ 22)))
                 NIL (QREFELT $ 113))
                . #4#)
          (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 11)) . #4#)
               (LETT #2# |maxRow| . #4#) G190 (COND ((> |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #4#)
                      (LETT #1# |maxCol| . #4#) G190
                      (COND ((> |j| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |ans| |i| |j|
                                  (SPADCALL
                                   (SPADCALL |m| |i| |j| |r| (QREFELT $ 121))
                                   (SPADCALL |n| |i| |j| |r| (QREFELT $ 121))
                                   |f|)
                                  (QREFELT $ 40))))
                      (LETT |j| (+ |j| 1) . #4#) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |ARR2CAT-;setRow!;SIRowS;61|
        ((|m| S) (|i| |Integer|) (|v| |Row|) ($ S))
        (SPROG ((#1=#:G1374 NIL) (|j| NIL) (#2=#:G1375 NIL) (|k| NIL))
               (SEQ
                (COND
                 ((OR (< |i| (SPADCALL |m| (QREFELT $ 11)))
                      (SPADCALL |i| (SPADCALL |m| (QREFELT $ 12))
                                (QREFELT $ 32)))
                  (|error| "setRow!: index out of range"))
                 ('T
                  (SEQ
                   (SEQ
                    (LETT |k| (SPADCALL |v| (QREFELT $ 123))
                          . #3=(|ARR2CAT-;setRow!;SIRowS;61|))
                    (LETT #2# (SPADCALL |v| (QREFELT $ 124)) . #3#)
                    (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #3#)
                    (LETT #1# (SPADCALL |m| (QREFELT $ 14)) . #3#) G190
                    (COND ((OR (> |j| #1#) (> |k| #2#)) (GO G191)))
                    (SEQ
                     (EXIT
                      (SPADCALL |m| |i| |j| (SPADCALL |v| |k| (QREFELT $ 125))
                                (QREFELT $ 40))))
                    (LETT |j| (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1) . #3#))
                          . #3#)
                    (GO G190) G191 (EXIT NIL))
                   (EXIT |m|))))))) 

(SDEFUN |ARR2CAT-;setColumn!;SIColS;62|
        ((|m| S) (|j| |Integer|) (|v| |Col|) ($ S))
        (SPROG ((#1=#:G1381 NIL) (|i| NIL) (#2=#:G1382 NIL) (|k| NIL))
               (SEQ
                (COND
                 ((OR (< |j| (SPADCALL |m| (QREFELT $ 13)))
                      (SPADCALL |j| (SPADCALL |m| (QREFELT $ 14))
                                (QREFELT $ 32)))
                  (|error| "setColumn!: index out of range"))
                 ('T
                  (SEQ
                   (SEQ
                    (LETT |k| (SPADCALL |v| (QREFELT $ 127))
                          . #3=(|ARR2CAT-;setColumn!;SIColS;62|))
                    (LETT #2# (SPADCALL |v| (QREFELT $ 128)) . #3#)
                    (LETT |i| (SPADCALL |m| (QREFELT $ 11)) . #3#)
                    (LETT #1# (SPADCALL |m| (QREFELT $ 12)) . #3#) G190
                    (COND ((OR (> |i| #1#) (> |k| #2#)) (GO G191)))
                    (SEQ
                     (EXIT
                      (SPADCALL |m| |i| |j| (SPADCALL |v| |k| (QREFELT $ 129))
                                (QREFELT $ 40))))
                    (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #3#))
                          . #3#)
                    (GO G190) G191 (EXIT NIL))
                   (EXIT |m|))))))) 

(SDEFUN |ARR2CAT-;=;2SB;63| ((|m| S) (|n| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G1391 NIL) (#2=#:G1392 NIL) (#3=#:G1394 NIL) (|j| NIL)
          (#4=#:G1393 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (COND ((SPADCALL |m| |n| (QREFELT $ 131)) 'T)
                 ((OR
                   (SPADCALL (SPADCALL |m| (QREFELT $ 21))
                             (SPADCALL |n| (QREFELT $ 21)) (QREFELT $ 63))
                   (SPADCALL (SPADCALL |m| (QREFELT $ 22))
                             (SPADCALL |n| (QREFELT $ 22)) (QREFELT $ 63)))
                  NIL)
                 ('T
                  (SEQ
                   (SEQ
                    (LETT |i| (SPADCALL |m| (QREFELT $ 11))
                          . #5=(|ARR2CAT-;=;2SB;63|))
                    (LETT #4# (SPADCALL |m| (QREFELT $ 12)) . #5#) G190
                    (COND ((> |i| #4#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #5#)
                           (LETT #3# (SPADCALL |m| (QREFELT $ 14)) . #5#) G190
                           (COND ((> |j| #3#) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL
                                (SPADCALL (SPADCALL |m| |i| |j| (QREFELT $ 15))
                                          (SPADCALL |n| |i| |j| (QREFELT $ 15))
                                          (QREFELT $ 29)))
                               (PROGN
                                (LETT #1#
                                      (PROGN
                                       (LETT #2# NIL . #5#)
                                       (GO #6=#:G1390))
                                      . #5#)
                                (GO #7=#:G1386))))))
                           (LETT |j| (+ |j| 1) . #5#) (GO G190) G191
                           (EXIT NIL)))
                     #7# (EXIT #1#))
                    (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
                   (EXIT 'T)))))
          #6# (EXIT #2#)))) 

(SDEFUN |ARR2CAT-;member?;RSB;64| ((|r| R) (|m| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G1400 NIL) (#2=#:G1401 NIL) (#3=#:G1403 NIL) (|j| NIL)
          (#4=#:G1402 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |i| (SPADCALL |m| (QREFELT $ 11))
                   . #5=(|ARR2CAT-;member?;RSB;64|))
             (LETT #4# (SPADCALL |m| (QREFELT $ 12)) . #5#) G190
             (COND ((> |i| #4#) (GO G191)))
             (SEQ
              (EXIT
               (SEQ (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #5#)
                    (LETT #3# (SPADCALL |m| (QREFELT $ 14)) . #5#) G190
                    (COND ((> |j| #3#) (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |m| |i| |j| (QREFELT $ 15)) |r|
                                  (QREFELT $ 29))
                        (PROGN
                         (LETT #1# (PROGN (LETT #2# 'T . #5#) (GO #6=#:G1399))
                               . #5#)
                         (GO #7=#:G1396))))))
                    (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL)))
              #7# (EXIT #1#))
             (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
            (EXIT NIL)))
          #6# (EXIT #2#)))) 

(SDEFUN |ARR2CAT-;count;RSNni;65| ((|r| R) (|m| S) ($ |NonNegativeInteger|))
        (SPROG NIL
               (SPADCALL (CONS #'|ARR2CAT-;count;RSNni;65!0| (VECTOR $ |r|))
                         |m| (QREFELT $ 134)))) 

(SDEFUN |ARR2CAT-;count;RSNni;65!0| ((|x| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1) . #1=(|ARR2CAT-;count;RSNni;65|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |r| (QREFELT $ 29)))))) 

(SDEFUN |ARR2CAT-;row;SIRow;66| ((|m| S) (|i| |Integer|) ($ |Row|))
        (SPROG
         ((#1=#:G1411 NIL) (|j| NIL) (#2=#:G1412 NIL) (|k| NIL) (|v| (|Row|)))
         (SEQ
          (COND
           ((OR (< |i| (SPADCALL |m| (QREFELT $ 11)))
                (SPADCALL |i| (SPADCALL |m| (QREFELT $ 12)) (QREFELT $ 32)))
            (|error| "row: index out of range"))
           ('T
            (SEQ
             (LETT |v|
                   (SPADCALL (SPADCALL |m| (QREFELT $ 22)) NIL (QREFELT $ 136))
                   . #3=(|ARR2CAT-;row;SIRow;66|))
             (SEQ (LETT |k| (SPADCALL |v| (QREFELT $ 123)) . #3#)
                  (LETT #2# (SPADCALL |v| (QREFELT $ 124)) . #3#)
                  (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #3#)
                  (LETT #1# (SPADCALL |m| (QREFELT $ 14)) . #3#) G190
                  (COND ((OR (> |j| #1#) (> |k| #2#)) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |v| |k| (SPADCALL |m| |i| |j| (QREFELT $ 15))
                              (QREFELT $ 137))))
                  (LETT |j| (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1) . #3#)) . #3#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT |v|))))))) 

(SDEFUN |ARR2CAT-;column;SICol;67| ((|m| S) (|j| |Integer|) ($ |Col|))
        (SPROG
         ((#1=#:G1418 NIL) (|i| NIL) (#2=#:G1419 NIL) (|k| NIL) (|v| (|Col|)))
         (SEQ
          (COND
           ((OR (< |j| (SPADCALL |m| (QREFELT $ 13)))
                (SPADCALL |j| (SPADCALL |m| (QREFELT $ 14)) (QREFELT $ 32)))
            (|error| "column: index out of range"))
           ('T
            (SEQ
             (LETT |v|
                   (SPADCALL (SPADCALL |m| (QREFELT $ 21)) NIL (QREFELT $ 139))
                   . #3=(|ARR2CAT-;column;SICol;67|))
             (SEQ (LETT |k| (SPADCALL |v| (QREFELT $ 127)) . #3#)
                  (LETT #2# (SPADCALL |v| (QREFELT $ 128)) . #3#)
                  (LETT |i| (SPADCALL |m| (QREFELT $ 11)) . #3#)
                  (LETT #1# (SPADCALL |m| (QREFELT $ 12)) . #3#) G190
                  (COND ((OR (> |i| #1#) (> |k| #2#)) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |v| |k| (SPADCALL |m| |i| |j| (QREFELT $ 15))
                              (QREFELT $ 140))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #3#)) . #3#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT |v|))))))) 

(SDEFUN |ARR2CAT-;coerce;SOf;68| ((|m| S) ($ |OutputForm|))
        (SPROG
         ((|l| (|List| (|List| (|OutputForm|)))) (#1=#:G1427 NIL) (|j| NIL)
          (#2=#:G1426 NIL) (#3=#:G1425 NIL) (|i| NIL) (#4=#:G1424 NIL))
         (SEQ
          (LETT |l|
                (PROGN
                 (LETT #4# NIL . #5=(|ARR2CAT-;coerce;SOf;68|))
                 (SEQ (LETT |i| (SPADCALL |m| (QREFELT $ 11)) . #5#)
                      (LETT #3# (SPADCALL |m| (QREFELT $ 12)) . #5#) G190
                      (COND ((> |i| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (PROGN
                                (LETT #2# NIL . #5#)
                                (SEQ
                                 (LETT |j| (SPADCALL |m| (QREFELT $ 13)) . #5#)
                                 (LETT #1# (SPADCALL |m| (QREFELT $ 14)) . #5#)
                                 G190 (COND ((> |j| #1#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2#
                                         (CONS
                                          (SPADCALL
                                           (SPADCALL |m| |i| |j|
                                                     (QREFELT $ 15))
                                           (QREFELT $ 143))
                                          #2#)
                                         . #5#)))
                                 (LETT |j| (+ |j| 1) . #5#) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                               #4#)
                              . #5#)))
                      (LETT |i| (+ |i| 1) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (EXIT (SPADCALL |l| (QREFELT $ 144)))))) 

(DECLAIM (NOTINLINE |TwoDimensionalArrayCategory&;|)) 

(DEFUN |TwoDimensionalArrayCategory&| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|TwoDimensionalArrayCategory&|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|TwoDimensionalArrayCategory&| DV$1 DV$2 DV$3 DV$4)
          . #1#)
    (LETT $ (GETREFV 146) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2| '(|Comparable|))))
                    . #1#))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 1)
      (QSETREFV $ 30 (CONS (|dispatchFunction| |ARR2CAT-;smaller?;2SB;6|) $))))
    (COND
     ((|HasSignature| |#2|
                      (LIST '=
                            (LIST '(|Boolean|) (|devaluate| |#2|)
                                  (|devaluate| |#2|))))
      (PROGN
       (QSETREFV $ 132 (CONS (|dispatchFunction| |ARR2CAT-;=;2SB;63|) $))
       (QSETREFV $ 133 (CONS (|dispatchFunction| |ARR2CAT-;member?;RSB;64|) $))
       (QSETREFV $ 135
                 (CONS (|dispatchFunction| |ARR2CAT-;count;RSNni;65|) $)))))
    (COND
     ((|HasCategory| |#3| '(|shallowlyMutable|))
      (COND
       ((|HasCategory| |#3| (LIST '|LinearAggregate| (|devaluate| |#2|)))
        (QSETREFV $ 138
                  (CONS (|dispatchFunction| |ARR2CAT-;row;SIRow;66|) $))))))
    (COND
     ((|HasCategory| |#4| '(|shallowlyMutable|))
      (COND
       ((|HasCategory| |#4| (LIST '|LinearAggregate| (|devaluate| |#2|)))
        (QSETREFV $ 141
                  (CONS (|dispatchFunction| |ARR2CAT-;column;SICol;67|) $))))))
    (COND
     ((|HasCategory| |#2| '(|CoercibleTo| (|OutputForm|)))
      (QSETREFV $ 145 (CONS (|dispatchFunction| |ARR2CAT-;coerce;SOf;68|) $))))
    $))) 

(MAKEPROP '|TwoDimensionalArrayCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Integer|) (0 . |minRowIndex|)
              (5 . |maxRowIndex|) (10 . |minColIndex|) (15 . |maxColIndex|)
              (20 . |qelt|) (|Boolean|) (|Mapping| 16 7) |ARR2CAT-;any?;MSB;1|
              |ARR2CAT-;every?;MSB;2| (|NonNegativeInteger|) (27 . |nrows|)
              (32 . |ncols|) |ARR2CAT-;size?;SNniB;3| |ARR2CAT-;less?;SNniB;4|
              (37 . >) |ARR2CAT-;more?;SNniB;5| (43 . |elt|) (50 . |smaller?|)
              (56 . =) (62 . |smaller?|) |ARR2CAT-;#;SNni;7| (68 . >)
              |ARR2CAT-;elt;S2I2R;8| |ARR2CAT-;count;MSNni;9| (|List| 7)
              |ARR2CAT-;parts;SL;10| (|List| 35) |ARR2CAT-;listOfLists;SL;11|
              (74 . |qnew|) (80 . |qsetelt!|) |ARR2CAT-;subMatrix;S4IS;12|
              (|List| 10) |ARR2CAT-;elt;SILS;13| |ARR2CAT-;elt;SLIS;14|
              |ARR2CAT-;elt;S2LS;15| (|Segment| 10) (88 . |incr|) (93 . |low|)
              (98 . |high|) |ARR2CAT-;elt;SLSS;17| |ARR2CAT-;elt;SSLS;18|
              (103 . |subMatrix|) |ARR2CAT-;elt;S2SS;19| (|List| 46)
              |ARR2CAT-;elt;SILS;21| |ARR2CAT-;elt;SLIS;22|
              |ARR2CAT-;elt;SSLS;23| |ARR2CAT-;elt;SLSS;24|
              |ARR2CAT-;elt;S2LS;25| (112 . SEGMENT) |ARR2CAT-;rowSlice;SS;26|
              |ARR2CAT-;colSlice;SS;27| (118 . ~=) |ARR2CAT-;setelt!;SIL2S;28|
              |ARR2CAT-;setelt!;SLI2S;29| |ARR2CAT-;setelt!;S2L2S;30|
              (124 . ~=) |ARR2CAT-;setelt!;S2S2S;31|
              |ARR2CAT-;setelt!;SLS2S;32| |ARR2CAT-;setelt!;SSL2S;33|
              |ARR2CAT-;setelt!;SIL2S;34| |ARR2CAT-;setelt!;SLI2S;35|
              |ARR2CAT-;setelt!;SSL2S;36| |ARR2CAT-;setelt!;SLS2S;37|
              |ARR2CAT-;setelt!;S2L2S;38| (|String|) (130 . |elt|)
              |ARR2CAT-;setsubMatrix!;S2I2S;39| |ARR2CAT-;swapRows!;S2IS;40|
              |ARR2CAT-;swapColumns!;S2IS;41| |ARR2CAT-;transpose;2S;42|
              |ARR2CAT-;squareTop;2S;43| (|List| $) (136 . |horizConcat|)
              |ARR2CAT-;horizConcat;3S;44| |ARR2CAT-;horizConcat;LS;45|
              (141 . |vertConcat|) |ARR2CAT-;vertConcat;3S;46|
              |ARR2CAT-;vertConcat;LS;47| (|List| 83)
              |ARR2CAT-;blockConcat;LS;48| (|Union| $ '"failed")
              (146 . |exquo|) (|PositiveInteger|) |ARR2CAT-;vertSplit;SPiL;49|
              (152 . +) (|Mapping| 20 20 20) (|List| 20) (158 . |reduce|)
              (|ListFunctions2| 20 20) (164 . |scan|) (171 . |#|) (176 . |elt|)
              |ARR2CAT-;vertSplit;SLL;50| |ARR2CAT-;horizSplit;SPiL;51|
              |ARR2CAT-;horizSplit;SLL;52| (182 . |vertSplit|)
              (188 . |horizSplit|) |ARR2CAT-;blockSplit;S2PiL;53|
              (194 . |vertSplit|) (200 . |horizSplit|)
              |ARR2CAT-;blockSplit;S2LL;54| (206 . |new|) |ARR2CAT-;copy;2S;55|
              |ARR2CAT-;fill!;SRS;56| (|Mapping| 7 7) |ARR2CAT-;map;M2S;57|
              |ARR2CAT-;map!;M2S;58| (|Mapping| 7 7 7) |ARR2CAT-;map;M3S;59|
              (213 . |elt|) |ARR2CAT-;map;M2SRS;60| (221 . |minIndex|)
              (226 . |maxIndex|) (231 . |elt|) |ARR2CAT-;setRow!;SIRowS;61|
              (237 . |minIndex|) (242 . |maxIndex|) (247 . |elt|)
              |ARR2CAT-;setColumn!;SIColS;62| (253 . |eq?|) (259 . =)
              (265 . |member?|) (271 . |count|) (277 . |count|) (283 . |new|)
              (289 . |qsetelt!|) (296 . |row|) (302 . |new|) (308 . |qsetelt!|)
              (315 . |column|) (|OutputForm|) (321 . |coerce|) (326 . |matrix|)
              (331 . |coerce|))
           '#(|vertSplit| 336 |vertConcat| 348 |transpose| 359 |swapRows!| 364
              |swapColumns!| 371 |subMatrix| 378 |squareTop| 387 |smaller?| 392
              |size?| 398 |setsubMatrix!| 404 |setelt!| 412 |setRow!| 500
              |setColumn!| 507 |rowSlice| 514 |row| 519 |parts| 525 |more?| 530
              |member?| 536 |map!| 542 |map| 548 |listOfLists| 569 |less?| 574
              |horizSplit| 580 |horizConcat| 592 |fill!| 603 |every?| 609 |elt|
              615 |count| 700 |copy| 712 |column| 717 |colSlice| 723 |coerce|
              728 |blockSplit| 733 |blockConcat| 747 |any?| 752 = 758 |#| 764)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 145
                                                 '(1 6 10 0 11 1 6 10 0 12 1 6
                                                   10 0 13 1 6 10 0 14 3 6 7 0
                                                   10 10 15 1 6 20 0 21 1 6 20
                                                   0 22 2 20 16 0 0 25 3 6 7 0
                                                   10 10 27 2 7 16 0 0 28 2 7
                                                   16 0 0 29 2 0 16 0 0 30 2 10
                                                   16 0 0 32 2 6 0 20 20 39 4 6
                                                   7 0 10 10 7 40 1 46 10 0 47
                                                   1 46 10 0 48 1 46 10 0 49 5
                                                   6 0 0 10 10 10 10 52 2 46 0
                                                   10 10 60 2 10 16 0 0 63 2 20
                                                   16 0 0 67 2 76 0 0 0 77 1 6
                                                   0 83 84 1 6 0 83 87 2 20 92
                                                   0 0 93 2 20 0 0 0 96 2 98 20
                                                   97 0 99 3 100 98 97 98 20
                                                   101 1 98 20 0 102 2 98 20 0
                                                   10 103 2 6 83 0 94 107 2 6
                                                   83 0 94 108 2 6 83 0 98 110
                                                   2 6 83 0 98 111 3 6 0 20 20
                                                   7 113 4 6 7 0 10 10 7 121 1
                                                   8 10 0 123 1 8 10 0 124 2 8
                                                   7 0 10 125 1 9 10 0 127 1 9
                                                   10 0 128 2 9 7 0 10 129 2 6
                                                   16 0 0 131 2 0 16 0 0 132 2
                                                   0 16 7 0 133 2 6 20 17 0 134
                                                   2 0 20 7 0 135 2 8 0 20 7
                                                   136 3 8 7 0 10 7 137 2 0 8 0
                                                   10 138 2 9 0 20 7 139 3 9 7
                                                   0 10 7 140 2 0 9 0 10 141 1
                                                   7 142 0 143 1 142 0 90 144 1
                                                   0 142 0 145 2 0 83 0 94 95 2
                                                   0 83 0 98 104 1 0 0 83 89 2
                                                   0 0 0 0 88 1 0 0 0 81 3 0 0
                                                   0 10 10 79 3 0 0 0 10 10 80
                                                   5 0 0 0 10 10 10 10 41 1 0 0
                                                   0 82 2 0 16 0 0 30 2 0 16 0
                                                   20 23 4 0 0 0 10 10 0 78 4 0
                                                   0 0 54 54 0 75 4 0 0 0 46 54
                                                   0 73 4 0 0 0 54 46 0 74 4 0
                                                   0 0 42 46 0 69 4 0 0 0 46 42
                                                   0 70 4 0 0 0 42 42 0 66 4 0
                                                   0 0 46 46 0 68 4 0 0 0 10 42
                                                   0 64 4 0 0 0 42 10 0 65 4 0
                                                   0 0 54 10 0 72 4 0 0 0 10 54
                                                   0 71 3 0 0 0 10 8 126 3 0 0
                                                   0 10 9 130 1 0 46 0 61 2 0 8
                                                   0 10 138 1 0 35 0 36 2 0 16
                                                   0 20 26 2 0 16 7 0 133 2 0 0
                                                   116 0 118 4 0 0 119 0 0 7
                                                   122 3 0 0 119 0 0 120 2 0 0
                                                   116 0 117 1 0 37 0 38 2 0 16
                                                   0 20 24 2 0 83 0 94 105 2 0
                                                   83 0 98 106 2 0 0 0 0 85 1 0
                                                   0 83 86 2 0 0 0 7 115 2 0 16
                                                   17 0 19 3 0 0 0 54 46 58 3 0
                                                   0 0 54 54 59 3 0 0 0 46 54
                                                   57 3 0 0 0 54 10 56 3 0 0 0
                                                   46 42 51 3 0 0 0 10 54 55 3
                                                   0 0 0 46 46 53 3 0 0 0 42 46
                                                   50 3 0 0 0 42 10 44 3 0 0 0
                                                   42 42 45 3 0 0 0 10 42 43 4
                                                   0 7 0 10 10 7 33 2 0 20 7 0
                                                   135 2 0 20 17 0 34 1 0 0 0
                                                   114 2 0 9 0 10 141 1 0 46 0
                                                   62 1 0 142 0 145 3 0 90 0 94
                                                   94 109 3 0 90 0 98 98 112 1
                                                   0 0 90 91 2 0 16 17 0 18 2 0
                                                   16 0 0 132 1 0 20 0 31)))))
           '|lookupComplete|)) 
