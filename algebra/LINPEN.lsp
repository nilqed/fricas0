
(SDEFUN |LINPEN;qnew;3Nni$;1|
        ((|m| |NonNegativeInteger|) (|n| |NonNegativeInteger|)
         (|l| |NonNegativeInteger|) ($ $))
        (SPROG
         ((#1=#:G512 NIL) (|k| NIL) (|A_lst| (|List| (|Matrix| R)))
          (|A_ref| (|Matrix| R)))
         (SEQ (LETT |A_ref| (MAKE_MATRIX1 |m| |n| (|spadConstant| $ 8)))
              (LETT |A_lst| (SPADCALL |l| |A_ref| (QREFELT $ 12)))
              (SEQ (LETT |k| 2) (LETT #1# |l|) G190
                   (COND ((|greater_SI| |k| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |A_lst| |k|
                               (MAKE_MATRIX1 |m| |n| (|spadConstant| $ 8))
                               (QREFELT $ 14))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR |m| |n| |A_lst|))))) 

(SDEFUN |LINPEN;copy;2$;2| ((|p| $) ($ $))
        (SPROG ((#1=#:G517 NIL) (|k| NIL) (|A_lst| (|List| (|Matrix| R))))
               (SEQ (LETT |A_lst| (SPADCALL (QVELT |p| 2) (QREFELT $ 16)))
                    (SEQ (LETT |k| 1) (LETT #1# (LENGTH |A_lst|)) G190
                         (COND ((|greater_SI| |k| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |A_lst| |k|
                                     (SPADCALL
                                      (SPADCALL (QVELT |p| 2) |k|
                                                (QREFELT $ 17))
                                      (QREFELT $ 18))
                                     (QREFELT $ 14))))
                         (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                    (EXIT (VECTOR (QVELT |p| 0) (QVELT |p| 1) |A_lst|))))) 

(SDEFUN |LINPEN;append;$Nni$;3| ((|p| $) (|l| |NonNegativeInteger|) ($ $))
        (SPROG
         ((#1=#:G524 NIL) (|k| NIL) (#2=#:G523 NIL)
          (|n| (|NonNegativeInteger|)) (|m| (|NonNegativeInteger|))
          (|A_lst| (|List| (|Matrix| R))) (|A_ref| (|Matrix| R)))
         (SEQ
          (LETT |A_ref|
                (SPADCALL (SPADCALL (QVELT |p| 2) 1 (QREFELT $ 17))
                          (QREFELT $ 18)))
          (LETT |A_lst|
                (SPADCALL (+ (LENGTH (QVELT |p| 2)) |l|) |A_ref|
                          (QREFELT $ 12)))
          (LETT |m| (ANROWS |A_ref|)) (LETT |n| (ANCOLS |A_ref|))
          (SEQ (LETT |k| 2) (LETT #2# (LENGTH (QVELT |p| 2))) G190
               (COND ((|greater_SI| |k| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |A_lst| |k|
                           (SPADCALL
                            (SPADCALL (QVELT |p| 2) |k| (QREFELT $ 17))
                            (QREFELT $ 18))
                           (QREFELT $ 14))))
               (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |k| 1) (LETT #1# |l|) G190
               (COND ((|greater_SI| |k| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |A_lst| (+ (LENGTH (QVELT |p| 2)) |k|)
                           (MAKE_MATRIX1 |m| |n| (|spadConstant| $ 8))
                           (QREFELT $ 14))))
               (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR (QVELT |p| 0) (QVELT |p| 1) |A_lst|))))) 

(SDEFUN |LINPEN;append!;$Nni$;4| ((|p| $) (|l| |NonNegativeInteger|) ($ $))
        (SPROG
         ((#1=#:G529 NIL) (|k| NIL) (|n| (|NonNegativeInteger|))
          (|m| (|NonNegativeInteger|)) (|A_lst| (|List| (|Matrix| R)))
          (|A_ref| (|Matrix| R)))
         (SEQ (LETT |A_ref| (SPADCALL (QVELT |p| 2) 1 (QREFELT $ 17)))
              (LETT |A_lst| (SPADCALL |l| |A_ref| (QREFELT $ 12)))
              (LETT |m| (ANROWS |A_ref|)) (LETT |n| (ANCOLS |A_ref|))
              (SEQ (LETT |k| 1) (LETT #1# |l|) G190
                   (COND ((|greater_SI| |k| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |A_lst| |k|
                               (MAKE_MATRIX1 |m| |n| (|spadConstant| $ 8))
                               (QREFELT $ 14))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (QSETVELT |p| 2 (SPADCALL (QVELT |p| 2) |A_lst| (QREFELT $ 22)))
              (EXIT |p|)))) 

(SDEFUN |LINPEN;coerce;$Of;5| ((|p| $) ($ |OutputForm|))
        (SPADCALL (QVELT |p| 2) (QREFELT $ 25))) 

(PUT '|LINPEN;nrows;$Nni;6| '|SPADreplace| '(XLAM (|p|) (QVELT |p| 0))) 

(SDEFUN |LINPEN;nrows;$Nni;6| ((|p| $) ($ |NonNegativeInteger|)) (QVELT |p| 0)) 

(PUT '|LINPEN;ncols;$Nni;7| '|SPADreplace| '(XLAM (|p|) (QVELT |p| 1))) 

(SDEFUN |LINPEN;ncols;$Nni;7| ((|p| $) ($ |NonNegativeInteger|)) (QVELT |p| 1)) 

(SDEFUN |LINPEN;nelem;$Nni;8| ((|p| $) ($ |NonNegativeInteger|))
        (LENGTH (QVELT |p| 2))) 

(SDEFUN |LINPEN;=;2$B;9| ((|p| $) (|q| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G543 NIL) (|flg_wrk| (|Boolean|)) (#2=#:G545 NIL) (|k| NIL)
          (#3=#:G544 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |flg_wrk| 'T)
                (COND
                 ((NULL (EQL (LENGTH (QVELT |p| 2)) (LENGTH (QVELT |q| 2))))
                  (COND
                   ((NULL (EQL (QVELT |p| 1) (QVELT |q| 1)))
                    (COND
                     ((NULL (EQL (QVELT |p| 0) (QVELT |q| 0)))
                      (PROGN (LETT #3# NIL) (GO #4=#:G542))))))))
                (SEQ
                 (EXIT
                  (SEQ (LETT |k| 1) (LETT #2# (LENGTH (QVELT |p| 2))) G190
                       (COND ((|greater_SI| |k| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL
                            (SPADCALL
                             (SPADCALL (QVELT |p| 2) |k| (QREFELT $ 17))
                             (SPADCALL (QVELT |q| 2) |k| (QREFELT $ 17))
                             (QREFELT $ 31)))
                           (SEQ (LETT |flg_wrk| NIL)
                                (EXIT
                                 (PROGN
                                  (LETT #1# |$NoValue|)
                                  (GO #5=#:G540))))))))
                       (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL)))
                 #5# (EXIT #1#))
                (EXIT |flg_wrk|)))
          #4# (EXIT #3#)))) 

(SDEFUN |LINPEN;equal?;$L$LB;10|
        ((|p| $) (|lst_p| |List| (|NonNegativeInteger|)) (|q| $)
         (|lst_q| |List| (|NonNegativeInteger|)) ($ |Boolean|))
        (SPROG
         ((#1=#:G561 NIL) (#2=#:G564 NIL) (|k| NIL) (#3=#:G563 NIL)
          (|l_q| #4=(|NonNegativeInteger|)) (|l_p| #4#) (#5=#:G562 NIL)
          (|flg_q| #6=(|List| (|Boolean|))) (|flg_p| #6#))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |lst_p| (QREFELT $ 34))
                       (SPADCALL |lst_q| (QREFELT $ 34)) (QREFELT $ 35))
             (|error|
              "LINPEN: equal?(%,lst_p,%,lst_q) - index lists have different lengths."))
            ('T
             (SEQ
              (COND
               ((NULL (EQL (QVELT |p| 1) (QVELT |q| 1)))
                (COND
                 ((NULL (EQL (QVELT |p| 0) (QVELT |q| 0)))
                  (PROGN (LETT #1# NIL) (GO #7=#:G560))))))
              (LETT |flg_p|
                    (SPADCALL (LENGTH (QVELT |p| 2)) 'T (QREFELT $ 37)))
              (LETT |flg_q|
                    (SPADCALL (LENGTH (QVELT |q| 2)) 'T (QREFELT $ 37)))
              (SEQ (LETT |k| 1) (LETT #5# (SPADCALL |lst_p| (QREFELT $ 34)))
                   G190 (COND ((|greater_SI| |k| #5#) (GO G191)))
                   (SEQ (LETT |l_p| (SPADCALL |lst_p| |k| (QREFELT $ 38)))
                        (LETT |l_q| (SPADCALL |lst_q| |k| (QREFELT $ 38)))
                        (COND
                         ((NULL
                           (SPADCALL
                            (SPADCALL (QVELT |p| 2) |l_p| (QREFELT $ 17))
                            (SPADCALL (QVELT |q| 2) |l_q| (QREFELT $ 17))
                            (QREFELT $ 31)))
                          (PROGN (LETT #1# NIL) (GO #7#))))
                        (SPADCALL |flg_p| |l_p| NIL (QREFELT $ 39))
                        (EXIT (SPADCALL |flg_q| |l_q| NIL (QREFELT $ 39))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |k| 1) (LETT #3# (LENGTH (QVELT |p| 2))) G190
                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |flg_p| |k| (QREFELT $ 40))
                       (COND
                        ((NULL
                          (SPADCALL (SPADCALL (QVELT |p| 2) |k| (QREFELT $ 17))
                                    (QREFELT $ 41)))
                         (PROGN (LETT #1# NIL) (GO #7#))))))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |k| 1) (LETT #2# (LENGTH (QVELT |q| 2))) G190
                   (COND ((|greater_SI| |k| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |flg_q| |k| (QREFELT $ 40))
                       (COND
                        ((NULL
                          (SPADCALL (SPADCALL (QVELT |q| 2) |k| (QREFELT $ 17))
                                    (QREFELT $ 41)))
                         (PROGN (LETT #1# NIL) (GO #7#))))))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT 'T)))))
          #7# (EXIT #1#)))) 

(SDEFUN |LINPEN;qequal?;$L$LNniB;11|
        ((|p| $) (|lst_p| |List| (|NonNegativeInteger|)) (|q| $)
         (|lst_q| |List| (|NonNegativeInteger|)) (|off| |NonNegativeInteger|)
         ($ |Boolean|))
        (SPROG
         ((#1=#:G581 NIL) (#2=#:G586 NIL) (|k| NIL) (#3=#:G585 NIL)
          (#4=#:G584 NIL) (|j| NIL) (#5=#:G583 NIL) (|i| NIL)
          (|A_q| #6=(|Matrix| R)) (|A_p| #6#) (|l_q| #7=(|NonNegativeInteger|))
          (|l_p| #7#) (#8=#:G582 NIL) (|flg_q| #9=(|List| (|Boolean|)))
          (|flg_p| #9#))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((NULL (EQL (QVELT |p| 1) (QVELT |q| 1)))
              (COND
               ((NULL (EQL (QVELT |p| 0) (QVELT |q| 0)))
                (PROGN (LETT #1# NIL) (GO #10=#:G580))))))
            (LETT |flg_p| (SPADCALL (LENGTH (QVELT |p| 2)) 'T (QREFELT $ 37)))
            (LETT |flg_q| (SPADCALL (LENGTH (QVELT |q| 2)) 'T (QREFELT $ 37)))
            (SEQ (LETT |k| 1) (LETT #8# (SPADCALL |lst_p| (QREFELT $ 34))) G190
                 (COND ((|greater_SI| |k| #8#) (GO G191)))
                 (SEQ (LETT |l_p| (SPADCALL |lst_p| |k| (QREFELT $ 38)))
                      (LETT |l_q| (SPADCALL |lst_q| |k| (QREFELT $ 38)))
                      (LETT |A_p|
                            (SPADCALL (QVELT |p| 2) |l_p| (QREFELT $ 17)))
                      (LETT |A_q|
                            (SPADCALL (QVELT |q| 2) |l_q| (QREFELT $ 17)))
                      (SEQ (LETT |i| |off|) (LETT #5# (QVELT |p| 0)) G190
                           (COND ((> |i| #5#) (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |j| |off|) (LETT #4# (QVELT |p| 1))
                                  G190 (COND ((> |j| #4#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((NULL
                                       (SPADCALL (QAREF2O |A_p| |i| |j| 1 1)
                                                 (QAREF2O |A_q| |i| |j| 1 1)
                                                 (QREFELT $ 43)))
                                      (PROGN (LETT #1# NIL) (GO #10#))))))
                                  (LETT |j| (+ |j| 1)) (GO G190) G191
                                  (EXIT NIL))))
                           (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                      (SPADCALL |flg_p| |l_p| NIL (QREFELT $ 39))
                      (EXIT (SPADCALL |flg_q| |l_q| NIL (QREFELT $ 39))))
                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
            (SEQ (LETT |k| 1) (LETT #3# (LENGTH (QVELT |p| 2))) G190
                 (COND ((|greater_SI| |k| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |flg_p| |k| (QREFELT $ 40))
                     (COND
                      ((NULL
                        (SPADCALL (SPADCALL (QVELT |p| 2) |k| (QREFELT $ 17))
                                  (QREFELT $ 41)))
                       (PROGN (LETT #1# NIL) (GO #10#))))))))
                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
            (SEQ (LETT |k| 1) (LETT #2# (LENGTH (QVELT |q| 2))) G190
                 (COND ((|greater_SI| |k| #2#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |flg_q| |k| (QREFELT $ 40))
                     (COND
                      ((NULL
                        (SPADCALL (SPADCALL (QVELT |q| 2) |k| (QREFELT $ 17))
                                  (QREFELT $ 41)))
                       (PROGN (LETT #1# NIL) (GO #10#))))))))
                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #10# (EXIT #1#)))) 

(SDEFUN |LINPEN;qzero?;$2NniB;12|
        ((|p| $) (|i| |NonNegativeInteger|) (|j| |NonNegativeInteger|)
         ($ |Boolean|))
        (SPROG ((#1=#:G591 NIL) (#2=#:G592 NIL) (|l| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |l| 1) (LETT #2# (LENGTH (QVELT |p| 2))) G190
                       (COND ((|greater_SI| |l| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL
                            (SPADCALL
                             (QAREF2O
                              (SPADCALL (QVELT |p| 2) |l| (QREFELT $ 17)) |i|
                              |j| 1 1)
                             (QREFELT $ 45)))
                           (PROGN (LETT #1# NIL) (GO #3=#:G590))))))
                       (LETT |l| (|inc_SI| |l|)) (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #3# (EXIT #1#)))) 

(SDEFUN |LINPEN;qzero?;$4NniB;13|
        ((|p| $) (|i_min| |NonNegativeInteger|) (|i_max| |NonNegativeInteger|)
         (|j_min| |NonNegativeInteger|) (|j_max| |NonNegativeInteger|)
         ($ |Boolean|))
        (SPROG
         ((#1=#:G601 NIL) (#2=#:G604 NIL) (|j| NIL) (#3=#:G603 NIL) (|i| NIL)
          (|A_wrk| (|Matrix| R)) (#4=#:G602 NIL) (|l| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |l| 1) (LETT #4# (LENGTH (QVELT |p| 2))) G190
                 (COND ((|greater_SI| |l| #4#) (GO G191)))
                 (SEQ
                  (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |l| (QREFELT $ 17)))
                  (EXIT
                   (SEQ (LETT |i| |i_min|) (LETT #3# |i_max|) G190
                        (COND ((> |i| #3#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |j| |j_min|) (LETT #2# |j_max|) G190
                               (COND ((> |j| #2#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((NULL
                                    (SPADCALL (QAREF2O |A_wrk| |i| |j| 1 1)
                                              (QREFELT $ 45)))
                                   (PROGN (LETT #1# NIL) (GO #5=#:G600))))))
                               (LETT |j| (+ |j| 1)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |l| (|inc_SI| |l|)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #5# (EXIT #1#)))) 

(SDEFUN |LINPEN;qzero?;$5NniB;14|
        ((|p| $) (|i_min| |NonNegativeInteger|) (|i_max| |NonNegativeInteger|)
         (|j_min| |NonNegativeInteger|) (|j_max| |NonNegativeInteger|)
         (|l| |NonNegativeInteger|) ($ |Boolean|))
        (SPROG
         ((#1=#:G611 NIL) (#2=#:G613 NIL) (|j| NIL) (#3=#:G612 NIL) (|i| NIL)
          (|A_wrk| (|Matrix| R)))
         (SEQ
          (EXIT
           (SEQ (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |l| (QREFELT $ 17)))
                (SEQ (LETT |i| |i_min|) (LETT #3# |i_max|) G190
                     (COND ((> |i| #3#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| |j_min|) (LETT #2# |j_max|) G190
                            (COND ((> |j| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((NULL
                                 (SPADCALL (QAREF2O |A_wrk| |i| |j| 1 1)
                                           (QREFELT $ 45)))
                                (PROGN (LETT #1# NIL) (GO #4=#:G610))))))
                            (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                     (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #4# (EXIT #1#)))) 

(SDEFUN |LINPEN;qsemizero?;$5NniB;15|
        ((|p| $) (|i_min| |NonNegativeInteger|) (|i_max| |NonNegativeInteger|)
         (|j_min| |NonNegativeInteger|) (|j_max| |NonNegativeInteger|)
         (|l| |NonNegativeInteger|) ($ |Boolean|))
        (SPROG
         ((#1=#:G622 NIL) (#2=#:G625 NIL) (|j| NIL) (#3=#:G624 NIL) (|i| NIL)
          (|A_wrk| (|Matrix| R)) (#4=#:G623 NIL) (|k| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |k| 1) (LETT #4# (LENGTH (QVELT |p| 2))) G190
                 (COND ((|greater_SI| |k| #4#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((NULL (EQL |k| |l|))
                     (SEQ
                      (LETT |A_wrk|
                            (SPADCALL (QVELT |p| 2) |k| (QREFELT $ 17)))
                      (EXIT
                       (SEQ (LETT |i| |i_min|) (LETT #3# |i_max|) G190
                            (COND ((> |i| #3#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |j| |j_min|) (LETT #2# |j_max|) G190
                                   (COND ((> |j| #2#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((NULL
                                        (SPADCALL (QAREF2O |A_wrk| |i| |j| 1 1)
                                                  (QREFELT $ 45)))
                                       (PROGN
                                        (LETT #1# NIL)
                                        (GO #5=#:G621))))))
                                   (LETT |j| (+ |j| 1)) (GO G190) G191
                                   (EXIT NIL))))
                            (LETT |i| (+ |i| 1)) (GO G190) G191
                            (EXIT NIL))))))))
                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #5# (EXIT #1#)))) 

(SDEFUN |LINPEN;zero?;$2NniB;16|
        ((|p| $) (|i| |NonNegativeInteger|) (|j| |NonNegativeInteger|)
         ($ |Boolean|))
        (SPROG
         ((#1=#:G633 NIL) (|flg_wrk| (|Boolean|)) (#2=#:G634 NIL) (|l| NIL))
         (SEQ
          (COND
           ((OR (< |i| 1)
                (OR (OR (> |i| (QVELT |p| 0)) (< |j| 1))
                    (> |j| (QVELT |p| 1))))
            (|error| "LINPEN: zero?(%,i,j) - index out of range."))
           ('T
            (SEQ (LETT |flg_wrk| 'T)
                 (SEQ
                  (EXIT
                   (SEQ (LETT |l| 1) (LETT #2# (LENGTH (QVELT |p| 2))) G190
                        (COND ((|greater_SI| |l| #2#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL
                             (QAREF2O
                              (SPADCALL (QVELT |p| 2) |l| (QREFELT $ 17)) |i|
                              |j| 1 1)
                             (|spadConstant| $ 8) (QREFELT $ 50))
                            (SEQ (LETT |flg_wrk| NIL)
                                 (EXIT
                                  (PROGN
                                   (LETT #1# |$NoValue|)
                                   (GO #3=#:G630))))))))
                        (LETT |l| (|inc_SI| |l|)) (GO G190) G191 (EXIT NIL)))
                  #3# (EXIT #1#))
                 (EXIT |flg_wrk|))))))) 

(SDEFUN |LINPEN;diagonal?;$NniB;17|
        ((|p| $) (|l| |NonNegativeInteger|) ($ |Boolean|))
        (COND
         ((> |l| (LENGTH (QVELT |p| 2)))
          (|error| "LINPEN: diagonal?(%,l) - index out of range."))
         ('T
          (SPADCALL |p| 1 (MIN (QVELT |p| 0) (QVELT |p| 1)) |l|
                    (QREFELT $ 52))))) 

(SDEFUN |LINPEN;qdiagonal?;$3NniB;18|
        ((|p| $) (|k_min| |NonNegativeInteger|) (|k_max| |NonNegativeInteger|)
         (|l| |NonNegativeInteger|) ($ |Boolean|))
        (SPROG
         ((#1=#:G643 NIL) (#2=#:G645 NIL) (|j| NIL) (#3=#:G644 NIL) (|i| NIL)
          (|A_wrk| (|Matrix| R)))
         (SEQ
          (EXIT
           (SEQ (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |l| (QREFELT $ 17)))
                (SEQ (LETT |i| |k_min|) (LETT #3# |k_max|) G190
                     (COND ((> |i| #3#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| |k_min|) (LETT #2# |k_max|) G190
                            (COND ((> |j| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((NULL (EQL |i| |j|))
                                (COND
                                 ((NULL
                                   (SPADCALL (QAREF2O |A_wrk| |i| |j| 1 1)
                                             (QREFELT $ 45)))
                                  (PROGN (LETT #1# NIL) (GO #4=#:G642))))))))
                            (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                     (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #4# (EXIT #1#)))) 

(SDEFUN |LINPEN;diagonal;$NniL;19|
        ((|p| $) (|l| |NonNegativeInteger|) ($ |List| R))
        (COND
         ((> |l| (LENGTH (QVELT |p| 2)))
          (|error| "LINPEN: diagonal(%,l) - index out of range."))
         ('T
          (SPADCALL |p| 1 (MIN (QVELT |p| 0) (QVELT |p| 1)) |l|
                    (QREFELT $ 55))))) 

(SDEFUN |LINPEN;qdiagonal;$3NniL;20|
        ((|p| $) (|k_min| |NonNegativeInteger|) (|k_max| |NonNegativeInteger|)
         (|l| |NonNegativeInteger|) ($ |List| R))
        (SPROG
         ((#1=#:G653 NIL) (|k| NIL) (|lst_wrk| (|List| R))
          (|n| (|NonNegativeInteger|)) (#2=#:G649 NIL) (|A_wrk| (|Matrix| R)))
         (SEQ (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |l| (QREFELT $ 17)))
              (LETT |n|
                    (PROG1 (LETT #2# (- (+ |k_max| 1) |k_min|))
                      (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #2#)))
              (LETT |lst_wrk|
                    (SPADCALL |n| (|spadConstant| $ 8) (QREFELT $ 57)))
              (SEQ (LETT |k| 0) (LETT #1# (- |n| 1)) G190
                   (COND ((|greater_SI| |k| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |lst_wrk| (+ |k| 1)
                               (QAREF2O |A_wrk| (+ |k_min| |k|) (+ |k_min| |k|)
                                        1 1)
                               (QREFELT $ 58))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT |lst_wrk|)))) 

(SDEFUN |LINPEN;uppertriangular?;$NniB;21|
        ((|p| $) (|l| |NonNegativeInteger|) ($ |Boolean|))
        (COND
         ((> |l| (LENGTH (QVELT |p| 2)))
          (|error| "LINPEN: uppertriangular?(%,l) - index out of range."))
         ('T
          (SPADCALL |p| 1 (MIN (QVELT |p| 0) (QVELT |p| 1)) |l|
                    (QREFELT $ 59))))) 

(SDEFUN |LINPEN;quppertriangular?;$3NniB;22|
        ((|p| $) (|k_min| |NonNegativeInteger|) (|k_max| |NonNegativeInteger|)
         (|l| |NonNegativeInteger|) ($ |Boolean|))
        (SPROG
         ((#1=#:G662 NIL) (#2=#:G664 NIL) (|j| NIL) (#3=#:G663 NIL) (|i| NIL)
          (|A_wrk| (|Matrix| R)))
         (SEQ
          (EXIT
           (SEQ (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |l| (QREFELT $ 17)))
                (SEQ (LETT |i| |k_min|) (LETT #3# |k_max|) G190
                     (COND ((> |i| #3#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| |k_min|) (LETT #2# |k_max|) G190
                            (COND ((> |j| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((< |j| |i|)
                                (COND
                                 ((NULL
                                   (SPADCALL (QAREF2O |A_wrk| |i| |j| 1 1)
                                             (QREFELT $ 45)))
                                  (PROGN (LETT #1# NIL) (GO #4=#:G661))))))))
                            (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                     (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #4# (EXIT #1#)))) 

(SDEFUN |LINPEN;qnilpotent?;$3NniB;23|
        ((|p| $) (|k_min| |NonNegativeInteger|) (|k_max| |NonNegativeInteger|)
         (|l| |NonNegativeInteger|) ($ |Boolean|))
        (SPROG
         ((#1=#:G671 NIL) (#2=#:G673 NIL) (|j| NIL) (#3=#:G672 NIL) (|i| NIL)
          (|A_wrk| (|Matrix| R)))
         (SEQ
          (EXIT
           (SEQ (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |l| (QREFELT $ 17)))
                (SEQ (LETT |i| |k_min|) (LETT #3# |k_max|) G190
                     (COND ((> |i| #3#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| |k_min|) (LETT #2# |k_max|) G190
                            (COND ((> |j| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((<= |j| |i|)
                                (COND
                                 ((NULL
                                   (SPADCALL (QAREF2O |A_wrk| |i| |j| 1 1)
                                             (QREFELT $ 45)))
                                  (PROGN (LETT #1# NIL) (GO #4=#:G670))))))))
                            (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                     (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #4# (EXIT #1#)))) 

(SDEFUN |LINPEN;qcolumnIndices;$2NniL;24|
        ((|p| $) (|off| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         ($ |List| (|List| (|NonNegativeInteger|))))
        (SPROG
         ((|k| (|NonNegativeInteger|)) (#1=#:G679 NIL)
          (|lst_tmp| (|List| (|NonNegativeInteger|))) (#2=#:G676 NIL)
          (#3=#:G685 NIL) (|j| NIL) (#4=#:G684 NIL) (|i| NIL)
          (|A_wrk| (|Matrix| R))
          (|lst_row| (|List| (|List| (|NonNegativeInteger|))))
          (|n| (|NonNegativeInteger|)) (#5=#:G674 NIL))
         (SEQ
          (LETT |n|
                (PROG1 (LETT #5# (- (+ (QVELT |p| 0) 1) |off|))
                  (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #5#)))
          (LETT |lst_row| (SPADCALL |n| NIL (QREFELT $ 63)))
          (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |l| (QREFELT $ 17)))
          (SEQ (LETT |i| |off|) (LETT #4# (QVELT |p| 0)) G190
               (COND ((> |i| #4#) (GO G191)))
               (SEQ (LETT |lst_tmp| NIL)
                    (SEQ (LETT |j| (QVELT |p| 1)) (LETT #3# |off|) G190
                         (COND ((< |j| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL
                              (SPADCALL (QAREF2O |A_wrk| |i| |j| 1 1)
                                        (QREFELT $ 45)))
                             (LETT |lst_tmp|
                                   (CONS
                                    (PROG1 (LETT #2# (- (+ |j| 1) |off|))
                                      (|check_subtype2| (>= #2# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #2#))
                                    |lst_tmp|))))))
                         (LETT |j| (+ |j| -1)) (GO G190) G191 (EXIT NIL))
                    (LETT |k|
                          (PROG1 (LETT #1# (- (+ |i| 1) |off|))
                            (|check_subtype2| (>= #1# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #1#)))
                    (EXIT (SPADCALL |lst_row| |k| |lst_tmp| (QREFELT $ 64))))
               (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
          (EXIT |lst_row|)))) 

(SDEFUN |LINPEN;qcolumnIndices;$3NniL;25|
        ((|p| $) (|off| |NonNegativeInteger|) (|i| |NonNegativeInteger|)
         (|l| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|lst_col| (|List| (|NonNegativeInteger|))) (#1=#:G689 NIL)
          (#2=#:G694 NIL) (|j| NIL) (|A_wrk| (|Matrix| R))
          (|i_wrk| (|NonNegativeInteger|)) (#3=#:G687 NIL)
          (|n| (|NonNegativeInteger|)) (#4=#:G686 NIL))
         (SEQ
          (LETT |n|
                (PROG1 (LETT #4# (- (+ (QVELT |p| 0) 1) |off|))
                  (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #4#)))
          (LETT |i_wrk|
                (PROG1 (LETT #3# (- (+ |off| |i|) 1))
                  (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #3#)))
          (LETT |lst_col| (SPADCALL |n| NIL (QREFELT $ 63)))
          (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |l| (QREFELT $ 17)))
          (LETT |lst_col| NIL)
          (SEQ (LETT |j| (QVELT |p| 1)) (LETT #2# |off|) G190
               (COND ((< |j| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((NULL
                    (SPADCALL (QAREF2O |A_wrk| |i_wrk| |j| 1 1)
                              (QREFELT $ 45)))
                   (LETT |lst_col|
                         (CONS
                          (PROG1 (LETT #1# (- (+ |j| 1) |off|))
                            (|check_subtype2| (>= #1# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #1#))
                          |lst_col|))))))
               (LETT |j| (+ |j| -1)) (GO G190) G191 (EXIT NIL))
          (EXIT |lst_col|)))) 

(SDEFUN |LINPEN;qcolumnIndices;$NniL;26|
        ((|p| $) (|off| |NonNegativeInteger|)
         ($ |List| (|List| (|NonNegativeInteger|))))
        (SPROG
         ((|k| (|NonNegativeInteger|)) (#1=#:G699 NIL)
          (|lst_tmp| (|List| (|NonNegativeInteger|))) (#2=#:G696 NIL)
          (#3=#:G706 NIL) (|j| NIL) (#4=#:G705 NIL) (|i| NIL)
          (|lst_row| (|List| (|List| (|NonNegativeInteger|))))
          (|n| (|NonNegativeInteger|)) (#5=#:G695 NIL))
         (SEQ
          (LETT |n|
                (PROG1 (LETT #5# (- (+ (QVELT |p| 0) 1) |off|))
                  (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #5#)))
          (LETT |lst_row| (SPADCALL |n| NIL (QREFELT $ 63)))
          (SEQ (LETT |i| |off|) (LETT #4# (QVELT |p| 0)) G190
               (COND ((> |i| #4#) (GO G191)))
               (SEQ (LETT |lst_tmp| NIL)
                    (SEQ (LETT |j| (QVELT |p| 1)) (LETT #3# |off|) G190
                         (COND ((< |j| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL (SPADCALL |p| |i| |j| (QREFELT $ 46)))
                             (LETT |lst_tmp|
                                   (CONS
                                    (PROG1 (LETT #2# (- (+ |j| 1) |off|))
                                      (|check_subtype2| (>= #2# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #2#))
                                    |lst_tmp|))))))
                         (LETT |j| (+ |j| -1)) (GO G190) G191 (EXIT NIL))
                    (LETT |k|
                          (PROG1 (LETT #1# (- (+ |i| 1) |off|))
                            (|check_subtype2| (>= #1# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #1#)))
                    (EXIT (SPADCALL |lst_row| |k| |lst_tmp| (QREFELT $ 64))))
               (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
          (EXIT |lst_row|)))) 

(SDEFUN |LINPEN;qrowIndices;$3NniL;27|
        ((|p| $) (|off| |NonNegativeInteger|) (|j| |NonNegativeInteger|)
         (|l| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|lst_col| (|List| (|NonNegativeInteger|))) (#1=#:G710 NIL)
          (#2=#:G715 NIL) (|i| NIL) (|A_wrk| (|Matrix| R))
          (|j_wrk| (|NonNegativeInteger|)) (#3=#:G708 NIL)
          (|n| (|NonNegativeInteger|)) (#4=#:G707 NIL))
         (SEQ
          (LETT |n|
                (PROG1 (LETT #4# (- (+ (QVELT |p| 1) 1) |off|))
                  (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #4#)))
          (LETT |j_wrk|
                (PROG1 (LETT #3# (- (+ |off| |j|) 1))
                  (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #3#)))
          (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |l| (QREFELT $ 17)))
          (LETT |lst_col| NIL)
          (SEQ (LETT |i| (QVELT |p| 0)) (LETT #2# |off|) G190
               (COND ((< |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((NULL
                    (SPADCALL (QAREF2O |A_wrk| |i| |j_wrk| 1 1)
                              (QREFELT $ 45)))
                   (LETT |lst_col|
                         (CONS
                          (PROG1 (LETT #1# (- (+ |i| 1) |off|))
                            (|check_subtype2| (>= #1# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #1#))
                          |lst_col|))))))
               (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
          (EXIT |lst_col|)))) 

(SDEFUN |LINPEN;qrowIndices;$2NniL;28|
        ((|p| $) (|off| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         ($ |List| (|List| (|NonNegativeInteger|))))
        (SPROG
         ((|k| (|NonNegativeInteger|)) (#1=#:G721 NIL)
          (|lst_tmp| (|List| (|NonNegativeInteger|))) (#2=#:G718 NIL)
          (#3=#:G727 NIL) (|i| NIL) (#4=#:G726 NIL) (|j| NIL)
          (|A_wrk| (|Matrix| R))
          (|lst_col| (|List| (|List| (|NonNegativeInteger|))))
          (|n| (|NonNegativeInteger|)) (#5=#:G716 NIL))
         (SEQ
          (LETT |n|
                (PROG1 (LETT #5# (- (+ (QVELT |p| 1) 1) |off|))
                  (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #5#)))
          (LETT |lst_col| (SPADCALL |n| NIL (QREFELT $ 63)))
          (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |l| (QREFELT $ 17)))
          (SEQ (LETT |j| |off|) (LETT #4# (QVELT |p| 1)) G190
               (COND ((> |j| #4#) (GO G191)))
               (SEQ (LETT |lst_tmp| NIL)
                    (SEQ (LETT |i| (QVELT |p| 0)) (LETT #3# |off|) G190
                         (COND ((< |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL
                              (SPADCALL (QAREF2O |A_wrk| |i| |j| 1 1)
                                        (QREFELT $ 45)))
                             (LETT |lst_tmp|
                                   (CONS
                                    (PROG1 (LETT #2# (- (+ |i| 1) |off|))
                                      (|check_subtype2| (>= #2# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #2#))
                                    |lst_tmp|))))))
                         (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
                    (LETT |k|
                          (PROG1 (LETT #1# (- (+ |j| 1) |off|))
                            (|check_subtype2| (>= #1# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #1#)))
                    (EXIT (SPADCALL |lst_col| |k| |lst_tmp| (QREFELT $ 64))))
               (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))
          (EXIT |lst_col|)))) 

(SDEFUN |LINPEN;qrowIndices;$NniL;29|
        ((|p| $) (|off| |NonNegativeInteger|)
         ($ |List| (|List| (|NonNegativeInteger|))))
        (SPROG
         ((|k| (|NonNegativeInteger|)) (#1=#:G732 NIL)
          (|lst_tmp| (|List| (|NonNegativeInteger|))) (#2=#:G729 NIL)
          (#3=#:G739 NIL) (|i| NIL) (#4=#:G738 NIL) (|j| NIL)
          (|lst_col| (|List| (|List| (|NonNegativeInteger|))))
          (|n| (|NonNegativeInteger|)) (#5=#:G728 NIL))
         (SEQ
          (LETT |n|
                (PROG1 (LETT #5# (- (+ (QVELT |p| 1) 1) |off|))
                  (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #5#)))
          (LETT |lst_col| (SPADCALL |n| NIL (QREFELT $ 63)))
          (SEQ (LETT |j| |off|) (LETT #4# (QVELT |p| 1)) G190
               (COND ((> |j| #4#) (GO G191)))
               (SEQ (LETT |lst_tmp| NIL)
                    (SEQ (LETT |i| (QVELT |p| 0)) (LETT #3# |off|) G190
                         (COND ((< |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL (SPADCALL |p| |i| |j| (QREFELT $ 46)))
                             (LETT |lst_tmp|
                                   (CONS
                                    (PROG1 (LETT #2# (- (+ |i| 1) |off|))
                                      (|check_subtype2| (>= #2# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #2#))
                                    |lst_tmp|))))))
                         (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
                    (LETT |k|
                          (PROG1 (LETT #1# (- (+ |j| 1) |off|))
                            (|check_subtype2| (>= #1# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #1#)))
                    (EXIT (SPADCALL |lst_col| |k| |lst_tmp| (QREFELT $ 64))))
               (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))
          (EXIT |lst_col|)))) 

(SDEFUN |LINPEN;qelt;$3NniR;30|
        ((|p| $) (|i| |NonNegativeInteger|) (|j| |NonNegativeInteger|)
         (|l| |NonNegativeInteger|) ($ R))
        (QAREF2O (SPADCALL (QVELT |p| 2) |l| (QREFELT $ 17)) |i| |j| 1 1)) 

(SDEFUN |LINPEN;elt;$3NniR;31|
        ((|p| $) (|i| |NonNegativeInteger|) (|j| |NonNegativeInteger|)
         (|l| |NonNegativeInteger|) ($ R))
        (SPROG ((|A_wrk| (|Matrix| R)))
               (SEQ
                (COND
                 ((OR (< |i| 1)
                      (OR (OR (> |i| (QVELT |p| 0)) (< |j| 1))
                          (OR (OR (> |j| (QVELT |p| 1)) (< |l| 1))
                              (> |l| (LENGTH (QVELT |p| 2))))))
                  (|error| "LINPEN: elt(%,i,j,l) - index out of range."))
                 ('T
                  (SEQ
                   (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |l| (QREFELT $ 17)))
                   (EXIT (QAREF2O |A_wrk| |i| |j| 1 1)))))))) 

(SDEFUN |LINPEN;elt;$2NniL;32|
        ((|p| $) (|i| |NonNegativeInteger|) (|j| |NonNegativeInteger|)
         ($ |List| R))
        (SPROG
         ((|A_wrk| (|Matrix| R)) (#1=#:G755 NIL) (|k| NIL)
          (|lst_wrk| (|List| R)))
         (SEQ
          (COND
           ((OR (< |i| 1)
                (OR (OR (> |i| (QVELT |p| 0)) (< |j| 1))
                    (> |j| (QVELT |p| 1))))
            (|error| "LINPEN: elt(%,i,j) - index out of range."))
           ('T
            (SEQ
             (LETT |lst_wrk|
                   (SPADCALL (LENGTH (QVELT |p| 2)) (|spadConstant| $ 8)
                             (QREFELT $ 57)))
             (SEQ (LETT |k| 1) (LETT #1# (LENGTH (QVELT |p| 2))) G190
                  (COND ((|greater_SI| |k| #1#) (GO G191)))
                  (SEQ
                   (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |k| (QREFELT $ 17)))
                   (EXIT
                    (SPADCALL |lst_wrk| |k| (QAREF2O |A_wrk| |i| |j| 1 1)
                              (QREFELT $ 58))))
                  (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
             (EXIT |lst_wrk|))))))) 

(SDEFUN |LINPEN;qelt;$2NniL;33|
        ((|p| $) (|i| |NonNegativeInteger|) (|j| |NonNegativeInteger|)
         ($ |List| R))
        (SPROG
         ((|A_wrk| (|Matrix| R)) (#1=#:G761 NIL) (|k| NIL)
          (|lst_wrk| (|List| R)))
         (SEQ
          (LETT |lst_wrk|
                (SPADCALL (LENGTH (QVELT |p| 2)) (|spadConstant| $ 8)
                          (QREFELT $ 57)))
          (SEQ (LETT |k| 1) (LETT #1# (LENGTH (QVELT |p| 2))) G190
               (COND ((|greater_SI| |k| #1#) (GO G191)))
               (SEQ (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |k| (QREFELT $ 17)))
                    (EXIT
                     (SPADCALL |lst_wrk| |k| (QAREF2O |A_wrk| |i| |j| 1 1)
                               (QREFELT $ 58))))
               (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
          (EXIT |lst_wrk|)))) 

(SDEFUN |LINPEN;matrix;$NniM;34|
        ((|p| $) (|l| |NonNegativeInteger|) ($ |Matrix| R))
        (COND
         ((OR (< |l| 1) (> |l| (LENGTH (QVELT |p| 2))))
          (|error| "LINPEN: matrix(%,l) - index out of range."))
         ('T (SPADCALL (QVELT |p| 2) |l| (QREFELT $ 17))))) 

(SDEFUN |LINPEN;subMatrix;$5NniM;35|
        ((|p| $) (|r_min| |NonNegativeInteger|) (|r_max| |NonNegativeInteger|)
         (|c_min| |NonNegativeInteger|) (|c_max| |NonNegativeInteger|)
         (|l| |NonNegativeInteger|) ($ |Matrix| R))
        (COND
         ((OR (OR (< |r_min| 1) (> |r_min| |r_max|))
              (OR
               (OR (OR (> |r_max| (QVELT |p| 0)) (< |c_min| 1))
                   (> |c_min| |c_max|))
               (OR (OR (> |c_max| (QVELT |p| 1)) (< |l| 1))
                   (> |l| (LENGTH (QVELT |p| 2))))))
          (|error|
           "LINPEN: subMatrix(%,r_min,r_max,c_min,c_max,l) - index out of range."))
         ('T
          (SPADCALL (SPADCALL (QVELT |p| 2) |l| (QREFELT $ 17)) |r_min| |r_max|
                    |c_min| |c_max| (QREFELT $ 76))))) 

(SDEFUN |LINPEN;subPencil;$4Nni$;36|
        ((|p| $) (|r_min| |NonNegativeInteger|) (|r_max| |NonNegativeInteger|)
         (|c_min| |NonNegativeInteger|) (|c_max| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|n_new| (|NonNegativeInteger|)) (#1=#:G775 NIL)
          (|m_new| (|NonNegativeInteger|)) (#2=#:G774 NIL) (#3=#:G778 NIL)
          (|k| NIL) (|A_lst| (|List| (|Matrix| R))))
         (SEQ
          (COND
           ((OR (OR (< |r_min| 1) (> |r_min| |r_max|))
                (OR
                 (OR (OR (> |r_max| (QVELT |p| 0)) (< |c_min| 1))
                     (> |c_min| |c_max|))
                 (> |c_max| (QVELT |p| 1))))
            (|error|
             "LINPEN: subPencil(%,r_min,r_max,c_min,c_max) - index out of range."))
           ('T
            (SEQ (LETT |A_lst| (SPADCALL (QVELT |p| 2) (QREFELT $ 16)))
                 (SEQ (LETT |k| 1) (LETT #3# (LENGTH |A_lst|)) G190
                      (COND ((|greater_SI| |k| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |A_lst| |k|
                                  (SPADCALL
                                   (SPADCALL (QVELT |p| 2) |k| (QREFELT $ 17))
                                   |r_min| |r_max| |c_min| |c_max|
                                   (QREFELT $ 76))
                                  (QREFELT $ 14))))
                      (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                 (LETT |m_new|
                       (PROG1 (LETT #2# (- (+ |r_max| 1) |r_min|))
                         (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #2#)))
                 (LETT |n_new|
                       (PROG1 (LETT #1# (- (+ |c_max| 1) |c_min|))
                         (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #1#)))
                 (EXIT (VECTOR |m_new| |n_new| |A_lst|)))))))) 

(SDEFUN |LINPEN;subPencil;$2L$;37|
        ((|p| $) (|lst_row| |List| (|NonNegativeInteger|))
         (|lst_col| |List| (|NonNegativeInteger|)) ($ $))
        (SPROG
         ((#1=#:G798 NIL) (|j| NIL) (#2=#:G797 NIL) (|i| NIL)
          (|A_wrk| #3=(|Matrix| R)) (|A_new| #3#) (#4=#:G796 NIL) (|k| NIL)
          (|lp_new| ($)) (|c_max| #5=(|NonNegativeInteger|)) (|c_min| #5#)
          (|r_max| #5#) (|r_min| #5#))
         (SEQ (LETT |r_min| (SPADCALL (ELT $ 79) |lst_row| (QREFELT $ 81)))
              (LETT |r_max| (SPADCALL (ELT $ 82) |lst_row| (QREFELT $ 81)))
              (LETT |c_min| (SPADCALL (ELT $ 79) |lst_col| (QREFELT $ 81)))
              (LETT |c_max| (SPADCALL (ELT $ 82) |lst_col| (QREFELT $ 81)))
              (COND
               ((OR (< |r_min| 1)
                    (OR (OR (> |r_max| (QVELT |p| 0)) (< |c_min| 1))
                        (> |c_max| (QVELT |p| 1))))
                (EXIT
                 (|error|
                  "LINPEN: subPencil(%,lst_row,lst_col) - invalid indices."))))
              (LETT |lp_new|
                    (SPADCALL (SPADCALL |lst_row| (QREFELT $ 34))
                              (SPADCALL |lst_col| (QREFELT $ 34))
                              (LENGTH (QVELT |p| 2)) (QREFELT $ 15)))
              (SEQ (LETT |k| 1) (LETT #4# (LENGTH (QVELT |p| 2))) G190
                   (COND ((|greater_SI| |k| #4#) (GO G191)))
                   (SEQ
                    (LETT |A_new|
                          (SPADCALL (QVELT |lp_new| 2) |k| (QREFELT $ 17)))
                    (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |k| (QREFELT $ 17)))
                    (EXIT
                     (SEQ (LETT |i| 1) (LETT #2# (QVELT |lp_new| 0)) G190
                          (COND ((|greater_SI| |i| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |j| 1) (LETT #1# (QVELT |lp_new| 1))
                                 G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (QSETAREF2O |A_new| |i| |j|
                                               (QAREF2O |A_wrk|
                                                        (SPADCALL |lst_row| |i|
                                                                  (QREFELT $
                                                                           38))
                                                        (SPADCALL |lst_col| |j|
                                                                  (QREFELT $
                                                                           38))
                                                        1 1)
                                               1 1)))
                                 (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT |lp_new|)))) 

(SDEFUN |LINPEN;removeRowsColumns;$2L$;38|
        ((|p| $) (|lst_row| |List| (|NonNegativeInteger|))
         (|lst_col| |List| (|NonNegativeInteger|)) ($ $))
        (SPROG
         ((#1=#:G822 NIL) (|j| NIL) (#2=#:G821 NIL) (|i| NIL)
          (|A_wrk| #3=(|Matrix| R)) (|A_new| #3#) (#4=#:G820 NIL) (|k| NIL)
          (|lp_new| ($)) (|l_col| (|List| (|NonNegativeInteger|)))
          (|l_row| (|List| (|NonNegativeInteger|)))
          (|c_max| #5=(|NonNegativeInteger|)) (|c_min| #5#) (|r_max| #5#)
          (|r_min| #5#))
         (SEQ (LETT |r_min| (SPADCALL (ELT $ 79) |lst_row| (QREFELT $ 81)))
              (LETT |r_max| (SPADCALL (ELT $ 82) |lst_row| (QREFELT $ 81)))
              (LETT |c_min| (SPADCALL (ELT $ 79) |lst_col| (QREFELT $ 81)))
              (LETT |c_max| (SPADCALL (ELT $ 82) |lst_col| (QREFELT $ 81)))
              (COND
               ((OR (< |r_min| 1)
                    (OR (OR (> |r_max| (QVELT |p| 0)) (< |c_min| 1))
                        (> |c_max| (QVELT |p| 1))))
                (EXIT
                 (|error|
                  "LINPEN: removeRowsColumns(%,lst_row,lst_col) - invalid indices."))))
              (LETT |l_row| NIL)
              (SEQ (LETT |i| (QVELT |p| 0)) G190 (COND ((< |i| 1) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL (SPADCALL |i| |lst_row| (QREFELT $ 84)) 0)
                       (LETT |l_row| (CONS |i| |l_row|))))))
                   (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
              (LETT |l_col| NIL)
              (SEQ (LETT |j| (QVELT |p| 1)) G190 (COND ((< |j| 1) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL (SPADCALL |j| |lst_col| (QREFELT $ 84)) 0)
                       (LETT |l_col| (CONS |j| |l_col|))))))
                   (LETT |j| (+ |j| -1)) (GO G190) G191 (EXIT NIL))
              (LETT |lp_new|
                    (SPADCALL (SPADCALL |l_row| (QREFELT $ 34))
                              (SPADCALL |l_col| (QREFELT $ 34))
                              (LENGTH (QVELT |p| 2)) (QREFELT $ 15)))
              (SEQ (LETT |k| 1) (LETT #4# (LENGTH (QVELT |p| 2))) G190
                   (COND ((|greater_SI| |k| #4#) (GO G191)))
                   (SEQ
                    (LETT |A_new|
                          (SPADCALL (QVELT |lp_new| 2) |k| (QREFELT $ 17)))
                    (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |k| (QREFELT $ 17)))
                    (EXIT
                     (SEQ (LETT |i| 1) (LETT #2# (QVELT |lp_new| 0)) G190
                          (COND ((|greater_SI| |i| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |j| 1) (LETT #1# (QVELT |lp_new| 1))
                                 G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (QSETAREF2O |A_new| |i| |j|
                                               (QAREF2O |A_wrk|
                                                        (SPADCALL |l_row| |i|
                                                                  (QREFELT $
                                                                           38))
                                                        (SPADCALL |l_col| |j|
                                                                  (QREFELT $
                                                                           38))
                                                        1 1)
                                               1 1)))
                                 (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT |lp_new|)))) 

(SDEFUN |LINPEN;insertRowsColumns;$2L$;39|
        ((|p| $) (|lst_row| |List| (|NonNegativeInteger|))
         (|lst_col| |List| (|NonNegativeInteger|)) ($ $))
        (SPROG
         ((#1=#:G850 NIL) (|j| NIL) (#2=#:G849 NIL) (|i| NIL)
          (|A_dst| #3=(|Matrix| R)) (|A_src| #3#) (#4=#:G848 NIL) (|k| NIL)
          (|j_dst| #5=(|NonNegativeInteger|)) (|j_ins| #5#) (#6=#:G847 NIL)
          (|l_col| #7=(|List| (|NonNegativeInteger|)))
          (|l_tmp| (|List| (|NonNegativeInteger|))) (|i_dst| #5#) (|i_ins| #5#)
          (#8=#:G846 NIL) (|l_row| #7#) (|lp_new| ($))
          (|n| #9=(|NonNegativeInteger|)) (|m| #9#)
          (|c_max| #10=(|NonNegativeInteger|)) (|r_max| #10#))
         (SEQ (LETT |r_max| (SPADCALL (ELT $ 82) |lst_row| (QREFELT $ 81)))
              (LETT |c_max| (SPADCALL (ELT $ 82) |lst_col| (QREFELT $ 81)))
              (COND
               ((OR (> |r_max| (QVELT |p| 0)) (> |c_max| (QVELT |p| 1)))
                (EXIT
                 (|error|
                  "LINPEN: insertRowsColumns(%,lst_row,lst_col) - invalid indices."))))
              (LETT |m| (+ (QVELT |p| 0) (SPADCALL |lst_row| (QREFELT $ 34))))
              (LETT |n| (+ (QVELT |p| 1) (SPADCALL |lst_col| (QREFELT $ 34))))
              (LETT |lp_new|
                    (SPADCALL |m| |n| (LENGTH (QVELT |p| 2)) (QREFELT $ 15)))
              (LETT |l_tmp| (SPADCALL |lst_row| (QREFELT $ 86)))
              (LETT |l_row| (SPADCALL (QVELT |p| 0) 0 (QREFELT $ 87)))
              (LETT |i_dst| 1) (LETT |i_ins| 1)
              (SEQ (LETT |i| 1) (LETT #8# (QVELT |p| 0)) G190
                   (COND ((|greater_SI| |i| #8#) (GO G191)))
                   (SEQ
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND
                             ((<= |i_ins| (SPADCALL |lst_row| (QREFELT $ 34)))
                              (< (SPADCALL |l_tmp| |i_ins| (QREFELT $ 38))
                                 |i|))
                             ('T NIL)))
                           (GO G191)))
                         (SEQ (LETT |i_ins| (+ |i_ins| 1))
                              (EXIT (LETT |i_dst| (+ |i_dst| 1))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (SPADCALL |l_row| |i| |i_dst| (QREFELT $ 88))
                    (EXIT (LETT |i_dst| (+ |i_dst| 1))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |l_tmp| (SPADCALL |lst_col| (QREFELT $ 86)))
              (LETT |l_col| (SPADCALL (QVELT |p| 1) 0 (QREFELT $ 87)))
              (LETT |j_dst| 1) (LETT |j_ins| 1)
              (SEQ (LETT |j| 1) (LETT #6# (QVELT |p| 1)) G190
                   (COND ((|greater_SI| |j| #6#) (GO G191)))
                   (SEQ
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND
                             ((<= |j_ins| (SPADCALL |lst_col| (QREFELT $ 34)))
                              (< (SPADCALL |l_tmp| |j_ins| (QREFELT $ 38))
                                 |j|))
                             ('T NIL)))
                           (GO G191)))
                         (SEQ (LETT |j_ins| (+ |j_ins| 1))
                              (EXIT (LETT |j_dst| (+ |j_dst| 1))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (SPADCALL |l_col| |j| |j_dst| (QREFELT $ 88))
                    (EXIT (LETT |j_dst| (+ |j_dst| 1))))
                   (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |k| 1) (LETT #4# (LENGTH (QVELT |p| 2))) G190
                   (COND ((|greater_SI| |k| #4#) (GO G191)))
                   (SEQ
                    (LETT |A_src| (SPADCALL (QVELT |p| 2) |k| (QREFELT $ 17)))
                    (LETT |A_dst|
                          (SPADCALL (QVELT |lp_new| 2) |k| (QREFELT $ 17)))
                    (EXIT
                     (SEQ (LETT |i| 1) (LETT #2# (QVELT |p| 0)) G190
                          (COND ((|greater_SI| |i| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |j| 1) (LETT #1# (QVELT |p| 1)) G190
                                 (COND ((|greater_SI| |j| #1#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (QSETAREF2O |A_dst|
                                               (SPADCALL |l_row| |i|
                                                         (QREFELT $ 38))
                                               (SPADCALL |l_col| |j|
                                                         (QREFELT $ 38))
                                               (QAREF2O |A_src| |i| |j| 1 1) 1
                                               1)))
                                 (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT |lp_new|)))) 

(SDEFUN |LINPEN;qswapRows!;$2Nni$;40|
        ((|p| $) (|i| |NonNegativeInteger|) (|j| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|a_tmp| (R)) (#1=#:G858 NIL) (|k| NIL) (#2=#:G857 NIL)
          (|A_wrk| NIL))
         (SEQ
          (COND
           ((NULL (EQL |i| |j|))
            (SEQ (LETT |A_wrk| NIL) (LETT #2# (QVELT |p| 2)) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |A_wrk| (CAR #2#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |k| 1) (LETT #1# (QVELT |p| 1)) G190
                        (COND ((|greater_SI| |k| #1#) (GO G191)))
                        (SEQ (LETT |a_tmp| (QAREF2O |A_wrk| |i| |k| 1 1))
                             (QSETAREF2O |A_wrk| |i| |k|
                                         (QAREF2O |A_wrk| |j| |k| 1 1) 1 1)
                             (EXIT (QSETAREF2O |A_wrk| |j| |k| |a_tmp| 1 1)))
                        (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))))
                 (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
          (EXIT |p|)))) 

(SDEFUN |LINPEN;swapRows!;$2Nni$;41|
        ((|p| $) (|i| |NonNegativeInteger|) (|j| |NonNegativeInteger|) ($ $))
        (SEQ
         (COND
          ((OR (< |i| 1)
               (OR (OR (> |i| (QVELT |p| 0)) (< |j| 1)) (> |j| (QVELT |p| 0))))
           (|error| "LINPEN: swapRows!(%,i,j) - index/indices out of range."))
          ('T (SEQ (SPADCALL |p| |i| |j| (QREFELT $ 90)) (EXIT |p|)))))) 

(SDEFUN |LINPEN;qaddRows!;$2NniR$;42|
        ((|p| $) (|i| |NonNegativeInteger|) (|j| |NonNegativeInteger|)
         (|alpha| R) ($ $))
        (SPROG ((#1=#:G869 NIL) (|k| NIL) (#2=#:G868 NIL) (|A_wrk| NIL))
               (SEQ
                (SEQ (LETT |A_wrk| NIL) (LETT #2# (QVELT |p| 2)) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |A_wrk| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |k| 1) (LETT #1# (QVELT |p| 1)) G190
                            (COND ((|greater_SI| |k| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (QSETAREF2O |A_wrk| |j| |k|
                                          (SPADCALL
                                           (QAREF2O |A_wrk| |j| |k| 1 1)
                                           (SPADCALL |alpha|
                                                     (QAREF2O |A_wrk| |i| |k| 1
                                                              1)
                                                     (QREFELT $ 92))
                                           (QREFELT $ 93))
                                          1 1)))
                            (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT |p|)))) 

(SDEFUN |LINPEN;addRows!;$2NniR$;43|
        ((|p| $) (|i| |NonNegativeInteger|) (|j| |NonNegativeInteger|)
         (|alpha| R) ($ $))
        (SEQ
         (COND
          ((EQL |i| |j|)
           (|error|
            "LINPEN: addRows!(%,i,j,alpha) - indices must be different."))
          ((OR (< |i| 1)
               (OR (OR (> |i| (QVELT |p| 0)) (< |j| 1)) (> |j| (QVELT |p| 0))))
           (|error|
            "LINPEN: addRows!(%,i,j,alpha) - index/indices out of range."))
          ('T (SEQ (SPADCALL |p| |i| |j| |alpha| (QREFELT $ 94)) (EXIT |p|)))))) 

(SDEFUN |LINPEN;qmultiplyRow!;$NniR$;44|
        ((|p| $) (|i| |NonNegativeInteger|) (|alpha| R) ($ $))
        (SPROG ((#1=#:G880 NIL) (|k| NIL) (#2=#:G879 NIL) (|A_wrk| NIL))
               (SEQ
                (SEQ (LETT |A_wrk| NIL) (LETT #2# (QVELT |p| 2)) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |A_wrk| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |k| 1) (LETT #1# (QVELT |p| 1)) G190
                            (COND ((|greater_SI| |k| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (QSETAREF2O |A_wrk| |i| |k|
                                          (SPADCALL |alpha|
                                                    (QAREF2O |A_wrk| |i| |k| 1
                                                             1)
                                                    (QREFELT $ 92))
                                          1 1)))
                            (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT |p|)))) 

(SDEFUN |LINPEN;multiplyRow!;$NniR$;45|
        ((|p| $) (|i| |NonNegativeInteger|) (|alpha| R) ($ $))
        (COND
         ((OR (< |i| 1) (> |i| (QVELT |p| 0)))
          (|error| "LINPEN: multiplyRow!(%,i,alpha) - index out of range."))
         ('T (SPADCALL |p| |i| |alpha| (QREFELT $ 96))))) 

(SDEFUN |LINPEN;qswapColumns!;$2Nni$;46|
        ((|p| $) (|i| |NonNegativeInteger|) (|j| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|a_tmp| (R)) (#1=#:G891 NIL) (|k| NIL) (#2=#:G890 NIL)
          (|A_wrk| NIL))
         (SEQ
          (COND
           ((NULL (EQL |i| |j|))
            (SEQ (LETT |A_wrk| NIL) (LETT #2# (QVELT |p| 2)) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |A_wrk| (CAR #2#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |k| 1) (LETT #1# (QVELT |p| 0)) G190
                        (COND ((|greater_SI| |k| #1#) (GO G191)))
                        (SEQ (LETT |a_tmp| (QAREF2O |A_wrk| |k| |i| 1 1))
                             (QSETAREF2O |A_wrk| |k| |i|
                                         (QAREF2O |A_wrk| |k| |j| 1 1) 1 1)
                             (EXIT (QSETAREF2O |A_wrk| |k| |j| |a_tmp| 1 1)))
                        (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))))
                 (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
          (EXIT |p|)))) 

(SDEFUN |LINPEN;swapColumns!;$2Nni$;47|
        ((|p| $) (|i| |NonNegativeInteger|) (|j| |NonNegativeInteger|) ($ $))
        (COND
         ((OR (< |i| 1)
              (OR (OR (> |i| (QVELT |p| 1)) (< |j| 1)) (> |j| (QVELT |p| 1))))
          (|error|
           "LINPEN: swapColumns!(%,i,j) - index/indices out of range."))
         ('T (SPADCALL |p| |i| |j| (QREFELT $ 98))))) 

(SDEFUN |LINPEN;qaddColumns!;$2NniR$;48|
        ((|p| $) (|i| |NonNegativeInteger|) (|j| |NonNegativeInteger|)
         (|alpha| R) ($ $))
        (SPROG ((#1=#:G902 NIL) (|k| NIL) (#2=#:G901 NIL) (|A_wrk| NIL))
               (SEQ
                (SEQ (LETT |A_wrk| NIL) (LETT #2# (QVELT |p| 2)) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |A_wrk| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |k| 1) (LETT #1# (QVELT |p| 0)) G190
                            (COND ((|greater_SI| |k| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (QSETAREF2O |A_wrk| |k| |j|
                                          (SPADCALL
                                           (QAREF2O |A_wrk| |k| |j| 1 1)
                                           (SPADCALL |alpha|
                                                     (QAREF2O |A_wrk| |k| |i| 1
                                                              1)
                                                     (QREFELT $ 92))
                                           (QREFELT $ 93))
                                          1 1)))
                            (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT |p|)))) 

(SDEFUN |LINPEN;addColumns!;$2NniR$;49|
        ((|p| $) (|i| |NonNegativeInteger|) (|j| |NonNegativeInteger|)
         (|alpha| R) ($ $))
        (COND
         ((EQL |i| |j|)
          (|error|
           "LINPEN: addColumns!(%,i,j,alpha) - indices must be different."))
         ((OR (< |i| 1)
              (OR (OR (> |i| (QVELT |p| 1)) (< |j| 1)) (> |j| (QVELT |p| 1))))
          (|error|
           "LINPEN: addColumns!(%,i,j,alpha) - index/indices out of range."))
         ('T (SPADCALL |p| |i| |j| |alpha| (QREFELT $ 100))))) 

(SDEFUN |LINPEN;qmultiplyColumn!;$NniR$;50|
        ((|p| $) (|j| |NonNegativeInteger|) (|alpha| R) ($ $))
        (SPROG ((#1=#:G913 NIL) (|k| NIL) (#2=#:G912 NIL) (|A_wrk| NIL))
               (SEQ
                (SEQ (LETT |A_wrk| NIL) (LETT #2# (QVELT |p| 2)) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |A_wrk| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |k| 1) (LETT #1# (QVELT |p| 0)) G190
                            (COND ((|greater_SI| |k| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (QSETAREF2O |A_wrk| |k| |j|
                                          (SPADCALL |alpha|
                                                    (QAREF2O |A_wrk| |k| |j| 1
                                                             1)
                                                    (QREFELT $ 92))
                                          1 1)))
                            (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT |p|)))) 

(SDEFUN |LINPEN;multiplyColumn!;$NniR$;51|
        ((|p| $) (|j| |NonNegativeInteger|) (|alpha| R) ($ $))
        (COND
         ((OR (< |j| 1) (> |j| (QVELT |p| 1)))
          (|error| "LINPEN: multiplyColumn!(%,j,alpha) - index out of range."))
         ('T (SPADCALL |p| |j| |alpha| (QREFELT $ 102))))) 

(SDEFUN |LINPEN;qscaleBlock!;$5NniR$;52|
        ((|p| $) (|i_min| |NonNegativeInteger|) (|i_max| |NonNegativeInteger|)
         (|j_min| |NonNegativeInteger|) (|j_max| |NonNegativeInteger|)
         (|l| |NonNegativeInteger|) (|alpha| R) ($ $))
        (SPROG
         ((#1=#:G923 NIL) (|j| NIL) (#2=#:G922 NIL) (|i| NIL)
          (|A_wrk| (|Matrix| R)))
         (SEQ (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |l| (QREFELT $ 17)))
              (SEQ (LETT |i| |i_min|) (LETT #2# |i_max|) G190
                   (COND ((> |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| |j_min|) (LETT #1# |j_max|) G190
                          (COND ((> |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (QSETAREF2O |A_wrk| |i| |j|
                                        (SPADCALL |alpha|
                                                  (QAREF2O |A_wrk| |i| |j| 1 1)
                                                  (QREFELT $ 92))
                                        1 1)))
                          (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (EXIT |p|)))) 

(SDEFUN |LINPEN;*;$M$;53| ((|p| $) (U |Matrix| R) ($ $))
        (SPROG ((|lp_new| ($)))
               (SEQ (LETT |lp_new| (SPADCALL |p| (QREFELT $ 19)))
                    (SPADCALL |lp_new| U (QREFELT $ 105)) (EXIT |lp_new|)))) 

(SDEFUN |LINPEN;*;M2$;54| ((T$ |Matrix| R) (|p| $) ($ $))
        (SPROG ((|lp_new| ($)))
               (SEQ (LETT |lp_new| (SPADCALL |p| (QREFELT $ 19)))
                    (SPADCALL |lp_new| T$ (QREFELT $ 107)) (EXIT |lp_new|)))) 

(SDEFUN |LINPEN;transformRows!;$M$;55| ((|p| $) (T$ |Matrix| R) ($ $))
        (SPROG ((#1=#:G934 NIL) (|k| NIL) (|A_lst| (|List| (|Matrix| R))))
               (SEQ
                (COND
                 ((EQL (ANROWS T$) (ANCOLS T$))
                  (COND
                   ((NULL (EQL (ANROWS T$) (QVELT |p| 0)))
                    (EXIT
                     (|error|
                      #2="LINPEN: transformRows!(%,T) - wrong matrix size.")))))
                 ('T (EXIT (|error| #2#))))
                (LETT |A_lst| (QVELT |p| 2))
                (SEQ (LETT |k| 1) (LETT #1# (LENGTH (QVELT |p| 2))) G190
                     (COND ((|greater_SI| |k| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |A_lst| |k|
                                 (SPADCALL T$
                                           (SPADCALL |A_lst| |k|
                                                     (QREFELT $ 17))
                                           (QREFELT $ 109))
                                 (QREFELT $ 14))))
                     (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                (EXIT |p|)))) 

(SDEFUN |LINPEN;transformColumns!;$M$;56| ((|p| $) (U |Matrix| R) ($ $))
        (SPROG ((#1=#:G941 NIL) (|k| NIL) (|A_lst| (|List| (|Matrix| R))))
               (SEQ
                (COND
                 ((EQL (ANROWS U) (ANCOLS U))
                  (COND
                   ((NULL (EQL (ANROWS U) (QVELT |p| 1)))
                    (EXIT
                     (|error|
                      #2="LINPEN: transformColumns!(%,U) - wrong matrix size.")))))
                 ('T (EXIT (|error| #2#))))
                (LETT |A_lst| (QVELT |p| 2))
                (SEQ (LETT |k| 1) (LETT #1# (LENGTH (QVELT |p| 2))) G190
                     (COND ((|greater_SI| |k| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |A_lst| |k|
                                 (SPADCALL
                                  (SPADCALL |A_lst| |k| (QREFELT $ 17)) U
                                  (QREFELT $ 109))
                                 (QREFELT $ 14))))
                     (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                (EXIT |p|)))) 

(SDEFUN |LINPEN;leftIdentity;$M;57| ((|p| $) ($ |Matrix| R))
        (SPROG ((#1=#:G946 NIL) (|k| NIL) (|trf_mtx| (|Matrix| R)))
               (SEQ
                (LETT |trf_mtx|
                      (MAKE_MATRIX1 (QVELT |p| 0) (QVELT |p| 0)
                                    (|spadConstant| $ 8)))
                (SEQ (LETT |k| 1) (LETT #1# (QVELT |p| 0)) G190
                     (COND ((|greater_SI| |k| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (QSETAREF2O |trf_mtx| |k| |k| (|spadConstant| $ 20) 1
                                   1)))
                     (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                (EXIT |trf_mtx|)))) 

(SDEFUN |LINPEN;rightIdentity;$M;58| ((|p| $) ($ |Matrix| R))
        (SPROG ((#1=#:G951 NIL) (|k| NIL) (|trf_mtx| (|Matrix| R)))
               (SEQ
                (LETT |trf_mtx|
                      (MAKE_MATRIX1 (QVELT |p| 1) (QVELT |p| 1)
                                    (|spadConstant| $ 8)))
                (SEQ (LETT |k| 1) (LETT #1# (QVELT |p| 1)) G190
                     (COND ((|greater_SI| |k| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (QSETAREF2O |trf_mtx| |k| |k| (|spadConstant| $ 20) 1
                                   1)))
                     (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                (EXIT |trf_mtx|)))) 

(SDEFUN |LINPEN;qsetelt!;$3Nni2R;59|
        ((|p| $) (|i| |NonNegativeInteger|) (|j| |NonNegativeInteger|)
         (|l| |NonNegativeInteger|) (|alpha| R) ($ R))
        (SEQ
         (QSETAREF2O (SPADCALL (QVELT |p| 2) |l| (QREFELT $ 17)) |i| |j|
                     |alpha| 1 1)
         (EXIT |alpha|))) 

(SDEFUN |LINPEN;qsetelt!;$2Nni2L;60|
        ((|p| $) (|i| |NonNegativeInteger|) (|j| |NonNegativeInteger|)
         (|lst| |List| R) ($ |List| R))
        (SPROG ((#1=#:G959 NIL) (|l| NIL))
               (SEQ
                (SEQ (LETT |l| 1) (LETT #1# (LENGTH |lst|)) G190
                     (COND ((|greater_SI| |l| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (QSETAREF2O (SPADCALL (QVELT |p| 2) |l| (QREFELT $ 17))
                                   |i| |j| (SPADCALL |lst| |l| (QREFELT $ 113))
                                   1 1)))
                     (LETT |l| (|inc_SI| |l|)) (GO G190) G191 (EXIT NIL))
                (EXIT |lst|)))) 

(SDEFUN |LINPEN;setelt!;$3Nni2R;61|
        ((|p| $) (|i| |NonNegativeInteger|) (|j| |NonNegativeInteger|)
         (|l| |NonNegativeInteger|) (|alpha| R) ($ R))
        (SEQ
         (COND
          ((OR (< |i| 1)
               (OR (OR (> |i| (QVELT |p| 0)) (< |j| 1))
                   (OR (OR (> |j| (QVELT |p| 1)) (< |l| 1))
                       (> |l| (LENGTH (QVELT |p| 2))))))
           (|error| "LINPEN: setelt!(%,i,j,l,alpha) - index out of range."))
          ('T
           (SEQ
            (QSETAREF2O (SPADCALL (QVELT |p| 2) |l| (QREFELT $ 17)) |i| |j|
                        |alpha| 1 1)
            (EXIT |alpha|)))))) 

(SDEFUN |LINPEN;setelt!;$2Nni2L;62|
        ((|p| $) (|i| |NonNegativeInteger|) (|j| |NonNegativeInteger|)
         (|lst| |List| R) ($ |List| R))
        (SPROG ((#1=#:G973 NIL) (|l| NIL))
               (SEQ
                (COND
                 ((OR (< |i| 1)
                      (OR (OR (> |i| (QVELT |p| 0)) (< |j| 1))
                          (> |j| (QVELT |p| 1))))
                  (|error| "LINPEN: setelt!(%,i,j,lst) - index out of range."))
                 ('T
                  (COND
                   ((> (LENGTH |lst|) (LENGTH (QVELT |p| 2)))
                    (|error|
                     "LINPEN: setelt!(%,i,j,lst) - list of elements to long."))
                   ('T
                    (SEQ
                     (SEQ (LETT |l| 1) (LETT #1# (LENGTH |lst|)) G190
                          (COND ((|greater_SI| |l| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (QSETAREF2O
                             (SPADCALL (QVELT |p| 2) |l| (QREFELT $ 17)) |i|
                             |j| (SPADCALL |lst| |l| (QREFELT $ 113)) 1 1)))
                          (LETT |l| (|inc_SI| |l|)) (GO G190) G191 (EXIT NIL))
                     (EXIT |lst|))))))))) 

(SDEFUN |LINPEN;setsubMatrix!;$3Nni2M;63|
        ((|p| $) (|i| |NonNegativeInteger|) (|j| |NonNegativeInteger|)
         (|l| |NonNegativeInteger|) (|a| |Matrix| R) ($ |Matrix| R))
        (SPROG ((|A_wrk| (|Matrix| R)))
               (SEQ
                (COND
                 ((OR (< |i| 1)
                      (OR (OR (> |i| (QVELT |p| 0)) (< |j| 1))
                          (OR (OR (> |j| (QVELT |p| 1)) (< |l| 1))
                              (> |l| (LENGTH (QVELT |p| 2))))))
                  (|error|
                   "LINPEN: setsubMatrix!(%,i,j,l,a) - index out of range."))
                 ('T
                  (SEQ
                   (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |l| (QREFELT $ 17)))
                   (EXIT (SPADCALL |A_wrk| |i| |j| |a| (QREFELT $ 117))))))))) 

(SDEFUN |LINPEN;setsubPencil!;$2Nni2$;64|
        ((|p| $) (|i| |NonNegativeInteger|) (|j| |NonNegativeInteger|) (|q| $)
         ($ $))
        (SPROG
         ((|A_wrk| (|Matrix| R)) (#1=#:G992 NIL) (|k| NIL) (#2=#:G983 NIL)
          (#3=#:G982 NIL))
         (SEQ
          (COND
           ((OR (< |i| 1)
                (OR (OR (> |i| (QVELT |p| 0)) (< |j| 1))
                    (> |j| (QVELT |p| 1))))
            (|error| "LINPEN: setsubPencil!(%,i,j,%) - index out of range."))
           ((OR
             (> (QVELT |q| 0)
                (PROG1 (LETT #3# (- (+ (QVELT |p| 0) 1) |i|))
                  (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #3#)))
             (> (QVELT |q| 1)
                (PROG1 (LETT #2# (- (+ (QVELT |p| 1) 1) |j|))
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#))))
            (|error| "LINPEN: setsubPencil!(%,i,j,%) - pencil to big."))
           ((NULL (EQL (LENGTH (QVELT |p| 2)) (LENGTH (QVELT |q| 2))))
            (|error|
             "LINPEN: setsubPencil!(%,i,j,%) - different number of matrices."))
           ('T
            (SEQ
             (SEQ (LETT |k| 1) (LETT #1# (LENGTH (QVELT |p| 2))) G190
                  (COND ((|greater_SI| |k| #1#) (GO G191)))
                  (SEQ
                   (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |k| (QREFELT $ 17)))
                   (EXIT
                    (SPADCALL |A_wrk| |i| |j|
                              (SPADCALL (QVELT |q| 2) |k| (QREFELT $ 17))
                              (QREFELT $ 117))))
                  (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
             (EXIT |p|))))))) 

(SDEFUN |LINPEN;blockElimination;$6LL;65|
        ((|p| $) (|rsrc| |List| (|NonNegativeInteger|))
         (|rdst| |List| (|NonNegativeInteger|))
         (|rext| |List| (|NonNegativeInteger|))
         (|csrc| |List| (|NonNegativeInteger|))
         (|cdst| |List| (|NonNegativeInteger|))
         (|cext| |List| (|NonNegativeInteger|)) ($ |List| (|Matrix| R)))
        (SPROG
         ((|lst_trn| (|List| (|Matrix| R)))
          (|idx_fct| #1=(|NonNegativeInteger|)) (#2=#:G1178 NIL)
          (|j_src| #3=(|NonNegativeInteger|)) (#4=#:G1197 NIL) (|l| NIL)
          (|j_wrk| #5=(|NonNegativeInteger|)) (#6=#:G1196 NIL) (|j| NIL)
          (#7=#:G1159 NIL) (|i_src| #3#) (#8=#:G1195 NIL) (|i_wrk| #5#)
          (#9=#:G1194 NIL) (|i| NIL) (|lst_coe| (|List| R)) (#10=#:G1117 NIL)
          (#11=#:G1193 NIL) (|U_wrk| #12=(|Matrix| R)) (#13=#:G1192 NIL)
          (|T_wrk| #12#)
          (|sol_wrk|
           (|Record| (|:| |particular| (|Union| (|Vector| R) #14="failed"))
                     (|:| |basis| (|List| (|Vector| R)))))
          (#15=#:G1106 NIL) (#16=#:G1191 NIL) (#17=#:G1062 NIL)
          (#18=#:G1190 NIL) (|idx_eqn| #1#) (#19=#:G1022 NIL) (#20=#:G1189 NIL)
          (#21=#:G1020 NIL) (|i_off| #22=(|NonNegativeInteger|))
          (#23=#:G1019 NIL) (#24=#:G1188 NIL) (|k_off| #22#) (#25=#:G1006 NIL)
          (|A_wrk| (|Matrix| R)) (#26=#:G1187 NIL) (|k| NIL)
          (|lst_rhs| (|List| R)) (|mtx_sys| #12#)
          (|n_var| (|NonNegativeInteger|)) (|n_eqn| #22#) (|n_row| #1#)
          (|n_col| #1#) (|n_fct| #1#) (|nr_fct| #22#) (|nc_fct| #22#)
          (|col_ext| (|List| (|NonNegativeInteger|)))
          (|col_dst| (|List| (|NonNegativeInteger|)))
          (|col_src| (|List| (|NonNegativeInteger|)))
          (|row_ext| (|List| (|NonNegativeInteger|)))
          (|row_dst| (|List| (|NonNegativeInteger|)))
          (|row_src| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |row_src| |rsrc|) (LETT |row_dst| |rdst|)
              (LETT |row_ext| |rext|) (LETT |col_src| |csrc|)
              (LETT |col_dst| |cdst|) (LETT |col_ext| |cext|)
              (LETT |nc_fct|
                    (* (SPADCALL |col_src| (QREFELT $ 34))
                       (SPADCALL |col_dst| (QREFELT $ 34))))
              (LETT |nr_fct|
                    (* (SPADCALL |row_src| (QREFELT $ 34))
                       (SPADCALL |row_dst| (QREFELT $ 34))))
              (LETT |n_fct| (+ |nc_fct| |nr_fct|))
              (LETT |n_col|
                    (+ (SPADCALL |col_dst| (QREFELT $ 34))
                       (SPADCALL |col_ext| (QREFELT $ 34))))
              (LETT |n_row|
                    (+ (SPADCALL |row_dst| (QREFELT $ 34))
                       (SPADCALL |row_ext| (QREFELT $ 34))))
              (LETT |n_eqn| (* |n_row| |n_col|))
              (LETT |n_var| (LENGTH (QVELT |p| 2)))
              (LETT |mtx_sys|
                    (MAKE_MATRIX1 (* |n_var| |n_eqn|) |n_fct|
                                  (|spadConstant| $ 8)))
              (LETT |lst_rhs|
                    (SPADCALL (* |n_var| |n_eqn|) (|spadConstant| $ 8)
                              (QREFELT $ 57)))
              (SEQ (LETT |k| 1) (LETT #26# |n_var|) G190
                   (COND ((|greater_SI| |k| #26#) (GO G191)))
                   (SEQ
                    (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |k| (QREFELT $ 17)))
                    (LETT |k_off|
                          (*
                           (PROG1 (LETT #25# (- |k| 1))
                             (|check_subtype2| (>= #25# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #25#))
                           |n_eqn|))
                    (EXIT
                     (SEQ (LETT |i| 1) (LETT #24# |n_row|) G190
                          (COND ((|greater_SI| |i| #24#) (GO G191)))
                          (SEQ (LETT |i_wrk| 0)
                               (LETT |i_off|
                                     (*
                                      (PROG1 (LETT #23# (- |i| 1))
                                        (|check_subtype2| (>= #23# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #23#))
                                      |n_col|))
                               (COND
                                ((<= |i| (SPADCALL |row_dst| (QREFELT $ 34)))
                                 (LETT |i_wrk|
                                       (SPADCALL |row_dst| |i|
                                                 (QREFELT $ 38))))
                                ('T
                                 (LETT |i_wrk|
                                       (SPADCALL |row_ext|
                                                 (PROG1
                                                     (LETT #21#
                                                           (- |i|
                                                              (SPADCALL
                                                               |row_dst|
                                                               (QREFELT $
                                                                        34))))
                                                   (|check_subtype2|
                                                    (>= #21# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #21#))
                                                 (QREFELT $ 38)))))
                               (EXIT
                                (SEQ (LETT |j| 1) (LETT #20# |n_col|) G190
                                     (COND ((|greater_SI| |j| #20#) (GO G191)))
                                     (SEQ (LETT |j_wrk| 0)
                                          (COND
                                           ((<= |j|
                                                (SPADCALL |col_dst|
                                                          (QREFELT $ 34)))
                                            (LETT |j_wrk|
                                                  (SPADCALL |col_dst| |j|
                                                            (QREFELT $ 38))))
                                           ('T
                                            (LETT |j_wrk|
                                                  (SPADCALL |col_ext|
                                                            (PROG1
                                                                (LETT #19#
                                                                      (- |j|
                                                                         (SPADCALL
                                                                          |col_dst|
                                                                          (QREFELT
                                                                           $
                                                                           34))))
                                                              (|check_subtype2|
                                                               (>= #19# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #19#))
                                                            (QREFELT $ 38)))))
                                          (LETT |idx_eqn|
                                                (+ (+ |k_off| |i_off|) |j|))
                                          (SPADCALL |lst_rhs| |idx_eqn|
                                                    (SPADCALL
                                                     (QAREF2O |A_wrk| |i_wrk|
                                                              |j_wrk| 1 1)
                                                     (QREFELT $ 120))
                                                    (QREFELT $ 58))
                                          (COND
                                           ((<= |i|
                                                (SPADCALL |row_dst|
                                                          (QREFELT $ 34)))
                                            (SEQ (LETT |l| 1)
                                                 (LETT #18#
                                                       (SPADCALL |row_src|
                                                                 (QREFELT $
                                                                          34)))
                                                 G190
                                                 (COND
                                                  ((|greater_SI| |l| #18#)
                                                   (GO G191)))
                                                 (SEQ
                                                  (LETT |i_src|
                                                        (SPADCALL |row_src| |l|
                                                                  (QREFELT $
                                                                           38)))
                                                  (LETT |idx_fct|
                                                        (+
                                                         (*
                                                          (PROG1
                                                              (LETT #17#
                                                                    (- |i| 1))
                                                            (|check_subtype2|
                                                             (>= #17# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|)
                                                             #17#))
                                                          (SPADCALL |row_src|
                                                                    (QREFELT $
                                                                             34)))
                                                         |l|))
                                                  (EXIT
                                                   (QSETAREF2O |mtx_sys|
                                                               |idx_eqn|
                                                               |idx_fct|
                                                               (QAREF2O |A_wrk|
                                                                        |i_src|
                                                                        |j_wrk|
                                                                        1 1)
                                                               1 1)))
                                                 (LETT |l| (|inc_SI| |l|))
                                                 (GO G190) G191 (EXIT NIL))))
                                          (EXIT
                                           (COND
                                            ((<= |j|
                                                 (SPADCALL |col_dst|
                                                           (QREFELT $ 34)))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #16#
                                                        (SPADCALL |col_src|
                                                                  (QREFELT $
                                                                           34)))
                                                  G190
                                                  (COND
                                                   ((|greater_SI| |l| #16#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (LETT |j_src|
                                                         (SPADCALL |col_src|
                                                                   |l|
                                                                   (QREFELT $
                                                                            38)))
                                                   (LETT |idx_fct|
                                                         (+
                                                          (+ |nr_fct|
                                                             (*
                                                              (PROG1
                                                                  (LETT #15#
                                                                        (- |j|
                                                                           1))
                                                                (|check_subtype2|
                                                                 (>= #15# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #15#))
                                                              (SPADCALL
                                                               |col_src|
                                                               (QREFELT $
                                                                        34))))
                                                          |l|))
                                                   (EXIT
                                                    (QSETAREF2O |mtx_sys|
                                                                |idx_eqn|
                                                                |idx_fct|
                                                                (QAREF2O
                                                                 |A_wrk|
                                                                 |i_wrk|
                                                                 |j_src| 1 1)
                                                                1 1)))
                                                  (LETT |l| (|inc_SI| |l|))
                                                  (GO G190) G191
                                                  (EXIT NIL))))))
                                     (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                     (EXIT NIL))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (LETT |sol_wrk|
                    (SPADCALL |mtx_sys| (SPADCALL |lst_rhs| (QREFELT $ 122))
                              (QREFELT $ 126)))
              (LETT |lst_trn| NIL)
              (COND
               ((NULL (QEQCAR (QCAR |sol_wrk|) 1))
                (SEQ
                 (LETT |T_wrk|
                       (MAKE_MATRIX1 (QVELT |p| 0) (QVELT |p| 0)
                                     (|spadConstant| $ 8)))
                 (SEQ (LETT |i| 1) (LETT #13# (QVELT |p| 0)) G190
                      (COND ((|greater_SI| |i| #13#) (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF2O |T_wrk| |i| |i| (|spadConstant| $ 20) 1
                                    1)))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 (LETT |U_wrk|
                       (MAKE_MATRIX1 (QVELT |p| 1) (QVELT |p| 1)
                                     (|spadConstant| $ 8)))
                 (SEQ (LETT |j| 1) (LETT #11# (QVELT |p| 1)) G190
                      (COND ((|greater_SI| |j| #11#) (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF2O |U_wrk| |j| |j| (|spadConstant| $ 20) 1
                                    1)))
                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                 (LETT |lst_coe|
                       (SPADCALL
                        (PROG2 (LETT #10# (QCAR |sol_wrk|))
                            (QCDR #10#)
                          (|check_union2| (QEQCAR #10# 0)
                                          (|Vector| (QREFELT $ 6))
                                          (|Union| (|Vector| (QREFELT $ 6))
                                                   #14#)
                                          #10#))
                        (QREFELT $ 127)))
                 (SEQ (LETT |i| 1)
                      (LETT #9# (SPADCALL |row_dst| (QREFELT $ 34))) G190
                      (COND ((|greater_SI| |i| #9#) (GO G191)))
                      (SEQ
                       (LETT |i_wrk| (SPADCALL |row_dst| |i| (QREFELT $ 38)))
                       (EXIT
                        (SEQ (LETT |l| 1)
                             (LETT #8# (SPADCALL |row_src| (QREFELT $ 34)))
                             G190 (COND ((|greater_SI| |l| #8#) (GO G191)))
                             (SEQ
                              (LETT |i_src|
                                    (SPADCALL |row_src| |l| (QREFELT $ 38)))
                              (LETT |idx_fct|
                                    (+
                                     (*
                                      (PROG1 (LETT #7# (- |i| 1))
                                        (|check_subtype2| (>= #7# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #7#))
                                      (SPADCALL |row_src| (QREFELT $ 34)))
                                     |l|))
                              (EXIT
                               (QSETAREF2O |T_wrk| |i_wrk| |i_src|
                                           (SPADCALL |lst_coe| |idx_fct|
                                                     (QREFELT $ 113))
                                           1 1)))
                             (LETT |l| (|inc_SI| |l|)) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 (SEQ (LETT |j| 1)
                      (LETT #6# (SPADCALL |col_dst| (QREFELT $ 34))) G190
                      (COND ((|greater_SI| |j| #6#) (GO G191)))
                      (SEQ
                       (LETT |j_wrk| (SPADCALL |col_dst| |j| (QREFELT $ 38)))
                       (EXIT
                        (SEQ (LETT |l| 1)
                             (LETT #4# (SPADCALL |col_src| (QREFELT $ 34)))
                             G190 (COND ((|greater_SI| |l| #4#) (GO G191)))
                             (SEQ
                              (LETT |j_src|
                                    (SPADCALL |col_src| |l| (QREFELT $ 38)))
                              (LETT |idx_fct|
                                    (+
                                     (+ |nr_fct|
                                        (*
                                         (PROG1 (LETT #2# (- |j| 1))
                                           (|check_subtype2| (>= #2# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #2#))
                                         (SPADCALL |col_src| (QREFELT $ 34))))
                                     |l|))
                              (EXIT
                               (QSETAREF2O |U_wrk| |j_src| |j_wrk|
                                           (SPADCALL |lst_coe| |idx_fct|
                                                     (QREFELT $ 113))
                                           1 1)))
                             (LETT |l| (|inc_SI| |l|)) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                 (LETT |lst_trn| (CONS |U_wrk| |lst_trn|))
                 (EXIT (LETT |lst_trn| (CONS |T_wrk| |lst_trn|))))))
              (EXIT |lst_trn|)))) 

(SDEFUN |LINPEN;eliminationTransformations;$2LS2LSL;66|
        ((|p| $) (|row_P| |List| (|NonNegativeInteger|))
         (|col_P| |List| (|NonNegativeInteger|)) (|sym_P| |Symbol|)
         (|row_Q| |List| (|NonNegativeInteger|))
         (|col_Q| |List| (|NonNegativeInteger|)) (|sym_Q| |Symbol|)
         ($ |List| (|Matrix| (|Polynomial| R))))
        (SPROG
         ((|idx_Q| #1=(|NonNegativeInteger|)) (#2=#:G1214 NIL) (|j| NIL)
          (#3=#:G1213 NIL) (|i| NIL) (|idx_P| #1#) (#4=#:G1212 NIL)
          (#5=#:G1211 NIL) (#6=#:G1210 NIL) (#7=#:G1209 NIL)
          (|Q_wrk| #8=(|Matrix| (|Polynomial| R))) (|P_wrk| #8#))
         (SEQ
          (LETT |P_wrk|
                (MAKE_MATRIX1 (QVELT |p| 0) (QVELT |p| 0)
                              (|spadConstant| $ 130)))
          (LETT |Q_wrk|
                (MAKE_MATRIX1 (QVELT |p| 1) (QVELT |p| 1)
                              (|spadConstant| $ 130)))
          (SEQ (LETT |i| 1) (LETT #7# (QVELT |p| 0)) G190
               (COND ((|greater_SI| |i| #7#) (GO G191)))
               (SEQ
                (EXIT (QSETAREF2O |P_wrk| |i| |i| (|spadConstant| $ 131) 1 1)))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |i| 1) (LETT #6# (QVELT |p| 1)) G190
               (COND ((|greater_SI| |i| #6#) (GO G191)))
               (SEQ
                (EXIT (QSETAREF2O |Q_wrk| |i| |i| (|spadConstant| $ 131) 1 1)))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (LETT |idx_P| 0)
          (SEQ (LETT |i| NIL) (LETT #5# |row_P|) G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |i| (CAR #5#)) NIL)) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| NIL) (LETT #4# |col_P|) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |j| (CAR #4#)) NIL))
                        (GO G191)))
                      (SEQ (LETT |idx_P| (+ |idx_P| 1))
                           (EXIT
                            (QSETAREF2O |P_wrk| |i| |j|
                                        (SPADCALL
                                         (SPADCALL |sym_P|
                                                   (LIST
                                                    (SPADCALL |idx_P|
                                                              (QREFELT $ 132)))
                                                   (QREFELT $ 135))
                                         (QREFELT $ 136))
                                        1 1)))
                      (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))))
               (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
          (LETT |idx_Q| 0)
          (SEQ (LETT |i| NIL) (LETT #3# |row_Q|) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#)) NIL)) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| NIL) (LETT #2# |col_Q|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |j| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ (LETT |idx_Q| (+ |idx_Q| 1))
                           (EXIT
                            (QSETAREF2O |Q_wrk| |i| |j|
                                        (SPADCALL
                                         (SPADCALL |sym_Q|
                                                   (LIST
                                                    (SPADCALL |idx_Q|
                                                              (QREFELT $ 132)))
                                                   (QREFELT $ 135))
                                         (QREFELT $ 136))
                                        1 1)))
                      (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
               (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
          (EXIT (LIST |P_wrk| |Q_wrk|))))) 

(SDEFUN |LINPEN;eliminationTransformations;$4LL;67|
        ((|p| $) (|row_P| |List| (|NonNegativeInteger|))
         (|col_P| |List| (|NonNegativeInteger|))
         (|row_Q| |List| (|NonNegativeInteger|))
         (|col_Q| |List| (|NonNegativeInteger|))
         ($ |List| (|Matrix| (|Polynomial| R))))
        (SPADCALL |p| |row_P| |col_P| '|a| |row_Q| |col_Q| '|b|
                  (QREFELT $ 138))) 

(SDEFUN |LINPEN;eliminationTransformations;$4LLL;68|
        ((|p| $) (|row_P| |List| (|NonNegativeInteger|))
         (|col_P| |List| (|NonNegativeInteger|))
         (|row_Q| |List| (|NonNegativeInteger|))
         (|col_Q| |List| (|NonNegativeInteger|))
         (|sol| |List| (|Equation| (|Polynomial| R))) ($ |List| (|Matrix| R)))
        (SPROG
         ((|val_wrk| (|Polynomial| R)) (|idx_Q| #1=(|NonNegativeInteger|))
          (#2=#:G1233 NIL) (|j| NIL) (#3=#:G1232 NIL) (|i| NIL) (|idx_P| #1#)
          (#4=#:G1231 NIL) (#5=#:G1230 NIL) (#6=#:G1229 NIL) (#7=#:G1228 NIL)
          (|sym_Q| (|Symbol|)) (|sym_P| (|Symbol|)) (|Q_wrk| #8=(|Matrix| R))
          (|P_wrk| #8#) (|lst_trn| (|List| (|Matrix| (|Polynomial| R)))))
         (SEQ
          (LETT |lst_trn|
                (SPADCALL |p| |row_P| |col_P| |row_Q| |col_Q| (QREFELT $ 139)))
          (LETT |P_wrk|
                (MAKE_MATRIX1 (QVELT |p| 0) (QVELT |p| 0)
                              (|spadConstant| $ 8)))
          (LETT |Q_wrk|
                (MAKE_MATRIX1 (QVELT |p| 1) (QVELT |p| 1)
                              (|spadConstant| $ 8)))
          (LETT |sym_P| '|a|) (LETT |sym_Q| '|b|)
          (SEQ (LETT |i| 1) (LETT #7# (QVELT |p| 0)) G190
               (COND ((|greater_SI| |i| #7#) (GO G191)))
               (SEQ
                (EXIT (QSETAREF2O |P_wrk| |i| |i| (|spadConstant| $ 20) 1 1)))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |i| 1) (LETT #6# (QVELT |p| 1)) G190
               (COND ((|greater_SI| |i| #6#) (GO G191)))
               (SEQ
                (EXIT (QSETAREF2O |Q_wrk| |i| |i| (|spadConstant| $ 20) 1 1)))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (LETT |idx_P| 0)
          (SEQ (LETT |i| NIL) (LETT #5# |row_P|) G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |i| (CAR #5#)) NIL)) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| NIL) (LETT #4# |col_P|) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |j| (CAR #4#)) NIL))
                        (GO G191)))
                      (SEQ (LETT |idx_P| (+ |idx_P| 1))
                           (LETT |val_wrk|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL |sym_P|
                                             (LIST
                                              (SPADCALL |idx_P|
                                                        (QREFELT $ 132)))
                                             (QREFELT $ 135))
                                   (QREFELT $ 136))
                                  |sol| (QREFELT $ 143)))
                           (EXIT
                            (COND
                             ((< (SPADCALL |val_wrk| (QREFELT $ 144)) 1)
                              (QSETAREF2O |P_wrk| |i| |j|
                                          (SPADCALL |val_wrk| (QREFELT $ 145))
                                          1 1)))))
                      (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))))
               (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            ((< (SPADCALL |P_wrk| (QREFELT $ 146)) (QVELT |p| 0))
             (|error|
              "LINPEN: eliminationTransformations(p,...) - row transformation matrix not invertible."))
            (#9='T
             (SEQ (LETT |idx_Q| 0)
                  (SEQ (LETT |i| NIL) (LETT #3# |row_Q|) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |j| NIL) (LETT #2# |col_Q|) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |j| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ (LETT |idx_Q| (+ |idx_Q| 1))
                                   (LETT |val_wrk|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |sym_Q|
                                                     (LIST
                                                      (SPADCALL |idx_Q|
                                                                (QREFELT $
                                                                         132)))
                                                     (QREFELT $ 135))
                                           (QREFELT $ 136))
                                          |sol| (QREFELT $ 143)))
                                   (EXIT
                                    (COND
                                     ((< (SPADCALL |val_wrk| (QREFELT $ 144))
                                         1)
                                      (QSETAREF2O |Q_wrk| |i| |j|
                                                  (SPADCALL |val_wrk|
                                                            (QREFELT $ 145))
                                                  1 1)))))
                              (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
                       (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND
                    ((< (SPADCALL |Q_wrk| (QREFELT $ 146)) (QVELT |p| 1))
                     (|error|
                      "LINPEN: eliminationTransformations(p,...) - column transformation matrix not invertible."))
                    (#9# (LIST |P_wrk| |Q_wrk|))))))))))) 

(SDEFUN |LINPEN;eliminationEquations;$6LL;69|
        ((|p| $) (|row_P| |List| (|NonNegativeInteger|))
         (|col_P| |List| (|NonNegativeInteger|))
         (|row_Q| |List| (|NonNegativeInteger|))
         (|col_Q| |List| (|NonNegativeInteger|))
         (|rdst| |List| (|NonNegativeInteger|))
         (|cdst| |List| (|NonNegativeInteger|))
         ($ |List| (|Matrix| (|Polynomial| R))))
        (SPROG
         ((|lst_mtx| (|List| (|Matrix| (|Polynomial| R)))) (#1=#:G1246 NIL)
          (|j| NIL) (#2=#:G1245 NIL) (|i| NIL)
          (|E_wrk| (|Matrix| (|Polynomial| R)))
          (|B_wrk| (|Matrix| (|Polynomial| R))) (#3=#:G1244 NIL)
          (#4=#:G1243 NIL) (|A_tmp| (|Matrix| R)) (|k| NIL)
          (|A_wrk| (|Matrix| (|Polynomial| R)))
          (|lst_trn| (|List| (|Matrix| (|Polynomial| R)))))
         (SEQ
          (LETT |lst_trn|
                (SPADCALL |p| |row_P| |col_P| '|a| |row_Q| |col_Q| '|b|
                          (QREFELT $ 138)))
          (LETT |lst_mtx| NIL)
          (LETT |A_wrk|
                (MAKE_MATRIX1 (QVELT |p| 0) (QVELT |p| 1)
                              (|spadConstant| $ 130)))
          (SEQ (LETT |k| (LENGTH (QVELT |p| 2))) G190
               (COND ((< |k| 1) (GO G191)))
               (SEQ (LETT |A_tmp| (SPADCALL (QVELT |p| 2) |k| (QREFELT $ 17)))
                    (SEQ (LETT |i| 1) (LETT #4# (QVELT |p| 0)) G190
                         (COND ((|greater_SI| |i| #4#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| 1) (LETT #3# (QVELT |p| 1)) G190
                                (COND ((|greater_SI| |j| #3#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (QSETAREF2O |A_wrk| |i| |j|
                                              (SPADCALL
                                               (QAREF2O |A_tmp| |i| |j| 1 1)
                                               (QREFELT $ 149))
                                              1 1)))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (LETT |B_wrk|
                          (SPADCALL
                           (SPADCALL (SPADCALL |lst_trn| 1 (QREFELT $ 151))
                                     |A_wrk| (QREFELT $ 152))
                           (SPADCALL |lst_trn| 2 (QREFELT $ 151))
                           (QREFELT $ 152)))
                    (LETT |E_wrk|
                          (SPADCALL (QVELT |p| 0) (QVELT |p| 1)
                                    (QREFELT $ 153)))
                    (SEQ (LETT |i| NIL) (LETT #2# |rdst|) G190
                         (COND
                          ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| NIL) (LETT #1# |cdst|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |j| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (QSETAREF2O |E_wrk| |i| |j|
                                              (QAREF2O |B_wrk| |i| |j| 1 1) 1
                                              1)))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |lst_mtx| (CONS |E_wrk| |lst_mtx|))))
               (LETT |k| (+ |k| -1)) (GO G190) G191 (EXIT NIL))
          (EXIT |lst_mtx|)))) 

(SDEFUN |LINPEN;eliminationEquations;$10LL;70|
        ((|p| $) (|row_P| |List| (|NonNegativeInteger|))
         (|col_P| |List| (|NonNegativeInteger|))
         (|row_Q| |List| (|NonNegativeInteger|))
         (|col_Q| |List| (|NonNegativeInteger|))
         (|rdst| |List| (|NonNegativeInteger|))
         (|cdst| |List| (|NonNegativeInteger|))
         (|rex1| |List| (|NonNegativeInteger|))
         (|cex1| |List| (|NonNegativeInteger|))
         (|rex2| |List| (|NonNegativeInteger|))
         (|cex2| |List| (|NonNegativeInteger|))
         ($ |List| (|Matrix| (|Polynomial| R))))
        (SPROG
         ((|lst_mtx| (|List| (|Matrix| (|Polynomial| R)))) (#1=#:G1267 NIL)
          (|j| NIL) (#2=#:G1266 NIL) (|i| NIL) (#3=#:G1265 NIL)
          (#4=#:G1264 NIL) (#5=#:G1263 NIL) (#6=#:G1262 NIL)
          (|E_wrk| (|Matrix| (|Polynomial| R)))
          (|B_wrk| (|Matrix| (|Polynomial| R))) (#7=#:G1261 NIL)
          (#8=#:G1260 NIL) (|A_tmp| (|Matrix| R)) (|k| NIL)
          (|A_wrk| (|Matrix| (|Polynomial| R)))
          (|lst_trn| (|List| (|Matrix| (|Polynomial| R)))))
         (SEQ
          (LETT |lst_trn|
                (SPADCALL |p| |row_P| |col_P| '|a| |row_Q| |col_Q| '|b|
                          (QREFELT $ 138)))
          (LETT |lst_mtx| NIL)
          (LETT |A_wrk|
                (MAKE_MATRIX1 (QVELT |p| 0) (QVELT |p| 1)
                              (|spadConstant| $ 130)))
          (SEQ (LETT |k| (LENGTH (QVELT |p| 2))) G190
               (COND ((< |k| 1) (GO G191)))
               (SEQ (LETT |A_tmp| (SPADCALL (QVELT |p| 2) |k| (QREFELT $ 17)))
                    (SEQ (LETT |i| 1) (LETT #8# (QVELT |p| 0)) G190
                         (COND ((|greater_SI| |i| #8#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| 1) (LETT #7# (QVELT |p| 1)) G190
                                (COND ((|greater_SI| |j| #7#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (QSETAREF2O |A_wrk| |i| |j|
                                              (SPADCALL
                                               (QAREF2O |A_tmp| |i| |j| 1 1)
                                               (QREFELT $ 149))
                                              1 1)))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (LETT |B_wrk|
                          (SPADCALL
                           (SPADCALL (SPADCALL |lst_trn| 1 (QREFELT $ 151))
                                     |A_wrk| (QREFELT $ 152))
                           (SPADCALL |lst_trn| 2 (QREFELT $ 151))
                           (QREFELT $ 152)))
                    (LETT |E_wrk|
                          (SPADCALL (QVELT |p| 0) (QVELT |p| 1)
                                    (QREFELT $ 153)))
                    (SEQ (LETT |i| NIL) (LETT #6# |rdst|) G190
                         (COND
                          ((OR (ATOM #6#) (PROGN (LETT |i| (CAR #6#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| NIL) (LETT #5# |cdst|) G190
                                (COND
                                 ((OR (ATOM #5#)
                                      (PROGN (LETT |j| (CAR #5#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (QSETAREF2O |E_wrk| |i| |j|
                                              (QAREF2O |B_wrk| |i| |j| 1 1) 1
                                              1)))
                                (LETT #5# (CDR #5#)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                    (SEQ (LETT |i| NIL) (LETT #4# |rex1|) G190
                         (COND
                          ((OR (ATOM #4#) (PROGN (LETT |i| (CAR #4#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| NIL) (LETT #3# |cex1|) G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |j| (CAR #3#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (QSETAREF2O |E_wrk| |i| |j|
                                              (QAREF2O |B_wrk| |i| |j| 1 1) 1
                                              1)))
                                (LETT #3# (CDR #3#)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                    (SEQ (LETT |i| NIL) (LETT #2# |rex2|) G190
                         (COND
                          ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| NIL) (LETT #1# |cex2|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |j| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (QSETAREF2O |E_wrk| |i| |j|
                                              (QAREF2O |B_wrk| |i| |j| 1 1) 1
                                              1)))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |lst_mtx| (CONS |E_wrk| |lst_mtx|))))
               (LETT |k| (+ |k| -1)) (GO G190) G191 (EXIT NIL))
          (EXIT |lst_mtx|)))) 

(SDEFUN |LINPEN;eliminationEquations;$10LL;71|
        ((|p| $) (|row_P| |List| (|NonNegativeInteger|))
         (|col_P| |List| (|NonNegativeInteger|))
         (|row_Q| |List| (|NonNegativeInteger|))
         (|col_Q| |List| (|NonNegativeInteger|))
         (|rdst| |List| (|NonNegativeInteger|))
         (|cdst| |List| (|NonNegativeInteger|))
         (|rex1| |List| (|NonNegativeInteger|))
         (|cex1| |List| (|NonNegativeInteger|))
         (|rex2| |List| (|NonNegativeInteger|))
         (|cex2| |List| (|NonNegativeInteger|)) ($ |List| (|Polynomial| R)))
        (SPROG
         ((|lst_eqn| (|List| (|Polynomial| R))) (|det_Q| #1=(|Polynomial| R))
          (|det_P| #1#) (#2=#:G1293 NIL) (|j| NIL) (#3=#:G1292 NIL) (|i| NIL)
          (#4=#:G1291 NIL) (#5=#:G1290 NIL) (#6=#:G1289 NIL) (#7=#:G1288 NIL)
          (|B_wrk| (|Matrix| (|Polynomial| R))) (#8=#:G1287 NIL)
          (#9=#:G1286 NIL) (|A_tmp| (|Matrix| R)) (|k| NIL)
          (|A_wrk| (|Matrix| (|Polynomial| R)))
          (|lst_trn| (|List| (|Matrix| (|Polynomial| R)))))
         (SEQ
          (LETT |lst_trn|
                (SPADCALL |p| |row_P| |col_P| '|a| |row_Q| |col_Q| '|b|
                          (QREFELT $ 138)))
          (LETT |lst_eqn| NIL)
          (LETT |A_wrk|
                (MAKE_MATRIX1 (QVELT |p| 0) (QVELT |p| 1)
                              (|spadConstant| $ 130)))
          (SEQ (LETT |k| (LENGTH (QVELT |p| 2))) G190
               (COND ((< |k| 1) (GO G191)))
               (SEQ (LETT |A_tmp| (SPADCALL (QVELT |p| 2) |k| (QREFELT $ 17)))
                    (SEQ (LETT |i| 1) (LETT #9# (QVELT |p| 0)) G190
                         (COND ((|greater_SI| |i| #9#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| 1) (LETT #8# (QVELT |p| 1)) G190
                                (COND ((|greater_SI| |j| #8#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (QSETAREF2O |A_wrk| |i| |j|
                                              (SPADCALL
                                               (QAREF2O |A_tmp| |i| |j| 1 1)
                                               (QREFELT $ 149))
                                              1 1)))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (LETT |B_wrk|
                          (SPADCALL
                           (SPADCALL (SPADCALL |lst_trn| 1 (QREFELT $ 151))
                                     |A_wrk| (QREFELT $ 152))
                           (SPADCALL |lst_trn| 2 (QREFELT $ 151))
                           (QREFELT $ 152)))
                    (SEQ (LETT |i| NIL) (LETT #7# |rdst|) G190
                         (COND
                          ((OR (ATOM #7#) (PROGN (LETT |i| (CAR #7#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| NIL) (LETT #6# |cdst|) G190
                                (COND
                                 ((OR (ATOM #6#)
                                      (PROGN (LETT |j| (CAR #6#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((NULL
                                     (SPADCALL (QAREF2O |B_wrk| |i| |j| 1 1)
                                               (QREFELT $ 156)))
                                    (LETT |lst_eqn|
                                          (CONS (QAREF2O |B_wrk| |i| |j| 1 1)
                                                |lst_eqn|))))))
                                (LETT #6# (CDR #6#)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                    (SEQ (LETT |i| NIL) (LETT #5# |rex1|) G190
                         (COND
                          ((OR (ATOM #5#) (PROGN (LETT |i| (CAR #5#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| NIL) (LETT #4# |cex1|) G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |j| (CAR #4#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((NULL
                                     (SPADCALL (QAREF2O |B_wrk| |i| |j| 1 1)
                                               (QREFELT $ 156)))
                                    (LETT |lst_eqn|
                                          (CONS (QAREF2O |B_wrk| |i| |j| 1 1)
                                                |lst_eqn|))))))
                                (LETT #4# (CDR #4#)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (SEQ (LETT |i| NIL) (LETT #3# |rex2|) G190
                          (COND
                           ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |j| NIL) (LETT #2# |cex2|) G190
                                 (COND
                                  ((OR (ATOM #2#)
                                       (PROGN (LETT |j| (CAR #2#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((NULL
                                      (SPADCALL (QAREF2O |B_wrk| |i| |j| 1 1)
                                                (QREFELT $ 156)))
                                     (LETT |lst_eqn|
                                           (CONS (QAREF2O |B_wrk| |i| |j| 1 1)
                                                 |lst_eqn|))))))
                                 (LETT #2# (CDR #2#)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))))
               (LETT |k| (+ |k| -1)) (GO G190) G191 (EXIT NIL))
          (LETT |det_P|
                (SPADCALL (|spadConstant| $ 131)
                          (SPADCALL (SPADCALL |lst_trn| 1 (QREFELT $ 151))
                                    (QREFELT $ 157))
                          (QREFELT $ 158)))
          (LETT |det_Q|
                (SPADCALL (|spadConstant| $ 131)
                          (SPADCALL (SPADCALL |lst_trn| 2 (QREFELT $ 151))
                                    (QREFELT $ 157))
                          (QREFELT $ 158)))
          (COND
           ((NULL (SPADCALL |det_P| (QREFELT $ 156)))
            (LETT |lst_eqn| (CONS |det_P| |lst_eqn|))))
          (COND
           ((NULL (SPADCALL |det_Q| (QREFELT $ 156)))
            (LETT |lst_eqn| (CONS |det_Q| |lst_eqn|))))
          (EXIT |lst_eqn|)))) 

(SDEFUN |LINPEN;eliminationGroebner;$10LL;72|
        ((|p| $) (|row_P| |List| (|NonNegativeInteger|))
         (|col_P| |List| (|NonNegativeInteger|))
         (|row_Q| |List| (|NonNegativeInteger|))
         (|col_Q| |List| (|NonNegativeInteger|))
         (|rdst| |List| (|NonNegativeInteger|))
         (|cdst| |List| (|NonNegativeInteger|))
         (|rex1| |List| (|NonNegativeInteger|))
         (|cex1| |List| (|NonNegativeInteger|))
         (|rex2| |List| (|NonNegativeInteger|))
         (|cex2| |List| (|NonNegativeInteger|)) ($ |List| (|Polynomial| R)))
        (SPROG
         ((|lst_gro| (|List| (|Polynomial| R))) (#1=#:G1308 NIL) (|eqn| NIL)
          (#2=#:G1307 NIL) (|bas_gro| (|List| |tDMP|))
          (|eqn_wrk| (|List| |tDMP|)) (#3=#:G1306 NIL) (#4=#:G1305 NIL)
          (|var_wrk| (|List| |tOVL|)) (#5=#:G1296 NIL) (#6=#:G1304 NIL)
          (|var| NIL) (#7=#:G1303 NIL)
          (|tPRD|
           (|DirectProductCategory| (|call| LENGTH |lst_var|)
                                    (|NonNegativeInteger|)))
          (|tOVL|
           (|Join| (|OrderedFinite|) (|ConvertibleTo| (|Symbol|))
                   (|ConvertibleTo| (|InputForm|))
                   (|ConvertibleTo| (|Pattern| (|Float|)))
                   (|ConvertibleTo| (|Pattern| (|Integer|)))
                   (CATEGORY |domain|
                    (SIGNATURE |variable| ((|Union| $ "failed") (|Symbol|))))))
          (|tDMP|
           (|Join|
            (|PolynomialCategory| R
                                  (|DirectProduct| (|#| |lst_var|)
                                                   (|NonNegativeInteger|))
                                  (|OrderedVariableList| |lst_var|))
            (CATEGORY |domain|
             (SIGNATURE |reorder| ($ $ (|List| (|Integer|)))))))
          (|lst_var| (|List| (|Symbol|)))
          (|tmp_var| (|List| (|List| (|Symbol|))))
          (|lst_eqn| (|List| (|Polynomial| R))))
         (SEQ
          (LETT |lst_eqn|
                (SPADCALL |p| |row_P| |col_P| |row_Q| |col_Q| |rdst| |cdst|
                          |rex1| |cex1| |rex2| |cex2| (QREFELT $ 160)))
          (LETT |tmp_var| (SPADCALL (ELT $ 162) |lst_eqn| (QREFELT $ 166)))
          (LETT |lst_var|
                (SPADCALL (SPADCALL |tmp_var| (QREFELT $ 168))
                          (QREFELT $ 169)))
          (LETT |tDMP|
                (|DistributedMultivariatePolynomial| |lst_var| (QREFELT $ 6)))
          (LETT |tOVL| (|OrderedVariableList| |lst_var|))
          (LETT |tPRD|
                (|DirectProduct| (LENGTH |lst_var|) (|NonNegativeInteger|)))
          (LETT |var_wrk|
                (PROGN
                 (LETT #7# NIL)
                 (SEQ (LETT |var| NIL) (LETT #6# |lst_var|) G190
                      (COND
                       ((OR (ATOM #6#) (PROGN (LETT |var| (CAR #6#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #7#
                              (CONS
                               (PROG2
                                   (LETT #5#
                                         (SPADCALL |var|
                                                   (|compiledLookupCheck|
                                                    '|variable|
                                                    (LIST
                                                     (LIST '|Union| '$
                                                           '#8="failed")
                                                     (LIST '|Symbol|))
                                                    |tOVL|)))
                                   (QCDR #5#)
                                 (|check_union2| (QEQCAR #5# 0) |tOVL|
                                                 (|Union| |tOVL| #8#) #5#))
                               #7#))))
                      (LETT #6# (CDR #6#)) (GO G190) G191
                      (EXIT (NREVERSE #7#)))))
          (LETT |eqn_wrk|
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |eqn| NIL) (LETT #3# |lst_eqn|) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |eqn| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (SPADCALL |eqn|
                                         (|compiledLookupCheck| '|pToDmp|
                                                                (LIST
                                                                 (LIST
                                                                  '|DistributedMultivariatePolynomial|
                                                                  |lst_var|
                                                                  (|devaluate|
                                                                   (ELT $ 6)))
                                                                 (LIST
                                                                  '|Polynomial|
                                                                  (|devaluate|
                                                                   (ELT $ 6))))
                                                                (|PolToPol|
                                                                 |lst_var|
                                                                 (ELT $ 6))))
                               #4#))))
                      (LETT #3# (CDR #3#)) (GO G190) G191
                      (EXIT (NREVERSE #4#)))))
          (LETT |bas_gro|
                (SPADCALL |eqn_wrk|
                          (|compiledLookupCheck| '|groebner|
                                                 (LIST
                                                  (LIST '|List|
                                                        (|devaluate| |tDMP|))
                                                  (LIST '|List|
                                                        (|devaluate| |tDMP|)))
                                                 (|GroebnerPackage| (ELT $ 6)
                                                                    |tPRD|
                                                                    |tDMP|))))
          (LETT |lst_gro|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |eqn| NIL) (LETT #1# |bas_gro|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |eqn| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL |eqn|
                                         (|compiledLookupCheck| '|dmpToP|
                                                                (LIST
                                                                 (LIST
                                                                  '|Polynomial|
                                                                  (|devaluate|
                                                                   (ELT $ 6)))
                                                                 (LIST
                                                                  '|DistributedMultivariatePolynomial|
                                                                  |lst_var|
                                                                  (|devaluate|
                                                                   (ELT $ 6))))
                                                                (|PolToPol|
                                                                 |lst_var|
                                                                 (ELT $ 6))))
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (EXIT |lst_gro|)))) 

(SDEFUN |LINPEN;eliminationSolve;PLL;73|
        ((|eqn| |Polynomial| R) (|lst_val| |List| R)
         ($ |List| (|List| (|Equation| (|Polynomial| R)))))
        (SPADCALL |eqn| |lst_val| NIL (QREFELT $ 172))) 

(SDEFUN |LINPEN;solveEquation|
        ((|eqn| |Polynomial| R) (|var| |Symbol|)
         (|lst_add| |List| (|Equation| (|Polynomial| R)))
         ($ |List| (|List| (|Equation| (|Polynomial| R)))))
        (SPROG
         ((|lst_sol| (|List| (|List| (|Equation| (|Polynomial| R)))))
          (|sol_tmp| (|List| (|Equation| (|Polynomial| R)))) (#1=#:G1322 NIL)
          (|sol2| NIL) (|rhs_tst| (|Fraction| (|Polynomial| R)))
          (|lhs_tst| (|Fraction| (|Polynomial| R)))
          (|sol_tst| (|Equation| (|Fraction| (|Polynomial| R))))
          (#2=#:G1321 NIL) (|sol1| NIL)
          (|sol_wrk|
           (|List| (|List| (|Equation| (|Fraction| (|Polynomial| R)))))))
         (SEQ (LETT |lst_sol| NIL)
              (LETT |sol_wrk|
                    (SPADCALL
                     (SPADCALL (SPADCALL |eqn| (QREFELT $ 175))
                               (QREFELT $ 177))
                     (LIST |var|) (QREFELT $ 180)))
              (SEQ (LETT |sol1| NIL) (LETT #2# |sol_wrk|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |sol1| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |sol_tst| (|SPADfirst| |sol1|))
                        (LETT |lhs_tst| (SPADCALL |sol_tst| (QREFELT $ 182)))
                        (LETT |rhs_tst| (SPADCALL |sol_tst| (QREFELT $ 183)))
                        (EXIT
                         (COND
                          ((QEQCAR (SPADCALL |lhs_tst| (QREFELT $ 185)) 0)
                           (COND
                            ((SPADCALL (SPADCALL |rhs_tst| (QREFELT $ 186))
                                       (|spadConstant| $ 131) (QREFELT $ 187))
                             (SEQ
                              (LETT |sol_tmp|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |lhs_tst| (QREFELT $ 188))
                                      (SPADCALL |rhs_tst| (QREFELT $ 188))
                                      (QREFELT $ 189))
                                     (QREFELT $ 190)))
                              (SEQ (LETT |sol2| NIL) (LETT #1# |lst_add|) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN (LETT |sol2| (CAR #1#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |sol_tmp| (CONS |sol2| |sol_tmp|))))
                                   (LETT #1# (CDR #1#)) (GO G190) G191
                                   (EXIT NIL))
                              (EXIT
                               (LETT |lst_sol|
                                     (CONS |sol_tmp| |lst_sol|))))))))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |lst_sol|)))) 

(SDEFUN |LINPEN;equalEquation?|
        ((|sol| |List| (|Equation| (|Polynomial| R)))
         (|lst_sol| |List| (|List| (|Equation| (|Polynomial| R))))
         ($ |Boolean|))
        (SPROG
         ((#1=#:G1334 NIL) (|pos| (|Integer|)) (#2=#:G1336 NIL) (|tmp| NIL)
          (#3=#:G1335 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((ZEROP (LENGTH |sol|))
              (SEQ
               (SEQ (LETT |tmp| NIL) (LETT #3# |lst_sol|) G190
                    (COND
                     ((OR (ATOM #3#) (PROGN (LETT |tmp| (CAR #3#)) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((ZEROP (LENGTH |tmp|))
                        (PROGN (LETT #1# 'T) (GO #4=#:G1333))))))
                    (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
               (EXIT (PROGN (LETT #1# NIL) (GO #4#))))))
            (SEQ (LETT |tmp| NIL) (LETT #2# |lst_sol|) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |tmp| (CAR #2#)) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |pos|
                        (SPADCALL (|SPADfirst| |sol|) |tmp| (QREFELT $ 192)))
                  (EXIT
                   (COND
                    ((NULL (ZEROP |pos|))
                     (COND
                      ((EQL (LENGTH (SPADCALL |sol| |tmp| (QREFELT $ 193)))
                            (MAX (LENGTH |sol|) (LENGTH |tmp|)))
                       (PROGN (LETT #1# 'T) (GO #4#))))))))
                 (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
            (EXIT NIL)))
          #4# (EXIT #1#)))) 

(SDEFUN |LINPEN;eliminationSolve;PLLL;76|
        ((|eqn| |Polynomial| R) (|lst_val| |List| R)
         (|sub| |List| (|Equation| (|Polynomial| R)))
         ($ |List| (|List| (|Equation| (|Polynomial| R)))))
        (SPROG
         ((|lst_sol| (|List| (|List| (|Equation| (|Polynomial| R)))))
          (#1=#:G1374 NIL) (|sol| NIL)
          (|sol_wrk| (|List| (|List| (|Equation| (|Polynomial| R)))))
          (|eqn_tmp| (|Polynomial| R))
          (|lst_tmp| (|List| (|Equation| (|Polynomial| R))))
          (|idx_val| (|NonNegativeInteger|)) (#2=#:G1355 NIL) (#3=#:G1353 NIL)
          (#4=#:G1373 NIL) (|j| NIL) (#5=#:G1372 NIL) (|i| NIL)
          (|vars| (|List| (|Symbol|))) (#6=#:G1371 NIL) (|var| NIL)
          (#7=#:G1368 NIL) (#8=#:G1370 NIL) (|lst_var| (|List| (|Symbol|)))
          (|var_sub| (|List| (|Symbol|))) (#9=#:G1369 NIL) (|ele| NIL)
          (|k_val| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |lst_sol| NIL) (LETT |lst_tmp| NIL)
                (LETT |lst_var| (SPADCALL |eqn| (QREFELT $ 162)))
                (LETT |k_val| (LENGTH |lst_val|))
                (COND
                 ((ZEROP (LENGTH |lst_var|))
                  (PROGN (LETT #7# |lst_sol|) (GO #10=#:G1367))))
                (EXIT
                 (COND
                  ((ZEROP |k_val|)
                   (|error|
                    "LINPEN: eliminationSolve(eqn, lst_val) - missing values."))
                  ('T
                   (SEQ
                    (COND
                     ((EQL (LENGTH |lst_var|) 1)
                      (COND
                       ((ZEROP (LENGTH |sub|))
                        (SEQ
                         (LETT |lst_sol|
                               (|LINPEN;solveEquation| |eqn|
                                (|SPADfirst| |lst_var|) NIL $))
                         (EXIT (PROGN (LETT #7# |lst_sol|) (GO #10#))))))))
                    (LETT |var_sub| NIL)
                    (SEQ (LETT |ele| NIL) (LETT #9# |sub|) G190
                         (COND
                          ((OR (ATOM #9#) (PROGN (LETT |ele| (CAR #9#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |var_sub|
                                 (SPADCALL
                                  (SPADCALL |var_sub|
                                            (SPADCALL
                                             (SPADCALL |ele| (QREFELT $ 194))
                                             (QREFELT $ 162))
                                            (QREFELT $ 195))
                                  (QREFELT $ 169)))))
                         (LETT #9# (CDR #9#)) (GO G190) G191 (EXIT NIL))
                    (LETT |lst_var|
                          (SPADCALL |lst_var| |var_sub| (QREFELT $ 196)))
                    (COND
                     ((ZEROP (LENGTH |lst_var|))
                      (SEQ (LETT |lst_sol| (CONS |sub| |lst_sol|))
                           (EXIT (PROGN (LETT #7# |lst_sol|) (GO #10#))))))
                    (COND
                     ((EQL (LENGTH |lst_var|) 1)
                      (SEQ
                       (LETT |eqn_tmp| (SPADCALL |eqn| |sub| (QREFELT $ 143)))
                       (COND
                        ((SPADCALL |eqn_tmp| (QREFELT $ 156))
                         (SEQ (LETT |lst_sol| (CONS |sub| |lst_sol|))
                              (EXIT (PROGN (LETT #7# |lst_sol|) (GO #10#))))))
                       (LETT |sol_wrk|
                             (|LINPEN;solveEquation| |eqn_tmp|
                              (|SPADfirst| |lst_var|) |sub| $))
                       (SEQ (LETT |sol| NIL) (LETT #8# |sol_wrk|) G190
                            (COND
                             ((OR (ATOM #8#)
                                  (PROGN (LETT |sol| (CAR #8#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((> (LENGTH |sol|) 0)
                                (LETT |lst_sol| (CONS |sol| |lst_sol|))))))
                            (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
                       (EXIT (PROGN (LETT #7# |lst_sol|) (GO #10#))))))
                    (LETT |eqn_tmp| (SPADCALL |eqn| |sub| (QREFELT $ 143)))
                    (COND
                     ((SPADCALL |eqn_tmp| (QREFELT $ 156))
                      (SEQ (LETT |lst_sol| (CONS |sub| |lst_sol|))
                           (EXIT (PROGN (LETT #7# |lst_sol|) (GO #10#))))))
                    (SEQ (LETT |var| NIL) (LETT #6# |lst_var|) G190
                         (COND
                          ((OR (ATOM #6#) (PROGN (LETT |var| (CAR #6#)) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |vars|
                                (SPADCALL |var| |lst_var| (QREFELT $ 197)))
                          (EXIT
                           (SEQ (LETT |i| 1)
                                (LETT #5# (EXPT |k_val| (LENGTH |vars|))) G190
                                (COND ((|greater_SI| |i| #5#) (GO G191)))
                                (SEQ
                                 (LETT |lst_tmp|
                                       (SPADCALL |sub| (QREFELT $ 198)))
                                 (SEQ (LETT |j| 1) (LETT #4# (LENGTH |vars|))
                                      G190
                                      (COND ((|greater_SI| |j| #4#) (GO G191)))
                                      (SEQ
                                       (LETT |idx_val|
                                             (QUOTIENT2
                                              (PROG1 (LETT #3# (- |i| 1))
                                                (|check_subtype2| (>= #3# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #3#))
                                              (EXPT |k_val|
                                                    (PROG1 (LETT #2# (- |j| 1))
                                                      (|check_subtype2|
                                                       (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #2#)))))
                                       (LETT |idx_val| (REM |idx_val| |k_val|))
                                       (EXIT
                                        (LETT |lst_tmp|
                                              (CONS
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |vars| |j|
                                                           (QREFELT $ 199))
                                                 (QREFELT $ 136))
                                                (SPADCALL
                                                 (SPADCALL |lst_val|
                                                           (+ |idx_val| 1)
                                                           (QREFELT $ 113))
                                                 (QREFELT $ 149))
                                                (QREFELT $ 189))
                                               |lst_tmp|))))
                                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                      (EXIT NIL))
                                 (LETT |eqn_tmp|
                                       (SPADCALL |eqn| |lst_tmp|
                                                 (QREFELT $ 143)))
                                 (EXIT
                                  (COND
                                   ((SPADCALL |eqn_tmp| (QREFELT $ 156))
                                    (LETT |lst_sol|
                                          (CONS |lst_tmp| |lst_sol|)))
                                   ('T
                                    (SEQ
                                     (LETT |eqn_tmp|
                                           (SPADCALL |eqn| |lst_tmp|
                                                     (QREFELT $ 143)))
                                     (LETT |sol_wrk|
                                           (|LINPEN;solveEquation| |eqn_tmp|
                                            |var| |lst_tmp| $))
                                     (EXIT
                                      (SEQ (LETT |sol| NIL)
                                           (LETT #1# |sol_wrk|) G190
                                           (COND
                                            ((OR (ATOM #1#)
                                                 (PROGN
                                                  (LETT |sol| (CAR #1#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (COND
                                              ((NULL
                                                (|LINPEN;equalEquation?| |sol|
                                                 |lst_sol| $))
                                               (LETT |lst_sol|
                                                     (CONS |sol|
                                                           |lst_sol|))))))
                                           (LETT #1# (CDR #1#)) (GO G190) G191
                                           (EXIT NIL))))))))
                                (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |lst_sol|)))))))
          #10# (EXIT #7#)))) 

(SDEFUN |LINPEN;eliminationSolve;PL2L;77|
        ((|eqn| |Polynomial| R) (|lst_val| |List| R)
         (|lst_sub| |List| (|List| (|Equation| (|Polynomial| R))))
         ($ |List| (|List| (|Equation| (|Polynomial| R)))))
        (SPROG
         ((|lst_sol| (|List| (|List| (|Equation| (|Polynomial| R)))))
          (#1=#:G1388 NIL) (|sol| NIL)
          (|lst_wrk| (|List| (|List| (|Equation| (|Polynomial| R)))))
          (#2=#:G1387 NIL) (|sub| NIL) (#3=#:G1385 NIL) (#4=#:G1386 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |lst_sol| NIL)
                (COND
                 ((ZEROP (LENGTH |lst_sub|))
                  (SEQ
                   (LETT |lst_wrk|
                         (SPADCALL |eqn| |lst_val| NIL (QREFELT $ 200)))
                   (SEQ (LETT |sol| NIL) (LETT #4# |lst_wrk|) G190
                        (COND
                         ((OR (ATOM #4#) (PROGN (LETT |sol| (CAR #4#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((NULL (|LINPEN;equalEquation?| |sol| |lst_sol| $))
                            (LETT |lst_sol| (CONS |sol| |lst_sol|))))))
                        (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                   (EXIT (PROGN (LETT #3# |lst_sol|) (GO #5=#:G1384))))))
                (SEQ (LETT |sub| NIL) (LETT #2# |lst_sub|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |sub| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |lst_wrk|
                            (SPADCALL |eqn| |lst_val| |sub| (QREFELT $ 200)))
                      (EXIT
                       (SEQ (LETT |sol| NIL) (LETT #1# |lst_wrk|) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |sol| (CAR #1#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((NULL
                                 (|LINPEN;equalEquation?| |sol| |lst_sol| $))
                                (LETT |lst_sol| (CONS |sol| |lst_sol|))))))
                            (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT |lst_sol|)))
          #5# (EXIT #3#)))) 

(SDEFUN |LINPEN;eliminationSolve;LL2L;78|
        ((|lst_eqn| |List| (|Polynomial| R)) (|lst_val| |List| R)
         (|lst_sub| |List| (|List| (|Equation| (|Polynomial| R))))
         ($ |List| (|List| (|Equation| (|Polynomial| R)))))
        (SPROG
         ((|lst_sol| (|List| (|List| (|Equation| (|Polynomial| R)))))
          (#1=#:G1408 NIL) (|flg_sol| (|Boolean|)) (|eqn_tmp| (|Polynomial| R))
          (#2=#:G1415 NIL) (|eqn| NIL) (#3=#:G1414 NIL) (|sol| NIL)
          (|lst_wrk| (|List| (|List| (|Equation| (|Polynomial| R)))))
          (#4=#:G1413 NIL) (|sub| NIL) (#5=#:G1410 NIL) (#6=#:G1409 NIL)
          (#7=#:G1412 NIL) (#8=#:G1411 NIL))
         (SEQ
          (EXIT
           (COND
            ((ZEROP (LENGTH |lst_eqn|))
             (|error|
              "LINPEN: eliminationSolve(lst_eqn, lst_val, lst_sub) - missing equation(s)."))
            ('T
             (SEQ (LETT |lst_sol| NIL)
                  (COND
                   ((ZEROP (LENGTH |lst_sub|))
                    (SEQ
                     (LETT |lst_wrk|
                           (SPADCALL (|SPADfirst| |lst_eqn|) |lst_val| NIL
                                     (QREFELT $ 200)))
                     (SEQ (LETT |sol| NIL) (LETT #8# |lst_wrk|) G190
                          (COND
                           ((OR (ATOM #8#) (PROGN (LETT |sol| (CAR #8#)) NIL))
                            (GO G191)))
                          (SEQ (LETT |flg_sol| 'T)
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |eqn| NIL)
                                      (LETT #7# (CDR |lst_eqn|)) G190
                                      (COND
                                       ((OR (ATOM #7#)
                                            (PROGN (LETT |eqn| (CAR #7#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (LETT |eqn_tmp|
                                             (SPADCALL |eqn| |sol|
                                                       (QREFELT $ 143)))
                                       (EXIT
                                        (COND
                                         ((NULL
                                           (SPADCALL |eqn_tmp|
                                                     (QREFELT $ 156)))
                                          (SEQ (LETT |flg_sol| NIL)
                                               (EXIT
                                                (PROGN
                                                 (LETT #6# |$NoValue|)
                                                 (GO #9=#:G1391))))))))
                                      (LETT #7# (CDR #7#)) (GO G190) G191
                                      (EXIT NIL)))
                                #9# (EXIT #6#))
                               (EXIT
                                (COND
                                 (|flg_sol|
                                  (COND
                                   ((NULL
                                     (|LINPEN;equalEquation?| |sol| |lst_sol|
                                      $))
                                    (LETT |lst_sol|
                                          (CONS |sol| |lst_sol|))))))))
                          (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
                     (EXIT (PROGN (LETT #5# |lst_sol|) (GO #10=#:G1407))))))
                  (SEQ (LETT |sub| NIL) (LETT #4# |lst_sub|) G190
                       (COND
                        ((OR (ATOM #4#) (PROGN (LETT |sub| (CAR #4#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |lst_wrk|
                              (SPADCALL (|SPADfirst| |lst_eqn|) |lst_val| |sub|
                                        (QREFELT $ 200)))
                        (EXIT
                         (SEQ (LETT |sol| NIL) (LETT #3# |lst_wrk|) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |sol| (CAR #3#)) NIL))
                                (GO G191)))
                              (SEQ (LETT |flg_sol| 'T)
                                   (SEQ
                                    (EXIT
                                     (SEQ (LETT |eqn| NIL)
                                          (LETT #2# (CDR |lst_eqn|)) G190
                                          (COND
                                           ((OR (ATOM #2#)
                                                (PROGN
                                                 (LETT |eqn| (CAR #2#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (LETT |eqn_tmp|
                                                 (SPADCALL |eqn| |sol|
                                                           (QREFELT $ 143)))
                                           (EXIT
                                            (COND
                                             ((NULL
                                               (SPADCALL |eqn_tmp|
                                                         (QREFELT $ 156)))
                                              (SEQ (LETT |flg_sol| NIL)
                                                   (EXIT
                                                    (PROGN
                                                     (LETT #1# |$NoValue|)
                                                     (GO #11=#:G1399))))))))
                                          (LETT #2# (CDR #2#)) (GO G190) G191
                                          (EXIT NIL)))
                                    #11# (EXIT #1#))
                                   (EXIT
                                    (COND
                                     (|flg_sol|
                                      (COND
                                       ((NULL
                                         (|LINPEN;equalEquation?| |sol|
                                          |lst_sol| $))
                                        (LETT |lst_sol|
                                              (CONS |sol| |lst_sol|))))))))
                              (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))))
                       (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                  (EXIT |lst_sol|)))))
          #10# (EXIT #5#)))) 

(SDEFUN |LINPEN;eliminationSolve;LL;79|
        ((|lst_eqn| |List| (|Polynomial| R))
         ($ |List| (|List| (|Equation| (|Polynomial| R)))))
        (SPROG
         ((|lst_sol| (|List| (|List| (|Equation| (|Polynomial| R)))))
          (#1=#:G1421 NIL)
          (|sol_wrk| (|List| (|List| (|Equation| (|Polynomial| R)))))
          (|lst_wrk| (|List| (|Polynomial| R))) (|k| NIL)
          (|lst_val| (|List| R)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lst_val| (LIST (|spadConstant| $ 8) (|spadConstant| $ 20)))
            (LETT |lst_wrk| NIL) (LETT |lst_sol| NIL)
            (SEQ (LETT |k| (LENGTH |lst_eqn|)) G190
                 (COND ((< |k| 1) (GO G191)))
                 (SEQ
                  (LETT |lst_wrk|
                        (CONS (SPADCALL |lst_eqn| |k| (QREFELT $ 203))
                              |lst_wrk|))
                  (LETT |sol_wrk|
                        (SPADCALL |lst_wrk| |lst_val| |lst_sol|
                                  (QREFELT $ 201)))
                  (COND
                   ((ZEROP (LENGTH |sol_wrk|))
                    (PROGN (LETT #1# NIL) (GO #2=#:G1420))))
                  (EXIT (LETT |lst_sol| (SPADCALL |sol_wrk| (QREFELT $ 204)))))
                 (LETT |k| (+ |k| -1)) (GO G190) G191 (EXIT NIL))
            (EXIT |lst_sol|)))
          #2# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |LinearMultivariateMatrixPencil;|)) 

(DEFUN |LinearMultivariateMatrixPencil| (#1=#:G1422)
  (SPROG NIL
         (PROG (#2=#:G1423)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|LinearMultivariateMatrixPencil|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|LinearMultivariateMatrixPencil;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|LinearMultivariateMatrixPencil|)))))))))) 

(DEFUN |LinearMultivariateMatrixPencil;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|LinearMultivariateMatrixPencil| DV$1))
          (LETT $ (GETREFV 206))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|Field|))))))
          (|haddProp| |$ConstructorCache| '|LinearMultivariateMatrixPencil|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| |nr| (|NonNegativeInteger|))
                              (|:| |nc| (|NonNegativeInteger|))
                              (|:| A (|List| (|Matrix| |#1|)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 128
                       (CONS
                        (|dispatchFunction| |LINPEN;blockElimination;$6LL;65|)
                        $))
             (QSETREFV $ 138
                       (CONS
                        (|dispatchFunction|
                         |LINPEN;eliminationTransformations;$2LS2LSL;66|)
                        $))
             (QSETREFV $ 139
                       (CONS
                        (|dispatchFunction|
                         |LINPEN;eliminationTransformations;$4LL;67|)
                        $))
             (QSETREFV $ 148
                       (CONS
                        (|dispatchFunction|
                         |LINPEN;eliminationTransformations;$4LLL;68|)
                        $))
             (QSETREFV $ 154
                       (CONS
                        (|dispatchFunction|
                         |LINPEN;eliminationEquations;$6LL;69|)
                        $))
             (QSETREFV $ 155
                       (CONS
                        (|dispatchFunction|
                         |LINPEN;eliminationEquations;$10LL;70|)
                        $))
             (QSETREFV $ 160
                       (CONS
                        (|dispatchFunction|
                         |LINPEN;eliminationEquations;$10LL;71|)
                        $))
             (QSETREFV $ 170
                       (CONS
                        (|dispatchFunction|
                         |LINPEN;eliminationGroebner;$10LL;72|)
                        $))
             (QSETREFV $ 173
                       (CONS
                        (|dispatchFunction| |LINPEN;eliminationSolve;PLL;73|)
                        $))
             (QSETREFV $ 200
                       (CONS
                        (|dispatchFunction| |LINPEN;eliminationSolve;PLLL;76|)
                        $))
             (QSETREFV $ 172
                       (CONS
                        (|dispatchFunction| |LINPEN;eliminationSolve;PL2L;77|)
                        $))
             (QSETREFV $ 201
                       (CONS
                        (|dispatchFunction| |LINPEN;eliminationSolve;LL2L;78|)
                        $))
             (QSETREFV $ 205
                       (CONS
                        (|dispatchFunction| |LINPEN;eliminationSolve;LL;79|)
                        $)))))
          $))) 

(MAKEPROP '|LinearMultivariateMatrixPencil| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (0 . |Zero|)
              (|NonNegativeInteger|) (|Matrix| 6) (|List| 10) (4 . |new|)
              (|Integer|) (10 . |setelt!|) |LINPEN;qnew;3Nni$;1| (17 . |copy|)
              (22 . |elt|) (28 . |copy|) |LINPEN;copy;2$;2| (33 . |One|)
              |LINPEN;append;$Nni$;3| (37 . |append|) |LINPEN;append!;$Nni$;4|
              (|OutputForm|) (43 . |coerce|) |LINPEN;coerce;$Of;5|
              |LINPEN;nrows;$Nni;6| |LINPEN;ncols;$Nni;7| |LINPEN;nelem;$Nni;8|
              (|Boolean|) (48 . =) |LINPEN;=;2$B;9| (|List| 9) (54 . |#|)
              (59 . ~=) (|List| 30) (65 . |new|) (71 . |elt|) (77 . |setelt!|)
              (84 . |elt|) (90 . |zero?|) |LINPEN;equal?;$L$LB;10| (95 . =)
              |LINPEN;qequal?;$L$LNniB;11| (101 . |zero?|)
              |LINPEN;qzero?;$2NniB;12| |LINPEN;qzero?;$4NniB;13|
              |LINPEN;qzero?;$5NniB;14| |LINPEN;qsemizero?;$5NniB;15|
              (106 . ~=) |LINPEN;zero?;$2NniB;16| |LINPEN;qdiagonal?;$3NniB;18|
              |LINPEN;diagonal?;$NniB;17| (|List| 6)
              |LINPEN;qdiagonal;$3NniL;20| |LINPEN;diagonal;$NniL;19|
              (112 . |new|) (118 . |setelt!|)
              |LINPEN;quppertriangular?;$3NniB;22|
              |LINPEN;uppertriangular?;$NniB;21| |LINPEN;qnilpotent?;$3NniB;23|
              (|List| 33) (125 . |new|) (131 . |setelt!|)
              |LINPEN;qcolumnIndices;$2NniL;24|
              |LINPEN;qcolumnIndices;$3NniL;25|
              |LINPEN;qcolumnIndices;$NniL;26| |LINPEN;qrowIndices;$3NniL;27|
              |LINPEN;qrowIndices;$2NniL;28| |LINPEN;qrowIndices;$NniL;29|
              |LINPEN;qelt;$3NniR;30| |LINPEN;elt;$3NniR;31|
              |LINPEN;elt;$2NniL;32| |LINPEN;qelt;$2NniL;33|
              |LINPEN;matrix;$NniM;34| (138 . |subMatrix|)
              |LINPEN;subMatrix;$5NniM;35| |LINPEN;subPencil;$4Nni$;36|
              (147 . |min|) (|Mapping| 9 9 9) (153 . |reduce|) (159 . |max|)
              |LINPEN;subPencil;$2L$;37| (165 . |position|)
              |LINPEN;removeRowsColumns;$2L$;38| (171 . |sort|) (176 . |new|)
              (182 . |setelt!|) |LINPEN;insertRowsColumns;$2L$;39|
              |LINPEN;qswapRows!;$2Nni$;40| |LINPEN;swapRows!;$2Nni$;41|
              (189 . *) (195 . +) |LINPEN;qaddRows!;$2NniR$;42|
              |LINPEN;addRows!;$2NniR$;43| |LINPEN;qmultiplyRow!;$NniR$;44|
              |LINPEN;multiplyRow!;$NniR$;45| |LINPEN;qswapColumns!;$2Nni$;46|
              |LINPEN;swapColumns!;$2Nni$;47| |LINPEN;qaddColumns!;$2NniR$;48|
              |LINPEN;addColumns!;$2NniR$;49|
              |LINPEN;qmultiplyColumn!;$NniR$;50|
              |LINPEN;multiplyColumn!;$NniR$;51|
              |LINPEN;qscaleBlock!;$5NniR$;52|
              |LINPEN;transformColumns!;$M$;56| |LINPEN;*;$M$;53|
              |LINPEN;transformRows!;$M$;55| |LINPEN;*;M2$;54| (201 . *)
              |LINPEN;leftIdentity;$M;57| |LINPEN;rightIdentity;$M;58|
              |LINPEN;qsetelt!;$3Nni2R;59| (207 . |elt|)
              |LINPEN;qsetelt!;$2Nni2L;60| |LINPEN;setelt!;$3Nni2R;61|
              |LINPEN;setelt!;$2Nni2L;62| (213 . |setsubMatrix!|)
              |LINPEN;setsubMatrix!;$3Nni2M;63|
              |LINPEN;setsubPencil!;$2Nni2$;64| (221 . -) (|Vector| 6)
              (226 . |vector|) (|Union| 121 '"failed")
              (|Record| (|:| |particular| 123) (|:| |basis| (|List| 121)))
              (|LinearSystemMatrixPackage1| 6) (231 . |solve|) (237 . |parts|)
              (242 . |blockElimination|) (|Polynomial| 6) (253 . |Zero|)
              (257 . |One|) (261 . |coerce|) (|List| 24) (|Symbol|)
              (266 . |elt|) (272 . |coerce|) (|List| 150)
              (277 . |eliminationTransformations|)
              (288 . |eliminationTransformations|) (|Equation| 129)
              (297 . |One|) (|List| (|Equation| $)) (301 . |eval|)
              (307 . |totalDegree|) (312 . |retract|) (317 . |rank|)
              (|List| 140) (322 . |eliminationTransformations|)
              (332 . |coerce|) (|Matrix| 129) (337 . |elt|) (343 . *)
              (349 . |zero|) (355 . |eliminationEquations|)
              (366 . |eliminationEquations|) (381 . |zero?|)
              (386 . |determinant|) (391 . -) (|List| 129)
              (397 . |eliminationEquations|) (|List| 134) (412 . |variables|)
              (|List| 161) (|Mapping| 161 129) (|ListFunctions2| 129 161)
              (417 . |map|) (|List| $) (423 . |concat|)
              (428 . |removeDuplicates|) (433 . |eliminationGroebner|)
              (|List| 147) (448 . |eliminationSolve|)
              (455 . |eliminationSolve|) (|Fraction| 129) (461 . |coerce|)
              (|List| 174) (466 . |list|) (|List| (|List| 181))
              (|SystemSolvePackage| 6) (471 . |solve|) (|Equation| 174)
              (477 . |lhs|) (482 . |rhs|) (|Union| 134 '"failed")
              (487 . |retractIfCan|) (492 . |denom|) (497 . =) (503 . |numer|)
              (508 . |equation|) (514 . |list|) (519 . |first|)
              (524 . |position|) (530 . |setUnion|) (536 . |lhs|)
              (541 . |concat|) (547 . |setDifference|) (553 . |remove|)
              (559 . |copy|) (564 . |elt|) (570 . |eliminationSolve|)
              (577 . |eliminationSolve|) (584 . |Zero|) (588 . |elt|)
              (594 . |copy|) (599 . |eliminationSolve|))
           '#(|zero?| 604 |uppertriangular?| 611 |transformRows!| 617
              |transformColumns!| 623 |swapRows!| 629 |swapColumns!| 636
              |subPencil| 643 |subMatrix| 659 |setsubPencil!| 669
              |setsubMatrix!| 677 |setelt!| 686 |rightIdentity| 703
              |removeRowsColumns| 708 |qzero?| 715 |quppertriangular?| 741
              |qswapRows!| 749 |qswapColumns!| 756 |qsetelt!| 763 |qsemizero?|
              780 |qscaleBlock!| 790 |qrowIndices| 801 |qnilpotent?| 822 |qnew|
              830 |qmultiplyRow!| 837 |qmultiplyColumn!| 844 |qequal?| 851
              |qelt| 860 |qdiagonal?| 875 |qdiagonal| 883 |qcolumnIndices| 891
              |qaddRows!| 912 |qaddColumns!| 920 |nrows| 928 |nelem| 933
              |ncols| 938 |multiplyRow!| 943 |multiplyColumn!| 950 |matrix| 957
              |leftIdentity| 963 |insertRowsColumns| 968 |equal?| 975 |elt| 983
              |eliminationTransformations| 998 |eliminationSolve| 1028
              |eliminationGroebner| 1060 |eliminationEquations| 1075
              |diagonal?| 1116 |diagonal| 1122 |copy| 1128 |coerce| 1133
              |blockElimination| 1138 |append!| 1149 |append| 1155 |addRows!|
              1161 |addColumns!| 1169 = 1177 * 1183)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|qnew|
                                 ($$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|copy| ($$ $$)) T)
                              '((|append| ($$ $$ (|NonNegativeInteger|))) T)
                              '((|append!| ($$ $$ (|NonNegativeInteger|))) T)
                              '((|coerce| ((|OutputForm|) $$)) T)
                              '((= ((|Boolean|) $$ $$)) T)
                              '((|equal?|
                                 ((|Boolean|) $$
                                  (|List| (|NonNegativeInteger|)) $$
                                  (|List| (|NonNegativeInteger|))))
                                T)
                              '((|qequal?|
                                 ((|Boolean|) $$
                                  (|List| (|NonNegativeInteger|)) $$
                                  (|List| (|NonNegativeInteger|))
                                  (|NonNegativeInteger|)))
                                T)
                              '((|nrows| ((|NonNegativeInteger|) $$)) T)
                              '((|ncols| ((|NonNegativeInteger|) $$)) T)
                              '((|nelem| ((|NonNegativeInteger|) $$)) T)
                              '((|qzero?|
                                 ((|Boolean|) $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|qzero?|
                                 ((|Boolean|) $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|qzero?|
                                 ((|Boolean|) $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|qsemizero?|
                                 ((|Boolean|) $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|zero?|
                                 ((|Boolean|) $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|diagonal?|
                                 ((|Boolean|) $$ (|NonNegativeInteger|)))
                                T)
                              '((|qdiagonal?|
                                 ((|Boolean|) $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|diagonal|
                                 ((|List| |#1|) $$ (|NonNegativeInteger|)))
                                T)
                              '((|qdiagonal|
                                 ((|List| |#1|) $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|uppertriangular?|
                                 ((|Boolean|) $$ (|NonNegativeInteger|)))
                                T)
                              '((|quppertriangular?|
                                 ((|Boolean|) $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|qnilpotent?|
                                 ((|Boolean|) $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|qcolumnIndices|
                                 ((|List| (|List| (|NonNegativeInteger|))) $$
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|qcolumnIndices|
                                 ((|List| (|NonNegativeInteger|)) $$
                                  (|NonNegativeInteger|) (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|qcolumnIndices|
                                 ((|List| (|List| (|NonNegativeInteger|))) $$
                                  (|NonNegativeInteger|)))
                                T)
                              '((|qrowIndices|
                                 ((|List| (|NonNegativeInteger|)) $$
                                  (|NonNegativeInteger|) (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|qrowIndices|
                                 ((|List| (|List| (|NonNegativeInteger|))) $$
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|qrowIndices|
                                 ((|List| (|List| (|NonNegativeInteger|))) $$
                                  (|NonNegativeInteger|)))
                                T)
                              '((|qelt|
                                 (|#1| $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|elt|
                                 (|#1| $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|qelt|
                                 ((|List| |#1|) $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|elt|
                                 ((|List| |#1|) $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|matrix|
                                 ((|Matrix| |#1|) $$ (|NonNegativeInteger|)))
                                T)
                              '((|subMatrix|
                                 ((|Matrix| |#1|) $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|subPencil|
                                 ($$ $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|subPencil|
                                 ($$ $$ (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))))
                                T)
                              '((|removeRowsColumns|
                                 ($$ $$ (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))))
                                T)
                              '((|insertRowsColumns|
                                 ($$ $$ (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))))
                                T)
                              '((|swapRows!|
                                 ($$ $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|qswapRows!|
                                 ($$ $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|addRows!|
                                 ($$ $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) |#1|))
                                T)
                              '((|qaddRows!|
                                 ($$ $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) |#1|))
                                T)
                              '((|qmultiplyRow!|
                                 ($$ $$ (|NonNegativeInteger|) |#1|))
                                T)
                              '((|multiplyRow!|
                                 ($$ $$ (|NonNegativeInteger|) |#1|))
                                T)
                              '((|qswapColumns!|
                                 ($$ $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|swapColumns!|
                                 ($$ $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|addColumns!|
                                 ($$ $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) |#1|))
                                T)
                              '((|qaddColumns!|
                                 ($$ $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) |#1|))
                                T)
                              '((|multiplyColumn!|
                                 ($$ $$ (|NonNegativeInteger|) |#1|))
                                T)
                              '((|qmultiplyColumn!|
                                 ($$ $$ (|NonNegativeInteger|) |#1|))
                                T)
                              '((|qscaleBlock!|
                                 ($$ $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) (|NonNegativeInteger|)
                                  |#1|))
                                T)
                              '((* ($$ $$ (|Matrix| |#1|))) T)
                              '((* ($$ (|Matrix| |#1|) $$)) T)
                              '((|transformRows!| ($$ $$ (|Matrix| |#1|))) T)
                              '((|transformColumns!| ($$ $$ (|Matrix| |#1|)))
                                T)
                              '((|leftIdentity| ((|Matrix| |#1|) $$)) T)
                              '((|rightIdentity| ((|Matrix| |#1|) $$)) T)
                              '((|qsetelt!|
                                 (|#1| $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) (|NonNegativeInteger|)
                                  |#1|))
                                T)
                              '((|qsetelt!|
                                 ((|List| |#1|) $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) (|List| |#1|)))
                                T)
                              '((|setelt!|
                                 (|#1| $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) (|NonNegativeInteger|)
                                  |#1|))
                                T)
                              '((|setelt!|
                                 ((|List| |#1|) $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) (|List| |#1|)))
                                T)
                              '((|setsubMatrix!|
                                 ((|Matrix| |#1|) $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) (|NonNegativeInteger|)
                                  (|Matrix| |#1|)))
                                T)
                              '((|setsubPencil!|
                                 ($$ $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) $$))
                                T)
                              '((|blockElimination|
                                 ((|List| (|Matrix| |#1|)) $$
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))))
                                (|has| 6 (|Field|)))
                              '((|eliminationTransformations|
                                 ((|List| (|Matrix| (|Polynomial| |#1|))) $$
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|)) (|Symbol|)
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|)) (|Symbol|)))
                                (|has| 6 (|Field|)))
                              '((|eliminationTransformations|
                                 ((|List| (|Matrix| (|Polynomial| |#1|))) $$
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))))
                                (|has| 6 (|Field|)))
                              '((|eliminationTransformations|
                                 ((|List| (|Matrix| |#1|)) $$
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|Equation| (|Polynomial| |#1|)))))
                                (|has| 6 (|Field|)))
                              '((|eliminationEquations|
                                 ((|List| (|Matrix| (|Polynomial| |#1|))) $$
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))))
                                (|has| 6 (|Field|)))
                              '((|eliminationEquations|
                                 ((|List| (|Matrix| (|Polynomial| |#1|))) $$
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))))
                                (|has| 6 (|Field|)))
                              '((|eliminationEquations|
                                 ((|List| (|Polynomial| |#1|)) $$
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))))
                                (|has| 6 (|Field|)))
                              '((|eliminationGroebner|
                                 ((|List| (|Polynomial| |#1|)) $$
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))))
                                (|has| 6 (|Field|)))
                              '((|eliminationSolve|
                                 ((|List|
                                   (|List| (|Equation| (|Polynomial| |#1|))))
                                  (|Polynomial| |#1|) (|List| |#1|)))
                                (|has| 6 (|Field|)))
                              '((|eliminationSolve|
                                 ((|List|
                                   (|List| (|Equation| (|Polynomial| |#1|))))
                                  (|Polynomial| |#1|) (|List| |#1|)
                                  (|List| (|Equation| (|Polynomial| |#1|)))))
                                (|has| 6 (|Field|)))
                              '((|eliminationSolve|
                                 ((|List|
                                   (|List| (|Equation| (|Polynomial| |#1|))))
                                  (|Polynomial| |#1|) (|List| |#1|)
                                  (|List|
                                   (|List| (|Equation| (|Polynomial| |#1|))))))
                                (|has| 6 (|Field|)))
                              '((|eliminationSolve|
                                 ((|List|
                                   (|List| (|Equation| (|Polynomial| |#1|))))
                                  (|List| (|Polynomial| |#1|)) (|List| |#1|)
                                  (|List|
                                   (|List| (|Equation| (|Polynomial| |#1|))))))
                                (|has| 6 (|Field|)))
                              '((|eliminationSolve|
                                 ((|List|
                                   (|List| (|Equation| (|Polynomial| |#1|))))
                                  (|List| (|Polynomial| |#1|))))
                                (|has| 6 (|Field|))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 205
                                            '(0 6 0 8 2 11 0 9 10 12 3 11 10 0
                                              13 10 14 1 11 0 0 16 2 11 10 0 13
                                              17 1 10 0 0 18 0 6 0 20 2 11 0 0
                                              0 22 1 11 24 0 25 2 10 30 0 0 31
                                              1 33 9 0 34 2 9 30 0 0 35 2 36 0
                                              9 30 37 2 33 9 0 13 38 3 36 30 0
                                              13 30 39 2 36 30 0 13 40 1 10 30
                                              0 41 2 6 30 0 0 43 1 6 30 0 45 2
                                              6 30 0 0 50 2 54 0 9 6 57 3 54 6
                                              0 13 6 58 2 62 0 9 33 63 3 62 33
                                              0 13 33 64 5 10 0 0 13 13 13 13
                                              76 2 9 0 0 0 79 2 33 9 80 0 81 2
                                              9 0 0 0 82 2 33 13 9 0 84 1 33 0
                                              0 86 2 33 0 9 9 87 3 33 9 0 13 9
                                              88 2 6 0 0 0 92 2 6 0 0 0 93 2 10
                                              0 0 0 109 2 54 6 0 13 113 4 10 0
                                              0 13 13 0 117 1 6 0 0 120 1 121 0
                                              54 122 2 125 124 10 121 126 1 121
                                              54 0 127 7 0 11 0 33 33 33 33 33
                                              33 128 0 129 0 130 0 129 0 131 1
                                              9 24 0 132 2 134 0 0 133 135 1
                                              129 0 134 136 7 0 137 0 33 33 134
                                              33 33 134 138 5 0 137 0 33 33 33
                                              33 139 0 140 0 141 2 129 0 0 142
                                              143 1 129 9 0 144 1 129 6 0 145 1
                                              10 9 0 146 6 0 11 0 33 33 33 33
                                              147 148 1 129 0 6 149 2 137 150 0
                                              13 151 2 150 0 0 0 152 2 150 0 9
                                              9 153 7 0 137 0 33 33 33 33 33 33
                                              154 11 0 137 0 33 33 33 33 33 33
                                              33 33 33 33 155 1 129 30 0 156 1
                                              150 129 0 157 2 129 0 0 0 158 11
                                              0 159 0 33 33 33 33 33 33 33 33
                                              33 33 160 1 129 161 0 162 2 165
                                              163 164 159 166 1 161 0 167 168 1
                                              161 0 0 169 11 0 159 0 33 33 33
                                              33 33 33 33 33 33 33 170 3 0 171
                                              129 54 171 172 2 0 171 129 54 173
                                              1 174 0 129 175 1 176 0 174 177 2
                                              179 178 176 161 180 1 181 174 0
                                              182 1 181 174 0 183 1 174 184 0
                                              185 1 174 129 0 186 2 129 30 0 0
                                              187 1 174 129 0 188 2 140 0 129
                                              129 189 1 147 0 140 190 1 147 140
                                              0 191 2 147 13 140 0 192 2 147 0
                                              0 0 193 1 140 129 0 194 2 161 0 0
                                              0 195 2 161 0 0 0 196 2 161 0 134
                                              0 197 1 147 0 0 198 2 161 134 0
                                              13 199 3 0 171 129 54 147 200 3 0
                                              171 159 54 171 201 0 140 0 202 2
                                              159 129 0 13 203 1 171 0 0 204 1
                                              0 171 159 205 3 0 30 0 9 9 51 2 0
                                              30 0 9 60 2 0 0 0 10 107 2 0 0 0
                                              10 105 3 0 0 0 9 9 91 3 0 0 0 9 9
                                              99 5 0 0 0 9 9 9 9 78 3 0 0 0 33
                                              33 83 6 0 10 0 9 9 9 9 9 77 4 0 0
                                              0 9 9 0 119 5 0 10 0 9 9 9 10 118
                                              4 0 54 0 9 9 54 116 5 0 6 0 9 9 9
                                              6 115 1 0 10 0 111 3 0 0 0 33 33
                                              85 3 0 30 0 9 9 46 6 0 30 0 9 9 9
                                              9 9 48 5 0 30 0 9 9 9 9 47 4 0 30
                                              0 9 9 9 59 3 0 0 0 9 9 90 3 0 0 0
                                              9 9 98 5 0 6 0 9 9 9 6 112 4 0 54
                                              0 9 9 54 114 6 0 30 0 9 9 9 9 9
                                              49 7 0 0 0 9 9 9 9 9 6 104 3 0 62
                                              0 9 9 69 4 0 33 0 9 9 9 68 2 0 62
                                              0 9 70 4 0 30 0 9 9 9 61 3 0 0 9
                                              9 9 15 3 0 0 0 9 6 96 3 0 0 0 9 6
                                              102 5 0 30 0 33 0 33 9 44 4 0 6 0
                                              9 9 9 71 3 0 54 0 9 9 74 4 0 30 0
                                              9 9 9 52 4 0 54 0 9 9 9 55 4 0 33
                                              0 9 9 9 66 3 0 62 0 9 9 65 2 0 62
                                              0 9 67 4 0 0 0 9 9 6 94 4 0 0 0 9
                                              9 6 100 1 0 9 0 27 1 0 9 0 29 1 0
                                              9 0 28 3 0 0 0 9 6 97 3 0 0 0 9 6
                                              103 2 0 10 0 9 75 1 0 10 0 110 3
                                              0 0 0 33 33 89 4 0 30 0 33 0 33
                                              42 4 0 6 0 9 9 9 72 3 0 54 0 9 9
                                              73 5 1 137 0 33 33 33 33 139 7 1
                                              137 0 33 33 134 33 33 134 138 6 1
                                              11 0 33 33 33 33 147 148 3 1 171
                                              129 54 147 200 2 1 171 129 54 173
                                              3 1 171 129 54 171 172 1 1 171
                                              159 205 3 1 171 159 54 171 201 11
                                              1 159 0 33 33 33 33 33 33 33 33
                                              33 33 170 7 1 137 0 33 33 33 33
                                              33 33 154 11 1 137 0 33 33 33 33
                                              33 33 33 33 33 33 155 11 1 159 0
                                              33 33 33 33 33 33 33 33 33 33 160
                                              2 0 30 0 9 53 2 0 54 0 9 56 1 0 0
                                              0 19 1 0 24 0 26 7 1 11 0 33 33
                                              33 33 33 33 128 2 0 0 0 9 23 2 0
                                              0 0 9 21 4 0 0 0 9 9 6 95 4 0 0 0
                                              9 9 6 101 2 0 30 0 0 32 2 0 0 10
                                              0 108 2 0 0 0 10 106)))))
           '|lookupComplete|)) 
