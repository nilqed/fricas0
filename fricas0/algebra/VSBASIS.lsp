
(PUT '|VSBASIS;Zero;$;1| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |VSBASIS;Zero;$;1| (($ $)) NIL) 

(PUT '|VSBASIS;coerce;$L;2| '|SPADreplace| '(XLAM (B) B)) 

(SDEFUN |VSBASIS;coerce;$L;2| ((B $) ($ |List| (|Vector| R))) B) 

(SDEFUN |VSBASIS;coerce;$Of;3| ((B $) ($ |OutputForm|))
        (SPROG ((|a2| (|OutputForm|)) (|a1| (|OutputForm|)))
               (SEQ (LETT |a1| "VectorSpace " . #1=(|VSBASIS;coerce;$Of;3|))
                    (LETT |a2| (SPADCALL B (QREFELT $ 11)) . #1#)
                    (EXIT (SPADCALL |a1| |a2| (QREFELT $ 12)))))) 

(SDEFUN |VSBASIS;column2matrix| ((|Lv| |List| (|Vector| R)) ($ |Matrix| R))
        (SPROG
         ((#1=#:G729 NIL) (|k| NIL) (#2=#:G730 NIL) (|v| NIL) (M (|Matrix| R))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n| (QVSIZE (SPADCALL |Lv| 1 (QREFELT $ 17)))
                . #3=(|VSBASIS;column2matrix|))
          (LETT M (MAKE_MATRIX1 |n| (LENGTH |Lv|) (|spadConstant| $ 18)) . #3#)
          (SEQ (LETT |v| NIL . #3#) (LETT #2# |Lv| . #3#) (LETT |k| 1 . #3#)
               (LETT #1# (LENGTH |Lv|) . #3#) G190
               (COND
                ((OR (|greater_SI| |k| #1#) (ATOM #2#)
                     (PROGN (LETT |v| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |n| (QVSIZE |v|) (QREFELT $ 21))
                   (|error|
                    "Length of vectors in VectorSpaceBasis must have the same size"))
                  ('T (SPADCALL M |k| |v| (QREFELT $ 23))))))
               (LETT |k| (PROG1 (|inc_SI| |k|) (LETT #2# (CDR #2#) . #3#))
                     . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT M)))) 

(SDEFUN |VSBASIS;basis;L$;5| ((|Lv| |List| (|Vector| R)) ($ $))
        (COND ((EQL (LENGTH |Lv|) 0) (|spadConstant| $ 8))
              ('T (SPADCALL (|VSBASIS;column2matrix| |Lv| $) (QREFELT $ 24))))) 

(SDEFUN |VSBASIS;columnSpace;M$;6| ((M |Matrix| R) ($ $))
        (SPADCALL M (QREFELT $ 24))) 

(SDEFUN |VSBASIS;nullSpace;M$;7| ((M |Matrix| R) ($ $))
        (SPADCALL M (QREFELT $ 27))) 

(SDEFUN |VSBASIS;sumBasis;2L$;8|
        ((|Lv| |List| (|Vector| R)) (|Lw| |List| (|Vector| R)) ($ $))
        (SPADCALL (SPADCALL |Lv| |Lw| (QREFELT $ 29)) (QREFELT $ 25))) 

(SDEFUN |VSBASIS;sumBasis;3$;9| ((B1 $) (B2 $) ($ $))
        (SPADCALL (SPADCALL B1 B2 (QREFELT $ 29)) (QREFELT $ 25))) 

(SDEFUN |VSBASIS;sumBasis;L$;10| ((|LLv| |List| (|List| (|Vector| R))) ($ $))
        (SPADCALL (SPADCALL |LLv| (QREFELT $ 33)) (QREFELT $ 25))) 

(SDEFUN |VSBASIS;sumBasis;L$;11| ((LB |List| $) ($ $))
        (SPADCALL (SPADCALL LB (QREFELT $ 36)) (QREFELT $ 25))) 

(SDEFUN |VSBASIS;+;3$;12| ((B1 $) (B2 $) ($ $)) (SPADCALL B1 B2 (QREFELT $ 31))) 

(SDEFUN |VSBASIS;subVector|
        ((|v| |Vector| R) (|a| |Integer|) (|b| |Integer|) ($ |Vector| R))
        (SPROG ((#1=#:G744 NIL) (|k| NIL) (|vv| (|Vector| R)) (#2=#:G740 NIL))
               (SEQ
                (LETT |vv|
                      (MAKEARR1
                       (PROG1
                           (LETT #2# (+ (- |b| |a|) 1)
                                 . #3=(|VSBASIS;subVector|))
                         (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #2#))
                       (|spadConstant| $ 18))
                      . #3#)
                (SEQ (LETT |k| 1 . #3#) (LETT #1# (+ (- |b| |a|) 1) . #3#) G190
                     (COND ((|greater_SI| |k| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (QSETAREF1O |vv| |k| (QAREF1O |v| (- (+ |k| |a|) 1) 1)
                                   1)))
                     (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT |vv|)))) 

(SDEFUN |VSBASIS;linearSum|
        ((|t| |Vector| R) (|Lv| |List| (|Vector| R)) ($ |Vector| R))
        (SPROG
         ((#1=#:G752 NIL) (|j| NIL) (|t2| (R)) (#2=#:G750 NIL) (|k| NIL)
          (#3=#:G751 NIL) (|v2| NIL) (|vv| (|Vector| R)))
         (SEQ
          (LETT |vv|
                (MAKEARR1 (QVSIZE (SPADCALL |Lv| 1 (QREFELT $ 17)))
                          (|spadConstant| $ 18))
                . #4=(|VSBASIS;linearSum|))
          (SEQ (LETT |v2| NIL . #4#) (LETT #3# |Lv| . #4#) (LETT |k| 1 . #4#)
               (LETT #2# (LENGTH |Lv|) . #4#) G190
               (COND
                ((OR (|greater_SI| |k| #2#) (ATOM #3#)
                     (PROGN (LETT |v2| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ (LETT |t2| (SPADCALL |t| |k| (QREFELT $ 39)) . #4#)
                    (EXIT
                     (SEQ (LETT |j| 1 . #4#) (LETT #1# (QVSIZE |vv|) . #4#)
                          G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |vv| |j|
                                      (SPADCALL
                                       (SPADCALL |vv| |j| (QREFELT $ 39))
                                       (SPADCALL |t2|
                                                 (SPADCALL |v2| |j|
                                                           (QREFELT $ 39))
                                                 (QREFELT $ 40))
                                       (QREFELT $ 41))
                                      (QREFELT $ 42))))
                          (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                          (EXIT NIL))))
               (LETT |k| (PROG1 (|inc_SI| |k|) (LETT #3# (CDR #3#) . #4#))
                     . #4#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |vv|)))) 

(SDEFUN |VSBASIS;intBasis;2L$;15|
        ((|Lv| |List| (|Vector| R)) (|Lw| |List| (|Vector| R)) ($ $))
        (SPROG
         ((#1=#:G767 NIL) (|cc| NIL) (#2=#:G766 NIL)
          (|LcoeffB1| (|List| (|Vector| R))) (#3=#:G765 NIL) (|kv| NIL)
          (#4=#:G764 NIL) (|lker| (|List| (|Vector| R))) (#5=#:G762 NIL)
          (|k| NIL) (#6=#:G763 NIL) (|v| NIL) (#7=#:G760 NIL) (#8=#:G761 NIL)
          (|w| NIL) (M (|Matrix| R)) (|d2| #9=(|NonNegativeInteger|))
          (|d1| #9#))
         (SEQ
          (COND ((OR (NULL |Lv|) (NULL |Lw|)) (|spadConstant| $ 8))
                ('T
                 (SEQ
                  (LETT |d1| (LENGTH |Lv|) . #10=(|VSBASIS;intBasis;2L$;15|))
                  (LETT |d2| (LENGTH |Lw|) . #10#)
                  (EXIT
                   (COND
                    ((SPADCALL (QVSIZE (|SPADfirst| |Lv|))
                               (QVSIZE (|SPADfirst| |Lw|)) (QREFELT $ 21))
                     (|error| "vectors have different lengths in intBasis"))
                    ('T
                     (SEQ
                      (LETT M
                            (MAKE_MATRIX1 (QVSIZE (|SPADfirst| |Lv|))
                                          (+ |d1| |d2|) (|spadConstant| $ 18))
                            . #10#)
                      (SEQ (LETT |w| NIL . #10#) (LETT #8# |Lw| . #10#)
                           (LETT |k| 1 . #10#) (LETT #7# |d2| . #10#) G190
                           (COND
                            ((OR (|greater_SI| |k| #7#) (ATOM #8#)
                                 (PROGN (LETT |w| (CAR #8#) . #10#) NIL))
                             (GO G191)))
                           (SEQ (EXIT (SPADCALL M |k| |w| (QREFELT $ 23))))
                           (LETT |k|
                                 (PROG1 (|inc_SI| |k|)
                                   (LETT #8# (CDR #8#) . #10#))
                                 . #10#)
                           (GO G190) G191 (EXIT NIL))
                      (SEQ (LETT |v| NIL . #10#) (LETT #6# |Lv| . #10#)
                           (LETT |k| 1 . #10#) (LETT #5# |d1| . #10#) G190
                           (COND
                            ((OR (|greater_SI| |k| #5#) (ATOM #6#)
                                 (PROGN (LETT |v| (CAR #6#) . #10#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SPADCALL M (+ |d2| |k|) |v| (QREFELT $ 23))))
                           (LETT |k|
                                 (PROG1 (|inc_SI| |k|)
                                   (LETT #6# (CDR #6#) . #10#))
                                 . #10#)
                           (GO G190) G191 (EXIT NIL))
                      (LETT |lker| (SPADCALL M (QREFELT $ 27)) . #10#)
                      (LETT |LcoeffB1|
                            (PROGN
                             (LETT #4# NIL . #10#)
                             (SEQ (LETT |kv| NIL . #10#)
                                  (LETT #3# |lker| . #10#) G190
                                  (COND
                                   ((OR (ATOM #3#)
                                        (PROGN
                                         (LETT |kv| (CAR #3#) . #10#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #4#
                                          (CONS
                                           (|VSBASIS;subVector| |kv| (+ |d2| 1)
                                            (+ |d2| |d1|) $)
                                           #4#)
                                          . #10#)))
                                  (LETT #3# (CDR #3#) . #10#) (GO G190) G191
                                  (EXIT (NREVERSE #4#))))
                            . #10#)
                      (EXIT
                       (PROGN
                        (LETT #2# NIL . #10#)
                        (SEQ (LETT |cc| NIL . #10#)
                             (LETT #1# |LcoeffB1| . #10#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |cc| (CAR #1#) . #10#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS (|VSBASIS;linearSum| |cc| |Lv| $)
                                           #2#)
                                     . #10#)))
                             (LETT #1# (CDR #1#) . #10#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))))))))))))) 

(SDEFUN |VSBASIS;intBasis;3$;16| ((B1 $) (B2 $) ($ $))
        (SPROG ((|Lw| (|Rep|)) (|Lv| (|Rep|)))
               (SEQ (LETT |Lv| B1 . #1=(|VSBASIS;intBasis;3$;16|))
                    (LETT |Lw| B2 . #1#)
                    (EXIT (SPADCALL |Lv| |Lw| (QREFELT $ 43)))))) 

(SDEFUN |VSBASIS;intBasis;L$;17| ((LLB |List| (|List| (|Vector| R))) ($ $))
        (SPROG ((|res| ($)) (#1=#:G774 NIL) (LB NIL))
               (SEQ
                (COND
                 ((EQL (LENGTH LLB) 0)
                  (|error| "intersect no subspace is impossible"))
                 ('T
                  (SEQ
                   (LETT |res|
                         (SPADCALL (SPADCALL LLB 1 (QREFELT $ 45))
                                   (QREFELT $ 25))
                         . #2=(|VSBASIS;intBasis;L$;17|))
                   (SEQ (LETT LB NIL . #2#) (LETT #1# (CDR LLB) . #2#) G190
                        (COND
                         ((OR (ATOM #1#) (PROGN (LETT LB (CAR #1#) . #2#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |res|
                                (SPADCALL |res| (SPADCALL LB (QREFELT $ 25))
                                          (QREFELT $ 44))
                                . #2#)))
                        (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                   (EXIT |res|))))))) 

(SDEFUN |VSBASIS;intBasis;L$;18| ((LLB |List| $) ($ $))
        (SPROG ((|res| ($)) (#1=#:G781 NIL) (LB NIL))
               (SEQ
                (COND
                 ((EQL (SPADCALL LLB (QREFELT $ 48)) 0)
                  (|error| "intersect no subspace is impossible"))
                 ('T
                  (SEQ
                   (LETT |res| (SPADCALL LLB 1 (QREFELT $ 49))
                         . #2=(|VSBASIS;intBasis;L$;18|))
                   (SEQ (LETT LB NIL . #2#)
                        (LETT #1# (SPADCALL LLB (QREFELT $ 50)) . #2#) G190
                        (COND
                         ((OR (ATOM #1#) (PROGN (LETT LB (CAR #1#) . #2#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |res| (SPADCALL |res| LB (QREFELT $ 44))
                                . #2#)))
                        (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                   (EXIT |res|))))))) 

(SDEFUN |VSBASIS;*;3$;19| ((B1 $) (B2 $) ($ $)) (SPADCALL B1 B2 (QREFELT $ 44))) 

(PUT '|VSBASIS;rank;$Nni;20| '|SPADreplace| 'LENGTH) 

(SDEFUN |VSBASIS;rank;$Nni;20| ((B $) ($ |NonNegativeInteger|)) (LENGTH B)) 

(SDEFUN |VSBASIS;rank;LNni;21|
        ((|Lv| |List| (|Vector| R)) ($ |NonNegativeInteger|))
        (SPADCALL (SPADCALL |Lv| (QREFELT $ 25)) (QREFELT $ 53))) 

(SDEFUN |VSBASIS;isBasis?;LB;22| ((|Lv| |List| (|Vector| R)) ($ |Boolean|))
        (EQL (SPADCALL |Lv| (QREFELT $ 53)) (LENGTH |Lv|))) 

(SDEFUN |VSBASIS;subspace?;2$B;23| ((B1 $) (B2 $) ($ |Boolean|))
        (EQL (SPADCALL B2 (QREFELT $ 53))
             (SPADCALL (SPADCALL B1 B2 (QREFELT $ 31)) (QREFELT $ 53)))) 

(SDEFUN |VSBASIS;=;2$B;24| ((B1 $) (B2 $) ($ |Boolean|))
        (SPROG
         ((|rks| #1=(|NonNegativeInteger|)) (#2=#:G790 NIL) (|rk2| #1#)
          (|rk1| #1#))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL
              (LETT |rk1| (SPADCALL B1 (QREFELT $ 53))
                    . #3=(|VSBASIS;=;2$B;24|))
              (LETT |rk2| (SPADCALL B2 (QREFELT $ 53)) . #3#) (QREFELT $ 21))
             (PROGN (LETT #2# NIL . #3#) (GO #4=#:G789)))
            (#5='T
             (SEQ
              (LETT |rks|
                    (SPADCALL (SPADCALL B1 B2 (QREFELT $ 31)) (QREFELT $ 53))
                    . #3#)
              (EXIT (COND ((EQL |rks| |rk1|) (EQL |rks| |rk2|)) (#5# NIL)))))))
          #4# (EXIT #2#)))) 

(SDEFUN |VSBASIS;canonicalBasis;Nni$;25| ((|n| |NonNegativeInteger|) ($ $))
        (SPROG
         ((L (|List| (|Vector| R))) (|v| (|Vector| R)) (#1=#:G795 NIL)
          (|k| NIL))
         (SEQ (LETT L NIL . #2=(|VSBASIS;canonicalBasis;Nni$;25|))
              (SEQ (LETT |k| 1 . #2#) (LETT #1# |n| . #2#) G190
                   (COND ((|greater_SI| |k| #1#) (GO G191)))
                   (SEQ (LETT |v| (MAKEARR1 |n| (|spadConstant| $ 18)) . #2#)
                        (SPADCALL |v| (- (+ |n| 1) |k|) (|spadConstant| $ 14)
                                  (QREFELT $ 42))
                        (EXIT (LETT L (CONS |v| L) . #2#)))
                   (LETT |k| (|inc_SI| |k|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT L)))) 

(SDEFUN |VSBASIS;complementSpace;L$;26| ((|Lv| |List| (|Vector| R)) ($ $))
        (SPROG
         ((|ind| (|NonNegativeInteger|)) (RES ($)) (#1=#:G805 NIL) (|k| NIL)
          (#2=#:G806 NIL) (|v| NIL) (#3=#:G803 NIL) (#4=#:G804 NIL)
          (|n| (|NonNegativeInteger|)) (M (|Matrix| R))
          (|Lw| (|List| (|Vector| R))) (|bc| (|List| (|Vector| R)))
          (|dim| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((SPADCALL |Lv| NIL (QREFELT $ 57))
            (|error|
             "Can't get vector length of an empty family for complementSpace"))
           ('T
            (SEQ
             (LETT |dim| (QVSIZE (SPADCALL |Lv| 1 (QREFELT $ 17)))
                   . #5=(|VSBASIS;complementSpace;L$;26|))
             (LETT |bc|
                   (SPADCALL (SPADCALL |dim| (QREFELT $ 58)) (QREFELT $ 9))
                   . #5#)
             (LETT |Lw| (SPADCALL |Lv| |bc| (QREFELT $ 29)) . #5#)
             (LETT M (SPADCALL (|VSBASIS;column2matrix| |Lw| $) (QREFELT $ 59))
                   . #5#)
             (LETT |n| (LENGTH |Lv|) . #5#) (LETT |ind| 1 . #5#)
             (SEQ (LETT |v| NIL . #5#) (LETT #4# |Lw| . #5#) (LETT |k| 1 . #5#)
                  (LETT #3# |n| . #5#) G190
                  (COND
                   ((OR (|greater_SI| |k| #3#) (ATOM #4#)
                        (PROGN (LETT |v| (CAR #4#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL |ind| |dim| (QREFELT $ 60))
                      (COND
                       ((SPADCALL (SPADCALL M |ind| |k| (QREFELT $ 61))
                                  (|spadConstant| $ 18) (QREFELT $ 62))
                        (LETT |ind| (+ |ind| 1) . #5#)))))))
                  (LETT |k| (PROG1 (|inc_SI| |k|) (LETT #4# (CDR #4#) . #5#))
                        . #5#)
                  (GO G190) G191 (EXIT NIL))
             (LETT RES NIL . #5#)
             (SEQ (LETT |v| NIL . #5#) (LETT #2# |bc| . #5#)
                  (LETT |k| (+ |n| 1) . #5#) (LETT #1# (+ |n| |dim|) . #5#)
                  G190
                  (COND
                   ((OR (> |k| #1#) (ATOM #2#)
                        (PROGN (LETT |v| (CAR #2#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL |ind| |dim| (QREFELT $ 60))
                      (COND
                       ((SPADCALL (SPADCALL M |ind| |k| (QREFELT $ 61))
                                  (|spadConstant| $ 18) (QREFELT $ 62))
                        (SEQ (LETT RES (CONS |v| RES) . #5#)
                             (EXIT (LETT |ind| (+ |ind| 1) . #5#)))))))))
                  (LETT |k| (PROG1 (+ |k| 1) (LETT #2# (CDR #2#) . #5#)) . #5#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT (NREVERSE RES)))))))) 

(SDEFUN |VSBASIS;complementSpace;LNni$;27|
        ((|Lv| |List| (|Vector| R)) (|n| |NonNegativeInteger|) ($ $))
        (COND
         ((SPADCALL |Lv| NIL (QREFELT $ 57)) (SPADCALL |n| (QREFELT $ 58)))
         ((SPADCALL |n| (QVSIZE (SPADCALL |Lv| 1 (QREFELT $ 17)))
                    (QREFELT $ 21))
          (|error| "Inconsistant vector length in complementSpace"))
         ('T (SPADCALL |Lv| (QREFELT $ 64))))) 

(SDEFUN |VSBASIS;complementSpace;2$;28| ((B $) ($ $))
        (SPROG
         ((|ind| (|NonNegativeInteger|)) (RES ($)) (#1=#:G814 NIL) (|k| NIL)
          (#2=#:G815 NIL) (|v| NIL) (|n| (|NonNegativeInteger|))
          (M (|Matrix| R)) (|Lw| (|List| (|Vector| R)))
          (|bc| (|List| (|Vector| R))) (|dim| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((SPADCALL B (|spadConstant| $ 8) (QREFELT $ 57))
            (|error|
             "Can't get vector length of an empty basis for complement Space"))
           ('T
            (SEQ
             (LETT |dim| (QVSIZE (SPADCALL B 1 (QREFELT $ 17)))
                   . #3=(|VSBASIS;complementSpace;2$;28|))
             (LETT |bc|
                   (SPADCALL (SPADCALL |dim| (QREFELT $ 58)) (QREFELT $ 9))
                   . #3#)
             (LETT |Lw|
                   (SPADCALL (SPADCALL B (QREFELT $ 9)) |bc| (QREFELT $ 29))
                   . #3#)
             (LETT M (SPADCALL (|VSBASIS;column2matrix| |Lw| $) (QREFELT $ 59))
                   . #3#)
             (LETT |n| (LENGTH B) . #3#) (LETT |ind| (+ |n| 1) . #3#)
             (LETT RES NIL . #3#)
             (SEQ (LETT |v| NIL . #3#) (LETT #2# |bc| . #3#)
                  (LETT |k| (+ |n| 1) . #3#) (LETT #1# (+ |n| |dim|) . #3#)
                  G190
                  (COND
                   ((OR (> |k| #1#) (ATOM #2#)
                        (PROGN (LETT |v| (CAR #2#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL |ind| |dim| (QREFELT $ 60))
                      (COND
                       ((SPADCALL (SPADCALL M |ind| |k| (QREFELT $ 61))
                                  (|spadConstant| $ 18) (QREFELT $ 62))
                        (SEQ (LETT RES (CONS |v| RES) . #3#)
                             (EXIT (LETT |ind| (+ |ind| 1) . #3#)))))))))
                  (LETT |k| (PROG1 (+ |k| 1) (LETT #2# (CDR #2#) . #3#)) . #3#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT (NREVERSE RES)))))))) 

(SDEFUN |VSBASIS;complementSpace;$Nni$;29|
        ((B $) (|n| |NonNegativeInteger|) ($ $))
        (COND ((SPADCALL B NIL (QREFELT $ 57)) (SPADCALL |n| (QREFELT $ 58)))
              ((SPADCALL |n| (QVSIZE (SPADCALL B 1 (QREFELT $ 17)))
                         (QREFELT $ 21))
               (|error| "Inconsistant vector length in complementSpace"))
              ('T (SPADCALL B (QREFELT $ 64))))) 

(SDEFUN |VSBASIS;member?;V$B;30| ((|v| |Vector| R) (B $) ($ |Boolean|))
        (SPADCALL (|VSBASIS;column2matrix| B $) |v| (QREFELT $ 68))) 

(SDEFUN |VSBASIS;coordinatesIfCan;V$U;31|
        ((|v| |Vector| R) (B $) ($ |Union| (|Vector| R) "failed"))
        (SPADCALL (|VSBASIS;column2matrix| B $) |v| (QREFELT $ 71))) 

(SDEFUN |VSBASIS;coordinates;V$V;32| ((V |Vector| R) (B $) ($ |Vector| R))
        (SPROG ((|res| (|Union| (|Vector| R) "failed")))
               (SEQ
                (LETT |res|
                      (SPADCALL (|VSBASIS;column2matrix| B $) V (QREFELT $ 71))
                      |VSBASIS;coordinates;V$V;32|)
                (EXIT
                 (COND
                  ((QEQCAR |res| 1) (|error| "Vector not in the subspace"))
                  ('T (QCDR |res|))))))) 

(DECLAIM (NOTINLINE |VectorSpaceBasis;|)) 

(DEFUN |VectorSpaceBasis| (#1=#:G830)
  (SPROG NIL
         (PROG (#2=#:G831)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|VectorSpaceBasis|)
                                               '|domainEqualList|)
                    . #3=(|VectorSpaceBasis|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|VectorSpaceBasis;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|VectorSpaceBasis|)))))))))) 

(DEFUN |VectorSpaceBasis;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|VectorSpaceBasis|))
          (LETT |dv$| (LIST '|VectorSpaceBasis| DV$1) . #1#)
          (LETT $ (GETREFV 74) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|VectorSpaceBasis| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 (|List| (|Vector| |#1|)))
          $))) 

(MAKEPROP '|VectorSpaceBasis| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|List| 15) (|local| |#1|) '|Rep|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |VSBASIS;Zero;$;1|) $))
              |VSBASIS;coerce;$L;2| (|OutputForm|) (0 . |coerce|)
              (5 . |hconcat|) |VSBASIS;coerce;$Of;3| (11 . |One|) (|Vector| 6)
              (|Integer|) (15 . |elt|) (21 . |Zero|) (|Boolean|)
              (|NonNegativeInteger|) (25 . ~=) (|Matrix| 6) (31 . |setColumn!|)
              (38 . |columnSpace|) |VSBASIS;basis;L$;5|
              |VSBASIS;columnSpace;M$;6| (43 . |nullSpace|)
              |VSBASIS;nullSpace;M$;7| (48 . |concat|) |VSBASIS;sumBasis;2L$;8|
              |VSBASIS;sumBasis;3$;9| (|List| $) (54 . |concat|) (|List| 5)
              |VSBASIS;sumBasis;L$;10| (59 . |concat|) |VSBASIS;sumBasis;L$;11|
              |VSBASIS;+;3$;12| (64 . |elt|) (70 . *) (76 . +) (82 . |setelt!|)
              |VSBASIS;intBasis;2L$;15| |VSBASIS;intBasis;3$;16| (89 . |elt|)
              |VSBASIS;intBasis;L$;17| (|List| $$) (95 . |#|) (100 . |elt|)
              (106 . |rest|) |VSBASIS;intBasis;L$;18| |VSBASIS;*;3$;19|
              |VSBASIS;rank;$Nni;20| |VSBASIS;rank;LNni;21|
              |VSBASIS;isBasis?;LB;22| |VSBASIS;subspace?;2$B;23|
              |VSBASIS;=;2$B;24| |VSBASIS;canonicalBasis;Nni$;25|
              (111 . |rowEchelon|) (116 . <=) (122 . |elt|) (129 . ~=)
              |VSBASIS;complementSpace;L$;26| |VSBASIS;complementSpace;2$;28|
              |VSBASIS;complementSpace;LNni$;27|
              |VSBASIS;complementSpace;$Nni$;29|
              (|LinearSystemMatrixPackage1| 6) (135 . |hasSolution?|)
              |VSBASIS;member?;V$B;30| (|Union| 15 '"failed")
              (141 . |particularSolution|) |VSBASIS;coordinatesIfCan;V$U;31|
              |VSBASIS;coordinates;V$V;32|)
           '#(~= 147 |sumBasis| 153 |subspace?| 175 |rank| 181 |nullSpace| 191
              |member?| 196 |isBasis?| 202 |intBasis| 207 |coordinatesIfCan|
              229 |coordinates| 235 |complementSpace| 241 |columnSpace| 263
              |coerce| 268 |canonicalBasis| 278 |basis| 283 |Zero| 288 = 292 +
              298 * 304)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0))
                 (CONS '#(|BasicType&| NIL)
                       (CONS '#((|BasicType|) (|CoercibleTo| 10))
                             (|makeByteWordVec2| 73
                                                 '(1 5 10 0 11 2 10 0 0 0 12 0
                                                   6 0 14 2 7 15 0 16 17 0 6 0
                                                   18 2 20 19 0 0 21 3 22 0 0
                                                   16 15 23 1 22 5 0 24 1 22 5
                                                   0 27 2 5 0 0 0 29 1 5 0 32
                                                   33 1 7 0 32 36 2 15 6 0 16
                                                   39 2 6 0 0 0 40 2 6 0 0 0 41
                                                   3 15 6 0 16 6 42 2 34 5 0 16
                                                   45 1 47 20 0 48 2 47 2 0 16
                                                   49 1 47 0 0 50 1 22 0 0 59 2
                                                   20 19 0 0 60 3 22 6 0 16 16
                                                   61 2 6 19 0 0 62 2 67 19 22
                                                   15 68 2 67 70 22 15 71 2 0
                                                   19 0 0 1 1 0 0 34 35 2 0 0 5
                                                   5 30 1 0 0 32 37 2 0 0 0 0
                                                   31 2 0 19 0 0 56 1 0 20 5 54
                                                   1 0 20 0 53 1 0 0 22 28 2 0
                                                   19 15 0 69 1 0 19 5 55 1 0 0
                                                   34 46 1 0 0 32 51 2 0 0 5 5
                                                   43 2 0 0 0 0 44 2 0 70 15 0
                                                   72 2 0 15 15 0 73 1 0 0 5 63
                                                   2 0 0 5 20 65 1 0 0 0 64 2 0
                                                   0 0 20 66 1 0 0 22 26 1 0 5
                                                   0 9 1 0 10 0 13 1 0 0 20 58
                                                   1 0 0 5 25 0 0 0 8 2 0 19 0
                                                   0 57 2 0 0 0 0 38 2 0 0 0 0
                                                   52)))))
           '|lookupComplete|)) 
