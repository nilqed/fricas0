
(SDEFUN |MATCAT-;square?;SB;1| ((|x| S) ($ |Boolean|))
        (EQL (SPADCALL |x| (QREFELT $ 11)) (SPADCALL |x| (QREFELT $ 12)))) 

(SDEFUN |MATCAT-;diagonal?;SB;2| ((|x| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G744 NIL) (#2=#:G745 NIL) (#3=#:G747 NIL) (|j| NIL)
          (#4=#:G746 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (COND ((NULL (SPADCALL |x| (QREFELT $ 15))) NIL)
                 ('T
                  (SEQ
                   (SEQ
                    (LETT |i| (SPADCALL |x| (QREFELT $ 17))
                          . #5=(|MATCAT-;diagonal?;SB;2|))
                    (LETT #4# (SPADCALL |x| (QREFELT $ 18)) . #5#) G190
                    (COND ((> |i| #4#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 19)) . #5#)
                           (LETT #3# (SPADCALL |x| (QREFELT $ 20)) . #5#) G190
                           (COND ((> |j| #3#) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL (- |j| (SPADCALL |x| (QREFELT $ 19)))
                                         (- |i| (SPADCALL |x| (QREFELT $ 17)))
                                         (QREFELT $ 21))
                               (COND
                                ((NULL
                                  (SPADCALL
                                   (SPADCALL |x| |i| |j| (QREFELT $ 22))
                                   (QREFELT $ 23)))
                                 (PROGN
                                  (LETT #1#
                                        (PROGN
                                         (LETT #2# NIL . #5#)
                                         (GO #6=#:G743))
                                        . #5#)
                                  (GO #7=#:G740))))))))
                           (LETT |j| (+ |j| 1) . #5#) (GO G190) G191
                           (EXIT NIL)))
                     #7# (EXIT #1#))
                    (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
                   (EXIT 'T)))))
          #6# (EXIT #2#)))) 

(SDEFUN |MATCAT-;symmetric?;SB;3| ((|x| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G754 NIL) (#2=#:G755 NIL) (#3=#:G757 NIL) (|j| NIL)
          (#4=#:G756 NIL) (|i| NIL) (|mc| (|Integer|)) (|mr| (|Integer|))
          (|nRows| (|Integer|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL
              (LETT |nRows| (SPADCALL |x| (QREFELT $ 11))
                    . #5=(|MATCAT-;symmetric?;SB;3|))
              (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 21))
             NIL)
            ('T
             (SEQ (LETT |mr| (SPADCALL |x| (QREFELT $ 17)) . #5#)
                  (LETT |mc| (SPADCALL |x| (QREFELT $ 19)) . #5#)
                  (SEQ (LETT |i| 0 . #5#) (LETT #4# (- |nRows| 1) . #5#) G190
                       (COND ((|greater_SI| |i| #4#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |j| (+ |i| 1) . #5#)
                              (LETT #3# (- |nRows| 1) . #5#) G190
                              (COND ((> |j| #3#) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (SPADCALL |x| (+ |mr| |i|) (+ |mc| |j|)
                                             (QREFELT $ 22))
                                   (SPADCALL |x| (+ |mr| |j|) (+ |mc| |i|)
                                             (QREFELT $ 22))
                                   (QREFELT $ 25))
                                  (PROGN
                                   (LETT #1#
                                         (PROGN
                                          (LETT #2# NIL . #5#)
                                          (GO #6=#:G753))
                                         . #5#)
                                   (GO #7=#:G749))))))
                              (LETT |j| (+ |j| 1) . #5#) (GO G190) G191
                              (EXIT NIL)))
                        #7# (EXIT #1#))
                       (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT 'T)))))
          #6# (EXIT #2#)))) 

(SDEFUN |MATCAT-;antisymmetric?;SB;4| ((|x| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G764 NIL) (#2=#:G765 NIL) (#3=#:G767 NIL) (|j| NIL)
          (#4=#:G766 NIL) (|i| NIL) (|mc| (|Integer|)) (|mr| (|Integer|))
          (|nRows| (|Integer|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL
              (LETT |nRows| (SPADCALL |x| (QREFELT $ 11))
                    . #5=(|MATCAT-;antisymmetric?;SB;4|))
              (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 21))
             NIL)
            ('T
             (SEQ (LETT |mr| (SPADCALL |x| (QREFELT $ 17)) . #5#)
                  (LETT |mc| (SPADCALL |x| (QREFELT $ 19)) . #5#)
                  (SEQ (LETT |i| 0 . #5#) (LETT #4# (- |nRows| 1) . #5#) G190
                       (COND ((|greater_SI| |i| #4#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |j| |i| . #5#)
                              (LETT #3# (- |nRows| 1) . #5#) G190
                              (COND ((> |j| #3#) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (SPADCALL |x| (+ |mr| |i|) (+ |mc| |j|)
                                             (QREFELT $ 22))
                                   (SPADCALL
                                    (SPADCALL |x| (+ |mr| |j|) (+ |mc| |i|)
                                              (QREFELT $ 22))
                                    (QREFELT $ 27))
                                   (QREFELT $ 25))
                                  (PROGN
                                   (LETT #1#
                                         (PROGN
                                          (LETT #2# NIL . #5#)
                                          (GO #6=#:G763))
                                         . #5#)
                                   (GO #7=#:G759))))))
                              (LETT |j| (+ |j| 1) . #5#) (GO G190) G191
                              (EXIT NIL)))
                        #7# (EXIT #1#))
                       (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT 'T)))))
          #6# (EXIT #2#)))) 

(SDEFUN |MATCAT-;zero?;SB;5| ((|x| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G773 NIL) (#2=#:G775 NIL) (|j| NIL) (#3=#:G774 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |i| (SPADCALL |x| (QREFELT $ 17))
                   . #4=(|MATCAT-;zero?;SB;5|))
             (LETT #3# (SPADCALL |x| (QREFELT $ 18)) . #4#) G190
             (COND ((> |i| #3#) (GO G191)))
             (SEQ
              (EXIT
               (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 19)) . #4#)
                    (LETT #2# (SPADCALL |x| (QREFELT $ 20)) . #4#) G190
                    (COND ((> |j| #2#) (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |x| |i| |j| (QREFELT $ 22))
                                  (|spadConstant| $ 29) (QREFELT $ 25))
                        (PROGN (LETT #1# NIL . #4#) (GO #5=#:G772))))))
                    (LETT |j| (+ |j| 1) . #4#) (GO G190) G191 (EXIT NIL))))
             (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #5# (EXIT #1#)))) 

(SDEFUN |MATCAT-;zero;2NniS;6|
        ((|rows| |NonNegativeInteger|) (|cols| |NonNegativeInteger|) ($ S))
        (SPADCALL |rows| |cols| (|spadConstant| $ 29) (QREFELT $ 31))) 

(SDEFUN |MATCAT-;matrix;LS;7| ((|l| |List| (|List| R)) ($ S))
        (SPROG
         ((#1=#:G795 NIL) (|j| NIL) (#2=#:G796 NIL) (|r| NIL) (#3=#:G793 NIL)
          (|i| NIL) (#4=#:G794 NIL) (|ll| NIL) (|ans| (S))
          (|rows| (|NonNegativeInteger|)) (#5=#:G792 NIL)
          (|cols| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((NULL |l|) (SPADCALL 0 0 (|spadConstant| $ 29) (QREFELT $ 31)))
           ('T
            (SEQ (LETT |rows| 1 . #6=(|MATCAT-;matrix;LS;7|))
                 (LETT |cols| (LENGTH (|SPADfirst| |l|)) . #6#)
                 (SEQ (LETT |ll| NIL . #6#) (LETT #5# (CDR |l|) . #6#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |ll| (CAR #5#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |cols| (LENGTH |ll|) (QREFELT $ 33))
                          (|error| "matrix: rows of different lengths"))
                         ('T (LETT |rows| (+ |rows| 1) . #6#)))))
                      (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                 (LETT |ans|
                       (SPADCALL |rows| |cols| (|spadConstant| $ 29)
                                 (QREFELT $ 31))
                       . #6#)
                 (SEQ (LETT |ll| NIL . #6#) (LETT #4# |l| . #6#)
                      (LETT |i| (SPADCALL |ans| (QREFELT $ 17)) . #6#)
                      (LETT #3# (SPADCALL |ans| (QREFELT $ 18)) . #6#) G190
                      (COND
                       ((OR (> |i| #3#) (ATOM #4#)
                            (PROGN (LETT |ll| (CAR #4#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |r| NIL . #6#) (LETT #2# |ll| . #6#)
                             (LETT |j| (SPADCALL |ans| (QREFELT $ 19)) . #6#)
                             (LETT #1# (SPADCALL |ans| (QREFELT $ 20)) . #6#)
                             G190
                             (COND
                              ((OR (> |j| #1#) (ATOM #2#)
                                   (PROGN (LETT |r| (CAR #2#) . #6#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |ans| |i| |j| |r| (QREFELT $ 34))))
                             (LETT |j|
                                   (PROG1 (+ |j| 1) (LETT #2# (CDR #2#) . #6#))
                                   . #6#)
                             (GO G190) G191 (EXIT NIL))))
                      (LETT |i| (PROG1 (+ |i| 1) (LETT #4# (CDR #4#) . #6#))
                            . #6#)
                      (GO G190) G191 (EXIT NIL))
                 (EXIT |ans|))))))) 

(SDEFUN |MATCAT-;matrix;2NniMS;8|
        ((|n| |NonNegativeInteger|) (|m| |NonNegativeInteger|)
         (|f| |Mapping| R (|Integer|) (|Integer|)) ($ S))
        (SPROG
         ((#1=#:G803 NIL) (|j| NIL) (#2=#:G802 NIL) (|i| NIL) (|mat| (S)))
         (SEQ
          (LETT |mat| (SPADCALL |n| |m| (|spadConstant| $ 29) (QREFELT $ 31))
                . #3=(|MATCAT-;matrix;2NniMS;8|))
          (SEQ (LETT |i| (SPADCALL |mat| (QREFELT $ 17)) . #3#)
               (LETT #2# (SPADCALL |mat| (QREFELT $ 18)) . #3#) G190
               (COND ((> |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (SPADCALL |mat| (QREFELT $ 19)) . #3#)
                      (LETT #1# (SPADCALL |mat| (QREFELT $ 20)) . #3#) G190
                      (COND ((> |j| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |mat| |i| |j| (SPADCALL |i| |j| |f|)
                                  (QREFELT $ 34))))
                      (LETT |j| (+ |j| 1) . #3#) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |mat|)))) 

(SDEFUN |MATCAT-;scalarMatrix;NniRS;9|
        ((|n| |NonNegativeInteger|) (|r| R) ($ S))
        (SPROG
         ((#1=#:G807 NIL) (|i| NIL) (#2=#:G808 NIL) (|j| NIL) (|ans| (S)))
         (SEQ
          (LETT |ans| (SPADCALL |n| |n| (QREFELT $ 39))
                . #3=(|MATCAT-;scalarMatrix;NniRS;9|))
          (SEQ (LETT |j| (SPADCALL |ans| (QREFELT $ 19)) . #3#)
               (LETT #2# (SPADCALL |ans| (QREFELT $ 20)) . #3#)
               (LETT |i| (SPADCALL |ans| (QREFELT $ 17)) . #3#)
               (LETT #1# (SPADCALL |ans| (QREFELT $ 18)) . #3#) G190
               (COND ((OR (> |i| #1#) (> |j| #2#)) (GO G191)))
               (SEQ (EXIT (SPADCALL |ans| |i| |j| |r| (QREFELT $ 34))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1) . #3#)) . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |MATCAT-;diagonalMatrix;LS;10| ((|l| |List| R) ($ S))
        (SPROG
         ((#1=#:G812 NIL) (|i| NIL) (#2=#:G813 NIL) (|j| NIL) (#3=#:G814 NIL)
          (|r| NIL) (|ans| (S)) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |l|) . #4=(|MATCAT-;diagonalMatrix;LS;10|))
              (LETT |ans| (SPADCALL |n| |n| (QREFELT $ 39)) . #4#)
              (SEQ (LETT |r| NIL . #4#) (LETT #3# |l| . #4#)
                   (LETT |j| (SPADCALL |ans| (QREFELT $ 19)) . #4#)
                   (LETT #2# (SPADCALL |ans| (QREFELT $ 20)) . #4#)
                   (LETT |i| (SPADCALL |ans| (QREFELT $ 17)) . #4#)
                   (LETT #1# (SPADCALL |ans| (QREFELT $ 18)) . #4#) G190
                   (COND
                    ((OR (> |i| #1#) (> |j| #2#) (ATOM #3#)
                         (PROGN (LETT |r| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |ans| |i| |j| |r| (QREFELT $ 34))))
                   (LETT |i|
                         (PROG1 (+ |i| 1)
                           (LETT |j|
                                 (PROG1 (+ |j| 1) (LETT #3# (CDR #3#) . #4#))
                                 . #4#))
                         . #4#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;get_dims|
        ((|l| |List| S) ($ |List| (|List| (|NonNegativeInteger|))))
        (SPROG ((#1=#:G821 NIL) (|a| NIL) (#2=#:G820 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|MATCAT-;get_dims|))
                 (SEQ (LETT |a| NIL . #3#) (LETT #1# |l| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (LIST (SPADCALL |a| (QREFELT $ 11))
                                     (SPADCALL |a| (QREFELT $ 12)))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |MATCAT-;kronecker_prod1;SILL2NniUV;12|
        ((|res| S) (|k| |Integer|)
         (|dl| |List| (|List| (|NonNegativeInteger|))) (|l| |List| S)
         (|r_off| |NonNegativeInteger|) (|c_off| |NonNegativeInteger|)
         (|mu| |Union| R "one") ($ |Void|))
        (SPROG
         ((|c_off1| (|NonNegativeInteger|)) (|mm| (R)) (|aij| (R))
          (#1=#:G869 NIL) (|j| NIL) (#2=#:G868 NIL) (|i| NIL)
          (|c_step| #3=(|NonNegativeInteger|)) (#4=#:G867 NIL) (|rc| NIL)
          (#5=#:G866 NIL) (|r_step| #3#) (#6=#:G865 NIL) (#7=#:G864 NIL)
          (|c_ind| (|NonNegativeInteger|)) (#8=#:G863 NIL) (#9=#:G862 NIL)
          (|m| (R)) (|a| (S)) (|nc| #10=(|NonNegativeInteger|)) (|nr| #10#)
          (|dp| (|List| (|NonNegativeInteger|))))
         (SEQ
          (LETT |dp| (|SPADfirst| |dl|)
                . #11=(|MATCAT-;kronecker_prod1;SILL2NniUV;12|))
          (LETT |nr| (SPADCALL |dp| 1 (QREFELT $ 46)) . #11#)
          (LETT |nc| (SPADCALL |dp| 2 (QREFELT $ 46)) . #11#)
          (LETT |a| (|SPADfirst| |l|) . #11#)
          (COND ((QEQCAR |mu| 1) (COND ((EQL |k| 1) (EXIT |a|)))))
          (EXIT
           (COND
            ((EQL |k| 1)
             (COND ((QEQCAR |mu| 1) (|error| "kronecker_prod1: impossible"))
                   (#12='T
                    (SEQ (LETT |m| (QCDR |mu|) . #11#)
                         (EXIT
                          (SEQ (LETT |i| 1 . #11#) (LETT #9# |nr| . #11#) G190
                               (COND ((|greater_SI| |i| #9#) (GO G191)))
                               (SEQ (LETT |r_off| (+ |r_off| 1) . #11#)
                                    (LETT |c_ind| (+ |c_off| 1) . #11#)
                                    (EXIT
                                     (SEQ (LETT |j| 1 . #11#)
                                          (LETT #8# |nc| . #11#) G190
                                          (COND
                                           ((|greater_SI| |j| #8#) (GO G191)))
                                          (SEQ
                                           (QSETAREF2O |res| |r_off| |c_ind|
                                                       (SPADCALL |m|
                                                                 (QAREF2O |a|
                                                                          |i|
                                                                          |j| 1
                                                                          1)
                                                                 (QREFELT $
                                                                          47))
                                                       1 1)
                                           (EXIT
                                            (LETT |c_ind| (+ |c_ind| 1)
                                                  . #11#)))
                                          (LETT |j| (|inc_SI| |j|) . #11#)
                                          (GO G190) G191 (EXIT NIL))))
                               (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191
                               (EXIT NIL)))))))
            (#12#
             (SEQ (LETT |dl| (CDR |dl|) . #11#) (LETT |l| (CDR |l|) . #11#)
                  (LETT |r_step|
                        (SPADCALL (ELT $ 48)
                                  (PROGN
                                   (LETT #7# NIL . #11#)
                                   (SEQ (LETT |rc| NIL . #11#)
                                        (LETT #6# |dl| . #11#) G190
                                        (COND
                                         ((OR (ATOM #6#)
                                              (PROGN
                                               (LETT |rc| (CAR #6#) . #11#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #7#
                                                (CONS
                                                 (SPADCALL |rc| 1
                                                           (QREFELT $ 46))
                                                 #7#)
                                                . #11#)))
                                        (LETT #6# (CDR #6#) . #11#) (GO G190)
                                        G191 (EXIT (NREVERSE #7#))))
                                  (QREFELT $ 50))
                        . #11#)
                  (LETT |c_step|
                        (SPADCALL (ELT $ 48)
                                  (PROGN
                                   (LETT #5# NIL . #11#)
                                   (SEQ (LETT |rc| NIL . #11#)
                                        (LETT #4# |dl| . #11#) G190
                                        (COND
                                         ((OR (ATOM #4#)
                                              (PROGN
                                               (LETT |rc| (CAR #4#) . #11#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #5#
                                                (CONS
                                                 (SPADCALL |rc| 2
                                                           (QREFELT $ 46))
                                                 #5#)
                                                . #11#)))
                                        (LETT #4# (CDR #4#) . #11#) (GO G190)
                                        G191 (EXIT (NREVERSE #5#))))
                                  (QREFELT $ 50))
                        . #11#)
                  (EXIT
                   (SEQ (LETT |i| 1 . #11#) (LETT #2# |nr| . #11#) G190
                        (COND ((|greater_SI| |i| #2#) (GO G191)))
                        (SEQ (LETT |c_off1| |c_off| . #11#)
                             (SEQ (LETT |j| 1 . #11#) (LETT #1# |nc| . #11#)
                                  G190
                                  (COND ((|greater_SI| |j| #1#) (GO G191)))
                                  (SEQ
                                   (LETT |aij| (QAREF2O |a| |i| |j| 1 1)
                                         . #11#)
                                   (LETT |mm|
                                         (COND ((QEQCAR |mu| 1) |aij|)
                                               ('T
                                                (SPADCALL (QCDR |mu|) |aij|
                                                          (QREFELT $ 47))))
                                         . #11#)
                                   (SPADCALL |res| (- |k| 1) |dl| |l| |r_off|
                                             |c_off1| (CONS 0 |mm|)
                                             (QREFELT $ 55))
                                   (EXIT
                                    (LETT |c_off1| (+ |c_off1| |c_step|)
                                          . #11#)))
                                  (LETT |j| (|inc_SI| |j|) . #11#) (GO G190)
                                  G191 (EXIT NIL))
                             (EXIT (LETT |r_off| (+ |r_off| |r_step|) . #11#)))
                        (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191
                        (EXIT NIL)))))))))) 

(SDEFUN |MATCAT-;kroneckerProduct;LS;13| ((|l| |List| S) ($ S))
        (SPROG
         ((#1=#:G900 NIL) (|a| NIL) (|res| (S))
          (|nc| #2=(|NonNegativeInteger|)) (#3=#:G899 NIL) (|rc| NIL)
          (#4=#:G898 NIL) (|nr| #2#) (#5=#:G897 NIL) (#6=#:G896 NIL)
          (|dl| (|List| (|List| (|NonNegativeInteger|))))
          (|k| (|NonNegativeInteger|)))
         (SEQ (LETT |k| (LENGTH |l|) . #7=(|MATCAT-;kroneckerProduct;LS;13|))
              (EXIT
               (COND
                ((EQL |k| 0)
                 (COND
                  ((QEQCAR (QREFELT $ 44) 0)
                   (MAKE_MATRIX1 1 1 (QCDR (QREFELT $ 44))))
                  (#8='T (|error| "need 1"))))
                ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT $ 57)))
                (#8#
                 (SEQ (LETT |dl| (|MATCAT-;get_dims| |l| $) . #7#)
                      (LETT |nr|
                            (SPADCALL (ELT $ 48)
                                      (PROGN
                                       (LETT #6# NIL . #7#)
                                       (SEQ (LETT |rc| NIL . #7#)
                                            (LETT #5# |dl| . #7#) G190
                                            (COND
                                             ((OR (ATOM #5#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #5#) . #7#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #6#
                                                    (CONS
                                                     (SPADCALL |rc| 1
                                                               (QREFELT $ 46))
                                                     #6#)
                                                    . #7#)))
                                            (LETT #5# (CDR #5#) . #7#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #6#))))
                                      (QREFELT $ 50))
                            . #7#)
                      (LETT |nc|
                            (SPADCALL (ELT $ 48)
                                      (PROGN
                                       (LETT #4# NIL . #7#)
                                       (SEQ (LETT |rc| NIL . #7#)
                                            (LETT #3# |dl| . #7#) G190
                                            (COND
                                             ((OR (ATOM #3#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #3#) . #7#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #4#
                                                    (CONS
                                                     (SPADCALL |rc| 2
                                                               (QREFELT $ 46))
                                                     #4#)
                                                    . #7#)))
                                            (LETT #3# (CDR #3#) . #7#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #4#))))
                                      (QREFELT $ 50))
                            . #7#)
                      (LETT |res| (SPADCALL |nr| |nc| (QREFELT $ 39)) . #7#)
                      (SEQ (LETT |a| NIL . #7#) (LETT #1# |l| . #7#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |a| (CAR #1#) . #7#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SPADCALL |res| |k| |dl| |l| 0 0 (CONS 1 "one")
                                       (QREFELT $ 55))))
                           (LETT #1# (CDR #1#) . #7#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT |res|)))))))) 

(SDEFUN |MATCAT-;kroneckerProduct;3S;14| ((|a| S) (|b| S) ($ S))
        (SPADCALL (LIST |a| |b|) (QREFELT $ 59))) 

(SDEFUN |MATCAT-;kroneckerSum;LS;15| ((|l| |List| S) ($ S))
        (SPROG
         ((|n0| (|Integer|)) (|off0| (|NonNegativeInteger|))
          (|off_r| #1=(|NonNegativeInteger|)) (|ind_c| #1#) (|vv| (R))
          (#2=#:G940 NIL) (|j| NIL) (#3=#:G939 NIL) (#4=#:G938 NIL) (|i| NIL)
          (#5=#:G937 NIL) (|m| NIL) (|step0| (|NonNegativeInteger|))
          (|n2| (|NonNegativeInteger|)) (|dl| (|List| (|NonNegativeInteger|)))
          (|nr| (|NonNegativeInteger|)) (#6=#:G936 NIL) (|a| NIL) (|res| (S))
          (|nrs| (|NonNegativeInteger|)) (#7=#:G935 NIL) (#8=#:G934 NIL)
          (|nc| (|NonNegativeInteger|)) (#9=#:G933 NIL)
          (|k| (|NonNegativeInteger|)))
         (SEQ (LETT |k| (LENGTH |l|) . #10=(|MATCAT-;kroneckerSum;LS;15|))
              (EXIT
               (COND ((EQL |k| 0) (SPADCALL 1 1 (QREFELT $ 39)))
                     ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT $ 57)))
                     ('T
                      (SEQ (LETT |dl| NIL . #10#)
                           (SEQ (LETT |a| NIL . #10#) (LETT #9# |l| . #10#)
                                G190
                                (COND
                                 ((OR (ATOM #9#)
                                      (PROGN (LETT |a| (CAR #9#) . #10#) NIL))
                                  (GO G191)))
                                (SEQ (LETT |nr| (ANROWS |a|) . #10#)
                                     (LETT |nc| (ANCOLS |a|) . #10#)
                                     (EXIT
                                      (COND
                                       ((SPADCALL |nr| |nc| (QREFELT $ 33))
                                        (|error|
                                         "kroneckerSum: nonsquare matrix"))
                                       ('T
                                        (LETT |dl| (CONS |nr| |dl|) . #10#)))))
                                (LETT #9# (CDR #9#) . #10#) (GO G190) G191
                                (EXIT NIL))
                           (LETT |dl| (NREVERSE |dl|) . #10#)
                           (LETT |nrs|
                                 (SPADCALL (ELT $ 48)
                                           (PROGN
                                            (LETT #8# NIL . #10#)
                                            (SEQ (LETT |nr| NIL . #10#)
                                                 (LETT #7# |dl| . #10#) G190
                                                 (COND
                                                  ((OR (ATOM #7#)
                                                       (PROGN
                                                        (LETT |nr| (CAR #7#)
                                                              . #10#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #8# (CONS |nr| #8#)
                                                         . #10#)))
                                                 (LETT #7# (CDR #7#) . #10#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #8#))))
                                           (QREFELT $ 50))
                                 . #10#)
                           (LETT |res| (SPADCALL |nrs| |nrs| (QREFELT $ 39))
                                 . #10#)
                           (LETT |n0| 1 . #10#)
                           (SEQ (LETT |a| NIL . #10#) (LETT #6# |l| . #10#)
                                G190
                                (COND
                                 ((OR (ATOM #6#)
                                      (PROGN (LETT |a| (CAR #6#) . #10#) NIL))
                                  (GO G191)))
                                (SEQ (LETT |off0| 0 . #10#)
                                     (LETT |nr|
                                           (SPADCALL |dl| 1 (QREFELT $ 46))
                                           . #10#)
                                     (LETT |dl| (CDR |dl|) . #10#)
                                     (LETT |n2|
                                           (SPADCALL (ELT $ 48) |dl| 1
                                                     (QREFELT $ 61))
                                           . #10#)
                                     (LETT |step0| (* |nr| |n2|) . #10#)
                                     (SEQ (LETT |m| 1 . #10#)
                                          (LETT #5# |n0| . #10#) G190
                                          (COND
                                           ((|greater_SI| |m| #5#) (GO G191)))
                                          (SEQ
                                           (LETT |off_r| (+ |off0| 1) . #10#)
                                           (SEQ (LETT |i| 1 . #10#)
                                                (LETT #4# |nr| . #10#) G190
                                                (COND
                                                 ((|greater_SI| |i| #4#)
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (SEQ (LETT |l| 1 . #10#)
                                                       (LETT #3# |n2| . #10#)
                                                       G190
                                                       (COND
                                                        ((|greater_SI| |l| #3#)
                                                         (GO G191)))
                                                       (SEQ
                                                        (LETT |ind_c|
                                                              (+ |off0| |l|)
                                                              . #10#)
                                                        (SEQ
                                                         (LETT |j| 1 . #10#)
                                                         (LETT #2# |nr| . #10#)
                                                         G190
                                                         (COND
                                                          ((|greater_SI| |j|
                                                                         #2#)
                                                           (GO G191)))
                                                         (SEQ
                                                          (LETT |vv|
                                                                (SPADCALL
                                                                 (QAREF2O |res|
                                                                          |off_r|
                                                                          |ind_c|
                                                                          1 1)
                                                                 (QAREF2O |a|
                                                                          |i|
                                                                          |j| 1
                                                                          1)
                                                                 (QREFELT $
                                                                          62))
                                                                . #10#)
                                                          (QSETAREF2O |res|
                                                                      |off_r|
                                                                      |ind_c|
                                                                      |vv| 1 1)
                                                          (EXIT
                                                           (LETT |ind_c|
                                                                 (+ |ind_c|
                                                                    |n2|)
                                                                 . #10#)))
                                                         (LETT |j|
                                                               (|inc_SI| |j|)
                                                               . #10#)
                                                         (GO G190) G191
                                                         (EXIT NIL))
                                                        (EXIT
                                                         (LETT |off_r|
                                                               (+ |off_r| 1)
                                                               . #10#)))
                                                       (LETT |l| (|inc_SI| |l|)
                                                             . #10#)
                                                       (GO G190) G191
                                                       (EXIT NIL))))
                                                (LETT |i| (|inc_SI| |i|)
                                                      . #10#)
                                                (GO G190) G191 (EXIT NIL))
                                           (EXIT
                                            (LETT |off0| (+ |off0| |step0|)
                                                  . #10#)))
                                          (LETT |m| (|inc_SI| |m|) . #10#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT (LETT |n0| (* |n0| |nr|) . #10#)))
                                (LETT #6# (CDR #6#) . #10#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT |res|)))))))) 

(SDEFUN |MATCAT-;kroneckerSum;3S;16| ((|a| S) (|b| S) ($ S))
        (SPADCALL (LIST |a| |b|) (QREFELT $ 64))) 

(SDEFUN |MATCAT-;diagonalMatrix;LS;17| ((|list| |List| S) ($ S))
        (SPROG
         ((|loC| (|Integer|)) (|loR| (|Integer|)) (#1=#:G954 NIL) (|j| NIL)
          (#2=#:G955 NIL) (|l| NIL) (#3=#:G952 NIL) (|i| NIL) (#4=#:G953 NIL)
          (|k| NIL) (|hiC| #5=(|Integer|)) (|hiR| #5#) (#6=#:G951 NIL)
          (|mat| NIL) (|ans| (S)) (|cols| #7=(|NonNegativeInteger|))
          (|rows| #7#) (#8=#:G950 NIL))
         (SEQ (LETT |rows| 0 . #9=(|MATCAT-;diagonalMatrix;LS;17|))
              (LETT |cols| 0 . #9#)
              (SEQ (LETT |mat| NIL . #9#) (LETT #8# |list| . #9#) G190
                   (COND
                    ((OR (ATOM #8#) (PROGN (LETT |mat| (CAR #8#) . #9#) NIL))
                     (GO G191)))
                   (SEQ (LETT |rows| (+ |rows| (ANROWS |mat|)) . #9#)
                        (EXIT (LETT |cols| (+ |cols| (ANCOLS |mat|)) . #9#)))
                   (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL))
              (LETT |ans| (SPADCALL |rows| |cols| (QREFELT $ 39)) . #9#)
              (LETT |loR| 1 . #9#) (LETT |loC| 1 . #9#)
              (SEQ (LETT |mat| NIL . #9#) (LETT #6# |list| . #9#) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |mat| (CAR #6#) . #9#) NIL))
                     (GO G191)))
                   (SEQ (LETT |hiR| (- (+ |loR| (ANROWS |mat|)) 1) . #9#)
                        (LETT |hiC| (- (+ |loC| (ANROWS |mat|)) 1) . #9#)
                        (SEQ (LETT |k| 1 . #9#)
                             (LETT #4# (SPADCALL |mat| (QREFELT $ 18)) . #9#)
                             (LETT |i| |loR| . #9#) (LETT #3# |hiR| . #9#) G190
                             (COND
                              ((OR (> |i| #3#) (|greater_SI| |k| #4#))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |l| 1 . #9#)
                                    (LETT #2# (SPADCALL |mat| (QREFELT $ 20))
                                          . #9#)
                                    (LETT |j| |loC| . #9#)
                                    (LETT #1# |hiC| . #9#) G190
                                    (COND
                                     ((OR (> |j| #1#) (|greater_SI| |l| #2#))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (QSETAREF2O |ans| |i| |j|
                                                  (QAREF2O |mat| |k| |l| 1 1) 1
                                                  1)))
                                    (LETT |j|
                                          (PROG1 (+ |j| 1)
                                            (LETT |l| (|inc_SI| |l|) . #9#))
                                          . #9#)
                                    (GO G190) G191 (EXIT NIL))))
                             (LETT |i|
                                   (PROG1 (+ |i| 1)
                                     (LETT |k| (|inc_SI| |k|) . #9#))
                                   . #9#)
                             (GO G190) G191 (EXIT NIL))
                        (LETT |loR| (+ |hiR| 1) . #9#)
                        (EXIT (LETT |loC| (+ |hiC| 1) . #9#)))
                   (LETT #6# (CDR #6#) . #9#) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;kronecker_prod1;SILL2NniUV;18|
        ((|res| S) (|k| |Integer|)
         (|dl| |List| (|List| (|NonNegativeInteger|))) (|l| |List| S)
         (|r_off| |NonNegativeInteger|) (|c_off| |NonNegativeInteger|)
         (|mu| |Union| R "one") ($ |Void|))
        (SPROG
         ((|c_off1| (|NonNegativeInteger|)) (|mm| (R)) (|aij| (R))
          (#1=#:G993 NIL) (|j| NIL) (#2=#:G992 NIL) (|i| NIL)
          (|c_step| #3=(|NonNegativeInteger|)) (#4=#:G991 NIL) (|rc| NIL)
          (#5=#:G990 NIL) (|r_step| #3#) (#6=#:G989 NIL) (#7=#:G988 NIL)
          (|c_ind| (|NonNegativeInteger|)) (#8=#:G987 NIL) (#9=#:G986 NIL)
          (|m| (R)) (|a| (S)) (|nc| #10=(|NonNegativeInteger|)) (|nr| #10#)
          (|dp| (|List| (|NonNegativeInteger|))))
         (SEQ
          (LETT |dp| (|SPADfirst| |dl|)
                . #11=(|MATCAT-;kronecker_prod1;SILL2NniUV;18|))
          (LETT |nr| (SPADCALL |dp| 1 (QREFELT $ 46)) . #11#)
          (LETT |nc| (SPADCALL |dp| 2 (QREFELT $ 46)) . #11#)
          (LETT |a| (|SPADfirst| |l|) . #11#)
          (COND ((QEQCAR |mu| 1) (COND ((EQL |k| 1) (EXIT |a|)))))
          (EXIT
           (COND
            ((EQL |k| 1)
             (COND ((QEQCAR |mu| 1) (|error| "kronecker_prod1: impossible"))
                   (#12='T
                    (SEQ (LETT |m| (QCDR |mu|) . #11#)
                         (EXIT
                          (SEQ (LETT |i| 1 . #11#) (LETT #9# |nr| . #11#) G190
                               (COND ((|greater_SI| |i| #9#) (GO G191)))
                               (SEQ (LETT |r_off| (+ |r_off| 1) . #11#)
                                    (LETT |c_ind| (+ |c_off| 1) . #11#)
                                    (EXIT
                                     (SEQ (LETT |j| 1 . #11#)
                                          (LETT #8# |nc| . #11#) G190
                                          (COND
                                           ((|greater_SI| |j| #8#) (GO G191)))
                                          (SEQ
                                           (SPADCALL |res| |r_off| |c_ind|
                                                     (SPADCALL |m|
                                                               (SPADCALL |a|
                                                                         |i|
                                                                         |j|
                                                                         (QREFELT
                                                                          $
                                                                          22))
                                                               (QREFELT $ 47))
                                                     (QREFELT $ 34))
                                           (EXIT
                                            (LETT |c_ind| (+ |c_ind| 1)
                                                  . #11#)))
                                          (LETT |j| (|inc_SI| |j|) . #11#)
                                          (GO G190) G191 (EXIT NIL))))
                               (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191
                               (EXIT NIL)))))))
            (#12#
             (SEQ (LETT |dl| (CDR |dl|) . #11#) (LETT |l| (CDR |l|) . #11#)
                  (LETT |r_step|
                        (SPADCALL (ELT $ 48)
                                  (PROGN
                                   (LETT #7# NIL . #11#)
                                   (SEQ (LETT |rc| NIL . #11#)
                                        (LETT #6# |dl| . #11#) G190
                                        (COND
                                         ((OR (ATOM #6#)
                                              (PROGN
                                               (LETT |rc| (CAR #6#) . #11#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #7#
                                                (CONS
                                                 (SPADCALL |rc| 1
                                                           (QREFELT $ 46))
                                                 #7#)
                                                . #11#)))
                                        (LETT #6# (CDR #6#) . #11#) (GO G190)
                                        G191 (EXIT (NREVERSE #7#))))
                                  (QREFELT $ 50))
                        . #11#)
                  (LETT |c_step|
                        (SPADCALL (ELT $ 48)
                                  (PROGN
                                   (LETT #5# NIL . #11#)
                                   (SEQ (LETT |rc| NIL . #11#)
                                        (LETT #4# |dl| . #11#) G190
                                        (COND
                                         ((OR (ATOM #4#)
                                              (PROGN
                                               (LETT |rc| (CAR #4#) . #11#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #5#
                                                (CONS
                                                 (SPADCALL |rc| 2
                                                           (QREFELT $ 46))
                                                 #5#)
                                                . #11#)))
                                        (LETT #4# (CDR #4#) . #11#) (GO G190)
                                        G191 (EXIT (NREVERSE #5#))))
                                  (QREFELT $ 50))
                        . #11#)
                  (EXIT
                   (SEQ (LETT |i| 1 . #11#) (LETT #2# |nr| . #11#) G190
                        (COND ((|greater_SI| |i| #2#) (GO G191)))
                        (SEQ (LETT |c_off1| |c_off| . #11#)
                             (SEQ (LETT |j| 1 . #11#) (LETT #1# |nc| . #11#)
                                  G190
                                  (COND ((|greater_SI| |j| #1#) (GO G191)))
                                  (SEQ
                                   (LETT |aij|
                                         (SPADCALL |a| |i| |j| (QREFELT $ 22))
                                         . #11#)
                                   (LETT |mm|
                                         (COND ((QEQCAR |mu| 1) |aij|)
                                               ('T
                                                (SPADCALL (QCDR |mu|) |aij|
                                                          (QREFELT $ 47))))
                                         . #11#)
                                   (SPADCALL |res| (- |k| 1) |dl| |l| |r_off|
                                             |c_off1| (CONS 0 |mm|)
                                             (QREFELT $ 55))
                                   (EXIT
                                    (LETT |c_off1| (+ |c_off1| |c_step|)
                                          . #11#)))
                                  (LETT |j| (|inc_SI| |j|) . #11#) (GO G190)
                                  G191 (EXIT NIL))
                             (EXIT (LETT |r_off| (+ |r_off| |r_step|) . #11#)))
                        (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191
                        (EXIT NIL)))))))))) 

(SDEFUN |MATCAT-;kroneckerProduct;LS;19| ((|l| |List| S) ($ S))
        (SPROG
         ((#1=#:G1024 NIL) (|a| NIL) (|res| (S))
          (|nc| #2=(|NonNegativeInteger|)) (#3=#:G1023 NIL) (|rc| NIL)
          (#4=#:G1022 NIL) (|nr| #2#) (#5=#:G1021 NIL) (#6=#:G1020 NIL)
          (|dl| (|List| (|List| (|NonNegativeInteger|))))
          (|k| (|NonNegativeInteger|)))
         (SEQ (LETT |k| (LENGTH |l|) . #7=(|MATCAT-;kroneckerProduct;LS;19|))
              (EXIT
               (COND
                ((EQL |k| 0)
                 (COND
                  ((QEQCAR (QREFELT $ 44) 0)
                   (SPADCALL 1 1 (QCDR (QREFELT $ 44)) (QREFELT $ 31)))
                  (#8='T (|error| "need 1"))))
                ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT $ 57)))
                (#8#
                 (SEQ (LETT |dl| (|MATCAT-;get_dims| |l| $) . #7#)
                      (LETT |nr|
                            (SPADCALL (ELT $ 48)
                                      (PROGN
                                       (LETT #6# NIL . #7#)
                                       (SEQ (LETT |rc| NIL . #7#)
                                            (LETT #5# |dl| . #7#) G190
                                            (COND
                                             ((OR (ATOM #5#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #5#) . #7#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #6#
                                                    (CONS
                                                     (SPADCALL |rc| 1
                                                               (QREFELT $ 46))
                                                     #6#)
                                                    . #7#)))
                                            (LETT #5# (CDR #5#) . #7#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #6#))))
                                      (QREFELT $ 50))
                            . #7#)
                      (LETT |nc|
                            (SPADCALL (ELT $ 48)
                                      (PROGN
                                       (LETT #4# NIL . #7#)
                                       (SEQ (LETT |rc| NIL . #7#)
                                            (LETT #3# |dl| . #7#) G190
                                            (COND
                                             ((OR (ATOM #3#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #3#) . #7#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #4#
                                                    (CONS
                                                     (SPADCALL |rc| 2
                                                               (QREFELT $ 46))
                                                     #4#)
                                                    . #7#)))
                                            (LETT #3# (CDR #3#) . #7#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #4#))))
                                      (QREFELT $ 50))
                            . #7#)
                      (LETT |res| (SPADCALL |nr| |nc| (QREFELT $ 39)) . #7#)
                      (SEQ (LETT |a| NIL . #7#) (LETT #1# |l| . #7#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |a| (CAR #1#) . #7#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SPADCALL |res| |k| |dl| |l| 0 0 (CONS 1 "one")
                                       (QREFELT $ 55))))
                           (LETT #1# (CDR #1#) . #7#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT |res|)))))))) 

(SDEFUN |MATCAT-;kroneckerProduct;3S;20| ((|a| S) (|b| S) ($ S))
        (SPADCALL (LIST |a| |b|) (QREFELT $ 59))) 

(SDEFUN |MATCAT-;kroneckerSum;LS;21| ((|l| |List| S) ($ S))
        (SPROG
         ((|n0| (|Integer|)) (|off0| (|NonNegativeInteger|))
          (|off_r| #1=(|NonNegativeInteger|)) (|ind_c| #1#) (|vv| (R))
          (#2=#:G1064 NIL) (|j| NIL) (#3=#:G1063 NIL) (#4=#:G1062 NIL)
          (|i| NIL) (#5=#:G1061 NIL) (|m| NIL) (|step0| (|NonNegativeInteger|))
          (|n2| (|NonNegativeInteger|)) (|dl| (|List| (|NonNegativeInteger|)))
          (|nr| (|NonNegativeInteger|)) (#6=#:G1060 NIL) (|a| NIL) (|res| (S))
          (|nrs| (|NonNegativeInteger|)) (#7=#:G1059 NIL) (#8=#:G1058 NIL)
          (|nc| (|NonNegativeInteger|)) (#9=#:G1057 NIL)
          (|k| (|NonNegativeInteger|)))
         (SEQ (LETT |k| (LENGTH |l|) . #10=(|MATCAT-;kroneckerSum;LS;21|))
              (EXIT
               (COND ((EQL |k| 0) (SPADCALL 1 1 (QREFELT $ 39)))
                     ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT $ 57)))
                     ('T
                      (SEQ (LETT |dl| NIL . #10#)
                           (SEQ (LETT |a| NIL . #10#) (LETT #9# |l| . #10#)
                                G190
                                (COND
                                 ((OR (ATOM #9#)
                                      (PROGN (LETT |a| (CAR #9#) . #10#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (LETT |nr| (SPADCALL |a| (QREFELT $ 11))
                                       . #10#)
                                 (LETT |nc| (SPADCALL |a| (QREFELT $ 12))
                                       . #10#)
                                 (EXIT
                                  (COND
                                   ((SPADCALL |nr| |nc| (QREFELT $ 33))
                                    (|error| "kroneckerSum: nonsquare matrix"))
                                   ('T (LETT |dl| (CONS |nr| |dl|) . #10#)))))
                                (LETT #9# (CDR #9#) . #10#) (GO G190) G191
                                (EXIT NIL))
                           (LETT |dl| (NREVERSE |dl|) . #10#)
                           (LETT |nrs|
                                 (SPADCALL (ELT $ 48)
                                           (PROGN
                                            (LETT #8# NIL . #10#)
                                            (SEQ (LETT |nr| NIL . #10#)
                                                 (LETT #7# |dl| . #10#) G190
                                                 (COND
                                                  ((OR (ATOM #7#)
                                                       (PROGN
                                                        (LETT |nr| (CAR #7#)
                                                              . #10#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #8# (CONS |nr| #8#)
                                                         . #10#)))
                                                 (LETT #7# (CDR #7#) . #10#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #8#))))
                                           (QREFELT $ 50))
                                 . #10#)
                           (LETT |res| (SPADCALL |nrs| |nrs| (QREFELT $ 39))
                                 . #10#)
                           (LETT |n0| 1 . #10#)
                           (SEQ (LETT |a| NIL . #10#) (LETT #6# |l| . #10#)
                                G190
                                (COND
                                 ((OR (ATOM #6#)
                                      (PROGN (LETT |a| (CAR #6#) . #10#) NIL))
                                  (GO G191)))
                                (SEQ (LETT |off0| 0 . #10#)
                                     (LETT |nr|
                                           (SPADCALL |dl| 1 (QREFELT $ 46))
                                           . #10#)
                                     (LETT |dl| (CDR |dl|) . #10#)
                                     (LETT |n2|
                                           (SPADCALL (ELT $ 48) |dl| 1
                                                     (QREFELT $ 61))
                                           . #10#)
                                     (LETT |step0| (* |nr| |n2|) . #10#)
                                     (SEQ (LETT |m| 1 . #10#)
                                          (LETT #5# |n0| . #10#) G190
                                          (COND
                                           ((|greater_SI| |m| #5#) (GO G191)))
                                          (SEQ
                                           (LETT |off_r| (+ |off0| 1) . #10#)
                                           (SEQ (LETT |i| 1 . #10#)
                                                (LETT #4# |nr| . #10#) G190
                                                (COND
                                                 ((|greater_SI| |i| #4#)
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (SEQ (LETT |l| 1 . #10#)
                                                       (LETT #3# |n2| . #10#)
                                                       G190
                                                       (COND
                                                        ((|greater_SI| |l| #3#)
                                                         (GO G191)))
                                                       (SEQ
                                                        (LETT |ind_c|
                                                              (+ |off0| |l|)
                                                              . #10#)
                                                        (SEQ
                                                         (LETT |j| 1 . #10#)
                                                         (LETT #2# |nr| . #10#)
                                                         G190
                                                         (COND
                                                          ((|greater_SI| |j|
                                                                         #2#)
                                                           (GO G191)))
                                                         (SEQ
                                                          (LETT |vv|
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  |res| |off_r|
                                                                  |ind_c|
                                                                  (QREFELT $
                                                                           22))
                                                                 (SPADCALL |a|
                                                                           |i|
                                                                           |j|
                                                                           (QREFELT
                                                                            $
                                                                            22))
                                                                 (QREFELT $
                                                                          62))
                                                                . #10#)
                                                          (SPADCALL |res|
                                                                    |off_r|
                                                                    |ind_c|
                                                                    |vv|
                                                                    (QREFELT $
                                                                             34))
                                                          (EXIT
                                                           (LETT |ind_c|
                                                                 (+ |ind_c|
                                                                    |n2|)
                                                                 . #10#)))
                                                         (LETT |j|
                                                               (|inc_SI| |j|)
                                                               . #10#)
                                                         (GO G190) G191
                                                         (EXIT NIL))
                                                        (EXIT
                                                         (LETT |off_r|
                                                               (+ |off_r| 1)
                                                               . #10#)))
                                                       (LETT |l| (|inc_SI| |l|)
                                                             . #10#)
                                                       (GO G190) G191
                                                       (EXIT NIL))))
                                                (LETT |i| (|inc_SI| |i|)
                                                      . #10#)
                                                (GO G190) G191 (EXIT NIL))
                                           (EXIT
                                            (LETT |off0| (+ |off0| |step0|)
                                                  . #10#)))
                                          (LETT |m| (|inc_SI| |m|) . #10#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT (LETT |n0| (* |n0| |nr|) . #10#)))
                                (LETT #6# (CDR #6#) . #10#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT |res|)))))))) 

(SDEFUN |MATCAT-;kroneckerSum;3S;22| ((|a| S) (|b| S) ($ S))
        (SPADCALL (LIST |a| |b|) (QREFELT $ 64))) 

(SDEFUN |MATCAT-;diagonalMatrix;LS;23| ((|list| |List| S) ($ S))
        (SPROG
         ((|loC| (|Integer|)) (|loR| (|Integer|)) (#1=#:G1078 NIL) (|j| NIL)
          (#2=#:G1079 NIL) (|l| NIL) (#3=#:G1076 NIL) (|i| NIL)
          (#4=#:G1077 NIL) (|k| NIL) (|hiC| #5=(|Integer|)) (|hiR| #5#)
          (#6=#:G1075 NIL) (|mat| NIL) (|ans| (S))
          (|cols| #7=(|NonNegativeInteger|)) (|rows| #7#) (#8=#:G1074 NIL))
         (SEQ (LETT |rows| 0 . #9=(|MATCAT-;diagonalMatrix;LS;23|))
              (LETT |cols| 0 . #9#)
              (SEQ (LETT |mat| NIL . #9#) (LETT #8# |list| . #9#) G190
                   (COND
                    ((OR (ATOM #8#) (PROGN (LETT |mat| (CAR #8#) . #9#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |rows| (+ |rows| (SPADCALL |mat| (QREFELT $ 11)))
                          . #9#)
                    (EXIT
                     (LETT |cols| (+ |cols| (SPADCALL |mat| (QREFELT $ 12)))
                           . #9#)))
                   (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL))
              (LETT |ans| (SPADCALL |rows| |cols| (QREFELT $ 39)) . #9#)
              (LETT |loR| (SPADCALL |ans| (QREFELT $ 17)) . #9#)
              (LETT |loC| (SPADCALL |ans| (QREFELT $ 19)) . #9#)
              (SEQ (LETT |mat| NIL . #9#) (LETT #6# |list| . #9#) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |mat| (CAR #6#) . #9#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |hiR| (- (+ |loR| (SPADCALL |mat| (QREFELT $ 11))) 1)
                          . #9#)
                    (LETT |hiC| (- (+ |loC| (SPADCALL |mat| (QREFELT $ 11))) 1)
                          . #9#)
                    (SEQ (LETT |k| (SPADCALL |mat| (QREFELT $ 17)) . #9#)
                         (LETT #4# (SPADCALL |mat| (QREFELT $ 18)) . #9#)
                         (LETT |i| |loR| . #9#) (LETT #3# |hiR| . #9#) G190
                         (COND ((OR (> |i| #3#) (> |k| #4#)) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ
                            (LETT |l| (SPADCALL |mat| (QREFELT $ 19)) . #9#)
                            (LETT #2# (SPADCALL |mat| (QREFELT $ 20)) . #9#)
                            (LETT |j| |loC| . #9#) (LETT #1# |hiC| . #9#) G190
                            (COND ((OR (> |j| #1#) (> |l| #2#)) (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL |ans| |i| |j|
                                        (SPADCALL |mat| |k| |l| (QREFELT $ 22))
                                        (QREFELT $ 34))))
                            (LETT |j|
                                  (PROG1 (+ |j| 1) (LETT |l| (+ |l| 1) . #9#))
                                  . #9#)
                            (GO G190) G191 (EXIT NIL))))
                         (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #9#))
                               . #9#)
                         (GO G190) G191 (EXIT NIL))
                    (LETT |loR| (+ |hiR| 1) . #9#)
                    (EXIT (LETT |loC| (+ |hiC| 1) . #9#)))
                   (LETT #6# (CDR #6#) . #9#) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;coerce;ColS;24| ((|v| |Col|) ($ S))
        (SPROG
         ((#1=#:G1083 NIL) (|i| NIL) (#2=#:G1084 NIL) (|k| NIL)
          (|one| (|Integer|)) (|x| (S)))
         (SEQ
          (LETT |x|
                (SPADCALL (SPADCALL |v| (QREFELT $ 67)) 1 (|spadConstant| $ 29)
                          (QREFELT $ 31))
                . #3=(|MATCAT-;coerce;ColS;24|))
          (LETT |one| (SPADCALL |x| (QREFELT $ 19)) . #3#)
          (SEQ (LETT |k| (SPADCALL |v| (QREFELT $ 68)) . #3#)
               (LETT #2# (SPADCALL |v| (QREFELT $ 69)) . #3#)
               (LETT |i| (SPADCALL |x| (QREFELT $ 17)) . #3#)
               (LETT #1# (SPADCALL |x| (QREFELT $ 18)) . #3#) G190
               (COND ((OR (> |i| #1#) (> |k| #2#)) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |x| |i| |one| (SPADCALL |v| |k| (QREFELT $ 70))
                           (QREFELT $ 34))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #3#)) . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |x|)))) 

(SDEFUN |MATCAT-;transpose;RowS;25| ((|v| |Row|) ($ S))
        (SPROG
         ((#1=#:G1088 NIL) (|j| NIL) (#2=#:G1089 NIL) (|k| NIL)
          (|one| (|Integer|)) (|x| (S)))
         (SEQ
          (LETT |x|
                (SPADCALL 1 (SPADCALL |v| (QREFELT $ 72)) (|spadConstant| $ 29)
                          (QREFELT $ 31))
                . #3=(|MATCAT-;transpose;RowS;25|))
          (LETT |one| (SPADCALL |x| (QREFELT $ 17)) . #3#)
          (SEQ (LETT |k| (SPADCALL |v| (QREFELT $ 73)) . #3#)
               (LETT #2# (SPADCALL |v| (QREFELT $ 74)) . #3#)
               (LETT |j| (SPADCALL |x| (QREFELT $ 19)) . #3#)
               (LETT #1# (SPADCALL |x| (QREFELT $ 20)) . #3#) G190
               (COND ((OR (> |j| #1#) (> |k| #2#)) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |x| |one| |j| (SPADCALL |v| |k| (QREFELT $ 75))
                           (QREFELT $ 34))))
               (LETT |j| (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1) . #3#)) . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |x|)))) 

(SDEFUN |MATCAT-;+;3S;26| ((|x| S) (|y| S) ($ S))
        (SPROG
         ((#1=#:G1099 NIL) (|j| NIL) (#2=#:G1098 NIL) (|i| NIL) (|ans| (S))
          (|c| (|NonNegativeInteger|)) (|r| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((OR
             (SPADCALL
              (LETT |r| (SPADCALL |x| (QREFELT $ 11)) . #3=(|MATCAT-;+;3S;26|))
              (SPADCALL |y| (QREFELT $ 11)) (QREFELT $ 33))
             (SPADCALL (LETT |c| (SPADCALL |x| (QREFELT $ 12)) . #3#)
                       (SPADCALL |y| (QREFELT $ 12)) (QREFELT $ 33)))
            (|error| "can't add matrices of different dimensions"))
           ('T
            (SEQ
             (LETT |ans|
                   (SPADCALL |r| |c| (|spadConstant| $ 29) (QREFELT $ 31))
                   . #3#)
             (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 17)) . #3#)
                  (LETT #2# (SPADCALL |x| (QREFELT $ 18)) . #3#) G190
                  (COND ((> |i| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 19)) . #3#)
                         (LETT #1# (SPADCALL |x| (QREFELT $ 20)) . #3#) G190
                         (COND ((> |j| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |ans| |i| |j|
                                     (SPADCALL
                                      (SPADCALL |x| |i| |j| (QREFELT $ 22))
                                      (SPADCALL |y| |i| |j| (QREFELT $ 22))
                                      (QREFELT $ 62))
                                     (QREFELT $ 34))))
                         (LETT |j| (+ |j| 1) . #3#) (GO G190) G191
                         (EXIT NIL))))
                  (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
             (EXIT |ans|))))))) 

(SDEFUN |MATCAT-;-;3S;27| ((|x| S) (|y| S) ($ S))
        (SPROG
         ((#1=#:G1109 NIL) (|j| NIL) (#2=#:G1108 NIL) (|i| NIL) (|ans| (S))
          (|c| (|NonNegativeInteger|)) (|r| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((OR
             (SPADCALL
              (LETT |r| (SPADCALL |x| (QREFELT $ 11)) . #3=(|MATCAT-;-;3S;27|))
              (SPADCALL |y| (QREFELT $ 11)) (QREFELT $ 33))
             (SPADCALL (LETT |c| (SPADCALL |x| (QREFELT $ 12)) . #3#)
                       (SPADCALL |y| (QREFELT $ 12)) (QREFELT $ 33)))
            (|error| "can't subtract matrices of different dimensions"))
           ('T
            (SEQ
             (LETT |ans|
                   (SPADCALL |r| |c| (|spadConstant| $ 29) (QREFELT $ 31))
                   . #3#)
             (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 17)) . #3#)
                  (LETT #2# (SPADCALL |x| (QREFELT $ 18)) . #3#) G190
                  (COND ((> |i| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 19)) . #3#)
                         (LETT #1# (SPADCALL |x| (QREFELT $ 20)) . #3#) G190
                         (COND ((> |j| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |ans| |i| |j|
                                     (SPADCALL
                                      (SPADCALL |x| |i| |j| (QREFELT $ 22))
                                      (SPADCALL |y| |i| |j| (QREFELT $ 22))
                                      (QREFELT $ 78))
                                     (QREFELT $ 34))))
                         (LETT |j| (+ |j| 1) . #3#) (GO G190) G191
                         (EXIT NIL))))
                  (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
             (EXIT |ans|))))))) 

(SDEFUN |MATCAT-;-;2S;28| ((|x| S) ($ S))
        (SPADCALL (ELT $ 27) |x| (QREFELT $ 81))) 

(SDEFUN |MATCAT-;*;I2S;29| ((|m| |Integer|) (|x| S) ($ S))
        (SPROG NIL
               (SPADCALL (CONS #'|MATCAT-;*;I2S;29!0| (VECTOR $ |m|)) |x|
                         (QREFELT $ 81)))) 

(SDEFUN |MATCAT-;*;I2S;29!0| ((|r1| NIL) ($$ NIL))
        (PROG (|m| $)
          (LETT |m| (QREFELT $$ 1) . #1=(|MATCAT-;*;I2S;29|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |m| |r1| (QREFELT $ 83)))))) 

(SDEFUN |MATCAT-;*;R2S;30| ((|a| R) (|x| S) ($ S))
        (SPROG NIL
               (SPADCALL (CONS #'|MATCAT-;*;R2S;30!0| (VECTOR $ |a|)) |x|
                         (QREFELT $ 81)))) 

(SDEFUN |MATCAT-;*;R2S;30!0| ((|r1| NIL) ($$ NIL))
        (PROG (|a| $)
          (LETT |a| (QREFELT $$ 1) . #1=(|MATCAT-;*;R2S;30|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |a| |r1| (QREFELT $ 47)))))) 

(SDEFUN |MATCAT-;*;SRS;31| ((|x| S) (|a| R) ($ S))
        (SPROG NIL
               (SPADCALL (CONS #'|MATCAT-;*;SRS;31!0| (VECTOR $ |a|)) |x|
                         (QREFELT $ 81)))) 

(SDEFUN |MATCAT-;*;SRS;31!0| ((|r1| NIL) ($$ NIL))
        (PROG (|a| $)
          (LETT |a| (QREFELT $$ 1) . #1=(|MATCAT-;*;SRS;31|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |r1| |a| (QREFELT $ 47)))))) 

(SDEFUN |MATCAT-;*;3S;32| ((|x| S) (|y| S) ($ S))
        (SPROG
         ((|entry| (R)) (|sum| (R)) (#1=#:G1127 NIL) (|k| NIL) (#2=#:G1128 NIL)
          (|l| NIL) (#3=#:G1126 NIL) (|j| NIL) (#4=#:G1125 NIL) (|i| NIL)
          (|ans| (S)))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |x| (QREFELT $ 12))
                      (SPADCALL |y| (QREFELT $ 11)) (QREFELT $ 21))
            (|error| "can't multiply matrices of incompatible dimensions"))
           ('T
            (SEQ
             (LETT |ans|
                   (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                             (SPADCALL |y| (QREFELT $ 12))
                             (|spadConstant| $ 29) (QREFELT $ 31))
                   . #5=(|MATCAT-;*;3S;32|))
             (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 17)) . #5#)
                  (LETT #4# (SPADCALL |x| (QREFELT $ 18)) . #5#) G190
                  (COND ((> |i| #4#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 19)) . #5#)
                         (LETT #3# (SPADCALL |y| (QREFELT $ 20)) . #5#) G190
                         (COND ((> |j| #3#) (GO G191)))
                         (SEQ
                          (LETT |entry|
                                (SEQ (LETT |sum| (|spadConstant| $ 29) . #5#)
                                     (SEQ
                                      (LETT |l| (SPADCALL |x| (QREFELT $ 19))
                                            . #5#)
                                      (LETT #2# (SPADCALL |x| (QREFELT $ 20))
                                            . #5#)
                                      (LETT |k| (SPADCALL |y| (QREFELT $ 17))
                                            . #5#)
                                      (LETT #1# (SPADCALL |y| (QREFELT $ 18))
                                            . #5#)
                                      G190
                                      (COND
                                       ((OR (> |k| #1#) (> |l| #2#))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT |sum|
                                              (SPADCALL |sum|
                                                        (SPADCALL
                                                         (SPADCALL |x| |i| |l|
                                                                   (QREFELT $
                                                                            22))
                                                         (SPADCALL |y| |k| |j|
                                                                   (QREFELT $
                                                                            22))
                                                         (QREFELT $ 47))
                                                        (QREFELT $ 62))
                                              . #5#)))
                                      (LETT |k|
                                            (PROG1 (+ |k| 1)
                                              (LETT |l| (+ |l| 1) . #5#))
                                            . #5#)
                                      (GO G190) G191 (EXIT NIL))
                                     (EXIT |sum|))
                                . #5#)
                          (EXIT
                           (SPADCALL |ans| |i| |j| |entry| (QREFELT $ 34))))
                         (LETT |j| (+ |j| 1) . #5#) (GO G190) G191
                         (EXIT NIL))))
                  (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
             (EXIT |ans|))))))) 

(SDEFUN |MATCAT-;positivePower;SIS;33| ((|x| S) (|n| |Integer|) ($ S))
        (SPROG ((|y| (S)))
               (SEQ
                (COND ((EQL |n| 1) |x|)
                      ((ODDP |n|)
                       (SPADCALL |x| (SPADCALL |x| (- |n| 1) (QREFELT $ 88))
                                 (QREFELT $ 89)))
                      ('T
                       (SEQ
                        (LETT |y|
                              (SPADCALL |x| (QUOTIENT2 |n| 2) (QREFELT $ 88))
                              |MATCAT-;positivePower;SIS;33|)
                        (EXIT (SPADCALL |y| |y| (QREFELT $ 89))))))))) 

(SDEFUN |MATCAT-;^;SNniS;34| ((|x| S) (|n| |NonNegativeInteger|) ($ S))
        (SPROG ((|nn| (|NonNegativeInteger|)))
               (COND
                ((NULL
                  (EQL
                   (LETT |nn| (SPADCALL |x| (QREFELT $ 11))
                         |MATCAT-;^;SNniS;34|)
                   (SPADCALL |x| (QREFELT $ 12))))
                 (|error| "^: matrix must be square"))
                ('T
                 (COND
                  ((ZEROP |n|)
                   (SPADCALL |nn| (|spadConstant| $ 43) (QREFELT $ 91)))
                  ('T (SPADCALL |x| |n| (QREFELT $ 88)))))))) 

(SDEFUN |MATCAT-;*;S2Col;35| ((|x| S) (|v| |Col|) ($ |Col|))
        (SPROG
         ((|sum| (R)) (#1=#:G1143 NIL) (|j| NIL) (#2=#:G1144 NIL) (|l| NIL)
          (#3=#:G1141 NIL) (|i| NIL) (#4=#:G1142 NIL) (|k| NIL) (|w| (|Col|)))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |x| (QREFELT $ 12))
                      (SPADCALL |v| (QREFELT $ 67)) (QREFELT $ 21))
            (|error| "can't multiply matrix A and vector v if #cols A ~= #v"))
           ('T
            (SEQ
             (LETT |w|
                   (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                             (|spadConstant| $ 29) (QREFELT $ 93))
                   . #5=(|MATCAT-;*;S2Col;35|))
             (SEQ (LETT |k| (SPADCALL |w| (QREFELT $ 68)) . #5#)
                  (LETT #4# (SPADCALL |w| (QREFELT $ 69)) . #5#)
                  (LETT |i| (SPADCALL |x| (QREFELT $ 17)) . #5#)
                  (LETT #3# (SPADCALL |x| (QREFELT $ 18)) . #5#) G190
                  (COND ((OR (> |i| #3#) (> |k| #4#)) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |w| |k|
                              (SEQ (LETT |sum| (|spadConstant| $ 29) . #5#)
                                   (SEQ
                                    (LETT |l| (SPADCALL |v| (QREFELT $ 68))
                                          . #5#)
                                    (LETT #2# (SPADCALL |v| (QREFELT $ 69))
                                          . #5#)
                                    (LETT |j| (SPADCALL |x| (QREFELT $ 19))
                                          . #5#)
                                    (LETT #1# (SPADCALL |x| (QREFELT $ 20))
                                          . #5#)
                                    G190
                                    (COND
                                     ((OR (> |j| #1#) (> |l| #2#)) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |sum|
                                            (SPADCALL |sum|
                                                      (SPADCALL
                                                       (SPADCALL |x| |i| |j|
                                                                 (QREFELT $
                                                                          22))
                                                       (SPADCALL |v| |l|
                                                                 (QREFELT $
                                                                          94))
                                                       (QREFELT $ 47))
                                                      (QREFELT $ 62))
                                            . #5#)))
                                    (LETT |j|
                                          (PROG1 (+ |j| 1)
                                            (LETT |l| (+ |l| 1) . #5#))
                                          . #5#)
                                    (GO G190) G191 (EXIT NIL))
                                   (EXIT |sum|))
                              (QREFELT $ 95))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1) . #5#)) . #5#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT |w|))))))) 

(SDEFUN |MATCAT-;*;RowSRow;36| ((|v| |Row|) (|x| S) ($ |Row|))
        (SPROG
         ((|sum| (R)) (#1=#:G1153 NIL) (|i| NIL) (#2=#:G1154 NIL) (|l| NIL)
          (#3=#:G1151 NIL) (|j| NIL) (#4=#:G1152 NIL) (|k| NIL) (|w| (|Row|)))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |x| (QREFELT $ 11))
                      (SPADCALL |v| (QREFELT $ 72)) (QREFELT $ 21))
            (|error| "can't multiply vector v and matrix A if #rows A ~= #v"))
           ('T
            (SEQ
             (LETT |w|
                   (SPADCALL (SPADCALL |x| (QREFELT $ 12))
                             (|spadConstant| $ 29) (QREFELT $ 97))
                   . #5=(|MATCAT-;*;RowSRow;36|))
             (SEQ (LETT |k| (SPADCALL |w| (QREFELT $ 73)) . #5#)
                  (LETT #4# (SPADCALL |w| (QREFELT $ 74)) . #5#)
                  (LETT |j| (SPADCALL |x| (QREFELT $ 19)) . #5#)
                  (LETT #3# (SPADCALL |x| (QREFELT $ 20)) . #5#) G190
                  (COND ((OR (> |j| #3#) (> |k| #4#)) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |w| |k|
                              (SEQ (LETT |sum| (|spadConstant| $ 29) . #5#)
                                   (SEQ
                                    (LETT |l| (SPADCALL |v| (QREFELT $ 73))
                                          . #5#)
                                    (LETT #2# (SPADCALL |v| (QREFELT $ 74))
                                          . #5#)
                                    (LETT |i| (SPADCALL |x| (QREFELT $ 17))
                                          . #5#)
                                    (LETT #1# (SPADCALL |x| (QREFELT $ 18))
                                          . #5#)
                                    G190
                                    (COND
                                     ((OR (> |i| #1#) (> |l| #2#)) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |sum|
                                            (SPADCALL |sum|
                                                      (SPADCALL
                                                       (SPADCALL |x| |i| |j|
                                                                 (QREFELT $
                                                                          22))
                                                       (SPADCALL |v| |l|
                                                                 (QREFELT $
                                                                          98))
                                                       (QREFELT $ 47))
                                                      (QREFELT $ 62))
                                            . #5#)))
                                    (LETT |i|
                                          (PROG1 (+ |i| 1)
                                            (LETT |l| (+ |l| 1) . #5#))
                                          . #5#)
                                    (GO G190) G191 (EXIT NIL))
                                   (EXIT |sum|))
                              (QREFELT $ 99))))
                  (LETT |j| (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1) . #5#)) . #5#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT |w|))))))) 

(SDEFUN |MATCAT-;columnSpace;SL;37| ((M S) ($ |List| |Col|))
        (SPROG
         ((|indRow| (|Integer|)) (|basis| (|List| |Col|)) (#1=#:G1160 NIL)
          (|k| NIL) (|m| (|Integer|)) (|n| (|Integer|)) (M2 (S)))
         (SEQ
          (LETT M2 (SPADCALL M (QREFELT $ 101))
                . #2=(|MATCAT-;columnSpace;SL;37|))
          (LETT |basis| NIL . #2#) (LETT |n| (SPADCALL M (QREFELT $ 12)) . #2#)
          (LETT |m| (SPADCALL M (QREFELT $ 11)) . #2#) (LETT |indRow| 1 . #2#)
          (SEQ (LETT |k| 1 . #2#) (LETT #1# |n| . #2#) G190
               (COND
                ((OR (|greater_SI| |k| #1#)
                     (NULL (SPADCALL |indRow| |m| (QREFELT $ 102))))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((NULL
                    (SPADCALL (SPADCALL M2 |indRow| |k| (QREFELT $ 103))
                              (QREFELT $ 23)))
                   (SEQ
                    (LETT |basis|
                          (CONS (SPADCALL M |k| (QREFELT $ 104)) |basis|)
                          . #2#)
                    (EXIT (LETT |indRow| (+ |indRow| 1) . #2#)))))))
               (LETT |k| (|inc_SI| |k|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (NREVERSE |basis|))))) 

(SDEFUN |MATCAT-;B0| ((|n| |PositiveInteger|) ($ S))
        (SPROG
         ((#1=#:G1173 NIL) (|j| NIL) (#2=#:G1172 NIL) (#3=#:G1171 NIL)
          (|i| NIL) (#4=#:G1170 NIL))
         (SEQ
          (SPADCALL
           (PROGN
            (LETT #4# NIL . #5=(|MATCAT-;B0|))
            (SEQ (LETT |i| 1 . #5#) (LETT #3# |n| . #5#) G190
                 (COND ((|greater_SI| |i| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #4#
                         (CONS
                          (PROGN
                           (LETT #2# NIL . #5#)
                           (SEQ (LETT |j| 1 . #5#) (LETT #1# |n| . #5#) G190
                                (COND ((|greater_SI| |j| #1#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (COND
                                          ((EQL |i| (+ |j| 1))
                                           (COND
                                            ((ODDP |j|)
                                             (SPADCALL (|spadConstant| $ 43)
                                                       (QREFELT $ 27)))
                                            ((EQL |i| (- |j| 1))
                                             (COND
                                              ((ODDP |i|)
                                               (|spadConstant| $ 43))
                                              ('T (|spadConstant| $ 29))))
                                            ('T (|spadConstant| $ 29))))
                                          ((EQL |i| (- |j| 1))
                                           (COND
                                            ((ODDP |i|) (|spadConstant| $ 43))
                                            ('T (|spadConstant| $ 29))))
                                          ('T (|spadConstant| $ 29)))
                                         #2#)
                                        . #5#)))
                                (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          #4#)
                         . #5#)))
                 (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                 (EXIT (NREVERSE #4#))))
           (QREFELT $ 107))))) 

(SDEFUN |MATCAT-;PfChar| ((A S) ($ . #1=(|SparseUnivariatePolynomial| R)))
        (SPROG
         ((|res| (|SparseUnivariatePolynomial| R)) (#2=#:G1188 NIL) (|e| NIL)
          (#3=#:G1189 NIL) (|k| NIL) (|c| (R)) (#4=#:G1186 NIL) (|i| NIL)
          (#5=#:G1187 NIL) (|j| NIL) (|g| (|List| R)) (C (S)) (#6=#:G1185 NIL)
          (B (S)) (#7=#:G1175 NIL) (|d| (|NonNegativeInteger|)) (|p| #1#)
          (|s| (S)) (|r| (S)) (M (S)) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (SPADCALL A (QREFELT $ 11)) . #8=(|MATCAT-;PfChar|))
              (EXIT
               (COND
                ((EQL |n| 2)
                 (SPADCALL (SPADCALL (|spadConstant| $ 43) 2 (QREFELT $ 109))
                           (SPADCALL (SPADCALL A 1 2 (QREFELT $ 22))
                                     (QREFELT $ 110))
                           (QREFELT $ 111)))
                ('T
                 (SEQ (LETT M (SPADCALL A 3 |n| 3 |n| (QREFELT $ 112)) . #8#)
                      (LETT |r| (SPADCALL A 1 1 3 |n| (QREFELT $ 112)) . #8#)
                      (LETT |s| (SPADCALL A 3 |n| 2 2 (QREFELT $ 112)) . #8#)
                      (LETT |p| (|MATCAT-;PfChar| M $) . #8#)
                      (LETT |d| (SPADCALL |p| (QREFELT $ 113)) . #8#)
                      (LETT B
                            (|MATCAT-;B0|
                             (PROG1 (LETT #7# (- |n| 2) . #8#)
                               (|check_subtype2| (> #7# 0) '(|PositiveInteger|)
                                                 '(|Integer|) #7#))
                             $)
                            . #8#)
                      (LETT C (SPADCALL |r| B (QREFELT $ 89)) . #8#)
                      (LETT |g|
                            (LIST
                             (SPADCALL (SPADCALL C |s| (QREFELT $ 89)) 1 1
                                       (QREFELT $ 22))
                             (SPADCALL A 1 2 (QREFELT $ 22))
                             (|spadConstant| $ 43))
                            . #8#)
                      (COND
                       ((>= |d| 4)
                        (SEQ (LETT B (SPADCALL M B (QREFELT $ 89)) . #8#)
                             (EXIT
                              (SEQ (LETT |i| 4 . #8#) (LETT #6# |d| . #8#) G190
                                   (COND ((> |i| #6#) (GO G191)))
                                   (SEQ
                                    (LETT C (SPADCALL C B (QREFELT $ 89))
                                          . #8#)
                                    (EXIT
                                     (LETT |g|
                                           (CONS
                                            (SPADCALL
                                             (SPADCALL C |s| (QREFELT $ 89)) 1
                                             1 (QREFELT $ 22))
                                            |g|)
                                           . #8#)))
                                   (LETT |i| (+ |i| 2) . #8#) (GO G190) G191
                                   (EXIT NIL))))))
                      (LETT |g| (NREVERSE |g|) . #8#)
                      (LETT |res| (|spadConstant| $ 114) . #8#)
                      (SEQ (LETT |j| 2 . #8#) (LETT #5# (+ |d| 2) . #8#)
                           (LETT |i| 0 . #8#) (LETT #4# |d| . #8#) G190
                           (COND
                            ((OR (> |i| #4#) (|greater_SI| |j| #5#))
                             (GO G191)))
                           (SEQ
                            (LETT |c| (SPADCALL |p| |i| (QREFELT $ 115)) . #8#)
                            (EXIT
                             (SEQ (LETT |k| 2 . #8#) (LETT #3# (- |d|) . #8#)
                                  (LETT |e| NIL . #8#)
                                  (LETT #2# (SPADCALL |g| |j| (QREFELT $ 116))
                                        . #8#)
                                  G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |e| (CAR #2#) . #8#) NIL)
                                        (< |k| #3#))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT |res|
                                          (SPADCALL |res|
                                                    (SPADCALL
                                                     (SPADCALL |c| |e|
                                                               (QREFELT $ 47))
                                                     (+ |k| |i|)
                                                     (QREFELT $ 109))
                                                    (QREFELT $ 111))
                                          . #8#)))
                                  (LETT #2#
                                        (PROG1 (CDR #2#)
                                          (LETT |k| (+ |k| -2) . #8#))
                                        . #8#)
                                  (GO G190) G191 (EXIT NIL))))
                           (LETT |i|
                                 (PROG1 (+ |i| 2)
                                   (LETT |j| (|inc_SI| |j|) . #8#))
                                 . #8#)
                           (GO G190) G191 (EXIT NIL))
                      (EXIT |res|)))))))) 

(SDEFUN |MATCAT-;Pfaffian;SR;40| ((A S) ($ R))
        (COND
         ((SPADCALL A (QREFELT $ 117))
          (COND ((ODDP (SPADCALL A (QREFELT $ 11))) (|spadConstant| $ 29))
                (#1='T
                 (SPADCALL (|MATCAT-;PfChar| A $) (|spadConstant| $ 29)
                           (QREFELT $ 118)))))
         (#1#
          (|error|
           "Pfaffian: only defined for antisymmetric square matrices!")))) 

(SDEFUN |MATCAT-;exquo;SRU;41| ((|x| S) (|a| R) ($ |Union| S "failed"))
        (SPROG
         ((|entry| (R)) (#1=#:G1209 NIL) (|r| (|Union| R "failed"))
          (#2=#:G1211 NIL) (|j| NIL) (#3=#:G1210 NIL) (|i| NIL) (|ans| (S)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ans|
                  (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                            (SPADCALL |x| (QREFELT $ 12)) (|spadConstant| $ 29)
                            (QREFELT $ 31))
                  . #4=(|MATCAT-;exquo;SRU;41|))
            (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 17)) . #4#)
                 (LETT #3# (SPADCALL |x| (QREFELT $ 18)) . #4#) G190
                 (COND ((> |i| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 19)) . #4#)
                        (LETT #2# (SPADCALL |x| (QREFELT $ 20)) . #4#) G190
                        (COND ((> |j| #2#) (GO G191)))
                        (SEQ
                         (LETT |entry|
                               (SEQ
                                (LETT |r|
                                      (SPADCALL
                                       (SPADCALL |x| |i| |j| (QREFELT $ 22))
                                       |a| (QREFELT $ 121))
                                      . #4#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |r| 1)
                                   (PROGN
                                    (LETT #1# (CONS 1 "failed") . #4#)
                                    (GO #5=#:G1208)))
                                  ('T (QCDR |r|)))))
                               . #4#)
                         (EXIT
                          (SPADCALL |ans| |i| |j| |entry| (QREFELT $ 34))))
                        (LETT |j| (+ |j| 1) . #4#) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |ans|))))
          #5# (EXIT #1#)))) 

(SDEFUN |MATCAT-;/;SRS;42| ((|x| S) (|r| R) ($ S))
        (SPROG NIL
               (SPADCALL (CONS #'|MATCAT-;/;SRS;42!0| (VECTOR $ |r|)) |x|
                         (QREFELT $ 81)))) 

(SDEFUN |MATCAT-;/;SRS;42!0| ((|r1| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1) . #1=(|MATCAT-;/;SRS;42|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |r1| |r| (QREFELT $ 123)))))) 

(SDEFUN |MATCAT-;^;SIS;43| ((|x| S) (|n| |Integer|) ($ S))
        (SPROG ((|xInv| (|Union| S "failed")) (|nn| (|NonNegativeInteger|)))
               (SEQ
                (COND
                 ((NULL
                   (EQL
                    (LETT |nn| (SPADCALL |x| (QREFELT $ 11))
                          . #1=(|MATCAT-;^;SIS;43|))
                    (SPADCALL |x| (QREFELT $ 12))))
                  (|error| "^: matrix must be square"))
                 ('T
                  (COND
                   ((ZEROP |n|)
                    (SPADCALL |nn| (|spadConstant| $ 43) (QREFELT $ 91)))
                   ((SPADCALL |n| (QREFELT $ 125))
                    (SPADCALL |x| |n| (QREFELT $ 88)))
                   (#2='T
                    (SEQ (LETT |xInv| (SPADCALL |x| (QREFELT $ 126)) . #1#)
                         (EXIT
                          (COND
                           ((QEQCAR |xInv| 1)
                            (|error| "^: matrix must be invertible"))
                           (#2#
                            (SPADCALL (QCDR |xInv|) (- |n|)
                                      (QREFELT $ 88))))))))))))) 

(DECLAIM (NOTINLINE |MatrixCategory&;|)) 

(DEFUN |MatrixCategory&| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|MatrixCategory&|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|MatrixCategory&| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 129) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#2|
                                                       '(|EuclideanDomain|))
                                        (|HasCategory| |#2| '(|Field|))
                                        (|HasCategory| |#2|
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#2| '(|Monoid|))
                                        (|HasCategory| |#2| '(|SemiRng|))
                                        (|HasCategory| |#2|
                                                       '(|AbelianGroup|))))
                    . #1#))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 7)
      (QSETREFV $ 28
                (CONS (|dispatchFunction| |MATCAT-;antisymmetric?;SB;4|) $))))
    (QSETREFV $ 44
              (COND
               ((|HasCategory| |#2| '(|SemiRing|))
                (CONS 0 (|spadConstant| $ 43)))
               ('T (CONS 1 "one"))))
    (COND
     ((|domainEqual| |#1| (|Matrix| |#2|))
      (PROGN
       (COND
        ((|testBitVector| |pv$| 6)
         (PROGN
          (QSETREFV $ 56
                    (CONS
                     (|dispatchFunction|
                      |MATCAT-;kronecker_prod1;SILL2NniUV;12|)
                     $))
          (QSETREFV $ 58
                    (CONS (|dispatchFunction| |MATCAT-;kroneckerProduct;LS;13|)
                          $))
          (QSETREFV $ 60
                    (CONS (|dispatchFunction| |MATCAT-;kroneckerProduct;3S;14|)
                          $)))))
       (QSETREFV $ 63
                 (CONS (|dispatchFunction| |MATCAT-;kroneckerSum;LS;15|) $))
       (QSETREFV $ 65
                 (CONS (|dispatchFunction| |MATCAT-;kroneckerSum;3S;16|) $))
       (QSETREFV $ 66
                 (CONS (|dispatchFunction| |MATCAT-;diagonalMatrix;LS;17|)
                       $))))
     ('T
      (PROGN
       (COND
        ((|testBitVector| |pv$| 6)
         (PROGN
          (QSETREFV $ 56
                    (CONS
                     (|dispatchFunction|
                      |MATCAT-;kronecker_prod1;SILL2NniUV;18|)
                     $))
          (QSETREFV $ 58
                    (CONS (|dispatchFunction| |MATCAT-;kroneckerProduct;LS;19|)
                          $))
          (QSETREFV $ 60
                    (CONS (|dispatchFunction| |MATCAT-;kroneckerProduct;3S;20|)
                          $)))))
       (QSETREFV $ 63
                 (CONS (|dispatchFunction| |MATCAT-;kroneckerSum;LS;21|) $))
       (QSETREFV $ 65
                 (CONS (|dispatchFunction| |MATCAT-;kroneckerSum;3S;22|) $))
       (QSETREFV $ 66
                 (CONS (|dispatchFunction| |MATCAT-;diagonalMatrix;LS;23|)
                       $)))))
    (COND
     ((|testBitVector| |pv$| 7)
      (PROGN
       (QSETREFV $ 79 (CONS (|dispatchFunction| |MATCAT-;-;3S;27|) $))
       (QSETREFV $ 82 (CONS (|dispatchFunction| |MATCAT-;-;2S;28|) $))
       (QSETREFV $ 84 (CONS (|dispatchFunction| |MATCAT-;*;I2S;29|) $)))))
    (COND
     ((|testBitVector| |pv$| 6)
      (PROGN
       (QSETREFV $ 85 (CONS (|dispatchFunction| |MATCAT-;*;R2S;30|) $))
       (QSETREFV $ 86 (CONS (|dispatchFunction| |MATCAT-;*;SRS;31|) $))
       (QSETREFV $ 87 (CONS (|dispatchFunction| |MATCAT-;*;3S;32|) $))
       (QSETREFV $ 90
                 (CONS (|dispatchFunction| |MATCAT-;positivePower;SIS;33|)
                       $)))))
    (COND
     ((|testBitVector| |pv$| 5)
      (QSETREFV $ 92 (CONS (|dispatchFunction| |MATCAT-;^;SNniS;34|) $))))
    (COND
     ((|HasCategory| |#4| '(|shallowlyMutable|))
      (QSETREFV $ 96 (CONS (|dispatchFunction| |MATCAT-;*;S2Col;35|) $))))
    (COND
     ((|HasCategory| |#3| '(|shallowlyMutable|))
      (QSETREFV $ 100 (CONS (|dispatchFunction| |MATCAT-;*;RowSRow;36|) $))))
    (COND
     ((|testBitVector| |pv$| 2)
      (QSETREFV $ 106
                (CONS (|dispatchFunction| |MATCAT-;columnSpace;SL;37|) $))))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 119
                 (CONS (|dispatchFunction| |MATCAT-;Pfaffian;SR;40|) $)))))
    (COND
     ((|testBitVector| |pv$| 4)
      (QSETREFV $ 122 (CONS (|dispatchFunction| |MATCAT-;exquo;SRU;41|) $))))
    (COND
     ((|testBitVector| |pv$| 3)
      (PROGN
       (QSETREFV $ 124 (CONS (|dispatchFunction| |MATCAT-;/;SRS;42|) $))
       (QSETREFV $ 127 (CONS (|dispatchFunction| |MATCAT-;^;SIS;43|) $)))))
    $))) 

(MAKEPROP '|MatrixCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|NonNegativeInteger|)
              (0 . |nrows|) (5 . |ncols|) (|Boolean|) |MATCAT-;square?;SB;1|
              (10 . |square?|) (|Integer|) (15 . |minRowIndex|)
              (20 . |maxRowIndex|) (25 . |minColIndex|) (30 . |maxColIndex|)
              (35 . ~=) (41 . |qelt|) (48 . |zero?|) |MATCAT-;diagonal?;SB;2|
              (53 . ~=) |MATCAT-;symmetric?;SB;3| (59 . -)
              (64 . |antisymmetric?|) (69 . |Zero|) |MATCAT-;zero?;SB;5|
              (73 . |new|) |MATCAT-;zero;2NniS;6| (80 . ~=) (86 . |qsetelt!|)
              (|List| 41) |MATCAT-;matrix;LS;7| (|Mapping| 7 16 16)
              |MATCAT-;matrix;2NniMS;8| (94 . |zero|)
              |MATCAT-;scalarMatrix;NniRS;9| (|List| 7)
              |MATCAT-;diagonalMatrix;LS;10| (100 . |One|) '|maybe_1|
              (|List| 10) (104 . |elt|) (110 . *) (116 . *)
              (|Mapping| 10 10 10) (122 . |reduce|) (|Void|) (|List| 45)
              (|List| $) (|Union| 7 '"one") (128 . |kronecker_prod1|)
              (139 . |kronecker_prod1|) (150 . |copy|)
              (155 . |kroneckerProduct|) (160 . |kroneckerProduct|)
              (165 . |kroneckerProduct|) (171 . |reduce|) (178 . +)
              (184 . |kroneckerSum|) (189 . |kroneckerSum|)
              (194 . |kroneckerSum|) (200 . |diagonalMatrix|) (205 . |#|)
              (210 . |minIndex|) (215 . |maxIndex|) (220 . |qelt|)
              |MATCAT-;coerce;ColS;24| (226 . |#|) (231 . |minIndex|)
              (236 . |maxIndex|) (241 . |qelt|) |MATCAT-;transpose;RowS;25|
              |MATCAT-;+;3S;26| (247 . -) (253 . -) (|Mapping| 7 7)
              (259 . |map|) (265 . -) (270 . *) (276 . *) (282 . *) (288 . *)
              (294 . *) (300 . |positivePower|) (306 . *)
              (312 . |positivePower|) (318 . |scalarMatrix|) (324 . ^)
              (330 . |new|) (336 . |elt|) (342 . |setelt!|) (349 . *)
              (355 . |new|) (361 . |elt|) (367 . |setelt!|) (374 . *)
              (380 . |rowEchelon|) (385 . <=) (391 . |elt|) (398 . |column|)
              (|List| 9) (404 . |columnSpace|) (409 . |matrix|)
              (|SparseUnivariatePolynomial| 7) (414 . |monomial|)
              (420 . |coerce|) (425 . +) (431 . |subMatrix|) (440 . |degree|)
              (445 . |Zero|) (449 . |coefficient|) (455 . |first|)
              (461 . |antisymmetric?|) (466 . |elt|) (472 . |Pfaffian|)
              (|Union| $ '"failed") (477 . |exquo|) (483 . |exquo|) (489 . /)
              (495 . /) (501 . |positive?|) (506 . |inverse|) (511 . ^)
              (|OutputForm|))
           '#(|zero?| 517 |zero| 522 |transpose| 528 |symmetric?| 533 |square?|
              538 |scalarMatrix| 543 |positivePower| 549 |matrix| 555
              |kronecker_prod1| 567 |kroneckerSum| 578 |kroneckerProduct| 589
              |exquo| 600 |diagonalMatrix| 606 |diagonal?| 616 |columnSpace|
              621 |coerce| 626 |antisymmetric?| 631 ^ 636 |Pfaffian| 648 / 653
              - 659 + 670 * 676)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 127
                                                 '(1 6 10 0 11 1 6 10 0 12 1 6
                                                   13 0 15 1 6 16 0 17 1 6 16 0
                                                   18 1 6 16 0 19 1 6 16 0 20 2
                                                   16 13 0 0 21 3 6 7 0 16 16
                                                   22 1 7 13 0 23 2 7 13 0 0 25
                                                   1 7 0 0 27 1 0 13 0 28 0 7 0
                                                   29 3 6 0 10 10 7 31 2 10 13
                                                   0 0 33 4 6 7 0 16 16 7 34 2
                                                   6 0 10 10 39 0 7 0 43 2 45
                                                   10 0 16 46 2 7 0 0 0 47 2 10
                                                   0 0 0 48 2 45 10 49 0 50 7 6
                                                   51 0 16 52 53 10 10 54 55 7
                                                   0 51 0 16 52 53 10 10 54 56
                                                   1 6 0 0 57 1 0 0 53 58 1 6 0
                                                   53 59 2 0 0 0 0 60 3 45 10
                                                   49 0 10 61 2 7 0 0 0 62 1 0
                                                   0 53 63 1 6 0 53 64 2 0 0 0
                                                   0 65 1 0 0 53 66 1 9 10 0 67
                                                   1 9 16 0 68 1 9 16 0 69 2 9
                                                   7 0 16 70 1 8 10 0 72 1 8 16
                                                   0 73 1 8 16 0 74 2 8 7 0 16
                                                   75 2 7 0 0 0 78 2 0 0 0 0 79
                                                   2 6 0 80 0 81 1 0 0 0 82 2 7
                                                   0 16 0 83 2 0 0 16 0 84 2 0
                                                   0 7 0 85 2 0 0 0 7 86 2 0 0
                                                   0 0 87 2 6 0 0 16 88 2 6 0 0
                                                   0 89 2 0 0 0 16 90 2 6 0 10
                                                   7 91 2 0 0 0 10 92 2 9 0 10
                                                   7 93 2 9 7 0 16 94 3 9 7 0
                                                   16 7 95 2 0 9 0 9 96 2 8 0
                                                   10 7 97 2 8 7 0 16 98 3 8 7
                                                   0 16 7 99 2 0 8 8 0 100 1 6
                                                   0 0 101 2 16 13 0 0 102 3 6
                                                   7 0 16 16 103 2 6 9 0 16 104
                                                   1 0 105 0 106 1 6 0 35 107 2
                                                   108 0 7 10 109 1 108 0 7 110
                                                   2 108 0 0 0 111 5 6 0 0 16
                                                   16 16 16 112 1 108 10 0 113
                                                   0 108 0 114 2 108 7 0 10 115
                                                   2 41 0 0 10 116 1 6 13 0 117
                                                   2 108 7 0 7 118 1 0 7 0 119
                                                   2 7 120 0 0 121 2 0 120 0 7
                                                   122 2 7 0 0 0 123 2 0 0 0 7
                                                   124 1 16 13 0 125 1 6 120 0
                                                   126 2 0 0 0 16 127 1 0 13 0
                                                   30 2 0 0 10 10 32 1 0 0 8 76
                                                   1 0 13 0 26 1 0 13 0 14 2 0
                                                   0 10 7 40 2 0 0 0 16 90 3 0
                                                   0 10 10 37 38 1 0 0 35 36 7
                                                   0 51 0 16 52 53 10 10 54 56
                                                   1 0 0 53 63 2 0 0 0 0 65 1 0
                                                   0 53 58 2 0 0 0 0 60 2 0 120
                                                   0 7 122 1 0 0 53 66 1 0 0 41
                                                   42 1 0 13 0 24 1 0 105 0 106
                                                   1 0 0 9 71 1 0 13 0 28 2 0 0
                                                   0 16 127 2 0 0 0 10 92 1 0 7
                                                   0 119 2 0 0 0 7 124 1 0 0 0
                                                   82 2 0 0 0 0 79 2 0 0 0 0 77
                                                   2 0 8 8 0 100 2 0 0 0 7 86 2
                                                   0 9 0 9 96 2 0 0 0 0 87 2 0
                                                   0 7 0 85 2 0 0 16 0 84)))))
           '|lookupComplete|)) 
