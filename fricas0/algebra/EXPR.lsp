
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
         ((|vl2| (|List| (|Kernel| $))) (#1=#:G782 NIL) (|z| NIL)
          (#2=#:G781 NIL) (|vl1| (|List| (|Symbol|)))
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
         ((|x1| ($)) (|q| (|SparseUnivariatePolynomial| $)) (#1=#:G861 NIL)
          (|k| NIL) (|sas| (|SingletonAsOrderedSet|)) (#2=#:G860 NIL)
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
                                    (GO #5=#:G859))))))))
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
        (SPROG ((|ans| (|List| (|Kernel| $))) (#1=#:G877 NIL) (|k| NIL))
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

(SDEFUN |EXPR;Gamma;2$;72| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 224))) 

(SDEFUN |EXPR;Gamma;3$;73| ((|a| $) (|x| $) ($ $))
        (SPADCALL |a| |x| (QREFELT $ 226))) 

(SDEFUN |EXPR;Beta;3$;74| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 228))) 

(SDEFUN |EXPR;digamma;2$;75| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 230))) 

(SDEFUN |EXPR;polygamma;3$;76| ((|k| $) (|x| $) ($ $))
        (SPADCALL |k| |x| (QREFELT $ 232))) 

(SDEFUN |EXPR;besselJ;3$;77| ((|v| $) (|x| $) ($ $))
        (SPADCALL |v| |x| (QREFELT $ 234))) 

(SDEFUN |EXPR;besselY;3$;78| ((|v| $) (|x| $) ($ $))
        (SPADCALL |v| |x| (QREFELT $ 236))) 

(SDEFUN |EXPR;besselI;3$;79| ((|v| $) (|x| $) ($ $))
        (SPADCALL |v| |x| (QREFELT $ 238))) 

(SDEFUN |EXPR;besselK;3$;80| ((|v| $) (|x| $) ($ $))
        (SPADCALL |v| |x| (QREFELT $ 240))) 

(SDEFUN |EXPR;airyAi;2$;81| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 242))) 

(SDEFUN |EXPR;airyAiPrime;2$;82| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 244))) 

(SDEFUN |EXPR;airyBi;2$;83| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 246))) 

(SDEFUN |EXPR;airyBiPrime;2$;84| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 248))) 

(SDEFUN |EXPR;lambertW;2$;85| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 250))) 

(SDEFUN |EXPR;polylog;3$;86| ((|s| $) (|x| $) ($ $))
        (SPADCALL |s| |x| (QREFELT $ 252))) 

(SDEFUN |EXPR;weierstrassP;4$;87| ((|g2| $) (|g3| $) (|x| $) ($ $))
        (SPADCALL |g2| |g3| |x| (QREFELT $ 254))) 

(SDEFUN |EXPR;weierstrassPPrime;4$;88| ((|g2| $) (|g3| $) (|x| $) ($ $))
        (SPADCALL |g2| |g3| |x| (QREFELT $ 256))) 

(SDEFUN |EXPR;weierstrassSigma;4$;89| ((|g2| $) (|g3| $) (|x| $) ($ $))
        (SPADCALL |g2| |g3| |x| (QREFELT $ 258))) 

(SDEFUN |EXPR;weierstrassZeta;4$;90| ((|g2| $) (|g3| $) (|x| $) ($ $))
        (SPADCALL |g2| |g3| |x| (QREFELT $ 260))) 

(SDEFUN |EXPR;weierstrassPInverse;4$;91| ((|g2| $) (|g3| $) (|z| $) ($ $))
        (SPADCALL |g2| |g3| |z| (QREFELT $ 262))) 

(SDEFUN |EXPR;whittakerM;4$;92| ((|k| $) (|m| $) (|z| $) ($ $))
        (SPADCALL |k| |m| |z| (QREFELT $ 264))) 

(SDEFUN |EXPR;whittakerW;4$;93| ((|k| $) (|m| $) (|z| $) ($ $))
        (SPADCALL |k| |m| |z| (QREFELT $ 266))) 

(SDEFUN |EXPR;angerJ;3$;94| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 268))) 

(SDEFUN |EXPR;weberE;3$;95| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 270))) 

(SDEFUN |EXPR;struveH;3$;96| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 272))) 

(SDEFUN |EXPR;struveL;3$;97| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 274))) 

(SDEFUN |EXPR;hankelH1;3$;98| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 276))) 

(SDEFUN |EXPR;hankelH2;3$;99| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 278))) 

(SDEFUN |EXPR;lommelS1;4$;100| ((|mu| $) (|nu| $) (|z| $) ($ $))
        (SPADCALL |mu| |nu| |z| (QREFELT $ 280))) 

(SDEFUN |EXPR;lommelS2;4$;101| ((|mu| $) (|nu| $) (|z| $) ($ $))
        (SPADCALL |mu| |nu| |z| (QREFELT $ 282))) 

(SDEFUN |EXPR;kummerM;4$;102| ((|mu| $) (|nu| $) (|z| $) ($ $))
        (SPADCALL |mu| |nu| |z| (QREFELT $ 284))) 

(SDEFUN |EXPR;kummerU;4$;103| ((|mu| $) (|nu| $) (|z| $) ($ $))
        (SPADCALL |mu| |nu| |z| (QREFELT $ 286))) 

(SDEFUN |EXPR;legendreP;4$;104| ((|nu| $) (|mu| $) (|z| $) ($ $))
        (SPADCALL |nu| |mu| |z| (QREFELT $ 288))) 

(SDEFUN |EXPR;legendreQ;4$;105| ((|nu| $) (|mu| $) (|z| $) ($ $))
        (SPADCALL |nu| |mu| |z| (QREFELT $ 290))) 

(SDEFUN |EXPR;kelvinBei;3$;106| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 292))) 

(SDEFUN |EXPR;kelvinBer;3$;107| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 294))) 

(SDEFUN |EXPR;kelvinKei;3$;108| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 296))) 

(SDEFUN |EXPR;kelvinKer;3$;109| ((|v| $) (|z| $) ($ $))
        (SPADCALL |v| |z| (QREFELT $ 298))) 

(SDEFUN |EXPR;ellipticK;2$;110| ((|m| $) ($ $)) (SPADCALL |m| (QREFELT $ 300))) 

(SDEFUN |EXPR;ellipticE;2$;111| ((|m| $) ($ $)) (SPADCALL |m| (QREFELT $ 302))) 

(SDEFUN |EXPR;ellipticE;3$;112| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 304))) 

(SDEFUN |EXPR;ellipticF;3$;113| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 306))) 

(SDEFUN |EXPR;ellipticPi;4$;114| ((|z| $) (|n| $) (|m| $) ($ $))
        (SPADCALL |z| |n| |m| (QREFELT $ 308))) 

(SDEFUN |EXPR;jacobiSn;3$;115| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 310))) 

(SDEFUN |EXPR;jacobiCn;3$;116| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 312))) 

(SDEFUN |EXPR;jacobiDn;3$;117| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 314))) 

(SDEFUN |EXPR;jacobiZeta;3$;118| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 316))) 

(SDEFUN |EXPR;jacobiTheta;3$;119| ((|z| $) (|m| $) ($ $))
        (SPADCALL |z| |m| (QREFELT $ 318))) 

(SDEFUN |EXPR;lerchPhi;4$;120| ((|z| $) (|s| $) (|a| $) ($ $))
        (SPADCALL |z| |s| |a| (QREFELT $ 320))) 

(SDEFUN |EXPR;riemannZeta;2$;121| ((|z| $) ($ $))
        (SPADCALL |z| (QREFELT $ 322))) 

(SDEFUN |EXPR;charlierC;4$;122| ((|n| $) (|a| $) (|z| $) ($ $))
        (SPADCALL |n| |a| |z| (QREFELT $ 324))) 

(SDEFUN |EXPR;hermiteH;3$;123| ((|n| $) (|z| $) ($ $))
        (SPADCALL |n| |z| (QREFELT $ 326))) 

(SDEFUN |EXPR;jacobiP;5$;124| ((|n| $) (|a| $) (|b| $) (|z| $) ($ $))
        (SPADCALL |n| |a| |b| |z| (QREFELT $ 328))) 

(SDEFUN |EXPR;laguerreL;4$;125| ((|n| $) (|a| $) (|z| $) ($ $))
        (SPADCALL |n| |a| |z| (QREFELT $ 330))) 

(SDEFUN |EXPR;meixnerM;5$;126| ((|n| $) (|b| $) (|c| $) (|z| $) ($ $))
        (SPADCALL |n| |b| |c| |z| (QREFELT $ 332))) 

(SDEFUN |EXPR;hypergeometricF;2L2$;127|
        ((|la| . #1=(|List| $)) (|lb| . #1#) (|x| $) ($ $))
        (SPADCALL |la| |lb| |x| (QREFELT $ 334))) 

(SDEFUN |EXPR;meijerG;4L2$;128|
        ((|la| . #1=(|List| $)) (|lb| . #1#) (|lc| . #1#) (|ld| . #1#) (|x| $)
         ($ $))
        (SPADCALL |la| |lb| |lc| |ld| |x| (QREFELT $ 337))) 

(SDEFUN |EXPR;^;3$;129| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 340))) 

(SDEFUN |EXPR;factorial;2$;130| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 341))) 

(SDEFUN |EXPR;binomial;3$;131| ((|n| $) (|m| $) ($ $))
        (SPADCALL |n| |m| (QREFELT $ 343))) 

(SDEFUN |EXPR;permutation;3$;132| ((|n| $) (|m| $) ($ $))
        (SPADCALL |n| |m| (QREFELT $ 345))) 

(SDEFUN |EXPR;factorials;2$;133| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 347))) 

(SDEFUN |EXPR;factorials;$S$;134| ((|x| $) (|n| |Symbol|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 349))) 

(SDEFUN |EXPR;summation;$S$;135| ((|x| $) (|n| |Symbol|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 351))) 

(SDEFUN |EXPR;summation;$Sb$;136| ((|x| $) (|s| |SegmentBinding| $) ($ $))
        (SPADCALL |x| |s| (QREFELT $ 354))) 

(SDEFUN |EXPR;product;$S$;137| ((|x| $) (|n| |Symbol|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 357))) 

(SDEFUN |EXPR;product;$Sb$;138| ((|x| $) (|s| |SegmentBinding| $) ($ $))
        (SPADCALL |x| |s| (QREFELT $ 359))) 

(SDEFUN |EXPR;erf;2$;139| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 362))) 

(SDEFUN |EXPR;erfi;2$;140| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 364))) 

(SDEFUN |EXPR;Ei;2$;141| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 366))) 

(SDEFUN |EXPR;Si;2$;142| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 368))) 

(SDEFUN |EXPR;Ci;2$;143| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 370))) 

(SDEFUN |EXPR;Shi;2$;144| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 372))) 

(SDEFUN |EXPR;Chi;2$;145| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 374))) 

(SDEFUN |EXPR;li;2$;146| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 376))) 

(SDEFUN |EXPR;dilog;2$;147| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 378))) 

(SDEFUN |EXPR;fresnelS;2$;148| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 380))) 

(SDEFUN |EXPR;fresnelC;2$;149| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 382))) 

(SDEFUN |EXPR;integral;$S$;150| ((|x| $) (|n| |Symbol|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 384))) 

(SDEFUN |EXPR;integral;$Sb$;151| ((|x| $) (|s| |SegmentBinding| $) ($ $))
        (SPADCALL |x| |s| (QREFELT $ 386))) 

(SDEFUN |EXPR;operator;2Bo;152| ((|op| . #1=(|BasicOperator|)) ($ . #1#))
        (SPROG ((|n| (|Union| (|NonNegativeInteger|) "failed")))
               (SEQ
                (COND
                 ((SPADCALL |op| (QREFELT $ 388))
                  (SPADCALL |op| (QREFELT $ 389)))
                 ((SPADCALL |op| (QREFELT $ 390))
                  (SPADCALL |op| (QREFELT $ 391)))
                 ((SPADCALL |op| (QREFELT $ 392))
                  (SPADCALL |op| (QREFELT $ 393)))
                 ((SPADCALL |op| (QREFELT $ 394))
                  (SPADCALL |op| (QREFELT $ 395)))
                 ((SPADCALL |op| (QREFELT $ 396))
                  (SPADCALL |op| (QREFELT $ 397)))
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
                         |EXPR;operator;2Bo;152|)
                   (EXIT
                    (COND
                     ((QEQCAR |n| 1)
                      (SPADCALL (SPADCALL |op| (QREFELT $ 29)) (QREFELT $ 34)))
                     (#2#
                      (SPADCALL (SPADCALL |op| (QREFELT $ 29)) (QCDR |n|)
                                (QREFELT $ 36))))))))))) 

(SDEFUN |EXPR;reduc| ((|x| $) (|l| |List| (|Kernel| $)) ($ $))
        (SPROG
         ((|p| (|SparseUnivariatePolynomial| $)) (#1=#:G1006 NIL) (|k| NIL))
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
        (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 399)) |k| (QREFELT $ 402))
                  (QREFELT $ 404))) 

(SDEFUN |EXPR;evl|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| $)) (|k| |Kernel| $)
         (|m| |SparseUnivariatePolynomial| $)
         ($ |Fraction| (|SparseMultivariatePolynomial| R (|Kernel| $))))
        (COND
         ((< (SPADCALL |p| |k| (QREFELT $ 405)) (SPADCALL |m| (QREFELT $ 406)))
          (SPADCALL |p| (QREFELT $ 399)))
         ('T
          (SPADCALL (SPADCALL (|EXPR;evl0| |p| |k| $) |m| (QREFELT $ 407))
                    (SPADCALL (SPADCALL |k| (QREFELT $ 408)) (QREFELT $ 399))
                    (QREFELT $ 409))))) 

(SDEFUN |EXPR;noalg?| ((|p| |SparseUnivariatePolynomial| $) ($ |Boolean|))
        (SPROG ((#1=#:G1015 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |p| (|spadConstant| $ 410)
                                    (QREFELT $ 411)))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL
                            (NULL
                             (|EXPR;algkernels|
                              (SPADCALL (SPADCALL |p| (QREFELT $ 412))
                                        (QREFELT $ 75))
                              $)))
                           (PROGN
                            (LETT #1# NIL . #2=(|EXPR;noalg?|))
                            (GO #3=#:G1014)))
                          ('T
                           (LETT |p| (SPADCALL |p| (QREFELT $ 413)) . #2#)))))
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
                            (SPADCALL |p| (|spadConstant| $ 410)
                                      (QREFELT $ 411)))
                           (GO G191)))
                         (SEQ (LETT |lc| (SPADCALL |p| (QREFELT $ 412)) . #1#)
                              (LETT |res|
                                    (SPADCALL (SPADCALL |lc| (QREFELT $ 83))
                                              |res| (QREFELT $ 414))
                                    . #1#)
                              (EXIT
                               (LETT |p| (SPADCALL |p| (QREFELT $ 413))
                                     . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |res| (QREFELT $ 415)))))) 

(SDEFUN |EXPR;algpars| ((|lk| |List| (|Kernel| $)) ($ |List| (|Kernel| $)))
        (SPROG
         ((|res| (|List| (|Kernel| $))) (|arg| (|List| $)) (#1=#:G1026 NIL)
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
                            |res| (QREFELT $ 414))
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT $ 415)))))) 

(SDEFUN |EXPR;trivial_denoms|
        ((|p| |SparseUnivariatePolynomial| $) ($ |Boolean|))
        (SPADCALL (CONS #'|EXPR;trivial_denoms!0| $)
                  (SPADCALL |p| (QREFELT $ 417)) (QREFELT $ 419))) 

(SDEFUN |EXPR;trivial_denoms!0| ((|c| NIL) ($ NIL))
        (SPADCALL (SPADCALL |c| (QREFELT $ 102)) (|spadConstant| $ 104)
                  (QREFELT $ 416))) 

(SDEFUN |EXPR;SUP_to_SUPP|
        ((|p| |SparseUnivariatePolynomial| $)
         ($ |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| R (|Kernel| $))))
        (SPADCALL (ELT $ 100) |p| (QREFELT $ 422))) 

(SDEFUN |EXPR;def_poly|
        ((|k| |Kernel| $)
         ($ |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| R (|Kernel| $))))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (#1=#:G1037 NIL)
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
                    (PROG1 (LETT #1# (SPADCALL |arg2| (QREFELT $ 423)) . #2#)
                      (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #1#))
                    . #2#)
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |arg1| (QREFELT $ 102)) |n|
                          (QREFELT $ 424))
                (SPADCALL (SPADCALL |arg1| (QREFELT $ 100)) (QREFELT $ 425))
                (QREFELT $ 426)))))
            ('T (|error| "def_poly : unknown kernel"))))))) 

(SDEFUN |EXPR;varmap1|
        ((|k0| |Kernel| $) (|lk| |List| (|Kernel| $)) (|ls| |List| (|Symbol|))
         ($ |Symbol|))
        (SPROG
         ((#1=#:G1045 NIL) (#2=#:G1046 NIL) (|k| NIL) (#3=#:G1047 NIL)
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
                    ((SPADCALL |k| |k0| (QREFELT $ 427))
                     (PROGN (LETT #1# |s| . #4#) (GO #5=#:G1044))))))
                 (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #4#)) . #4#)
                 (GO G190) G191 (EXIT NIL))
            (EXIT (|error| "varmap1: kernel not on the list"))))
          #5# (EXIT #1#)))) 

(SDEFUN |EXPR;varmap2|
        ((|s0| |Symbol|) (|lk| |List| (|Kernel| $)) (|ls| |List| (|Symbol|))
         ($ |Kernel| $))
        (SPROG
         ((#1=#:G1058 NIL) (#2=#:G1059 NIL) (|k| NIL) (#3=#:G1060 NIL)
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
                     (PROGN (LETT #1# |k| . #4#) (GO #5=#:G1057))))))
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
                         (ELT $ 432) |p| (QREFELT $ 436)))) 

(SDEFUN |EXPR;MP_to_PI!0| ((|k| NIL) ($$ NIL))
        (PROG ($ |lk| |ls|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;MP_to_PI|))
          (LETT |lk| (QREFELT $$ 1) . #1#)
          (LETT |ls| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (|spadConstant| $ 429) (|EXPR;varmap1| |k| |lk| |ls| $)
                      (|spadConstant| $ 430) (QREFELT $ 431)))))) 

(SDEFUN |EXPR;SUPP_to_PI|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| R (|Kernel| $)))
         (|lk| |List| (|Kernel| $)) (|ls| |List| (|Symbol|)) (|xk| |Kernel| $)
         ($ |Polynomial| (|Integer|)))
        (SPROG ((|p2| (|SparseMultivariatePolynomial| R (|Kernel| $))))
               (SEQ
                (LETT |p2| (SPADCALL |p| |xk| (QREFELT $ 437))
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
                          (ELT $ 441) |p| (QREFELT $ 445))
                . #1=(|EXPR;PI_to_SUP|))
          (LETT |p2| (SPADCALL |p1| |xk| (QREFELT $ 121)) . #1#)
          (EXIT
           (LETT |p3| (SPADCALL (ELT $ 105) |p2| (QREFELT $ 448)) . #1#))))) 

(SDEFUN |EXPR;PI_to_SUP!0| ((|s| NIL) ($$ NIL))
        (PROG ($ |lk| |ls|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;PI_to_SUP|))
          (LETT |lk| (QREFELT $$ 1) . #1#)
          (LETT |ls| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (|spadConstant| $ 104) (|EXPR;varmap2| |s| |lk| |ls| $)
                      (|spadConstant| $ 430) (QREFELT $ 126)))))) 

(SDEFUN |EXPR;to_RF|
        ((|c| $) (|lk| |List| (|Kernel| $)) (|ls| |List| (|Symbol|))
         ($ |Fraction| (|Polynomial| (|Integer|))))
        (SPADCALL (|EXPR;MP_to_PI| (SPADCALL |c| (QREFELT $ 100)) |lk| |ls| $)
                  (|EXPR;MP_to_PI| (SPADCALL |c| (QREFELT $ 102)) |lk| |ls| $)
                  (QREFELT $ 453))) 

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
          (LETT |p2| (SPADCALL |p| |k| (QREFELT $ 437))
                . #1=(|EXPR;SUPP_to_PT|))
          (LETT |up|
                (SPADCALL
                 (SPADCALL (|EXPR;MP_to_PI| |p2| |lk| |ls| $) (QREFELT $ 454))
                 (QREFELT $ 456))
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
                          (QREFELT $ 459))
                |EXPR;SUP_to_PT|)
          (EXIT (CONS |s| |up|))))) 

(SDEFUN |EXPR;SUP_to_PT!0| ((|c| NIL) ($$ NIL))
        (PROG (|lk| |ls| $)
          (LETT |lk| (QREFELT $$ 2) . #1=(|EXPR;SUP_to_PT|))
          (LETT |ls| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|EXPR;to_RF| |c| |lk| |ls| $))))) 

(SDEFUN |EXPR;gcdPolynomial;3Sup;171|
        ((|p| . #1=(|SparseUnivariatePolynomial| $)) (|q| . #1#) ($ . #1#))
        (SPROG
         ((|g2| (|Polynomial| (|Integer|)))
          (|lm2|
           (|List|
            (|Record| (|:| |var| (|Symbol|))
                      (|:| |coef|
                           (|SparseUnivariatePolynomial|
                            (|Fraction| (|Polynomial| (|Integer|))))))))
          (#2=#:G1111 NIL) (|m| NIL) (#3=#:G1112 NIL) (|k| NIL)
          (#4=#:G1110 NIL)
          (|q2|
           #5=(|Record| (|:| |var| (|Symbol|))
                        (|:| |coef|
                             (|SparseUnivariatePolynomial|
                              (|Fraction| (|Polynomial| (|Integer|)))))))
          (|p2| #5#) (|g1| (|Polynomial| (|Integer|)))
          (|p_syms| (|List| (|Symbol|))) (|a_syms| (|List| (|Symbol|)))
          (#6=#:G1109 NIL) (#7=#:G1108 NIL)
          (|lm1| (|List| (|Polynomial| (|Integer|)))) (#8=#:G1106 NIL)
          (#9=#:G1107 NIL) (#10=#:G1105 NIL)
          (|q1| #11=(|Polynomial| (|Integer|))) (|p1| #11#) (#12=#:G1104 NIL)
          (#13=#:G1103 NIL)
          (|lm|
           (|List|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| R (|Kernel| $)))))
          (#14=#:G1102 NIL) (#15=#:G1101 NIL) (|all_syms| (|List| (|Symbol|)))
          (|all_kers| (|List| (|Kernel| $))) (|xk| (|Kernel| $))
          (|x| #16=(|Symbol|)) (|all_syms0| (|List| #16#)) (#17=#:G1100 NIL)
          (#18=#:G1099 NIL) (|akers| (|List| (|Kernel| $)))
          (|all_kers0| (|List| (|Kernel| $))) (|apars| (|List| (|Kernel| $)))
          (|cl| (|List| $)))
         (SEQ
          (COND ((SPADCALL |p| (|spadConstant| $ 410) (QREFELT $ 460)) |q|)
                ((EQL (SPADCALL |p| (QREFELT $ 406)) 0) (|spadConstant| $ 461))
                ((SPADCALL |q| (|spadConstant| $ 410) (QREFELT $ 460)) |p|)
                (#19='T
                 (COND
                  ((EQL (SPADCALL |q| (QREFELT $ 406)) 0)
                   (|spadConstant| $ 461))
                  (#19#
                   (SEQ
                    (COND
                     ((|EXPR;noalg?| |p| $)
                      (COND
                       ((|EXPR;noalg?| |q| $)
                        (EXIT (SPADCALL |p| |q| (QREFELT $ 462)))))))
                    (LETT |cl|
                          (SPADCALL (SPADCALL |p| (QREFELT $ 417))
                                    (SPADCALL |q| (QREFELT $ 417))
                                    (QREFELT $ 463))
                          . #20=(|EXPR;gcdPolynomial;3Sup;171|))
                    (LETT |akers| (SPADCALL |cl| (QREFELT $ 464)) . #20#)
                    (LETT |apars| (|EXPR;algpars| |akers| $) . #20#)
                    (LETT |all_kers0|
                          (SPADCALL (SPADCALL |cl| (QREFELT $ 465)) |apars|
                                    (QREFELT $ 466))
                          . #20#)
                    (LETT |akers| (REVERSE (SPADCALL |akers| (QREFELT $ 467)))
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
                                        (CONS (SPADCALL (QREFELT $ 468)) #18#)
                                        . #20#)))
                                (LETT #17# (CDR #17#) . #20#) (GO G190) G191
                                (EXIT (NREVERSE #18#))))
                          . #20#)
                    (LETT |x| (SPADCALL (QREFELT $ 468)) . #20#)
                    (LETT |xk| (SPADCALL |x| (QREFELT $ 30)) . #20#)
                    (LETT |all_kers|
                          (SPADCALL |xk| |all_kers0| (QREFELT $ 469)) . #20#)
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
                          (SPADCALL |all_syms0| |a_syms| (QREFELT $ 470))
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
                                (SPADCALL |all_syms0| |a_syms| (QREFELT $ 470))
                                . #20#)
                          (LETT |g1|
                                (SPADCALL |p1| |q1| |lm1| |p_syms| |x| |a_syms|
                                          (QREFELT $ 472))
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
                                    (QREFELT $ 475))
                          . #20#)
                    (EXIT
                     (|EXPR;PI_to_SUP| |g2| |all_kers| |all_syms| |xk|
                      $)))))))))) 

(SDEFUN |EXPR;gcdPolynomial;3Sup;172|
        ((|p| . #1=(|SparseUnivariatePolynomial| $)) (|q| . #1#) ($ . #1#))
        (SEQ
         (COND
          ((|EXPR;noalg?| |p| $)
           (COND
            ((|EXPR;noalg?| |q| $)
             (EXIT (SPADCALL |p| |q| (QREFELT $ 462)))))))
         (EXIT (SPADCALL |p| |q| (QREFELT $ 478))))) 

(SDEFUN |EXPR;factorPolynomial;SupF;173|
        ((|x| |SparseUnivariatePolynomial| $)
         ($ |Factored| (|SparseUnivariatePolynomial| $)))
        (SPADCALL |x| (QREFELT $ 481))) 

(SDEFUN |EXPR;coerce;An$;174| ((|x| |AlgebraicNumber|) ($ $))
        (SPADCALL (SPADCALL |x| (|spadConstant| $ 485) (QREFELT $ 486))
                  (QREFELT $ 105))) 

(SDEFUN |EXPR;^;$F$;175| ((|x| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPADCALL |x| |r| (QREFELT $ 490))) 

(SDEFUN |EXPR;minPoly;KSup;176|
        ((|k| |Kernel| $) ($ |SparseUnivariatePolynomial| $))
        (SPADCALL |k| (QREFELT $ 492))) 

(SDEFUN |EXPR;definingPolynomial;2$;177| ((|x| $) ($ $))
        (SPADCALL |x| (QREFELT $ 493))) 

(SDEFUN |EXPR;retract;$F;178| ((|x| $) ($ |Fraction| (|Integer|)))
        (SPADCALL |x| (QREFELT $ 495))) 

(SDEFUN |EXPR;retractIfCan;$U;179|
        ((|x| $) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (SPADCALL |x| (QREFELT $ 497))) 

(SDEFUN |EXPR;coerce;An$;180| ((|x| |AlgebraicNumber|) ($ $))
        (SPADCALL (|EXPR;smp2expr| (SPADCALL |x| (QREFELT $ 499)) $)
                  (|EXPR;smp2expr| (SPADCALL |x| (QREFELT $ 500)) $)
                  (QREFELT $ 69))) 

(SDEFUN |EXPR;k2expr| ((|k| |Kernel| (|AlgebraicNumber|)) ($ $))
        (SPADCALL (ELT $ 488) |k| (QREFELT $ 504))) 

(SDEFUN |EXPR;smp2expr|
        ((|p| |SparseMultivariatePolynomial| (|Integer|)
          (|Kernel| (|AlgebraicNumber|)))
         ($ $))
        (SPADCALL (CONS (|function| |EXPR;k2expr|) $) (ELT $ 61) |p|
                  (QREFELT $ 509))) 

(SDEFUN |EXPR;retractIfCan;$U;183|
        ((|x| $) ($ |Union| (|AlgebraicNumber|) "failed"))
        (SPROG
         ((#1=#:G1151 NIL) (|d| #2=(|Union| (|AlgebraicNumber|) "failed"))
          (|n| #2#))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |n| (|EXPR;smp2an| (SPADCALL |x| (QREFELT $ 100)) $)
                   . #3=(|EXPR;retractIfCan;$U;183|))
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
                                           (QREFELT $ 510)))
                           . #3#)
                     (GO #4=#:G1146))))))))))
            (EXIT (CONS 1 "failed"))))
          #4# (EXIT #1#)))) 

(SDEFUN |EXPR;R2AN| ((|r| R) ($ |Union| (|AlgebraicNumber|) "failed"))
        (SPROG ((|u| (|Union| (|Fraction| (|Integer|)) "failed")))
               (SEQ
                (LETT |u|
                      (SPADCALL (SPADCALL |r| (QREFELT $ 513)) (QREFELT $ 72))
                      |EXPR;R2AN|)
                (EXIT
                 (COND
                  ((QEQCAR |u| 0)
                   (CONS 0 (SPADCALL (QCDR |u|) (QREFELT $ 514))))
                  ('T (CONS 1 "failed"))))))) 

(SDEFUN |EXPR;k2an| ((|k| |Kernel| $) ($ |Union| (|AlgebraicNumber|) "failed"))
        (SPROG
         ((|arg| (|List| (|AlgebraicNumber|))) (#1=#:G1183 NIL)
          (|a| #2=(|Union| (|AlgebraicNumber|) #3="failed")) (#4=#:G1184 NIL)
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
               (QREFELT $ 515)))
             (CONS 1 "failed"))
            ('T
             (COND
              ((SPADCALL |op| '|rootOf| (QREFELT $ 516))
               (SEQ (LETT |args| (SPADCALL |k| (QREFELT $ 79)) . #5#)
                    (LETT |a2| (SPADCALL |args| 2 (QREFELT $ 81)) . #5#)
                    (LETT |k1u| (SPADCALL |a2| (QREFELT $ 19)) . #5#)
                    (EXIT
                     (COND ((QEQCAR |k1u| 1) (CONS 1 "failed"))
                           (#6='T
                            (SEQ (LETT |k1| (QCDR |k1u|) . #5#)
                                 (LETT |s1u| (SPADCALL |a2| (QREFELT $ 518))
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
                                                  (QREFELT $ 519))
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
                                                        (|spadConstant| $ 521)
                                                        . #5#)
                                                  (SEQ G190
                                                       (COND
                                                        ((NULL
                                                          (SPADCALL |eq|
                                                                    (|spadConstant|
                                                                     $ 522)
                                                                    (QREFELT $
                                                                             523)))
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
                                                                         512))
                                                              . #5#)
                                                        (EXIT
                                                         (COND
                                                          ((QEQCAR |ccu| 1)
                                                           (PROGN
                                                            (LETT #1#
                                                                  (CONS 1
                                                                        "failed")
                                                                  . #5#)
                                                            (GO #7=#:G1182)))
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
                                                                              524))
                                                                    (QREFELT $
                                                                             525))
                                                                   (QREFELT $
                                                                            526))
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
                                                                            527))))))))))))))))))
              (#6#
               (SEQ (LETT |arg| NIL . #5#)
                    (SEQ (LETT |x| NIL . #5#)
                         (LETT #4# (SPADCALL |k| (QREFELT $ 79)) . #5#) G190
                         (COND
                          ((OR (ATOM #4#)
                               (PROGN (LETT |x| (CAR #4#) . #5#) NIL))
                           (GO G191)))
                         (SEQ (LETT |a| (SPADCALL |x| (QREFELT $ 512)) . #5#)
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
                           (SPADCALL (SPADCALL |op| (QREFELT $ 528))
                                     (NREVERSE |arg|) (QREFELT $ 529))))))))))
          #7# (EXIT #1#)))) 

(SDEFUN |EXPR;smp2an|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| $))
         ($ |Union| (|AlgebraicNumber|) #1="failed"))
        (SPROG
         ((|c| (|Union| (|AlgebraicNumber|) #1#))
          (|up|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| $))))
          (|ans| (|AlgebraicNumber|)) (#2=#:G1199 NIL)
          (|t| (|Union| (|AlgebraicNumber|) "failed")) (|k| (|Kernel| $))
          (|x1| (|Union| (|Kernel| $) "failed")))
         (SEQ
          (EXIT
           (SEQ (LETT |x1| (SPADCALL |p| (QREFELT $ 531)) . #3=(|EXPR;smp2an|))
                (EXIT
                 (COND
                  ((QEQCAR |x1| 1)
                   (|EXPR;R2AN| (SPADCALL |p| (QREFELT $ 532)) $))
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
                            (SEQ (LETT |ans| (|spadConstant| $ 533) . #3#)
                                 (SEQ G190
                                      (COND
                                       ((NULL
                                         (NULL
                                          (SPADCALL |up| (QREFELT $ 534))))
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
                                           (GO #5=#:G1198)))
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
                                                                        $ 524))
                                                                      (QREFELT
                                                                       $ 535))
                                                                     (QREFELT $
                                                                              536))
                                                           (QREFELT $ 537))
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
                                                                  537))))))))))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |EXPR;convert;$If;187| ((|x| $) ($ |InputForm|))
        (SPADCALL |x| (QREFELT $ 539))) 

(SDEFUN |EXPR;eval;$Bo$S$;188|
        ((|f| $) (|op| |BasicOperator|) (|g| $) (|x| |Symbol|) ($ $))
        (SPADCALL |f| (LIST |op|) (LIST |g|) |x| (QREFELT $ 542))) 

(SDEFUN |EXPR;eval;$LLS$;189|
        ((|f| $) (|ls| |List| (|BasicOperator|)) (|lg| |List| $) (|x| |Symbol|)
         ($ $))
        (SPROG
         ((|res| ($)) (#1=#:G1230 NIL) (|g| NIL) (#2=#:G1229 NIL)
          (|nlg| (|List| $)) (#3=#:G1228 NIL) (#4=#:G1227 NIL)
          (|lbackwardSubs| (|List| (|Equation| $))) (#5=#:G1225 NIL) (|i| NIL)
          (#6=#:G1226 NIL) (|j| NIL) (#7=#:G1224 NIL)
          (|lforwardSubs| (|List| (|Equation| $))) (#8=#:G1222 NIL)
          (#9=#:G1223 NIL) (#10=#:G1221 NIL) (|ns| (|List| (|Symbol|)))
          (#11=#:G1220 NIL) (#12=#:G1219 NIL) (#13=#:G1218 NIL)
          (#14=#:G1217 NIL) (|lsd| (|List| (|Symbol|)))
          (|lsym| (|List| (|Symbol|))) (|llsym| (|List| (|List| (|Symbol|))))
          (#15=#:G1216 NIL) (#16=#:G1215 NIL))
         (SEQ
          (LETT |llsym|
                (PROGN
                 (LETT #16# NIL . #17=(|EXPR;eval;$LLS$;189|))
                 (SEQ (LETT |g| NIL . #17#) (LETT #15# |lg| . #17#) G190
                      (COND
                       ((OR (ATOM #15#)
                            (PROGN (LETT |g| (CAR #15#) . #17#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #16# (CONS (SPADCALL |g| (QREFELT $ 544)) #16#)
                              . #17#)))
                      (LETT #15# (CDR #15#) . #17#) (GO G190) G191
                      (EXIT (NREVERSE #16#))))
                . #17#)
          (LETT |lsym|
                (SPADCALL (SPADCALL |llsym| (QREFELT $ 545)) (QREFELT $ 546))
                . #17#)
          (LETT |lsd| (SPADCALL (ELT $ 547) |lsym| (QREFELT $ 549)) . #17#)
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
                                     (CONS (SPADCALL |g| |x| (QREFELT $ 551))
                                           #14#)
                                     . #17#)))
                             (LETT #13# (CDR #13#) . #17#) (GO G190) G191
                             (EXIT (NREVERSE #14#))))
                       (QREFELT $ 554)))
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
                            (LETT #12# (CONS (SPADCALL (QREFELT $ 468)) #12#)
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
                                   (SPADCALL (SPADCALL |i| (QREFELT $ 555))
                                             (SPADCALL |j| (QREFELT $ 555))
                                             (QREFELT $ 557))
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
                                   (SPADCALL (SPADCALL |j| (QREFELT $ 555))
                                             (SPADCALL |i| (QREFELT $ 555))
                                             (QREFELT $ 557))
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
                                             (QREFELT $ 559))
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
                                             (SPADCALL |g| |x| (QREFELT $ 551))
                                             #2#)
                                            . #17#)))
                                    (LETT #1# (CDR #1#) . #17#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT $ 554))
                    . #17#)
              (EXIT (SPADCALL |res| |lbackwardSubs| (QREFELT $ 559)))))))))) 

(SDEFUN |EXPR;patternMatch;$P2Pmr;190|
        ((|x| $) (|p| |Pattern| #1=(|Integer|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (QREFELT $ 563))) 

(SDEFUN |EXPR;patternMatch;$P2Pmr;191|
        ((|x| $) (|p| |Pattern| #1=(|Float|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (QREFELT $ 569))) 

(SDEFUN |EXPR;Zero;$;192| (($ $)) (|spadConstant| $ 46)) 

(SDEFUN |EXPR;One;$;193| (($ $)) (|spadConstant| $ 48)) 

(SDEFUN |EXPR;-;2$;194| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 55))) 

(SDEFUN |EXPR;*;I2$;195| ((|n| |Integer|) (|x| $) ($ $))
        (SPADCALL |n| |x| (QREFELT $ 58))) 

(SDEFUN |EXPR;*;3$;196| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 62))) 

(SDEFUN |EXPR;+;3$;197| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 64))) 

(SDEFUN |EXPR;=;2$B;198| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 51))) 

(SDEFUN |EXPR;smaller?;2$B;199| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 95))) 

(PUT '|EXPR;numer;$Smp;200| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |EXPR;numer;$Smp;200|
        ((|x| $) ($ |SparseMultivariatePolynomial| R (|Kernel| $))) |x|) 

(PUT '|EXPR;coerce;Smp$;201| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |EXPR;coerce;Smp$;201|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| $)) ($ $)) |p|) 

(SDEFUN |EXPR;coerce;P$;202| ((|p| |Polynomial| R) ($ $))
        (|EXPR;poly_to_MP| |p| $)) 

(SDEFUN |EXPR;reducedSystem;MM;203| ((|m| |Matrix| $) ($ |Matrix| R))
        (SPADCALL |m| (QREFELT $ 572))) 

(SDEFUN |EXPR;reducedSystem;MVR;204|
        ((|m| |Matrix| $) (|v| |Vector| $)
         ($ |Record| (|:| |mat| (|Matrix| R)) (|:| |vec| (|Vector| R))))
        (SPADCALL |m| |v| (QREFELT $ 573))) 

(SDEFUN |EXPR;convert;$If;205| ((|x| $) ($ |InputForm|))
        (SPADCALL |x| (QREFELT $ 539))) 

(SDEFUN |EXPR;kintmatch|
        ((|k| |Kernel| $) (|p| |Pattern| (|Integer|))
         (|l| |PatternMatchResult| (|Integer|) |Rep|)
         ($ |PatternMatchResult| (|Integer|) |Rep|))
        (SPADCALL |k| |p| |l| (QREFELT $ 575))) 

(SDEFUN |EXPR;patternMatch;$P2Pmr;207|
        ((|x| $) (|p| |Pattern| #1=(|Integer|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (CONS (|function| |EXPR;kintmatch|) $)
                  (QREFELT $ 579))) 

(SDEFUN |EXPR;kfltmatch|
        ((|k| |Kernel| $) (|p| |Pattern| (|Float|))
         (|l| |PatternMatchResult| (|Float|) |Rep|)
         ($ |PatternMatchResult| (|Float|) |Rep|))
        (SPADCALL |k| |p| |l| (QREFELT $ 581))) 

(SDEFUN |EXPR;patternMatch;$P2Pmr;209|
        ((|x| $) (|p| |Pattern| #1=(|Float|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (CONS (|function| |EXPR;kfltmatch|) $)
                  (QREFELT $ 585))) 

(SDEFUN |EXPR;Zero;$;210| (($ $)) (|spadConstant| $ 46)) 

(SDEFUN |EXPR;+;3$;211| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 64))) 

(SDEFUN |EXPR;=;2$B;212| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 51))) 

(SDEFUN |EXPR;smaller?;2$B;213| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 95))) 

(SDEFUN |EXPR;coerce;K$;214| ((|k| |Kernel| $) ($ $))
        (SPADCALL |k| (QREFELT $ 586))) 

(SDEFUN |EXPR;kernels;$L;215| ((|x| $) ($ |List| (|Kernel| $)))
        (SPROG ((#1=#:G1269 NIL) (|f| NIL) (#2=#:G1268 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|EXPR;kernels;$L;215|))
                 (SEQ (LETT |f| NIL . #3#)
                      (LETT #1# (SPADCALL |x| (QREFELT $ 589)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QCAR |f|) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |EXPR;coerce;R$;216| ((|x| R) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 590)) (|spadConstant| $ 47))
              ('T (SPADCALL (SPADCALL |x| (QREFELT $ 591)) (QREFELT $ 138))))) 

(SDEFUN |EXPR;retract;$R;217| ((|x| $) ($ R))
        (COND ((SPADCALL |x| (QREFELT $ 54)) (|spadConstant| $ 88))
              ('T (|EXPR;retNotUnit| |x| $)))) 

(SDEFUN |EXPR;coerce;$Of;218| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 593))) 

(SDEFUN |EXPR;kereval|
        ((|k| |Kernel| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG NIL
               (SPADCALL |lk| |lv| |k|
                         (CONS #'|EXPR;kereval!1| (VECTOR |lk| |lv| $))
                         (QREFELT $ 599)))) 

(SDEFUN |EXPR;kereval!1| ((|x2| NIL) ($$ NIL))
        (PROG ($ |lv| |lk|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;kereval|))
          (LETT |lv| (QREFELT $$ 1) . #1#)
          (LETT |lk| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|EXPR;kereval!0| (VECTOR $ |lv| |lk|))
                             |x2| (QREFELT $ 596))))))) 

(SDEFUN |EXPR;kereval!0| ((|x1| NIL) ($$ NIL))
        (PROG (|lk| |lv| $)
          (LETT |lk| (QREFELT $$ 2) NIL)
          (LETT |lv| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x1| |lk| |lv| (QREFELT $ 595)))))) 

(SDEFUN |EXPR;subeval|
        ((|k| |Kernel| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG NIL
               (SEQ
                (SPADCALL |lk| |lv| |k|
                          (CONS #'|EXPR;subeval!0| (VECTOR |lv| |lk| $))
                          (QREFELT $ 599))))) 

(SDEFUN |EXPR;subeval!0| ((|x| NIL) ($$ NIL))
        (PROG ($ |lk| |lv|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;subeval|))
          (LETT |lk| (QREFELT $$ 1) . #1#)
          (LETT |lv| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G1293 NIL) (|a| NIL) (#3=#:G1292 NIL))
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
                                                       (QREFELT $ 600))
                                             #3#)
                                            NIL)))
                                    (LETT #2# (CDR #2#) NIL) (GO G190) G191
                                    (EXIT (NREVERSE #3#))))
                              (QREFELT $ 601)))))))) 

(SDEFUN |EXPR;isPlus;$U;221| ((|x| $) ($ |Union| (|List| $) "failed"))
        (SPROG
         ((#1=#:G1308 NIL) (|t| NIL) (#2=#:G1307 NIL)
          (|l|
           (|List| (|Record| (|:| |k| (|Kernel| $)) (|:| |c| (|Integer|))))))
         (SEQ
          (COND
           ((OR
             (NULL
              (LETT |l| (SPADCALL |x| (QREFELT $ 589))
                    . #3=(|EXPR;isPlus;$U;221|)))
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
                                           (QREFELT $ 602))
                                 #2#)
                                . #3#)))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#)))))))))) 

(SDEFUN |EXPR;isMult;$U;222|
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
              (LETT |l| (SPADCALL |x| (QREFELT $ 589))
                    . #1=(|EXPR;isMult;$U;222|)))
             (NULL (NULL (CDR |l|))))
            (CONS 1 "failed"))
           ('T
            (SEQ (LETT |t| (SPADCALL |l| (QREFELT $ 605)) . #1#)
                 (EXIT (CONS 0 (CONS (QCDR |t|) (QCAR |t|)))))))))) 

(SDEFUN |EXPR;eval;$LL$;223|
        ((|x| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG
         ((#1=#:G1324 NIL) (#2=#:G1323 ($)) (#3=#:G1325 ($)) (#4=#:G1327 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|EXPR;eval;$LL$;223|))
           (SEQ (LETT |t| NIL . #5#)
                (LETT #4# (SPADCALL |x| (QREFELT $ 589)) . #5#) G190
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

(SDEFUN |EXPR;subst;$LL$;224|
        ((|x| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG
         ((#1=#:G1330 NIL) (#2=#:G1329 ($)) (#3=#:G1331 ($)) (#4=#:G1333 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|EXPR;subst;$LL$;224|))
           (SEQ (LETT |t| NIL . #5#)
                (LETT #4# (SPADCALL |x| (QREFELT $ 589)) . #5#) G190
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

(SDEFUN |EXPR;retractIfCan;$U;225| ((|x| $) ($ |Union| R "failed"))
        (COND ((SPADCALL |x| (QREFELT $ 54)) (CONS 0 (|spadConstant| $ 88)))
              ('T (|EXPR;retNotUnitIfCan| |x| $)))) 

(SDEFUN |EXPR;-;2$;226| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 55))) 

(SDEFUN |EXPR;smaller?;2$B;227| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 95))) 

(SDEFUN |EXPR;=;2$B;228| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 51))) 

(PUT '|EXPR;coerce;K$;229| '|SPADreplace| '(XLAM (|k|) |k|)) 

(SDEFUN |EXPR;coerce;K$;229| ((|k| |Kernel| $) ($ $)) |k|) 

(PUT '|EXPR;kernels;$L;230| '|SPADreplace| 'LIST) 

(SDEFUN |EXPR;kernels;$L;230| ((|x| $) ($ |List| (|Kernel| $))) (LIST |x|)) 

(SDEFUN |EXPR;coerce;R$;231| ((|x| R) ($ $)) (SPADCALL |x| (QREFELT $ 591))) 

(SDEFUN |EXPR;retract;$R;232| ((|x| $) ($ R)) (|EXPR;retNotUnit| |x| $)) 

(SDEFUN |EXPR;retractIfCan;$U;233| ((|x| $) ($ |Union| R "failed"))
        (|EXPR;retNotUnitIfCan| |x| $)) 

(SDEFUN |EXPR;coerce;$Of;234| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 593))) 

(SDEFUN |EXPR;eval;$LL$;235|
        ((|x| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG NIL
               (SPADCALL |lk| |lv| |x|
                         (CONS #'|EXPR;eval;$LL$;235!1| (VECTOR |lk| |lv| $))
                         (QREFELT $ 599)))) 

(SDEFUN |EXPR;eval;$LL$;235!1| ((|x1| NIL) ($$ NIL))
        (PROG ($ |lv| |lk|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;eval;$LL$;235|))
          (LETT |lv| (QREFELT $$ 1) . #1#)
          (LETT |lk| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL
                    (CONS #'|EXPR;eval;$LL$;235!0| (VECTOR $ |lv| |lk|)) |x1|
                    (QREFELT $ 596))))))) 

(SDEFUN |EXPR;eval;$LL$;235!0| ((|x2| NIL) ($$ NIL))
        (PROG (|lk| |lv| $)
          (LETT |lk| (QREFELT $$ 2) NIL)
          (LETT |lv| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x2| |lk| |lv| (QREFELT $ 595)))))) 

(SDEFUN |EXPR;subst;$LL$;236|
        ((|x| $) (|lk| |List| (|Kernel| $)) (|lv| |List| $) ($ $))
        (SPROG NIL
               (SEQ
                (SPADCALL |lk| |lv| |x|
                          (CONS #'|EXPR;subst;$LL$;236!0| (VECTOR |lv| |lk| $))
                          (QREFELT $ 599))))) 

(SDEFUN |EXPR;subst;$LL$;236!0| ((|x1| NIL) ($$ NIL))
        (PROG ($ |lk| |lv|)
          (LETT $ (QREFELT $$ 2) . #1=(|EXPR;subst;$LL$;236|))
          (LETT |lk| (QREFELT $$ 1) . #1#)
          (LETT |lv| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G1369 NIL) (|a| NIL) (#3=#:G1368 NIL))
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
                                                       (QREFELT $ 600))
                                             #3#)
                                            NIL)))
                                    (LETT #2# (CDR #2#) NIL) (GO G190) G191
                                    (EXIT (NREVERSE #3#))))
                              (QREFELT $ 601)))))))) 

(SDEFUN |EXPR;convert;$If;237| ((|x| $) ($ |InputForm|))
        (SPADCALL |x| (QREFELT $ 539))) 

(DECLAIM (NOTINLINE |Expression;|)) 

(DEFUN |Expression| (#1=#:G1417)
  (SPROG NIL
         (PROG (#2=#:G1418)
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
   ((#1=#:G1416 NIL) (|pv$| NIL) (#2=#:G1410 NIL) (#3=#:G1411 NIL)
    (#4=#:G1412 NIL) (#5=#:G1413 NIL) (#6=#:G1414 NIL) (#7=#:G1415 NIL) ($ NIL)
    (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #8=(|Expression|))
    (LETT |dv$| (LIST '|Expression| DV$1) . #8#)
    (LETT $ (GETREFV 643) . #8#)
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
                                        (LETT #7#
                                              (|HasCategory| |#1| '(|Ring|))
                                              . #8#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #7#)
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
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#1|
                                                              '(|IntegralDomain|)))
                                              . #8#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #6#)
                                        (OR (|HasCategory| |#1| '(|Group|))
                                            #7#)
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
                                         #7#)
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              . #8#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         #5#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #7#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Integer|)))
                                         #7#)
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
                                         #7#)
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|))
                                              . #8#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #4#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|AbelianSemiGroup|))
                                              . #8#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         #5# #3#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #7#)
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|SemiGroup|))
                                              . #8#)
                                        (OR (|HasCategory| |#1| '(|Group|))
                                            #2#)
                                        (OR #3# #2#)))
                    . #8#))
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
           . #8#)
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
          (QSETREFV $ 225 (CONS (|dispatchFunction| |EXPR;Gamma;2$;72|) $))
          (QSETREFV $ 227 (CONS (|dispatchFunction| |EXPR;Gamma;3$;73|) $))
          (QSETREFV $ 229 (CONS (|dispatchFunction| |EXPR;Beta;3$;74|) $))
          (QSETREFV $ 231 (CONS (|dispatchFunction| |EXPR;digamma;2$;75|) $))
          (QSETREFV $ 233 (CONS (|dispatchFunction| |EXPR;polygamma;3$;76|) $))
          (QSETREFV $ 235 (CONS (|dispatchFunction| |EXPR;besselJ;3$;77|) $))
          (QSETREFV $ 237 (CONS (|dispatchFunction| |EXPR;besselY;3$;78|) $))
          (QSETREFV $ 239 (CONS (|dispatchFunction| |EXPR;besselI;3$;79|) $))
          (QSETREFV $ 241 (CONS (|dispatchFunction| |EXPR;besselK;3$;80|) $))
          (QSETREFV $ 243 (CONS (|dispatchFunction| |EXPR;airyAi;2$;81|) $))
          (QSETREFV $ 245
                    (CONS (|dispatchFunction| |EXPR;airyAiPrime;2$;82|) $))
          (QSETREFV $ 247 (CONS (|dispatchFunction| |EXPR;airyBi;2$;83|) $))
          (QSETREFV $ 249
                    (CONS (|dispatchFunction| |EXPR;airyBiPrime;2$;84|) $))
          (QSETREFV $ 251 (CONS (|dispatchFunction| |EXPR;lambertW;2$;85|) $))
          (QSETREFV $ 253 (CONS (|dispatchFunction| |EXPR;polylog;3$;86|) $))
          (QSETREFV $ 255
                    (CONS (|dispatchFunction| |EXPR;weierstrassP;4$;87|) $))
          (QSETREFV $ 257
                    (CONS (|dispatchFunction| |EXPR;weierstrassPPrime;4$;88|)
                          $))
          (QSETREFV $ 259
                    (CONS (|dispatchFunction| |EXPR;weierstrassSigma;4$;89|)
                          $))
          (QSETREFV $ 261
                    (CONS (|dispatchFunction| |EXPR;weierstrassZeta;4$;90|) $))
          (QSETREFV $ 263
                    (CONS (|dispatchFunction| |EXPR;weierstrassPInverse;4$;91|)
                          $))
          (QSETREFV $ 265
                    (CONS (|dispatchFunction| |EXPR;whittakerM;4$;92|) $))
          (QSETREFV $ 267
                    (CONS (|dispatchFunction| |EXPR;whittakerW;4$;93|) $))
          (QSETREFV $ 269 (CONS (|dispatchFunction| |EXPR;angerJ;3$;94|) $))
          (QSETREFV $ 271 (CONS (|dispatchFunction| |EXPR;weberE;3$;95|) $))
          (QSETREFV $ 273 (CONS (|dispatchFunction| |EXPR;struveH;3$;96|) $))
          (QSETREFV $ 275 (CONS (|dispatchFunction| |EXPR;struveL;3$;97|) $))
          (QSETREFV $ 277 (CONS (|dispatchFunction| |EXPR;hankelH1;3$;98|) $))
          (QSETREFV $ 279 (CONS (|dispatchFunction| |EXPR;hankelH2;3$;99|) $))
          (QSETREFV $ 281 (CONS (|dispatchFunction| |EXPR;lommelS1;4$;100|) $))
          (QSETREFV $ 283 (CONS (|dispatchFunction| |EXPR;lommelS2;4$;101|) $))
          (QSETREFV $ 285 (CONS (|dispatchFunction| |EXPR;kummerM;4$;102|) $))
          (QSETREFV $ 287 (CONS (|dispatchFunction| |EXPR;kummerU;4$;103|) $))
          (QSETREFV $ 289
                    (CONS (|dispatchFunction| |EXPR;legendreP;4$;104|) $))
          (QSETREFV $ 291
                    (CONS (|dispatchFunction| |EXPR;legendreQ;4$;105|) $))
          (QSETREFV $ 293
                    (CONS (|dispatchFunction| |EXPR;kelvinBei;3$;106|) $))
          (QSETREFV $ 295
                    (CONS (|dispatchFunction| |EXPR;kelvinBer;3$;107|) $))
          (QSETREFV $ 297
                    (CONS (|dispatchFunction| |EXPR;kelvinKei;3$;108|) $))
          (QSETREFV $ 299
                    (CONS (|dispatchFunction| |EXPR;kelvinKer;3$;109|) $))
          (QSETREFV $ 301
                    (CONS (|dispatchFunction| |EXPR;ellipticK;2$;110|) $))
          (QSETREFV $ 303
                    (CONS (|dispatchFunction| |EXPR;ellipticE;2$;111|) $))
          (QSETREFV $ 305
                    (CONS (|dispatchFunction| |EXPR;ellipticE;3$;112|) $))
          (QSETREFV $ 307
                    (CONS (|dispatchFunction| |EXPR;ellipticF;3$;113|) $))
          (QSETREFV $ 309
                    (CONS (|dispatchFunction| |EXPR;ellipticPi;4$;114|) $))
          (QSETREFV $ 311 (CONS (|dispatchFunction| |EXPR;jacobiSn;3$;115|) $))
          (QSETREFV $ 313 (CONS (|dispatchFunction| |EXPR;jacobiCn;3$;116|) $))
          (QSETREFV $ 315 (CONS (|dispatchFunction| |EXPR;jacobiDn;3$;117|) $))
          (QSETREFV $ 317
                    (CONS (|dispatchFunction| |EXPR;jacobiZeta;3$;118|) $))
          (QSETREFV $ 319
                    (CONS (|dispatchFunction| |EXPR;jacobiTheta;3$;119|) $))
          (QSETREFV $ 321 (CONS (|dispatchFunction| |EXPR;lerchPhi;4$;120|) $))
          (QSETREFV $ 323
                    (CONS (|dispatchFunction| |EXPR;riemannZeta;2$;121|) $))
          (QSETREFV $ 325
                    (CONS (|dispatchFunction| |EXPR;charlierC;4$;122|) $))
          (QSETREFV $ 327 (CONS (|dispatchFunction| |EXPR;hermiteH;3$;123|) $))
          (QSETREFV $ 329 (CONS (|dispatchFunction| |EXPR;jacobiP;5$;124|) $))
          (QSETREFV $ 331
                    (CONS (|dispatchFunction| |EXPR;laguerreL;4$;125|) $))
          (QSETREFV $ 333 (CONS (|dispatchFunction| |EXPR;meixnerM;5$;126|) $))
          (COND
           ((|testBitVector| |pv$| 32)
            (PROGN
             (QSETREFV $ 336
                       (CONS
                        (|dispatchFunction| |EXPR;hypergeometricF;2L2$;127|)
                        (|getDomainView| $ '(|RetractableTo| (|Integer|)))))
             (QSETREFV $ 338
                       (CONS (|dispatchFunction| |EXPR;meijerG;4L2$;128|)
                             (|getDomainView| $
                                              '(|RetractableTo|
                                                (|Integer|))))))))
          (QSETREFV $ 84 (CONS (|dispatchFunction| |EXPR;^;3$;129|) $))
          (QSETREFV $ 342
                    (CONS (|dispatchFunction| |EXPR;factorial;2$;130|) $))
          (QSETREFV $ 344 (CONS (|dispatchFunction| |EXPR;binomial;3$;131|) $))
          (QSETREFV $ 346
                    (CONS (|dispatchFunction| |EXPR;permutation;3$;132|) $))
          (QSETREFV $ 348
                    (CONS (|dispatchFunction| |EXPR;factorials;2$;133|) $))
          (QSETREFV $ 350
                    (CONS (|dispatchFunction| |EXPR;factorials;$S$;134|) $))
          (QSETREFV $ 352
                    (CONS (|dispatchFunction| |EXPR;summation;$S$;135|) $))
          (QSETREFV $ 356
                    (CONS (|dispatchFunction| |EXPR;summation;$Sb$;136|) $))
          (QSETREFV $ 358 (CONS (|dispatchFunction| |EXPR;product;$S$;137|) $))
          (QSETREFV $ 360
                    (CONS (|dispatchFunction| |EXPR;product;$Sb$;138|) $))
          (QSETREFV $ 363 (CONS (|dispatchFunction| |EXPR;erf;2$;139|) $))
          (QSETREFV $ 365 (CONS (|dispatchFunction| |EXPR;erfi;2$;140|) $))
          (QSETREFV $ 367 (CONS (|dispatchFunction| |EXPR;Ei;2$;141|) $))
          (QSETREFV $ 369 (CONS (|dispatchFunction| |EXPR;Si;2$;142|) $))
          (QSETREFV $ 371 (CONS (|dispatchFunction| |EXPR;Ci;2$;143|) $))
          (QSETREFV $ 373 (CONS (|dispatchFunction| |EXPR;Shi;2$;144|) $))
          (QSETREFV $ 375 (CONS (|dispatchFunction| |EXPR;Chi;2$;145|) $))
          (QSETREFV $ 377 (CONS (|dispatchFunction| |EXPR;li;2$;146|) $))
          (QSETREFV $ 379 (CONS (|dispatchFunction| |EXPR;dilog;2$;147|) $))
          (QSETREFV $ 381 (CONS (|dispatchFunction| |EXPR;fresnelS;2$;148|) $))
          (QSETREFV $ 383 (CONS (|dispatchFunction| |EXPR;fresnelC;2$;149|) $))
          (QSETREFV $ 385
                    (CONS (|dispatchFunction| |EXPR;integral;$S$;150|) $))
          (QSETREFV $ 387
                    (CONS (|dispatchFunction| |EXPR;integral;$Sb$;151|) $))
          (QSETREFV $ 37 (CONS (|dispatchFunction| |EXPR;operator;2Bo;152|) $))
          (COND
           ((|HasCategory| |#1| '(|GcdDomain|))
            (PROGN
             (COND
              ((|domainEqual| |#1| (|Integer|))
               (PROGN
                (QSETREFV $ 438
                          (|Record| (|:| |svz| (|List| (|Symbol|)))
                                    (|:| |sm|
                                         (|List| (|Polynomial| (|Integer|))))
                                    (|:| |msizes| (|List| (|Integer|)))
                                    (|:| |sp| (|Integer|))))
                (QSETREFV $ 439 (|ModularAlgebraicGcdTools3|))
                (QSETREFV $ 440
                          (|ModularAlgebraicGcd|
                           (|SparseUnivariatePolynomial|
                            (|Polynomial| (|Integer|)))
                           (QREFELT $ 438) (QREFELT $ 439)))
                (QSETREFV $ 449 (|ModularEvaluation2|))
                (QSETREFV $ 450 (|ModularAlgebraicGcdTools4|))
                (QSETREFV $ 451
                          (|ModularAlgebraicGcd2|
                           (|Record| (|:| |var| (|Symbol|))
                                     (|:| |coef|
                                          (|SparseUnivariatePolynomial|
                                           (|Fraction|
                                            (|Polynomial| (|Integer|))))))
                           (|FakePolynomial|)
                           (|SparseUnivariatePolynomial|
                            (|Polynomial| (|Integer|)))
                           (QREFELT $ 438) (QREFELT $ 449) (QREFELT $ 450)))
                (QSETREFV $ 476
                          (CONS
                           (|dispatchFunction| |EXPR;gcdPolynomial;3Sup;171|)
                           $))))
              ('T
               (QSETREFV $ 476
                         (CONS
                          (|dispatchFunction| |EXPR;gcdPolynomial;3Sup;172|)
                          $))))
             (COND
              ((|testBitVector| |pv$| 25)
               (QSETREFV $ 483
                         (CONS
                          (|dispatchFunction| |EXPR;factorPolynomial;SupF;173|)
                          $)))))))
          (COND
           ((|domainEqual| |#1| (|AlgebraicNumber|))
            (QSETREFV $ 488
                      (CONS (|dispatchFunction| |EXPR;coerce;An$;174|) $))))
          (COND
           ((|testBitVector| |pv$| 14)
            (PROGN
             (QSETREFV $ 491 (CONS (|dispatchFunction| |EXPR;^;$F$;175|) $))
             (QSETREFV $ 134
                       (CONS (|dispatchFunction| |EXPR;minPoly;KSup;176|) $))
             (QSETREFV $ 494
                       (CONS
                        (|dispatchFunction| |EXPR;definingPolynomial;2$;177|)
                        $))
             (QSETREFV $ 496
                       (CONS (|dispatchFunction| |EXPR;retract;$F;178|) $))
             (QSETREFV $ 72
                       (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;179|)
                             $))
             (COND ((|domainEqual| |#1| (|AlgebraicNumber|)))
                   ('T
                    (PROGN
                     (QSETREFV $ 488
                               (CONS (|dispatchFunction| |EXPR;coerce;An$;180|)
                                     $))
                     (QSETREFV $ 512
                               (CONS
                                (|dispatchFunction| |EXPR;retractIfCan;$U;183|)
                                $))))))))
          (COND
           ((|testBitVector| |pv$| 9)
            (PROGN
             (QSETREFV $ 540
                       (CONS (|dispatchFunction| |EXPR;convert;$If;187|) $))
             (QSETREFV $ 543
                       (CONS (|dispatchFunction| |EXPR;eval;$Bo$S$;188|) $))
             (QSETREFV $ 542
                       (CONS (|dispatchFunction| |EXPR;eval;$LLS$;189|) $)))))
          (COND
           ((|testBitVector| |pv$| 13)
            (QSETREFV $ 565
                      (CONS (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;190|)
                            $))))
          (COND
           ((|testBitVector| |pv$| 12)
            (QSETREFV $ 571
                      (CONS (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;191|)
                            $))))))
        ('T
         (PROGN
          (SETELT $ 45 (|SparseMultivariatePolynomial| |#1| (|Kernel| $)))
          (QSETREFV $ 47
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |EXPR;Zero;$;192|) $ 47)))
          (QSETREFV $ 49
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |EXPR;One;$;193|) $ 49)))
          (QSETREFV $ 56 (CONS (|dispatchFunction| |EXPR;-;2$;194|) $))
          (QSETREFV $ 59 (CONS (|dispatchFunction| |EXPR;*;I2$;195|) $))
          (QSETREFV $ 63 (CONS (|dispatchFunction| |EXPR;*;3$;196|) $))
          (QSETREFV $ 65 (CONS (|dispatchFunction| |EXPR;+;3$;197|) $))
          (QSETREFV $ 97 (CONS (|dispatchFunction| |EXPR;=;2$B;198|) $))
          (QSETREFV $ 96 (CONS (|dispatchFunction| |EXPR;smaller?;2$B;199|) $))
          (QSETREFV $ 100 (CONS (|dispatchFunction| |EXPR;numer;$Smp;200|) $))
          (QSETREFV $ 105 (CONS (|dispatchFunction| |EXPR;coerce;Smp$;201|) $))
          (QSETREFV $ 107 (CONS (|dispatchFunction| |EXPR;coerce;P$;202|) $))
          (QSETREFV $ 150
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MM;203|) $))
          (QSETREFV $ 158
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MVR;204|) $))
          (COND
           ((|testBitVector| |pv$| 9)
            (QSETREFV $ 540
                      (CONS (|dispatchFunction| |EXPR;convert;$If;205|) $))))
          (COND
           ((|testBitVector| |pv$| 13)
            (PROGN
             (QSETREFV $ 565
                       (CONS
                        (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;207|)
                        $)))))
          (COND
           ((|testBitVector| |pv$| 12)
            (PROGN
             (QSETREFV $ 571
                       (CONS
                        (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;209|)
                        $))))))))))
     ((|HasCategory| |#1| '(|AbelianMonoid|))
      (PROGN
       (SETELT $ 45 (|FreeModule| (|Integer|) (|Kernel| $)))
       (QSETREFV $ 47
                 (CONS #'|makeSpadConstant|
                       (LIST (|dispatchFunction| |EXPR;Zero;$;210|) $ 47)))
       (QSETREFV $ 65 (CONS (|dispatchFunction| |EXPR;+;3$;211|) $))
       (QSETREFV $ 97 (CONS (|dispatchFunction| |EXPR;=;2$B;212|) $))
       (QSETREFV $ 96 (CONS (|dispatchFunction| |EXPR;smaller?;2$B;213|) $))
       (QSETREFV $ 138 (CONS (|dispatchFunction| |EXPR;coerce;K$;214|) $))
       (QSETREFV $ 75 (CONS (|dispatchFunction| |EXPR;kernels;$L;215|) $))
       (QSETREFV $ 513 (CONS (|dispatchFunction| |EXPR;coerce;R$;216|) $))
       (QSETREFV $ 423 (CONS (|dispatchFunction| |EXPR;retract;$R;217|) $))
       (QSETREFV $ 594 (CONS (|dispatchFunction| |EXPR;coerce;$Of;218|) $))
       (QSETREFV $ 604 (CONS (|dispatchFunction| |EXPR;isPlus;$U;221|) $))
       (QSETREFV $ 608 (CONS (|dispatchFunction| |EXPR;isMult;$U;222|) $))
       (QSETREFV $ 595 (CONS (|dispatchFunction| |EXPR;eval;$LL$;223|) $))
       (QSETREFV $ 600 (CONS (|dispatchFunction| |EXPR;subst;$LL$;224|) $))
       (QSETREFV $ 609
                 (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;225|) $))
       (COND
        ((|testBitVector| |pv$| 19)
         (QSETREFV $ 56 (CONS (|dispatchFunction| |EXPR;-;2$;226|) $))))))
     ('T
      (PROGN
       (SETELT $ 45 (|Kernel| $))
       (QSETREFV $ 96 (CONS (|dispatchFunction| |EXPR;smaller?;2$B;227|) $))
       (QSETREFV $ 97 (CONS (|dispatchFunction| |EXPR;=;2$B;228|) $))
       (QSETREFV $ 138 (CONS (|dispatchFunction| |EXPR;coerce;K$;229|) $))
       (QSETREFV $ 75 (CONS (|dispatchFunction| |EXPR;kernels;$L;230|) $))
       (QSETREFV $ 513 (CONS (|dispatchFunction| |EXPR;coerce;R$;231|) $))
       (QSETREFV $ 423 (CONS (|dispatchFunction| |EXPR;retract;$R;232|) $))
       (QSETREFV $ 609
                 (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;233|) $))
       (QSETREFV $ 594 (CONS (|dispatchFunction| |EXPR;coerce;$Of;234|) $))
       (QSETREFV $ 595 (CONS (|dispatchFunction| |EXPR;eval;$LL$;235|) $))
       (QSETREFV $ 600 (CONS (|dispatchFunction| |EXPR;subst;$LL$;236|) $))
       (COND
        ((|testBitVector| |pv$| 9)
         (QSETREFV $ 540
                   (CONS (|dispatchFunction| |EXPR;convert;$If;237|) $)))))))
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
              (|Union| 489 '#1#) (220 . |retractIfCan|) (225 . |number?|)
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
              (|PolynomialCategoryQuotientFunctions| 484 15 6 41 $$)
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
              (885 . |Gamma|) (890 . |Gamma|) (895 . |Gamma|) (901 . |Gamma|)
              (907 . |Beta|) (913 . |Beta|) (919 . |digamma|) (924 . |digamma|)
              (929 . |polygamma|) (935 . |polygamma|) (941 . |besselJ|)
              (947 . |besselJ|) (953 . |besselY|) (959 . |besselY|)
              (965 . |besselI|) (971 . |besselI|) (977 . |besselK|)
              (983 . |besselK|) (989 . |airyAi|) (994 . |airyAi|)
              (999 . |airyAiPrime|) (1004 . |airyAiPrime|) (1009 . |airyBi|)
              (1014 . |airyBi|) (1019 . |airyBiPrime|) (1024 . |airyBiPrime|)
              (1029 . |lambertW|) (1034 . |lambertW|) (1039 . |polylog|)
              (1045 . |polylog|) (1051 . |weierstrassP|)
              (1058 . |weierstrassP|) (1065 . |weierstrassPPrime|)
              (1072 . |weierstrassPPrime|) (1079 . |weierstrassSigma|)
              (1086 . |weierstrassSigma|) (1093 . |weierstrassZeta|)
              (1100 . |weierstrassZeta|) (1107 . |weierstrassPInverse|)
              (1114 . |weierstrassPInverse|) (1121 . |whittakerM|)
              (1128 . |whittakerM|) (1135 . |whittakerW|) (1142 . |whittakerW|)
              (1149 . |angerJ|) (1155 . |angerJ|) (1161 . |weberE|)
              (1167 . |weberE|) (1173 . |struveH|) (1179 . |struveH|)
              (1185 . |struveL|) (1191 . |struveL|) (1197 . |hankelH1|)
              (1203 . |hankelH1|) (1209 . |hankelH2|) (1215 . |hankelH2|)
              (1221 . |lommelS1|) (1228 . |lommelS1|) (1235 . |lommelS2|)
              (1242 . |lommelS2|) (1249 . |kummerM|) (1256 . |kummerM|)
              (1263 . |kummerU|) (1270 . |kummerU|) (1277 . |legendreP|)
              (1284 . |legendreP|) (1291 . |legendreQ|) (1298 . |legendreQ|)
              (1305 . |kelvinBei|) (1311 . |kelvinBei|) (1317 . |kelvinBer|)
              (1323 . |kelvinBer|) (1329 . |kelvinKei|) (1335 . |kelvinKei|)
              (1341 . |kelvinKer|) (1347 . |kelvinKer|) (1353 . |ellipticK|)
              (1358 . |ellipticK|) (1363 . |ellipticE|) (1368 . |ellipticE|)
              (1373 . |ellipticE|) (1379 . |ellipticE|) (1385 . |ellipticF|)
              (1391 . |ellipticF|) (1397 . |ellipticPi|) (1404 . |ellipticPi|)
              (1411 . |jacobiSn|) (1417 . |jacobiSn|) (1423 . |jacobiCn|)
              (1429 . |jacobiCn|) (1435 . |jacobiDn|) (1441 . |jacobiDn|)
              (1447 . |jacobiZeta|) (1453 . |jacobiZeta|)
              (1459 . |jacobiTheta|) (1465 . |jacobiTheta|) (1471 . |lerchPhi|)
              (1478 . |lerchPhi|) (1485 . |riemannZeta|) (1490 . |riemannZeta|)
              (1495 . |charlierC|) (1502 . |charlierC|) (1509 . |hermiteH|)
              (1515 . |hermiteH|) (1521 . |jacobiP|) (1529 . |jacobiP|)
              (1537 . |laguerreL|) (1544 . |laguerreL|) (1551 . |meixnerM|)
              (1559 . |meixnerM|) (1567 . |hypergeometricF|) (|List| $)
              (1574 . |hypergeometricF|) (1581 . |meijerG|) (1590 . |meijerG|)
              (|CombinatorialFunction| 6 $$) (1599 . ^) (1605 . |factorial|)
              (1610 . |factorial|) (1615 . |binomial|) (1621 . |binomial|)
              (1627 . |permutation|) (1633 . |permutation|)
              (1639 . |factorials|) (1644 . |factorials|) (1649 . |factorials|)
              (1655 . |factorials|) (1661 . |summation|) (1667 . |summation|)
              (|SegmentBinding| $$) (1673 . |summation|) (|SegmentBinding| $)
              (1679 . |summation|) (1685 . |product|) (1691 . |product|)
              (1697 . |product|) (1703 . |product|)
              (|LiouvillianFunction| 6 $$) (1709 . |erf|) (1714 . |erf|)
              (1719 . |erfi|) (1724 . |erfi|) (1729 . |Ei|) (1734 . |Ei|)
              (1739 . |Si|) (1744 . |Si|) (1749 . |Ci|) (1754 . |Ci|)
              (1759 . |Shi|) (1764 . |Shi|) (1769 . |Chi|) (1774 . |Chi|)
              (1779 . |li|) (1784 . |li|) (1789 . |dilog|) (1794 . |dilog|)
              (1799 . |fresnelS|) (1804 . |fresnelS|) (1809 . |fresnelC|)
              (1814 . |fresnelC|) (1819 . |integral|) (1825 . |integral|)
              (1831 . |integral|) (1837 . |integral|) (1843 . |belong?|)
              (1848 . |operator|) (1853 . |belong?|) (1858 . |operator|)
              (1863 . |belong?|) (1868 . |operator|) (1873 . |belong?|)
              (1878 . |operator|) (1883 . |belong?|) (1888 . |operator|)
              (|Fraction| 41) (1893 . |coerce|) (|Fraction| 403)
              (|PolynomialCategoryQuotientFunctions| 484 15 6 41 398)
              (1898 . |univariate|) (|SparseUnivariatePolynomial| 398)
              (1904 . |numer|) (1909 . |degree|) (1915 . |degree|)
              (1920 . |rem|) (1926 . |coerce|) (1931 . |elt|) (1937 . |Zero|)
              (1941 . ~=) (1947 . |leadingCoefficient|) (1952 . |reductum|)
              (1957 . |concat|) (1963 . |removeDuplicates|) (1968 . =)
              (1974 . |coefficients|) (|Mapping| 9 $$) (1979 . |every?|)
              (|Mapping| 41 $$)
              (|UnivariatePolynomialCategoryFunctions2| $$ 135 41 122)
              (1985 . |map|) (1991 . |retract|) (1996 . |monomial|)
              (2002 . |coerce|) (2007 . -) (2013 . =) (|Polynomial| 57)
              (2019 . |One|) (2023 . |One|) (2027 . |monomial|)
              (2034 . |coerce|) (|Mapping| 428 15) (|Mapping| 428 57)
              (|PolynomialCategoryLifting| 484 15 57 41 428) (2039 . |map|)
              (2046 . |multivariate|) 'MD 'MOP1 'MGCD1 (2052 . |coerce|)
              (|Mapping| 41 27) (|Mapping| 41 57)
              (|PolynomialCategoryLifting| (|IndexedExponents| 27) 27 57 428
                                           41)
              (2057 . |map|) (|Mapping| $$ 41)
              (|UnivariatePolynomialCategoryFunctions2| 41 122 $$ 135)
              (2064 . |map|) 'MEV2 'MOP2 'MGCD2 (|Fraction| 428) (2070 . /)
              (2076 . |coerce|) (|SparseUnivariatePolynomial| 452)
              (2081 . |coerce|) (|Mapping| 452 $$)
              (|UnivariatePolynomialCategoryFunctions2| $$ 135 452 455)
              (2086 . |map|) (2092 . =) (2098 . |One|) (2102 . |gcdPolynomial|)
              (2108 . |concat|) (2114 . |algtower|) (2119 . |kernels|)
              (2124 . |setUnion|) (2130 . |sort|) (2135 . |new|)
              (2139 . |cons|) (2145 . |setDifference|) (|List| 428)
              (2151 . |algebraicGcd|)
              (|Record| (|:| |var| 27) (|:| |coef| 455)) (|List| 473)
              (2161 . |algebraicGcd|) (2171 . |gcdPolynomial|)
              (|GcdDomain&| $$) (2177 . |gcdPolynomial|) (|Factored| 135)
              (|ExpressionFactorPolynomial| 6 $$) (2183 . |factorPolynomial|)
              (|Factored| 120) (2188 . |factorPolynomial|)
              (|IndexedExponents| 15) (2193 . |Zero|) (2197 . |monomial|)
              (|AlgebraicNumber|) (2203 . |coerce|) (|Fraction| 57) (2208 . ^)
              (2214 . ^) (2220 . |minPoly|) (2225 . |definingPolynomial|)
              (2230 . |definingPolynomial|) (2235 . |retract|)
              (2240 . |retract|) (2245 . |retractIfCan|)
              (|SparseMultivariatePolynomial| 57 12) (2250 . |numer|)
              (2255 . |denom|) (|Mapping| $$ 487) (|Kernel| 487)
              (|ExpressionSpaceFunctions2| 487 $$) (2260 . |map|)
              (|Mapping| $$ 502) (|Mapping| $$ 57)
              (|SparseMultivariatePolynomial| 57 502)
              (|PolynomialCategoryLifting| (|IndexedExponents| 502) 502 57 507
                                           $$)
              (2266 . |map|) (2273 . /) (|Union| 487 '"failed")
              (2279 . |retractIfCan|) (2284 . |coerce|) (2289 . |coerce|)
              (2294 . |belong?|) (2299 . |is?|) (|Union| 27 '#1#)
              (2305 . |retractIfCan|) (2310 . ~=)
              (|SparseUnivariatePolynomial| 487) (2316 . |Zero|)
              (2320 . |Zero|) (2324 . ~=) (2330 . |degree|) (2335 . |monomial|)
              (2341 . +) (2347 . |rootOf|) (2353 . |operator|) (2358 . |elt|)
              (|Union| 15 '"failed") (2364 . |mainVariable|)
              (2369 . |leadingCoefficient|) (2374 . |Zero|) (2378 . |ground?|)
              (2383 . ^) (2389 . *) (2395 . +) (|InputForm|) (2401 . |convert|)
              (2406 . |convert|) (|List| 10) (2411 . |eval|) (2419 . |eval|)
              (2427 . |variables|) (2432 . |concat|)
              (2437 . |removeDuplicates|) (2442 . |scripted?|) (|Mapping| 9 27)
              (2447 . |select|) (|MakeUnaryCompiledFunction| $$ $$ $$)
              (2453 . |compiledFunction|) (|Mapping| $ $) (|List| 552)
              (2459 . |eval|) (2466 . |coerce|) (|Equation| $$) (2471 . =)
              (|List| 639) (2477 . |subst|) (|PatternMatchResult| 57 $$)
              (|Pattern| 57) (|PatternMatchFunctionSpace| 57 6 $$)
              (2483 . |patternMatch|) (|PatternMatchResult| 57 $)
              (2490 . |patternMatch|) (|PatternMatchResult| (|Float|) $$)
              (|Pattern| (|Float|))
              (|PatternMatchFunctionSpace| (|Float|) 6 $$)
              (2497 . |patternMatch|) (|PatternMatchResult| (|Float|) $)
              (2504 . |patternMatch|) (2511 . |reducedSystem|)
              (2516 . |reducedSystem|) (|PatternMatchKernel| 57 $$)
              (2522 . |patternMatch|) (|PatternMatchResult| 57 45)
              (|Mapping| 576 15 561 576)
              (|PatternMatchPolynomialCategory| 57 484 15 6 45)
              (2529 . |patternMatch|) (|PatternMatchKernel| (|Float|) $$)
              (2537 . |patternMatch|) (|PatternMatchResult| (|Float|) 45)
              (|Mapping| 582 15 567 582)
              (|PatternMatchPolynomialCategory| (|Float|) 484 15 6 45)
              (2544 . |patternMatch|) (2552 . |coerce|)
              (|Record| (|:| |k| 15) (|:| |c| 57)) (|List| 587)
              (2557 . |listOfTerms|) (2562 . |zero?|) (2567 . |constantKernel|)
              (|OutputForm|) (2572 . |coerce|) (2577 . |coerce|)
              (2582 . |eval|) (2589 . |map|) (|Mapping| $$ 15)
              (|ListToMap| 15 $$) (2595 . |match|) (2603 . |subst|)
              (2610 . |kernel|) (2616 . *) (|Union| 335 '#2="failed")
              (2622 . |isPlus|) (2627 . |first|)
              (|Record| (|:| |coef| 57) (|:| |var| 12)) (|Union| 606 '#2#)
              (2632 . |isMult|) (2637 . |retractIfCan|)
              (|Union| 154 '#3="failed") (|Union| 612 '#3#) (|List| 120)
              (|Matrix| 57)
              (|Record| (|:| |mat| 613) (|:| |vec| (|Vector| 57)))
              (|Union| $ '"failed") (|Factored| $) (|Fraction| 6)
              (|Fraction| 619) (|Polynomial| 617) (|Fraction| 120)
              (|Union| 108 '#1#) (|Polynomial| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |coef| 335) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 628 '"failed") (|Union| 57 '#1#)
              (|Record| (|:| |var| 12) (|:| |exponent| 57)) (|Union| 631 '#2#)
              (|Record| (|:| |val| $) (|:| |exponent| 57)) (|Union| 633 '#2#)
              (|List| 35) (|Mapping| $ 335) (|List| 636) (|Union| 106 '#1#)
              (|Equation| $) (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 2642 |zerosOf| 2648 |zeroOf| 2675 |zero?| 2702 |whittakerW|
              2707 |whittakerM| 2714 |weierstrassZeta| 2721 |weierstrassSigma|
              2728 |weierstrassPPrime| 2735 |weierstrassPInverse| 2742
              |weierstrassP| 2749 |weberE| 2756 |variables| 2762 |univariate|
              2772 |unitNormal| 2778 |unitCanonical| 2783 |unit?| 2788 |tower|
              2793 |tanh| 2803 |tan| 2808 |summation| 2813 |subtractIfCan| 2825
              |subst| 2831 |struveL| 2850 |struveH| 2856 |squareFreePolynomial|
              2862 |squareFreePart| 2867 |squareFree| 2872 |sqrt| 2877
              |solveLinearPolynomialEquation| 2882 |smaller?| 2888 |sizeLess?|
              2894 |sinh| 2900 |sin| 2905 |simplifyPower| 2910
              |setSimplifyDenomsFlag| 2916 |sech| 2921 |sec| 2926 |sample| 2931
              |rootsOf| 2935 |rootSum| 2962 |rootOf| 2969 |riemannZeta| 2996
              |retractIfCan| 3001 |retract| 3041 |rem| 3081 |reducedSystem|
              3087 |reduce| 3109 |recip| 3114 |quo| 3119 |product| 3125
              |principalIdeal| 3137 |prime?| 3142 |polylog| 3147 |polygamma|
              3153 |pi| 3159 |permutation| 3163 |patternMatch| 3169 |paren|
              3183 |opposite?| 3193 |operators| 3199 |operator| 3204 |one?|
              3209 |odd?| 3214 |numerator| 3219 |numer| 3224 |number?| 3229
              |nthRoot| 3234 |multiEuclidean| 3240 |minPoly| 3246 |meixnerM|
              3251 |meijerG| 3259 |map| 3268 |mainKernel| 3274 |lommelS2| 3279
              |lommelS1| 3286 |log| 3293 |li| 3298 |lerchPhi| 3303 |legendreQ|
              3310 |legendreP| 3317 |lcmCoef| 3324 |lcm| 3330 |latex| 3341
              |lambertW| 3346 |laguerreL| 3351 |kummerU| 3358 |kummerM| 3365
              |kernels| 3372 |kernel| 3382 |kelvinKer| 3394 |kelvinKei| 3400
              |kelvinBer| 3406 |kelvinBei| 3412 |jacobiZeta| 3418 |jacobiTheta|
              3424 |jacobiSn| 3430 |jacobiP| 3436 |jacobiDn| 3444 |jacobiCn|
              3450 |isTimes| 3456 |isPower| 3461 |isPlus| 3466 |isMult| 3471
              |isExpt| 3476 |is?| 3493 |inv| 3505 |integral| 3510
              |hypergeometricF| 3522 |hermiteH| 3529 |height| 3535
              |hashUpdate!| 3540 |hash| 3546 |hankelH2| 3551 |hankelH1| 3557
              |ground?| 3563 |ground| 3568 |getSimplifyDenomsFlag| 3573
              |gcdPolynomial| 3577 |gcd| 3583 |fresnelS| 3594 |fresnelC| 3599
              |freeOf?| 3604 |factorials| 3616 |factorial| 3627
              |factorSquareFreePolynomial| 3632 |factorPolynomial| 3637
              |factor| 3642 |extendedEuclidean| 3647 |exquo| 3660
              |expressIdealMember| 3666 |exp| 3672 |even?| 3677 |eval| 3682
              |euclideanSize| 3843 |erfi| 3848 |erf| 3853 |elt| 3858
              |ellipticPi| 3954 |ellipticK| 3961 |ellipticF| 3966 |ellipticE|
              3972 |divide| 3983 |distribute| 3989 |dilog| 4000 |digamma| 4005
              |differentiate| 4010 |denominator| 4036 |denom| 4041
              |definingPolynomial| 4046 |csch| 4051 |csc| 4056 |coth| 4061
              |cot| 4066 |cosh| 4071 |cos| 4076 |convert| 4081 |conjugate| 4101
              |conditionP| 4107 |commutator| 4112 |coerce| 4118 |charthRoot|
              4188 |charlierC| 4193 |characteristic| 4200 |box| 4204 |binomial|
              4214 |besselY| 4220 |besselK| 4226 |besselJ| 4232 |besselI| 4238
              |belong?| 4244 |atanh| 4249 |atan| 4254 |associates?| 4259
              |asinh| 4265 |asin| 4270 |asech| 4275 |asec| 4280 |applyQuote|
              4285 |annihilate?| 4321 |angerJ| 4327 |algtower| 4333
              |airyBiPrime| 4343 |airyBi| 4348 |airyAiPrime| 4353 |airyAi| 4358
              |acsch| 4363 |acsc| 4368 |acoth| 4373 |acot| 4378 |acosh| 4383
              |acos| 4388 |abs| 4393 ^ 4398 |Zero| 4428 |Si| 4432 |Shi| 4437
              |One| 4442 |Gamma| 4446 |Ei| 4457 D 4462 |Ci| 4488 |Chi| 4493
              |Beta| 4498 = 4504 / 4510 - 4522 + 4533 * 4539)
           'NIL
           (CONS
            (|makeByteWordVec2| 30
                                '(1 0 1 1 26 1 1 1 1 1 1 1 1 1 2 5 1 1 1 2 3 4
                                  5 7 1 5 1 1 2 18 1 1 1 6 2 2 18 20 8 5 20 0 0
                                  5 30 28 0 12 13 30 1 28 0 0 0 0 1 1 0 0 0 0 0
                                  0 0 0 16 1 1 1 1 1 5 9 10 11 14 15 17 1 1 1 1
                                  1 1 1 1 1))
            (CONS
             '#(|AlgebraicallyClosedFunctionSpace&| |FunctionSpace&|
                |AlgebraicallyClosedField&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |GcdDomain&| |DivisionRing&|
                NIL |Algebra&| NIL |Algebra&| |Algebra&|
                |FullyLinearlyExplicitOver&| |Module&| |EntireRing&| |Module&|
                |Module&| NIL NIL NIL NIL NIL |PartialDifferentialRing&| NIL
                NIL NIL |Ring&| NIL NIL NIL NIL NIL NIL |Rng&| |AbelianGroup&|
                |Group&| NIL NIL |ExpressionSpace&| NIL NIL |Monoid&|
                |AbelianMonoid&| NIL NIL NIL |SemiGroup&| NIL
                |AbelianSemiGroup&| |SetCategory&| |FullyRetractableTo&| NIL
                |Evalable&| |TranscendentalFunctionCategory&| NIL |BasicType&|
                |RetractableTo&| NIL |RetractableTo&| |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| NIL |RetractableTo&|
                |RetractableTo&| NIL NIL NIL NIL |RetractableTo&| NIL NIL NIL
                |RetractableTo&| |RetractableTo&| NIL NIL NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                NIL |RadicalCategory&|)
             (CONS
              '#((|AlgebraicallyClosedFunctionSpace| 6) (|FunctionSpace| 6)
                 (|AlgebraicallyClosedField|) (|Field|)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|GcdDomain|) (|DivisionRing|) (|IntegralDomain|)
                 (|Algebra| $$) (|LeftOreRing|) (|Algebra| 489) (|Algebra| 6)
                 (|FullyLinearlyExplicitOver| 6) (|Module| $$) (|EntireRing|)
                 (|Module| 489) (|Module| 6) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|LinearlyExplicitOver| 6)
                 (|LinearlyExplicitOver| 57) (|CommutativeRing|)
                 (|PartialDifferentialRing| 27) (|BiModule| $$ $$)
                 (|BiModule| 489 489) (|BiModule| 6 6) (|Ring|)
                 (|RightModule| $$) (|LeftModule| 489) (|RightModule| 489)
                 (|LeftModule| $$) (|LeftModule| 6) (|RightModule| 6) (|Rng|)
                 (|AbelianGroup|) (|Group|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|ExpressionSpace|)
                 (|FullyPatternMatchable| 6) (|SemiRng|) (|Monoid|)
                 (|AbelianMonoid|) (|Comparable|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 57)
                 (|SemiGroup|) (|LiouvillianFunctionCategory|)
                 (|AbelianSemiGroup|) (|SetCategory|) (|FullyRetractableTo| 6)
                 (|Patternable| 6) (|Evalable| $$)
                 (|TranscendentalFunctionCategory|)
                 (|CombinatorialOpsCategory|) (|BasicType|) (|RetractableTo| 6)
                 (|Type|) (|RetractableTo| 27) (|InnerEvalable| $$ $$)
                 (|InnerEvalable| 15 $$) (|RetractableTo| 15)
                 (|CoercibleTo| 592) (|RetractableTo| 489)
                 (|RetractableTo| (|Fraction| (|Polynomial| 6)))
                 (|CommutativeStar|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|RetractableTo| (|Polynomial| 6))
                 (|ConvertibleTo| 538) (|ConvertibleTo| 567)
                 (|ConvertibleTo| 561) (|RetractableTo| 57)
                 (|RetractableTo| 487) (|unitsKnown|)
                 (|SpecialFunctionCategory|) (|PrimitiveFunctionCategory|)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|)
                 (|CombinatorialFunctionCategory|) (|RadicalCategory|))
              (|makeByteWordVec2| 642
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
                                    222 1 0 0 0 223 1 221 2 2 224 1 0 0 0 225 2
                                    221 2 2 2 226 2 0 0 0 0 227 2 221 2 2 2 228
                                    2 0 0 0 0 229 1 221 2 2 230 1 0 0 0 231 2
                                    221 2 2 2 232 2 0 0 0 0 233 2 221 2 2 2 234
                                    2 0 0 0 0 235 2 221 2 2 2 236 2 0 0 0 0 237
                                    2 221 2 2 2 238 2 0 0 0 0 239 2 221 2 2 2
                                    240 2 0 0 0 0 241 1 221 2 2 242 1 0 0 0 243
                                    1 221 2 2 244 1 0 0 0 245 1 221 2 2 246 1 0
                                    0 0 247 1 221 2 2 248 1 0 0 0 249 1 221 2 2
                                    250 1 0 0 0 251 2 221 2 2 2 252 2 0 0 0 0
                                    253 3 221 2 2 2 2 254 3 0 0 0 0 0 255 3 221
                                    2 2 2 2 256 3 0 0 0 0 0 257 3 221 2 2 2 2
                                    258 3 0 0 0 0 0 259 3 221 2 2 2 2 260 3 0 0
                                    0 0 0 261 3 221 2 2 2 2 262 3 0 0 0 0 0 263
                                    3 221 2 2 2 2 264 3 0 0 0 0 0 265 3 221 2 2
                                    2 2 266 3 0 0 0 0 0 267 2 221 2 2 2 268 2 0
                                    0 0 0 269 2 221 2 2 2 270 2 0 0 0 0 271 2
                                    221 2 2 2 272 2 0 0 0 0 273 2 221 2 2 2 274
                                    2 0 0 0 0 275 2 221 2 2 2 276 2 0 0 0 0 277
                                    2 221 2 2 2 278 2 0 0 0 0 279 3 221 2 2 2 2
                                    280 3 0 0 0 0 0 281 3 221 2 2 2 2 282 3 0 0
                                    0 0 0 283 3 221 2 2 2 2 284 3 0 0 0 0 0 285
                                    3 221 2 2 2 2 286 3 0 0 0 0 0 287 3 221 2 2
                                    2 2 288 3 0 0 0 0 0 289 3 221 2 2 2 2 290 3
                                    0 0 0 0 0 291 2 221 2 2 2 292 2 0 0 0 0 293
                                    2 221 2 2 2 294 2 0 0 0 0 295 2 221 2 2 2
                                    296 2 0 0 0 0 297 2 221 2 2 2 298 2 0 0 0 0
                                    299 1 221 2 2 300 1 0 0 0 301 1 221 2 2 302
                                    1 0 0 0 303 2 221 2 2 2 304 2 0 0 0 0 305 2
                                    221 2 2 2 306 2 0 0 0 0 307 3 221 2 2 2 2
                                    308 3 0 0 0 0 0 309 2 221 2 2 2 310 2 0 0 0
                                    0 311 2 221 2 2 2 312 2 0 0 0 0 313 2 221 2
                                    2 2 314 2 0 0 0 0 315 2 221 2 2 2 316 2 0 0
                                    0 0 317 2 221 2 2 2 318 2 0 0 0 0 319 3 221
                                    2 2 2 2 320 3 0 0 0 0 0 321 1 221 2 2 322 1
                                    0 0 0 323 3 221 2 2 2 2 324 3 0 0 0 0 0 325
                                    2 221 2 2 2 326 2 0 0 0 0 327 4 221 2 2 2 2
                                    2 328 4 0 0 0 0 0 0 329 3 221 2 2 2 2 330 3
                                    0 0 0 0 0 331 4 221 2 2 2 2 2 332 4 0 0 0 0
                                    0 0 333 3 221 2 78 78 2 334 3 0 0 335 335 0
                                    336 5 221 2 78 78 78 78 2 337 5 0 0 335 335
                                    335 335 0 338 2 339 2 2 2 340 1 339 2 2 341
                                    1 0 0 0 342 2 339 2 2 2 343 2 0 0 0 0 344 2
                                    339 2 2 2 345 2 0 0 0 0 346 1 339 2 2 347 1
                                    0 0 0 348 2 339 2 2 27 349 2 0 0 0 27 350 2
                                    339 2 2 27 351 2 0 0 0 27 352 2 339 2 2 353
                                    354 2 0 0 0 355 356 2 339 2 2 27 357 2 0 0
                                    0 27 358 2 339 2 2 353 359 2 0 0 0 355 360
                                    1 361 2 2 362 1 0 0 0 363 1 361 2 2 364 1 0
                                    0 0 365 1 361 2 2 366 1 0 0 0 367 1 361 2 2
                                    368 1 0 0 0 369 1 361 2 2 370 1 0 0 0 371 1
                                    361 2 2 372 1 0 0 0 373 1 361 2 2 374 1 0 0
                                    0 375 1 361 2 2 376 1 0 0 0 377 1 361 2 2
                                    378 1 0 0 0 379 1 361 2 2 380 1 0 0 0 381 1
                                    361 2 2 382 1 0 0 0 383 2 361 2 2 27 384 2
                                    0 0 0 27 385 2 361 2 2 353 386 2 0 0 0 355
                                    387 1 161 9 10 388 1 161 10 10 389 1 166 9
                                    10 390 1 166 10 10 391 1 339 9 10 392 1 339
                                    10 10 393 1 361 9 10 394 1 361 10 10 395 1
                                    221 9 10 396 1 221 10 10 397 1 398 0 41 399
                                    2 401 400 398 15 402 1 400 403 0 404 2 41
                                    35 0 15 405 1 135 35 0 406 2 135 0 0 0 407
                                    1 41 0 15 408 2 403 398 0 398 409 0 135 0
                                    410 2 135 9 0 0 411 1 135 2 0 412 1 135 0 0
                                    413 2 42 0 0 0 414 1 42 0 0 415 2 41 9 0 0
                                    416 1 135 78 0 417 2 78 9 418 0 419 2 421
                                    122 420 135 422 1 0 6 0 423 2 122 0 41 35
                                    424 1 122 0 41 425 2 122 0 0 0 426 2 15 9 0
                                    0 427 0 428 0 429 0 35 0 430 3 428 0 0 27
                                    35 431 1 428 0 57 432 3 435 428 433 434 41
                                    436 2 41 0 120 15 437 1 41 0 57 441 3 444
                                    41 442 443 428 445 2 447 135 446 122 448 2
                                    452 0 428 428 453 1 452 0 428 454 1 455 0
                                    452 456 2 458 455 457 135 459 2 135 9 0 0
                                    460 0 135 0 461 2 45 120 120 120 462 2 78 0
                                    0 0 463 1 0 74 335 464 1 0 74 335 465 2 42
                                    0 0 0 466 1 42 0 0 467 0 27 0 468 2 42 0 15
                                    0 469 2 38 0 0 0 470 6 440 428 428 428 471
                                    38 27 38 472 6 451 428 473 473 474 38 27 38
                                    475 2 0 120 120 120 476 2 477 120 120 120
                                    478 1 480 479 135 481 1 0 482 120 483 0 484
                                    0 485 2 41 0 6 484 486 1 0 0 487 488 2 161
                                    2 2 489 490 2 0 0 0 489 491 1 161 135 15
                                    492 1 161 2 2 493 1 0 0 0 494 1 45 489 0
                                    495 1 0 489 0 496 1 45 71 0 497 1 487 498 0
                                    499 1 487 498 0 500 2 503 2 501 502 504 3
                                    508 2 505 506 507 509 2 487 0 0 0 510 1 0
                                    511 0 512 1 0 0 6 513 1 487 0 489 514 1 487
                                    9 10 515 2 10 9 0 27 516 1 0 517 0 518 2 41
                                    9 0 0 519 0 520 0 521 0 122 0 522 2 122 9 0
                                    0 523 1 122 35 0 524 2 520 0 487 35 525 2
                                    520 0 0 0 526 2 487 0 120 27 527 1 487 10
                                    10 528 2 487 0 10 335 529 1 41 530 0 531 1
                                    41 6 0 532 0 487 0 533 1 122 9 0 534 2 487
                                    0 0 35 535 2 487 0 0 0 536 2 487 0 0 0 537
                                    1 45 538 0 539 1 0 538 0 540 4 0 0 0 541
                                    335 27 542 4 0 0 0 10 0 27 543 1 0 38 0 544
                                    1 38 0 335 545 1 38 0 0 546 1 27 9 0 547 2
                                    38 0 548 0 549 2 550 142 2 27 551 3 0 0 0
                                    541 553 554 1 0 0 27 555 2 556 0 2 2 557 2
                                    0 0 0 558 559 3 562 560 2 561 560 563 3 0
                                    564 0 561 564 565 3 568 566 2 567 566 569 3
                                    0 570 0 567 570 571 1 45 148 146 572 2 45
                                    156 146 154 573 3 574 560 15 561 560 575 4
                                    578 576 45 561 576 577 579 3 580 566 15 567
                                    566 581 4 584 582 45 567 582 583 585 1 45 0
                                    15 586 1 45 588 0 589 1 6 9 0 590 1 16 15 6
                                    591 1 45 592 0 593 1 0 592 0 594 3 0 0 0 74
                                    335 595 2 0 0 552 12 596 4 598 2 42 78 15
                                    597 599 3 0 0 0 74 335 600 2 0 0 10 335 601
                                    2 45 0 57 15 602 1 0 603 0 604 1 588 587 0
                                    605 1 0 607 0 608 1 0 14 0 609 2 0 9 0 0
                                    118 2 1 335 0 27 1 1 1 335 0 1 2 1 335 120
                                    27 1 1 1 335 120 1 1 1 335 622 1 2 1 0 0 27
                                    1 1 1 0 0 1 2 1 0 120 27 1 1 1 0 622 1 1 1
                                    0 120 1 1 27 9 0 54 3 1 0 0 0 0 267 3 1 0 0
                                    0 0 265 3 1 0 0 0 0 261 3 1 0 0 0 0 259 3 1
                                    0 0 0 0 257 3 1 0 0 0 0 263 3 1 0 0 0 0 255
                                    2 1 0 0 0 271 1 0 38 335 1 1 0 38 0 544 2 1
                                    620 0 12 1 1 1 623 0 1 1 1 0 0 1 1 1 9 0 1
                                    1 0 74 335 1 1 0 74 0 1 1 1 0 0 202 1 1 0 0
                                    178 2 1 0 0 355 356 2 1 0 0 27 352 2 19 615
                                    0 0 1 2 0 0 0 558 559 3 0 0 0 74 335 600 2
                                    0 0 0 639 1 2 1 0 0 0 275 2 1 0 0 0 273 1
                                    26 482 120 1 1 1 0 0 1 1 1 616 0 1 1 1 0 0
                                    1 2 26 611 612 120 1 2 0 9 0 0 96 2 1 9 0 0
                                    1 1 1 0 0 198 1 1 0 0 174 2 1 0 0 57 87 1 1
                                    9 9 130 1 1 0 0 206 1 1 0 0 182 0 31 0 1 2
                                    1 335 0 27 1 1 1 335 0 1 2 1 335 120 27 1 1
                                    1 335 622 1 1 1 335 120 1 3 1 0 0 120 27
                                    165 2 1 0 0 27 1 1 1 0 0 1 2 1 0 120 27 163
                                    1 1 0 622 1 1 1 0 120 1 1 1 0 0 323 1 15
                                    511 0 512 1 16 71 0 72 1 1 621 0 1 1 14 630
                                    0 1 1 5 638 0 1 1 0 14 0 609 1 0 517 0 518
                                    1 0 18 0 19 1 15 487 0 1 1 16 489 0 496 1 1
                                    108 0 1 1 14 57 0 1 1 5 106 0 1 1 0 6 0 423
                                    1 0 27 0 1 1 0 12 0 13 2 1 0 0 0 1 1 24 613
                                    146 1 2 24 614 146 154 1 2 5 156 146 154
                                    158 1 5 148 146 150 1 1 0 0 112 1 29 615 0
                                    1 2 1 0 0 0 1 2 1 0 0 355 360 2 1 0 0 27
                                    358 1 1 625 335 1 1 1 9 0 1 2 1 0 0 0 253 2
                                    1 0 0 0 233 0 1 0 168 2 1 0 0 0 346 3 12
                                    570 0 567 570 571 3 13 564 0 561 564 565 1
                                    0 0 335 1 1 0 0 0 1 2 27 9 0 0 1 1 0 541 0
                                    1 1 0 10 10 37 1 29 9 0 52 1 32 9 0 1 1 5 0
                                    0 89 1 5 99 0 100 1 1 9 0 73 2 1 0 0 57 1 2
                                    1 603 335 0 1 1 33 120 12 134 4 1 0 0 0 0 0
                                    333 5 34 0 335 335 335 335 0 338 2 0 0 552
                                    12 596 1 0 18 0 1 3 1 0 0 0 0 283 3 1 0 0 0
                                    0 281 1 1 0 0 172 1 1 0 0 377 3 1 0 0 0 0
                                    321 3 1 0 0 0 0 291 3 1 0 0 0 0 289 2 1 624
                                    0 0 1 2 1 0 0 0 1 1 1 0 335 1 1 0 640 0 1 1
                                    1 0 0 251 3 1 0 0 0 0 331 3 1 0 0 0 0 287 3
                                    1 0 0 0 0 285 1 0 74 0 75 1 0 74 335 465 2
                                    0 0 10 335 601 2 0 0 10 0 1 2 1 0 0 0 299 2
                                    1 0 0 0 297 2 1 0 0 0 295 2 1 0 0 0 293 2 1
                                    0 0 0 317 2 1 0 0 0 319 2 1 0 0 0 311 4 1 0
                                    0 0 0 0 329 2 1 0 0 0 315 2 1 0 0 0 313 1
                                    29 603 0 1 1 5 634 0 1 1 27 603 0 604 1 27
                                    607 0 608 2 5 632 0 27 1 2 5 632 0 10 1 1
                                    29 632 0 1 2 0 9 0 27 76 2 0 9 0 10 1 1 23
                                    0 0 1 2 1 0 0 355 387 2 1 0 0 27 385 3 34 0
                                    335 335 0 336 2 1 0 0 0 327 1 0 35 0 1 2 0
                                    642 642 0 1 1 0 641 0 1 2 1 0 0 0 279 2 1 0
                                    0 0 277 1 0 9 0 70 1 0 6 0 1 0 1 9 129 2 1
                                    120 120 120 476 1 1 0 335 1 2 1 0 0 0 1 1 1
                                    0 0 381 1 1 0 0 383 2 0 9 0 27 1 2 0 9 0 0
                                    1 2 1 0 0 27 350 1 1 0 0 348 1 1 0 0 342 1
                                    26 482 120 1 1 26 482 120 483 1 1 616 0 1 2
                                    1 627 0 0 1 3 1 629 0 0 0 1 2 1 615 0 0 1 2
                                    1 603 335 0 1 1 1 0 0 170 1 32 9 0 1 2 9 0
                                    0 27 1 2 9 0 0 38 1 4 9 0 0 10 0 27 543 1 9
                                    0 0 1 4 9 0 0 541 335 27 542 4 5 0 0 38 635
                                    637 1 4 5 0 0 38 635 553 1 4 5 0 0 27 35
                                    552 1 4 5 0 0 27 35 636 1 3 0 0 0 10 552 1
                                    3 0 0 0 541 637 1 3 0 0 0 10 636 1 3 0 0 0
                                    541 553 554 3 0 0 0 27 636 1 3 0 0 0 27 552
                                    1 3 0 0 0 38 553 1 3 0 0 0 38 637 1 3 0 0 0
                                    0 0 1 3 0 0 0 335 335 1 2 0 0 0 639 1 3 0 0
                                    0 74 335 595 2 0 0 0 558 1 3 0 0 0 12 0 1 1
                                    1 35 0 1 1 1 0 0 365 1 1 0 0 363 10 0 0 10
                                    0 0 0 0 0 0 0 0 0 1 2 0 0 10 335 1 9 0 0 10
                                    0 0 0 0 0 0 0 0 1 7 0 0 10 0 0 0 0 0 0 1 8
                                    0 0 10 0 0 0 0 0 0 0 1 5 0 0 10 0 0 0 0 1 6
                                    0 0 10 0 0 0 0 0 1 4 0 0 10 0 0 0 1 2 0 0
                                    10 0 1 3 0 0 10 0 0 1 3 1 0 0 0 0 309 1 1 0
                                    0 301 2 1 0 0 0 307 1 1 0 0 303 2 1 0 0 0
                                    305 2 1 626 0 0 1 2 0 0 0 0 1 1 0 0 0 1 1 1
                                    0 0 379 1 1 0 0 231 3 5 0 0 38 635 1 3 5 0
                                    0 27 35 1 2 5 0 0 27 1 2 5 0 0 38 1 1 1 0 0
                                    90 1 1 99 0 102 1 33 0 0 494 1 1 0 0 208 1
                                    1 0 0 184 1 1 0 0 204 1 1 0 0 180 1 1 0 0
                                    200 1 1 0 0 176 1 9 538 0 540 1 10 567 0 1
                                    1 11 561 0 1 1 1 0 616 1 2 8 0 0 0 1 1 35
                                    610 146 1 2 8 0 0 0 1 1 15 0 487 488 1 22 0
                                    489 1 1 21 0 57 61 1 1 0 617 1 1 1 0 618 1
                                    1 1 0 619 1 1 1 0 108 111 1 1 0 0 1 1 5 0
                                    99 105 1 5 0 106 107 1 0 0 6 513 1 0 0 27
                                    555 1 0 0 12 138 1 0 592 0 594 1 36 615 0 1
                                    3 1 0 0 0 0 325 0 5 35 1 1 0 0 335 1 1 0 0
                                    0 1 2 1 0 0 0 344 2 1 0 0 0 237 2 1 0 0 0
                                    241 2 1 0 0 0 235 2 1 0 0 0 239 1 0 9 10 11
                                    1 1 0 0 214 1 1 0 0 190 2 1 9 0 0 1 1 1 0 0
                                    210 1 1 0 0 186 1 1 0 0 218 1 1 0 0 194 5 0
                                    0 27 0 0 0 0 1 2 0 0 27 335 1 4 0 0 27 0 0
                                    0 1 2 0 0 27 0 1 3 0 0 27 0 0 1 2 5 9 0 0 1
                                    2 1 0 0 0 269 1 1 74 0 83 1 1 74 335 464 1
                                    1 0 0 249 1 1 0 0 247 1 1 0 0 245 1 1 0 0
                                    243 1 1 0 0 220 1 1 0 0 196 1 1 0 0 216 1 1
                                    0 0 192 1 1 0 0 212 1 1 0 0 188 1 1 0 0 223
                                    2 23 0 0 57 92 2 1 0 0 0 84 2 1 0 0 489 491
                                    2 29 0 0 35 91 2 29 0 0 93 94 0 27 0 47 1 1
                                    0 0 369 1 1 0 0 373 0 29 0 49 1 1 0 0 225 2
                                    1 0 0 0 227 1 1 0 0 367 3 5 0 0 27 35 1 3 5
                                    0 0 38 635 1 2 5 0 0 38 1 2 5 0 0 27 1 1 1
                                    0 0 371 1 1 0 0 375 2 1 0 0 0 229 2 0 9 0 0
                                    97 2 23 0 0 0 69 2 1 0 99 99 141 2 19 0 0 0
                                    67 1 19 0 0 56 2 27 0 0 0 65 2 19 0 57 0 59
                                    2 27 0 35 0 1 2 27 0 93 0 1 2 2 0 6 0 1 2 2
                                    0 0 6 1 2 1 0 489 0 1 2 1 0 0 489 1 2 29 0
                                    0 0 63)))))
           '|lookupComplete|)) 
