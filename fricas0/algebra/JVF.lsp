
(SDEFUN |JVF;diff;JB$;1| ((|jb| JB) ($ $))
        (CONS (LIST (|spadConstant| $ 14)) (LIST |jb|))) 

(SDEFUN |JVF;diffX;Pi$;2| ((|i| |PositiveInteger|) ($ $))
        (SPADCALL (SPADCALL |i| (QREFELT $ 16)) (QREFELT $ 15))) 

(SDEFUN |JVF;diffU;Pi$;3| ((|i| |PositiveInteger|) ($ $))
        (SPADCALL (SPADCALL |i| (QREFELT $ 18)) (QREFELT $ 15))) 

(SDEFUN |JVF;diffP;PiL$;4|
        ((|i| |PositiveInteger|) (|mu| |List| (|NonNegativeInteger|)) ($ $))
        (SPADCALL (SPADCALL |i| |mu| (QREFELT $ 21)) (QREFELT $ 15))) 

(SDEFUN |JVF;monom| ((|c| D) (|jb| JB) ($ |OutputForm|))
        (COND
         ((SPADCALL |c| (QREFELT $ 24))
          (SPADCALL (SPADCALL "D" (QREFELT $ 27))
                    (SPADCALL |jb| (QREFELT $ 28)) (QREFELT $ 29)))
         ('T
          (SPADCALL (SPADCALL |c| (QREFELT $ 30))
                    (SPADCALL (SPADCALL "D" (QREFELT $ 27))
                              (SPADCALL |jb| (QREFELT $ 28)) (QREFELT $ 29))
                    (QREFELT $ 31))))) 

(SDEFUN |JVF;coerce;$Of;6| ((|v| $) ($ |OutputForm|))
        (SPROG
         ((#1=#:G735 NIL) (|c| NIL) (#2=#:G736 NIL) (|jb| NIL) (#3=#:G734 NIL))
         (SEQ
          (COND
           ((NULL (QCDR |v|)) (SPADCALL (|spadConstant| $ 32) (QREFELT $ 30)))
           ((EQL (LENGTH (QCDR |v|)) 1)
            (|JVF;monom| (|SPADfirst| (QCAR |v|)) (|SPADfirst| (QCDR |v|)) $))
           ('T
            (SPADCALL (ELT $ 33)
                      (PROGN
                       (LETT #3# NIL . #4=(|JVF;coerce;$Of;6|))
                       (SEQ (LETT |jb| NIL . #4#) (LETT #2# (QCDR |v|) . #4#)
                            (LETT |c| NIL . #4#) (LETT #1# (QCAR |v|) . #4#)
                            G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |c| (CAR #1#) . #4#) NIL)
                                  (ATOM #2#)
                                  (PROGN (LETT |jb| (CAR #2#) . #4#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #3# (CONS (|JVF;monom| |c| |jb| $) #3#)
                                    . #4#)))
                            (LETT #1#
                                  (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #4#))
                                  . #4#)
                            (GO G190) G191 (EXIT (NREVERSE #3#))))
                      (QREFELT $ 36))))))) 

(SDEFUN |JVF;coefficients;$L;7| ((|v| $) ($ |List| D))
        (SPADCALL (QCAR |v|) (QREFELT $ 39))) 

(SDEFUN |JVF;directions;$L;8| ((|v| $) ($ |List| JB))
        (SPADCALL (QCDR |v|) (QREFELT $ 42))) 

(SDEFUN |JVF;coefficient;$JBD;9| ((|v| $) (|jb| JB) ($ D))
        (SPROG ((|pos| (|Integer|)))
               (SEQ
                (LETT |pos| (SPADCALL |jb| (QCDR |v|) (QREFELT $ 45))
                      |JVF;coefficient;$JBD;9|)
                (EXIT
                 (COND
                  ((< |pos| (SPADCALL (QCDR |v|) (QREFELT $ 46)))
                   (|spadConstant| $ 32))
                  ('T (SPADCALL (QCAR |v|) |pos| (QREFELT $ 47)))))))) 

(SDEFUN |JVF;copy;2$;10| ((|v| $) ($ $))
        (CONS (SPADCALL (QCAR |v|) (QREFELT $ 39))
              (SPADCALL (QCDR |v|) (QREFELT $ 42)))) 

(PUT '|JVF;Zero;$;11| '|SPADreplace| '(XLAM NIL (CONS NIL NIL))) 

(SDEFUN |JVF;Zero;$;11| (($ $)) (CONS NIL NIL)) 

(SDEFUN |JVF;zero?;$B;12| ((|v| $) ($ |Boolean|)) (NULL (QCDR |v|))) 

(SDEFUN |JVF;-;2$;13| ((|v| $) ($ $))
        (SPROG ((#1=#:G747 NIL) (|c| NIL) (#2=#:G746 NIL))
               (SEQ
                (CONS
                 (PROGN
                  (LETT #2# NIL . #3=(|JVF;-;2$;13|))
                  (SEQ (LETT |c| NIL . #3#) (LETT #1# (QCAR |v|) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL |c| (QREFELT $ 53)) #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QCDR |v|))))) 

(SDEFUN |JVF;+;3$;14| ((|v| $) (|w| $) ($ $))
        (SPROG
         ((|lj2| (|List| JB)) (|lc2| (|List| D)) (|resJ| (|List| JB))
          (|resC| (|List| D)) (|sum| (D)) (#1=#:G764 NIL) (|c1| NIL)
          (#2=#:G765 NIL) (|j1| NIL))
         (SEQ
          (COND ((SPADCALL |v| (QREFELT $ 52)) |w|)
                ((SPADCALL |w| (QREFELT $ 52)) |v|)
                ('T
                 (SEQ
                  (LETT |lc2| (SPADCALL (QCAR |w|) (QREFELT $ 39))
                        . #3=(|JVF;+;3$;14|))
                  (LETT |lj2| (SPADCALL (QCDR |w|) (QREFELT $ 42)) . #3#)
                  (LETT |resC| NIL . #3#) (LETT |resJ| NIL . #3#)
                  (SEQ (LETT |j1| NIL . #3#) (LETT #2# (QCDR |v|) . #3#)
                       (LETT |c1| NIL . #3#) (LETT #1# (QCAR |v|) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |c1| (CAR #1#) . #3#) NIL)
                             (ATOM #2#)
                             (PROGN (LETT |j1| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND ((NULL |lj2|) NIL)
                                      ('T
                                       (SPADCALL (|SPADfirst| |lj2|) |j1|
                                                 (QREFELT $ 55)))))
                               (GO G191)))
                             (SEQ
                              (LETT |resC| (CONS (|SPADfirst| |lc2|) |resC|)
                                    . #3#)
                              (LETT |resJ| (CONS (|SPADfirst| |lj2|) |resJ|)
                                    . #3#)
                              (LETT |lc2| (CDR |lc2|) . #3#)
                              (EXIT (LETT |lj2| (CDR |lj2|) . #3#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((OR (NULL |lj2|)
                               (NULL
                                (SPADCALL (|SPADfirst| |lj2|) |j1|
                                          (QREFELT $ 56))))
                           (SEQ (LETT |resC| (CONS |c1| |resC|) . #3#)
                                (EXIT (LETT |resJ| (CONS |j1| |resJ|) . #3#))))
                          ('T
                           (SEQ
                            (LETT |sum|
                                  (SPADCALL |c1| (|SPADfirst| |lc2|)
                                            (QREFELT $ 57))
                                  . #3#)
                            (COND
                             ((NULL (SPADCALL |sum| (QREFELT $ 58)))
                              (SEQ (LETT |resC| (CONS |sum| |resC|) . #3#)
                                   (EXIT
                                    (LETT |resJ| (CONS |j1| |resJ|) . #3#)))))
                            (LETT |lc2| (CDR |lc2|) . #3#)
                            (EXIT (LETT |lj2| (CDR |lj2|) . #3#)))))))
                       (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#))
                             . #3#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (CONS (SPADCALL (NREVERSE |resC|) |lc2| (QREFELT $ 59))
                         (SPADCALL (NREVERSE |resJ|) |lj2|
                                   (QREFELT $ 60)))))))))) 

(SDEFUN |JVF;*;D2$;15| ((|f| D) (|v| $) ($ $))
        (SPROG ((#1=#:G770 NIL) (|c| NIL) (#2=#:G769 NIL))
               (SEQ
                (COND ((SPADCALL |f| (QREFELT $ 58)) (|spadConstant| $ 51))
                      ('T
                       (CONS
                        (PROGN
                         (LETT #2# NIL . #3=(|JVF;*;D2$;15|))
                         (SEQ (LETT |c| NIL . #3#) (LETT #1# (QCAR |v|) . #3#)
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |f| |c| (QREFELT $ 62))
                                            #2#)
                                      . #3#)))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        (QCDR |v|))))))) 

(SDEFUN |JVF;prolong;$Nni$;16| ((|v| $) (|q| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|oldDir| (|List| JB)) (|oldCo| #1=(|List| D)) (|newDir| (|List| JB))
          (|newCo| #1#) (|res| ($)) (|newco| (D))
          (|nu| (|List| (|NonNegativeInteger|))) (#2=#:G839 NIL) (|i| NIL)
          (|j| (|Integer|)) (#3=#:G814 NIL) (|newjv| (JB)) (#4=#:G809 NIL)
          (#5=#:G807 NIL) (#6=#:G838 NIL) (|k| NIL)
          (|mu| (|List| (|NonNegativeInteger|))) (|a| (|PositiveInteger|))
          (|jm| (|SparseEchelonMatrix| JB D)) (#7=#:G836 NIL) (|jv| NIL)
          (#8=#:G837 NIL) (|co| NIL) (#9=#:G835 NIL) (|qq| NIL)
          (#10=#:G798 NIL) (#11=#:G834 NIL) (#12=#:G833 NIL) (#13=#:G832 NIL)
          (#14=#:G830 NIL) (#15=#:G831 NIL) (#16=#:G787 NIL) (#17=#:G829 NIL)
          (#18=#:G828 NIL) (|dxi| (|Matrix| D))
          (|ind2| #19=(|List| (|PositiveInteger|))) (|eta| #1#) (|ind1| #19#)
          (|xi| #1#) (|jt| (|Symbol|)) (#20=#:G826 NIL) (#21=#:G827 NIL)
          (|coeffs| (|List| D)) (|dirs| (|List| JB)))
         (SEQ
          (COND ((ZEROP |q|) |v|)
                ('T
                 (SEQ
                  (LETT |dirs| (SPADCALL |v| (QREFELT $ 43))
                        . #22=(|JVF;prolong;$Nni$;16|))
                  (LETT |coeffs| (SPADCALL |v| (QREFELT $ 40)) . #22#)
                  (LETT |xi| NIL . #22#) (LETT |eta| NIL . #22#)
                  (LETT |ind1| NIL . #22#) (LETT |ind2| NIL . #22#)
                  (SEQ (LETT |co| NIL . #22#) (LETT #21# |coeffs| . #22#)
                       (LETT |jv| NIL . #22#) (LETT #20# |dirs| . #22#) G190
                       (COND
                        ((OR (ATOM #20#)
                             (PROGN (LETT |jv| (CAR #20#) . #22#) NIL)
                             (ATOM #21#)
                             (PROGN (LETT |co| (CAR #21#) . #22#) NIL))
                         (GO G191)))
                       (SEQ (LETT |jt| (SPADCALL |jv| (QREFELT $ 65)) . #22#)
                            (EXIT
                             (COND
                              ((EQUAL |jt| '|Indep|)
                               (SEQ (LETT |xi| (CONS |co| |xi|) . #22#)
                                    (EXIT
                                     (LETT |ind1|
                                           (CONS (SPADCALL |jv| (QREFELT $ 66))
                                                 |ind1|)
                                           . #22#))))
                              ((EQUAL |jt| '|Dep|)
                               (SEQ (LETT |eta| (CONS |co| |eta|) . #22#)
                                    (EXIT
                                     (LETT |ind2|
                                           (CONS (SPADCALL |jv| (QREFELT $ 66))
                                                 |ind2|)
                                           . #22#))))
                              ('T
                               (|error| "not base vector field in prolong")))))
                       (LETT #20#
                             (PROG1 (CDR #20#) (LETT #21# (CDR #21#) . #22#))
                             . #22#)
                       (GO G190) G191 (EXIT NIL))
                  (LETT |dxi|
                        (MAKE_MATRIX1 (LENGTH |xi|) (QREFELT $ 10)
                                      (|spadConstant| $ 32))
                        . #22#)
                  (SEQ (LETT |i| 1 . #22#) (LETT |co| NIL . #22#)
                       (LETT #18# |xi| . #22#) G190
                       (COND
                        ((OR (ATOM #18#)
                             (PROGN (LETT |co| (CAR #18#) . #22#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |jm| (SPADCALL (LIST |co|) (QREFELT $ 69))
                              . #22#)
                        (EXIT
                         (SEQ (LETT |j| 1 . #22#)
                              (LETT #17# (QREFELT $ 10) . #22#) G190
                              (COND ((|greater_SI| |j| #17#) (GO G191)))
                              (SEQ
                               (EXIT
                                (QSETAREF2O |dxi| |i| |j|
                                            (QCAR
                                             (SPADCALL |co|
                                                       (PROG1
                                                           (LETT #16# |j|
                                                                 . #22#)
                                                         (|check_subtype2|
                                                          (> #16# 0)
                                                          '(|PositiveInteger|)
                                                          '(|NonNegativeInteger|)
                                                          #16#))
                                                       |jm| (QREFELT $ 71)))
                                            1 1)))
                              (LETT |j| (|inc_SI| |j|) . #22#) (GO G190) G191
                              (EXIT NIL))))
                       (LETT #18#
                             (PROG1 (CDR #18#)
                               (LETT |i| (|inc_SI| |i|) . #22#))
                             . #22#)
                       (GO G190) G191 (EXIT NIL))
                  (LETT |j| (QREFELT $ 12) . #22#) (LETT |oldCo| NIL . #22#)
                  (SEQ (LETT |i| NIL . #22#) (LETT #15# |ind2| . #22#)
                       (LETT |co| NIL . #22#) (LETT #14# |eta| . #22#) G190
                       (COND
                        ((OR (ATOM #14#)
                             (PROGN (LETT |co| (CAR #14#) . #22#) NIL)
                             (ATOM #15#)
                             (PROGN (LETT |i| (CAR #15#) . #22#) NIL))
                         (GO G191)))
                       (SEQ
                        (SEQ G190
                             (COND
                              ((NULL (SPADCALL |j| |i| (QREFELT $ 72)))
                               (GO G191)))
                             (SEQ
                              (LETT |oldCo|
                                    (CONS (|spadConstant| $ 32) |oldCo|)
                                    . #22#)
                              (EXIT (LETT |j| (- |j| 1) . #22#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (LETT |oldCo| (CONS |co| |oldCo|) . #22#)
                        (EXIT (LETT |j| (- |j| 1) . #22#)))
                       (LETT #14#
                             (PROG1 (CDR #14#) (LETT #15# (CDR #15#) . #22#))
                             . #22#)
                       (GO G190) G191 (EXIT NIL))
                  (COND
                   ((NULL (ZEROP |j|))
                    (SEQ (LETT |i| 1 . #22#) (LETT #13# |j| . #22#) G190
                         (COND ((|greater_SI| |i| #13#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |oldCo| (CONS (|spadConstant| $ 32) |oldCo|)
                                 . #22#)))
                         (LETT |i| (|inc_SI| |i|) . #22#) (GO G190) G191
                         (EXIT NIL))))
                  (LETT |oldDir|
                        (PROGN
                         (LETT #12# NIL . #22#)
                         (SEQ (LETT |i| 1 . #22#)
                              (LETT #11# (QREFELT $ 12) . #22#) G190
                              (COND ((|greater_SI| |i| #11#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #12#
                                      (CONS
                                       (SPADCALL
                                        (PROG1 (LETT #10# |i| . #22#)
                                          (|check_subtype2| (> #10# 0)
                                                            '(|PositiveInteger|)
                                                            '(|NonNegativeInteger|)
                                                            #10#))
                                        (QREFELT $ 18))
                                       #12#)
                                      . #22#)))
                              (LETT |i| (|inc_SI| |i|) . #22#) (GO G190) G191
                              (EXIT (NREVERSE #12#))))
                        . #22#)
                  (LETT |res| |v| . #22#)
                  (SEQ (LETT |qq| 1 . #22#) (LETT #9# |q| . #22#) G190
                       (COND ((|greater_SI| |qq| #9#) (GO G191)))
                       (SEQ (LETT |newCo| NIL . #22#)
                            (LETT |newDir| NIL . #22#)
                            (SEQ (LETT |co| NIL . #22#)
                                 (LETT #8# |oldCo| . #22#)
                                 (LETT |jv| NIL . #22#)
                                 (LETT #7# |oldDir| . #22#) G190
                                 (COND
                                  ((OR (ATOM #7#)
                                       (PROGN (LETT |jv| (CAR #7#) . #22#) NIL)
                                       (ATOM #8#)
                                       (PROGN
                                        (LETT |co| (CAR #8#) . #22#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |jm|
                                        (SPADCALL (LIST |co|) (QREFELT $ 69))
                                        . #22#)
                                  (LETT |a| (SPADCALL |jv| (QREFELT $ 66))
                                        . #22#)
                                  (LETT |mu| (SPADCALL |jv| (QREFELT $ 74))
                                        . #22#)
                                  (EXIT
                                   (SEQ
                                    (LETT |k|
                                          (MAX 1
                                               (SPADCALL |jv| (QREFELT $ 76)))
                                          . #22#)
                                    (LETT #6# (QREFELT $ 10) . #22#) G190
                                    (COND ((> |k| #6#) (GO G191)))
                                    (SEQ
                                     (LETT |newjv|
                                           (PROG2
                                               (LETT #4#
                                                     (SPADCALL |jv|
                                                               (PROG1
                                                                   (LETT #5#
                                                                         |k|
                                                                         . #22#)
                                                                 (|check_subtype2|
                                                                  (> #5# 0)
                                                                  '(|PositiveInteger|)
                                                                  '(|NonNegativeInteger|)
                                                                  #5#))
                                                               (QREFELT $ 78))
                                                     . #22#)
                                               (QCDR #4#)
                                             (|check_union2| (QEQCAR #4# 0)
                                                             (QREFELT $ 6)
                                                             (|Union|
                                                              (QREFELT $ 6)
                                                              "0")
                                                             #4#))
                                           . #22#)
                                     (LETT |newco|
                                           (QCAR
                                            (SPADCALL |co|
                                                      (PROG1
                                                          (LETT #3# |k| . #22#)
                                                        (|check_subtype2|
                                                         (> #3# 0)
                                                         '(|PositiveInteger|)
                                                         '(|NonNegativeInteger|)
                                                         #3#))
                                                      |jm| (QREFELT $ 71)))
                                           . #22#)
                                     (SEQ (LETT |j| 1 . #22#)
                                          (LETT |i| NIL . #22#)
                                          (LETT #2# |ind1| . #22#) G190
                                          (COND
                                           ((OR (ATOM #2#)
                                                (PROGN
                                                 (LETT |i| (CAR #2#) . #22#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (LETT |nu|
                                                 (SPADCALL |mu| (QREFELT $ 79))
                                                 . #22#)
                                           (SPADCALL |nu| |i|
                                                     (+
                                                      (SPADCALL |nu| |i|
                                                                (QREFELT $ 80))
                                                      1)
                                                     (QREFELT $ 81))
                                           (EXIT
                                            (LETT |newco|
                                                  (SPADCALL |newco|
                                                            (SPADCALL
                                                             (QAREF2O |dxi| |j|
                                                                      |k| 1 1)
                                                             (SPADCALL
                                                              (SPADCALL |a|
                                                                        |nu|
                                                                        (QREFELT
                                                                         $ 82))
                                                              (QREFELT $ 83))
                                                             (QREFELT $ 62))
                                                            (QREFELT $ 84))
                                                  . #22#)))
                                          (LETT #2#
                                                (PROG1 (CDR #2#)
                                                  (LETT |j| (|inc_SI| |j|)
                                                        . #22#))
                                                . #22#)
                                          (GO G190) G191 (EXIT NIL))
                                     (LETT |res|
                                           (SPADCALL |res|
                                                     (SPADCALL |newco|
                                                               (SPADCALL
                                                                |newjv|
                                                                (QREFELT $ 15))
                                                               (QREFELT $ 63))
                                                     (QREFELT $ 61))
                                           . #22#)
                                     (LETT |newCo| (CONS |newco| |newCo|)
                                           . #22#)
                                     (EXIT
                                      (LETT |newDir| (CONS |newjv| |newDir|)
                                            . #22#)))
                                    (LETT |k| (+ |k| 1) . #22#) (GO G190) G191
                                    (EXIT NIL))))
                                 (LETT #7#
                                       (PROG1 (CDR #7#)
                                         (LETT #8# (CDR #8#) . #22#))
                                       . #22#)
                                 (GO G190) G191 (EXIT NIL))
                            (LETT |oldCo| |newCo| . #22#)
                            (EXIT (LETT |oldDir| |newDir| . #22#)))
                       (LETT |qq| (|inc_SI| |qq|) . #22#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT |res|))))))) 

(SDEFUN |JVF;eval;$2D;17| ((|v| $) (|f| D) ($ D))
        (SPROG
         ((|res| (D)) (#1=#:G843 NIL) (|c| NIL) (#2=#:G844 NIL) (|jb| NIL))
         (SEQ (LETT |res| (|spadConstant| $ 32) . #3=(|JVF;eval;$2D;17|))
              (SEQ (LETT |jb| NIL . #3#) (LETT #2# (QCDR |v|) . #3#)
                   (LETT |c| NIL . #3#) (LETT #1# (QCAR |v|) . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL)
                         (ATOM #2#) (PROGN (LETT |jb| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (SPADCALL |c|
                                               (SPADCALL |f| |jb|
                                                         (QREFELT $ 86))
                                               (QREFELT $ 62))
                                     (QREFELT $ 57))
                           . #3#)))
                   (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#))
                         . #3#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |JVF;commutator;3$;18| ((|v| $) (|w| $) ($ $))
        (SPROG
         ((|res2| ($)) (|rjb| (|List| JB)) (|rco| (|List| D)) (|sum| (D))
          (#1=#:G861 NIL) (|c1| NIL) (#2=#:G862 NIL) (|j1| NIL) (#3=#:G859 NIL)
          (|c2| NIL) (#4=#:G860 NIL) (|j2| NIL) (|res1| ($)) (#5=#:G857 NIL)
          (#6=#:G858 NIL) (#7=#:G855 NIL) (#8=#:G856 NIL))
         (SEQ (LETT |rco| NIL . #9=(|JVF;commutator;3$;18|))
              (LETT |rjb| NIL . #9#)
              (SEQ (LETT |j1| NIL . #9#) (LETT #8# (QCDR |v|) . #9#)
                   (LETT |c1| NIL . #9#) (LETT #7# (QCAR |v|) . #9#) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |c1| (CAR #7#) . #9#) NIL)
                         (ATOM #8#) (PROGN (LETT |j1| (CAR #8#) . #9#) NIL))
                     (GO G191)))
                   (SEQ (LETT |sum| (|spadConstant| $ 32) . #9#)
                        (SEQ (LETT |j2| NIL . #9#) (LETT #6# (QCDR |w|) . #9#)
                             (LETT |c2| NIL . #9#) (LETT #5# (QCAR |w|) . #9#)
                             G190
                             (COND
                              ((OR (ATOM #5#)
                                   (PROGN (LETT |c2| (CAR #5#) . #9#) NIL)
                                   (ATOM #6#)
                                   (PROGN (LETT |j2| (CAR #6#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |sum|
                                     (SPADCALL |sum|
                                               (SPADCALL |c2|
                                                         (SPADCALL |c1| |j2|
                                                                   (QREFELT $
                                                                            86))
                                                         (QREFELT $ 62))
                                               (QREFELT $ 57))
                                     . #9#)))
                             (LETT #5#
                                   (PROG1 (CDR #5#) (LETT #6# (CDR #6#) . #9#))
                                   . #9#)
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |sum| (QREFELT $ 58)))
                           (SEQ (LETT |rco| (CONS |sum| |rco|) . #9#)
                                (EXIT
                                 (LETT |rjb| (CONS |j1| |rjb|) . #9#)))))))
                   (LETT #7# (PROG1 (CDR #7#) (LETT #8# (CDR #8#) . #9#))
                         . #9#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |res1| (CONS (NREVERSE |rco|) (NREVERSE |rjb|)) . #9#)
              (LETT |rco| NIL . #9#) (LETT |rjb| NIL . #9#)
              (SEQ (LETT |j2| NIL . #9#) (LETT #4# (QCDR |w|) . #9#)
                   (LETT |c2| NIL . #9#) (LETT #3# (QCAR |w|) . #9#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |c2| (CAR #3#) . #9#) NIL)
                         (ATOM #4#) (PROGN (LETT |j2| (CAR #4#) . #9#) NIL))
                     (GO G191)))
                   (SEQ (LETT |sum| (|spadConstant| $ 32) . #9#)
                        (SEQ (LETT |j1| NIL . #9#) (LETT #2# (QCDR |v|) . #9#)
                             (LETT |c1| NIL . #9#) (LETT #1# (QCAR |v|) . #9#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |c1| (CAR #1#) . #9#) NIL)
                                   (ATOM #2#)
                                   (PROGN (LETT |j1| (CAR #2#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |sum|
                                     (SPADCALL |sum|
                                               (SPADCALL |c1|
                                                         (SPADCALL |c2| |j1|
                                                                   (QREFELT $
                                                                            86))
                                                         (QREFELT $ 62))
                                               (QREFELT $ 57))
                                     . #9#)))
                             (LETT #1#
                                   (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #9#))
                                   . #9#)
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |sum| (QREFELT $ 58)))
                           (SEQ (LETT |rco| (CONS |sum| |rco|) . #9#)
                                (EXIT
                                 (LETT |rjb| (CONS |j2| |rjb|) . #9#)))))))
                   (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#) . #9#))
                         . #9#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |res2| (CONS (NREVERSE |rco|) (NREVERSE |rjb|)) . #9#)
              (EXIT (SPADCALL |res2| |res1| (QREFELT $ 88)))))) 

(SDEFUN |JVF;table;LTda;19| ((|lv| |List| $) ($ |TwoDimensionalArray| $))
        (SPROG
         ((|c| ($)) (#1=#:G873 NIL) (|v2| NIL) (|j| NIL) (|v1| ($)) (|i| NIL)
          (#2=#:G872 NIL) (|res| (|TwoDimensionalArray| $))
          (|len| (|NonNegativeInteger|)))
         (SEQ
          (LETT |len| (SPADCALL |lv| (QREFELT $ 91))
                . #3=(|JVF;table;LTda;19|))
          (EXIT
           (COND ((ZEROP |len|) (|error| "empty list in table"))
                 ('T
                  (SEQ
                   (LETT |res|
                         (SPADCALL |len| |len| (|spadConstant| $ 51)
                                   (QREFELT $ 93))
                         . #3#)
                   (SEQ (LETT #2# NIL . #3#) (LETT |i| 1 . #3#) G190
                        (COND (#2# (GO G191)))
                        (SEQ (LETT |v1| (SPADCALL |lv| (QREFELT $ 94)) . #3#)
                             (LETT |lv| (SPADCALL |lv| (QREFELT $ 95)) . #3#)
                             (EXIT
                              (SEQ (LETT |j| (+ |i| 1) . #3#)
                                   (LETT |v2| NIL . #3#) (LETT #1# |lv| . #3#)
                                   G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |v2| (CAR #1#) . #3#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |c|
                                          (SPADCALL |v1| |v2| (QREFELT $ 89))
                                          . #3#)
                                    (SPADCALL |res| |i| |j| |c| (QREFELT $ 96))
                                    (EXIT
                                     (SPADCALL |res| |j| |i|
                                               (SPADCALL |c| (QREFELT $ 54))
                                               (QREFELT $ 96))))
                                   (LETT #1#
                                         (PROG1 (CDR #1#)
                                           (LETT |j| (+ |j| 1) . #3#))
                                         . #3#)
                                   (GO G190) G191 (EXIT NIL))))
                        (LETT |i|
                              (PROG1 (|inc_SI| |i|)
                                (LETT #2# (SPADCALL |lv| (QREFELT $ 97))
                                      . #3#))
                              . #3#)
                        (GO G190) G191 (EXIT NIL))
                   (EXIT |res|)))))))) 

(SDEFUN |JVF;lie;3$;20| ((|v| $) (|w| $) ($ $))
        (SPADCALL |v| |w| (QREFELT $ 89))) 

(DECLAIM (NOTINLINE |JetVectorField;|)) 

(DEFUN |JetVectorField| (&REST #1=#:G879)
  (SPROG NIL
         (PROG (#2=#:G880)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|JetVectorField|)
                                               '|domainEqualList|)
                    . #3=(|JetVectorField|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |JetVectorField;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|JetVectorField|)))))))))) 

(DEFUN |JetVectorField;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G878 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #2=(|JetVectorField|))
    (LETT DV$2 (|devaluate| |#2|) . #2#)
    (LETT |dv$| (LIST '|JetVectorField| DV$1 DV$2) . #2#)
    (LETT $ (GETREFV 104) . #2#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2| '(|AbelianGroup|))
                                        (LETT #1#
                                              (|HasCategory| |#2|
                                                             '(|AbelianMonoid|))
                                              . #2#)
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #1#)))
                    . #2#))
    (|haddProp| |$ConstructorCache| '|JetVectorField| (LIST DV$1 DV$2)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 10 (SPADCALL (QREFELT $ 9)))
    (QSETREFV $ 12 (SPADCALL (QREFELT $ 11)))
    (QSETREFV $ 13
              (|Record| (|:| |Coeff| (|List| |#2|)) (|:| |Dir| (|List| |#1|))))
    $))) 

(MAKEPROP '|JetVectorField| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|PositiveInteger|) (0 . |numIndVar|) '|nn| (4 . |numDepVar|)
              '|mm| '|Rep| (8 . |One|) |JVF;diff;JB$;1| (12 . X)
              |JVF;diffX;Pi$;2| (17 . U) |JVF;diffU;Pi$;3| (|List| 75) (22 . P)
              |JVF;diffP;PiL$;4| (|Boolean|) (28 . |one?|) (|String|)
              (|OutputForm|) (33 . |message|) (38 . |coerce|) (43 . |sub|)
              (49 . |coerce|) (54 . *) (60 . |Zero|) (64 . +)
              (|Mapping| 26 26 26) (|List| 26) (70 . |reduce|)
              |JVF;coerce;$Of;6| (|List| 7) (76 . |copy|)
              |JVF;coefficients;$L;7| (|List| 6) (81 . |copy|)
              |JVF;directions;$L;8| (|Integer|) (86 . |position|)
              (92 . |minIndex|) (97 . |qelt|) |JVF;coefficient;$JBD;9|
              |JVF;copy;2$;10| (103 . |empty|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |JVF;Zero;$;11|) $))
              |JVF;zero?;$B;12| (107 . -) |JVF;-;2$;13| (112 . <) (118 . =)
              (124 . +) (130 . |zero?|) (135 . |concat!|) (141 . |concat!|)
              |JVF;+;3$;14| (147 . *) |JVF;*;D2$;15| (|Symbol|) (153 . |type|)
              (158 . |index|) (|SparseEchelonMatrix| 6 $) (|List| $)
              (163 . |jacobiMatrix|) (|Record| (|:| |DPhi| $) (|:| |JVars| 41))
              (168 . |formalDiff2|) (175 . >) (181 . |One|)
              (185 . |multiIndex|) (|NonNegativeInteger|) (190 . |class|)
              (|Union| $ '"0") (195 . |differentiate|) (201 . |copy|)
              (206 . |qelt|) (212 . |qsetelt!|) (219 . |Pm|) (225 . |coerce|)
              (230 . -) |JVF;prolong;$Nni$;16| (236 . |differentiate|)
              |JVF;eval;$2D;17| (242 . -) |JVF;commutator;3$;18| (|List| $$)
              (248 . |#|) (|TwoDimensionalArray| $$) (253 . |new|)
              (260 . |first|) (265 . |rest|) (270 . |qsetelt!|)
              (278 . |empty?|) (|TwoDimensionalArray| $) |JVF;table;LTda;19|
              |JVF;lie;3$;20| (|Union| $ '"failed") (|HashState|)
              (|SingleInteger|))
           '#(~= 283 |zero?| 289 |table| 294 |subtractIfCan| 299 |sample| 305
              |prolong| 309 |opposite?| 315 |lie| 321 |latex| 327 |hashUpdate!|
              332 |hash| 338 |eval| 343 |directions| 349 |diffX| 354 |diffU|
              359 |diffP| 364 |diff| 370 |copy| 375 |commutator| 380 |coerce|
              386 |coefficients| 391 |coefficient| 396 |Zero| 402 = 406 - 412 +
              423 * 429)
           'NIL
           (CONS (|makeByteWordVec2| 3 '(0 0 0 0 1 1 3 0 0 0 0))
                 (CONS
                  '#(|Module&| NIL NIL NIL |AbelianGroup&| NIL |AbelianMonoid&|
                     |AbelianSemiGroup&| |SetCategory&| |BasicType&| NIL)
                  (CONS
                   '#((|Module| 7) (|BiModule| 7 7) (|LeftModule| 7)
                      (|RightModule| 7) (|AbelianGroup|)
                      (|CancellationAbelianMonoid|) (|AbelianMonoid|)
                      (|AbelianSemiGroup|) (|SetCategory|) (|BasicType|)
                      (|CoercibleTo| 26))
                   (|makeByteWordVec2| 103
                                       '(0 6 8 9 0 6 8 11 0 7 0 14 1 6 0 8 16 1
                                         6 0 8 18 2 6 0 8 20 21 1 7 23 0 24 1
                                         26 0 25 27 1 6 26 0 28 2 26 0 0 0 29 1
                                         7 26 0 30 2 26 0 0 0 31 0 7 0 32 2 26
                                         0 0 0 33 2 35 26 34 0 36 1 38 0 0 39 1
                                         41 0 0 42 2 41 44 6 0 45 1 41 44 0 46
                                         2 38 7 0 44 47 0 26 0 50 1 7 0 0 53 2
                                         6 23 0 0 55 2 6 23 0 0 56 2 7 0 0 0 57
                                         1 7 23 0 58 2 38 0 0 0 59 2 41 0 0 0
                                         60 2 7 0 0 0 62 1 6 64 0 65 1 6 8 0 66
                                         1 7 67 68 69 3 7 70 0 8 67 71 2 44 23
                                         0 0 72 0 6 0 73 1 6 20 0 74 1 6 75 0
                                         76 2 6 77 0 8 78 1 20 0 0 79 2 20 75 0
                                         44 80 3 20 75 0 44 75 81 2 6 0 8 20 82
                                         1 7 0 6 83 2 7 0 0 0 84 2 7 0 0 6 86 2
                                         0 0 0 0 88 1 90 75 0 91 3 92 0 75 75 2
                                         93 1 90 2 0 94 1 90 0 0 95 4 92 2 0 44
                                         44 2 96 1 90 23 0 97 2 0 23 0 0 1 1 2
                                         23 0 52 1 0 98 68 99 2 1 101 0 0 1 0 2
                                         0 1 2 0 0 0 75 85 2 2 23 0 0 1 2 0 0 0
                                         0 100 1 0 25 0 1 2 0 102 102 0 1 1 0
                                         103 0 1 2 0 7 0 7 87 1 0 41 0 43 1 0 0
                                         8 17 1 0 0 8 19 2 0 0 8 20 22 1 0 0 6
                                         15 1 0 0 0 49 2 0 0 0 0 89 1 0 26 0 37
                                         1 0 38 0 40 2 0 7 0 6 48 0 2 0 51 2 0
                                         23 0 0 1 2 1 0 0 0 88 1 1 0 0 54 2 0 0
                                         0 0 61 2 1 0 44 0 1 2 2 0 75 0 1 2 0 0
                                         0 7 1 2 0 0 7 0 63 2 0 0 8 0 1)))))
           '|lookupComplete|)) 
