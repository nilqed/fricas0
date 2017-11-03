
(PUT '|EXPR;belong?;BoB;1| '|SPADreplace| '(XLAM (|op|) 'T)) 

(SDEFUN |EXPR;belong?;BoB;1| ((|op| |BasicOperator|) ($ |Boolean|)) 'T) 

(SDEFUN |EXPR;retNotUnit| ((|x| $) ($ R))
        (SPROG ((|u| (|Union| R "failed")) (|k| (|Kernel| $)))
               (SEQ
                (LETT |u|
                      (SPADCALL
                       (LETT |k| (SPADCALL |x| (QREFELT $ 13))
                             . #1=(|EXPR;retNotUnit|))
                       (QREFELT $ 17))
                      . #1#)
                (EXIT
                 (COND ((QEQCAR |u| 0) (QCDR |u|))
                       ('T (|error| "Not retractable"))))))) 

(SDEFUN |EXPR;retNotUnitIfCan| ((|x| $) ($ |Union| R "failed"))
        (SPROG ((|r| (|Union| (|Kernel| $) "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 19)) |EXPR;retNotUnitIfCan|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                       ('T (SPADCALL (QCDR |r|) (QREFELT $ 17)))))))) 

(SDEFUN |EXPR;operator;2Bo;4| ((|op| . #1=(|BasicOperator|)) ($ . #1#))
        (SPROG ((|n| (|Union| (|NonNegativeInteger|) "failed")))
               (SEQ
                (COND
                 ((SPADCALL |op| (QREFELT $ 21))
                  (SPADCALL |op| (QREFELT $ 22)))
                 ((SPADCALL |op| (QREFELT $ 24))
                  (SPADCALL |op| (QREFELT $ 25)))
                 (#2='T
                  (SEQ
                   (COND
                    ((SPADCALL |op| (QREFELT $ 26))
                     (COND
                      ((SPADCALL |op| (QREFELT $ 7) (QREFELT $ 28))
                       (EXIT
                        (SPADCALL
                         (SPADCALL (SPADCALL |op| (QREFELT $ 29))
                                   (QREFELT $ 30))
                         (QREFELT $ 31)))))))
                   (LETT |n| (SPADCALL |op| (QREFELT $ 33))
                         |EXPR;operator;2Bo;4|)
                   (EXIT
                    (COND
                     ((QEQCAR |n| 1)
                      (SPADCALL (SPADCALL |op| (QREFELT $ 29)) (QREFELT $ 34)))
                     (#2#
                      (SPADCALL (SPADCALL |op| (QREFELT $ 29)) (QCDR |n|)
                                (QREFELT $ 36))))))))))) 

(SDEFUN |EXPR;poly_to_MP|
        ((|p| |Polynomial| R)
         ($ |SparseMultivariatePolynomial| R (|Kernel| $)))
        (SPROG
         ((|vl2| (|List| (|Kernel| $))) (#1=#:G784 NIL) (|z| NIL)
          (#2=#:G783 NIL) (|vl1| (|List| (|Symbol|)))
          (|ps| (|SparseMultivariatePolynomial| R (|Symbol|))))
         (SEQ (LETT |ps| |p| . #3=(|EXPR;poly_to_MP|))
              (LETT |vl1| (SPADCALL |ps| (QREFELT $ 40)) . #3#)
              (LETT |vl2|
                    (PROGN
                     (LETT #2# NIL . #3#)
                     (SEQ (LETT |z| NIL . #3#) (LETT #1# |vl1| . #3#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |z| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2# (CONS (SPADCALL |z| (QREFELT $ 30)) #2#)
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #3#)
              (EXIT (SPADCALL |ps| |vl1| |vl2| (QREFELT $ 44)))))) 

(SDEFUN |EXPR;Zero;$;6| (($ $)) (|spadConstant| $ 46)) 

(SDEFUN |EXPR;One;$;7| (($ $)) (|spadConstant| $ 48)) 

(SDEFUN |EXPR;one?;$B;8| ((|x| $) ($ |Boolean|))
        (SPADCALL |x| (|spadConstant| $ 49) (QREFELT $ 51))) 

(SDEFUN |EXPR;zero?;$B;9| ((|x| $) ($ |Boolean|)) (SPADCALL |x| (QREFELT $ 53))) 

(SDEFUN |EXPR;-;2$;10| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 55))) 

(SDEFUN |EXPR;*;I2$;11| ((|n| |Integer|) (|x| $) ($ $))
        (SPADCALL |n| |x| (QREFELT $ 58))) 

(SDEFUN |EXPR;coerce;I$;12| ((|n| |Integer|) ($ $))
        (SPADCALL |n| (QREFELT $ 60))) 

(SDEFUN |EXPR;*;3$;13| ((|x| $) (|y| $) ($ $))
        (|EXPR;algreduc| (SPADCALL |x| |y| (QREFELT $ 62))
         (|EXPR;commonk| |x| |y| $) $)) 

(SDEFUN |EXPR;+;3$;14| ((|x| $) (|y| $) ($ $))
        (|EXPR;algreduc| (SPADCALL |x| |y| (QREFELT $ 64))
         (|EXPR;commonk| |x| |y| $) $)) 

(SDEFUN |EXPR;-;3$;15| ((|x| $) (|y| $) ($ $))
        (|EXPR;algreduc| (SPADCALL |x| |y| (QREFELT $ 66))
         (|EXPR;commonk| |x| |y| $) $)) 

(SDEFUN |EXPR;/;3$;16| ((|x| $) (|y| $) ($ $))
        (|EXPR;algreduc| (SPADCALL |x| |y| (QREFELT $ 68))
         (|EXPR;commonk| |x| |y| $) $)) 

(SDEFUN |EXPR;number?;$B;17| ((|x| $) ($ |Boolean|))
        (COND
         ((|HasCategory| (QREFELT $ 6) (LIST '|RetractableTo| '(|Integer|)))
          (COND ((SPADCALL |x| (QREFELT $ 70)) 'T)
                (#1='T (QEQCAR (SPADCALL |x| (QREFELT $ 72)) 0))))
         (#1# (SPADCALL |x| (QREFELT $ 70))))) 

(SDEFUN |EXPR;simplifyPower;$I$;18| ((|x| $) (|n| |Integer|) ($ $))
        (SPROG ((|args| (|List| $)) (|k| (|List| (|Kernel| $))))
               (SEQ
                (LETT |k| (SPADCALL |x| (QREFELT $ 75))
                      . #1=(|EXPR;simplifyPower;$I$;18|))
                (EXIT
                 (COND
                  ((SPADCALL |x| '|%power| (QREFELT $ 76))
                   (SEQ
                    (LETT |args|
                          (SPADCALL (SPADCALL |k| (QREFELT $ 77))
                                    (QREFELT $ 79))
                          . #1#)
                    (COND
                     ((NULL (EQL (SPADCALL |args| (QREFELT $ 80)) 2))
                      (EXIT (|error| "Too many arguments to ^"))))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |args| 1 (QREFELT $ 81))
                                 (QREFELT $ 73))
                       (SPADCALL
                        (|EXPR;reduc|
                         (SPADCALL (SPADCALL |args| 1 (QREFELT $ 81)) |n|
                                   (QREFELT $ 82))
                         (SPADCALL (SPADCALL |args| 1 (QREFELT $ 81))
                                   (QREFELT $ 83))
                         $)
                        (SPADCALL |args| 2 (QREFELT $ 81)) (QREFELT $ 84)))
                      (#2='T
                       (SPADCALL (SPADCALL |args| (QREFELT $ 85))
                                 (SPADCALL |n| (SPADCALL |args| (QREFELT $ 86))
                                           (QREFELT $ 59))
                                 (QREFELT $ 84)))))))
                  (#2#
                   (|EXPR;reduc| (SPADCALL |x| |n| (QREFELT $ 82))
                    (SPADCALL |x| (QREFELT $ 83)) $))))))) 

(SDEFUN |EXPR;^;$Nni$;19| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (COND ((EQL |n| 0) (|spadConstant| $ 49)) ((EQL |n| 1) |x|)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |x| (QREFELT $ 89)) |n| (QREFELT $ 87))
                (SPADCALL (SPADCALL |x| (QREFELT $ 90)) |n| (QREFELT $ 87))
                (QREFELT $ 69))))) 

(SDEFUN |EXPR;^;$I$;20| ((|x| $) (|n| |Integer|) ($ $))
        (COND ((EQL |n| 0) (|spadConstant| $ 49)) ((EQL |n| 1) |x|)
              (#1='T
               (COND
                ((EQL |n| -1)
                 (SPADCALL (|spadConstant| $ 49) |x| (QREFELT $ 69)))
                (#1#
                 (SPADCALL
                  (SPADCALL (SPADCALL |x| (QREFELT $ 89)) |n| (QREFELT $ 87))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 90)) |n| (QREFELT $ 87))
                  (QREFELT $ 69))))))) 

(SDEFUN |EXPR;^;$Pi$;21| ((|x| $) (|n| |PositiveInteger|) ($ $))
        (COND ((EQL |n| 1) |x|)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |x| (QREFELT $ 89)) |n| (QREFELT $ 87))
                (SPADCALL (SPADCALL |x| (QREFELT $ 90)) |n| (QREFELT $ 87))
                (QREFELT $ 69))))) 

(SDEFUN |EXPR;smaller?;2$B;22| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 95))) 

(SDEFUN |EXPR;=;2$B;23| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL (SPADCALL |x| |y| (QREFELT $ 67)) (|spadConstant| $ 46)
                  (QREFELT $ 51))) 

(SDEFUN |EXPR;numer;$Smp;24|
        ((|x| $) ($ |SparseMultivariatePolynomial| R (|Kernel| $)))
        (SPADCALL |x| (QREFELT $ 98))) 

(SDEFUN |EXPR;denom;$Smp;25|
        ((|x| $) ($ |SparseMultivariatePolynomial| R (|Kernel| $)))
        (SPADCALL |x| (QREFELT $ 101))) 

(SDEFUN |EXPR;coerce;Smp$;26|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| $)) ($ $))
        (CONS |p| (|spadConstant| $ 104))) 

(SDEFUN |EXPR;coerce;P$;27| ((|p| |Polynomial| R) ($ $))
        (SPROG ((|en| (|SparseMultivariatePolynomial| R (|Kernel| $))))
               (SEQ (LETT |en| (|EXPR;poly_to_MP| |p| $) |EXPR;coerce;P$;27|)
                    (EXIT (CONS |en| (|spadConstant| $ 104)))))) 

(SDEFUN |EXPR;coerce;F$;28| ((|pq| |Fraction| (|Polynomial| R)) ($ $))
        (SPROG
         ((|ed| #1=(|SparseMultivariatePolynomial| R (|Kernel| $))) (|en| #1#))
         (SEQ
          (LETT |en| (|EXPR;poly_to_MP| (SPADCALL |pq| (QREFELT $ 109)) $)
                . #2=(|EXPR;coerce;F$;28|))
          (LETT |ed| (|EXPR;poly_to_MP| (SPADCALL |pq| (QREFELT $ 110)) $)
                . #2#)
          (EXIT (CONS |en| |ed|))))) 

(SDEFUN |EXPR;reduce;2$;29| ((|x| $) ($ $))
        (|EXPR;reduc| |x| (SPADCALL |x| (QREFELT $ 83)) $)) 

(SDEFUN |EXPR;commonk| ((|x| $) (|y| $) ($ |List| (|Kernel| $)))
        (|EXPR;commonk0| (SPADCALL |x| (QREFELT $ 83))
         (SPADCALL |y| (QREFELT $ 83)) $)) 

(SDEFUN |EXPR;algkernels| ((|l| |List| (|Kernel| $)) ($ |List| (|Kernel| $)))
        (SPROG NIL
               (SPADCALL (CONS #'|EXPR;algkernels!0| (VECTOR (QREFELT $ 8) $))
                         |l| (QREFELT $ 114)))) 

(SDEFUN |EXPR;algkernels!0| ((|x| NIL) ($$ NIL))
        (PROG ($ ALGOP)
          (LETT $ (QREFELT $$ 1) . #1=(|EXPR;algkernels|))
          (LETT ALGOP (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT $ 31)) ALGOP (QREFELT $ 28)))))) 

(SDEFUN |EXPR;toprat| ((|f| $) ($ $))
        (SPADCALL |f| (SPADCALL |f| (QREFELT $ 83)) (QREFELT $ 116))) 

(SDEFUN |EXPR;simple_root| ((|r| |Kernel| $) ($ |Boolean|))
        (SPROG ((|a| ($)) (|al| (|List| $)))
               (SEQ
                (COND
                 ((SPADCALL |r| '|nthRoot| (QREFELT $ 117))
                  (SEQ
                   (LETT |al| (SPADCALL |r| (QREFELT $ 79))
                         . #1=(|EXPR;simple_root|))
                   (EXIT
                    (COND
                     ((SPADCALL (SPADCALL |al| 2 (QREFELT $ 81))
                                (SPADCALL 2 (QREFELT $ 61)) (QREFELT $ 118))
                      NIL)
                     (#2='T
                      (SEQ (LETT |a| (SPADCALL |al| 1 (QREFELT $ 81)) . #1#)
                           (EXIT
                            (NULL
                             (SPADCALL
                              (LENGTH
                               (|EXPR;algkernels| (SPADCALL |a| (QREFELT $ 75))
                                $))
                              0 (QREFELT $ 119))))))))))
                 (#2# NIL))))) 

(SDEFUN |EXPR;root_reduce| ((|x| $) (|r| |Kernel| $) ($ $))
        (SPROG
         ((|d1| (|SparseMultivariatePolynomial| R (|Kernel| $)))
          (|n1| (|SparseMultivariatePolynomial| R (|Kernel| $)))
          (|c0| #1=(|SparseMultivariatePolynomial| R (|Kernel| $))) (|c1| #1#)
          (|n0| #2=(|SparseMultivariatePolynomial| R (|Kernel| $)))
          (|dp|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| $))))
          (|dn| (|SparseMultivariatePolynomial| R (|Kernel| $))) (|an| #2#)
          (|a| ($)))
         (SEQ
          (LETT |a| (SPADCALL (SPADCALL |r| (QREFELT $ 79)) 1 (QREFELT $ 81))
                . #3=(|EXPR;root_reduce|))
          (LETT |an| (SPADCALL |a| (QREFELT $ 100)) . #3#)
          (LETT |dn| (SPADCALL |a| (QREFELT $ 102)) . #3#)
          (LETT |dp|
                (SPADCALL (SPADCALL |x| (QREFELT $ 102)) |r| (QREFELT $ 121))
                . #3#)
          (LETT |n0| (SPADCALL |x| (QREFELT $ 100)) . #3#)
          (LETT |c1| (SPADCALL |dp| (QREFELT $ 123)) . #3#)
          (LETT |c0| (SPADCALL (SPADCALL |dp| (QREFELT $ 124)) (QREFELT $ 123))
                . #3#)
          (LETT |n1|
                (SPADCALL |dn|
                          (SPADCALL (SPADCALL |c0| |n0| (QREFELT $ 125))
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| $ 104) |r| 1
                                                (QREFELT $ 126))
                                      |c1| (QREFELT $ 125))
                                     |n0| (QREFELT $ 125))
                                    (QREFELT $ 127))
                          (QREFELT $ 125))
                . #3#)
          (LETT |d1|
                (SPADCALL
                 (SPADCALL (SPADCALL |c0| |c0| (QREFELT $ 125)) |dn|
                           (QREFELT $ 125))
                 (SPADCALL (SPADCALL |an| |c1| (QREFELT $ 125)) |c1|
                           (QREFELT $ 125))
                 (QREFELT $ 127))
                . #3#)
          (EXIT
           (|EXPR;reduc| (SPADCALL |n1| |d1| (QREFELT $ 128)) (LIST |r|) $))))) 

(PUT '|EXPR;getSimplifyDenomsFlag;B;35| '|SPADreplace|
     '(XLAM NIL |algreduc_flag|)) 

(SDEFUN |EXPR;getSimplifyDenomsFlag;B;35| (($ |Boolean|)) |algreduc_flag|) 

(SDEFUN |EXPR;setSimplifyDenomsFlag;2B;36| ((|x| |Boolean|) ($ |Boolean|))
        (SPROG ((|res| (|Boolean|)))
               (SEQ
                (LETT |res| (SPADCALL (QREFELT $ 129))
                      |EXPR;setSimplifyDenomsFlag;2B;36|)
                (SETF |algreduc_flag| |x|) (EXIT |res|)))) 

(SDEFUN |EXPR;algreduc| ((|x| $) (|ckl| |List| (|Kernel| $)) ($ $))
        (SPROG
         ((|x1| ($)) (|q| (|SparseUnivariatePolynomial| $)) (#1=#:G865 NIL)
          (|k| NIL) (|sas| (|SingletonAsOrderedSet|)) (#2=#:G864 NIL)
          (|r| (|Kernel| $)) (|akl| (|List| (|Kernel| $))))
         (SEQ
          (EXIT
           (SEQ (LETT |x1| (|EXPR;reduc| |x| |ckl| $) . #3=(|EXPR;algreduc|))
                (EXIT
                 (COND
                  ((SPADCALL (QREFELT $ 129))
                   (SEQ
                    (LETT |akl|
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 104)
                                     (SPADCALL |x1| (QREFELT $ 102))
                                     (QREFELT $ 128))
                           (QREFELT $ 83))
                          . #3#)
                    (EXIT
                     (COND ((EQL (LENGTH |akl|) 0) |x1|)
                           (#4='T
                            (SEQ
                             (COND
                              ((EQL (LENGTH |akl|) 1)
                               (SEQ
                                (LETT |r| (SPADCALL |akl| 1 (QREFELT $ 131))
                                      . #3#)
                                (EXIT
                                 (COND
                                  ((|EXPR;simple_root| |r| $)
                                   (PROGN
                                    (LETT #2# (|EXPR;root_reduce| |x| |r| $)
                                          . #3#)
                                    (GO #5=#:G863))))))))
                             (LETT |sas| (SPADCALL (QREFELT $ 133)) . #3#)
                             (SEQ (LETT |k| NIL . #3#) (LETT #1# |akl| . #3#)
                                  G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (LETT |q|
                                         (SPADCALL |x1| |k|
                                                   (SPADCALL |k|
                                                             (QREFELT $ 134))
                                                   (QREFELT $ 137))
                                         . #3#)
                                   (EXIT
                                    (LETT |x1|
                                          (SPADCALL
                                           (SPADCALL |q| |sas|
                                                     (SPADCALL |k|
                                                               (QREFELT $ 138))
                                                     (QREFELT $ 139))
                                           (QREFELT $ 140))
                                          . #3#)))
                                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT |x1|)))))))
                  (#4# |x1|)))))
          #5# (EXIT #2#)))) 

(SDEFUN |EXPR;/;2Smp$;38|
        ((|x| |SparseMultivariatePolynomial| R . #1=((|Kernel| $)))
         (|y| |SparseMultivariatePolynomial| R . #1#) ($ $))
        (|EXPR;reduc| (SPADCALL |x| |y| (QREFELT $ 128))
         (|EXPR;commonk| (SPADCALL |x| (|spadConstant| $ 104) (QREFELT $ 128))
          (SPADCALL |y| (|spadConstant| $ 104) (QREFELT $ 128)) $)
         $)) 

(SDEFUN |EXPR;reducedSystem;MM;39| ((|m| |Matrix| $) ($ |Matrix| R))
        (SPROG
         ((|mm| (|Matrix| (|SparseMultivariatePolynomial| R (|Kernel| $)))))
         (SEQ
          (LETT |mm|
                (SPADCALL
                 (SPADCALL (CONS (|function| |EXPR;toprat|) $) |m|
                           (QREFELT $ 144))
                 (QREFELT $ 147))
                |EXPR;reducedSystem;MM;39|)
          (EXIT (SPADCALL |mm| (QREFELT $ 149)))))) 

(SDEFUN |EXPR;reducedSystem;MVR;40|
        ((|m| |Matrix| $) (|v| |Vector| $)
         ($ |Record| (|:| |mat| (|Matrix| R)) (|:| |vec| (|Vector| R))))
        (SPROG
         ((|r|
           (|Record|
            (|:| |mat|
                 (|Matrix| (|SparseMultivariatePolynomial| R (|Kernel| $))))
            (|:| |vec|
                 (|Vector| (|SparseMultivariatePolynomial| R (|Kernel| $)))))))
         (SEQ
          (LETT |r|
                (SPADCALL
                 (SPADCALL (CONS (|function| |EXPR;toprat|) $) |m|
                           (QREFELT $ 144))
                 (SPADCALL (CONS (|function| |EXPR;toprat|) $) |v|
                           (QREFELT $ 152))
                 (QREFELT $ 155))
                |EXPR;reducedSystem;MVR;40|)
          (EXIT (SPADCALL (QCAR |r|) (QCDR |r|) (QREFELT $ 157)))))) 

(SDEFUN |EXPR;commonk0|
        ((|x| |List| (|Kernel| $)) (|y| |List| (|Kernel| $))
         ($ |List| (|Kernel| $)))
        (SPROG ((|ans| (|List| (|Kernel| $))) (#1=#:G881 NIL) (|k| NIL))
               (SEQ (LETT |ans| NIL . #2=(|EXPR;commonk0|))
                    (SEQ (LETT |k| NIL . #2#) (LETT #1# (NREVERSE |x|) . #2#)
                         G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |k| |y| (QREFELT $ 159))
                             (LETT |ans| (SPADCALL |k| |ans| (QREFELT $ 160))
                                   . #2#)))))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |EXPR;rootOf;SupS$;42|
        ((|x| |SparseUnivariatePolynomial| $) (|v| |Symbol|) ($ $))
        (SPADCALL |x| |v| (QREFELT $ 162))) 

(SDEFUN |EXPR;rootSum;$SupS$;43|
        ((|x| $) (|p| |SparseUnivariatePolynomial| $) (|v| |Symbol|) ($ $))
        (SPADCALL |x| |p| |v| (QREFELT $ 164))) 

(SDEFUN |EXPR;pi;$;44| (($ $)) (SPADCALL (QREFELT $ 167))) 

(SDEFUN |EXPR;exp;2$;45| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 169))) 

(SDEFUN |EXPR;log;2$;46| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 171))) 

(SDEFUN |EXPR;sin;2$;47| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 173))) 

(SDEFUN |EXPR;cos;2$;48| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 175))) 

(SDEFUN |EXPR;tan;2$;49| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 177))) 

(SDEFUN |EXPR;cot;2$;50| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 179))) 

(SDEFUN |EXPR;sec;2$;51| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 181))) 

(SDEFUN |EXPR;csc;2$;52| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 183))) 

(SDEFUN |EXPR;asin;2$;53| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 185))) 

(SDEFUN |EXPR;acos;2$;54| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 187))) 

(SDEFUN |EXPR;atan;2$;55| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 189))) 

(SDEFUN |EXPR;acot;2$;56| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 191))) 

(SDEFUN |EXPR;asec;2$;57| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 193))) 

(SDEFUN |EXPR;acsc;2$;58| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 195))) 

(SDEFUN |EXPR;sinh;2$;59| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 197))) 

(SDEFUN |EXPR;cosh;2$;60| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 199))) 

(SDEFUN |EXPR;tanh;2$;61| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 201))) 

(SDEFUN |EXPR;coth;2$;62| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 203))) 

(SDEFUN |EXPR;sech;2$;63| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 205))) 

(SDEFUN |EXPR;csch;2$;64| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 207))) 

(SDEFUN |EXPR;asinh;2$;65| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 209))) 

(SDEFUN |EXPR;acosh;2$;66| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 211))) 

(SDEFUN |EXPR;atanh;2$;67| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 213))) 

(SDEFUN |EXPR;acoth;2$;68| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 215))) 

(SDEFUN |EXPR;asech;2$;69| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 217))) 

(SDEFUN |EXPR;acsch;2$;70| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 219))) 

(SDEFUN |EXPR;abs;2$;71| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 222))) 

(SDEFUN |EXPR;conjugate;2$;72| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 224))) 

(SDEFUN |EXPR;Gamma;2$;73| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 226))) 

(SDEFUN |EXPR;Gamma;3$;74| ((|a| $) (|x| $) ($ $))
        (SPADCALL |a| |x| (QREFELT $ 228))) 

(SDEFUN |EXPR;Beta;3$;75| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 230))) 

(SDEFUN |EXPR;digamma;2$;76| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 232))) 

(SDEFUN |EXPR;polygamma;3$;77| ((|k| $) (|x| $) ($ $))
        (SPADCALL |k| |x| (QREFELT $ 234))) 

(SDEFUN |EXPR;besselJ;3$;78| ((|v| $) (|x| $) ($ $))
        (SPADCALL |v| |x| (QREFELT $ 236))) 

(SDEFUN |EXPR;besselY;3$;79| ((|v| $) (|x| $) ($ $))
        (SPADCALL |v| |x| (QREFELT $ 238))) 

(SDEFUN |EXPR;besselI;3$;80| ((|v| $) (|x| $) ($ $))
        (SPADCALL |v| |x| (QREFELT $ 240))) 

(SDEFUN |EXPR;besselK;3$;81| ((|v| $) (|x| $) ($ $))
        (SPADCALL |v| |x| (QREFELT $ 242))) 

(SDEFUN |EXPR;airyAi;2$;82| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 244))) 

(SDEFUN |EXPR;airyAiPrime;2$;83| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 246))) 

(SDEFUN |EXPR;airyBi;2$;84| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 248))) 

(SDEFUN |EXPR;airyBiPrime;2$;85| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 250))) 

(SDEFUN |EXPR;lambertW;2$;86| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 252))) 

(SDEFUN |EXPR;polylog;3$;87| ((|s| $) (|x| $) ($ $))
        (SPADCALL |s| |x| (QREFELT $ 254))) 

(SDEFUN |EXPR;weierstrassP;4$;88| ((|g2| $) (|g3| $) (|x| $) ($ $))
        (SPADCALL |g2| |g3| |x| (QREFELT $ 256))) 

(SDEFUN |EXPR;weierstrassPPrime;4$;89| ((|g2| $) (|g3| $) (|x| $) ($ $))
        (SPADCALL |g2| |g3| |x| (QREFELT $ 258))) 

(SDEFUN |EXPR;weierstrassSigma;4$;90| ((|g2| $) (|g3| $) (|x| $) ($ $))
        (SPADCALL |g2| |g3| |x| (QREFELT $ 260))) 

(SDEFUN |EXPR;weierstrassZeta;4$;91| ((|g2| $) (|g3| $) (|x| $) ($ $))
        (SPADCALL |g2| |g3| |x| (QREFELT $ 262))) 

(SDEFUN |EXPR;weierstrassPInverse;4$;92| ((|g2| $) (|g3| $) (|z| $) ($ $))
        (SPADCALL |g2| |g3| |z| (QREFELT $ 264))) 

(SDEFUN |EXPR;whittakerM;4$;93| ((|k| $) (|m| $) (|z| $) ($ $))
        (SPADCALL |k| |m| |z| (QREFELT $ 266))) 

(SDEFUN |EXPR;whittakerW;4$;94| ((|k| $) (|m| $) (|z| $) ($ $))
        (SPADCALL |k| |m| |z| (QREFELT $ 268))) 

(SDEFUN |EXPR;angerJ;3$;95| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 270))) 

(SDEFUN |EXPR;weberE;3$;96| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 272))) 

(SDEFUN |EXPR;struveH;3$;97| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 274))) 

(SDEFUN |EXPR;struveL;3$;98| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 276))) 

(SDEFUN |EXPR;hankelH1;3$;99| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 278))) 

(SDEFUN |EXPR;hankelH2;3$;100| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 280))) 

(SDEFUN |EXPR;lommelS1;4$;101| ((|mu| $) (|nu| $) (|z| $) ($ $))
        (SPADCALL |mu| |nu| |z| (QREFELT $ 282))) 

(SDEFUN |EXPR;lommelS2;4$;102| ((|mu| $) (|nu| $) (|z| $) ($ $))
        (SPADCALL |mu| |nu| |z| (QREFELT $ 284))) 

(SDEFUN |EXPR;kummerM;4$;103| ((|mu| $) (|nu| $) (|z| $) ($ $))
        (SPADCALL |mu| |nu| |z| (QREFELT $ 286))) 

(SDEFUN |EXPR;kummerU;4$;104| ((|mu| $) (|nu| $) (|z| $) ($ $))
        (SPADCALL |mu| |nu| |z| (QREFELT $ 288))) 

(SDEFUN |EXPR;legendreP;4$;105| ((|nu| $) (|mu| $) (|z| $) ($ $))
        (SPADCALL |nu| |mu| |z| (QREFELT $ 290))) 

(SDEFUN |EXPR;legendreQ;4$;106| ((|nu| $) (|mu| $) (|z| $) ($ $))
        (SPADCALL |nu| |mu| |z| (QREFELT $ 292))) 

(SDEFUN |EXPR;kelvinBei;3$;107| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 294))) 

(SDEFUN |EXPR;kelvinBer;3$;108| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 296))) 

(SDEFUN |EXPR;kelvinKei;3$;109| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 298))) 

(SDEFUN |EXPR;kelvinKer;3$;110| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 300))) 

(SDEFUN |EXPR;ellipticK;2$;111| ((|m| $) ($ $)) (SPADCALL |m| (QREFELT $ 302))) 

(SDEFUN |EXPR;ellipticE;2$;112| ((|m| $) ($ $)) (SPADCALL |m| (QREFELT $ 304))) 

(SDEFUN |EXPR;ellipticE;3$;113| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 306))) 

(SDEFUN |EXPR;ellipticF;3$;114| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 308))) 

(SDEFUN |EXPR;ellipticPi;4$;115| ((|z| $) (|n| $) (|m| $) ($ $))
        (SPADCALL |z| |n| |m| (QREFELT $ 310))) 

(SDEFUN |EXPR;jacobiSn;3$;116| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 312))) 

(SDEFUN |EXPR;jacobiCn;3$;117| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 314))) 

(SDEFUN |EXPR;jacobiDn;3$;118| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 316))) 

(SDEFUN |EXPR;jacobiZeta;3$;119| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 318))) 

(SDEFUN |EXPR;jacobiTheta;3$;120| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 320))) 

(SDEFUN |EXPR;lerchPhi;4$;121| ((|z| $) (|s| $) (|a| $) ($ $))
        (SPADCALL |z| |s| |a| (QREFELT $ 322))) 

(SDEFUN |EXPR;riemannZeta;2$;122| ((|z| $) ($ $))
        (SPADCALL |z| (QREFELT $ 324))) 

(SDEFUN |EXPR;charlierC;4$;123| ((|n| $) (|a| $) (|z| $) ($ $))
        (SPADCALL |n| |a| |z| (QREFELT $ 326))) 

(SDEFUN |EXPR;hermiteH;3$;124| ((|n| $) (|z| $) ($ $))
        (SPADCALL |n| |z| (QREFELT $ 328))) 

(SDEFUN |EXPR;jacobiP;5$;125| ((|n| $) (|a| $) (|b| $) (|z| $) ($ $))
        (SPADCALL |n| |a| |b| |z| (QREFELT $ 330))) 

(SDEFUN |EXPR;laguerreL;4$;126| ((|n| $) (|a| $) (|z| $) ($ $))
        (SPADCALL |n| |a| |z| (QREFELT $ 332))) 

(SDEFUN |EXPR;meixnerM;5$;127| ((|n| $) (|b| $) (|c| $) (|z| $) ($ $))
        (SPADCALL |n| |b| |c| |z| (QREFELT $ 334))) 

(SDEFUN |EXPR;hypergeometricF;2L2$;128|
        ((|la| . #1=(|List| $)) (|lb| . #1#) (|x| $) ($ $))
        (SPADCALL |la| |lb| |x| (QREFELT $ 336))) 

(SDEFUN |EXPR;meijerG;4L2$;129|
        ((|la| . #1=(|List| $)) (|lb| . #1#) (|lc| . #1#) (|ld| . #1#) (|x| $)
         ($ $))
        (SPADCALL |la| |lb| |lc| |ld| |x| (QREFELT $ 339))) 

(SDEFUN |EXPR;^;3$;130| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 342))) 

(SDEFUN |EXPR;factorial;2$;131| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 343))) 

(SDEFUN |EXPR;binomial;3$;132| ((|n| $) (|m| $) ($ $))
        (SPADCALL |n| |m| (QREFELT $ 345))) 

(SDEFUN |EXPR;permutation;3$;133| ((|n| $) (|m| $) ($ $))
        (SPADCALL |n| |m| (QREFELT $ 347))) 

(SDEFUN |EXPR;factorials;2$;134| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 349))) 

(SDEFUN |EXPR;factorials;$S$;135| ((|x| $) (|n| |Symbol|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 351))) 

(SDEFUN |EXPR;summation;$S$;136| ((|x| $) (|n| |Symbol|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 353))) 

(SDEFUN |EXPR;summation;$Sb$;137| ((|x| $) (|s| |SegmentBinding| $) ($ $))
        (SPADCALL |x| |s| (QREFELT $ 356))) 

(SDEFUN |EXPR;product;$S$;138| ((|x| $) (|n| |Symbol|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 359))) 

(SDEFUN |EXPR;product;$Sb$;139| ((|x| $) (|s| |SegmentBinding| $) ($ $))
        (SPADCALL |x| |s| (QREFELT $ 361))) 

(SDEFUN |EXPR;erf;2$;140| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 364))) 

(SDEFUN |EXPR;erfi;2$;141| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 366))) 

(SDEFUN |EXPR;Ei;2$;142| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 368))) 

(SDEFUN |EXPR;Si;2$;143| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 370))) 

(SDEFUN |EXPR;Ci;2$;144| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 372))) 

(SDEFUN |EXPR;Shi;2$;145| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 374))) 

(SDEFUN |EXPR;Chi;2$;146| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 376))) 

(SDEFUN |EXPR;li;2$;147| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 378))) 

(SDEFUN |EXPR;dilog;2$;148| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 380))) 

(SDEFUN |EXPR;fresnelS;2$;149| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 382))) 

(SDEFUN |EXPR;fresnelC;2$;150| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 384))) 

(SDEFUN |EXPR;integral;$S$;151| ((|x| $) (|n| |Symbol|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 386))) 

(SDEFUN |EXPR;integral;$Sb$;152| ((|x| $) (|s| |SegmentBinding| $) ($ $))
        (SPADCALL |x| |s| (QREFELT $ 388))) 

(SDEFUN |EXPR;operator;2Bo;153| ((|op| . #1=(|BasicOperator|)) ($ . #1#))
        (SPROG ((|n| (|Union| (|NonNegativeInteger|) "failed")))
               (SEQ
                (COND
                 ((SPADCALL |op| (QREFELT $ 390))
                  (SPADCALL |op| (QREFELT $ 391)))
                 ((SPADCALL |op| (QREFELT $ 392))
                  (SPADCALL |op| (QREFELT $ 393)))
                 ((SPADCALL |op| (QREFELT $ 394))
                  (SPADCALL |op| (QREFELT $ 395)))
                 ((SPADCALL |op| (QREFELT $ 396))
                  (SPADCALL |op| (QREFELT $ 397)))
                 ((SPADCALL |op| (QREFELT $ 398))
                  (SPADCALL |op| (QREFELT $ 399)))
                 ((SPADCALL |op| (QREFELT $ 21))
                  (SPADCALL |op| (QREFELT $ 22)))
                 ((SPADCALL |op| (QREFELT $ 24))
                  (SPADCALL |op| (QREFELT $ 25)))
                 (#2='T
                  (SEQ
                   (COND
                    ((SPADCALL |op| (QREFELT $ 26))
                     (COND
                      ((SPADCALL |op| (QREFELT $ 7) (QREFELT $ 28))
                       (EXIT
                        (SPADCALL
                         (SPADCALL (SPADCALL |op| (QREFELT $ 29))
                                   (QREFELT $ 30))
                         (QREFELT $ 31)))))))
                   (LETT |n| (SPADCALL |op| (QREFELT $ 33))
                         |EXPR;operator;2Bo;153|)
                   (EXIT
                    (COND
                     ((QEQCAR |n| 1)
                      (SPADCALL (SPADCALL |op| (QREFELT $ 29)) (QREFELT $ 34)))
                     (#2#
                      (SPADCALL (SPADCALL |op| (QREFELT $ 29)) (QCDR |n|)
                                (QREFELT $ 36))))))))))) 

(SDEFUN |EXPR;reduc| ((|x| $) (|l| |List| (|Kernel| $)) ($ $))
        (SPROG
         ((|p| (|SparseUnivariatePolynomial| $)) (#1=#:G1011 NIL) (|k| NIL))
         (SEQ
          (SEQ (LETT |k| NIL . #2=(|EXPR;reduc|)) (LETT #1# |l| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |p| (SPADCALL |k| (QREFELT $ 134)) . #2#)
                    (EXIT
                     (LETT |x|
                           (SPADCALL
                            (|EXPR;evl| (SPADCALL |x| (QREFELT $ 100)) |k| |p|
                             $)
                            (|EXPR;evl| (SPADCALL |x| (QREFELT $ 102)) |k| |p|
                             $)
                            (QREFELT $ 68))
                           . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |x|)))) 

(SDEFUN |EXPR;evl0|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| $)) (|k| |Kernel| $)
         ($ |SparseUnivariatePolynomial|
          (|Fraction| (|SparseMultivariatePolynomial| R (|Kernel| $)))))
        (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 401)) |k| (QREFELT $ 404))
                  (QREFELT $ 406))) 

(SDEFUN |EXPR;evl|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| $)) (|k| |Kernel| $)
         (|m| |SparseUnivariatePolynomial| $)
         ($ |Fraction| (|SparseMultivariatePolynomial| R (|Kernel| $))))
        (COND
         ((< (SPADCALL |p| |k| (QREFELT $ 407)) (SPADCALL |m| (QREFELT $ 408)))
          (SPADCALL |p| (QREFELT $ 401)))
         ('T
          (SPADCALL (SPADCALL (|EXPR;evl0| |p| |k| $) |m| (QREFELT $ 409))
                    (SPADCALL (SPADCALL |k| (QREFELT $ 410)) (QREFELT $ 401))
                    (QREFELT $ 411))))) 

(SDEFUN |EXPR;noalg?| ((|p| |SparseUnivariatePolynomial| $) ($ |Boolean|))
        (SPROG ((#1=#:G1020 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |p| (|spadConstant| $ 412)
                                    (QREFELT $ 413)))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL
                            (NULL
                             (|EXPR;algkernels|
                              (SPADCALL (SPADCALL |p| (QREFELT $ 414))
                                        (QREFELT $ 75))
                              $)))
                           (PROGN
                            (LETT #1# NIL . #2=(|EXPR;noalg?|))
                            (GO #3=#:G1019)))
                          ('T
                           (LETT |p| (SPADCALL |p| (QREFELT $ 415)) . #2#)))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #3# (EXIT #1#)))) 

(SDEFUN |EXPR;algkers|
        ((|p| |SparseUnivariatePolynomial| $) ($ |List| (|Kernel| $)))
        (SPROG ((|res| (|List| (|Kernel| $))) (|lc| ($)))
               (SEQ (LETT |res| NIL . #1=(|EXPR;algkers|))
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |p| (|spadConstant| $ 412)
                                      (QREFELT $ 413)))
                           (GO G191)))
                         (SEQ (LETT |lc| (SPADCALL |p| (QREFELT $ 414)) . #1#)
                              (LETT |res|
                                    (SPADCALL (SPADCALL |lc| (QREFELT $ 83))
                                              |res| (QREFELT $ 416))
                                    . #1#)
                              (EXIT
                               (LETT |p| (SPADCALL |p| (QREFELT $ 415))
                                     . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |res| (QREFELT $ 417)))))) 

(SDEFUN |EXPR;algpars| ((|lk| |List| (|Kernel| $)) ($ |List| (|Kernel| $)))
        (SPROG
         ((|res| (|List| (|Kernel| $))) (|arg| (|List| $)) (#1=#:G1031 NIL)
          (|k| NIL))
         (SEQ (LETT |res| NIL . #2=(|EXPR;algpars|))
              (SEQ (LETT |k| NIL . #2#) (LETT #1# |lk| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     ((NULL (SPADCALL |k| '|nthRoot| (QREFELT $ 117)))
                      (COND
                       ((NULL (SPADCALL |k| '|rootOf| (QREFELT $ 117)))
                        (EXIT (|error| "apars: unknown kernel"))))))
                    (LETT |arg| (SPADCALL |k| (QREFELT $ 79)) . #2#)
                    (EXIT
                     (LETT |res|
                           (SPADCALL
                            (SPADCALL (SPADCALL |arg| 1 (QREFELT $ 81))
                                      (QREFELT $ 75))
                            |res| (QREFELT $ 416))
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT $ 417)))))) 

(SDEFUN |EXPR;trivial_denoms|
        ((|p| |SparseUnivariatePolynomial| $) ($ |Boolean|))
        (SPADCALL (CONS #'|EXPR;trivial_denoms!0| $)
                  (SPADCALL |p| (QREFELT $ 419)) (QREFELT $ 421))) 

(SDEFUN |EXPR;trivial_denoms!0| ((|c| NIL) ($ NIL))
        (SPADCALL (SPADCALL |c| (QREFELT $ 102)) (|spadConstant| $ 104)
                  (QREFELT $ 418))) 

(SDEFUN |EXPR;SUP_to_SUPP|
        ((|p| |SparseUnivariatePolynomial| $)
         ($ |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| R (|Kernel| $))))
        (SPADCALL (ELT $ 100) |p| (QREFELT $ 424))) 

(SDEFUN |EXPR;def_poly|
        ((|k| |Kernel| $)
         ($ |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| R (|Kernel| $))))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (#1=#:G1042 NIL)
          (|p1| (|SparseMultivariatePolynomial| R (|Kernel| $))) (|arg2| ($))
          (|arg1| ($)) (|args| (|List| $)))
         (SEQ
          (LETT |args| (SPADCALL |k| (QREFELT $ 79)) . #2=(|EXPR;def_poly|))
          (LETT |arg1| (SPADCALL |args| (QREFELT $ 85)) . #2#)
          (LETT |arg2| (SPADCALL |args| 2 (QREFELT $ 81)) . #2#)
          (EXIT
           (COND
            ((SPADCALL |k| '|rootOf| (QREFELT $ 117))
             (SEQ (LETT |p1| (SPADCALL |arg1| (QREFELT $ 100)) . #2#)
                  (EXIT
                   (SPADCALL |p1| (SPADCALL |arg2| (QREFELT $ 13))
                             (QREFELT $ 121)))))
            ((SPADCALL |k| '|nthRoot| (QREFELT $ 117))
             (SEQ
              (LETT |n|
                    (PROG1 (LETT #1# (SPADCALL |arg2| (QREFELT $ 425)) . #2#)
                      (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #1#))
                    . #2#)
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |arg1| (QREFELT $ 102)) |n|
                          (QREFELT $ 426))
                (SPADCALL (SPADCALL |arg1| (QREFELT $ 100)) (QREFELT $ 427))
                (QREFELT $ 428)))))
            ('T (|error| "def_poly : unknown kernel"))))))) 

(SDEFUN |EXPR;varmap1|
        ((|k0| |Kernel| $) (|lk| |List| (|Kernel| $)) (|ls| |List| (|Symbol|))
         ($ |Symbol|))
        (SPROG
         ((#1=#:G1050 NIL) (#2=#:G1051 NIL) (|k| NIL) (#3=#:G1052 NIL)
          (|s| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |s| NIL . #4=(|EXPR;varmap1|)) (LETT #3# |ls| . #4#)
                 (LETT |k| NIL . #4#) (LETT #2# |lk| . #4#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#) . #4#) NIL)
                       (ATOM #3#) (PROGN (LETT |s| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |k| |k0| (QREFELT $ 429))
                     (PROGN (LETT #1# |s| . #4#) (GO #5=#:G1049))))))
                 (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #4#)) . #4#)
                 (GO G190) G191 (EXIT NIL))
            (EXIT (|error| "varmap1: kernel not on the list"))))
          #5# (EXIT #1#)))) 

(SDEFUN |EXPR;varmap2|
        ((|s0| |Symbol|) (|lk| |List| (|Kernel| $)) (|ls| |List| (|Symbol|))
         ($ |Kernel| $))
        (SPROG
         ((#1=#:G1063 NIL) (#2=#:G1064 NIL) (|k| NIL) (#3=#:G1065 NIL)
          (|s| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |s| NIL . #4=(|EXPR;varmap2|)) (LETT #3# |ls| . #4#)
                 (LETT |k| NIL . #4#) (LETT #2# |lk| . #4#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#) . #4#) NIL)
                       (ATOM #3#) (PROGN (LETT |s| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((EQUAL |s| |s0|)
                     (PROGN (LETT #1# |k| . #4#) (GO #5=#:G1062))))))
                 (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #4#)) . #4#)
                 (GO G190) G191 (EXIT NIL))
            (EXIT (|error| "varmap2: symbol not on the list"))))
          #5# (EXIT #1#)))) 

(SDEFUN |EXPR;MP_to_PI|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| $))
         (|lk| |List| (|Kernel| $)) (|ls| |List| (|Symbol|))
         ($ |Polynomial| (|Integer|)))
        (SPROG NIL
               (SPADCALL (CONS #'|EXPR;MP_to_PI!0| (VECTOR |ls| |lk| $))
                         (ELT $ 434) |p| (QREFELT $ 438)))) 

(SDEFUN |EXPR;MP_to_PI!0| ((|k| NIL) ($$ NIL))
        (PROG ($ |lk| |ls|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;MP_to_PI|))
          (LETT |lk| (QREFELT $$ 1) . #1#)
          (LETT |ls| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (|spadConstant| $ 431) (|EXPR;varmap1| |k| |lk| |ls| $)
                      (|spadConstant| $ 432) (QREFELT $ 433)))))) 

(SDEFUN |EXPR;SUPP_to_PI|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| R (|Kernel| $)))
         (|lk| |List| (|Kernel| $)) (|ls| |List| (|Symbol|)) (|xk| |Kernel| $)
         ($ |Polynomial| (|Integer|)))
        (SPROG ((|p2| (|SparseMultivariatePolynomial| R (|Kernel| $))))
               (SEQ
                (LETT |p2| (SPADCALL |p| |xk| (QREFELT $ 439))
                      |EXPR;SUPP_to_PI|)
                (EXIT (|EXPR;MP_to_PI| |p2| |lk| |ls| $))))) 

(SDEFUN |EXPR;SUP_to_PI|
        ((|p| |SparseUnivariatePolynomial| $) (|lk| |List| (|Kernel| $))
         (|ls| |List| (|Symbol|)) (|xk| |Kernel| $)
         ($ |Polynomial| (|Integer|)))
        (SPROG
         ((|p1|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| $)))))
         (SEQ (LETT |p1| (|EXPR;SUP_to_SUPP| |p| $) |EXPR;SUP_to_PI|)
              (EXIT (|EXPR;SUPP_to_PI| |p1| |lk| |ls| |xk| $))))) 

(SDEFUN |EXPR;PI_to_SUP|
        ((|p| |Polynomial| (|Integer|)) (|lk| |List| (|Kernel| $))
         (|ls| |List| (|Symbol|)) (|xk| |Kernel| $)
         ($ |SparseUnivariatePolynomial| $))
        (SPROG
         ((|p3| (|SparseUnivariatePolynomial| $))
          (|p2|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| $))))
          (|p1| (|SparseMultivariatePolynomial| R (|Kernel| $))))
         (SEQ
          (LETT |p1|
                (SPADCALL (CONS #'|EXPR;PI_to_SUP!0| (VECTOR |ls| |lk| $))
                          (ELT $ 443) |p| (QREFELT $ 447))
                . #1=(|EXPR;PI_to_SUP|))
          (LETT |p2| (SPADCALL |p1| |xk| (QREFELT $ 121)) . #1#)
          (EXIT
           (LETT |p3| (SPADCALL (ELT $ 105) |p2| (QREFELT $ 450)) . #1#))))) 

(SDEFUN |EXPR;PI_to_SUP!0| ((|s| NIL) ($$ NIL))
        (PROG ($ |lk| |ls|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;PI_to_SUP|))
          (LETT |lk| (QREFELT $$ 1) . #1#)
          (LETT |ls| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (|spadConstant| $ 104) (|EXPR;varmap2| |s| |lk| |ls| $)
                      (|spadConstant| $ 432) (QREFELT $ 126)))))) 

(SDEFUN |EXPR;to_RF|
        ((|c| $) (|lk| |List| (|Kernel| $)) (|ls| |List| (|Symbol|))
         ($ |Fraction| (|Polynomial| (|Integer|))))
        (SPADCALL (|EXPR;MP_to_PI| (SPADCALL |c| (QREFELT $ 100)) |lk| |ls| $)
                  (|EXPR;MP_to_PI| (SPADCALL |c| (QREFELT $ 102)) |lk| |ls| $)
                  (QREFELT $ 455))) 

(SDEFUN |EXPR;SUPP_to_PT|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| R (|Kernel| $)))
         (|lk| |List| (|Kernel| $)) (|ls| |List| (|Symbol|)) (|k| |Kernel| $)
         (|s| |Symbol|)
         ($ |Record| (|:| |var| (|Symbol|))
          (|:| |coef|
               (|SparseUnivariatePolynomial|
                (|Fraction| (|Polynomial| (|Integer|)))))))
        (SPROG
         ((|up|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|Polynomial| (|Integer|)))))
          (|p2| (|SparseMultivariatePolynomial| R (|Kernel| $))))
         (SEQ
          (LETT |p2| (SPADCALL |p| |k| (QREFELT $ 439))
                . #1=(|EXPR;SUPP_to_PT|))
          (LETT |up|
                (SPADCALL
                 (SPADCALL (|EXPR;MP_to_PI| |p2| |lk| |ls| $) (QREFELT $ 456))
                 (QREFELT $ 458))
                . #1#)
          (EXIT (CONS |s| |up|))))) 

(SDEFUN |EXPR;SUP_to_PT|
        ((|p| |SparseUnivariatePolynomial| $) (|lk| |List| (|Kernel| $))
         (|ls| |List| (|Symbol|)) (|s| |Symbol|)
         ($ |Record| (|:| |var| (|Symbol|))
          (|:| |coef|
               (|SparseUnivariatePolynomial|
                (|Fraction| (|Polynomial| (|Integer|)))))))
        (SPROG
         ((|up|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|Polynomial| (|Integer|))))))
         (SEQ
          (LETT |up|
                (SPADCALL (CONS #'|EXPR;SUP_to_PT!0| (VECTOR $ |ls| |lk|)) |p|
                          (QREFELT $ 461))
                |EXPR;SUP_to_PT|)
          (EXIT (CONS |s| |up|))))) 

(SDEFUN |EXPR;SUP_to_PT!0| ((|c| NIL) ($$ NIL))
        (PROG (|lk| |ls| $)
          (LETT |lk| (QREFELT $$ 2) . #1=(|EXPR;SUP_to_PT|))
          (LETT |ls| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|EXPR;to_RF| |c| |lk| |ls| $))))) 

(SDEFUN |EXPR;gcdPolynomial;3Sup;172|
        ((|p| . #1=(|SparseUnivariatePolynomial| $)) (|q| . #1#) ($ . #1#))
        (SPROG
         ((|g2| (|Polynomial| (|Integer|)))
          (|lm2|
           (|List|
            (|Record| (|:| |var| (|Symbol|))
                      (|:| |coef|
                           (|SparseUnivariatePolynomial|
                            (|Fraction| (|Polynomial| (|Integer|))))))))
          (#2=#:G1116 NIL) (|m| NIL) (#3=#:G1117 NIL) (|k| NIL)
          (#4=#:G1115 NIL)
          (|q2|
           #5=(|Record| (|:| |var| (|Symbol|))
                        (|:| |coef|
                             (|SparseUnivariatePolynomial|
                              (|Fraction| (|Polynomial| (|Integer|)))))))
          (|p2| #5#) (|g1| (|Polynomial| (|Integer|)))
          (|p_syms| (|List| (|Symbol|))) (|a_syms| (|List| (|Symbol|)))
          (#6=#:G1114 NIL) (#7=#:G1113 NIL)
          (|lm1| (|List| (|Polynomial| (|Integer|)))) (#8=#:G1111 NIL)
          (#9=#:G1112 NIL) (#10=#:G1110 NIL)
          (|q1| #11=(|Polynomial| (|Integer|))) (|p1| #11#) (#12=#:G1109 NIL)
          (#13=#:G1108 NIL)
          (|lm|
           (|List|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| R (|Kernel| $)))))
          (#14=#:G1107 NIL) (#15=#:G1106 NIL) (|all_syms| (|List| (|Symbol|)))
          (|all_kers| (|List| (|Kernel| $))) (|xk| (|Kernel| $))
          (|x| #16=(|Symbol|)) (|all_syms0| (|List| #16#)) (#17=#:G1105 NIL)
          (#18=#:G1104 NIL) (|akers| (|List| (|Kernel| $)))
          (|all_kers0| (|List| (|Kernel| $))) (|apars| (|List| (|Kernel| $)))
          (|cl| (|List| $)))
         (SEQ
          (COND ((SPADCALL |p| (|spadConstant| $ 412) (QREFELT $ 462)) |q|)
                ((EQL (SPADCALL |p| (QREFELT $ 408)) 0) (|spadConstant| $ 463))
                ((SPADCALL |q| (|spadConstant| $ 412) (QREFELT $ 462)) |p|)
                (#19='T
                 (COND
                  ((EQL (SPADCALL |q| (QREFELT $ 408)) 0)
                   (|spadConstant| $ 463))
                  (#19#
                   (SEQ
                    (COND
                     ((|EXPR;noalg?| |p| $)
                      (COND
                       ((|EXPR;noalg?| |q| $)
                        (EXIT (SPADCALL |p| |q| (QREFELT $ 464)))))))
                    (LETT |cl|
                          (SPADCALL (SPADCALL |p| (QREFELT $ 419))
                                    (SPADCALL |q| (QREFELT $ 419))
                                    (QREFELT $ 465))
                          . #20=(|EXPR;gcdPolynomial;3Sup;172|))
                    (LETT |akers| (SPADCALL |cl| (QREFELT $ 466)) . #20#)
                    (LETT |apars| (|EXPR;algpars| |akers| $) . #20#)
                    (LETT |all_kers0|
                          (SPADCALL (SPADCALL |cl| (QREFELT $ 467)) |apars|
                                    (QREFELT $ 468))
                          . #20#)
                    (LETT |akers| (REVERSE (SPADCALL |akers| (QREFELT $ 469)))
                          . #20#)
                    (LETT |all_syms0|
                          (PROGN
                           (LETT #18# NIL . #20#)
                           (SEQ (LETT |k| NIL . #20#)
                                (LETT #17# |all_kers0| . #20#) G190
                                (COND
                                 ((OR (ATOM #17#)
                                      (PROGN (LETT |k| (CAR #17#) . #20#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #18#
                                        (CONS (SPADCALL (QREFELT $ 470)) #18#)
                                        . #20#)))
                                (LETT #17# (CDR #17#) . #20#) (GO G190) G191
                                (EXIT (NREVERSE #18#))))
                          . #20#)
                    (LETT |x| (SPADCALL (QREFELT $ 470)) . #20#)
                    (LETT |xk| (SPADCALL |x| (QREFELT $ 30)) . #20#)
                    (LETT |all_kers|
                          (SPADCALL |xk| |all_kers0| (QREFELT $ 471)) . #20#)
                    (LETT |all_syms| (CONS |x| |all_syms0|) . #20#)
                    (LETT |lm|
                          (PROGN
                           (LETT #15# NIL . #20#)
                           (SEQ (LETT |k| NIL . #20#)
                                (LETT #14# |akers| . #20#) G190
                                (COND
                                 ((OR (ATOM #14#)
                                      (PROGN (LETT |k| (CAR #14#) . #20#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #15#
                                        (CONS (|EXPR;def_poly| |k| $) #15#)
                                        . #20#)))
                                (LETT #14# (CDR #14#) . #20#) (GO G190) G191
                                (EXIT (NREVERSE #15#))))
                          . #20#)
                    (LETT |a_syms|
                          (PROGN
                           (LETT #13# NIL . #20#)
                           (SEQ (LETT |k| NIL . #20#)
                                (LETT #12# |akers| . #20#) G190
                                (COND
                                 ((OR (ATOM #12#)
                                      (PROGN (LETT |k| (CAR #12#) . #20#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #13#
                                        (CONS
                                         (|EXPR;varmap1| |k| |all_kers|
                                          |all_syms| $)
                                         #13#)
                                        . #20#)))
                                (LETT #12# (CDR #12#) . #20#) (GO G190) G191
                                (EXIT (NREVERSE #13#))))
                          . #20#)
                    (LETT |p_syms|
                          (SPADCALL |all_syms0| |a_syms| (QREFELT $ 472))
                          . #20#)
                    (COND
                     ((|EXPR;trivial_denoms| |p| $)
                      (COND
                       ((|EXPR;trivial_denoms| |q| $)
                        (EXIT
                         (SEQ
                          (LETT |p1|
                                (|EXPR;SUP_to_PI| |p| |all_kers| |all_syms|
                                 |xk| $)
                                . #20#)
                          (LETT |q1|
                                (|EXPR;SUP_to_PI| |q| |all_kers| |all_syms|
                                 |xk| $)
                                . #20#)
                          (LETT |lm1|
                                (PROGN
                                 (LETT #10# NIL . #20#)
                                 (SEQ (LETT |k| NIL . #20#)
                                      (LETT #9# |akers| . #20#)
                                      (LETT |m| NIL . #20#)
                                      (LETT #8# |lm| . #20#) G190
                                      (COND
                                       ((OR (ATOM #8#)
                                            (PROGN
                                             (LETT |m| (CAR #8#) . #20#)
                                             NIL)
                                            (ATOM #9#)
                                            (PROGN
                                             (LETT |k| (CAR #9#) . #20#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #10#
                                              (CONS
                                               (|EXPR;SUPP_to_PI| |m|
                                                |all_kers| |all_syms| |k| $)
                                               #10#)
                                              . #20#)))
                                      (LETT #8#
                                            (PROG1 (CDR #8#)
                                              (LETT #9# (CDR #9#) . #20#))
                                            . #20#)
                                      (GO G190) G191 (EXIT (NREVERSE #10#))))
                                . #20#)
                          (LETT |a_syms|
                                (PROGN
                                 (LETT #7# NIL . #20#)
                                 (SEQ (LETT |k| NIL . #20#)
                                      (LETT #6# |akers| . #20#) G190
                                      (COND
                                       ((OR (ATOM #6#)
                                            (PROGN
                                             (LETT |k| (CAR #6#) . #20#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #7#
                                              (CONS
                                               (|EXPR;varmap1| |k| |all_kers|
                                                |all_syms| $)
                                               #7#)
                                              . #20#)))
                                      (LETT #6# (CDR #6#) . #20#) (GO G190)
                                      G191 (EXIT (NREVERSE #7#))))
                                . #20#)
                          (LETT |p_syms|
                                (SPADCALL |all_syms0| |a_syms| (QREFELT $ 472))
                                . #20#)
                          (LETT |g1|
                                (SPADCALL |p1| |q1| |lm1| |p_syms| |x| |a_syms|
                                          (QREFELT $ 474))
                                . #20#)
                          (EXIT
                           (|EXPR;PI_to_SUP| |g1| |all_kers| |all_syms| |xk|
                            $))))))))
                    (LETT |p2|
                          (|EXPR;SUP_to_PT| |p| |all_kers0| |all_syms0| |x| $)
                          . #20#)
                    (LETT |q2|
                          (|EXPR;SUP_to_PT| |q| |all_kers0| |all_syms0| |x| $)
                          . #20#)
                    (LETT |lm2|
                          (PROGN
                           (LETT #4# NIL . #20#)
                           (SEQ (LETT |k| NIL . #20#) (LETT #3# |akers| . #20#)
                                (LETT |m| NIL . #20#) (LETT #2# |lm| . #20#)
                                G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |m| (CAR #2#) . #20#) NIL)
                                      (ATOM #3#)
                                      (PROGN (LETT |k| (CAR #3#) . #20#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #4#
                                        (CONS
                                         (|EXPR;SUPP_to_PT| |m| |all_kers0|
                                          |all_syms0| |k| |x| $)
                                         #4#)
                                        . #20#)))
                                (LETT #2#
                                      (PROG1 (CDR #2#)
                                        (LETT #3# (CDR #3#) . #20#))
                                      . #20#)
                                (GO G190) G191 (EXIT (NREVERSE #4#))))
                          . #20#)
                    (LETT |g2|
                          (SPADCALL |p2| |q2| |lm2| |p_syms| |x| |a_syms|
                                    (QREFELT $ 477))
                          . #20#)
                    (EXIT
                     (|EXPR;PI_to_SUP| |g2| |all_kers| |all_syms| |xk|
                      $)))))))))) 

(SDEFUN |EXPR;gcdPolynomial;3Sup;173|
        ((|p| . #1=(|SparseUnivariatePolynomial| $)) (|q| . #1#) ($ . #1#))
        (SEQ
         (COND
          ((|EXPR;noalg?| |p| $)
           (COND
            ((|EXPR;noalg?| |q| $)
             (EXIT (SPADCALL |p| |q| (QREFELT $ 464)))))))
         (EXIT (SPADCALL |p| |q| (QREFELT $ 480))))) 

(SDEFUN |EXPR;factorPolynomial;SupF;174|
        ((|x| |SparseUnivariatePolynomial| $)
         ($ |Factored| (|SparseUnivariatePolynomial| $)))
        (SPADCALL |x| (QREFELT $ 483))) 

(SDEFUN |EXPR;coerce;An$;175| ((|x| |AlgebraicNumber|) ($ $))
        (SPADCALL (SPADCALL |x| (|spadConstant| $ 487) (QREFELT $ 488))
                  (QREFELT $ 105))) 

(SDEFUN |EXPR;^;$F$;176| ((|x| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPADCALL |x| |r| (QREFELT $ 492))) 

(SDEFUN |EXPR;minPoly;KSup;177|
        ((|k| |Kernel| $) ($ |SparseUnivariatePolynomial| $))
        (SPADCALL |k| (QREFELT $ 494))) 

(SDEFUN |EXPR;definingPolynomial;2$;178| ((|x| $) ($ $))
        (SPADCALL |x| (QREFELT $ 495))) 

(SDEFUN |EXPR;retract;$F;179| ((|x| $) ($ |Fraction| (|Integer|)))
        (SPADCALL |x| (QREFELT $ 497))) 

(SDEFUN |EXPR;retractIfCan;$U;180|
        ((|x| $) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (SPADCALL |x| (QREFELT $ 499))) 

(SDEFUN |EXPR;coerce;An$;181| ((|x| |AlgebraicNumber|) ($ $))
        (SPADCALL (|EXPR;smp2expr| (SPADCALL |x| (QREFELT $ 501)) $)
                  (|EXPR;smp2expr| (SPADCALL |x| (QREFELT $ 502)) $)
                  (QREFELT $ 69))) 

(SDEFUN |EXPR;k2expr| ((|k| |Kernel| (|AlgebraicNumber|)) ($ $))
        (SPADCALL (ELT $ 490) |k| (QREFELT $ 506))) 

(SDEFUN |EXPR;smp2expr|
        ((|p| |SparseMultivariatePolynomial| (|Integer|)
          (|Kernel| (|AlgebraicNumber|)))
         ($ $))
        (SPADCALL (CONS (|function| |EXPR;k2expr|) $) (ELT $ 61) |p|
                  (QREFELT $ 511))) 

(SDEFUN |EXPR;retractIfCan;$U;184|
        ((|x| $) ($ |Union| (|AlgebraicNumber|) "failed"))
        (SPROG
         ((#1=#:G1156 NIL) (|d| #2=(|Union| (|AlgebraicNumber|) "failed"))
          (|n| #2#))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |n| (|EXPR;smp2an| (SPADCALL |x| (QREFELT $ 100)) $)
                   . #3=(|EXPR;retractIfCan;$U;184|))
             (EXIT
              (COND
               ((QEQCAR |n| 0)
                (SEQ
                 (LETT |d| (|EXPR;smp2an| (SPADCALL |x| (QREFELT $ 102)) $)
                       . #3#)
                 (EXIT
                  (COND
                   ((QEQCAR |d| 0)
                    (PROGN
                     (LETT #1#
                           (CONS 0
                                 (SPADCALL (QCDR |n|) (QCDR |d|)
                                           (QREFELT $ 512)))
                           . #3#)
                     (GO #4=#:G1151))))))))))
            (EXIT (CONS 1 "failed"))))
          #4# (EXIT #1#)))) 

(SDEFUN |EXPR;R2AN| ((|r| R) ($ |Union| (|AlgebraicNumber|) "failed"))
        (SPROG ((|u| (|Union| (|Fraction| (|Integer|)) "failed")))
               (SEQ
                (LETT |u|
                      (SPADCALL (SPADCALL |r| (QREFELT $ 515)) (QREFELT $ 72))
                      |EXPR;R2AN|)
                (EXIT
                 (COND
                  ((QEQCAR |u| 0)
                   (CONS 0 (SPADCALL (QCDR |u|) (QREFELT $ 516))))
                  ('T (CONS 1 "failed"))))))) 

(SDEFUN |EXPR;k2an| ((|k| |Kernel| $) ($ |Union| (|AlgebraicNumber|) "failed"))
        (SPROG
         ((|arg| (|List| (|AlgebraicNumber|))) (#1=#:G1188 NIL)
          (|a| #2=(|Union| (|AlgebraicNumber|) #3="failed")) (#4=#:G1189 NIL)
          (|x| NIL)
          (|eq|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| $))))
          (|eqa| (|SparseUnivariatePolynomial| (|AlgebraicNumber|)))
          (|ccu| #2#) (|cc| ($)) (|a1| ($)) (|s1| (|Symbol|))
          (|s1u| (|Union| (|Symbol|) #3#)) (|k1| (|Kernel| $))
          (|k1u| (|Union| (|Kernel| $) #3#)) (|a2| ($)) (|args| (|List| $))
          (|op| (|BasicOperator|)))
         (SEQ
          (EXIT
           (COND
            ((NULL
              (SPADCALL
               (LETT |op| (SPADCALL |k| (QREFELT $ 31)) . #5=(|EXPR;k2an|))
               (QREFELT $ 517)))
             (CONS 1 "failed"))
            ('T
             (COND
              ((SPADCALL |op| '|rootOf| (QREFELT $ 518))
               (SEQ (LETT |args| (SPADCALL |k| (QREFELT $ 79)) . #5#)
                    (LETT |a2| (SPADCALL |args| 2 (QREFELT $ 81)) . #5#)
                    (LETT |k1u| (SPADCALL |a2| (QREFELT $ 19)) . #5#)
                    (EXIT
                     (COND ((QEQCAR |k1u| 1) (CONS 1 "failed"))
                           (#6='T
                            (SEQ (LETT |k1| (QCDR |k1u|) . #5#)
                                 (LETT |s1u| (SPADCALL |a2| (QREFELT $ 520))
                                       . #5#)
                                 (EXIT
                                  (COND ((QEQCAR |s1u| 1) (CONS 1 "failed"))
                                        (#6#
                                         (SEQ (LETT |s1| (QCDR |s1u|) . #5#)
                                              (LETT |a1|
                                                    (SPADCALL |args| 1
                                                              (QREFELT $ 81))
                                                    . #5#)
                                              (EXIT
                                               (COND
                                                ((SPADCALL
                                                  (SPADCALL |a1|
                                                            (QREFELT $ 102))
                                                  (|spadConstant| $ 104)
                                                  (QREFELT $ 521))
                                                 (|error|
                                                  "Bad argument to rootOf"))
                                                (#6#
                                                 (SEQ
                                                  (LETT |eq|
                                                        (SPADCALL
                                                         (SPADCALL |a1|
                                                                   (QREFELT $
                                                                            100))
                                                         |k1| (QREFELT $ 121))
                                                        . #5#)
                                                  (LETT |eqa|
                                                        (|spadConstant| $ 523)
                                                        . #5#)
                                                  (SEQ G190
                                                       (COND
                                                        ((NULL
                                                          (SPADCALL |eq|
                                                                    (|spadConstant|
                                                                     $ 524)
                                                                    (QREFELT $
                                                                             525)))
                                                         (GO G191)))
                                                       (SEQ
                                                        (LETT |cc|
                                                              (SPADCALL
                                                               (SPADCALL |eq|
                                                                         (QREFELT
                                                                          $
                                                                          123))
                                                               (QREFELT $ 105))
                                                              . #5#)
                                                        (LETT |ccu|
                                                              (SPADCALL |cc|
                                                                        (QREFELT
                                                                         $
                                                                         514))
                                                              . #5#)
                                                        (EXIT
                                                         (COND
                                                          ((QEQCAR |ccu| 1)
                                                           (PROGN
                                                            (LETT #1#
                                                                  (CONS 1
                                                                        "failed")
                                                                  . #5#)
                                                            (GO #7=#:G1187)))
                                                          ('T
                                                           (SEQ
                                                            (LETT |eqa|
                                                                  (SPADCALL
                                                                   |eqa|
                                                                   (SPADCALL
                                                                    (QCDR
                                                                     |ccu|)
                                                                    (SPADCALL
                                                                     |eq|
                                                                     (QREFELT $
                                                                              526))
                                                                    (QREFELT $
                                                                             527))
                                                                   (QREFELT $
                                                                            528))
                                                                  . #5#)
                                                            (EXIT
                                                             (LETT |eq|
                                                                   (SPADCALL
                                                                    |eq|
                                                                    (QREFELT $
                                                                             124))
                                                                   . #5#)))))))
                                                       NIL (GO G190) G191
                                                       (EXIT NIL))
                                                  (EXIT
                                                   (CONS 0
                                                         (SPADCALL |eqa| |s1|
                                                                   (QREFELT $
                                                                            529))))))))))))))))))
              (#6#
               (SEQ (LETT |arg| NIL . #5#)
                    (SEQ (LETT |x| NIL . #5#)
                         (LETT #4# (SPADCALL |k| (QREFELT $ 79)) . #5#) G190
                         (COND
                          ((OR (ATOM #4#)
                               (PROGN (LETT |x| (CAR #4#) . #5#) NIL))
                           (GO G191)))
                         (SEQ (LETT |a| (SPADCALL |x| (QREFELT $ 514)) . #5#)
                              (EXIT
                               (COND
                                ((QEQCAR |a| 1)
                                 (PROGN
                                  (LETT #1# (CONS 1 "failed") . #5#)
                                  (GO #7#)))
                                ('T
                                 (LETT |arg| (CONS (QCDR |a|) |arg|) . #5#)))))
                         (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (CONS 0
                           (SPADCALL (SPADCALL |op| (QREFELT $ 530))
                                     (NREVERSE |arg|) (QREFELT $ 531))))))))))
          #7# (EXIT #1#)))) 

(SDEFUN |EXPR;smp2an|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| $))
         ($ |Union| (|AlgebraicNumber|) #1="failed"))
        (SPROG
         ((|c| (|Union| (|AlgebraicNumber|) #1#))
          (|up|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| $))))
          (|ans| (|AlgebraicNumber|)) (#2=#:G1204 NIL)
          (|t| (|Union| (|AlgebraicNumber|) "failed")) (|k| (|Kernel| $))
          (|x1| (|Union| (|Kernel| $) "failed")))
         (SEQ
          (EXIT
           (SEQ (LETT |x1| (SPADCALL |p| (QREFELT $ 533)) . #3=(|EXPR;smp2an|))
                (EXIT
                 (COND
                  ((QEQCAR |x1| 1)
                   (|EXPR;R2AN| (SPADCALL |p| (QREFELT $ 534)) $))
                  (#4='T
                   (SEQ
                    (LETT |up|
                          (SPADCALL |p| (LETT |k| (QCDR |x1|) . #3#)
                                    (QREFELT $ 121))
                          . #3#)
                    (LETT |t| (|EXPR;k2an| |k| $) . #3#)
                    (EXIT
                     (COND ((QEQCAR |t| 1) (CONS 1 "failed"))
                           (#4#
                            (SEQ (LETT |ans| (|spadConstant| $ 535) . #3#)
                                 (SEQ G190
                                      (COND
                                       ((NULL
                                         (NULL
                                          (SPADCALL |up| (QREFELT $ 536))))
                                        (GO G191)))
                                      (SEQ
                                       (LETT |c|
                                             (|EXPR;smp2an|
                                              (SPADCALL |up| (QREFELT $ 123))
                                              $)
                                             . #3#)
                                       (EXIT
                                        (COND
                                         ((QEQCAR |c| 1)
                                          (PROGN
                                           (LETT #2# (CONS 1 "failed") . #3#)
                                           (GO #5=#:G1203)))
                                         ('T
                                          (SEQ
                                           (LETT |ans|
                                                 (SPADCALL |ans|
                                                           (SPADCALL (QCDR |c|)
                                                                     (SPADCALL
                                                                      (QCDR
                                                                       |t|)
                                                                      (SPADCALL
                                                                       |up|
                                                                       (QREFELT
                                                                        $ 526))
                                                                      (QREFELT
                                                                       $ 537))
                                                                     (QREFELT $
                                                                              538))
                                                           (QREFELT $ 539))
                                                 . #3#)
                                           (EXIT
                                            (LETT |up|
                                                  (SPADCALL |up|
                                                            (QREFELT $ 124))
                                                  . #3#)))))))
                                      NIL (GO G190) G191 (EXIT NIL))
                                 (LETT |c|
                                       (|EXPR;smp2an|
                                        (SPADCALL |up| (QREFELT $ 123)) $)
                                       . #3#)
                                 (EXIT
                                  (COND ((QEQCAR |c| 1) (CONS 1 "failed"))
                                        (#4#
                                         (CONS 0
                                               (SPADCALL |ans| (QCDR |c|)
                                                         (QREFELT $
                                                                  539))))))))))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |EXPR;convert;$If;188| ((|x| $) ($ |InputForm|))
        (SPADCALL |x| (QREFELT $ 541))) 

(SDEFUN |EXPR;eval;$Bo$S$;189|
        ((|f| $) (|op| |BasicOperator|) (|g| $) (|x| |Symbol|) ($ $))
        (SPADCALL |f| (LIST |op|) (LIST |g|) |x| (QREFELT $ 544))) 

(SDEFUN |EXPR;eval;$LLS$;190|
        ((|f| $) (|ls| |List| (|BasicOperator|)) (|lg| |List| $) (|x| |Symbol|)
         ($ $))
        (SPROG
         ((|res| ($)) (#1=#:G1235 NIL) (|g| NIL) (#2=#:G1234 NIL)
          (|nlg| (|List| $)) (#3=#:G1233 NIL) (#4=#:G1232 NIL)
          (|lbackwardSubs| (|List| (|Equation| $))) (#5=#:G1230 NIL) (|i| NIL)
          (#6=#:G1231 NIL) (|j| NIL) (#7=#:G1229 NIL)
          (|lforwardSubs| (|List| (|Equation| $))) (#8=#:G1227 NIL)
          (#9=#:G1228 NIL) (#10=#:G1226 NIL) (|ns| (|List| (|Symbol|)))
          (#11=#:G1225 NIL) (#12=#:G1224 NIL) (#13=#:G1223 NIL)
          (#14=#:G1222 NIL) (|lsd| (|List| (|Symbol|)))
          (|lsym| (|List| (|Symbol|))) (|llsym| (|List| (|List| (|Symbol|))))
          (#15=#:G1221 NIL) (#16=#:G1220 NIL))
         (SEQ
          (LETT |llsym|
                (PROGN
                 (LETT #16# NIL . #17=(|EXPR;eval;$LLS$;190|))
                 (SEQ (LETT |g| NIL . #17#) (LETT #15# |lg| . #17#) G190
                      (COND
                       ((OR (ATOM #15#)
                            (PROGN (LETT |g| (CAR #15#) . #17#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #16# (CONS (SPADCALL |g| (QREFELT $ 546)) #16#)
                              . #17#)))
                      (LETT #15# (CDR #15#) . #17#) (GO G190) G191
                      (EXIT (NREVERSE #16#))))
                . #17#)
          (LETT |lsym|
                (SPADCALL (SPADCALL |llsym| (QREFELT $ 547)) (QREFELT $ 548))
                . #17#)
          (LETT |lsd| (SPADCALL (ELT $ 549) |lsym| (QREFELT $ 551)) . #17#)
          (EXIT
           (COND
            ((NULL |lsd|)
             (SPADCALL |f| |ls|
                       (PROGN
                        (LETT #14# NIL . #17#)
                        (SEQ (LETT |g| NIL . #17#) (LETT #13# |lg| . #17#) G190
                             (COND
                              ((OR (ATOM #13#)
                                   (PROGN (LETT |g| (CAR #13#) . #17#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #14#
                                     (CONS (SPADCALL |g| |x| (QREFELT $ 553))
                                           #14#)
                                     . #17#)))
                             (LETT #13# (CDR #13#) . #17#) (GO G190) G191
                             (EXIT (NREVERSE #14#))))
                       (QREFELT $ 556)))
            ('T
             (SEQ
              (LETT |ns|
                    (PROGN
                     (LETT #12# NIL . #17#)
                     (SEQ (LETT |i| NIL . #17#) (LETT #11# |lsd| . #17#) G190
                          (COND
                           ((OR (ATOM #11#)
                                (PROGN (LETT |i| (CAR #11#) . #17#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #12# (CONS (SPADCALL (QREFELT $ 470)) #12#)
                                  . #17#)))
                          (LETT #11# (CDR #11#) . #17#) (GO G190) G191
                          (EXIT (NREVERSE #12#))))
                    . #17#)
              (LETT |lforwardSubs|
                    (PROGN
                     (LETT #10# NIL . #17#)
                     (SEQ (LETT |j| NIL . #17#) (LETT #9# |ns| . #17#)
                          (LETT |i| NIL . #17#) (LETT #8# |lsd| . #17#) G190
                          (COND
                           ((OR (ATOM #8#)
                                (PROGN (LETT |i| (CAR #8#) . #17#) NIL)
                                (ATOM #9#)
                                (PROGN (LETT |j| (CAR #9#) . #17#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #10#
                                  (CONS
                                   (SPADCALL (SPADCALL |i| (QREFELT $ 557))
                                             (SPADCALL |j| (QREFELT $ 557))
                                             (QREFELT $ 559))
                                   #10#)
                                  . #17#)))
                          (LETT #8#
                                (PROG1 (CDR #8#) (LETT #9# (CDR #9#) . #17#))
                                . #17#)
                          (GO G190) G191 (EXIT (NREVERSE #10#))))
                    . #17#)
              (LETT |lbackwardSubs|
                    (PROGN
                     (LETT #7# NIL . #17#)
                     (SEQ (LETT |j| NIL . #17#) (LETT #6# |ns| . #17#)
                          (LETT |i| NIL . #17#) (LETT #5# |lsd| . #17#) G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |i| (CAR #5#) . #17#) NIL)
                                (ATOM #6#)
                                (PROGN (LETT |j| (CAR #6#) . #17#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7#
                                  (CONS
                                   (SPADCALL (SPADCALL |j| (QREFELT $ 557))
                                             (SPADCALL |i| (QREFELT $ 557))
                                             (QREFELT $ 559))
                                   #7#)
                                  . #17#)))
                          (LETT #5#
                                (PROG1 (CDR #5#) (LETT #6# (CDR #6#) . #17#))
                                . #17#)
                          (GO G190) G191 (EXIT (NREVERSE #7#))))
                    . #17#)
              (LETT |nlg|
                    (PROGN
                     (LETT #4# NIL . #17#)
                     (SEQ (LETT |g| NIL . #17#) (LETT #3# |lg| . #17#) G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |g| (CAR #3#) . #17#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS
                                   (SPADCALL |g| |lforwardSubs|
                                             (QREFELT $ 561))
                                   #4#)
                                  . #17#)))
                          (LETT #3# (CDR #3#) . #17#) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    . #17#)
              (LETT |res|
                    (SPADCALL |f| |ls|
                              (PROGN
                               (LETT #2# NIL . #17#)
                               (SEQ (LETT |g| NIL . #17#)
                                    (LETT #1# |nlg| . #17#) G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |g| (CAR #1#) . #17#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (SPADCALL |g| |x| (QREFELT $ 553))
                                             #2#)
                                            . #17#)))
                                    (LETT #1# (CDR #1#) . #17#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT $ 556))
                    . #17#)
              (EXIT (SPADCALL |res| |lbackwardSubs| (QREFELT $ 561)))))))))) 

(SDEFUN |EXPR;patternMatch;$P2Pmr;191|
        ((|x| $) (|p| |Pattern| #1=(|Integer|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (QREFELT $ 565))) 

(SDEFUN |EXPR;patternMatch;$P2Pmr;192|
        ((|x| $) (|p| |Pattern| #1=(|Float|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (QREFELT $ 571))) 

(SDEFUN |EXPR;Zero;$;193| (($ $)) (|spadConstant| $ 46)) 

(SDEFUN |EXPR;One;$;194| (($ $)) (|spadConstant| $ 48)) 

(SDEFUN |EXPR;-;2$;195| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 55))) 

(SDEFUN |EXPR;*;I2$;196| ((|n| |Integer|) (|x| $) ($ $))
        (SPADCALL |n| |x| (QREFELT $ 58))) 

(SDEFUN |EXPR;*;3$;197| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 62))) 

(SDEFUN |EXPR;+;3$;198| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 64))) 

(SDEFUN |EXPR;=;2$B;199| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 51))) 

(SDEFUN |EXPR;smaller?;2$B;200| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 95))) 

(PUT '|EXPR;numer;$Smp;201| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |EXPR;numer;$Smp;201|
        ((|x| $) ($ |SparseMultivariatePolynomial| R (|Kernel| $))) |x|) 

(PUT '|EXPR;coerce;Smp$;202| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |EXPR;coerce;Smp$;202|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| $)) ($ $)) |p|) 

(SDEFUN |EXPR;coerce;P$;203| ((|p| |Polynomial| R) ($ $))
        (|EXPR;poly_to_MP| |p| $)) 

(SDEFUN |EXPR;reducedSystem;MM;204| ((|m| |Matrix| $) ($ |Matrix| R))
        (SPADCALL |m| (QREFELT $ 574))) 

(SDEFUN |EXPR;reducedSystem;MVR;205|
        ((|m| |Matrix| $) (|v| |Vector| $)
         ($ |Record| (|:| |mat| (|Matrix| R)) (|:| |vec| (|Vector| R))))
        (SPADCALL |m| |v| (QREFELT $ 575))) 

(SDEFUN |EXPR;convert;$If;206| ((|x| $) ($ |InputForm|))
        (SPADCALL |x| (QREFELT $ 541))) 

(SDEFUN |EXPR;kintmatch|
        ((|k| |Kernel| $) (|p| |Pattern| (|Integer|))
         (|l| |PatternMatchResult| (|Integer|) |Rep|)
         ($ |PatternMatchResult| (|Integer|) |Rep|))
        (SPADCALL |k| |p| |l| (QREFELT $ 577))) 

(SDEFUN |EXPR;patternMatch;$P2Pmr;208|
        ((|x| $) (|p| |Pattern| #1=(|Integer|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (CONS (|function| |EXPR;kintmatch|) $)
                  (QREFELT $ 581))) 

(SDEFUN |EXPR;kfltmatch|
        ((|k| |Kernel| $) (|p| |Pattern| (|Float|))
         (|l| |PatternMatchResult| (|Float|) |Rep|)
         ($ |PatternMatchResult| (|Float|) |Rep|))
        (SPADCALL |k| |p| |l| (QREFELT $ 583))) 

(SDEFUN |EXPR;patternMatch;$P2Pmr;210|
        ((|x| $) (|p| |Pattern| #1=(|Float|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (CONS (|function| |EXPR;kfltmatch|) $)
                  (QREFELT $ 587))) 

(SDEFUN |EXPR;Zero;$;211| (($ $)) (|spadConstant| $ 46)) 

(SDEFUN |EXPR;+;3$;212| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 64))) 

(SDEFUN |EXPR;=;2$B;213| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 51))) 

(SDEFUN |EXPR;smaller?;2$B;214| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 95))) 

(SDEFUN |EXPR;coerce;K$;215| ((|k| |Kernel| $) ($ $))
        (SPADCALL |k| (QREFELT $ 588))) 

(SDEFUN |EXPR;kernels;$L;216| ((|x| $) ($ |List| (|Kernel| $)))
        (SPROG ((#1=#:G1274 NIL) (|f| NIL) (#2=#:G1273 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|EXPR;kernels;$L;216|))
                 (SEQ (LETT |f| NIL . #3#)
                      (LETT #1# (SPADCALL |x| (QREFELT $ 591)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QCAR |f|) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |EXPR;coerce;R$;217| ((|x| R) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 592)) (|spadConstant| $ 47))
              ('T (SPADCALL (SPADCALL |x| (QREFELT $ 593)) (QREFELT $ 138))))) 

(SDEFUN |EXPR;retract;$R;218| ((|x| $) ($ R))
        (COND ((SPADCALL |x| (QREFELT $ 54)) (|spadConstant| $ 88))
              ('T (|EXPR;retNotUnit| |x| $)))) 

(SDEFUN |EXPR;coerce;$Of;219| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 595))) 

(SDEFUN |EXPR;kereval|
        ((|k| |Kernel| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG NIL
               (SPADCALL |lk| |lv| |k|
                         (CONS #'|EXPR;kereval!1| (VECTOR |lk| |lv| $))
                         (QREFELT $ 601)))) 

(SDEFUN |EXPR;kereval!1| ((|x2| NIL) ($$ NIL))
        (PROG ($ |lv| |lk|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;kereval|))
          (LETT |lv| (QREFELT $$ 1) . #1#)
          (LETT |lk| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|EXPR;kereval!0| (VECTOR $ |lv| |lk|))
                             |x2| (QREFELT $ 598))))))) 

(SDEFUN |EXPR;kereval!0| ((|x1| NIL) ($$ NIL))
        (PROG (|lk| |lv| $)
          (LETT |lk| (QREFELT $$ 2) NIL)
          (LETT |lv| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x1| |lk| |lv| (QREFELT $ 597)))))) 

(SDEFUN |EXPR;subeval|
        ((|k| |Kernel| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG NIL
               (SEQ
                (SPADCALL |lk| |lv| |k|
                          (CONS #'|EXPR;subeval!0| (VECTOR |lv| |lk| $))
                          (QREFELT $ 601))))) 

(SDEFUN |EXPR;subeval!0| ((|x| NIL) ($$ NIL))
        (PROG ($ |lk| |lv|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;subeval|))
          (LETT |lk| (QREFELT $$ 1) . #1#)
          (LETT |lv| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G1298 NIL) (|a| NIL) (#3=#:G1297 NIL))
                   (SEQ
                    (SPADCALL (SPADCALL |x| (QREFELT $ 31))
                              (PROGN
                               (LETT #3# NIL NIL)
                               (SEQ (LETT |a| NIL NIL)
                                    (LETT #2# (SPADCALL |x| (QREFELT $ 79))
                                          NIL)
                                    G190
                                    (COND
                                     ((OR (ATOM #2#)
                                          (PROGN (LETT |a| (CAR #2#) NIL) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #3#
                                            (CONS
                                             (SPADCALL |a| |lk| |lv|
                                                       (QREFELT $ 602))
                                             #3#)
                                            NIL)))
                                    (LETT #2# (CDR #2#) NIL) (GO G190) G191
                                    (EXIT (NREVERSE #3#))))
                              (QREFELT $ 603)))))))) 

(SDEFUN |EXPR;isPlus;$U;222| ((|x| $) ($ |Union| (|List| $) "failed"))
        (SPROG
         ((#1=#:G1313 NIL) (|t| NIL) (#2=#:G1312 NIL)
          (|l|
           (|List| (|Record| (|:| |k| (|Kernel| $)) (|:| |c| (|Integer|))))))
         (SEQ
          (COND
           ((OR
             (NULL
              (LETT |l| (SPADCALL |x| (QREFELT $ 591))
                    . #3=(|EXPR;isPlus;$U;222|)))
             (NULL (CDR |l|)))
            (CONS 1 "failed"))
           ('T
            (CONS 0
                  (PROGN
                   (LETT #2# NIL . #3#)
                   (SEQ (LETT |t| NIL . #3#) (LETT #1# |l| . #3#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS
                                 (SPADCALL (QCDR |t|) (QCAR |t|)
                                           (QREFELT $ 604))
                                 #2#)
                                . #3#)))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#)))))))))) 

(SDEFUN |EXPR;isMult;$U;223|
        ((|x| $)
         ($ |Union|
          (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| $)))
          "failed"))
        (SPROG
         ((|t| (|Record| (|:| |k| (|Kernel| $)) (|:| |c| (|Integer|))))
          (|l|
           (|List| (|Record| (|:| |k| (|Kernel| $)) (|:| |c| (|Integer|))))))
         (SEQ
          (COND
           ((OR
             (NULL
              (LETT |l| (SPADCALL |x| (QREFELT $ 591))
                    . #1=(|EXPR;isMult;$U;223|)))
             (NULL (NULL (CDR |l|))))
            (CONS 1 "failed"))
           ('T
            (SEQ (LETT |t| (SPADCALL |l| (QREFELT $ 607)) . #1#)
                 (EXIT (CONS 0 (CONS (QCDR |t|) (QCAR |t|)))))))))) 

(SDEFUN |EXPR;eval;$LL$;224|
        ((|x| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG
         ((#1=#:G1329 NIL) (#2=#:G1328 ($)) (#3=#:G1330 ($)) (#4=#:G1332 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|EXPR;eval;$LL$;224|))
           (SEQ (LETT |t| NIL . #5#)
                (LETT #4# (SPADCALL |x| (QREFELT $ 591)) . #5#) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (QCDR |t|)
                                   (|EXPR;kereval| (QCAR |t|) |lk| |lv| $)
                                   (QREFELT $ 58))
                         . #5#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 65)) . #5#))
                    ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 47))))))) 

(SDEFUN |EXPR;subst;$LL$;225|
        ((|x| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG
         ((#1=#:G1335 NIL) (#2=#:G1334 ($)) (#3=#:G1336 ($)) (#4=#:G1338 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|EXPR;subst;$LL$;225|))
           (SEQ (LETT |t| NIL . #5#)
                (LETT #4# (SPADCALL |x| (QREFELT $ 591)) . #5#) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (QCDR |t|)
                                   (|EXPR;subeval| (QCAR |t|) |lk| |lv| $)
                                   (QREFELT $ 58))
                         . #5#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 65)) . #5#))
                    ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 47))))))) 

(SDEFUN |EXPR;retractIfCan;$U;226| ((|x| $) ($ |Union| R "failed"))
        (COND ((SPADCALL |x| (QREFELT $ 54)) (CONS 0 (|spadConstant| $ 88)))
              ('T (|EXPR;retNotUnitIfCan| |x| $)))) 

(SDEFUN |EXPR;-;2$;227| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 55))) 

(SDEFUN |EXPR;smaller?;2$B;228| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 95))) 

(SDEFUN |EXPR;=;2$B;229| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 51))) 

(PUT '|EXPR;coerce;K$;230| '|SPADreplace| '(XLAM (|k|) |k|)) 

(SDEFUN |EXPR;coerce;K$;230| ((|k| |Kernel| $) ($ $)) |k|) 

(PUT '|EXPR;kernels;$L;231| '|SPADreplace| 'LIST) 

(SDEFUN |EXPR;kernels;$L;231| ((|x| $) ($ |List| (|Kernel| $))) (LIST |x|)) 

(SDEFUN |EXPR;coerce;R$;232| ((|x| R) ($ $)) (SPADCALL |x| (QREFELT $ 593))) 

(SDEFUN |EXPR;retract;$R;233| ((|x| $) ($ R)) (|EXPR;retNotUnit| |x| $)) 

(SDEFUN |EXPR;retractIfCan;$U;234| ((|x| $) ($ |Union| R "failed"))
        (|EXPR;retNotUnitIfCan| |x| $)) 

(SDEFUN |EXPR;coerce;$Of;235| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 595))) 

(SDEFUN |EXPR;eval;$LL$;236|
        ((|x| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG NIL
               (SPADCALL |lk| |lv| |x|
                         (CONS #'|EXPR;eval;$LL$;236!1| (VECTOR |lk| |lv| $))
                         (QREFELT $ 601)))) 

(SDEFUN |EXPR;eval;$LL$;236!1| ((|x1| NIL) ($$ NIL))
        (PROG ($ |lv| |lk|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;eval;$LL$;236|))
          (LETT |lv| (QREFELT $$ 1) . #1#)
          (LETT |lk| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL
                    (CONS #'|EXPR;eval;$LL$;236!0| (VECTOR $ |lv| |lk|)) |x1|
                    (QREFELT $ 598))))))) 

(SDEFUN |EXPR;eval;$LL$;236!0| ((|x2| NIL) ($$ NIL))
        (PROG (|lk| |lv| $)
          (LETT |lk| (QREFELT $$ 2) NIL)
          (LETT |lv| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x2| |lk| |lv| (QREFELT $ 597)))))) 

(SDEFUN |EXPR;subst;$LL$;237|
        ((|x| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG NIL
               (SEQ
                (SPADCALL |lk| |lv| |x|
                          (CONS #'|EXPR;subst;$LL$;237!0| (VECTOR |lv| |lk| $))
                          (QREFELT $ 601))))) 

(SDEFUN |EXPR;subst;$LL$;237!0| ((|x1| NIL) ($$ NIL))
        (PROG ($ |lk| |lv|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;subst;$LL$;237|))
          (LETT |lk| (QREFELT $$ 1) . #1#)
          (LETT |lv| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G1374 NIL) (|a| NIL) (#3=#:G1373 NIL))
                   (SEQ
                    (SPADCALL (SPADCALL |x1| (QREFELT $ 31))
                              (PROGN
                               (LETT #3# NIL NIL)
                               (SEQ (LETT |a| NIL NIL)
                                    (LETT #2# (SPADCALL |x1| (QREFELT $ 79))
                                          NIL)
                                    G190
                                    (COND
                                     ((OR (ATOM #2#)
                                          (PROGN (LETT |a| (CAR #2#) NIL) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #3#
                                            (CONS
                                             (SPADCALL |a| |lk| |lv|
                                                       (QREFELT $ 602))
                                             #3#)
                                            NIL)))
                                    (LETT #2# (CDR #2#) NIL) (GO G190) G191
                                    (EXIT (NREVERSE #3#))))
                              (QREFELT $ 603)))))))) 

(SDEFUN |EXPR;convert;$If;238| ((|x| $) ($ |InputForm|))
        (SPADCALL |x| (QREFELT $ 541))) 

(DECLAIM (NOTINLINE |Expression;|)) 

(DEFUN |Expression| (#1=#:G1420)
  (SPROG NIL
         (PROG (#2=#:G1421)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Expression|)
                                               '|domainEqualList|)
                    . #3=(|Expression|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Expression;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|Expression|)))))))))) 

(DEFUN |Expression;| (|#1|)
  (SPROG
   ((#1=#:G1419 NIL) (|pv$| NIL) (#2=#:G1415 NIL) (#3=#:G1416 NIL)
    (#4=#:G1417 NIL) (#5=#:G1418 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #6=(|Expression|))
    (LETT |dv$| (LIST '|Expression| DV$1) . #6#)
    (LETT $ (GETREFV 645) . #6#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (LETT #5#
                                              (|HasCategory| |#1| '(|Ring|))
                                              . #6#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #5#)
                                        (|HasCategory| |#1|
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (|HasCategory| |#1| '(|Group|))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Float|))))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|PatternMatchable|
                                                         (|Float|)))
                                        (|HasCategory| |#1|
                                                       '(|PatternMatchable|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|SemiGroup|))
                                        (OR (|HasCategory| |#1| '(|Group|))
                                            (|HasCategory| |#1|
                                                           '(|SemiGroup|)))
                                        (OR (|HasCategory| |#1| '(|Group|))
                                            #5#)
                                        (LETT #4#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#1|
                                                              '(|IntegralDomain|)))
                                              . #6#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #4#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #5#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Integer|)))
                                         #5#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|)))
                                        (OR (|HasCategory| |#1| '(|Group|))
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         #5#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|))
                                              . #6#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #3#)
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|AbelianSemiGroup|))
                                              . #6#)
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #2#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #2#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #5#)
                                        (OR #2#
                                            (|HasCategory| |#1|
                                                           '(|SemiGroup|)))))
                    . #6#))
    (|haddProp| |$ConstructorCache| '|Expression| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|RetractableTo| (|Integer|)))
         (|augmentPredVector| $ 2147483648))
    (AND (|HasCategory| $ '(|Ring|)) (|augmentPredVector| $ 4294967296))
    (AND (|HasCategory| |#1| '(|IntegralDomain|))
         (|HasCategory| $ '(|RetractableTo| (|Integer|)))
         (|augmentPredVector| $ 8589934592))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| $ '(|CharacteristicNonZero|)))
           . #6#)
     (|augmentPredVector| $ 17179869184))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| $ 34359738368))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 7 '|%symbol|)
    (QSETREFV $ 8 '|%alg|)
    (COND ((|testBitVector| |pv$| 1))
          ('T
           (QSETREFV $ 37
                     (CONS (|dispatchFunction| |EXPR;operator;2Bo;4|) $))))
    (COND
     ((|testBitVector| |pv$| 5)
      (PROGN
       (COND
        ((|testBitVector| |pv$| 1)
         (PROGN
          (QSETREFV $ 45
                    (|Fraction|
                     (|SparseMultivariatePolynomial| |#1| (|Kernel| $))))
          (QSETREFV $ 47
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |EXPR;Zero;$;6|) $ 47)))
          (QSETREFV $ 49
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |EXPR;One;$;7|) $ 49)))
          (QSETREFV $ 52 (CONS (|dispatchFunction| |EXPR;one?;$B;8|) $))
          (QSETREFV $ 54 (CONS (|dispatchFunction| |EXPR;zero?;$B;9|) $))
          (QSETREFV $ 56 (CONS (|dispatchFunction| |EXPR;-;2$;10|) $))
          (QSETREFV $ 59 (CONS (|dispatchFunction| |EXPR;*;I2$;11|) $))
          (QSETREFV $ 61 (CONS (|dispatchFunction| |EXPR;coerce;I$;12|) $))
          (QSETREFV $ 63 (CONS (|dispatchFunction| |EXPR;*;3$;13|) $))
          (QSETREFV $ 65 (CONS (|dispatchFunction| |EXPR;+;3$;14|) $))
          (QSETREFV $ 67 (CONS (|dispatchFunction| |EXPR;-;3$;15|) $))
          (QSETREFV $ 69 (CONS (|dispatchFunction| |EXPR;/;3$;16|) $))
          (QSETREFV $ 73 (CONS (|dispatchFunction| |EXPR;number?;$B;17|) $))
          (QSETREFV $ 87
                    (CONS (|dispatchFunction| |EXPR;simplifyPower;$I$;18|) $))
          (QSETREFV $ 91 (CONS (|dispatchFunction| |EXPR;^;$Nni$;19|) $))
          (QSETREFV $ 92 (CONS (|dispatchFunction| |EXPR;^;$I$;20|) $))
          (QSETREFV $ 94 (CONS (|dispatchFunction| |EXPR;^;$Pi$;21|) $))
          (QSETREFV $ 96 (CONS (|dispatchFunction| |EXPR;smaller?;2$B;22|) $))
          (QSETREFV $ 97 (CONS (|dispatchFunction| |EXPR;=;2$B;23|) $))
          (QSETREFV $ 100 (CONS (|dispatchFunction| |EXPR;numer;$Smp;24|) $))
          (QSETREFV $ 102 (CONS (|dispatchFunction| |EXPR;denom;$Smp;25|) $))
          (QSETREFV $ 103
                    (|Record|
                     (|:| |num|
                          (|SparseMultivariatePolynomial| |#1| (|Kernel| $)))
                     (|:| |den|
                          (|SparseMultivariatePolynomial| |#1| (|Kernel| $)))))
          (QSETREFV $ 105 (CONS (|dispatchFunction| |EXPR;coerce;Smp$;26|) $))
          (QSETREFV $ 107 (CONS (|dispatchFunction| |EXPR;coerce;P$;27|) $))
          (QSETREFV $ 111 (CONS (|dispatchFunction| |EXPR;coerce;F$;28|) $))
          (QSETREFV $ 112 (CONS (|dispatchFunction| |EXPR;reduce;2$;29|) $))
          (DEFVAR |algreduc_flag| 'NIL)
          (QSETREFV $ 129
                    (CONS
                     (|dispatchFunction| |EXPR;getSimplifyDenomsFlag;B;35|) $))
          (QSETREFV $ 130
                    (CONS
                     (|dispatchFunction| |EXPR;setSimplifyDenomsFlag;2B;36|)
                     $))
          (QSETREFV $ 141 (CONS (|dispatchFunction| |EXPR;/;2Smp$;38|) $))
          (QSETREFV $ 150
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MM;39|) $))
          (QSETREFV $ 158
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MVR;40|) $))
          (QSETREFV $ 163 (CONS (|dispatchFunction| |EXPR;rootOf;SupS$;42|) $))
          (QSETREFV $ 165
                    (CONS (|dispatchFunction| |EXPR;rootSum;$SupS$;43|) $))
          (QSETREFV $ 168 (CONS (|dispatchFunction| |EXPR;pi;$;44|) $))
          (QSETREFV $ 170 (CONS (|dispatchFunction| |EXPR;exp;2$;45|) $))
          (QSETREFV $ 172 (CONS (|dispatchFunction| |EXPR;log;2$;46|) $))
          (QSETREFV $ 174 (CONS (|dispatchFunction| |EXPR;sin;2$;47|) $))
          (QSETREFV $ 176 (CONS (|dispatchFunction| |EXPR;cos;2$;48|) $))
          (QSETREFV $ 178 (CONS (|dispatchFunction| |EXPR;tan;2$;49|) $))
          (QSETREFV $ 180 (CONS (|dispatchFunction| |EXPR;cot;2$;50|) $))
          (QSETREFV $ 182 (CONS (|dispatchFunction| |EXPR;sec;2$;51|) $))
          (QSETREFV $ 184 (CONS (|dispatchFunction| |EXPR;csc;2$;52|) $))
          (QSETREFV $ 186 (CONS (|dispatchFunction| |EXPR;asin;2$;53|) $))
          (QSETREFV $ 188 (CONS (|dispatchFunction| |EXPR;acos;2$;54|) $))
          (QSETREFV $ 190 (CONS (|dispatchFunction| |EXPR;atan;2$;55|) $))
          (QSETREFV $ 192 (CONS (|dispatchFunction| |EXPR;acot;2$;56|) $))
          (QSETREFV $ 194 (CONS (|dispatchFunction| |EXPR;asec;2$;57|) $))
          (QSETREFV $ 196 (CONS (|dispatchFunction| |EXPR;acsc;2$;58|) $))
          (QSETREFV $ 198 (CONS (|dispatchFunction| |EXPR;sinh;2$;59|) $))
          (QSETREFV $ 200 (CONS (|dispatchFunction| |EXPR;cosh;2$;60|) $))
          (QSETREFV $ 202 (CONS (|dispatchFunction| |EXPR;tanh;2$;61|) $))
          (QSETREFV $ 204 (CONS (|dispatchFunction| |EXPR;coth;2$;62|) $))
          (QSETREFV $ 206 (CONS (|dispatchFunction| |EXPR;sech;2$;63|) $))
          (QSETREFV $ 208 (CONS (|dispatchFunction| |EXPR;csch;2$;64|) $))
          (QSETREFV $ 210 (CONS (|dispatchFunction| |EXPR;asinh;2$;65|) $))
          (QSETREFV $ 212 (CONS (|dispatchFunction| |EXPR;acosh;2$;66|) $))
          (QSETREFV $ 214 (CONS (|dispatchFunction| |EXPR;atanh;2$;67|) $))
          (QSETREFV $ 216 (CONS (|dispatchFunction| |EXPR;acoth;2$;68|) $))
          (QSETREFV $ 218 (CONS (|dispatchFunction| |EXPR;asech;2$;69|) $))
          (QSETREFV $ 220 (CONS (|dispatchFunction| |EXPR;acsch;2$;70|) $))
          (QSETREFV $ 223 (CONS (|dispatchFunction| |EXPR;abs;2$;71|) $))
          (QSETREFV $ 225 (CONS (|dispatchFunction| |EXPR;conjugate;2$;72|) $))
          (QSETREFV $ 227 (CONS (|dispatchFunction| |EXPR;Gamma;2$;73|) $))
          (QSETREFV $ 229 (CONS (|dispatchFunction| |EXPR;Gamma;3$;74|) $))
          (QSETREFV $ 231 (CONS (|dispatchFunction| |EXPR;Beta;3$;75|) $))
          (QSETREFV $ 233 (CONS (|dispatchFunction| |EXPR;digamma;2$;76|) $))
          (QSETREFV $ 235 (CONS (|dispatchFunction| |EXPR;polygamma;3$;77|) $))
          (QSETREFV $ 237 (CONS (|dispatchFunction| |EXPR;besselJ;3$;78|) $))
          (QSETREFV $ 239 (CONS (|dispatchFunction| |EXPR;besselY;3$;79|) $))
          (QSETREFV $ 241 (CONS (|dispatchFunction| |EXPR;besselI;3$;80|) $))
          (QSETREFV $ 243 (CONS (|dispatchFunction| |EXPR;besselK;3$;81|) $))
          (QSETREFV $ 245 (CONS (|dispatchFunction| |EXPR;airyAi;2$;82|) $))
          (QSETREFV $ 247
                    (CONS (|dispatchFunction| |EXPR;airyAiPrime;2$;83|) $))
          (QSETREFV $ 249 (CONS (|dispatchFunction| |EXPR;airyBi;2$;84|) $))
          (QSETREFV $ 251
                    (CONS (|dispatchFunction| |EXPR;airyBiPrime;2$;85|) $))
          (QSETREFV $ 253 (CONS (|dispatchFunction| |EXPR;lambertW;2$;86|) $))
          (QSETREFV $ 255 (CONS (|dispatchFunction| |EXPR;polylog;3$;87|) $))
          (QSETREFV $ 257
                    (CONS (|dispatchFunction| |EXPR;weierstrassP;4$;88|) $))
          (QSETREFV $ 259
                    (CONS (|dispatchFunction| |EXPR;weierstrassPPrime;4$;89|)
                          $))
          (QSETREFV $ 261
                    (CONS (|dispatchFunction| |EXPR;weierstrassSigma;4$;90|)
                          $))
          (QSETREFV $ 263
                    (CONS (|dispatchFunction| |EXPR;weierstrassZeta;4$;91|) $))
          (QSETREFV $ 265
                    (CONS (|dispatchFunction| |EXPR;weierstrassPInverse;4$;92|)
                          $))
          (QSETREFV $ 267
                    (CONS (|dispatchFunction| |EXPR;whittakerM;4$;93|) $))
          (QSETREFV $ 269
                    (CONS (|dispatchFunction| |EXPR;whittakerW;4$;94|) $))
          (QSETREFV $ 271 (CONS (|dispatchFunction| |EXPR;angerJ;3$;95|) $))
          (QSETREFV $ 273 (CONS (|dispatchFunction| |EXPR;weberE;3$;96|) $))
          (QSETREFV $ 275 (CONS (|dispatchFunction| |EXPR;struveH;3$;97|) $))
          (QSETREFV $ 277 (CONS (|dispatchFunction| |EXPR;struveL;3$;98|) $))
          (QSETREFV $ 279 (CONS (|dispatchFunction| |EXPR;hankelH1;3$;99|) $))
          (QSETREFV $ 281 (CONS (|dispatchFunction| |EXPR;hankelH2;3$;100|) $))
          (QSETREFV $ 283 (CONS (|dispatchFunction| |EXPR;lommelS1;4$;101|) $))
          (QSETREFV $ 285 (CONS (|dispatchFunction| |EXPR;lommelS2;4$;102|) $))
          (QSETREFV $ 287 (CONS (|dispatchFunction| |EXPR;kummerM;4$;103|) $))
          (QSETREFV $ 289 (CONS (|dispatchFunction| |EXPR;kummerU;4$;104|) $))
          (QSETREFV $ 291
                    (CONS (|dispatchFunction| |EXPR;legendreP;4$;105|) $))
          (QSETREFV $ 293
                    (CONS (|dispatchFunction| |EXPR;legendreQ;4$;106|) $))
          (QSETREFV $ 295
                    (CONS (|dispatchFunction| |EXPR;kelvinBei;3$;107|) $))
          (QSETREFV $ 297
                    (CONS (|dispatchFunction| |EXPR;kelvinBer;3$;108|) $))
          (QSETREFV $ 299
                    (CONS (|dispatchFunction| |EXPR;kelvinKei;3$;109|) $))
          (QSETREFV $ 301
                    (CONS (|dispatchFunction| |EXPR;kelvinKer;3$;110|) $))
          (QSETREFV $ 303
                    (CONS (|dispatchFunction| |EXPR;ellipticK;2$;111|) $))
          (QSETREFV $ 305
                    (CONS (|dispatchFunction| |EXPR;ellipticE;2$;112|) $))
          (QSETREFV $ 307
                    (CONS (|dispatchFunction| |EXPR;ellipticE;3$;113|) $))
          (QSETREFV $ 309
                    (CONS (|dispatchFunction| |EXPR;ellipticF;3$;114|) $))
          (QSETREFV $ 311
                    (CONS (|dispatchFunction| |EXPR;ellipticPi;4$;115|) $))
          (QSETREFV $ 313 (CONS (|dispatchFunction| |EXPR;jacobiSn;3$;116|) $))
          (QSETREFV $ 315 (CONS (|dispatchFunction| |EXPR;jacobiCn;3$;117|) $))
          (QSETREFV $ 317 (CONS (|dispatchFunction| |EXPR;jacobiDn;3$;118|) $))
          (QSETREFV $ 319
                    (CONS (|dispatchFunction| |EXPR;jacobiZeta;3$;119|) $))
          (QSETREFV $ 321
                    (CONS (|dispatchFunction| |EXPR;jacobiTheta;3$;120|) $))
          (QSETREFV $ 323 (CONS (|dispatchFunction| |EXPR;lerchPhi;4$;121|) $))
          (QSETREFV $ 325
                    (CONS (|dispatchFunction| |EXPR;riemannZeta;2$;122|) $))
          (QSETREFV $ 327
                    (CONS (|dispatchFunction| |EXPR;charlierC;4$;123|) $))
          (QSETREFV $ 329 (CONS (|dispatchFunction| |EXPR;hermiteH;3$;124|) $))
          (QSETREFV $ 331 (CONS (|dispatchFunction| |EXPR;jacobiP;5$;125|) $))
          (QSETREFV $ 333
                    (CONS (|dispatchFunction| |EXPR;laguerreL;4$;126|) $))
          (QSETREFV $ 335 (CONS (|dispatchFunction| |EXPR;meixnerM;5$;127|) $))
          (COND
           ((|testBitVector| |pv$| 32)
            (PROGN
             (QSETREFV $ 338
                       (CONS
                        (|dispatchFunction| |EXPR;hypergeometricF;2L2$;128|)
                        (|getDomainView| $ '(|RetractableTo| (|Integer|)))))
             (QSETREFV $ 340
                       (CONS (|dispatchFunction| |EXPR;meijerG;4L2$;129|)
                             (|getDomainView| $
                                              '(|RetractableTo|
                                                (|Integer|))))))))
          (QSETREFV $ 84 (CONS (|dispatchFunction| |EXPR;^;3$;130|) $))
          (QSETREFV $ 344
                    (CONS (|dispatchFunction| |EXPR;factorial;2$;131|) $))
          (QSETREFV $ 346 (CONS (|dispatchFunction| |EXPR;binomial;3$;132|) $))
          (QSETREFV $ 348
                    (CONS (|dispatchFunction| |EXPR;permutation;3$;133|) $))
          (QSETREFV $ 350
                    (CONS (|dispatchFunction| |EXPR;factorials;2$;134|) $))
          (QSETREFV $ 352
                    (CONS (|dispatchFunction| |EXPR;factorials;$S$;135|) $))
          (QSETREFV $ 354
                    (CONS (|dispatchFunction| |EXPR;summation;$S$;136|) $))
          (QSETREFV $ 358
                    (CONS (|dispatchFunction| |EXPR;summation;$Sb$;137|) $))
          (QSETREFV $ 360 (CONS (|dispatchFunction| |EXPR;product;$S$;138|) $))
          (QSETREFV $ 362
                    (CONS (|dispatchFunction| |EXPR;product;$Sb$;139|) $))
          (QSETREFV $ 365 (CONS (|dispatchFunction| |EXPR;erf;2$;140|) $))
          (QSETREFV $ 367 (CONS (|dispatchFunction| |EXPR;erfi;2$;141|) $))
          (QSETREFV $ 369 (CONS (|dispatchFunction| |EXPR;Ei;2$;142|) $))
          (QSETREFV $ 371 (CONS (|dispatchFunction| |EXPR;Si;2$;143|) $))
          (QSETREFV $ 373 (CONS (|dispatchFunction| |EXPR;Ci;2$;144|) $))
          (QSETREFV $ 375 (CONS (|dispatchFunction| |EXPR;Shi;2$;145|) $))
          (QSETREFV $ 377 (CONS (|dispatchFunction| |EXPR;Chi;2$;146|) $))
          (QSETREFV $ 379 (CONS (|dispatchFunction| |EXPR;li;2$;147|) $))
          (QSETREFV $ 381 (CONS (|dispatchFunction| |EXPR;dilog;2$;148|) $))
          (QSETREFV $ 383 (CONS (|dispatchFunction| |EXPR;fresnelS;2$;149|) $))
          (QSETREFV $ 385 (CONS (|dispatchFunction| |EXPR;fresnelC;2$;150|) $))
          (QSETREFV $ 387
                    (CONS (|dispatchFunction| |EXPR;integral;$S$;151|) $))
          (QSETREFV $ 389
                    (CONS (|dispatchFunction| |EXPR;integral;$Sb$;152|) $))
          (QSETREFV $ 37 (CONS (|dispatchFunction| |EXPR;operator;2Bo;153|) $))
          (COND
           ((|HasCategory| |#1| '(|GcdDomain|))
            (PROGN
             (COND
              ((|domainEqual| |#1| (|Integer|))
               (PROGN
                (QSETREFV $ 440
                          (|Record| (|:| |svz| (|List| (|Symbol|)))
                                    (|:| |sm|
                                         (|List| (|Polynomial| (|Integer|))))
                                    (|:| |msizes| (|List| (|Integer|)))
                                    (|:| |sp| (|Integer|))))
                (QSETREFV $ 441 (|ModularAlgebraicGcdTools3|))
                (QSETREFV $ 442
                          (|ModularAlgebraicGcd|
                           (|SparseUnivariatePolynomial|
                            (|Polynomial| (|Integer|)))
                           (QREFELT $ 440) (QREFELT $ 441)))
                (QSETREFV $ 451 (|ModularEvaluation2|))
                (QSETREFV $ 452 (|ModularAlgebraicGcdTools4|))
                (QSETREFV $ 453
                          (|ModularAlgebraicGcd2|
                           (|Record| (|:| |var| (|Symbol|))
                                     (|:| |coef|
                                          (|SparseUnivariatePolynomial|
                                           (|Fraction|
                                            (|Polynomial| (|Integer|))))))
                           (|FakePolynomial|)
                           (|SparseUnivariatePolynomial|
                            (|Polynomial| (|Integer|)))
                           (QREFELT $ 440) (QREFELT $ 451) (QREFELT $ 452)))
                (QSETREFV $ 478
                          (CONS
                           (|dispatchFunction| |EXPR;gcdPolynomial;3Sup;172|)
                           $))))
              ('T
               (QSETREFV $ 478
                         (CONS
                          (|dispatchFunction| |EXPR;gcdPolynomial;3Sup;173|)
                          $))))
             (COND
              ((|testBitVector| |pv$| 26)
               (QSETREFV $ 485
                         (CONS
                          (|dispatchFunction| |EXPR;factorPolynomial;SupF;174|)
                          $)))))))
          (COND
           ((|domainEqual| |#1| (|AlgebraicNumber|))
            (QSETREFV $ 490
                      (CONS (|dispatchFunction| |EXPR;coerce;An$;175|) $))))
          (COND
           ((|testBitVector| |pv$| 14)
            (PROGN
             (QSETREFV $ 493 (CONS (|dispatchFunction| |EXPR;^;$F$;176|) $))
             (QSETREFV $ 134
                       (CONS (|dispatchFunction| |EXPR;minPoly;KSup;177|) $))
             (QSETREFV $ 496
                       (CONS
                        (|dispatchFunction| |EXPR;definingPolynomial;2$;178|)
                        $))
             (QSETREFV $ 498
                       (CONS (|dispatchFunction| |EXPR;retract;$F;179|) $))
             (QSETREFV $ 72
                       (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;180|)
                             $))
             (COND ((|domainEqual| |#1| (|AlgebraicNumber|)))
                   ('T
                    (PROGN
                     (QSETREFV $ 490
                               (CONS (|dispatchFunction| |EXPR;coerce;An$;181|)
                                     $))
                     (QSETREFV $ 514
                               (CONS
                                (|dispatchFunction| |EXPR;retractIfCan;$U;184|)
                                $))))))))
          (COND
           ((|testBitVector| |pv$| 9)
            (PROGN
             (QSETREFV $ 542
                       (CONS (|dispatchFunction| |EXPR;convert;$If;188|) $))
             (QSETREFV $ 545
                       (CONS (|dispatchFunction| |EXPR;eval;$Bo$S$;189|) $))
             (QSETREFV $ 544
                       (CONS (|dispatchFunction| |EXPR;eval;$LLS$;190|) $)))))
          (COND
           ((|testBitVector| |pv$| 13)
            (QSETREFV $ 567
                      (CONS (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;191|)
                            $))))
          (COND
           ((|testBitVector| |pv$| 12)
            (QSETREFV $ 573
                      (CONS (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;192|)
                            $))))))
        ('T
         (PROGN
          (SETELT $ 45 (|SparseMultivariatePolynomial| |#1| (|Kernel| $)))
          (QSETREFV $ 47
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |EXPR;Zero;$;193|) $ 47)))
          (QSETREFV $ 49
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |EXPR;One;$;194|) $ 49)))
          (QSETREFV $ 56 (CONS (|dispatchFunction| |EXPR;-;2$;195|) $))
          (QSETREFV $ 59 (CONS (|dispatchFunction| |EXPR;*;I2$;196|) $))
          (QSETREFV $ 63 (CONS (|dispatchFunction| |EXPR;*;3$;197|) $))
          (QSETREFV $ 65 (CONS (|dispatchFunction| |EXPR;+;3$;198|) $))
          (QSETREFV $ 97 (CONS (|dispatchFunction| |EXPR;=;2$B;199|) $))
          (QSETREFV $ 96 (CONS (|dispatchFunction| |EXPR;smaller?;2$B;200|) $))
          (QSETREFV $ 100 (CONS (|dispatchFunction| |EXPR;numer;$Smp;201|) $))
          (QSETREFV $ 105 (CONS (|dispatchFunction| |EXPR;coerce;Smp$;202|) $))
          (QSETREFV $ 107 (CONS (|dispatchFunction| |EXPR;coerce;P$;203|) $))
          (QSETREFV $ 150
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MM;204|) $))
          (QSETREFV $ 158
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MVR;205|) $))
          (COND
           ((|testBitVector| |pv$| 9)
            (QSETREFV $ 542
                      (CONS (|dispatchFunction| |EXPR;convert;$If;206|) $))))
          (COND
           ((|testBitVector| |pv$| 13)
            (PROGN
             (QSETREFV $ 567
                       (CONS
                        (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;208|)
                        $)))))
          (COND
           ((|testBitVector| |pv$| 12)
            (PROGN
             (QSETREFV $ 573
                       (CONS
                        (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;210|)
                        $))))))))))
     ((|HasCategory| |#1| '(|AbelianMonoid|))
      (PROGN
       (SETELT $ 45 (|FreeModule| (|Integer|) (|Kernel| $)))
       (QSETREFV $ 47
                 (CONS #'|makeSpadConstant|
                       (LIST (|dispatchFunction| |EXPR;Zero;$;211|) $ 47)))
       (QSETREFV $ 65 (CONS (|dispatchFunction| |EXPR;+;3$;212|) $))
       (QSETREFV $ 97 (CONS (|dispatchFunction| |EXPR;=;2$B;213|) $))
       (QSETREFV $ 96 (CONS (|dispatchFunction| |EXPR;smaller?;2$B;214|) $))
       (QSETREFV $ 138 (CONS (|dispatchFunction| |EXPR;coerce;K$;215|) $))
       (QSETREFV $ 75 (CONS (|dispatchFunction| |EXPR;kernels;$L;216|) $))
       (QSETREFV $ 515 (CONS (|dispatchFunction| |EXPR;coerce;R$;217|) $))
       (QSETREFV $ 425 (CONS (|dispatchFunction| |EXPR;retract;$R;218|) $))
       (QSETREFV $ 596 (CONS (|dispatchFunction| |EXPR;coerce;$Of;219|) $))
       (QSETREFV $ 606 (CONS (|dispatchFunction| |EXPR;isPlus;$U;222|) $))
       (QSETREFV $ 610 (CONS (|dispatchFunction| |EXPR;isMult;$U;223|) $))
       (QSETREFV $ 597 (CONS (|dispatchFunction| |EXPR;eval;$LL$;224|) $))
       (QSETREFV $ 602 (CONS (|dispatchFunction| |EXPR;subst;$LL$;225|) $))
       (QSETREFV $ 611
                 (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;226|) $))
       (COND
        ((|testBitVector| |pv$| 15)
         (QSETREFV $ 56 (CONS (|dispatchFunction| |EXPR;-;2$;227|) $))))))
     ('T
      (PROGN
       (SETELT $ 45 (|Kernel| $))
       (QSETREFV $ 96 (CONS (|dispatchFunction| |EXPR;smaller?;2$B;228|) $))
       (QSETREFV $ 97 (CONS (|dispatchFunction| |EXPR;=;2$B;229|) $))
       (QSETREFV $ 138 (CONS (|dispatchFunction| |EXPR;coerce;K$;230|) $))
       (QSETREFV $ 75 (CONS (|dispatchFunction| |EXPR;kernels;$L;231|) $))
       (QSETREFV $ 515 (CONS (|dispatchFunction| |EXPR;coerce;R$;232|) $))
       (QSETREFV $ 425 (CONS (|dispatchFunction| |EXPR;retract;$R;233|) $))
       (QSETREFV $ 611
                 (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;234|) $))
       (QSETREFV $ 596 (CONS (|dispatchFunction| |EXPR;coerce;$Of;235|) $))
       (QSETREFV $ 597 (CONS (|dispatchFunction| |EXPR;eval;$LL$;236|) $))
       (QSETREFV $ 602 (CONS (|dispatchFunction| |EXPR;subst;$LL$;237|) $))
       (COND
        ((|testBitVector| |pv$| 9)
         (QSETREFV $ 542
                   (CONS (|dispatchFunction| |EXPR;convert;$If;238|) $)))))))
    $))) 

(MAKEPROP '|Expression| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) 'SYMBOL 'ALGOP (|Boolean|)
              (|BasicOperator|) |EXPR;belong?;BoB;1| (|Kernel| $)
              (0 . |retract|) (|Union| 6 '"failed") (|Kernel| $$)
              (|KernelFunctions2| 6 $$) (5 . |constantIfCan|)
              (|Union| 12 '#1="failed") (10 . |retractIfCan|)
              (|FunctionSpace&| $$ 6) (15 . |belong?|) (20 . |operator|)
              (|ExpressionSpace&| $$) (25 . |belong?|) (30 . |operator|)
              (35 . |nullary?|) (|Symbol|) (40 . |has?|) (46 . |name|)
              (51 . |kernel|) (56 . |operator|) (|Union| 35 '"failed")
              (61 . |arity|) (66 . |operator|) (|NonNegativeInteger|)
              (71 . |operator|) (77 . |operator|) (|List| 27)
              (|SparseMultivariatePolynomial| 6 27) (82 . |variables|)
              (|SparseMultivariatePolynomial| 6 15) (|List| 15)
              (|SparsePolynomialCoercionHelpers| 6 27 15)
              (87 . |remap_variables|) '|Rep| (94 . |Zero|) (98 . |Zero|)
              (102 . |One|) (106 . |One|) (110 . |One|) (114 . =)
              (120 . |one?|) (125 . |zero?|) (130 . |zero?|) (135 . -)
              (140 . -) (|Integer|) (145 . *) (151 . *) (157 . |coerce|)
              (162 . |coerce|) (167 . *) (173 . *) (179 . +) (185 . +)
              (191 . -) (197 . -) (203 . /) (209 . /) (215 . |ground?|)
              (|Union| 491 '#1#) (220 . |retractIfCan|) (225 . |number?|)
              (|List| 12) (230 . |kernels|) (235 . |is?|) (241 . |first|)
              (|List| $$) (246 . |argument|) (251 . |#|) (256 . |elt|)
              (262 . ^) (268 . |algtower|) (273 . ^) (279 . |first|)
              (284 . |second|) (289 . |simplifyPower|) (295 . |Zero|)
              (299 . |numerator|) (304 . |denominator|) (309 . ^) (315 . ^)
              (|PositiveInteger|) (321 . ^) (327 . |smaller?|)
              (333 . |smaller?|) (339 . =) (345 . |numer|)
              (|SparseMultivariatePolynomial| 6 12) (350 . |numer|)
              (355 . |denom|) (360 . |denom|) 'EREP (365 . |One|)
              (369 . |coerce|) (|Polynomial| 6) (374 . |coerce|)
              (|Fraction| 106) (379 . |numer|) (384 . |denom|) (389 . |coerce|)
              (394 . |reduce|) (|Mapping| 9 15) (399 . |select!|)
              (|AlgebraicManipulations| 6 $$) (405 . |ratDenom|) (411 . |is?|)
              (417 . ~=) (423 . >) (|SparseUnivariatePolynomial| $)
              (429 . |univariate|) (|SparseUnivariatePolynomial| 41)
              (435 . |leadingCoefficient|) (440 . |reductum|) (445 . *)
              (451 . |monomial|) (458 . -) (464 . /)
              (470 . |getSimplifyDenomsFlag|) (474 . |setSimplifyDenomsFlag|)
              (479 . |elt|) (|SingletonAsOrderedSet|) (485 . |create|)
              (489 . |minPoly|) (|SparseUnivariatePolynomial| $$)
              (|PolynomialCategoryQuotientFunctions| 486 15 6 41 $$)
              (494 . |univariate|) (501 . |coerce|) (506 . |eval|)
              (513 . |retract|) (518 . /) (|Mapping| $$ $$) (|Matrix| $$)
              (524 . |map|) (|Matrix| 41) (|Matrix| $) (530 . |reducedSystem|)
              (|Matrix| 6) (535 . |reducedSystem|) (540 . |reducedSystem|)
              (|Vector| $$) (545 . |map|)
              (|Record| (|:| |mat| 145) (|:| |vec| (|Vector| 41))) (|Vector| $)
              (551 . |reducedSystem|)
              (|Record| (|:| |mat| 148) (|:| |vec| (|Vector| 6)))
              (557 . |reducedSystem|) (563 . |reducedSystem|) (569 . |member?|)
              (575 . |concat|) (|AlgebraicFunction| 6 $$) (581 . |rootOf|)
              (587 . |rootOf|) (593 . |rootSum|) (600 . |rootSum|)
              (|ElementaryFunction| 6 $$) (607 . |pi|) (611 . |pi|)
              (615 . |exp|) (620 . |exp|) (625 . |log|) (630 . |log|)
              (635 . |sin|) (640 . |sin|) (645 . |cos|) (650 . |cos|)
              (655 . |tan|) (660 . |tan|) (665 . |cot|) (670 . |cot|)
              (675 . |sec|) (680 . |sec|) (685 . |csc|) (690 . |csc|)
              (695 . |asin|) (700 . |asin|) (705 . |acos|) (710 . |acos|)
              (715 . |atan|) (720 . |atan|) (725 . |acot|) (730 . |acot|)
              (735 . |asec|) (740 . |asec|) (745 . |acsc|) (750 . |acsc|)
              (755 . |sinh|) (760 . |sinh|) (765 . |cosh|) (770 . |cosh|)
              (775 . |tanh|) (780 . |tanh|) (785 . |coth|) (790 . |coth|)
              (795 . |sech|) (800 . |sech|) (805 . |csch|) (810 . |csch|)
              (815 . |asinh|) (820 . |asinh|) (825 . |acosh|) (830 . |acosh|)
              (835 . |atanh|) (840 . |atanh|) (845 . |acoth|) (850 . |acoth|)
              (855 . |asech|) (860 . |asech|) (865 . |acsch|) (870 . |acsch|)
              (|FunctionalSpecialFunction| 6 $$) (875 . |abs|) (880 . |abs|)
              (885 . |conjugate|) (890 . |conjugate|) (895 . |Gamma|)
              (900 . |Gamma|) (905 . |Gamma|) (911 . |Gamma|) (917 . |Beta|)
              (923 . |Beta|) (929 . |digamma|) (934 . |digamma|)
              (939 . |polygamma|) (945 . |polygamma|) (951 . |besselJ|)
              (957 . |besselJ|) (963 . |besselY|) (969 . |besselY|)
              (975 . |besselI|) (981 . |besselI|) (987 . |besselK|)
              (993 . |besselK|) (999 . |airyAi|) (1004 . |airyAi|)
              (1009 . |airyAiPrime|) (1014 . |airyAiPrime|) (1019 . |airyBi|)
              (1024 . |airyBi|) (1029 . |airyBiPrime|) (1034 . |airyBiPrime|)
              (1039 . |lambertW|) (1044 . |lambertW|) (1049 . |polylog|)
              (1055 . |polylog|) (1061 . |weierstrassP|)
              (1068 . |weierstrassP|) (1075 . |weierstrassPPrime|)
              (1082 . |weierstrassPPrime|) (1089 . |weierstrassSigma|)
              (1096 . |weierstrassSigma|) (1103 . |weierstrassZeta|)
              (1110 . |weierstrassZeta|) (1117 . |weierstrassPInverse|)
              (1124 . |weierstrassPInverse|) (1131 . |whittakerM|)
              (1138 . |whittakerM|) (1145 . |whittakerW|) (1152 . |whittakerW|)
              (1159 . |angerJ|) (1165 . |angerJ|) (1171 . |weberE|)
              (1177 . |weberE|) (1183 . |struveH|) (1189 . |struveH|)
              (1195 . |struveL|) (1201 . |struveL|) (1207 . |hankelH1|)
              (1213 . |hankelH1|) (1219 . |hankelH2|) (1225 . |hankelH2|)
              (1231 . |lommelS1|) (1238 . |lommelS1|) (1245 . |lommelS2|)
              (1252 . |lommelS2|) (1259 . |kummerM|) (1266 . |kummerM|)
              (1273 . |kummerU|) (1280 . |kummerU|) (1287 . |legendreP|)
              (1294 . |legendreP|) (1301 . |legendreQ|) (1308 . |legendreQ|)
              (1315 . |kelvinBei|) (1321 . |kelvinBei|) (1327 . |kelvinBer|)
              (1333 . |kelvinBer|) (1339 . |kelvinKei|) (1345 . |kelvinKei|)
              (1351 . |kelvinKer|) (1357 . |kelvinKer|) (1363 . |ellipticK|)
              (1368 . |ellipticK|) (1373 . |ellipticE|) (1378 . |ellipticE|)
              (1383 . |ellipticE|) (1389 . |ellipticE|) (1395 . |ellipticF|)
              (1401 . |ellipticF|) (1407 . |ellipticPi|) (1414 . |ellipticPi|)
              (1421 . |jacobiSn|) (1427 . |jacobiSn|) (1433 . |jacobiCn|)
              (1439 . |jacobiCn|) (1445 . |jacobiDn|) (1451 . |jacobiDn|)
              (1457 . |jacobiZeta|) (1463 . |jacobiZeta|)
              (1469 . |jacobiTheta|) (1475 . |jacobiTheta|) (1481 . |lerchPhi|)
              (1488 . |lerchPhi|) (1495 . |riemannZeta|) (1500 . |riemannZeta|)
              (1505 . |charlierC|) (1512 . |charlierC|) (1519 . |hermiteH|)
              (1525 . |hermiteH|) (1531 . |jacobiP|) (1539 . |jacobiP|)
              (1547 . |laguerreL|) (1554 . |laguerreL|) (1561 . |meixnerM|)
              (1569 . |meixnerM|) (1577 . |hypergeometricF|) (|List| $)
              (1584 . |hypergeometricF|) (1591 . |meijerG|) (1600 . |meijerG|)
              (|CombinatorialFunction| 6 $$) (1609 . ^) (1615 . |factorial|)
              (1620 . |factorial|) (1625 . |binomial|) (1631 . |binomial|)
              (1637 . |permutation|) (1643 . |permutation|)
              (1649 . |factorials|) (1654 . |factorials|) (1659 . |factorials|)
              (1665 . |factorials|) (1671 . |summation|) (1677 . |summation|)
              (|SegmentBinding| $$) (1683 . |summation|) (|SegmentBinding| $)
              (1689 . |summation|) (1695 . |product|) (1701 . |product|)
              (1707 . |product|) (1713 . |product|)
              (|LiouvillianFunction| 6 $$) (1719 . |erf|) (1724 . |erf|)
              (1729 . |erfi|) (1734 . |erfi|) (1739 . |Ei|) (1744 . |Ei|)
              (1749 . |Si|) (1754 . |Si|) (1759 . |Ci|) (1764 . |Ci|)
              (1769 . |Shi|) (1774 . |Shi|) (1779 . |Chi|) (1784 . |Chi|)
              (1789 . |li|) (1794 . |li|) (1799 . |dilog|) (1804 . |dilog|)
              (1809 . |fresnelS|) (1814 . |fresnelS|) (1819 . |fresnelC|)
              (1824 . |fresnelC|) (1829 . |integral|) (1835 . |integral|)
              (1841 . |integral|) (1847 . |integral|) (1853 . |belong?|)
              (1858 . |operator|) (1863 . |belong?|) (1868 . |operator|)
              (1873 . |belong?|) (1878 . |operator|) (1883 . |belong?|)
              (1888 . |operator|) (1893 . |belong?|) (1898 . |operator|)
              (|Fraction| 41) (1903 . |coerce|) (|Fraction| 405)
              (|PolynomialCategoryQuotientFunctions| 486 15 6 41 400)
              (1908 . |univariate|) (|SparseUnivariatePolynomial| 400)
              (1914 . |numer|) (1919 . |degree|) (1925 . |degree|)
              (1930 . |rem|) (1936 . |coerce|) (1941 . |elt|) (1947 . |Zero|)
              (1951 . ~=) (1957 . |leadingCoefficient|) (1962 . |reductum|)
              (1967 . |concat|) (1973 . |removeDuplicates|) (1978 . =)
              (1984 . |coefficients|) (|Mapping| 9 $$) (1989 . |every?|)
              (|Mapping| 41 $$)
              (|UnivariatePolynomialCategoryFunctions2| $$ 135 41 122)
              (1995 . |map|) (2001 . |retract|) (2006 . |monomial|)
              (2012 . |coerce|) (2017 . -) (2023 . =) (|Polynomial| 57)
              (2029 . |One|) (2033 . |One|) (2037 . |monomial|)
              (2044 . |coerce|) (|Mapping| 430 15) (|Mapping| 430 57)
              (|PolynomialCategoryLifting| 486 15 57 41 430) (2049 . |map|)
              (2056 . |multivariate|) 'MD 'MOP1 'MGCD1 (2062 . |coerce|)
              (|Mapping| 41 27) (|Mapping| 41 57)
              (|PolynomialCategoryLifting| (|IndexedExponents| 27) 27 57 430
                                           41)
              (2067 . |map|) (|Mapping| $$ 41)
              (|UnivariatePolynomialCategoryFunctions2| 41 122 $$ 135)
              (2074 . |map|) 'MEV2 'MOP2 'MGCD2 (|Fraction| 430) (2080 . /)
              (2086 . |coerce|) (|SparseUnivariatePolynomial| 454)
              (2091 . |coerce|) (|Mapping| 454 $$)
              (|UnivariatePolynomialCategoryFunctions2| $$ 135 454 457)
              (2096 . |map|) (2102 . =) (2108 . |One|) (2112 . |gcdPolynomial|)
              (2118 . |concat|) (2124 . |algtower|) (2129 . |kernels|)
              (2134 . |setUnion|) (2140 . |sort|) (2145 . |new|)
              (2149 . |cons|) (2155 . |setDifference|) (|List| 430)
              (2161 . |algebraicGcd|)
              (|Record| (|:| |var| 27) (|:| |coef| 457)) (|List| 475)
              (2171 . |algebraicGcd|) (2181 . |gcdPolynomial|)
              (|GcdDomain&| $$) (2187 . |gcdPolynomial|) (|Factored| 135)
              (|ExpressionFactorPolynomial| 6 $$) (2193 . |factorPolynomial|)
              (|Factored| 120) (2198 . |factorPolynomial|)
              (|IndexedExponents| 15) (2203 . |Zero|) (2207 . |monomial|)
              (|AlgebraicNumber|) (2213 . |coerce|) (|Fraction| 57) (2218 . ^)
              (2224 . ^) (2230 . |minPoly|) (2235 . |definingPolynomial|)
              (2240 . |definingPolynomial|) (2245 . |retract|)
              (2250 . |retract|) (2255 . |retractIfCan|)
              (|SparseMultivariatePolynomial| 57 12) (2260 . |numer|)
              (2265 . |denom|) (|Mapping| $$ 489) (|Kernel| 489)
              (|ExpressionSpaceFunctions2| 489 $$) (2270 . |map|)
              (|Mapping| $$ 504) (|Mapping| $$ 57)
              (|SparseMultivariatePolynomial| 57 504)
              (|PolynomialCategoryLifting| (|IndexedExponents| 504) 504 57 509
                                           $$)
              (2276 . |map|) (2283 . /) (|Union| 489 '"failed")
              (2289 . |retractIfCan|) (2294 . |coerce|) (2299 . |coerce|)
              (2304 . |belong?|) (2309 . |is?|) (|Union| 27 '#1#)
              (2315 . |retractIfCan|) (2320 . ~=)
              (|SparseUnivariatePolynomial| 489) (2326 . |Zero|)
              (2330 . |Zero|) (2334 . ~=) (2340 . |degree|) (2345 . |monomial|)
              (2351 . +) (2357 . |rootOf|) (2363 . |operator|) (2368 . |elt|)
              (|Union| 15 '"failed") (2374 . |mainVariable|)
              (2379 . |leadingCoefficient|) (2384 . |Zero|) (2388 . |ground?|)
              (2393 . ^) (2399 . *) (2405 . +) (|InputForm|) (2411 . |convert|)
              (2416 . |convert|) (|List| 10) (2421 . |eval|) (2429 . |eval|)
              (2437 . |variables|) (2442 . |concat|)
              (2447 . |removeDuplicates|) (2452 . |scripted?|) (|Mapping| 9 27)
              (2457 . |select|) (|MakeUnaryCompiledFunction| $$ $$ $$)
              (2463 . |compiledFunction|) (|Mapping| $ $) (|List| 554)
              (2469 . |eval|) (2476 . |coerce|) (|Equation| $$) (2481 . =)
              (|List| 641) (2487 . |subst|) (|PatternMatchResult| 57 $$)
              (|Pattern| 57) (|PatternMatchFunctionSpace| 57 6 $$)
              (2493 . |patternMatch|) (|PatternMatchResult| 57 $)
              (2500 . |patternMatch|) (|PatternMatchResult| (|Float|) $$)
              (|Pattern| (|Float|))
              (|PatternMatchFunctionSpace| (|Float|) 6 $$)
              (2507 . |patternMatch|) (|PatternMatchResult| (|Float|) $)
              (2514 . |patternMatch|) (2521 . |reducedSystem|)
              (2526 . |reducedSystem|) (|PatternMatchKernel| 57 $$)
              (2532 . |patternMatch|) (|PatternMatchResult| 57 45)
              (|Mapping| 578 15 563 578)
              (|PatternMatchPolynomialCategory| 57 486 15 6 45)
              (2539 . |patternMatch|) (|PatternMatchKernel| (|Float|) $$)
              (2547 . |patternMatch|) (|PatternMatchResult| (|Float|) 45)
              (|Mapping| 584 15 569 584)
              (|PatternMatchPolynomialCategory| (|Float|) 486 15 6 45)
              (2554 . |patternMatch|) (2562 . |coerce|)
              (|Record| (|:| |k| 15) (|:| |c| 57)) (|List| 589)
              (2567 . |listOfTerms|) (2572 . |zero?|) (2577 . |constantKernel|)
              (|OutputForm|) (2582 . |coerce|) (2587 . |coerce|)
              (2592 . |eval|) (2599 . |map|) (|Mapping| $$ 15)
              (|ListToMap| 15 $$) (2605 . |match|) (2613 . |subst|)
              (2620 . |kernel|) (2626 . *) (|Union| 337 '#2="failed")
              (2632 . |isPlus|) (2637 . |first|)
              (|Record| (|:| |coef| 57) (|:| |var| 12)) (|Union| 608 '#2#)
              (2642 . |isMult|) (2647 . |retractIfCan|)
              (|Union| 154 '#3="failed") (|Union| 614 '#3#) (|List| 120)
              (|Matrix| 57)
              (|Record| (|:| |mat| 615) (|:| |vec| (|Vector| 57)))
              (|Union| $ '"failed") (|Factored| $) (|Fraction| 6)
              (|Fraction| 621) (|Polynomial| 619) (|Fraction| 120)
              (|Union| 108 '#1#) (|Polynomial| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |coef| 337) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 630 '"failed") (|Union| 57 '#1#)
              (|Record| (|:| |var| 12) (|:| |exponent| 57)) (|Union| 633 '#2#)
              (|Record| (|:| |val| $) (|:| |exponent| 57)) (|Union| 635 '#2#)
              (|List| 35) (|Mapping| $ 337) (|List| 638) (|Union| 106 '#1#)
              (|Equation| $) (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 2652 |zerosOf| 2658 |zeroOf| 2685 |zero?| 2712 |whittakerW|
              2717 |whittakerM| 2724 |weierstrassZeta| 2731 |weierstrassSigma|
              2738 |weierstrassPPrime| 2745 |weierstrassPInverse| 2752
              |weierstrassP| 2759 |weberE| 2766 |variables| 2772 |univariate|
              2782 |unitNormal| 2788 |unitCanonical| 2793 |unit?| 2798 |tower|
              2803 |tanh| 2813 |tan| 2818 |summation| 2823 |subtractIfCan| 2835
              |subst| 2841 |struveL| 2860 |struveH| 2866 |squareFreePolynomial|
              2872 |squareFreePart| 2877 |squareFree| 2882 |sqrt| 2887
              |solveLinearPolynomialEquation| 2892 |smaller?| 2898 |sizeLess?|
              2904 |sinh| 2910 |sin| 2915 |simplifyPower| 2920
              |setSimplifyDenomsFlag| 2926 |sech| 2931 |sec| 2936 |sample| 2941
              |rootsOf| 2945 |rootSum| 2972 |rootOf| 2979 |rightRecip| 3006
              |rightPower| 3011 |riemannZeta| 3023 |retractIfCan| 3028
              |retract| 3068 |rem| 3108 |reducedSystem| 3114 |reduce| 3136
              |recip| 3141 |quo| 3146 |product| 3152 |principalIdeal| 3164
              |prime?| 3169 |polylog| 3174 |polygamma| 3180 |pi| 3186
              |permutation| 3190 |patternMatch| 3196 |paren| 3210 |opposite?|
              3220 |operators| 3226 |operator| 3231 |one?| 3236 |odd?| 3241
              |numerator| 3246 |numer| 3251 |number?| 3256 |nthRoot| 3261
              |multiEuclidean| 3267 |minPoly| 3273 |meixnerM| 3278 |meijerG|
              3286 |map| 3295 |mainKernel| 3301 |lommelS2| 3306 |lommelS1| 3313
              |log| 3320 |li| 3325 |lerchPhi| 3330 |legendreQ| 3337 |legendreP|
              3344 |leftRecip| 3351 |leftPower| 3356 |lcmCoef| 3368 |lcm| 3374
              |latex| 3385 |lambertW| 3390 |laguerreL| 3395 |kummerU| 3402
              |kummerM| 3409 |kernels| 3416 |kernel| 3426 |kelvinKer| 3438
              |kelvinKei| 3444 |kelvinBer| 3450 |kelvinBei| 3456 |jacobiZeta|
              3462 |jacobiTheta| 3468 |jacobiSn| 3474 |jacobiP| 3480 |jacobiDn|
              3488 |jacobiCn| 3494 |isTimes| 3500 |isPower| 3505 |isPlus| 3510
              |isMult| 3515 |isExpt| 3520 |is?| 3537 |inv| 3549 |integral| 3554
              |hypergeometricF| 3566 |hermiteH| 3573 |height| 3579
              |hashUpdate!| 3584 |hash| 3590 |hankelH2| 3595 |hankelH1| 3601
              |ground?| 3607 |ground| 3612 |getSimplifyDenomsFlag| 3617
              |gcdPolynomial| 3621 |gcd| 3627 |fresnelS| 3638 |fresnelC| 3643
              |freeOf?| 3648 |factorials| 3660 |factorial| 3671
              |factorSquareFreePolynomial| 3676 |factorPolynomial| 3681
              |factor| 3686 |extendedEuclidean| 3691 |exquo| 3704
              |expressIdealMember| 3710 |exp| 3716 |even?| 3721 |eval| 3726
              |euclideanSize| 3887 |erfi| 3892 |erf| 3897 |elt| 3902
              |ellipticPi| 3998 |ellipticK| 4005 |ellipticF| 4010 |ellipticE|
              4016 |divide| 4027 |distribute| 4033 |dilog| 4044 |digamma| 4049
              |differentiate| 4054 |denominator| 4080 |denom| 4085
              |definingPolynomial| 4090 |csch| 4095 |csc| 4100 |coth| 4105
              |cot| 4110 |cosh| 4115 |cos| 4120 |convert| 4125 |conjugate| 4145
              |conditionP| 4156 |commutator| 4161 |coerce| 4167 |charthRoot|
              4237 |charlierC| 4242 |characteristic| 4249 |box| 4253 |binomial|
              4263 |besselY| 4269 |besselK| 4275 |besselJ| 4281 |besselI| 4287
              |belong?| 4293 |atanh| 4298 |atan| 4303 |associator| 4308
              |associates?| 4315 |asinh| 4321 |asin| 4326 |asech| 4331 |asec|
              4336 |applyQuote| 4341 |antiCommutator| 4377 |annihilate?| 4383
              |angerJ| 4389 |algtower| 4395 |airyBiPrime| 4405 |airyBi| 4410
              |airyAiPrime| 4415 |airyAi| 4420 |acsch| 4425 |acsc| 4430 |acoth|
              4435 |acot| 4440 |acosh| 4445 |acos| 4450 |abs| 4455 ^ 4460
              |Zero| 4490 |Si| 4494 |Shi| 4499 |One| 4504 |Gamma| 4508 |Ei|
              4519 D 4524 |Ci| 4550 |Chi| 4555 |Beta| 4560 = 4566 / 4572 - 4584
              + 4595 * 4601)
           'NIL
           (CONS
            (|makeByteWordVec2| 30
                                '(1 0 1 1 27 1 1 1 1 1 1 1 5 1 1 1 1 2 3 4 5 7
                                  5 21 5 21 1 1 2 5 1 6 2 5 1 1 6 2 2 5 21 8 15
                                  15 5 17 0 0 29 16 17 21 0 12 13 17 1 30 0 0 0
                                  0 1 1 0 0 0 0 0 0 0 0 20 1 1 1 1 1 5 9 10 11
                                  14 18 1 1 1 1 1 1 1 1 1 19))
            (CONS
             '#(|AlgebraicallyClosedFunctionSpace&| |FunctionSpace&|
                |AlgebraicallyClosedField&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |GcdDomain&| NIL NIL
                |DivisionRing&| |FullyLinearlyExplicitOver&| NIL |Algebra&|
                |EntireRing&| |Algebra&| |Algebra&| NIL NIL NIL NIL
                |PartialDifferentialRing&| NIL NIL |Rng&| |Module&| |Module&|
                |Module&| NIL NIL NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL
                NIL NIL |NonAssociativeRng&| |Group&| |AbelianGroup&| NIL NIL
                NIL |ExpressionSpace&| NIL |AbelianMonoid&| |MagmaWithUnit&|
                NIL |NonAssociativeSemiRng&| NIL NIL NIL |Magma&| NIL
                |AbelianSemiGroup&| |SetCategory&| |FullyRetractableTo&| NIL
                |Evalable&| |TranscendentalFunctionCategory&| NIL |BasicType&|
                |RetractableTo&| NIL |RetractableTo&| |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| NIL |RetractableTo&|
                |RetractableTo&| NIL NIL NIL NIL |RetractableTo&| NIL NIL NIL
                |RetractableTo&| NIL NIL NIL |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                NIL |RadicalCategory&| |RetractableTo&|)
             (CONS
              '#((|AlgebraicallyClosedFunctionSpace| 6) (|FunctionSpace| 6)
                 (|AlgebraicallyClosedField|) (|Field|)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|GcdDomain|) (|IntegralDomain|) (|LeftOreRing|)
                 (|DivisionRing|) (|FullyLinearlyExplicitOver| 6)
                 (|CommutativeRing|) (|Algebra| $$) (|EntireRing|)
                 (|Algebra| 491) (|Algebra| 6) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|LinearlyExplicitOver| 6)
                 (|LinearlyExplicitOver| 57) (|PartialDifferentialRing| 27)
                 (|Ring|) (|SemiRing|) (|Rng|) (|Module| $$) (|Module| 491)
                 (|Module| 6) (|SemiRng|) (|BiModule| 491 491)
                 (|BiModule| $$ $$) (|BiModule| 6 6) (|NonAssociativeRing|)
                 (|LeftModule| 491) (|RightModule| 491) (|LeftModule| $$)
                 (|LeftModule| 6) (|RightModule| 6) (|RightModule| $$)
                 (|NonAssociativeRng|) (|Group|) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|ExpressionSpace|) (|FullyPatternMatchable| 6)
                 (|AbelianMonoid|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|NonAssociativeSemiRng|) (|Comparable|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 57)
                 (|Magma|) (|LiouvillianFunctionCategory|) (|AbelianSemiGroup|)
                 (|SetCategory|) (|FullyRetractableTo| 6) (|Patternable| 6)
                 (|Evalable| $$) (|TranscendentalFunctionCategory|)
                 (|CombinatorialOpsCategory|) (|BasicType|) (|RetractableTo| 6)
                 (|Type|) (|RetractableTo| 27) (|InnerEvalable| $$ $$)
                 (|InnerEvalable| 15 $$) (|RetractableTo| 15)
                 (|CoercibleTo| 594) (|RetractableTo| 491)
                 (|RetractableTo| (|Fraction| (|Polynomial| 6)))
                 (|CommutativeStar|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|RetractableTo| (|Polynomial| 6))
                 (|ConvertibleTo| 540) (|ConvertibleTo| 569)
                 (|ConvertibleTo| 563) (|RetractableTo| 57) (|unitsKnown|)
                 (|SpecialFunctionCategory|) (|PrimitiveFunctionCategory|)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|)
                 (|CombinatorialFunctionCategory|) (|RadicalCategory|)
                 (|RetractableTo| 489))
              (|makeByteWordVec2| 644
                                  '(1 0 12 0 13 1 16 14 15 17 1 0 18 0 19 1 20
                                    9 10 21 1 20 10 10 22 1 23 9 10 24 1 23 10
                                    10 25 1 10 9 0 26 2 10 9 0 27 28 1 10 27 0
                                    29 1 15 0 27 30 1 15 10 0 31 1 10 32 0 33 1
                                    10 0 27 34 2 10 0 27 35 36 1 0 10 10 37 1
                                    39 38 0 40 3 43 41 39 38 42 44 0 45 0 46 0
                                    0 0 47 0 45 0 48 0 0 0 49 0 6 0 50 2 45 9 0
                                    0 51 1 0 9 0 52 1 45 9 0 53 1 0 9 0 54 1 45
                                    0 0 55 1 0 0 0 56 2 45 0 57 0 58 2 0 0 57 0
                                    59 1 45 0 57 60 1 0 0 57 61 2 45 0 0 0 62 2
                                    0 0 0 0 63 2 45 0 0 0 64 2 0 0 0 0 65 2 45
                                    0 0 0 66 2 0 0 0 0 67 2 45 0 0 0 68 2 0 0 0
                                    0 69 1 0 9 0 70 1 0 71 0 72 1 0 9 0 73 1 0
                                    74 0 75 2 0 9 0 27 76 1 42 15 0 77 1 15 78
                                    0 79 1 78 35 0 80 2 78 2 0 57 81 2 45 0 0
                                    57 82 1 0 74 0 83 2 0 0 0 0 84 1 78 2 0 85
                                    1 78 2 0 86 2 0 0 0 57 87 0 6 0 88 1 0 0 0
                                    89 1 0 0 0 90 2 0 0 0 35 91 2 0 0 0 57 92 2
                                    0 0 0 93 94 2 45 9 0 0 95 2 0 9 0 0 96 2 0
                                    9 0 0 97 1 45 41 0 98 1 0 99 0 100 1 45 41
                                    0 101 1 0 99 0 102 0 41 0 104 1 0 0 99 105
                                    1 0 0 106 107 1 108 106 0 109 1 108 106 0
                                    110 1 0 0 108 111 1 0 0 0 112 2 42 0 113 0
                                    114 2 115 2 2 42 116 2 15 9 0 27 117 2 0 9
                                    0 0 118 2 35 9 0 0 119 2 41 120 0 15 121 1
                                    122 41 0 123 1 122 0 0 124 2 41 0 0 0 125 3
                                    41 0 0 15 35 126 2 41 0 0 0 127 2 45 0 41
                                    41 128 0 0 9 129 1 0 9 9 130 2 42 15 0 57
                                    131 0 132 0 133 1 0 120 12 134 3 136 135 2
                                    15 135 137 1 0 0 12 138 3 135 0 0 132 2 139
                                    1 135 2 0 140 2 0 0 99 99 141 2 143 0 142 0
                                    144 1 45 145 146 147 1 41 148 146 149 1 0
                                    148 146 150 2 151 0 142 0 152 2 45 153 146
                                    154 155 2 41 156 146 154 157 2 0 156 146
                                    154 158 2 42 9 15 0 159 2 42 0 15 0 160 2
                                    161 2 135 27 162 2 0 0 120 27 163 3 161 2 2
                                    135 27 164 3 0 0 0 120 27 165 0 166 2 167 0
                                    0 0 168 1 166 2 2 169 1 0 0 0 170 1 166 2 2
                                    171 1 0 0 0 172 1 166 2 2 173 1 0 0 0 174 1
                                    166 2 2 175 1 0 0 0 176 1 166 2 2 177 1 0 0
                                    0 178 1 166 2 2 179 1 0 0 0 180 1 166 2 2
                                    181 1 0 0 0 182 1 166 2 2 183 1 0 0 0 184 1
                                    166 2 2 185 1 0 0 0 186 1 166 2 2 187 1 0 0
                                    0 188 1 166 2 2 189 1 0 0 0 190 1 166 2 2
                                    191 1 0 0 0 192 1 166 2 2 193 1 0 0 0 194 1
                                    166 2 2 195 1 0 0 0 196 1 166 2 2 197 1 0 0
                                    0 198 1 166 2 2 199 1 0 0 0 200 1 166 2 2
                                    201 1 0 0 0 202 1 166 2 2 203 1 0 0 0 204 1
                                    166 2 2 205 1 0 0 0 206 1 166 2 2 207 1 0 0
                                    0 208 1 166 2 2 209 1 0 0 0 210 1 166 2 2
                                    211 1 0 0 0 212 1 166 2 2 213 1 0 0 0 214 1
                                    166 2 2 215 1 0 0 0 216 1 166 2 2 217 1 0 0
                                    0 218 1 166 2 2 219 1 0 0 0 220 1 221 2 2
                                    222 1 0 0 0 223 1 221 2 2 224 1 0 0 0 225 1
                                    221 2 2 226 1 0 0 0 227 2 221 2 2 2 228 2 0
                                    0 0 0 229 2 221 2 2 2 230 2 0 0 0 0 231 1
                                    221 2 2 232 1 0 0 0 233 2 221 2 2 2 234 2 0
                                    0 0 0 235 2 221 2 2 2 236 2 0 0 0 0 237 2
                                    221 2 2 2 238 2 0 0 0 0 239 2 221 2 2 2 240
                                    2 0 0 0 0 241 2 221 2 2 2 242 2 0 0 0 0 243
                                    1 221 2 2 244 1 0 0 0 245 1 221 2 2 246 1 0
                                    0 0 247 1 221 2 2 248 1 0 0 0 249 1 221 2 2
                                    250 1 0 0 0 251 1 221 2 2 252 1 0 0 0 253 2
                                    221 2 2 2 254 2 0 0 0 0 255 3 221 2 2 2 2
                                    256 3 0 0 0 0 0 257 3 221 2 2 2 2 258 3 0 0
                                    0 0 0 259 3 221 2 2 2 2 260 3 0 0 0 0 0 261
                                    3 221 2 2 2 2 262 3 0 0 0 0 0 263 3 221 2 2
                                    2 2 264 3 0 0 0 0 0 265 3 221 2 2 2 2 266 3
                                    0 0 0 0 0 267 3 221 2 2 2 2 268 3 0 0 0 0 0
                                    269 2 221 2 2 2 270 2 0 0 0 0 271 2 221 2 2
                                    2 272 2 0 0 0 0 273 2 221 2 2 2 274 2 0 0 0
                                    0 275 2 221 2 2 2 276 2 0 0 0 0 277 2 221 2
                                    2 2 278 2 0 0 0 0 279 2 221 2 2 2 280 2 0 0
                                    0 0 281 3 221 2 2 2 2 282 3 0 0 0 0 0 283 3
                                    221 2 2 2 2 284 3 0 0 0 0 0 285 3 221 2 2 2
                                    2 286 3 0 0 0 0 0 287 3 221 2 2 2 2 288 3 0
                                    0 0 0 0 289 3 221 2 2 2 2 290 3 0 0 0 0 0
                                    291 3 221 2 2 2 2 292 3 0 0 0 0 0 293 2 221
                                    2 2 2 294 2 0 0 0 0 295 2 221 2 2 2 296 2 0
                                    0 0 0 297 2 221 2 2 2 298 2 0 0 0 0 299 2
                                    221 2 2 2 300 2 0 0 0 0 301 1 221 2 2 302 1
                                    0 0 0 303 1 221 2 2 304 1 0 0 0 305 2 221 2
                                    2 2 306 2 0 0 0 0 307 2 221 2 2 2 308 2 0 0
                                    0 0 309 3 221 2 2 2 2 310 3 0 0 0 0 0 311 2
                                    221 2 2 2 312 2 0 0 0 0 313 2 221 2 2 2 314
                                    2 0 0 0 0 315 2 221 2 2 2 316 2 0 0 0 0 317
                                    2 221 2 2 2 318 2 0 0 0 0 319 2 221 2 2 2
                                    320 2 0 0 0 0 321 3 221 2 2 2 2 322 3 0 0 0
                                    0 0 323 1 221 2 2 324 1 0 0 0 325 3 221 2 2
                                    2 2 326 3 0 0 0 0 0 327 2 221 2 2 2 328 2 0
                                    0 0 0 329 4 221 2 2 2 2 2 330 4 0 0 0 0 0 0
                                    331 3 221 2 2 2 2 332 3 0 0 0 0 0 333 4 221
                                    2 2 2 2 2 334 4 0 0 0 0 0 0 335 3 221 2 78
                                    78 2 336 3 0 0 337 337 0 338 5 221 2 78 78
                                    78 78 2 339 5 0 0 337 337 337 337 0 340 2
                                    341 2 2 2 342 1 341 2 2 343 1 0 0 0 344 2
                                    341 2 2 2 345 2 0 0 0 0 346 2 341 2 2 2 347
                                    2 0 0 0 0 348 1 341 2 2 349 1 0 0 0 350 2
                                    341 2 2 27 351 2 0 0 0 27 352 2 341 2 2 27
                                    353 2 0 0 0 27 354 2 341 2 2 355 356 2 0 0
                                    0 357 358 2 341 2 2 27 359 2 0 0 0 27 360 2
                                    341 2 2 355 361 2 0 0 0 357 362 1 363 2 2
                                    364 1 0 0 0 365 1 363 2 2 366 1 0 0 0 367 1
                                    363 2 2 368 1 0 0 0 369 1 363 2 2 370 1 0 0
                                    0 371 1 363 2 2 372 1 0 0 0 373 1 363 2 2
                                    374 1 0 0 0 375 1 363 2 2 376 1 0 0 0 377 1
                                    363 2 2 378 1 0 0 0 379 1 363 2 2 380 1 0 0
                                    0 381 1 363 2 2 382 1 0 0 0 383 1 363 2 2
                                    384 1 0 0 0 385 2 363 2 2 27 386 2 0 0 0 27
                                    387 2 363 2 2 355 388 2 0 0 0 357 389 1 161
                                    9 10 390 1 161 10 10 391 1 166 9 10 392 1
                                    166 10 10 393 1 341 9 10 394 1 341 10 10
                                    395 1 363 9 10 396 1 363 10 10 397 1 221 9
                                    10 398 1 221 10 10 399 1 400 0 41 401 2 403
                                    402 400 15 404 1 402 405 0 406 2 41 35 0 15
                                    407 1 135 35 0 408 2 135 0 0 0 409 1 41 0
                                    15 410 2 405 400 0 400 411 0 135 0 412 2
                                    135 9 0 0 413 1 135 2 0 414 1 135 0 0 415 2
                                    42 0 0 0 416 1 42 0 0 417 2 41 9 0 0 418 1
                                    135 78 0 419 2 78 9 420 0 421 2 423 122 422
                                    135 424 1 0 6 0 425 2 122 0 41 35 426 1 122
                                    0 41 427 2 122 0 0 0 428 2 15 9 0 0 429 0
                                    430 0 431 0 35 0 432 3 430 0 0 27 35 433 1
                                    430 0 57 434 3 437 430 435 436 41 438 2 41
                                    0 120 15 439 1 41 0 57 443 3 446 41 444 445
                                    430 447 2 449 135 448 122 450 2 454 0 430
                                    430 455 1 454 0 430 456 1 457 0 454 458 2
                                    460 457 459 135 461 2 135 9 0 0 462 0 135 0
                                    463 2 45 120 120 120 464 2 78 0 0 0 465 1 0
                                    74 337 466 1 0 74 337 467 2 42 0 0 0 468 1
                                    42 0 0 469 0 27 0 470 2 42 0 15 0 471 2 38
                                    0 0 0 472 6 442 430 430 430 473 38 27 38
                                    474 6 453 430 475 475 476 38 27 38 477 2 0
                                    120 120 120 478 2 479 120 120 120 480 1 482
                                    481 135 483 1 0 484 120 485 0 486 0 487 2
                                    41 0 6 486 488 1 0 0 489 490 2 161 2 2 491
                                    492 2 0 0 0 491 493 1 161 135 15 494 1 161
                                    2 2 495 1 0 0 0 496 1 45 491 0 497 1 0 491
                                    0 498 1 45 71 0 499 1 489 500 0 501 1 489
                                    500 0 502 2 505 2 503 504 506 3 510 2 507
                                    508 509 511 2 489 0 0 0 512 1 0 513 0 514 1
                                    0 0 6 515 1 489 0 491 516 1 489 9 10 517 2
                                    10 9 0 27 518 1 0 519 0 520 2 41 9 0 0 521
                                    0 522 0 523 0 122 0 524 2 122 9 0 0 525 1
                                    122 35 0 526 2 522 0 489 35 527 2 522 0 0 0
                                    528 2 489 0 120 27 529 1 489 10 10 530 2
                                    489 0 10 337 531 1 41 532 0 533 1 41 6 0
                                    534 0 489 0 535 1 122 9 0 536 2 489 0 0 35
                                    537 2 489 0 0 0 538 2 489 0 0 0 539 1 45
                                    540 0 541 1 0 540 0 542 4 0 0 0 543 337 27
                                    544 4 0 0 0 10 0 27 545 1 0 38 0 546 1 38 0
                                    337 547 1 38 0 0 548 1 27 9 0 549 2 38 0
                                    550 0 551 2 552 142 2 27 553 3 0 0 0 543
                                    555 556 1 0 0 27 557 2 558 0 2 2 559 2 0 0
                                    0 560 561 3 564 562 2 563 562 565 3 0 566 0
                                    563 566 567 3 570 568 2 569 568 571 3 0 572
                                    0 569 572 573 1 45 148 146 574 2 45 156 146
                                    154 575 3 576 562 15 563 562 577 4 580 578
                                    45 563 578 579 581 3 582 568 15 569 568 583
                                    4 586 584 45 569 584 585 587 1 45 0 15 588
                                    1 45 590 0 591 1 6 9 0 592 1 16 15 6 593 1
                                    45 594 0 595 1 0 594 0 596 3 0 0 0 74 337
                                    597 2 0 0 554 12 598 4 600 2 42 78 15 599
                                    601 3 0 0 0 74 337 602 2 0 0 10 337 603 2
                                    45 0 57 15 604 1 0 605 0 606 1 590 589 0
                                    607 1 0 609 0 610 1 0 14 0 611 2 0 9 0 0
                                    118 2 1 337 0 27 1 1 1 337 0 1 2 1 337 120
                                    27 1 1 1 337 624 1 1 1 337 120 1 2 1 0 0 27
                                    1 1 1 0 0 1 2 1 0 120 27 1 1 1 0 624 1 1 1
                                    0 120 1 1 28 9 0 54 3 1 0 0 0 0 269 3 1 0 0
                                    0 0 267 3 1 0 0 0 0 263 3 1 0 0 0 0 261 3 1
                                    0 0 0 0 259 3 1 0 0 0 0 265 3 1 0 0 0 0 257
                                    2 1 0 0 0 273 1 0 38 337 1 1 0 38 0 546 2 1
                                    622 0 12 1 1 1 625 0 1 1 1 0 0 1 1 1 9 0 1
                                    1 0 74 0 1 1 0 74 337 1 1 1 0 0 202 1 1 0 0
                                    178 2 1 0 0 357 358 2 1 0 0 27 354 2 15 617
                                    0 0 1 3 0 0 0 74 337 602 2 0 0 0 560 561 2
                                    0 0 0 641 1 2 1 0 0 0 277 2 1 0 0 0 275 1
                                    27 484 120 1 1 1 0 0 1 1 1 618 0 1 1 1 0 0
                                    1 2 27 613 614 120 1 2 0 9 0 0 96 2 1 9 0 0
                                    1 1 1 0 0 198 1 1 0 0 174 2 1 0 0 57 87 1 1
                                    9 9 130 1 1 0 0 206 1 1 0 0 182 0 31 0 1 2
                                    1 337 0 27 1 1 1 337 0 1 2 1 337 120 27 1 1
                                    1 337 624 1 1 1 337 120 1 3 1 0 0 120 27
                                    165 2 1 0 0 27 1 1 1 0 0 1 1 1 0 120 1 2 1
                                    0 120 27 163 1 1 0 624 1 1 16 617 0 1 2 16
                                    0 0 35 1 2 16 0 0 93 1 1 1 0 0 325 1 19 513
                                    0 514 1 20 71 0 72 1 1 623 0 1 1 14 632 0 1
                                    1 5 640 0 1 1 0 14 0 611 1 0 519 0 520 1 0
                                    18 0 19 1 19 489 0 1 1 20 491 0 498 1 1 108
                                    0 1 1 14 57 0 1 1 5 106 0 1 1 0 6 0 425 1 0
                                    27 0 1 1 0 12 0 13 2 1 0 0 0 1 1 25 615 146
                                    1 2 25 616 146 154 1 1 5 148 146 150 2 5
                                    156 146 154 158 1 1 0 0 112 1 16 617 0 1 2
                                    1 0 0 0 1 2 1 0 0 27 360 2 1 0 0 357 362 1
                                    1 627 337 1 1 1 9 0 1 2 1 0 0 0 255 2 1 0 0
                                    0 235 0 1 0 168 2 1 0 0 0 348 3 12 572 0
                                    569 572 573 3 13 566 0 563 566 567 1 0 0 0
                                    1 1 0 0 337 1 2 28 9 0 0 1 1 0 543 0 1 1 0
                                    10 10 37 1 16 9 0 52 1 32 9 0 1 1 5 0 0 89
                                    1 5 99 0 100 1 1 9 0 73 2 1 0 0 57 1 2 1
                                    605 337 0 1 1 33 120 12 134 4 1 0 0 0 0 0
                                    335 5 34 0 337 337 337 337 0 340 2 0 0 554
                                    12 598 1 0 18 0 1 3 1 0 0 0 0 285 3 1 0 0 0
                                    0 283 1 1 0 0 172 1 1 0 0 379 3 1 0 0 0 0
                                    323 3 1 0 0 0 0 293 3 1 0 0 0 0 291 1 16
                                    617 0 1 2 16 0 0 35 1 2 16 0 0 93 1 2 1 626
                                    0 0 1 2 1 0 0 0 1 1 1 0 337 1 1 0 642 0 1 1
                                    1 0 0 253 3 1 0 0 0 0 333 3 1 0 0 0 0 289 3
                                    1 0 0 0 0 287 1 0 74 337 467 1 0 74 0 75 2
                                    0 0 10 337 603 2 0 0 10 0 1 2 1 0 0 0 301 2
                                    1 0 0 0 299 2 1 0 0 0 297 2 1 0 0 0 295 2 1
                                    0 0 0 319 2 1 0 0 0 321 2 1 0 0 0 313 4 1 0
                                    0 0 0 0 331 2 1 0 0 0 317 2 1 0 0 0 315 1
                                    16 605 0 1 1 5 636 0 1 1 28 605 0 606 1 28
                                    609 0 610 2 5 634 0 27 1 2 5 634 0 10 1 1
                                    16 634 0 1 2 0 9 0 10 1 2 0 9 0 27 76 1 24
                                    0 0 1 2 1 0 0 27 387 2 1 0 0 357 389 3 34 0
                                    337 337 0 338 2 1 0 0 0 329 1 0 35 0 1 2 0
                                    644 644 0 1 1 0 643 0 1 2 1 0 0 0 281 2 1 0
                                    0 0 279 1 0 9 0 70 1 0 6 0 1 0 1 9 129 2 1
                                    120 120 120 478 1 1 0 337 1 2 1 0 0 0 1 1 1
                                    0 0 383 1 1 0 0 385 2 0 9 0 27 1 2 0 9 0 0
                                    1 2 1 0 0 27 352 1 1 0 0 350 1 1 0 0 344 1
                                    27 484 120 1 1 27 484 120 485 1 1 618 0 1 2
                                    1 629 0 0 1 3 1 631 0 0 0 1 2 1 617 0 0 1 2
                                    1 605 337 0 1 1 1 0 0 170 1 32 9 0 1 2 9 0
                                    0 27 1 1 9 0 0 1 2 9 0 0 38 1 4 9 0 0 10 0
                                    27 545 4 9 0 0 543 337 27 544 4 5 0 0 38
                                    637 639 1 4 5 0 0 38 637 555 1 4 5 0 0 27
                                    35 638 1 4 5 0 0 27 35 554 1 3 0 0 0 10 554
                                    1 3 0 0 0 10 638 1 3 0 0 0 543 555 556 3 0
                                    0 0 543 639 1 3 0 0 0 27 638 1 3 0 0 0 27
                                    554 1 3 0 0 0 38 639 1 3 0 0 0 38 555 1 3 0
                                    0 0 0 0 1 3 0 0 0 337 337 1 2 0 0 0 641 1 3
                                    0 0 0 74 337 597 2 0 0 0 560 1 3 0 0 0 12 0
                                    1 1 1 35 0 1 1 1 0 0 367 1 1 0 0 365 2 0 0
                                    10 337 1 10 0 0 10 0 0 0 0 0 0 0 0 0 1 8 0
                                    0 10 0 0 0 0 0 0 0 1 9 0 0 10 0 0 0 0 0 0 0
                                    0 1 6 0 0 10 0 0 0 0 0 1 7 0 0 10 0 0 0 0 0
                                    0 1 5 0 0 10 0 0 0 0 1 3 0 0 10 0 0 1 4 0 0
                                    10 0 0 0 1 2 0 0 10 0 1 3 1 0 0 0 0 311 1 1
                                    0 0 303 2 1 0 0 0 309 2 1 0 0 0 307 1 1 0 0
                                    305 2 1 628 0 0 1 1 0 0 0 1 2 0 0 0 0 1 1 1
                                    0 0 381 1 1 0 0 233 3 5 0 0 38 637 1 3 5 0
                                    0 27 35 1 2 5 0 0 27 1 2 5 0 0 38 1 1 1 0 0
                                    90 1 1 99 0 102 1 33 0 0 496 1 1 0 0 208 1
                                    1 0 0 184 1 1 0 0 204 1 1 0 0 180 1 1 0 0
                                    200 1 1 0 0 176 1 9 540 0 542 1 10 569 0 1
                                    1 11 563 0 1 1 1 0 618 1 2 8 0 0 0 1 1 1 0
                                    0 225 1 35 612 146 1 2 18 0 0 0 1 1 19 0
                                    489 490 1 23 0 491 1 1 22 0 57 61 1 1 0 619
                                    1 1 1 0 620 1 1 1 0 621 1 1 1 0 108 111 1 1
                                    0 0 1 1 5 0 99 105 1 5 0 106 107 1 0 0 6
                                    515 1 0 0 27 557 1 0 0 12 138 1 0 594 0 596
                                    1 36 617 0 1 3 1 0 0 0 0 327 0 5 35 1 1 0 0
                                    337 1 1 0 0 0 1 2 1 0 0 0 346 2 1 0 0 0 239
                                    2 1 0 0 0 243 2 1 0 0 0 237 2 1 0 0 0 241 1
                                    0 9 10 11 1 1 0 0 214 1 1 0 0 190 3 5 0 0 0
                                    0 1 2 1 9 0 0 1 1 1 0 0 210 1 1 0 0 186 1 1
                                    0 0 218 1 1 0 0 194 5 0 0 27 0 0 0 0 1 2 0
                                    0 27 337 1 4 0 0 27 0 0 0 1 2 0 0 27 0 1 3
                                    0 0 27 0 0 1 2 5 0 0 0 1 2 5 9 0 0 1 2 1 0
                                    0 0 271 1 1 74 0 83 1 1 74 337 466 1 1 0 0
                                    251 1 1 0 0 249 1 1 0 0 247 1 1 0 0 245 1 1
                                    0 0 220 1 1 0 0 196 1 1 0 0 216 1 1 0 0 192
                                    1 1 0 0 212 1 1 0 0 188 1 1 0 0 223 2 24 0
                                    0 57 92 2 1 0 0 0 84 2 1 0 0 491 493 2 16 0
                                    0 35 91 2 16 0 0 93 94 0 28 0 47 1 1 0 0
                                    371 1 1 0 0 375 0 16 0 49 1 1 0 0 227 2 1 0
                                    0 0 229 1 1 0 0 369 3 5 0 0 27 35 1 3 5 0 0
                                    38 637 1 2 5 0 0 38 1 2 5 0 0 27 1 1 1 0 0
                                    373 1 1 0 0 377 2 1 0 0 0 231 2 0 9 0 0 97
                                    2 24 0 0 0 69 2 1 0 99 99 141 1 15 0 0 56 2
                                    15 0 0 0 67 2 28 0 0 0 65 2 15 0 57 0 59 2
                                    28 0 35 0 1 2 28 0 93 0 1 2 2 0 0 6 1 2 2 0
                                    6 0 1 2 1 0 0 491 1 2 1 0 491 0 1 2 16 0 0
                                    0 63)))))
           '|lookupComplete|)) 
