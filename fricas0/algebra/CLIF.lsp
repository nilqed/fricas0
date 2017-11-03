
(SDEFUN |CLIF;characteristic;Nni;1| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 24))) 

(SDEFUN |CLIF;dimension| (($ |CardinalNumber|))
        (SPADCALL (QREFELT $ 21) (QREFELT $ 27))) 

(SDEFUN |CLIF;=;2$B;3| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G747 NIL) (#2=#:G748 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0 . #3=(|CLIF;=;2$B;3|))
                       (LETT #2# (- (QREFELT $ 21) 1) . #3#) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (QAREF1 |x| |i|) (QAREF1 |y| |i|)
                                     (QREFELT $ 28))
                           (PROGN (LETT #1# NIL . #3#) (GO #4=#:G746))))))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT 'T)))
                #4# (EXIT #1#)))) 

(SDEFUN |CLIF;+;3$;4| ((|x| $) (|y| $) ($ $))
        (SPROG ((#1=#:G752 NIL) (|i| NIL) (|z| ($)))
               (SEQ
                (LETT |z| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                      . #2=(|CLIF;+;3$;4|))
                (SEQ (LETT |i| 0 . #2#) (LETT #1# (- (QREFELT $ 21) 1) . #2#)
                     G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (QSETAREF1 |z| |i|
                                  (SPADCALL (QAREF1 |x| |i|) (QAREF1 |y| |i|)
                                            (QREFELT $ 31)))))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CLIF;-;3$;5| ((|x| $) (|y| $) ($ $))
        (SPROG ((#1=#:G756 NIL) (|i| NIL) (|z| ($)))
               (SEQ
                (LETT |z| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                      . #2=(|CLIF;-;3$;5|))
                (SEQ (LETT |i| 0 . #2#) (LETT #1# (- (QREFELT $ 21) 1) . #2#)
                     G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (QSETAREF1 |z| |i|
                                  (SPADCALL (QAREF1 |x| |i|) (QAREF1 |y| |i|)
                                            (QREFELT $ 33)))))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CLIF;-;2$;6| ((|x| $) ($ $))
        (SPROG ((#1=#:G760 NIL) (|i| NIL) (|z| ($)))
               (SEQ
                (LETT |z| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                      . #2=(|CLIF;-;2$;6|))
                (SEQ (LETT |i| 0 . #2#) (LETT #1# (- (QREFELT $ 21) 1) . #2#)
                     G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (QSETAREF1 |z| |i|
                                  (SPADCALL (QAREF1 |x| |i|) (QREFELT $ 35)))))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CLIF;*;I2$;7| ((|m| |Integer|) (|x| $) ($ $))
        (SPROG ((#1=#:G764 NIL) (|i| NIL) (|z| ($)))
               (SEQ
                (LETT |z| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                      . #2=(|CLIF;*;I2$;7|))
                (SEQ (LETT |i| 0 . #2#) (LETT #1# (- (QREFELT $ 21) 1) . #2#)
                     G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (QSETAREF1 |z| |i|
                                  (SPADCALL |m| (QAREF1 |x| |i|)
                                            (QREFELT $ 38)))))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CLIF;*;K2$;8| ((|c| K) (|x| $) ($ $))
        (SPROG ((#1=#:G768 NIL) (|i| NIL) (|z| ($)))
               (SEQ
                (LETT |z| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                      . #2=(|CLIF;*;K2$;8|))
                (SEQ (LETT |i| 0 . #2#) (LETT #1# (- (QREFELT $ 21) 1) . #2#)
                     G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (QSETAREF1 |z| |i|
                                  (SPADCALL |c| (QAREF1 |x| |i|)
                                            (QREFELT $ 40)))))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CLIF;Zero;$;9| (($ $)) (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))) 

(SDEFUN |CLIF;One;$;10| (($ $))
        (SPROG ((|z| ($)))
               (SEQ
                (LETT |z| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                      |CLIF;One;$;10|)
                (QSETAREF1 |z| 0 (|spadConstant| $ 43)) (EXIT |z|)))) 

(SDEFUN |CLIF;coerce;I$;11| ((|m| |Integer|) ($ $))
        (SPROG ((|z| ($)))
               (SEQ
                (LETT |z| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                      |CLIF;coerce;I$;11|)
                (QSETAREF1 |z| 0 (SPADCALL |m| (QREFELT $ 45))) (EXIT |z|)))) 

(SDEFUN |CLIF;coerce;K$;12| ((|c| K) ($ $))
        (SPROG ((|z| ($)))
               (SEQ
                (LETT |z| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                      |CLIF;coerce;K$;12|)
                (QSETAREF1 |z| 0 |c|) (EXIT |z|)))) 

(SDEFUN |CLIF;toStringTerm| ((|c| K) (|b| |SingleInteger|) ($ |String|))
        (SPROG ((|mult| (|String|)) (#1=#:G784 NIL) (|i| NIL))
               (SEQ
                (LETT |mult| (|mathObject2String| |c|)
                      . #2=(|CLIF;toStringTerm|))
                (EXIT
                 (COND ((|eql_SI| |b| 0) |mult|)
                       ((SPADCALL |c| (|spadConstant| $ 30) (QREFELT $ 48))
                        "0")
                       ('T
                        (SEQ
                         (COND
                          ((SPADCALL |c| (|spadConstant| $ 43) (QREFELT $ 48))
                           (LETT |mult| "e" . #2#)))
                         (COND
                          ((SPADCALL |c|
                                     (SPADCALL (|spadConstant| $ 43)
                                               (QREFELT $ 35))
                                     (QREFELT $ 48))
                           (LETT |mult| "-e" . #2#)))
                         (COND
                          ((SPADCALL |c| (|spadConstant| $ 43) (QREFELT $ 28))
                           (COND
                            ((SPADCALL |c|
                                       (SPADCALL (|spadConstant| $ 43)
                                                 (QREFELT $ 35))
                                       (QREFELT $ 28))
                             (LETT |mult| (STRCONC |mult| "e") . #2#)))))
                         (SEQ (LETT |i| 0 . #2#)
                              (LETT #1# (- (QREFELT $ 6) 1) . #2#) G190
                              (COND ((|greater_SI| |i| #1#) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |b| |i| (QREFELT $ 49))
                                  (LETT |mult|
                                        (STRCONC |mult|
                                                 (STRINGIMAGE (+ |i| 1)))
                                        . #2#)))))
                              (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT |mult|)))))))) 

(SDEFUN |CLIF;toString| ((|m| $) ($ |String|))
        (SPROG
         ((|res| (|String|)) (|neg| (|Boolean|)) (|s| (|String|))
          (#1=#:G796 NIL) (|im| NIL))
         (SEQ (LETT |res| "" . #2=(|CLIF;toString|))
              (SEQ (LETT |im| 0 . #2#) (LETT #1# (- (QREFELT $ 21) 1) . #2#)
                   G190 (COND ((|greater_SI| |im| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (QAREF1 |m| |im|) (|spadConstant| $ 30)
                                 (QREFELT $ 28))
                       (SEQ
                        (LETT |s| (|mathObject2String| (QAREF1 |m| |im|))
                              . #2#)
                        (LETT |neg| NIL . #2#)
                        (COND
                         ((SPADCALL (QCSIZE |s|) 0 (QREFELT $ 50))
                          (LETT |neg|
                                (|eql_SI| (SPADCALL |s| 1 (QREFELT $ 53))
                                          (|STR_to_CHAR| "-"))
                                . #2#)))
                        (COND
                         ((SPADCALL |res| "" (QREFELT $ 54))
                          (COND
                           ((NULL |neg|)
                            (LETT |res|
                                  (SPADCALL
                                   (LIST |res| "+"
                                         (|CLIF;toStringTerm| (QAREF1 |m| |im|)
                                          (SPADCALL |im| (QREFELT $ 56)) $))
                                   (QREFELT $ 58))
                                  . #2#)))))
                        (EXIT
                         (COND
                          ((OR (EQUAL |res| "") |neg|)
                           (LETT |res|
                                 (STRCONC |res|
                                          (|CLIF;toStringTerm|
                                           (QAREF1 |m| |im|)
                                           (SPADCALL |im| (QREFELT $ 56)) $))
                                 . #2#)))))))))
                   (LETT |im| (|inc_SI| |im|) . #2#) (GO G190) G191 (EXIT NIL))
              (COND ((EQUAL |res| "") (LETT |res| "0" . #2#))) (EXIT |res|)))) 

(SDEFUN |CLIF;e;Pi$;15| ((|b| |PositiveInteger|) ($ $))
        (SPROG ((|z| ($)) (|iz| (|PositiveInteger|)) (#1=#:G798 NIL))
               (SEQ
                (COND
                 ((SPADCALL |b| (QREFELT $ 6) (QREFELT $ 50))
                  (|error| "No such basis element"))
                 ('T
                  (SEQ
                   (LETT |iz|
                         (EXPT 2
                               (PROG1
                                   (LETT #1# (- |b| 1) . #2=(|CLIF;e;Pi$;15|))
                                 (|check_subtype2| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #1#)))
                         . #2#)
                   (LETT |z| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                         . #2#)
                   (QSETAREF1 |z| |iz| (|spadConstant| $ 43)) (EXIT |z|))))))) 

(SDEFUN |CLIF;ee;L$;16| ((|l| |List| (|PositiveInteger|)) ($ $))
        (SPROG ((|lst| (|List| $)) (#1=#:G811 NIL) (|i| NIL) (#2=#:G810 NIL))
               (SEQ
                (LETT |lst|
                      (PROGN
                       (LETT #2# NIL . #3=(|CLIF;ee;L$;16|))
                       (SEQ (LETT |i| NIL . #3#) (LETT #1# |l| . #3#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |i| (CAR #1#) . #3#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS (SPADCALL |i| (QREFELT $ 59)) #2#)
                                    . #3#)))
                            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      . #3#)
                (EXIT
                 (SPADCALL (ELT $ 60) |lst| (|spadConstant| $ 44)
                           (QREFELT $ 63)))))) 

(SDEFUN |CLIF;multivector;L$;17| ((|scalar| |List| K) ($ $))
        (SPROG ((#1=#:G823 NIL) (|i| NIL) (|z| ($)))
               (SEQ
                (LETT |z| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                      . #2=(|CLIF;multivector;L$;17|))
                (SEQ (LETT |i| 0 . #2#) (LETT #1# (- (QREFELT $ 21) 1) . #2#)
                     G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (QSETAREF1 |z| |i|
                                  (SPADCALL |scalar| (+ |i| 1)
                                            (QREFELT $ 67)))))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CLIF;eFromBinaryMap;Nni$;18| ((|b| |NonNegativeInteger|) ($ $))
        (SPROG ((|z| ($)))
               (SEQ
                (COND ((>= |b| (QREFELT $ 21)) (|error| "Too big"))
                      ('T
                       (SEQ
                        (LETT |z|
                              (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                              |CLIF;eFromBinaryMap;Nni$;18|)
                        (QSETAREF1 |z| |b| (|spadConstant| $ 43))
                        (EXIT |z|))))))) 

(SDEFUN |CLIF;ePseudoscalar;$;19| (($ $))
        (SPROG ((|i| (|NonNegativeInteger|)) (#1=#:G826 NIL) (|p| ($)))
               (SEQ
                (LETT |p| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                      . #2=(|CLIF;ePseudoscalar;$;19|))
                (LETT |i|
                      (PROG1 (LETT #1# (- (QREFELT $ 21) 1) . #2#)
                        (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #1#))
                      . #2#)
                (QSETAREF1 |p| |i| (|spadConstant| $ 43)) (EXIT |p|)))) 

(SDEFUN |CLIF;toTable;MM;20| ((|fn| |Mapping| $ $ $) ($ |Matrix| $))
        (SPROG
         ((#1=#:G841 NIL) (|j| NIL) (#2=#:G840 NIL) (#3=#:G839 NIL) (|k| NIL)
          (#4=#:G838 NIL) (|l| (|List| $)) (#5=#:G837 NIL) (|i| NIL)
          (#6=#:G836 NIL))
         (SEQ
          (LETT |l|
                (PROGN
                 (LETT #6# NIL . #7=(|CLIF;toTable;MM;20|))
                 (SEQ (LETT |i| 0 . #7#) (LETT #5# (- (QREFELT $ 21) 1) . #7#)
                      G190 (COND ((|greater_SI| |i| #5#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6# (CONS (SPADCALL |i| (QREFELT $ 69)) #6#)
                              . #7#)))
                      (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #7#)
          (EXIT
           (SPADCALL
            (PROGN
             (LETT #4# NIL . #7#)
             (SEQ (LETT |k| NIL . #7#) (LETT #3# |l| . #7#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#) . #7#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #4#
                          (CONS
                           (PROGN
                            (LETT #2# NIL . #7#)
                            (SEQ (LETT |j| NIL . #7#) (LETT #1# |l| . #7#) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |j| (CAR #1#) . #7#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2# (CONS (SPADCALL |k| |j| |fn|) #2#)
                                         . #7#)))
                                 (LETT #1# (CDR #1#) . #7#) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           #4#)
                          . #7#)))
                  (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            (QREFELT $ 73)))))) 

(SDEFUN |CLIF;toTable;MM;21| ((|fn| |Mapping| $ $) ($ |Matrix| $))
        (SPROG
         ((#1=#:G853 NIL) (|k| NIL) (#2=#:G852 NIL) (#3=#:G851 NIL) (|j| NIL)
          (#4=#:G850 NIL) (|l| (|List| $)) (#5=#:G849 NIL) (|i| NIL)
          (#6=#:G848 NIL))
         (SEQ
          (LETT |l|
                (PROGN
                 (LETT #6# NIL . #7=(|CLIF;toTable;MM;21|))
                 (SEQ (LETT |i| 0 . #7#) (LETT #5# (- (QREFELT $ 21) 1) . #7#)
                      G190 (COND ((|greater_SI| |i| #5#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6# (CONS (SPADCALL |i| (QREFELT $ 69)) #6#)
                              . #7#)))
                      (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #7#)
          (EXIT
           (SPADCALL
            (LIST
             (PROGN
              (LETT #4# NIL . #7#)
              (SEQ (LETT |j| NIL . #7#) (LETT #3# |l| . #7#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |j| (CAR #3#) . #7#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (LETT #4# (CONS |j| #4#) . #7#)))
                   (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                   (EXIT (NREVERSE #4#))))
             (PROGN
              (LETT #2# NIL . #7#)
              (SEQ (LETT |k| NIL . #7#) (LETT #1# |l| . #7#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #7#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (LETT #2# (CONS (SPADCALL |k| |fn|) #2#) . #7#)))
                   (LETT #1# (CDR #1#) . #7#) (GO G190) G191
                   (EXIT (NREVERSE #2#)))))
            (QREFELT $ 73)))))) 

(SDEFUN |CLIF;gradeTerm| ((|b| |SingleInteger|) ($ |NonNegativeInteger|))
        (SPROG ((|grade| (|NonNegativeInteger|)) (#1=#:G858 NIL) (|i| NIL))
               (SEQ (LETT |grade| 0 . #2=(|CLIF;gradeTerm|))
                    (SEQ (LETT |i| 0 . #2#)
                         (LETT #1# (- (QREFELT $ 6) 1) . #2#) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |b| |i| (QREFELT $ 49))
                             (LETT |grade| (+ |grade| 1) . #2#)))))
                         (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT |grade|)))) 

(SDEFUN |CLIF;grade;$Nni;23| ((|x| $) ($ |NonNegativeInteger|))
        (SPROG ((|gr| (|NonNegativeInteger|)) (#1=#:G863 NIL) (|ix| NIL))
               (SEQ (LETT |gr| 0 . #2=(|CLIF;grade;$Nni;23|))
                    (SEQ (LETT |ix| 0 . #2#)
                         (LETT #1# (- (QREFELT $ 21) 1) . #2#) G190
                         (COND ((|greater_SI| |ix| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (QAREF1 |x| |ix|) (|spadConstant| $ 30)
                                       (QREFELT $ 28))
                             (LETT |gr|
                                   (MAX |gr|
                                        (|CLIF;gradeTerm|
                                         (SPADCALL |ix| (QREFELT $ 56)) $))
                                   . #2#)))))
                         (LETT |ix| (|inc_SI| |ix|) . #2#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT |gr|)))) 

(SDEFUN |CLIF;gradeInvolutionTerm| ((|mult| K) (|type1| |SingleInteger|) ($ $))
        (SPROG
         ((|resul| ($)) (|sign| (|Integer|)) (|g| (|NonNegativeInteger|)))
         (SEQ
          (LETT |resul| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                . #1=(|CLIF;gradeInvolutionTerm|))
          (QSETAREF1 |resul| |type1| |mult|)
          (LETT |g| (|CLIF;gradeTerm| |type1| $) . #1#)
          (LETT |sign| (COND ((ODDP |g|) -1) ('T 1)) . #1#)
          (LETT |resul| (SPADCALL |sign| |resul| (QREFELT $ 39)) . #1#)
          (EXIT |resul|)))) 

(SDEFUN |CLIF;gradeInvolution;2$;25| ((|x| $) ($ $))
        (SPROG ((|z| ($)) (#1=#:G871 NIL) (|ix| NIL))
               (SEQ
                (LETT |z| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                      . #2=(|CLIF;gradeInvolution;2$;25|))
                (SEQ (LETT |ix| 0 . #2#) (LETT #1# (- (QREFELT $ 21) 1) . #2#)
                     G190 (COND ((|greater_SI| |ix| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (QAREF1 |x| |ix|) (|spadConstant| $ 30)
                                   (QREFELT $ 28))
                         (LETT |z|
                               (SPADCALL |z|
                                         (|CLIF;gradeInvolutionTerm|
                                          (QAREF1 |x| |ix|)
                                          (SPADCALL |ix| (QREFELT $ 56)) $)
                                         (QREFELT $ 32))
                               . #2#)))))
                     (LETT |ix| (|inc_SI| |ix|) . #2#) (GO G190) G191
                     (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CLIF;reverseTerm| ((|mult| K) (|type1| |SingleInteger|) ($ $))
        (SPROG ((|resul| ($)) (|sign| (|Integer|)) (|g| (|SingleInteger|)))
               (SEQ
                (LETT |resul| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                      . #1=(|CLIF;reverseTerm|))
                (QSETAREF1 |resul| |type1| |mult|)
                (LETT |g|
                      (SPADCALL (|CLIF;gradeTerm| |type1| $) (QREFELT $ 56))
                      . #1#)
                (LETT |sign|
                      (COND ((|odd?_SI| (|lshift_SI| |g| -1)) -1) ('T 1))
                      . #1#)
                (LETT |resul| (SPADCALL |sign| |resul| (QREFELT $ 39)) . #1#)
                (EXIT |resul|)))) 

(SDEFUN |CLIF;reverse;2$;27| ((|x| $) ($ $))
        (SPROG ((|z| ($)) (#1=#:G879 NIL) (|ix| NIL))
               (SEQ
                (LETT |z| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                      . #2=(|CLIF;reverse;2$;27|))
                (SEQ (LETT |ix| 0 . #2#) (LETT #1# (- (QREFELT $ 21) 1) . #2#)
                     G190 (COND ((|greater_SI| |ix| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (QAREF1 |x| |ix|) (|spadConstant| $ 30)
                                   (QREFELT $ 28))
                         (LETT |z|
                               (SPADCALL |z|
                                         (|CLIF;reverseTerm| (QAREF1 |x| |ix|)
                                          (SPADCALL |ix| (QREFELT $ 56)) $)
                                         (QREFELT $ 32))
                               . #2#)))))
                     (LETT |ix| (|inc_SI| |ix|) . #2#) (GO G190) G191
                     (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CLIF;conjTerm| ((|mult| K) (|type1| |SingleInteger|) ($ $))
        (SPROG ((|resul| ($)) (|sign| (|Integer|)) (|g| (|SingleInteger|)))
               (SEQ
                (LETT |resul| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                      . #1=(|CLIF;conjTerm|))
                (QSETAREF1 |resul| |type1| |mult|)
                (LETT |g|
                      (SPADCALL (|CLIF;gradeTerm| |type1| $) (QREFELT $ 56))
                      . #1#)
                (LETT |sign|
                      (COND ((|odd?_SI| (|lshift_SI| (|add_SI| |g| 1) -1)) -1)
                            ('T 1))
                      . #1#)
                (LETT |resul| (SPADCALL |sign| |resul| (QREFELT $ 39)) . #1#)
                (EXIT |resul|)))) 

(SDEFUN |CLIF;conj;2$;29| ((|x| $) ($ $))
        (SPROG ((|z| ($)) (#1=#:G887 NIL) (|ix| NIL))
               (SEQ
                (LETT |z| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                      . #2=(|CLIF;conj;2$;29|))
                (SEQ (LETT |ix| 0 . #2#) (LETT #1# (- (QREFELT $ 21) 1) . #2#)
                     G190 (COND ((|greater_SI| |ix| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (QAREF1 |x| |ix|) (|spadConstant| $ 30)
                                   (QREFELT $ 28))
                         (LETT |z|
                               (SPADCALL |z|
                                         (|CLIF;conjTerm| (QAREF1 |x| |ix|)
                                          (SPADCALL |ix| (QREFELT $ 56)) $)
                                         (QREFELT $ 32))
                               . #2#)))))
                     (LETT |ix| (|inc_SI| |ix|) . #2#) (GO G190) G191
                     (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CLIF;setMode;S2B;30| ((|s| |String|) (|val| |Boolean|) ($ |Boolean|))
        (SPROG ((#1=#:G892 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((EQUAL |s| "orthogonal")
                    (SEQ (SETELT $ 17 |val|)
                         (EXIT
                          (PROGN
                           (LETT #1# 'T . #2=(|CLIF;setMode;S2B;30|))
                           (GO #3=#:G891))))))
                  (COND
                   ((EQUAL |s| "debug")
                    (SEQ (SETELT $ 18 |val|)
                         (EXIT (PROGN (LETT #1# 'T . #2#) (GO #3#))))))
                  (EXIT NIL)))
                #3# (EXIT #1#)))) 

(SDEFUN |CLIF;baseVect| ((|b| |SingleInteger|) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G897 NIL) (#2=#:G898 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0 . #3=(|CLIF;baseVect|))
                       (LETT #2# (- (QREFELT $ 6) 1) . #3#) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |b| |i| (QREFELT $ 49))
                           (PROGN
                            (LETT #1# (+ |i| 1) . #3#)
                            (GO #4=#:G896))))))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT 0)))
                #4# (EXIT #1#)))) 

(SDEFUN |CLIF;bilinear| ((|b1| |SingleInteger|) (|b2| |SingleInteger|) ($ K))
        (SPROG ((#1=#:G903 NIL) (|bv2| #2=(|NonNegativeInteger|)) (|bv1| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |bv1| (|CLIF;baseVect| |b1| $) . #3=(|CLIF;bilinear|))
                  (LETT |bv2| (|CLIF;baseVect| |b2| $) . #3#)
                  (COND
                   ((EQL |bv1| 0)
                    (PROGN
                     (LETT #1# (|spadConstant| $ 30) . #3#)
                     (GO #4=#:G902))))
                  (COND
                   ((EQL |bv2| 0)
                    (PROGN (LETT #1# (|spadConstant| $ 30) . #3#) (GO #4#))))
                  (EXIT (SPADCALL (QREFELT $ 8) |bv1| |bv2| (QREFELT $ 84)))))
                #4# (EXIT #1#)))) 

(SDEFUN |CLIF;leftMostBase| ((|b| |SingleInteger|) ($ |SingleInteger|))
        (SPROG
         ((|mask| (|SingleInteger|)) (#1=#:G909 NIL) (#2=#:G910 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |mask| 1 . #3=(|CLIF;leftMostBase|))
                (SEQ (LETT |i| 0 . #3#) (LETT #2# (- (QREFELT $ 6) 1) . #3#)
                     G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                     (SEQ
                      (COND
                       ((SPADCALL (|and_SI| |mask| |b|) 0 (QREFELT $ 85))
                        (PROGN (LETT #1# |mask| . #3#) (GO #4=#:G908))))
                      (EXIT (LETT |mask| (|lshift_SI| |mask| 1) . #3#)))
                     (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT 0)))
          #4# (EXIT #1#)))) 

(SDEFUN |CLIF;rightMostBase| ((|b| |SingleInteger|) ($ |SingleInteger|))
        (SPROG
         ((|mask| (|SingleInteger|)) (#1=#:G916 NIL) (#2=#:G917 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |mask|
                  (|lshift_SI| 1 (SPADCALL (- (QREFELT $ 6) 1) (QREFELT $ 56)))
                  . #3=(|CLIF;rightMostBase|))
            (SEQ (LETT |i| 0 . #3#) (LETT #2# (- (QREFELT $ 6) 1) . #3#) G190
                 (COND ((|greater_SI| |i| #2#) (GO G191)))
                 (SEQ
                  (COND
                   ((SPADCALL (|and_SI| |mask| |b|) 0 (QREFELT $ 85))
                    (PROGN (LETT #1# |mask| . #3#) (GO #4=#:G915))))
                  (EXIT (LETT |mask| (|lshift_SI| |mask| -1) . #3#)))
                 (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT 0)))
          #4# (EXIT #1#)))) 

(SDEFUN |CLIF;exteriorProdTerm|
        ((|op1mult| K) (|op1type| |SingleInteger|) (|op2mult| K)
         (|op2type| |SingleInteger|) ($ $))
        (SPROG
         ((|c| (K)) (|k| (|NonNegativeInteger|)) (#1=#:G927 NIL) (|j| NIL)
          (#2=#:G926 NIL) (#3=#:G925 NIL) (|i| NIL) (|bz| (|SingleInteger|))
          (|resul| ($)))
         (SEQ
          (LETT |resul| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                . #4=(|CLIF;exteriorProdTerm|))
          (EXIT
           (COND
            ((SPADCALL (|and_SI| |op1type| |op2type|) 0 (QREFELT $ 85))
             |resul|)
            ('T
             (SEQ
              (LETT |c| (SPADCALL |op1mult| |op2mult| (QREFELT $ 40)) . #4#)
              (LETT |bz| (|or_SI| |op1type| |op2type|) . #4#)
              (SEQ (LETT |i| 0 . #4#) (LETT #3# (- (QREFELT $ 6) 1) . #4#) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |op1type| |i| (QREFELT $ 49))
                       (SEQ (LETT |k| 0 . #4#)
                            (SEQ (LETT |j| (+ |i| 1) . #4#)
                                 (LETT #2# (- (QREFELT $ 6) 1) . #4#) G190
                                 (COND ((> |j| #2#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL |op1type| |j| (QREFELT $ 49))
                                     (LETT |k| (+ |k| 1) . #4#)))))
                                 (LETT |j| (+ |j| 1) . #4#) (GO G190) G191
                                 (EXIT NIL))
                            (SEQ (LETT |j| 0 . #4#) (LETT #1# (- |i| 1) . #4#)
                                 G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL |bz| |j| (QREFELT $ 49))
                                     (LETT |k| (+ |k| 1) . #4#)))))
                                 (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (COND
                              ((ODDP |k|)
                               (LETT |c| (SPADCALL |c| (QREFELT $ 35))
                                     . #4#)))))))))
                   (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
              (QSETAREF1 |resul| |bz|
                         (SPADCALL (QAREF1 |resul| |bz|) |c| (QREFELT $ 31)))
              (EXIT |resul|)))))))) 

(SDEFUN |CLIF;regressiveProdTerm|
        ((|op1mult| K) (|op1type| |SingleInteger|) (|op2mult| K)
         (|op2type| |SingleInteger|) ($ $))
        (SPROG ((|res| ($)) (|op2| ($)) (|op1| ($)))
               (SEQ
                (LETT |op1| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                      . #1=(|CLIF;regressiveProdTerm|))
                (QSETAREF1 |op1| |op1type| (|spadConstant| $ 43))
                (LETT |op2| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                      . #1#)
                (QSETAREF1 |op2| |op2type| (|spadConstant| $ 43))
                (LETT |res|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL |op2| (SPADCALL (QREFELT $ 70))
                                  (QREFELT $ 86))
                        (SPADCALL |op1| (SPADCALL (QREFELT $ 70))
                                  (QREFELT $ 86))
                        (QREFELT $ 60))
                       (SPADCALL (QREFELT $ 70)) (QREFELT $ 86))
                      . #1#)
                (LETT |res|
                      (SPADCALL (SPADCALL |op1mult| |op2mult| (QREFELT $ 40))
                                |res| (QREFELT $ 41))
                      . #1#)
                (EXIT |res|)))) 

(SDEFUN |CLIF;/\\;3$;37| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((|z| ($)) (#1=#:G937 NIL) (|iy| NIL) (#2=#:G936 NIL) (|ix| NIL))
         (SEQ
          (LETT |z| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                . #3=(|CLIF;/\\;3$;37|))
          (SEQ (LETT |ix| 0 . #3#) (LETT #2# (- (QREFELT $ 21) 1) . #3#) G190
               (COND ((|greater_SI| |ix| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (QAREF1 |x| |ix|) (|spadConstant| $ 30)
                             (QREFELT $ 28))
                   (SEQ (LETT |iy| 0 . #3#)
                        (LETT #1# (- (QREFELT $ 21) 1) . #3#) G190
                        (COND ((|greater_SI| |iy| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL (QAREF1 |y| |iy|) (|spadConstant| $ 30)
                                      (QREFELT $ 28))
                            (LETT |z|
                                  (SPADCALL |z|
                                            (|CLIF;exteriorProdTerm|
                                             (QAREF1 |x| |ix|)
                                             (SPADCALL |ix| (QREFELT $ 56))
                                             (QAREF1 |y| |iy|)
                                             (SPADCALL |iy| (QREFELT $ 56)) $)
                                            (QREFELT $ 32))
                                  . #3#)))))
                        (LETT |iy| (|inc_SI| |iy|) . #3#) (GO G190) G191
                        (EXIT NIL))))))
               (LETT |ix| (|inc_SI| |ix|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |z|)))) 

(SDEFUN |CLIF;\\/;3$;38| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((|z| ($)) (#1=#:G945 NIL) (|iy| NIL) (#2=#:G944 NIL) (|ix| NIL))
         (SEQ
          (LETT |z| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                . #3=(|CLIF;\\/;3$;38|))
          (SEQ (LETT |ix| 0 . #3#) (LETT #2# (- (QREFELT $ 21) 1) . #3#) G190
               (COND ((|greater_SI| |ix| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (QAREF1 |x| |ix|) (|spadConstant| $ 30)
                             (QREFELT $ 28))
                   (SEQ (LETT |iy| 0 . #3#)
                        (LETT #1# (- (QREFELT $ 21) 1) . #3#) G190
                        (COND ((|greater_SI| |iy| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL (QAREF1 |y| |iy|) (|spadConstant| $ 30)
                                      (QREFELT $ 28))
                            (LETT |z|
                                  (SPADCALL |z|
                                            (|CLIF;regressiveProdTerm|
                                             (QAREF1 |x| |ix|)
                                             (SPADCALL |ix| (QREFELT $ 56))
                                             (QAREF1 |y| |iy|)
                                             (SPADCALL |iy| (QREFELT $ 56)) $)
                                            (QREFELT $ 32))
                                  . #3#)))))
                        (LETT |iy| (|inc_SI| |iy|) . #3#) (GO G190) G191
                        (EXIT NIL))))))
               (LETT |ix| (|inc_SI| |ix|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |z|)))) 

(SDEFUN |CLIF;lcProdTerm|
        ((|op1mult| K) (|op1type| |SingleInteger|) (|op2mult| K)
         (|op2type| |SingleInteger|) ($ $))
        (SPROG
         ((|resul| ($)) (|inner2| ($)) (|vType| (|SingleInteger|))
          (|uType| (|SingleInteger|)) (#1=#:G952 NIL) (|inner4| ($))
          (|left| ($)) (|grade2| #2=(|NonNegativeInteger|)) (|grade1| #2#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |resul| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                  . #3=(|CLIF;lcProdTerm|))
            (LETT |grade1| (|CLIF;gradeTerm| |op1type| $) . #3#)
            (LETT |grade2| (|CLIF;gradeTerm| |op2type| $) . #3#)
            (COND
             ((EQL |grade1| 0)
              (SEQ
               (QSETAREF1 |resul| |op2type|
                          (SPADCALL (QAREF1 |resul| |op2type|)
                                    (SPADCALL |op1mult| |op2mult|
                                              (QREFELT $ 40))
                                    (QREFELT $ 31)))
               (EXIT (PROGN (LETT #1# |resul| . #3#) (GO #4=#:G951))))))
            (EXIT
             (COND ((EQL |grade2| 0) |resul|)
                   ('T
                    (SEQ
                     (COND
                      ((EQL |grade1| 1)
                       (COND
                        ((EQL |grade2| 1)
                         (SEQ
                          (QSETAREF1 |resul| 0
                                     (SPADCALL (QAREF1 |resul| 0)
                                               (SPADCALL
                                                (SPADCALL |op1mult| |op2mult|
                                                          (QREFELT $ 40))
                                                (|CLIF;bilinear| |op1type|
                                                 |op2type| $)
                                                (QREFELT $ 40))
                                               (QREFELT $ 31)))
                          (EXIT (PROGN (LETT #1# |resul| . #3#) (GO #4#))))))))
                     (COND
                      ((EQL |grade1| 1)
                       (SEQ
                        (LETT |uType| (|CLIF;leftMostBase| |op2type| $) . #3#)
                        (LETT |vType| (|xor_SI| |op2type| |uType|) . #3#)
                        (LETT |inner2|
                              (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                              . #3#)
                        (QSETAREF1 |inner2| |vType| (|spadConstant| $ 43))
                        (LETT |left|
                              (SPADCALL
                               (|CLIF;lcProdTerm| |op1mult| |op1type| |op2mult|
                                |uType| $)
                               |inner2| (QREFELT $ 60))
                              . #3#)
                        (LETT |inner4|
                              (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                              . #3#)
                        (QSETAREF1 |inner4| |uType| (|spadConstant| $ 43))
                        (LETT |resul|
                              (SPADCALL
                               (SPADCALL |resul| |left| (QREFELT $ 32))
                               (SPADCALL |inner4|
                                         (|CLIF;lcProdTerm|
                                          (SPADCALL |op1mult| (QREFELT $ 35))
                                          |op1type| |op2mult| |vType| $)
                                         (QREFELT $ 60))
                               (QREFELT $ 32))
                              . #3#)
                        (EXIT (PROGN (LETT #1# |resul| . #3#) (GO #4#))))))
                     (LETT |uType| (|CLIF;leftMostBase| |op1type| $) . #3#)
                     (LETT |vType| (|xor_SI| |op1type| |uType|) . #3#)
                     (LETT |inner2|
                           (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                           . #3#)
                     (QSETAREF1 |inner2| |uType| (|spadConstant| $ 43))
                     (LETT |resul|
                           (SPADCALL |resul|
                                     (SPADCALL |inner2|
                                               (|CLIF;lcProdTerm| |op1mult|
                                                |vType| |op2mult| |op2type| $)
                                               (QREFELT $ 88))
                                     (QREFELT $ 32))
                           . #3#)
                     (EXIT |resul|)))))))
          #4# (EXIT #1#)))) 

(SDEFUN |CLIF;rcProdTerm|
        ((|op1mult| K) (|op1type| |SingleInteger|) (|op2mult| K)
         (|op2type| |SingleInteger|) ($ $))
        (SPROG
         ((|s4| (|String|)) (|s3| #1=(|String|)) (|s2| #1#) (|s1| #1#)
          (|resul| ($)) (|inner2| ($)) (|vType| (|SingleInteger|))
          (|uType| (|SingleInteger|)) (#2=#:G961 NIL) (|inner4| ($))
          (|right| ($)) (|grade2| #3=(|NonNegativeInteger|)) (|grade1| #3#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |resul| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                  . #4=(|CLIF;rcProdTerm|))
            (LETT |grade1| (|CLIF;gradeTerm| |op1type| $) . #4#)
            (LETT |grade2| (|CLIF;gradeTerm| |op2type| $) . #4#)
            (COND
             ((EQL |grade2| 0)
              (SEQ
               (QSETAREF1 |resul| |op1type|
                          (SPADCALL (QAREF1 |resul| |op1type|)
                                    (SPADCALL |op1mult| |op2mult|
                                              (QREFELT $ 40))
                                    (QREFELT $ 31)))
               (EXIT (PROGN (LETT #2# |resul| . #4#) (GO #5=#:G960))))))
            (EXIT
             (COND ((EQL |grade1| 0) |resul|)
                   ('T
                    (SEQ
                     (COND
                      ((EQL |grade1| 1)
                       (COND
                        ((EQL |grade2| 1)
                         (SEQ
                          (QSETAREF1 |resul| 0
                                     (SPADCALL (QAREF1 |resul| 0)
                                               (SPADCALL
                                                (SPADCALL |op1mult| |op2mult|
                                                          (QREFELT $ 40))
                                                (|CLIF;bilinear| |op1type|
                                                 |op2type| $)
                                                (QREFELT $ 40))
                                               (QREFELT $ 31)))
                          (EXIT (PROGN (LETT #2# |resul| . #4#) (GO #5#))))))))
                     (COND
                      ((EQL |grade2| 1)
                       (SEQ
                        (LETT |uType| (|CLIF;rightMostBase| |op1type| $) . #4#)
                        (LETT |vType| (|xor_SI| |op1type| |uType|) . #4#)
                        (LETT |inner2|
                              (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                              . #4#)
                        (QSETAREF1 |inner2| |vType| (|spadConstant| $ 43))
                        (LETT |right|
                              (SPADCALL |inner2|
                                        (|CLIF;rcProdTerm| |op1mult| |uType|
                                         |op2mult| |op2type| $)
                                        (QREFELT $ 60))
                              . #4#)
                        (LETT |inner4|
                              (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                              . #4#)
                        (QSETAREF1 |inner4| |uType| (|spadConstant| $ 43))
                        (LETT |resul|
                              (SPADCALL
                               (SPADCALL |resul|
                                         (SPADCALL
                                          (|CLIF;rcProdTerm| |op1mult| |vType|
                                           (SPADCALL |op2mult| (QREFELT $ 35))
                                           |op2type| $)
                                          |inner4| (QREFELT $ 60))
                                         (QREFELT $ 32))
                               |right| (QREFELT $ 32))
                              . #4#)
                        (COND
                         ((QREFELT $ 18)
                          (SEQ
                           (LETT |s1|
                                 (SPADCALL
                                  (LIST
                                   (|CLIF;toStringTerm| |op1mult| |op1type| $)
                                   "L"
                                   (|CLIF;toStringTerm| |op2mult| |op2type| $))
                                  (QREFELT $ 58))
                                 . #4#)
                           (LETT |s2|
                                 (SPADCALL
                                  (LIST "= "
                                        (|CLIF;toStringTerm| |op1mult| |vType|
                                         $)
                                        "L"
                                        (|CLIF;toStringTerm|
                                         (SPADCALL |op2mult| (QREFELT $ 35))
                                         |op2type| $))
                                  (QREFELT $ 58))
                                 . #4#)
                           (LETT |s3|
                                 (SPADCALL
                                  (LIST "/\\" (|CLIF;toString| |inner4| $) "+"
                                        (|CLIF;toString| |right| $))
                                  (QREFELT $ 58))
                                 . #4#)
                           (LETT |s4| (STRCONC "=" (|CLIF;toString| |resul| $))
                                 . #4#)
                           (EXIT
                            (SPADCALL (LIST "rcProdTerm: " |s1| |s2| |s3| |s4|)
                                      (QREFELT $ 92))))))
                        (EXIT (PROGN (LETT #2# |resul| . #4#) (GO #5#))))))
                     (LETT |uType| (|CLIF;rightMostBase| |op2type| $) . #4#)
                     (LETT |vType| (|xor_SI| |op2type| |uType|) . #4#)
                     (LETT |inner2|
                           (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                           . #4#)
                     (QSETAREF1 |inner2| |uType| (|spadConstant| $ 43))
                     (LETT |resul|
                           (SPADCALL |resul|
                                     (SPADCALL
                                      (|CLIF;rcProdTerm| |op1mult| |op1type|
                                       |op2mult| |vType| $)
                                      |inner2| (QREFELT $ 93))
                                     (QREFELT $ 32))
                           . #4#)
                     (COND
                      ((QREFELT $ 18)
                       (SEQ
                        (LETT |s1|
                              (SPADCALL
                               (LIST
                                (|CLIF;toStringTerm| |op1mult| |op1type| $) "L"
                                (|CLIF;toStringTerm| |op2mult| |op2type| $))
                               (QREFELT $ 58))
                              . #4#)
                        (LETT |s2|
                              (SPADCALL
                               (LIST "= ("
                                     (|CLIF;toStringTerm| |op1mult| |op1type|
                                      $)
                                     "L"
                                     (|CLIF;toStringTerm| |op2mult| |vType| $))
                               (QREFELT $ 58))
                              . #4#)
                        (LETT |s3| (STRCONC ") L" (|CLIF;toString| |inner2| $))
                              . #4#)
                        (LETT |s4| (STRCONC "=" (|CLIF;toString| |resul| $))
                              . #4#)
                        (EXIT
                         (SPADCALL (LIST "rcProdTerm: " |s1| |s2| |s3| |s4|)
                                   (QREFELT $ 92))))))
                     (EXIT |resul|)))))))
          #5# (EXIT #2#)))) 

(SDEFUN |CLIF;lc;3$;41| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((|z| ($)) (#1=#:G969 NIL) (|iy| NIL) (#2=#:G968 NIL) (|ix| NIL))
         (SEQ
          (LETT |z| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                . #3=(|CLIF;lc;3$;41|))
          (SEQ (LETT |ix| 0 . #3#) (LETT #2# (- (QREFELT $ 21) 1) . #3#) G190
               (COND ((|greater_SI| |ix| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (QAREF1 |x| |ix|) (|spadConstant| $ 30)
                             (QREFELT $ 28))
                   (SEQ (LETT |iy| 0 . #3#)
                        (LETT #1# (- (QREFELT $ 21) 1) . #3#) G190
                        (COND ((|greater_SI| |iy| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL (QAREF1 |y| |iy|) (|spadConstant| $ 30)
                                      (QREFELT $ 28))
                            (LETT |z|
                                  (SPADCALL |z|
                                            (|CLIF;lcProdTerm|
                                             (QAREF1 |x| |ix|)
                                             (SPADCALL |ix| (QREFELT $ 56))
                                             (QAREF1 |y| |iy|)
                                             (SPADCALL |iy| (QREFELT $ 56)) $)
                                            (QREFELT $ 32))
                                  . #3#)))))
                        (LETT |iy| (|inc_SI| |iy|) . #3#) (GO G190) G191
                        (EXIT NIL))))))
               (LETT |ix| (|inc_SI| |ix|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |z|)))) 

(SDEFUN |CLIF;rc;3$;42| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((|z| ($)) (#1=#:G977 NIL) (|iy| NIL) (#2=#:G976 NIL) (|ix| NIL))
         (SEQ
          (LETT |z| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                . #3=(|CLIF;rc;3$;42|))
          (SEQ (LETT |ix| 0 . #3#) (LETT #2# (- (QREFELT $ 21) 1) . #3#) G190
               (COND ((|greater_SI| |ix| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (QAREF1 |x| |ix|) (|spadConstant| $ 30)
                             (QREFELT $ 28))
                   (SEQ (LETT |iy| 0 . #3#)
                        (LETT #1# (- (QREFELT $ 21) 1) . #3#) G190
                        (COND ((|greater_SI| |iy| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL (QAREF1 |y| |iy|) (|spadConstant| $ 30)
                                      (QREFELT $ 28))
                            (LETT |z|
                                  (SPADCALL |z|
                                            (|CLIF;rcProdTerm|
                                             (QAREF1 |x| |ix|)
                                             (SPADCALL |ix| (QREFELT $ 56))
                                             (QAREF1 |y| |iy|)
                                             (SPADCALL |iy| (QREFELT $ 56)) $)
                                            (QREFELT $ 32))
                                  . #3#)))))
                        (LETT |iy| (|inc_SI| |iy|) . #3#) (GO G190) G191
                        (EXIT NIL))))))
               (LETT |ix| (|inc_SI| |ix|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |z|)))) 

(SDEFUN |CLIF;cliffordProdTerm|
        ((|op1mult| K) (|op1type| |SingleInteger|) (|op2mult| K)
         (|op2type| |SingleInteger|) ($ $))
        (SPROG
         ((|resul| ($)) (|s4| #1=(|String|)) (|s3| #1#) (|s2| #1#) (|s1| #1#)
          (|factor2| ($)) (|factor1| ($)) (|vt| ($)) (|ut| ($))
          (|uType| (|SingleInteger|)) (|xType| (|SingleInteger|))
          (#2=#:G986 NIL) (|xt| ($)) (|vType| (|SingleInteger|))
          (|grade2| #3=(|NonNegativeInteger|)) (|grade1| #3#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |resul| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                  . #4=(|CLIF;cliffordProdTerm|))
            (LETT |grade1| (|CLIF;gradeTerm| |op1type| $) . #4#)
            (LETT |grade2| (|CLIF;gradeTerm| |op2type| $) . #4#)
            (COND
             ((EQL |grade1| 0)
              (SEQ
               (QSETAREF1 |resul| |op2type|
                          (SPADCALL (QAREF1 |resul| |op2type|)
                                    (SPADCALL |op1mult| |op2mult|
                                              (QREFELT $ 40))
                                    (QREFELT $ 31)))
               (EXIT (PROGN (LETT #2# |resul| . #4#) (GO #5=#:G985))))))
            (COND
             ((EQL |grade2| 0)
              (SEQ
               (QSETAREF1 |resul| |op1type|
                          (SPADCALL (QAREF1 |resul| |op1type|)
                                    (SPADCALL |op1mult| |op2mult|
                                              (QREFELT $ 40))
                                    (QREFELT $ 31)))
               (EXIT (PROGN (LETT #2# |resul| . #4#) (GO #5#))))))
            (COND
             ((EQL |grade1| 1)
              (COND
               ((EQL |grade2| 1)
                (SEQ
                 (QSETAREF1 |resul| 0
                            (SPADCALL (QAREF1 |resul| 0)
                                      (SPADCALL
                                       (SPADCALL |op1mult| |op2mult|
                                                 (QREFELT $ 40))
                                       (|CLIF;bilinear| |op1type| |op2type| $)
                                       (QREFELT $ 40))
                                      (QREFELT $ 31)))
                 (LETT |resul|
                       (SPADCALL |resul|
                                 (|CLIF;exteriorProdTerm| |op1mult| |op1type|
                                  |op2mult| |op2type| $)
                                 (QREFELT $ 32))
                       . #4#)
                 (EXIT (PROGN (LETT #2# |resul| . #4#) (GO #5#))))))))
            (COND
             ((EQL |grade1| 1)
              (SEQ (LETT |uType| (|CLIF;leftMostBase| |op2type| $) . #4#)
                   (LETT |vType| (|xor_SI| |op2type| |uType|) . #4#)
                   (LETT |xt| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                         . #4#)
                   (QSETAREF1 |xt| |op1type| (|spadConstant| $ 43))
                   (LETT |ut| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                         . #4#)
                   (QSETAREF1 |ut| |uType| (|spadConstant| $ 43))
                   (LETT |vt| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                         . #4#)
                   (QSETAREF1 |vt| |vType| (|spadConstant| $ 43))
                   (LETT |resul|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL |xt|
                                     (|CLIF;exteriorProdTerm|
                                      (|spadConstant| $ 43) |uType|
                                      (|spadConstant| $ 43) |vType| $)
                                     (QREFELT $ 60))
                           (SPADCALL
                            (|CLIF;lcProdTerm| (|spadConstant| $ 43) |op1type|
                             (|spadConstant| $ 43) |uType| $)
                            |vt| (QREFELT $ 60))
                           (QREFELT $ 32))
                          (SPADCALL
                           (|CLIF;gradeInvolutionTerm| (|spadConstant| $ 43)
                            |uType| $)
                           (|CLIF;lcProdTerm| (|spadConstant| $ 43) |op1type|
                            (|spadConstant| $ 43) |vType| $)
                           (QREFELT $ 60))
                          (QREFELT $ 32))
                         . #4#)
                   (LETT |resul|
                         (SPADCALL
                          (SPADCALL |op1mult| |op2mult| (QREFELT $ 40)) |resul|
                          (QREFELT $ 41))
                         . #4#)
                   (EXIT (PROGN (LETT #2# |resul| . #4#) (GO #5#))))))
            (COND
             ((EQL |grade2| 1)
              (SEQ (LETT |uType| (|CLIF;rightMostBase| |op1type| $) . #4#)
                   (LETT |vType| (|xor_SI| |op1type| |uType|) . #4#)
                   (LETT |xt| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                         . #4#)
                   (QSETAREF1 |xt| |op2type| (|spadConstant| $ 43))
                   (LETT |ut| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                         . #4#)
                   (QSETAREF1 |ut| |uType| (|spadConstant| $ 43))
                   (LETT |vt| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                         . #4#)
                   (QSETAREF1 |vt| |vType| (|spadConstant| $ 43))
                   (LETT |resul|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL
                            (|CLIF;exteriorProdTerm| (|spadConstant| $ 43)
                             |vType| (|spadConstant| $ 43) |uType| $)
                            |xt| (QREFELT $ 60))
                           (SPADCALL |vt|
                                     (|CLIF;rcProdTerm| (|spadConstant| $ 43)
                                      |uType| (|spadConstant| $ 43) |op2type|
                                      $)
                                     (QREFELT $ 60))
                           (QREFELT $ 32))
                          (SPADCALL
                           (|CLIF;rcProdTerm| (|spadConstant| $ 43) |vType|
                            (|spadConstant| $ 43) |op2type| $)
                           (|CLIF;gradeInvolutionTerm| (|spadConstant| $ 43)
                            |uType| $)
                           (QREFELT $ 60))
                          (QREFELT $ 32))
                         . #4#)
                   (LETT |resul|
                         (SPADCALL
                          (SPADCALL |op1mult| |op2mult| (QREFELT $ 40)) |resul|
                          (QREFELT $ 41))
                         . #4#)
                   (EXIT (PROGN (LETT #2# |resul| . #4#) (GO #5#))))))
            (LETT |xType| (|CLIF;rightMostBase| |op1type| $) . #4#)
            (LETT |uType| (|xor_SI| |op1type| |xType|) . #4#)
            (LETT |ut| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30)) . #4#)
            (QSETAREF1 |ut| |uType| (|spadConstant| $ 43))
            (LETT |vt| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30)) . #4#)
            (QSETAREF1 |vt| |op2type| (|spadConstant| $ 43))
            (LETT |factor1|
                  (SPADCALL
                   (|CLIF;lcProdTerm| (|spadConstant| $ 43) |xType|
                    (|spadConstant| $ 43) |op2type| $)
                   (|CLIF;exteriorProdTerm| (|spadConstant| $ 43) |xType|
                    (|spadConstant| $ 43) |op2type| $)
                   (QREFELT $ 32))
                  . #4#)
            (LETT |factor2|
                  (|CLIF;rcProdTerm| (|spadConstant| $ 43) |uType|
                   (|spadConstant| $ 43) |xType| $)
                  . #4#)
            (LETT |resul|
                  (SPADCALL (SPADCALL |ut| |factor1| (QREFELT $ 86))
                            (SPADCALL |factor2| |vt| (QREFELT $ 86))
                            (QREFELT $ 34))
                  . #4#)
            (COND
             ((QREFELT $ 18)
              (SEQ
               (LETT |s1|
                     (SPADCALL
                      (LIST (|CLIF;toStringTerm| |op1mult| |op1type| $) "*"
                            (|CLIF;toStringTerm| |op2mult| |op2type| $))
                      (QREFELT $ 58))
                     . #4#)
               (LETT |s2|
                     (SPADCALL
                      (LIST "=" (|CLIF;toString| |ut| $) "*"
                            (|CLIF;toString| |factor1| $))
                      (QREFELT $ 58))
                     . #4#)
               (LETT |s3|
                     (SPADCALL
                      (LIST "-" (|CLIF;toString| |factor2| $) "*"
                            (|CLIF;toString| |vt| $))
                      (QREFELT $ 58))
                     . #4#)
               (LETT |s4|
                     (SPADCALL (LIST "=" (|CLIF;toString| |resul| $))
                               (QREFELT $ 58))
                     . #4#)
               (EXIT
                (SPADCALL (LIST "cliffordProdTerm: " |s1| |s2| |s3| |s4|)
                          (QREFELT $ 92))))))
            (LETT |resul|
                  (SPADCALL (SPADCALL |op1mult| |op2mult| (QREFELT $ 40))
                            |resul| (QREFELT $ 41))
                  . #4#)
            (EXIT |resul|)))
          #5# (EXIT #2#)))) 

(SDEFUN |CLIF;cliffordDiagonalTerm|
        ((|op1mult| K) (|op1type| |SingleInteger|) (|op2mult| K)
         (|op2type| . #1=(|SingleInteger|)) ($ $))
        (SPROG
         ((|result| ($)) (|bz| #1#) (|c| (K)) (|k| (|NonNegativeInteger|))
          (#2=#:G997 NIL) (|j| NIL) (#3=#:G996 NIL) (#4=#:G995 NIL) (|i| NIL))
         (SEQ
          (LETT |c| (SPADCALL |op1mult| |op2mult| (QREFELT $ 40))
                . #5=(|CLIF;cliffordDiagonalTerm|))
          (LETT |bz| |op2type| . #5#)
          (SEQ (LETT |i| 0 . #5#) (LETT #4# (- (QREFELT $ 6) 1) . #5#) G190
               (COND ((|greater_SI| |i| #4#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |op1type| |i| (QREFELT $ 49))
                   (SEQ (LETT |k| 0 . #5#)
                        (SEQ (LETT |j| (+ |i| 1) . #5#)
                             (LETT #3# (- (QREFELT $ 6) 1) . #5#) G190
                             (COND ((> |j| #3#) (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |op1type| |j| (QREFELT $ 49))
                                 (LETT |k| (+ |k| 1) . #5#)))))
                             (LETT |j| (+ |j| 1) . #5#) (GO G190) G191
                             (EXIT NIL))
                        (SEQ (LETT |j| 0 . #5#) (LETT #2# (- |i| 1) . #5#) G190
                             (COND ((|greater_SI| |j| #2#) (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |bz| |j| (QREFELT $ 49))
                                 (LETT |k| (+ |k| 1) . #5#)))))
                             (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                             (EXIT NIL))
                        (COND
                         ((ODDP |k|)
                          (LETT |c| (SPADCALL |c| (QREFELT $ 35)) . #5#)))
                        (EXIT
                         (COND
                          ((SPADCALL |bz| |i| (QREFELT $ 49))
                           (SEQ
                            (LETT |c|
                                  (SPADCALL |c|
                                            (SPADCALL (QREFELT $ 14) (+ |i| 1)
                                                      (QREFELT $ 94))
                                            (QREFELT $ 40))
                                  . #5#)
                            (EXIT
                             (LETT |bz|
                                   (|sub_SI| |bz|
                                             (SPADCALL 2 |i| (QREFELT $ 95)))
                                   . #5#))))
                          ('T
                           (LETT |bz|
                                 (|add_SI| |bz|
                                           (SPADCALL 2 |i| (QREFELT $ 95)))
                                 . #5#)))))))))
               (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
          (LETT |result| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30)) . #5#)
          (QSETAREF1 |result| |bz| |c|) (EXIT |result|)))) 

(SDEFUN |CLIF;*;3$;45| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((|z| ($)) (#1=#:G1011 NIL) (|iy| NIL) (#2=#:G1010 NIL) (|ix| NIL)
          (#3=#:G1009 NIL) (#4=#:G1008 NIL))
         (SEQ
          (LETT |z| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30))
                . #5=(|CLIF;*;3$;45|))
          (COND
           ((QREFELT $ 17)
            (SEQ (LETT |ix| 0 . #5#) (LETT #4# (- (QREFELT $ 21) 1) . #5#) G190
                 (COND ((|greater_SI| |ix| #4#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL (QAREF1 |x| |ix|) (|spadConstant| $ 30)
                               (QREFELT $ 28))
                     (SEQ (LETT |iy| 0 . #5#)
                          (LETT #3# (- (QREFELT $ 21) 1) . #5#) G190
                          (COND ((|greater_SI| |iy| #3#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL (QAREF1 |y| |iy|) (|spadConstant| $ 30)
                                        (QREFELT $ 28))
                              (LETT |z|
                                    (SPADCALL |z|
                                              (|CLIF;cliffordDiagonalTerm|
                                               (QAREF1 |x| |ix|)
                                               (SPADCALL |ix| (QREFELT $ 56))
                                               (QAREF1 |y| |iy|)
                                               (SPADCALL |iy| (QREFELT $ 56))
                                               $)
                                              (QREFELT $ 32))
                                    . #5#)))))
                          (LETT |iy| (|inc_SI| |iy|) . #5#) (GO G190) G191
                          (EXIT NIL))))))
                 (LETT |ix| (|inc_SI| |ix|) . #5#) (GO G190) G191 (EXIT NIL))))
          (COND
           ((NULL (QREFELT $ 17))
            (SEQ (LETT |ix| 0 . #5#) (LETT #2# (- (QREFELT $ 21) 1) . #5#) G190
                 (COND ((|greater_SI| |ix| #2#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL (QAREF1 |x| |ix|) (|spadConstant| $ 30)
                               (QREFELT $ 28))
                     (SEQ (LETT |iy| 0 . #5#)
                          (LETT #1# (- (QREFELT $ 21) 1) . #5#) G190
                          (COND ((|greater_SI| |iy| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL (QAREF1 |y| |iy|) (|spadConstant| $ 30)
                                        (QREFELT $ 28))
                              (LETT |z|
                                    (SPADCALL |z|
                                              (|CLIF;cliffordProdTerm|
                                               (QAREF1 |x| |ix|)
                                               (SPADCALL |ix| (QREFELT $ 56))
                                               (QAREF1 |y| |iy|)
                                               (SPADCALL |iy| (QREFELT $ 56))
                                               $)
                                              (QREFELT $ 32))
                                    . #5#)))))
                          (LETT |iy| (|inc_SI| |iy|) . #5#) (GO G190) G191
                          (EXIT NIL))))))
                 (LETT |ix| (|inc_SI| |ix|) . #5#) (GO G190) G191 (EXIT NIL))))
          (EXIT |z|)))) 

(SDEFUN |CLIF;~;2$;46| ((|x| $) ($ $))
        (SPADCALL |x| (SPADCALL (QREFELT $ 70)) (QREFELT $ 86))) 

(SDEFUN |CLIF;canonMonom|
        ((|c| K) (|lb| |List| (|PositiveInteger|))
         ($ |Record| (|:| |coef| K) (|:| |basel| (|NonNegativeInteger|))))
        (SPROG
         ((|bz| #1=(|NonNegativeInteger|)) (#2=#:G1022 NIL)
          (|bn| (|NonNegativeInteger|)) (#3=#:G1021 NIL) (#4=#:G1031 NIL)
          (|b| NIL) (|wasordered| (|Boolean|)) (|exchanges| #1#)
          (|t| (|PositiveInteger|)) (#5=#:G1030 NIL) (|i| NIL) (#6=#:G1028 NIL)
          (#7=#:G1029 NIL))
         (SEQ
          (SEQ
           (EXIT
            (SEQ (LETT |b| NIL . #8=(|CLIF;canonMonom|)) (LETT #7# |lb| . #8#)
                 G190
                 (COND
                  ((OR (ATOM #7#) (PROGN (LETT |b| (CAR #7#) . #8#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |b| (QREFELT $ 6) (QREFELT $ 97))
                     (PROGN
                      (LETT #6# (|error| "No such basis element") . #8#)
                      (GO #9=#:G1014))))))
                 (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL)))
           #9# (EXIT #6#))
          (LETT |wasordered| NIL . #8#) (LETT |exchanges| 0 . #8#)
          (SEQ G190 (COND ((NULL (NULL |wasordered|)) (GO G191)))
               (SEQ (LETT |wasordered| 'T . #8#)
                    (EXIT
                     (SEQ (LETT |i| 1 . #8#)
                          (LETT #5# (- (LENGTH |lb|) 1) . #8#) G190
                          (COND ((|greater_SI| |i| #5#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL (SPADCALL |lb| |i| (QREFELT $ 98))
                                        (SPADCALL |lb| (+ |i| 1)
                                                  (QREFELT $ 98))
                                        (QREFELT $ 97))
                              (SEQ
                               (LETT |t| (SPADCALL |lb| |i| (QREFELT $ 98))
                                     . #8#)
                               (SPADCALL |lb| |i|
                                         (SPADCALL |lb| (+ |i| 1)
                                                   (QREFELT $ 98))
                                         (QREFELT $ 99))
                               (SPADCALL |lb| (+ |i| 1) |t| (QREFELT $ 99))
                               (LETT |exchanges| (+ |exchanges| 1) . #8#)
                               (EXIT (LETT |wasordered| NIL . #8#)))))))
                          (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                          (EXIT NIL))))
               NIL (GO G190) G191 (EXIT NIL))
          (COND
           ((ODDP |exchanges|) (LETT |c| (SPADCALL |c| (QREFELT $ 35)) . #8#)))
          (LETT |bz| 0 . #8#)
          (SEQ (LETT |b| NIL . #8#) (LETT #4# |lb| . #8#) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |b| (CAR #4#) . #8#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |bn|
                      (PROG1 (LETT #3# (- |b| 1) . #8#)
                        (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #3#))
                      . #8#)
                (EXIT
                 (COND
                  ((SPADCALL |bz| |bn| (QREFELT $ 49))
                   (SEQ
                    (LETT |c|
                          (SPADCALL |c|
                                    (SPADCALL (QREFELT $ 14) |bn|
                                              (QREFELT $ 94))
                                    (QREFELT $ 40))
                          . #8#)
                    (EXIT
                     (LETT |bz|
                           (PROG1 (LETT #2# (- |bz| (EXPT 2 |bn|)) . #8#)
                             (|check_subtype2| (>= #2# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #2#))
                           . #8#))))
                  ('T (LETT |bz| (+ |bz| (EXPT 2 |bn|)) . #8#)))))
               (LETT #4# (CDR #4#) . #8#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |c| |bz|))))) 

(SDEFUN |CLIF;monomial;KL$;48|
        ((|c| K) (|lb| |List| (|PositiveInteger|)) ($ $))
        (SPROG
         ((|z| ($))
          (|r| (|Record| (|:| |coef| K) (|:| |basel| (|NonNegativeInteger|)))))
         (SEQ
          (LETT |r| (|CLIF;canonMonom| |c| |lb| $)
                . #1=(|CLIF;monomial;KL$;48|))
          (LETT |z| (MAKEARR1 (QREFELT $ 21) (|spadConstant| $ 30)) . #1#)
          (QSETAREF1 |z| (QCDR |r|) (QCAR |r|)) (EXIT |z|)))) 

(SDEFUN |CLIF;coefficient;$LK;49|
        ((|z| $) (|lb| |List| (|PositiveInteger|)) ($ K))
        (SPROG
         ((|r| (|Record| (|:| |coef| K) (|:| |basel| (|NonNegativeInteger|)))))
         (SEQ
          (LETT |r| (|CLIF;canonMonom| (|spadConstant| $ 43) |lb| $)
                |CLIF;coefficient;$LK;49|)
          (EXIT
           (COND
            ((SPADCALL (QCAR |r|) (|spadConstant| $ 30) (QREFELT $ 48))
             (|error| "Cannot take coef of 0"))
            ('T
             (SPADCALL (QAREF1 |z| (QCDR |r|)) (QCAR |r|) (QREFELT $ 101)))))))) 

(SDEFUN |CLIF;coerceMonom|
        ((|c| K) (|b| |NonNegativeInteger|) ($ |OutputForm|))
        (SPROG
         ((|be| (|OutputForm|)) (|ml| (|List| (|OutputForm|))) (#1=#:G1048 NIL)
          (|i| NIL) (#2=#:G1047 NIL))
         (SEQ
          (COND ((EQL |b| 0) (SPADCALL |c| (QREFELT $ 104)))
                (#3='T
                 (SEQ
                  (LETT |ml|
                        (PROGN
                         (LETT #2# NIL . #4=(|CLIF;coerceMonom|))
                         (SEQ (LETT |i| 1 . #4#) (LETT #1# (QREFELT $ 6) . #4#)
                              G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |b| (- |i| 1) (QREFELT $ 49))
                                  (LETT #2#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL "e" (QREFELT $ 105))
                                          (SPADCALL |i| (QREFELT $ 106))
                                          (QREFELT $ 107))
                                         #2#)
                                        . #4#)))))
                              (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        . #4#)
                  (LETT |be| (SPADCALL (ELT $ 108) |ml| (QREFELT $ 111)) . #4#)
                  (EXIT
                   (COND
                    ((SPADCALL |c| (|spadConstant| $ 43) (QREFELT $ 48)) |be|)
                    (#3#
                     (SPADCALL (SPADCALL |c| (QREFELT $ 104)) |be|
                               (QREFELT $ 108))))))))))) 

(SDEFUN |CLIF;coerce;$Of;51| ((|x| $) ($ |OutputForm|))
        (SPROG
         ((|tl| (|List| (|OutputForm|))) (#1=#:G1055 NIL) (|i| NIL)
          (#2=#:G1054 NIL))
         (SEQ
          (LETT |tl|
                (PROGN
                 (LETT #2# NIL . #3=(|CLIF;coerce;$Of;51|))
                 (SEQ (LETT |i| 0 . #3#) (LETT #1# (- (QREFELT $ 21) 1) . #3#)
                      G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (QAREF1 |x| |i|) (|spadConstant| $ 30)
                                    (QREFELT $ 28))
                          (LETT #2#
                                (CONS
                                 (|CLIF;coerceMonom| (QAREF1 |x| |i|) |i| $)
                                 #2#)
                                . #3#)))))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT
           (COND ((NULL |tl|) (SPADCALL "0" (QREFELT $ 105)))
                 ('T (SPADCALL (ELT $ 112) |tl| (QREFELT $ 111)))))))) 

(SDEFUN |CLIF;localPowerSets|
        ((|j| |NonNegativeInteger|)
         ($ . #1=(|List| (|List| (|PositiveInteger|)))))
        (SPROG
         ((|Sn| (|List| (|List| (|PositiveInteger|)))) (#2=#:G1061 NIL)
          (|x| NIL) (|Sm| #1#) (#3=#:G1056 NIL)
          (|l| (|List| (|List| (|PositiveInteger|)))))
         (SEQ
          (LETT |l| (SPADCALL NIL (QREFELT $ 115))
                . #4=(|CLIF;localPowerSets|))
          (EXIT
           (COND ((EQL |j| 0) |l|)
                 ('T
                  (SEQ
                   (LETT |Sm|
                         (|CLIF;localPowerSets|
                          (PROG1 (LETT #3# (- |j| 1) . #4#)
                            (|check_subtype2| (>= #3# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #3#))
                          $)
                         . #4#)
                   (LETT |Sn| NIL . #4#)
                   (SEQ (LETT |x| NIL . #4#) (LETT #2# |Sm| . #4#) G190
                        (COND
                         ((OR (ATOM #2#)
                              (PROGN (LETT |x| (CAR #2#) . #4#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT (LETT |Sn| (CONS (CONS |j| |x|) |Sn|) . #4#)))
                        (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
                   (EXIT (SPADCALL |Sn| |Sm| (QREFELT $ 116)))))))))) 

(SDEFUN |CLIF;powerSets|
        ((|j| |NonNegativeInteger|) ($ |List| (|List| (|PositiveInteger|))))
        (SPADCALL (ELT $ 117) (|CLIF;localPowerSets| |j| $) (QREFELT $ 119))) 

(SDEFUN |CLIF;recip;$U;54| ((|x| $) ($ |Union| $ "failed"))
        (SPROG
         ((|ansC| ($)) (|ansP| (|List| K)) (|cj| (K)) (#1=#:G1085 NIL)
          (|pj| NIL) (|ans| (|Union| (|Vector| K) "failed"))
          (|lhsEqs| (|List| (|List| K))) (|lhsEqi| (|List| K)) (#2=#:G1084 NIL)
          (|rhsEqs| (|List| K)) (#3=#:G1083 NIL) (|pi| NIL) (|one| ($)))
         (SEQ (LETT |one| (|spadConstant| $ 44) . #4=(|CLIF;recip;$U;54|))
              (LETT |rhsEqs| NIL . #4#) (LETT |lhsEqs| NIL . #4#)
              (SEQ (LETT |pi| NIL . #4#) (LETT #3# (QREFELT $ 120) . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |pi| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |rhsEqs|
                          (CONS (SPADCALL |one| |pi| (QREFELT $ 102)) |rhsEqs|)
                          . #4#)
                    (LETT |lhsEqi| NIL . #4#)
                    (SEQ (LETT |pj| NIL . #4#) (LETT #2# (QREFELT $ 120) . #4#)
                         G190
                         (COND
                          ((OR (ATOM #2#)
                               (PROGN (LETT |pj| (CAR #2#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |lhsEqi|
                                 (CONS
                                  (SPADCALL
                                   (SPADCALL |x|
                                             (SPADCALL (|spadConstant| $ 43)
                                                       |pj| (QREFELT $ 100))
                                             (QREFELT $ 86))
                                   |pi| (QREFELT $ 102))
                                  |lhsEqi|)
                                 . #4#)))
                         (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (LETT |lhsEqs| (CONS (REVERSE |lhsEqi|) |lhsEqs|) . #4#)))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (LETT |ans|
                    (SPADCALL (SPADCALL |lhsEqs| (QREFELT $ 123))
                              (SPADCALL |rhsEqs| (QREFELT $ 124))
                              (QREFELT $ 127))
                    . #4#)
              (EXIT
               (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
                     ('T
                      (SEQ
                       (LETT |ansP| (SPADCALL (QCDR |ans|) (QREFELT $ 128))
                             . #4#)
                       (LETT |ansC| (|spadConstant| $ 42) . #4#)
                       (SEQ (LETT |pj| NIL . #4#)
                            (LETT #1# (QREFELT $ 120) . #4#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |pj| (CAR #1#) . #4#) NIL))
                              (GO G191)))
                            (SEQ (LETT |cj| (|SPADfirst| |ansP|) . #4#)
                                 (LETT |ansP| (CDR |ansP|) . #4#)
                                 (EXIT
                                  (LETT |ansC|
                                        (SPADCALL |ansC|
                                                  (SPADCALL |cj|
                                                            (SPADCALL
                                                             (|spadConstant| $
                                                                             43)
                                                             |pj|
                                                             (QREFELT $ 100))
                                                            (QREFELT $ 41))
                                                  (QREFELT $ 32))
                                        . #4#)))
                            (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT (CONS 0 |ansC|))))))))) 

(DECLAIM (NOTINLINE |CliffordAlgebra;|)) 

(DEFUN |CliffordAlgebra| (&REST #1=#:G1086)
  (SPROG NIL
         (PROG (#2=#:G1087)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|CliffordAlgebra|)
                                               '|domainEqualList|)
                    . #3=(|CliffordAlgebra|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |CliffordAlgebra;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|CliffordAlgebra|)))))))))) 

(DEFUN |CliffordAlgebra;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|CliffordAlgebra|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|CliffordAlgebra| DV$1 DV$2 DV$3) . #1#)
          (LETT $ (GETREFV 132) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|CliffordAlgebra|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 14
                    (SPADCALL (SPADCALL |#3| (QREFELT $ 11)) (QREFELT $ 13)))
          (QSETREFV $ 17 (SPADCALL |#3| (QREFELT $ 16)))
          (QSETREFV $ 18 NIL)
          (QSETREFV $ 21 (SPADCALL 2 |#1| (QREFELT $ 20)))
          (QSETREFV $ 22 (|PrimitiveArray| |#2|))
          (QSETREFV $ 120 (|CLIF;powerSets| |#1| $))
          $))) 

(MAKEPROP '|CliffordAlgebra| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|DirectProduct| (NRTEVAL (QREFELT $ 6)) 7)
              (|SquareMatrix| (NRTEVAL (QREFELT $ 6)) 7) (0 . |diagonal|)
              (|Vector| 7) (5 . |coerce|) '|Qeelist| (|Boolean|)
              (10 . |diagonal?|) '|orthogonal| '|debug| (|PositiveInteger|)
              (15 . ^) '|dim| '|Rep| (|NonNegativeInteger|)
              (21 . |characteristic|) |CLIF;characteristic;Nni;1|
              (|CardinalNumber|) (25 . |coerce|) (30 . ~=) |CLIF;=;2$B;3|
              (36 . |Zero|) (40 . +) |CLIF;+;3$;4| (46 . -) |CLIF;-;3$;5|
              (52 . -) |CLIF;-;2$;6| (|Integer|) (57 . *) |CLIF;*;I2$;7|
              (63 . *) |CLIF;*;K2$;8|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |CLIF;Zero;$;9|) $))
              (69 . |One|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |CLIF;One;$;10|) $))
              (73 . |coerce|) |CLIF;coerce;I$;11| |CLIF;coerce;K$;12| (78 . =)
              (84 . |bit?|) (90 . >) (|Character|) (|String|) (96 . |elt|)
              (102 . ~=) (|SingleInteger|) (108 . |coerce|) (|List| $)
              (113 . |concat|) |CLIF;e;Pi$;15| |CLIF;/\\;3$;37|
              (|Mapping| $$ $$ $$) (|List| $$) (118 . |reduce|) (|List| 19)
              |CLIF;ee;L$;16| (|List| 7) (125 . |elt|) |CLIF;multivector;L$;17|
              |CLIF;eFromBinaryMap;Nni$;18| |CLIF;ePseudoscalar;$;19|
              (|List| 62) (|Matrix| $$) (131 . |matrix|) (|Matrix| $)
              (|Mapping| $ $ $) |CLIF;toTable;MM;20| (|Mapping| $ $)
              |CLIF;toTable;MM;21| |CLIF;grade;$Nni;23|
              |CLIF;gradeInvolution;2$;25| |CLIF;reverse;2$;27|
              |CLIF;conj;2$;29| |CLIF;setMode;S2B;30| (136 . |elt|) (143 . ~=)
              |CLIF;*;3$;45| |CLIF;\\/;3$;38| |CLIF;lc;3$;41| (|Void|)
              (|List| 52) (|DisplayPackage|) (149 . |say|) |CLIF;rc;3$;42|
              (154 . |elt|) (160 . ^) |CLIF;~;2$;46| (166 . >) (172 . |elt|)
              (178 . |setelt!|) |CLIF;monomial;KL$;48| (185 . /)
              |CLIF;coefficient;$LK;49| (|OutputForm|) (191 . |coerce|)
              (196 . |message|) (201 . |coerce|) (206 . |sub|) (212 . *)
              (|Mapping| 103 103 103) (|List| 103) (218 . |reduce|) (224 . +)
              |CLIF;coerce;$Of;51| (|List| 64) (230 . |list|) (235 . |append|)
              (241 . |reverse|) (|Mapping| 64 64) (246 . |map|) '|Pn|
              (|List| 66) (|Matrix| 7) (252 . |matrix|) (257 . |vector|)
              (|Union| 12 '"failed") (|LinearSystemMatrixPackage| 7 12 12 122)
              (262 . |particularSolution|) (268 . |parts|)
              (|Union| $ '"failed") |CLIF;recip;$U;54| (|HashState|))
           '#(~= 273 ~ 279 |zero?| 284 |toTable| 289 |subtractIfCan| 299
              |setMode| 305 |sample| 311 |rightRecip| 315 |rightPower| 320
              |reverse| 332 |recip| 337 |rc| 342 |opposite?| 348 |one?| 354
              |multivector| 359 |monomial| 364 |leftRecip| 370 |leftPower| 375
              |lc| 387 |latex| 393 |hashUpdate!| 398 |hash| 404
              |gradeInvolution| 409 |grade| 414 |ee| 419 |ePseudoscalar| 424
              |eFromBinaryMap| 428 |e| 433 |conj| 438 |commutator| 443 |coerce|
              449 |coefficient| 464 |characteristic| 470 |associator| 474
              |antiCommutator| 481 |annihilate?| 487 ^ 493 |\\/| 505 |Zero| 511
              |One| 515 = 519 |/\\| 525 - 531 + 542 * 548)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0))
            (CONS
             '#(|Algebra&| NIL |Rng&| NIL |Module&| NIL NIL
                |NonAssociativeRing&| NIL NIL NIL |NonAssociativeRng&| NIL NIL
                |AbelianGroup&| NIL NIL NIL NIL |MagmaWithUnit&|
                |NonAssociativeSemiRng&| |AbelianMonoid&| |Magma&|
                |AbelianSemiGroup&| |SetCategory&| NIL |BasicType&| NIL)
             (CONS
              '#((|Algebra| 7) (|Ring|) (|Rng|) (|SemiRing|) (|Module| 7)
                 (|SemiRng|) (|BiModule| 7 7) (|NonAssociativeRing|)
                 (|BiModule| $$ $$) (|RightModule| 7) (|LeftModule| 7)
                 (|NonAssociativeRng|) (|RightModule| $$) (|LeftModule| $$)
                 (|AbelianGroup|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|Magma|)
                 (|AbelianSemiGroup|) (|SetCategory|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 103))
              (|makeByteWordVec2| 131
                                  '(1 10 9 0 11 1 9 12 0 13 1 10 15 0 16 2 19 0
                                    0 19 20 0 7 23 24 1 26 0 23 27 2 7 15 0 0
                                    28 0 7 0 30 2 7 0 0 0 31 2 7 0 0 0 33 1 7 0
                                    0 35 2 7 0 37 0 38 2 7 0 0 0 40 0 7 0 43 1
                                    7 0 37 45 2 7 15 0 0 48 2 37 15 0 0 49 2 23
                                    15 0 0 50 2 52 51 0 37 53 2 52 15 0 0 54 1
                                    55 0 37 56 1 52 0 57 58 3 62 2 61 0 2 63 2
                                    66 7 0 37 67 1 72 0 71 73 3 10 7 0 37 37 84
                                    2 55 15 0 0 85 1 91 89 90 92 2 12 7 0 37 94
                                    2 55 0 0 23 95 2 19 15 0 0 97 2 64 19 0 37
                                    98 3 64 19 0 37 19 99 2 7 0 0 0 101 1 7 103
                                    0 104 1 103 0 52 105 1 23 103 0 106 2 103 0
                                    0 0 107 2 103 0 0 0 108 2 110 103 109 0 111
                                    2 103 0 0 0 112 1 114 0 64 115 2 114 0 0 0
                                    116 1 64 0 0 117 2 114 0 118 0 119 1 122 0
                                    121 123 1 12 0 66 124 2 126 125 122 12 127
                                    1 12 66 0 128 2 0 15 0 0 1 1 0 0 0 96 1 0
                                    15 0 1 1 0 74 77 78 1 0 74 75 76 2 0 129 0
                                    0 1 2 0 15 52 15 83 0 0 0 1 1 0 129 0 1 2 0
                                    0 0 23 1 2 0 0 0 19 1 1 0 0 0 81 1 0 129 0
                                    130 2 0 0 0 0 93 2 0 15 0 0 1 1 0 15 0 1 1
                                    0 0 66 68 2 0 0 7 64 100 1 0 129 0 1 2 0 0
                                    0 23 1 2 0 0 0 19 1 2 0 0 0 0 88 1 0 52 0 1
                                    2 0 131 131 0 1 1 0 55 0 1 1 0 0 0 80 1 0
                                    23 0 79 1 0 0 64 65 0 0 0 70 1 0 0 23 69 1
                                    0 0 19 59 1 0 0 0 82 2 0 0 0 0 1 1 0 0 7 47
                                    1 0 0 37 46 1 0 103 0 113 2 0 7 0 64 102 0
                                    0 23 25 3 0 0 0 0 0 1 2 0 0 0 0 1 2 0 15 0
                                    0 1 2 0 0 0 23 1 2 0 0 0 19 1 2 0 0 0 0 87
                                    0 0 0 42 0 0 0 44 2 0 15 0 0 29 2 0 0 0 0
                                    60 1 0 0 0 36 2 0 0 0 0 34 2 0 0 0 0 32 2 0
                                    0 7 0 41 2 0 0 0 7 1 2 0 0 23 0 1 2 0 0 37
                                    0 39 2 0 0 0 0 86 2 0 0 19 0 1)))))
           '|lookupComplete|)) 
