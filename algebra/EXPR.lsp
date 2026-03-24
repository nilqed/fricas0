
(PUT '|EXPR;belong?;BoB;1| '|SPADreplace| '(XLAM (|op|) 'T)) 

(SDEFUN |EXPR;belong?;BoB;1| ((|op| (|BasicOperator|)) (% (|Boolean|))) 'T) 

(SDEFUN |EXPR;retNotUnit| ((|x| (%)) (% (R)))
        (SPROG ((|u| (|Union| R "failed")) (|k| (|Kernel| %)))
               (SEQ
                (LETT |u|
                      (SPADCALL (LETT |k| (SPADCALL |x| (QREFELT % 13)))
                                (QREFELT % 17)))
                (EXIT
                 (COND ((QEQCAR |u| 0) (QCDR |u|))
                       ('T (|error| "Not retractable"))))))) 

(SDEFUN |EXPR;retNotUnitIfCan| ((|x| (%)) (% (|Union| R "failed")))
        (SPROG ((|r| (|Union| (|Kernel| %) "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 19)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                           ('T (SPADCALL (QCDR |r|) (QREFELT % 17)))))))) 

(SDEFUN |EXPR;operator;2Bo;4| ((|op| #1=(|BasicOperator|)) (% #1#))
        (SPROG ((|n| (|Union| (|NonNegativeInteger|) "failed")))
               (SEQ
                (COND
                 ((SPADCALL |op| (QREFELT % 21))
                  (SPADCALL |op| (QREFELT % 22)))
                 ((SPADCALL |op| (QREFELT % 24))
                  (SPADCALL |op| (QREFELT % 25)))
                 (#2='T
                  (SEQ
                   (COND
                    ((SPADCALL |op| (QREFELT % 26))
                     (COND
                      ((SPADCALL |op| (QREFELT % 7) (QREFELT % 28))
                       (EXIT
                        (SPADCALL
                         (SPADCALL (SPADCALL |op| (QREFELT % 29))
                                   (QREFELT % 30))
                         (QREFELT % 31)))))))
                   (LETT |n| (SPADCALL |op| (QREFELT % 33)))
                   (EXIT
                    (COND
                     ((QEQCAR |n| 1)
                      (SPADCALL (SPADCALL |op| (QREFELT % 29)) (QREFELT % 34)))
                     (#2#
                      (SPADCALL (SPADCALL |op| (QREFELT % 29)) (QCDR |n|)
                                (QREFELT % 36))))))))))) 

(SDEFUN |EXPR;poly_to_MP|
        ((|p| (|Polynomial| R))
         (% (|SparseMultivariatePolynomial| R (|Kernel| %))))
        (SPROG
         ((|vl2| (|List| (|Kernel| %))) (#1=#:G79 NIL) (|z| NIL) (#2=#:G78 NIL)
          (|vl1| (|List| (|Symbol|)))
          (|ps| (|SparseMultivariatePolynomial| R (|Symbol|))))
         (SEQ (LETT |ps| |p|) (LETT |vl1| (SPADCALL |ps| (QREFELT % 40)))
              (LETT |vl2|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |z| NIL) (LETT #1# |vl1|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |z| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS (SPADCALL |z| (QREFELT % 30)) #2#))))
                          (LETT #1# (CDR #1#)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))
              (EXIT (SPADCALL |ps| |vl1| |vl2| (QREFELT % 44)))))) 

(SDEFUN |EXPR;Zero;%;6| ((% (%))) (|spadConstant| % 46)) 

(SDEFUN |EXPR;One;%;7| ((% (%))) (|spadConstant| % 48)) 

(SDEFUN |EXPR;one?;%B;8| ((|x| (%)) (% (|Boolean|)))
        (SPADCALL |x| (|spadConstant| % 49) (QREFELT % 51))) 

(SDEFUN |EXPR;zero?;%B;9| ((|x| (%)) (% (|Boolean|)))
        (SPADCALL |x| (QREFELT % 53))) 

(SDEFUN |EXPR;-;2%;10| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 55))) 

(SDEFUN |EXPR;*;I2%;11| ((|n| (|Integer|)) (|x| (%)) (% (%)))
        (SPADCALL |n| |x| (QREFELT % 58))) 

(SDEFUN |EXPR;coerce;I%;12| ((|n| (|Integer|)) (% (%)))
        (SPADCALL |n| (QREFELT % 60))) 

(SDEFUN |EXPR;*;3%;13| ((|x| (%)) (|y| (%)) (% (%)))
        (|EXPR;algreduc| (SPADCALL |x| |y| (QREFELT % 62))
         (|EXPR;commonk| |x| |y| %) %)) 

(SDEFUN |EXPR;+;3%;14| ((|x| (%)) (|y| (%)) (% (%)))
        (|EXPR;algreduc| (SPADCALL |x| |y| (QREFELT % 64))
         (|EXPR;commonk| |x| |y| %) %)) 

(SDEFUN |EXPR;-;3%;15| ((|x| (%)) (|y| (%)) (% (%)))
        (|EXPR;algreduc| (SPADCALL |x| |y| (QREFELT % 66))
         (|EXPR;commonk| |x| |y| %) %)) 

(SDEFUN |EXPR;/;3%;16| ((|x| (%)) (|y| (%)) (% (%)))
        (|EXPR;algreduc| (SPADCALL |x| |y| (QREFELT % 68))
         (|EXPR;commonk| |x| |y| %) %)) 

(SDEFUN |EXPR;number?;%B;17| ((|x| (%)) (% (|Boolean|)))
        (COND
         ((|HasCategory| (QREFELT % 6) (LIST '|RetractableTo| '(|Integer|)))
          (COND ((SPADCALL |x| (QREFELT % 70)) 'T)
                (#1='T (QEQCAR (SPADCALL |x| (QREFELT % 72)) 0))))
         (#1# (SPADCALL |x| (QREFELT % 70))))) 

(SDEFUN |EXPR;simplifyPower| ((|x| (%)) (|n| (|Integer|)) (% (%)))
        (SPROG ((|args| (|List| %)) (|k| (|List| (|Kernel| %))))
               (SEQ (LETT |k| (SPADCALL |x| (QREFELT % 75)))
                    (EXIT
                     (COND
                      ((SPADCALL |x| '|%power| (QREFELT % 76))
                       (SEQ
                        (LETT |args|
                              (SPADCALL (SPADCALL |k| (QREFELT % 77))
                                        (QREFELT % 79)))
                        (COND
                         ((NULL (EQL (SPADCALL |args| (QREFELT % 80)) 2))
                          (EXIT (|error| "Too many arguments to ^"))))
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |args| 1 (QREFELT % 81))
                                     (QREFELT % 73))
                           (SPADCALL
                            (|EXPR;reduc|
                             (SPADCALL (SPADCALL |args| 1 (QREFELT % 81)) |n|
                                       (QREFELT % 82))
                             (SPADCALL (SPADCALL |args| 1 (QREFELT % 81))
                                       (QREFELT % 83))
                             %)
                            (SPADCALL |args| 2 (QREFELT % 81)) (QREFELT % 84)))
                          (#1='T
                           (SPADCALL (SPADCALL |args| (QREFELT % 85))
                                     (SPADCALL |n|
                                               (SPADCALL |args| (QREFELT % 86))
                                               (QREFELT % 59))
                                     (QREFELT % 84)))))))
                      (#1#
                       (|EXPR;reduc| (SPADCALL |x| |n| (QREFELT % 82))
                        (SPADCALL |x| (QREFELT % 83)) %))))))) 

(SDEFUN |EXPR;^;%Nni%;19| ((|x| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (COND ((EQL |n| 0) (|spadConstant| % 49)) ((EQL |n| 1) |x|)
              ('T
               (SPADCALL
                (|EXPR;simplifyPower| (SPADCALL |x| (QREFELT % 88)) |n| %)
                (|EXPR;simplifyPower| (SPADCALL |x| (QREFELT % 89)) |n| %)
                (QREFELT % 69))))) 

(SDEFUN |EXPR;^;%I%;20| ((|x| (%)) (|n| (|Integer|)) (% (%)))
        (COND ((EQL |n| 0) (|spadConstant| % 49)) ((EQL |n| 1) |x|)
              (#1='T
               (COND
                ((EQL |n| -1)
                 (SPADCALL (|spadConstant| % 49) |x| (QREFELT % 69)))
                (#1#
                 (SPADCALL
                  (|EXPR;simplifyPower| (SPADCALL |x| (QREFELT % 88)) |n| %)
                  (|EXPR;simplifyPower| (SPADCALL |x| (QREFELT % 89)) |n| %)
                  (QREFELT % 69))))))) 

(SDEFUN |EXPR;^;%Pi%;21| ((|x| (%)) (|n| (|PositiveInteger|)) (% (%)))
        (COND ((EQL |n| 1) |x|)
              ('T
               (SPADCALL
                (|EXPR;simplifyPower| (SPADCALL |x| (QREFELT % 88)) |n| %)
                (|EXPR;simplifyPower| (SPADCALL |x| (QREFELT % 89)) |n| %)
                (QREFELT % 69))))) 

(SDEFUN |EXPR;smaller?;2%B;22| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 94))) 

(SDEFUN |EXPR;=;2%B;23| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL (SPADCALL |x| |y| (QREFELT % 67)) (|spadConstant| % 46)
                  (QREFELT % 51))) 

(SDEFUN |EXPR;numer;%Smp;24|
        ((|x| (%)) (% (|SparseMultivariatePolynomial| R (|Kernel| %))))
        (SPADCALL |x| (QREFELT % 97))) 

(SDEFUN |EXPR;denom;%Smp;25|
        ((|x| (%)) (% (|SparseMultivariatePolynomial| R (|Kernel| %))))
        (SPADCALL |x| (QREFELT % 100))) 

(SDEFUN |EXPR;coerce;Smp%;26|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| %))) (% (%)))
        (CONS |p| (|spadConstant| % 103))) 

(SDEFUN |EXPR;coerce;P%;27| ((|p| (|Polynomial| R)) (% (%)))
        (SPROG ((|en| (|SparseMultivariatePolynomial| R (|Kernel| %))))
               (SEQ (LETT |en| (|EXPR;poly_to_MP| |p| %))
                    (EXIT (CONS |en| (|spadConstant| % 103)))))) 

(SDEFUN |EXPR;coerce;F%;28| ((|pq| (|Fraction| (|Polynomial| R))) (% (%)))
        (SPROG
         ((|ed| #1=(|SparseMultivariatePolynomial| R (|Kernel| %))) (|en| #1#))
         (SEQ (LETT |en| (|EXPR;poly_to_MP| (SPADCALL |pq| (QREFELT % 108)) %))
              (LETT |ed| (|EXPR;poly_to_MP| (SPADCALL |pq| (QREFELT % 109)) %))
              (EXIT (CONS |en| |ed|))))) 

(SDEFUN |EXPR;reduce;2%;29| ((|x| (%)) (% (%)))
        (|EXPR;reduc| |x| (SPADCALL |x| (QREFELT % 83)) %)) 

(SDEFUN |EXPR;commonk| ((|x| (%)) (|y| (%)) (% (|List| (|Kernel| %))))
        (|EXPR;commonk0| (SPADCALL |x| (QREFELT % 83))
         (SPADCALL |y| (QREFELT % 83)) %)) 

(SDEFUN |EXPR;algkernels|
        ((|l| (|List| (|Kernel| %))) (% (|List| (|Kernel| %))))
        (SPROG NIL
               (SPADCALL (CONS #'|EXPR;algkernels!0| (VECTOR (QREFELT % 8) %))
                         |l| (QREFELT % 113)))) 

(SDEFUN |EXPR;algkernels!0| ((|x| NIL) ($$ NIL))
        (PROG (% ALGOP)
          (LETT % (QREFELT $$ 1))
          (LETT ALGOP (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT % 31)) ALGOP (QREFELT % 28)))))) 

(SDEFUN |EXPR;toprat| ((|f| (%)) (% (%)))
        (SPADCALL |f| (SPADCALL |f| (QREFELT % 83)) (QREFELT % 115))) 

(SDEFUN |EXPR;simple_root| ((|r| (|Kernel| %)) (% (|Boolean|)))
        (SPROG ((|a| (%)) (|al| (|List| %)))
               (SEQ
                (COND
                 ((SPADCALL |r| '|nthRoot| (QREFELT % 116))
                  (SEQ (LETT |al| (SPADCALL |r| (QREFELT % 79)))
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |al| 2 (QREFELT % 81))
                                    (SPADCALL 2 (QREFELT % 61))
                                    (QREFELT % 117))
                          NIL)
                         (#1='T
                          (SEQ (LETT |a| (SPADCALL |al| 1 (QREFELT % 81)))
                               (EXIT
                                (NULL
                                 (>
                                  (LENGTH
                                   (|EXPR;algkernels|
                                    (SPADCALL |a| (QREFELT % 75)) %))
                                  0)))))))))
                 (#1# NIL))))) 

(SDEFUN |EXPR;root_reduce| ((|x| (%)) (|r| (|Kernel| %)) (% (%)))
        (SPROG
         ((|d1| (|SparseMultivariatePolynomial| R (|Kernel| %)))
          (|n1| (|SparseMultivariatePolynomial| R (|Kernel| %)))
          (|c0| #1=(|SparseMultivariatePolynomial| R (|Kernel| %))) (|c1| #1#)
          (|n0| #2=(|SparseMultivariatePolynomial| R (|Kernel| %)))
          (|dp|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| %))))
          (|dn| (|SparseMultivariatePolynomial| R (|Kernel| %))) (|an| #2#)
          (|a| (%)))
         (SEQ
          (LETT |a| (SPADCALL (SPADCALL |r| (QREFELT % 79)) 1 (QREFELT % 81)))
          (LETT |an| (SPADCALL |a| (QREFELT % 99)))
          (LETT |dn| (SPADCALL |a| (QREFELT % 101)))
          (LETT |dp|
                (SPADCALL (SPADCALL |x| (QREFELT % 101)) |r| (QREFELT % 119)))
          (LETT |n0| (SPADCALL |x| (QREFELT % 99)))
          (LETT |c1| (SPADCALL |dp| (QREFELT % 121)))
          (LETT |c0|
                (SPADCALL (SPADCALL |dp| (QREFELT % 122)) (QREFELT % 121)))
          (LETT |n1|
                (SPADCALL |dn|
                          (SPADCALL (SPADCALL |c0| |n0| (QREFELT % 123))
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| % 103) |r| 1
                                                (QREFELT % 124))
                                      |c1| (QREFELT % 123))
                                     |n0| (QREFELT % 123))
                                    (QREFELT % 125))
                          (QREFELT % 123)))
          (LETT |d1|
                (SPADCALL
                 (SPADCALL (SPADCALL |c0| |c0| (QREFELT % 123)) |dn|
                           (QREFELT % 123))
                 (SPADCALL (SPADCALL |an| |c1| (QREFELT % 123)) |c1|
                           (QREFELT % 123))
                 (QREFELT % 125)))
          (EXIT
           (|EXPR;reduc| (SPADCALL |n1| |d1| (QREFELT % 126)) (LIST |r|) %))))) 

(PUT '|EXPR;getSimplifyDenomsFlag;B;35| '|SPADreplace|
     '(XLAM NIL |algreduc_flag|)) 

(SDEFUN |EXPR;getSimplifyDenomsFlag;B;35| ((% (|Boolean|))) |algreduc_flag|) 

(SDEFUN |EXPR;setSimplifyDenomsFlag;2B;36| ((|x| (|Boolean|)) (% (|Boolean|)))
        (SPROG ((|res| (|Boolean|)))
               (SEQ (LETT |res| (SPADCALL (QREFELT % 127)))
                    (SETF |algreduc_flag| |x|) (EXIT |res|)))) 

(SDEFUN |EXPR;algreduc| ((|x| (%)) (|ckl| (|List| (|Kernel| %))) (% (%)))
        (SPROG
         ((|x1| (%)) (|q| (|SparseUnivariatePolynomial| %)) (#1=#:G141 NIL)
          (|k| NIL) (|sas| (|SingletonAsOrderedSet|)) (#2=#:G140 NIL)
          (|r| (|Kernel| %)) (|akl| (|List| (|Kernel| %))))
         (SEQ
          (EXIT
           (SEQ (LETT |x1| (|EXPR;reduc| |x| |ckl| %))
                (EXIT
                 (COND
                  ((SPADCALL (QREFELT % 127))
                   (SEQ
                    (LETT |akl|
                          (SPADCALL
                           (SPADCALL (|spadConstant| % 103)
                                     (SPADCALL |x1| (QREFELT % 101))
                                     (QREFELT % 126))
                           (QREFELT % 83)))
                    (EXIT
                     (COND ((EQL (LENGTH |akl|) 0) |x1|)
                           (#3='T
                            (SEQ
                             (COND
                              ((EQL (LENGTH |akl|) 1)
                               (SEQ
                                (LETT |r| (SPADCALL |akl| 1 (QREFELT % 129)))
                                (EXIT
                                 (COND
                                  ((|EXPR;simple_root| |r| %)
                                   (PROGN
                                    (LETT #2# (|EXPR;root_reduce| |x| |r| %))
                                    (GO #4=#:G139))))))))
                             (LETT |sas| (SPADCALL (QREFELT % 131)))
                             (SEQ (LETT |k| NIL) (LETT #1# |akl|) G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |k| (CAR #1#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (LETT |q|
                                         (SPADCALL |x1| |k|
                                                   (SPADCALL |k|
                                                             (QREFELT % 132))
                                                   (QREFELT % 135)))
                                   (EXIT
                                    (LETT |x1|
                                          (SPADCALL
                                           (SPADCALL |q| |sas|
                                                     (SPADCALL |k|
                                                               (QREFELT % 136))
                                                     (QREFELT % 137))
                                           (QREFELT % 138)))))
                                  (LETT #1# (CDR #1#)) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT |x1|)))))))
                  (#3# |x1|)))))
          #4# (EXIT #2#)))) 

(SDEFUN |EXPR;/;2Smp%;38|
        ((|x| (|SparseMultivariatePolynomial| R #1=(|Kernel| %)))
         (|y| (|SparseMultivariatePolynomial| R #1#)) (% (%)))
        (|EXPR;reduc| (SPADCALL |x| |y| (QREFELT % 126))
         (|EXPR;commonk| (SPADCALL |x| (|spadConstant| % 103) (QREFELT % 126))
          (SPADCALL |y| (|spadConstant| % 103) (QREFELT % 126)) %)
         %)) 

(SDEFUN |EXPR;reducedSystem;MM;39| ((|m| (|Matrix| %)) (% (|Matrix| R)))
        (SPROG
         ((|mm| (|Matrix| (|SparseMultivariatePolynomial| R (|Kernel| %)))))
         (SEQ
          (LETT |mm|
                (SPADCALL
                 (SPADCALL (CONS (|function| |EXPR;toprat|) %) |m|
                           (QREFELT % 142))
                 (QREFELT % 145)))
          (EXIT (SPADCALL |mm| (QREFELT % 147)))))) 

(SDEFUN |EXPR;reducedSystem;MVR;40|
        ((|m| (|Matrix| %)) (|v| (|Vector| %))
         (% (|Record| (|:| |mat| (|Matrix| R)) (|:| |vec| (|Vector| R)))))
        (SPROG
         ((|r|
           (|Record|
            (|:| |mat|
                 (|Matrix| (|SparseMultivariatePolynomial| R (|Kernel| %))))
            (|:| |vec|
                 (|Vector| (|SparseMultivariatePolynomial| R (|Kernel| %)))))))
         (SEQ
          (LETT |r|
                (SPADCALL
                 (SPADCALL (CONS (|function| |EXPR;toprat|) %) |m|
                           (QREFELT % 142))
                 (SPADCALL (CONS (|function| |EXPR;toprat|) %) |v|
                           (QREFELT % 150))
                 (QREFELT % 153)))
          (EXIT (SPADCALL (QCAR |r|) (QCDR |r|) (QREFELT % 155)))))) 

(SDEFUN |EXPR;commonk0|
        ((|x| (|List| (|Kernel| %))) (|y| (|List| (|Kernel| %)))
         (% (|List| (|Kernel| %))))
        (SPROG ((|ans| (|List| (|Kernel| %))) (#1=#:G157 NIL) (|k| NIL))
               (SEQ (LETT |ans| NIL)
                    (SEQ (LETT |k| NIL) (LETT #1# (NREVERSE |x|)) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |k| |y| (QREFELT % 157))
                             (LETT |ans|
                                   (SPADCALL |k| |ans| (QREFELT % 158)))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |EXPR;rootOf;SupS%;42|
        ((|x| (|SparseUnivariatePolynomial| %)) (|v| (|Symbol|)) (% (%)))
        (SPADCALL |x| |v| (QREFELT % 160))) 

(SDEFUN |EXPR;rootSum;%SupS%;43|
        ((|x| (%)) (|p| (|SparseUnivariatePolynomial| %)) (|v| (|Symbol|))
         (% (%)))
        (SPADCALL |x| |p| |v| (QREFELT % 162))) 

(SDEFUN |EXPR;pi;%;44| ((% (%))) (SPADCALL (QREFELT % 165))) 

(SDEFUN |EXPR;exp;2%;45| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 167))) 

(SDEFUN |EXPR;log;2%;46| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 169))) 

(SDEFUN |EXPR;sin;2%;47| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 171))) 

(SDEFUN |EXPR;cos;2%;48| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 173))) 

(SDEFUN |EXPR;tan;2%;49| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 175))) 

(SDEFUN |EXPR;cot;2%;50| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 177))) 

(SDEFUN |EXPR;sec;2%;51| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 179))) 

(SDEFUN |EXPR;csc;2%;52| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 181))) 

(SDEFUN |EXPR;asin;2%;53| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 183))) 

(SDEFUN |EXPR;acos;2%;54| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 185))) 

(SDEFUN |EXPR;atan;2%;55| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 187))) 

(SDEFUN |EXPR;acot;2%;56| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 189))) 

(SDEFUN |EXPR;asec;2%;57| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 191))) 

(SDEFUN |EXPR;acsc;2%;58| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 193))) 

(SDEFUN |EXPR;sinh;2%;59| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 195))) 

(SDEFUN |EXPR;cosh;2%;60| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 197))) 

(SDEFUN |EXPR;tanh;2%;61| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 199))) 

(SDEFUN |EXPR;coth;2%;62| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 201))) 

(SDEFUN |EXPR;sech;2%;63| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 203))) 

(SDEFUN |EXPR;csch;2%;64| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 205))) 

(SDEFUN |EXPR;asinh;2%;65| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 207))) 

(SDEFUN |EXPR;acosh;2%;66| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 209))) 

(SDEFUN |EXPR;atanh;2%;67| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 211))) 

(SDEFUN |EXPR;acoth;2%;68| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 213))) 

(SDEFUN |EXPR;asech;2%;69| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 215))) 

(SDEFUN |EXPR;acsch;2%;70| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 217))) 

(SDEFUN |EXPR;abs;2%;71| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 220))) 

(SDEFUN |EXPR;sign;2%;72| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 222))) 

(SDEFUN |EXPR;unitStep;2%;73| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 224))) 

(SDEFUN |EXPR;ceiling;2%;74| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 226))) 

(SDEFUN |EXPR;floor;2%;75| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 228))) 

(SDEFUN |EXPR;fractionPart;2%;76| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 230))) 

(SDEFUN |EXPR;diracDelta;2%;77| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 232))) 

(SDEFUN |EXPR;conjugate;2%;78| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 234))) 

(SDEFUN |EXPR;Gamma;2%;79| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 236))) 

(SDEFUN |EXPR;Gamma;3%;80| ((|a| (%)) (|x| (%)) (% (%)))
        (SPADCALL |a| |x| (QREFELT % 238))) 

(SDEFUN |EXPR;Beta;3%;81| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 240))) 

(SDEFUN |EXPR;Beta;4%;82| ((|x| (%)) (|a| (%)) (|b| (%)) (% (%)))
        (SPADCALL |x| |a| |b| (QREFELT % 242))) 

(SDEFUN |EXPR;digamma;2%;83| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 244))) 

(SDEFUN |EXPR;polygamma;3%;84| ((|k| (%)) (|x| (%)) (% (%)))
        (SPADCALL |k| |x| (QREFELT % 246))) 

(SDEFUN |EXPR;besselJ;3%;85| ((|v| (%)) (|x| (%)) (% (%)))
        (SPADCALL |v| |x| (QREFELT % 248))) 

(SDEFUN |EXPR;besselY;3%;86| ((|v| (%)) (|x| (%)) (% (%)))
        (SPADCALL |v| |x| (QREFELT % 250))) 

(SDEFUN |EXPR;besselI;3%;87| ((|v| (%)) (|x| (%)) (% (%)))
        (SPADCALL |v| |x| (QREFELT % 252))) 

(SDEFUN |EXPR;besselK;3%;88| ((|v| (%)) (|x| (%)) (% (%)))
        (SPADCALL |v| |x| (QREFELT % 254))) 

(SDEFUN |EXPR;airyAi;2%;89| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 256))) 

(SDEFUN |EXPR;airyAiPrime;2%;90| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 258))) 

(SDEFUN |EXPR;airyBi;2%;91| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 260))) 

(SDEFUN |EXPR;airyBiPrime;2%;92| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 262))) 

(SDEFUN |EXPR;lambertW;2%;93| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 264))) 

(SDEFUN |EXPR;polylog;3%;94| ((|s| (%)) (|x| (%)) (% (%)))
        (SPADCALL |s| |x| (QREFELT % 266))) 

(SDEFUN |EXPR;weierstrassP;4%;95| ((|g2| (%)) (|g3| (%)) (|x| (%)) (% (%)))
        (SPADCALL |g2| |g3| |x| (QREFELT % 268))) 

(SDEFUN |EXPR;weierstrassPPrime;4%;96|
        ((|g2| (%)) (|g3| (%)) (|x| (%)) (% (%)))
        (SPADCALL |g2| |g3| |x| (QREFELT % 270))) 

(SDEFUN |EXPR;weierstrassSigma;4%;97| ((|g2| (%)) (|g3| (%)) (|x| (%)) (% (%)))
        (SPADCALL |g2| |g3| |x| (QREFELT % 272))) 

(SDEFUN |EXPR;weierstrassZeta;4%;98| ((|g2| (%)) (|g3| (%)) (|x| (%)) (% (%)))
        (SPADCALL |g2| |g3| |x| (QREFELT % 274))) 

(SDEFUN |EXPR;weierstrassPInverse;4%;99|
        ((|g2| (%)) (|g3| (%)) (|z| (%)) (% (%)))
        (SPADCALL |g2| |g3| |z| (QREFELT % 276))) 

(SDEFUN |EXPR;whittakerM;4%;100| ((|k| (%)) (|m| (%)) (|z| (%)) (% (%)))
        (SPADCALL |k| |m| |z| (QREFELT % 278))) 

(SDEFUN |EXPR;whittakerW;4%;101| ((|k| (%)) (|m| (%)) (|z| (%)) (% (%)))
        (SPADCALL |k| |m| |z| (QREFELT % 280))) 

(SDEFUN |EXPR;angerJ;3%;102| ((|v| (%)) (|z| (%)) (% (%)))
        (SPADCALL |v| |z| (QREFELT % 282))) 

(SDEFUN |EXPR;weberE;3%;103| ((|v| (%)) (|z| (%)) (% (%)))
        (SPADCALL |v| |z| (QREFELT % 284))) 

(SDEFUN |EXPR;struveH;3%;104| ((|v| (%)) (|z| (%)) (% (%)))
        (SPADCALL |v| |z| (QREFELT % 286))) 

(SDEFUN |EXPR;struveL;3%;105| ((|v| (%)) (|z| (%)) (% (%)))
        (SPADCALL |v| |z| (QREFELT % 288))) 

(SDEFUN |EXPR;hankelH1;3%;106| ((|v| (%)) (|z| (%)) (% (%)))
        (SPADCALL |v| |z| (QREFELT % 290))) 

(SDEFUN |EXPR;hankelH2;3%;107| ((|v| (%)) (|z| (%)) (% (%)))
        (SPADCALL |v| |z| (QREFELT % 292))) 

(SDEFUN |EXPR;lommelS1;4%;108| ((|mu| (%)) (|nu| (%)) (|z| (%)) (% (%)))
        (SPADCALL |mu| |nu| |z| (QREFELT % 294))) 

(SDEFUN |EXPR;lommelS2;4%;109| ((|mu| (%)) (|nu| (%)) (|z| (%)) (% (%)))
        (SPADCALL |mu| |nu| |z| (QREFELT % 296))) 

(SDEFUN |EXPR;kummerM;4%;110| ((|mu| (%)) (|nu| (%)) (|z| (%)) (% (%)))
        (SPADCALL |mu| |nu| |z| (QREFELT % 298))) 

(SDEFUN |EXPR;kummerU;4%;111| ((|mu| (%)) (|nu| (%)) (|z| (%)) (% (%)))
        (SPADCALL |mu| |nu| |z| (QREFELT % 300))) 

(SDEFUN |EXPR;legendreP;4%;112| ((|nu| (%)) (|mu| (%)) (|z| (%)) (% (%)))
        (SPADCALL |nu| |mu| |z| (QREFELT % 302))) 

(SDEFUN |EXPR;legendreQ;4%;113| ((|nu| (%)) (|mu| (%)) (|z| (%)) (% (%)))
        (SPADCALL |nu| |mu| |z| (QREFELT % 304))) 

(SDEFUN |EXPR;kelvinBei;3%;114| ((|v| (%)) (|z| (%)) (% (%)))
        (SPADCALL |v| |z| (QREFELT % 306))) 

(SDEFUN |EXPR;kelvinBer;3%;115| ((|v| (%)) (|z| (%)) (% (%)))
        (SPADCALL |v| |z| (QREFELT % 308))) 

(SDEFUN |EXPR;kelvinKei;3%;116| ((|v| (%)) (|z| (%)) (% (%)))
        (SPADCALL |v| |z| (QREFELT % 310))) 

(SDEFUN |EXPR;kelvinKer;3%;117| ((|v| (%)) (|z| (%)) (% (%)))
        (SPADCALL |v| |z| (QREFELT % 312))) 

(SDEFUN |EXPR;ellipticK;2%;118| ((|m| (%)) (% (%)))
        (SPADCALL |m| (QREFELT % 314))) 

(SDEFUN |EXPR;ellipticE;2%;119| ((|m| (%)) (% (%)))
        (SPADCALL |m| (QREFELT % 316))) 

(SDEFUN |EXPR;ellipticE;3%;120| ((|z| (%)) (|m| (%)) (% (%)))
        (SPADCALL |z| |m| (QREFELT % 318))) 

(SDEFUN |EXPR;ellipticF;3%;121| ((|z| (%)) (|m| (%)) (% (%)))
        (SPADCALL |z| |m| (QREFELT % 320))) 

(SDEFUN |EXPR;ellipticPi;4%;122| ((|z| (%)) (|n| (%)) (|m| (%)) (% (%)))
        (SPADCALL |z| |n| |m| (QREFELT % 322))) 

(SDEFUN |EXPR;jacobiSn;3%;123| ((|z| (%)) (|m| (%)) (% (%)))
        (SPADCALL |z| |m| (QREFELT % 324))) 

(SDEFUN |EXPR;jacobiCn;3%;124| ((|z| (%)) (|m| (%)) (% (%)))
        (SPADCALL |z| |m| (QREFELT % 326))) 

(SDEFUN |EXPR;jacobiDn;3%;125| ((|z| (%)) (|m| (%)) (% (%)))
        (SPADCALL |z| |m| (QREFELT % 328))) 

(SDEFUN |EXPR;jacobiZeta;3%;126| ((|z| (%)) (|m| (%)) (% (%)))
        (SPADCALL |z| |m| (QREFELT % 330))) 

(SDEFUN |EXPR;jacobiTheta;3%;127| ((|z| (%)) (|m| (%)) (% (%)))
        (SPADCALL |z| |m| (QREFELT % 332))) 

(SDEFUN |EXPR;lerchPhi;4%;128| ((|z| (%)) (|s| (%)) (|a| (%)) (% (%)))
        (SPADCALL |z| |s| |a| (QREFELT % 334))) 

(SDEFUN |EXPR;riemannZeta;2%;129| ((|z| (%)) (% (%)))
        (SPADCALL |z| (QREFELT % 336))) 

(SDEFUN |EXPR;charlierC;4%;130| ((|n| (%)) (|a| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |a| |z| (QREFELT % 338))) 

(SDEFUN |EXPR;hahn_p;6%;131|
        ((|n| (%)) (|a| (%)) (|b| (%)) (|c| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |a| |b| |c| |z| (QREFELT % 340))) 

(SDEFUN |EXPR;hahnQ;6%;132|
        ((|n| (%)) (|a| (%)) (|b| (%)) (|c| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |a| |b| |c| |z| (QREFELT % 342))) 

(SDEFUN |EXPR;hahnR;6%;133|
        ((|n| (%)) (|a| (%)) (|b| (%)) (|c| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |a| |b| |c| |z| (QREFELT % 344))) 

(SDEFUN |EXPR;hahnS;6%;134|
        ((|n| (%)) (|a| (%)) (|b| (%)) (|c| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |a| |b| |c| |z| (QREFELT % 346))) 

(SDEFUN |EXPR;hermiteH;3%;135| ((|n| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |z| (QREFELT % 348))) 

(SDEFUN |EXPR;krawtchoukK;5%;136|
        ((|n| (%)) (|b| (%)) (|c| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |b| |c| |z| (QREFELT % 350))) 

(SDEFUN |EXPR;jacobiP;5%;137| ((|n| (%)) (|a| (%)) (|b| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |a| |b| |z| (QREFELT % 352))) 

(SDEFUN |EXPR;laguerreL;4%;138| ((|n| (%)) (|a| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |a| |z| (QREFELT % 354))) 

(SDEFUN |EXPR;meixnerM;5%;139|
        ((|n| (%)) (|b| (%)) (|c| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |b| |c| |z| (QREFELT % 356))) 

(SDEFUN |EXPR;meixnerP;5%;140|
        ((|n| (%)) (|b| (%)) (|c| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |b| |c| |z| (QREFELT % 358))) 

(SDEFUN |EXPR;racahR;7%;141|
        ((|n| (%)) (|a| (%)) (|b| (%)) (|c| (%)) (|d| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |a| |b| |c| |d| |z| (QREFELT % 360))) 

(SDEFUN |EXPR;wilsonW;7%;142|
        ((|n| (%)) (|a| (%)) (|b| (%)) (|c| (%)) (|d| (%)) (|z| (%)) (% (%)))
        (SPADCALL |n| |a| |b| |c| |d| |z| (QREFELT % 362))) 

(SDEFUN |EXPR;hypergeometricF;2L2%;143|
        ((|la| #1=(|List| %)) (|lb| #1#) (|x| (%)) (% (%)))
        (SPADCALL |la| |lb| |x| (QREFELT % 364))) 

(SDEFUN |EXPR;meijerG;4L2%;144|
        ((|la| #1=(|List| %)) (|lb| #1#) (|lc| #1#) (|ld| #1#) (|x| (%))
         (% (%)))
        (SPADCALL |la| |lb| |lc| |ld| |x| (QREFELT % 367))) 

(SDEFUN |EXPR;^;3%;145| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 370))) 

(SDEFUN |EXPR;factorial;2%;146| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 371))) 

(SDEFUN |EXPR;binomial;3%;147| ((|n| (%)) (|m| (%)) (% (%)))
        (SPADCALL |n| |m| (QREFELT % 373))) 

(SDEFUN |EXPR;permutation;3%;148| ((|n| (%)) (|m| (%)) (% (%)))
        (SPADCALL |n| |m| (QREFELT % 375))) 

(SDEFUN |EXPR;factorials;2%;149| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 377))) 

(SDEFUN |EXPR;factorials;%S%;150| ((|x| (%)) (|n| (|Symbol|)) (% (%)))
        (SPADCALL |x| |n| (QREFELT % 379))) 

(SDEFUN |EXPR;summation;%S%;151| ((|x| (%)) (|n| (|Symbol|)) (% (%)))
        (SPADCALL |x| |n| (QREFELT % 381))) 

(SDEFUN |EXPR;summation;%Sb%;152|
        ((|x| (%)) (|s| (|SegmentBinding| %)) (% (%)))
        (SPADCALL |x| |s| (QREFELT % 384))) 

(SDEFUN |EXPR;product;%S%;153| ((|x| (%)) (|n| (|Symbol|)) (% (%)))
        (SPADCALL |x| |n| (QREFELT % 387))) 

(SDEFUN |EXPR;product;%Sb%;154| ((|x| (%)) (|s| (|SegmentBinding| %)) (% (%)))
        (SPADCALL |x| |s| (QREFELT % 389))) 

(SDEFUN |EXPR;erf;2%;155| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 392))) 

(SDEFUN |EXPR;erfi;2%;156| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 394))) 

(SDEFUN |EXPR;Ei;2%;157| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 396))) 

(SDEFUN |EXPR;Si;2%;158| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 398))) 

(SDEFUN |EXPR;Ci;2%;159| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 400))) 

(SDEFUN |EXPR;Shi;2%;160| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 402))) 

(SDEFUN |EXPR;Chi;2%;161| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 404))) 

(SDEFUN |EXPR;li;2%;162| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 406))) 

(SDEFUN |EXPR;dilog;2%;163| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 408))) 

(SDEFUN |EXPR;fresnelS;2%;164| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 410))) 

(SDEFUN |EXPR;fresnelC;2%;165| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 412))) 

(SDEFUN |EXPR;integral;%S%;166| ((|x| (%)) (|n| (|Symbol|)) (% (%)))
        (SPADCALL |x| |n| (QREFELT % 414))) 

(SDEFUN |EXPR;integral;%Sb%;167| ((|x| (%)) (|s| (|SegmentBinding| %)) (% (%)))
        (SPADCALL |x| |s| (QREFELT % 416))) 

(SDEFUN |EXPR;operator;2Bo;168| ((|op| #1=(|BasicOperator|)) (% #1#))
        (SPROG ((|n| (|Union| (|NonNegativeInteger|) "failed")))
               (SEQ
                (COND
                 ((SPADCALL |op| (QREFELT % 418))
                  (SPADCALL |op| (QREFELT % 419)))
                 ((SPADCALL |op| (QREFELT % 420))
                  (SPADCALL |op| (QREFELT % 421)))
                 ((SPADCALL |op| (QREFELT % 422))
                  (SPADCALL |op| (QREFELT % 423)))
                 ((SPADCALL |op| (QREFELT % 424))
                  (SPADCALL |op| (QREFELT % 425)))
                 ((SPADCALL |op| (QREFELT % 426))
                  (SPADCALL |op| (QREFELT % 427)))
                 ((SPADCALL |op| (QREFELT % 21))
                  (SPADCALL |op| (QREFELT % 22)))
                 ((SPADCALL |op| (QREFELT % 24))
                  (SPADCALL |op| (QREFELT % 25)))
                 (#2='T
                  (SEQ
                   (COND
                    ((SPADCALL |op| (QREFELT % 26))
                     (COND
                      ((SPADCALL |op| (QREFELT % 7) (QREFELT % 28))
                       (EXIT
                        (SPADCALL
                         (SPADCALL (SPADCALL |op| (QREFELT % 29))
                                   (QREFELT % 30))
                         (QREFELT % 31)))))))
                   (LETT |n| (SPADCALL |op| (QREFELT % 33)))
                   (EXIT
                    (COND
                     ((QEQCAR |n| 1)
                      (SPADCALL (SPADCALL |op| (QREFELT % 29)) (QREFELT % 34)))
                     (#2#
                      (SPADCALL (SPADCALL |op| (QREFELT % 29)) (QCDR |n|)
                                (QREFELT % 36))))))))))) 

(SDEFUN |EXPR;reduc| ((|x| (%)) (|l| (|List| (|Kernel| %))) (% (%)))
        (SPROG
         ((|p| (|SparseUnivariatePolynomial| %)) (#1=#:G303 NIL) (|k| NIL))
         (SEQ
          (SEQ (LETT |k| NIL) (LETT #1# |l|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL)) (GO G191)))
               (SEQ (LETT |p| (SPADCALL |k| (QREFELT % 132)))
                    (EXIT
                     (LETT |x|
                           (SPADCALL
                            (|EXPR;evl| (SPADCALL |x| (QREFELT % 99)) |k| |p|
                             %)
                            (|EXPR;evl| (SPADCALL |x| (QREFELT % 101)) |k| |p|
                             %)
                            (QREFELT % 68)))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (EXIT |x|)))) 

(SDEFUN |EXPR;evl0|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| %)))
         (|k| (|Kernel| %))
         (%
          (|SparseUnivariatePolynomial|
           (|Fraction| (|SparseMultivariatePolynomial| R (|Kernel| %))))))
        (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT % 429)) |k| (QREFELT % 432))
                  (QREFELT % 434))) 

(SDEFUN |EXPR;evl|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| %)))
         (|k| (|Kernel| %)) (|m| (|SparseUnivariatePolynomial| %))
         (% (|Fraction| (|SparseMultivariatePolynomial| R (|Kernel| %)))))
        (COND
         ((< (SPADCALL |p| |k| (QREFELT % 435)) (SPADCALL |m| (QREFELT % 436)))
          (SPADCALL |p| (QREFELT % 429)))
         ('T
          (SPADCALL (SPADCALL (|EXPR;evl0| |p| |k| %) |m| (QREFELT % 437))
                    (SPADCALL (SPADCALL |k| (QREFELT % 438)) (QREFELT % 429))
                    (QREFELT % 439))))) 

(SDEFUN |EXPR;noalg?| ((|p| (|SparseUnivariatePolynomial| %)) (% (|Boolean|)))
        (SPROG ((#1=#:G313 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |p| (|spadConstant| % 440)
                                    (QREFELT % 441)))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL
                            (NULL
                             (|EXPR;algkernels|
                              (SPADCALL (SPADCALL |p| (QREFELT % 442))
                                        (QREFELT % 75))
                              %)))
                           (PROGN (LETT #1# NIL) (GO #2=#:G312)))
                          ('T (LETT |p| (SPADCALL |p| (QREFELT % 443)))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #2# (EXIT #1#)))) 

(SDEFUN |EXPR;algkers|
        ((|p| (|SparseUnivariatePolynomial| %)) (% (|List| (|Kernel| %))))
        (SPROG ((|res| (|List| (|Kernel| %))) (|lc| (%)))
               (SEQ (LETT |res| NIL)
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |p| (|spadConstant| % 440)
                                      (QREFELT % 441)))
                           (GO G191)))
                         (SEQ (LETT |lc| (SPADCALL |p| (QREFELT % 442)))
                              (LETT |res|
                                    (SPADCALL (SPADCALL |lc| (QREFELT % 83))
                                              |res| (QREFELT % 444)))
                              (EXIT (LETT |p| (SPADCALL |p| (QREFELT % 443)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |res| (QREFELT % 445)))))) 

(SDEFUN |EXPR;algpars| ((|lk| (|List| (|Kernel| %))) (% (|List| (|Kernel| %))))
        (SPROG
         ((|res| (|List| (|Kernel| %))) (|arg| (|List| %)) (#1=#:G326 NIL)
          (|k| NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |k| NIL) (LETT #1# |lk|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     ((NULL (SPADCALL |k| '|nthRoot| (QREFELT % 116)))
                      (COND
                       ((NULL (SPADCALL |k| '|rootOf| (QREFELT % 116)))
                        (EXIT (|error| "apars: unknown kernel"))))))
                    (LETT |arg| (SPADCALL |k| (QREFELT % 79)))
                    (EXIT
                     (LETT |res|
                           (SPADCALL
                            (SPADCALL (SPADCALL |arg| 1 (QREFELT % 81))
                                      (QREFELT % 75))
                            |res| (QREFELT % 444)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT % 445)))))) 

(SDEFUN |EXPR;trivial_denoms|
        ((|p| (|SparseUnivariatePolynomial| %)) (% (|Boolean|)))
        (SPADCALL (CONS #'|EXPR;trivial_denoms!0| %)
                  (SPADCALL |p| (QREFELT % 447)) (QREFELT % 449))) 

(SDEFUN |EXPR;trivial_denoms!0| ((|c| NIL) (% NIL))
        (SPADCALL (SPADCALL |c| (QREFELT % 101)) (|spadConstant| % 103)
                  (QREFELT % 446))) 

(SDEFUN |EXPR;SUP_to_SUPP|
        ((|p| (|SparseUnivariatePolynomial| %))
         (%
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| R (|Kernel| %)))))
        (SPADCALL (ELT % 99) |p| (QREFELT % 452))) 

(SDEFUN |EXPR;def_poly|
        ((|k| (|Kernel| %))
         (%
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| R (|Kernel| %)))))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (#1=#:G337 NIL)
          (|p1| (|SparseMultivariatePolynomial| R (|Kernel| %))) (|arg2| (%))
          (|arg1| (%)) (|args| (|List| %)))
         (SEQ (LETT |args| (SPADCALL |k| (QREFELT % 79)))
              (LETT |arg1| (SPADCALL |args| (QREFELT % 85)))
              (LETT |arg2| (SPADCALL |args| 2 (QREFELT % 81)))
              (EXIT
               (COND
                ((SPADCALL |k| '|rootOf| (QREFELT % 116))
                 (SEQ (LETT |p1| (SPADCALL |arg1| (QREFELT % 99)))
                      (EXIT
                       (SPADCALL |p1| (SPADCALL |arg2| (QREFELT % 13))
                                 (QREFELT % 119)))))
                ((SPADCALL |k| '|nthRoot| (QREFELT % 116))
                 (SEQ
                  (LETT |n|
                        (PROG1 (LETT #1# (SPADCALL |arg2| (QREFELT % 453)))
                          (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #1#)))
                  (EXIT
                   (SPADCALL
                    (SPADCALL (SPADCALL |arg1| (QREFELT % 101)) |n|
                              (QREFELT % 454))
                    (SPADCALL (SPADCALL |arg1| (QREFELT % 99)) (QREFELT % 455))
                    (QREFELT % 456)))))
                ('T (|error| "def_poly : unknown kernel"))))))) 

(SDEFUN |EXPR;varmap1|
        ((|k0| (|Kernel| %)) (|lk| (|List| (|Kernel| %)))
         (|ls| (|List| (|Symbol|))) (% (|Symbol|)))
        (SPROG
         ((#1=#:G346 NIL) (#2=#:G347 NIL) (|k| NIL) (#3=#:G348 NIL) (|s| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |s| NIL) (LETT #3# |ls|) (LETT |k| NIL) (LETT #2# |lk|)
                 G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#)) NIL) (ATOM #3#)
                       (PROGN (LETT |s| (CAR #3#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |k| |k0| (QREFELT % 457))
                     (PROGN (LETT #1# |s|) (GO #4=#:G345))))))
                 (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#)))) (GO G190)
                 G191 (EXIT NIL))
            (EXIT (|error| "varmap1: kernel not on the list"))))
          #4# (EXIT #1#)))) 

(SDEFUN |EXPR;varmap2|
        ((|s0| (|Symbol|)) (|lk| (|List| (|Kernel| %)))
         (|ls| (|List| (|Symbol|))) (% (|Kernel| %)))
        (SPROG
         ((#1=#:G353 NIL) (#2=#:G354 NIL) (|k| NIL) (#3=#:G355 NIL) (|s| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |s| NIL) (LETT #3# |ls|) (LETT |k| NIL) (LETT #2# |lk|)
                 G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#)) NIL) (ATOM #3#)
                       (PROGN (LETT |s| (CAR #3#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((EQUAL |s| |s0|) (PROGN (LETT #1# |k|) (GO #4=#:G352))))))
                 (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#)))) (GO G190)
                 G191 (EXIT NIL))
            (EXIT (|error| "varmap2: symbol not on the list"))))
          #4# (EXIT #1#)))) 

(SDEFUN |EXPR;MP_to_PI|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| %)))
         (|lk| (|List| (|Kernel| %))) (|ls| (|List| (|Symbol|)))
         (% (|Polynomial| (|Integer|))))
        (SPROG NIL
               (SPADCALL (CONS #'|EXPR;MP_to_PI!0| (VECTOR |ls| |lk| %))
                         (ELT % 462) |p| (QREFELT % 466)))) 

(SDEFUN |EXPR;MP_to_PI!0| ((|k| NIL) ($$ NIL))
        (PROG (% |lk| |ls|)
          (LETT % (QREFELT $$ 2))
          (LETT |lk| (QREFELT $$ 1))
          (LETT |ls| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (|spadConstant| % 459) (|EXPR;varmap1| |k| |lk| |ls| %)
                      (|spadConstant| % 460) (QREFELT % 461)))))) 

(SDEFUN |EXPR;SUPP_to_PI|
        ((|p|
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| R (|Kernel| %))))
         (|lk| (|List| (|Kernel| %))) (|ls| (|List| (|Symbol|)))
         (|xk| (|Kernel| %)) (% (|Polynomial| (|Integer|))))
        (SPROG ((|p2| (|SparseMultivariatePolynomial| R (|Kernel| %))))
               (SEQ (LETT |p2| (SPADCALL |p| |xk| (QREFELT % 467)))
                    (EXIT (|EXPR;MP_to_PI| |p2| |lk| |ls| %))))) 

(SDEFUN |EXPR;SUP_to_PI|
        ((|p| (|SparseUnivariatePolynomial| %)) (|lk| (|List| (|Kernel| %)))
         (|ls| (|List| (|Symbol|))) (|xk| (|Kernel| %))
         (% (|Polynomial| (|Integer|))))
        (SPROG
         ((|p1|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| %)))))
         (SEQ (LETT |p1| (|EXPR;SUP_to_SUPP| |p| %))
              (EXIT (|EXPR;SUPP_to_PI| |p1| |lk| |ls| |xk| %))))) 

(SDEFUN |EXPR;PI_to_SUP|
        ((|p| (|Polynomial| (|Integer|))) (|lk| (|List| (|Kernel| %)))
         (|ls| (|List| (|Symbol|))) (|xk| (|Kernel| %))
         (% (|SparseUnivariatePolynomial| %)))
        (SPROG
         ((|p3| (|SparseUnivariatePolynomial| %))
          (|p2|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| %))))
          (|p1| (|SparseMultivariatePolynomial| R (|Kernel| %))))
         (SEQ
          (LETT |p1|
                (SPADCALL (CONS #'|EXPR;PI_to_SUP!0| (VECTOR |ls| |lk| %))
                          (ELT % 471) |p| (QREFELT % 475)))
          (LETT |p2| (SPADCALL |p1| |xk| (QREFELT % 119)))
          (EXIT (LETT |p3| (SPADCALL (ELT % 104) |p2| (QREFELT % 478))))))) 

(SDEFUN |EXPR;PI_to_SUP!0| ((|s| NIL) ($$ NIL))
        (PROG (% |lk| |ls|)
          (LETT % (QREFELT $$ 2))
          (LETT |lk| (QREFELT $$ 1))
          (LETT |ls| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (|spadConstant| % 103) (|EXPR;varmap2| |s| |lk| |ls| %)
                      (|spadConstant| % 460) (QREFELT % 124)))))) 

(SDEFUN |EXPR;to_RF|
        ((|c| (%)) (|lk| (|List| (|Kernel| %))) (|ls| (|List| (|Symbol|)))
         (% (|Fraction| (|Polynomial| (|Integer|)))))
        (SPADCALL (|EXPR;MP_to_PI| (SPADCALL |c| (QREFELT % 99)) |lk| |ls| %)
                  (|EXPR;MP_to_PI| (SPADCALL |c| (QREFELT % 101)) |lk| |ls| %)
                  (QREFELT % 483))) 

(SDEFUN |EXPR;SUPP_to_PT|
        ((|p|
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| R (|Kernel| %))))
         (|lk| (|List| (|Kernel| %))) (|ls| (|List| (|Symbol|)))
         (|k| (|Kernel| %)) (|s| (|Symbol|))
         (%
          (|Record| (|:| |var| (|Symbol|))
                    (|:| |coef|
                         (|SparseUnivariatePolynomial|
                          (|Fraction| (|Polynomial| (|Integer|))))))))
        (SPROG
         ((|up|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|Polynomial| (|Integer|)))))
          (|p2| (|SparseMultivariatePolynomial| R (|Kernel| %))))
         (SEQ (LETT |p2| (SPADCALL |p| |k| (QREFELT % 467)))
              (LETT |up|
                    (SPADCALL
                     (SPADCALL (|EXPR;MP_to_PI| |p2| |lk| |ls| %)
                               (QREFELT % 484))
                     (QREFELT % 486)))
              (EXIT (CONS |s| |up|))))) 

(SDEFUN |EXPR;SUP_to_PT|
        ((|p| (|SparseUnivariatePolynomial| %)) (|lk| (|List| (|Kernel| %)))
         (|ls| (|List| (|Symbol|))) (|s| (|Symbol|))
         (%
          (|Record| (|:| |var| (|Symbol|))
                    (|:| |coef|
                         (|SparseUnivariatePolynomial|
                          (|Fraction| (|Polynomial| (|Integer|))))))))
        (SPROG
         ((|up|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|Polynomial| (|Integer|))))))
         (SEQ
          (LETT |up|
                (SPADCALL (CONS #'|EXPR;SUP_to_PT!0| (VECTOR % |ls| |lk|)) |p|
                          (QREFELT % 489)))
          (EXIT (CONS |s| |up|))))) 

(SDEFUN |EXPR;SUP_to_PT!0| ((|c| NIL) ($$ NIL))
        (PROG (|lk| |ls| %)
          (LETT |lk| (QREFELT $$ 2))
          (LETT |ls| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|EXPR;to_RF| |c| |lk| |ls| %))))) 

(SDEFUN |EXPR;gcdPolynomial;3Sup;187|
        ((|p| #1=(|SparseUnivariatePolynomial| %)) (|q| #1#) (% #1#))
        (SPROG
         ((|g2| (|Polynomial| (|Integer|)))
          (|lm2|
           (|List|
            (|Record| (|:| |var| (|Symbol|))
                      (|:| |coef|
                           (|SparseUnivariatePolynomial|
                            (|Fraction| (|Polynomial| (|Integer|))))))))
          (#2=#:G410 NIL) (|m| NIL) (#3=#:G411 NIL) (|k| NIL) (#4=#:G409 NIL)
          (|q2|
           #5=(|Record| (|:| |var| (|Symbol|))
                        (|:| |coef|
                             (|SparseUnivariatePolynomial|
                              (|Fraction| (|Polynomial| (|Integer|)))))))
          (|p2| #5#) (|g1| (|Polynomial| (|Integer|)))
          (|p_syms| (|List| (|Symbol|))) (|a_syms| (|List| (|Symbol|)))
          (#6=#:G408 NIL) (#7=#:G407 NIL)
          (|lm1| (|List| (|Polynomial| (|Integer|)))) (#8=#:G405 NIL)
          (#9=#:G406 NIL) (#10=#:G404 NIL)
          (|q1| #11=(|Polynomial| (|Integer|))) (|p1| #11#) (#12=#:G403 NIL)
          (#13=#:G402 NIL)
          (|lm|
           (|List|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| R (|Kernel| %)))))
          (#14=#:G401 NIL) (#15=#:G400 NIL) (|all_syms| (|List| (|Symbol|)))
          (|all_kers| (|List| (|Kernel| %))) (|xk| (|Kernel| %))
          (|x| #16=(|Symbol|)) (|all_syms0| (|List| #16#)) (#17=#:G399 NIL)
          (#18=#:G398 NIL) (|akers| (|List| (|Kernel| %)))
          (|all_kers0| (|List| (|Kernel| %))) (|apars| (|List| (|Kernel| %)))
          (|cl| (|List| %)))
         (SEQ
          (COND ((SPADCALL |p| (|spadConstant| % 440) (QREFELT % 490)) |q|)
                ((EQL (SPADCALL |p| (QREFELT % 436)) 0) (|spadConstant| % 491))
                ((SPADCALL |q| (|spadConstant| % 440) (QREFELT % 490)) |p|)
                (#19='T
                 (COND
                  ((EQL (SPADCALL |q| (QREFELT % 436)) 0)
                   (|spadConstant| % 491))
                  (#19#
                   (SEQ
                    (COND
                     ((|EXPR;noalg?| |p| %)
                      (COND
                       ((|EXPR;noalg?| |q| %)
                        (EXIT (SPADCALL |p| |q| (QREFELT % 492)))))))
                    (LETT |cl|
                          (SPADCALL (SPADCALL |p| (QREFELT % 447))
                                    (SPADCALL |q| (QREFELT % 447))
                                    (QREFELT % 493)))
                    (LETT |akers| (SPADCALL |cl| (QREFELT % 494)))
                    (LETT |apars| (|EXPR;algpars| |akers| %))
                    (LETT |all_kers0|
                          (SPADCALL (SPADCALL |cl| (QREFELT % 495)) |apars|
                                    (QREFELT % 496)))
                    (LETT |akers| (REVERSE (SPADCALL |akers| (QREFELT % 497))))
                    (LETT |all_syms0|
                          (PROGN
                           (LETT #18# NIL)
                           (SEQ (LETT |k| NIL) (LETT #17# |all_kers0|) G190
                                (COND
                                 ((OR (ATOM #17#)
                                      (PROGN (LETT |k| (CAR #17#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #18#
                                        (CONS (SPADCALL (QREFELT % 498))
                                              #18#))))
                                (LETT #17# (CDR #17#)) (GO G190) G191
                                (EXIT (NREVERSE #18#)))))
                    (LETT |x| (SPADCALL (QREFELT % 498)))
                    (LETT |xk| (SPADCALL |x| (QREFELT % 30)))
                    (LETT |all_kers|
                          (SPADCALL |xk| |all_kers0| (QREFELT % 499)))
                    (LETT |all_syms| (CONS |x| |all_syms0|))
                    (LETT |lm|
                          (PROGN
                           (LETT #15# NIL)
                           (SEQ (LETT |k| NIL) (LETT #14# |akers|) G190
                                (COND
                                 ((OR (ATOM #14#)
                                      (PROGN (LETT |k| (CAR #14#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #15#
                                        (CONS (|EXPR;def_poly| |k| %) #15#))))
                                (LETT #14# (CDR #14#)) (GO G190) G191
                                (EXIT (NREVERSE #15#)))))
                    (LETT |a_syms|
                          (PROGN
                           (LETT #13# NIL)
                           (SEQ (LETT |k| NIL) (LETT #12# |akers|) G190
                                (COND
                                 ((OR (ATOM #12#)
                                      (PROGN (LETT |k| (CAR #12#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #13#
                                        (CONS
                                         (|EXPR;varmap1| |k| |all_kers|
                                          |all_syms| %)
                                         #13#))))
                                (LETT #12# (CDR #12#)) (GO G190) G191
                                (EXIT (NREVERSE #13#)))))
                    (LETT |p_syms|
                          (SPADCALL |all_syms0| |a_syms| (QREFELT % 500)))
                    (COND
                     ((|EXPR;trivial_denoms| |p| %)
                      (COND
                       ((|EXPR;trivial_denoms| |q| %)
                        (EXIT
                         (SEQ
                          (LETT |p1|
                                (|EXPR;SUP_to_PI| |p| |all_kers| |all_syms|
                                 |xk| %))
                          (LETT |q1|
                                (|EXPR;SUP_to_PI| |q| |all_kers| |all_syms|
                                 |xk| %))
                          (LETT |lm1|
                                (PROGN
                                 (LETT #10# NIL)
                                 (SEQ (LETT |k| NIL) (LETT #9# |akers|)
                                      (LETT |m| NIL) (LETT #8# |lm|) G190
                                      (COND
                                       ((OR (ATOM #8#)
                                            (PROGN (LETT |m| (CAR #8#)) NIL)
                                            (ATOM #9#)
                                            (PROGN (LETT |k| (CAR #9#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #10#
                                              (CONS
                                               (|EXPR;SUPP_to_PI| |m|
                                                |all_kers| |all_syms| |k| %)
                                               #10#))))
                                      (LETT #8#
                                            (PROG1 (CDR #8#)
                                              (LETT #9# (CDR #9#))))
                                      (GO G190) G191 (EXIT (NREVERSE #10#)))))
                          (LETT |a_syms|
                                (PROGN
                                 (LETT #7# NIL)
                                 (SEQ (LETT |k| NIL) (LETT #6# |akers|) G190
                                      (COND
                                       ((OR (ATOM #6#)
                                            (PROGN (LETT |k| (CAR #6#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #7#
                                              (CONS
                                               (|EXPR;varmap1| |k| |all_kers|
                                                |all_syms| %)
                                               #7#))))
                                      (LETT #6# (CDR #6#)) (GO G190) G191
                                      (EXIT (NREVERSE #7#)))))
                          (LETT |p_syms|
                                (SPADCALL |all_syms0| |a_syms|
                                          (QREFELT % 500)))
                          (LETT |g1|
                                (SPADCALL |p1| |q1| |lm1| |p_syms| |x| |a_syms|
                                          (QREFELT % 502)))
                          (EXIT
                           (|EXPR;PI_to_SUP| |g1| |all_kers| |all_syms| |xk|
                            %))))))))
                    (LETT |p2|
                          (|EXPR;SUP_to_PT| |p| |all_kers0| |all_syms0| |x| %))
                    (LETT |q2|
                          (|EXPR;SUP_to_PT| |q| |all_kers0| |all_syms0| |x| %))
                    (LETT |lm2|
                          (PROGN
                           (LETT #4# NIL)
                           (SEQ (LETT |k| NIL) (LETT #3# |akers|)
                                (LETT |m| NIL) (LETT #2# |lm|) G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |m| (CAR #2#)) NIL)
                                      (ATOM #3#)
                                      (PROGN (LETT |k| (CAR #3#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #4#
                                        (CONS
                                         (|EXPR;SUPP_to_PT| |m| |all_kers0|
                                          |all_syms0| |k| |x| %)
                                         #4#))))
                                (LETT #2#
                                      (PROG1 (CDR #2#) (LETT #3# (CDR #3#))))
                                (GO G190) G191 (EXIT (NREVERSE #4#)))))
                    (LETT |g2|
                          (SPADCALL |p2| |q2| |lm2| |p_syms| |x| |a_syms|
                                    (QREFELT % 505)))
                    (EXIT
                     (|EXPR;PI_to_SUP| |g2| |all_kers| |all_syms| |xk|
                      %)))))))))) 

(SDEFUN |EXPR;gcdPolynomial;3Sup;188|
        ((|p| #1=(|SparseUnivariatePolynomial| %)) (|q| #1#) (% #1#))
        (SEQ
         (COND
          ((|EXPR;noalg?| |p| %)
           (COND
            ((|EXPR;noalg?| |q| %)
             (EXIT (SPADCALL |p| |q| (QREFELT % 492)))))))
         (EXIT (SPADCALL |p| |q| (QREFELT % 508))))) 

(SDEFUN |EXPR;factorPolynomial;SupF;189|
        ((|x| (|SparseUnivariatePolynomial| %))
         (% (|Factored| (|SparseUnivariatePolynomial| %))))
        (SPADCALL |x| (QREFELT % 511))) 

(SDEFUN |EXPR;coerce;An%;190| ((|x| (|AlgebraicNumber|)) (% (%)))
        (SPADCALL (SPADCALL |x| (|spadConstant| % 515) (QREFELT % 516))
                  (QREFELT % 104))) 

(SDEFUN |EXPR;^;%F%;191| ((|x| (%)) (|r| (|Fraction| (|Integer|))) (% (%)))
        (SPADCALL |x| |r| (QREFELT % 520))) 

(SDEFUN |EXPR;minPoly;KSup;192|
        ((|k| (|Kernel| %)) (% (|SparseUnivariatePolynomial| %)))
        (SPADCALL |k| (QREFELT % 522))) 

(SDEFUN |EXPR;definingPolynomial;2%;193| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 523))) 

(SDEFUN |EXPR;retract;%F;194| ((|x| (%)) (% (|Fraction| (|Integer|))))
        (SPADCALL |x| (QREFELT % 525))) 

(SDEFUN |EXPR;retractIfCan;%U;195|
        ((|x| (%)) (% (|Union| (|Fraction| (|Integer|)) "failed")))
        (SPADCALL |x| (QREFELT % 527))) 

(SDEFUN |EXPR;cor1| ((|c| (|Integer|)) (% (R))) (SPADCALL |c| (QREFELT % 528))) 

(SDEFUN |EXPR;corR| ((|xe| (|Expression| (|Integer|))) (% (|Expression| R)))
        (SPADCALL (CONS (|function| |EXPR;cor1|) %) |xe| (QREFELT % 533))) 

(SDEFUN |EXPR;coerce;An%;198| ((|x| (|AlgebraicNumber|)) (% (%)))
        (|EXPR;corR| |x| %)) 

(SDEFUN |EXPR;retractIfCan;%U;199|
        ((|x| (%)) (% (|Union| (|AlgebraicNumber|) "failed")))
        (SPROG
         ((#1=#:G440 NIL) (|d| #2=(|Union| (|AlgebraicNumber|) "failed"))
          (|n| #2#))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |n| (|EXPR;smp2an| (SPADCALL |x| (QREFELT % 99)) %))
                 (EXIT
                  (COND
                   ((QEQCAR |n| 0)
                    (SEQ
                     (LETT |d|
                           (|EXPR;smp2an| (SPADCALL |x| (QREFELT % 101)) %))
                     (EXIT
                      (COND
                       ((QEQCAR |d| 0)
                        (PROGN
                         (LETT #1#
                               (CONS 0
                                     (SPADCALL (QCDR |n|) (QCDR |d|)
                                               (QREFELT % 534))))
                         (GO #3=#:G435))))))))))
            (EXIT (CONS 1 "failed"))))
          #3# (EXIT #1#)))) 

(SDEFUN |EXPR;R2AN| ((|r| (R)) (% (|Union| (|AlgebraicNumber|) "failed")))
        (SPROG ((|u| (|Union| (|Fraction| (|Integer|)) "failed")))
               (SEQ
                (LETT |u|
                      (SPADCALL (SPADCALL |r| (QREFELT % 537)) (QREFELT % 72)))
                (EXIT
                 (COND
                  ((QEQCAR |u| 0)
                   (CONS 0 (SPADCALL (QCDR |u|) (QREFELT % 538))))
                  ('T (CONS 1 "failed"))))))) 

(SDEFUN |EXPR;AN_op?| ((|op| (|BasicOperator|)) (% (|Boolean|)))
        (COND ((SPADCALL |op| (QREFELT % 8) (QREFELT % 28)) 'T)
              ('T (SPADCALL |op| (QREFELT % 24))))) 

(SDEFUN |EXPR;k2an|
        ((|k| (|Kernel| %)) (% (|Union| (|AlgebraicNumber|) "failed")))
        (SPROG
         ((|arg| (|List| (|AlgebraicNumber|))) (#1=#:G476 NIL)
          (|a| #2=(|Union| (|AlgebraicNumber|) #3="failed")) (#4=#:G477 NIL)
          (|x| NIL)
          (|eq|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| %))))
          (|eqa| (|SparseUnivariatePolynomial| (|AlgebraicNumber|)))
          (|ccu| #2#) (|cc| (%)) (|den1| (|AlgebraicNumber|)) (|denu| #2#)
          (|a1| (%)) (|s1| (|Symbol|)) (|s1u| (|Union| (|Symbol|) #3#))
          (|k1| (|Kernel| %)) (|k1u| (|Union| (|Kernel| %) #3#)) (|a2| (%))
          (|args| (|List| %)) (|op| (|BasicOperator|)))
         (SEQ
          (EXIT
           (COND
            ((NULL (|EXPR;AN_op?| (LETT |op| (SPADCALL |k| (QREFELT % 31))) %))
             (CONS 1 "failed"))
            ('T
             (COND
              ((SPADCALL |op| '|rootOf| (QREFELT % 539))
               (SEQ (LETT |args| (SPADCALL |k| (QREFELT % 79)))
                    (LETT |a2| (SPADCALL |args| 2 (QREFELT % 81)))
                    (LETT |k1u| (SPADCALL |a2| (QREFELT % 19)))
                    (EXIT
                     (COND ((QEQCAR |k1u| 1) (CONS 1 "failed"))
                           (#5='T
                            (SEQ (LETT |k1| (QCDR |k1u|))
                                 (LETT |s1u| (SPADCALL |a2| (QREFELT % 541)))
                                 (EXIT
                                  (COND ((QEQCAR |s1u| 1) (CONS 1 "failed"))
                                        (#5#
                                         (SEQ (LETT |s1| (QCDR |s1u|))
                                              (LETT |a1|
                                                    (SPADCALL |args| 1
                                                              (QREFELT % 81)))
                                              (LETT |denu|
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL |a1|
                                                                (QREFELT %
                                                                         101))
                                                      (QREFELT % 104))
                                                     (QREFELT % 536)))
                                              (EXIT
                                               (COND
                                                ((QEQCAR |denu| 1)
                                                 (|error|
                                                  "Bad argument to rootOf"))
                                                (#5#
                                                 (SEQ
                                                  (LETT |den1| (QCDR |denu|))
                                                  (LETT |eq|
                                                        (SPADCALL
                                                         (SPADCALL |a1|
                                                                   (QREFELT %
                                                                            99))
                                                         |k1| (QREFELT % 119)))
                                                  (LETT |eqa|
                                                        (|spadConstant| % 543))
                                                  (SEQ G190
                                                       (COND
                                                        ((NULL
                                                          (SPADCALL |eq|
                                                                    (|spadConstant|
                                                                     % 544)
                                                                    (QREFELT %
                                                                             545)))
                                                         (GO G191)))
                                                       (SEQ
                                                        (LETT |cc|
                                                              (SPADCALL
                                                               (SPADCALL |eq|
                                                                         (QREFELT
                                                                          %
                                                                          121))
                                                               (QREFELT %
                                                                        104)))
                                                        (LETT |ccu|
                                                              (SPADCALL |cc|
                                                                        (QREFELT
                                                                         %
                                                                         536)))
                                                        (EXIT
                                                         (COND
                                                          ((QEQCAR |ccu| 1)
                                                           (PROGN
                                                            (LETT #1#
                                                                  (CONS 1
                                                                        "failed"))
                                                            (GO #6=#:G475)))
                                                          ('T
                                                           (SEQ
                                                            (LETT |eqa|
                                                                  (SPADCALL
                                                                   |eqa|
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     (QCDR
                                                                      |ccu|)
                                                                     |den1|
                                                                     (QREFELT %
                                                                              534))
                                                                    (SPADCALL
                                                                     |eq|
                                                                     (QREFELT %
                                                                              546))
                                                                    (QREFELT %
                                                                             547))
                                                                   (QREFELT %
                                                                            548)))
                                                            (EXIT
                                                             (LETT |eq|
                                                                   (SPADCALL
                                                                    |eq|
                                                                    (QREFELT %
                                                                             122)))))))))
                                                       NIL (GO G190) G191
                                                       (EXIT NIL))
                                                  (EXIT
                                                   (CONS 0
                                                         (SPADCALL |eqa| |s1|
                                                                   (QREFELT %
                                                                            549))))))))))))))))))
              (#5#
               (SEQ (LETT |arg| NIL)
                    (SEQ (LETT |x| NIL)
                         (LETT #4# (SPADCALL |k| (QREFELT % 79))) G190
                         (COND
                          ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#)) NIL))
                           (GO G191)))
                         (SEQ (LETT |a| (SPADCALL |x| (QREFELT % 536)))
                              (EXIT
                               (COND
                                ((QEQCAR |a| 1)
                                 (PROGN (LETT #1# (CONS 1 "failed")) (GO #6#)))
                                ('T (LETT |arg| (CONS (QCDR |a|) |arg|))))))
                         (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (CONS 0
                           (SPADCALL (SPADCALL |op| (QREFELT % 550))
                                     (NREVERSE |arg|) (QREFELT % 551))))))))))
          #6# (EXIT #1#)))) 

(SDEFUN |EXPR;smp2an|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| %)))
         (% (|Union| (|AlgebraicNumber|) #1="failed")))
        (SPROG
         ((|c| (|Union| (|AlgebraicNumber|) #1#))
          (|up|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| %))))
          (|ans| (|AlgebraicNumber|)) (#2=#:G493 NIL)
          (|t| (|Union| (|AlgebraicNumber|) "failed")) (|k| (|Kernel| %))
          (|x1| (|Union| (|Kernel| %) "failed")))
         (SEQ
          (EXIT
           (SEQ (LETT |x1| (SPADCALL |p| (QREFELT % 553)))
                (EXIT
                 (COND
                  ((QEQCAR |x1| 1)
                   (|EXPR;R2AN| (SPADCALL |p| (QREFELT % 554)) %))
                  (#3='T
                   (SEQ
                    (LETT |up|
                          (SPADCALL |p| (LETT |k| (QCDR |x1|))
                                    (QREFELT % 119)))
                    (LETT |t| (|EXPR;k2an| |k| %))
                    (EXIT
                     (COND ((QEQCAR |t| 1) (CONS 1 "failed"))
                           (#3#
                            (SEQ (LETT |ans| (|spadConstant| % 555))
                                 (SEQ G190
                                      (COND
                                       ((NULL
                                         (NULL
                                          (SPADCALL |up| (QREFELT % 556))))
                                        (GO G191)))
                                      (SEQ
                                       (LETT |c|
                                             (|EXPR;smp2an|
                                              (SPADCALL |up| (QREFELT % 121))
                                              %))
                                       (EXIT
                                        (COND
                                         ((QEQCAR |c| 1)
                                          (PROGN
                                           (LETT #2# (CONS 1 "failed"))
                                           (GO #4=#:G492)))
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
                                                                        % 546))
                                                                      (QREFELT
                                                                       % 557))
                                                                     (QREFELT %
                                                                              558))
                                                           (QREFELT % 559)))
                                           (EXIT
                                            (LETT |up|
                                                  (SPADCALL |up|
                                                            (QREFELT %
                                                                     122)))))))))
                                      NIL (GO G190) G191 (EXIT NIL))
                                 (LETT |c|
                                       (|EXPR;smp2an|
                                        (SPADCALL |up| (QREFELT % 121)) %))
                                 (EXIT
                                  (COND ((QEQCAR |c| 1) (CONS 1 "failed"))
                                        (#3#
                                         (CONS 0
                                               (SPADCALL |ans| (QCDR |c|)
                                                         (QREFELT %
                                                                  559))))))))))))))))
          #4# (EXIT #2#)))) 

(SDEFUN |EXPR;convert;%If;204| ((|x| (%)) (% (|InputForm|)))
        (SPADCALL |x| (QREFELT % 561))) 

(SDEFUN |EXPR;eval;%Bo%S%;205|
        ((|f| (%)) (|op| (|BasicOperator|)) (|g| (%)) (|x| (|Symbol|)) (% (%)))
        (SPADCALL |f| (LIST |op|) (LIST |g|) |x| (QREFELT % 564))) 

(SDEFUN |EXPR;eval;%LLS%;206|
        ((|f| (%)) (|ls| (|List| (|BasicOperator|))) (|lg| (|List| %))
         (|x| (|Symbol|)) (% (%)))
        (SPROG
         ((|res| (%)) (#1=#:G531 NIL) (|g| NIL) (#2=#:G530 NIL)
          (|nlg| (|List| %)) (#3=#:G529 NIL) (#4=#:G528 NIL)
          (|lbackwardSubs| (|List| (|Equation| %))) (#5=#:G526 NIL) (|i| NIL)
          (#6=#:G527 NIL) (|j| NIL) (#7=#:G525 NIL)
          (|lforwardSubs| (|List| (|Equation| %))) (#8=#:G523 NIL)
          (#9=#:G524 NIL) (#10=#:G522 NIL) (|ns| (|List| (|Symbol|)))
          (#11=#:G521 NIL) (#12=#:G520 NIL) (#13=#:G519 NIL) (#14=#:G518 NIL)
          (|lsd| (|List| (|Symbol|))) (|lsym| (|List| (|Symbol|)))
          (|llsym| (|List| (|List| (|Symbol|)))) (#15=#:G517 NIL)
          (#16=#:G516 NIL))
         (SEQ
          (LETT |llsym|
                (PROGN
                 (LETT #16# NIL)
                 (SEQ (LETT |g| NIL) (LETT #15# |lg|) G190
                      (COND
                       ((OR (ATOM #15#) (PROGN (LETT |g| (CAR #15#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #16#
                              (CONS (SPADCALL |g| (QREFELT % 566)) #16#))))
                      (LETT #15# (CDR #15#)) (GO G190) G191
                      (EXIT (NREVERSE #16#)))))
          (LETT |lsym|
                (SPADCALL (SPADCALL |llsym| (QREFELT % 567)) (QREFELT % 568)))
          (LETT |lsd| (SPADCALL (ELT % 569) |lsym| (QREFELT % 571)))
          (EXIT
           (COND
            ((NULL |lsd|)
             (SPADCALL |f| |ls|
                       (PROGN
                        (LETT #14# NIL)
                        (SEQ (LETT |g| NIL) (LETT #13# |lg|) G190
                             (COND
                              ((OR (ATOM #13#)
                                   (PROGN (LETT |g| (CAR #13#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #14#
                                     (CONS (SPADCALL |g| |x| (QREFELT % 573))
                                           #14#))))
                             (LETT #13# (CDR #13#)) (GO G190) G191
                             (EXIT (NREVERSE #14#))))
                       (QREFELT % 576)))
            ('T
             (SEQ
              (LETT |ns|
                    (PROGN
                     (LETT #12# NIL)
                     (SEQ (LETT |i| NIL) (LETT #11# |lsd|) G190
                          (COND
                           ((OR (ATOM #11#) (PROGN (LETT |i| (CAR #11#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #12#
                                  (CONS (SPADCALL (QREFELT % 498)) #12#))))
                          (LETT #11# (CDR #11#)) (GO G190) G191
                          (EXIT (NREVERSE #12#)))))
              (LETT |lforwardSubs|
                    (PROGN
                     (LETT #10# NIL)
                     (SEQ (LETT |j| NIL) (LETT #9# |ns|) (LETT |i| NIL)
                          (LETT #8# |lsd|) G190
                          (COND
                           ((OR (ATOM #8#) (PROGN (LETT |i| (CAR #8#)) NIL)
                                (ATOM #9#) (PROGN (LETT |j| (CAR #9#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #10#
                                  (CONS
                                   (SPADCALL (SPADCALL |i| (QREFELT % 577))
                                             (SPADCALL |j| (QREFELT % 577))
                                             (QREFELT % 579))
                                   #10#))))
                          (LETT #8# (PROG1 (CDR #8#) (LETT #9# (CDR #9#))))
                          (GO G190) G191 (EXIT (NREVERSE #10#)))))
              (LETT |lbackwardSubs|
                    (PROGN
                     (LETT #7# NIL)
                     (SEQ (LETT |j| NIL) (LETT #6# |ns|) (LETT |i| NIL)
                          (LETT #5# |lsd|) G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |i| (CAR #5#)) NIL)
                                (ATOM #6#) (PROGN (LETT |j| (CAR #6#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7#
                                  (CONS
                                   (SPADCALL (SPADCALL |j| (QREFELT % 577))
                                             (SPADCALL |i| (QREFELT % 577))
                                             (QREFELT % 579))
                                   #7#))))
                          (LETT #5# (PROG1 (CDR #5#) (LETT #6# (CDR #6#))))
                          (GO G190) G191 (EXIT (NREVERSE #7#)))))
              (LETT |nlg|
                    (PROGN
                     (LETT #4# NIL)
                     (SEQ (LETT |g| NIL) (LETT #3# |lg|) G190
                          (COND
                           ((OR (ATOM #3#) (PROGN (LETT |g| (CAR #3#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS
                                   (SPADCALL |g| |lforwardSubs|
                                             (QREFELT % 581))
                                   #4#))))
                          (LETT #3# (CDR #3#)) (GO G190) G191
                          (EXIT (NREVERSE #4#)))))
              (LETT |res|
                    (SPADCALL |f| |ls|
                              (PROGN
                               (LETT #2# NIL)
                               (SEQ (LETT |g| NIL) (LETT #1# |nlg|) G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN (LETT |g| (CAR #1#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (SPADCALL |g| |x| (QREFELT % 573))
                                             #2#))))
                                    (LETT #1# (CDR #1#)) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT % 576)))
              (EXIT (SPADCALL |res| |lbackwardSubs| (QREFELT % 581)))))))))) 

(SDEFUN |EXPR;patternMatch;%P2Pmr;207|
        ((|x| (%)) (|p| (|Pattern| #1=(|Integer|)))
         (|l| (|PatternMatchResult| #1# . #2=(%)))
         (% (|PatternMatchResult| #1# . #2#)))
        (SPADCALL |x| |p| |l| (QREFELT % 585))) 

(SDEFUN |EXPR;patternMatch;%P2Pmr;208|
        ((|x| (%)) (|p| (|Pattern| #1=(|Float|)))
         (|l| (|PatternMatchResult| #1# . #2=(%)))
         (% (|PatternMatchResult| #1# . #2#)))
        (SPADCALL |x| |p| |l| (QREFELT % 591))) 

(SDEFUN |EXPR;Zero;%;209| ((% (%))) (|spadConstant| % 46)) 

(SDEFUN |EXPR;One;%;210| ((% (%))) (|spadConstant| % 48)) 

(SDEFUN |EXPR;-;2%;211| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 55))) 

(SDEFUN |EXPR;*;I2%;212| ((|n| (|Integer|)) (|x| (%)) (% (%)))
        (SPADCALL |n| |x| (QREFELT % 58))) 

(SDEFUN |EXPR;*;3%;213| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 62))) 

(SDEFUN |EXPR;+;3%;214| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 64))) 

(SDEFUN |EXPR;=;2%B;215| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 51))) 

(SDEFUN |EXPR;smaller?;2%B;216| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 94))) 

(PUT '|EXPR;numer;%Smp;217| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |EXPR;numer;%Smp;217|
        ((|x| (%)) (% (|SparseMultivariatePolynomial| R (|Kernel| %)))) |x|) 

(PUT '|EXPR;coerce;Smp%;218| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |EXPR;coerce;Smp%;218|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| %))) (% (%))) |p|) 

(SDEFUN |EXPR;coerce;P%;219| ((|p| (|Polynomial| R)) (% (%)))
        (|EXPR;poly_to_MP| |p| %)) 

(SDEFUN |EXPR;reducedSystem;MM;220| ((|m| (|Matrix| %)) (% (|Matrix| R)))
        (SPADCALL |m| (QREFELT % 594))) 

(SDEFUN |EXPR;reducedSystem;MVR;221|
        ((|m| (|Matrix| %)) (|v| (|Vector| %))
         (% (|Record| (|:| |mat| (|Matrix| R)) (|:| |vec| (|Vector| R)))))
        (SPADCALL |m| |v| (QREFELT % 595))) 

(SDEFUN |EXPR;convert;%If;222| ((|x| (%)) (% (|InputForm|)))
        (SPADCALL |x| (QREFELT % 561))) 

(SDEFUN |EXPR;kintmatch|
        ((|k| (|Kernel| %)) (|p| (|Pattern| (|Integer|)))
         (|l| (|PatternMatchResult| (|Integer|) |Rep|))
         (% (|PatternMatchResult| (|Integer|) |Rep|)))
        (SPADCALL |k| |p| |l| (QREFELT % 597))) 

(SDEFUN |EXPR;patternMatch;%P2Pmr;224|
        ((|x| (%)) (|p| (|Pattern| #1=(|Integer|)))
         (|l| (|PatternMatchResult| #1# . #2=(%)))
         (% (|PatternMatchResult| #1# . #2#)))
        (SPADCALL |x| |p| |l| (CONS (|function| |EXPR;kintmatch|) %)
                  (QREFELT % 601))) 

(SDEFUN |EXPR;kfltmatch|
        ((|k| (|Kernel| %)) (|p| (|Pattern| (|Float|)))
         (|l| (|PatternMatchResult| (|Float|) |Rep|))
         (% (|PatternMatchResult| (|Float|) |Rep|)))
        (SPADCALL |k| |p| |l| (QREFELT % 603))) 

(SDEFUN |EXPR;patternMatch;%P2Pmr;226|
        ((|x| (%)) (|p| (|Pattern| #1=(|Float|)))
         (|l| (|PatternMatchResult| #1# . #2=(%)))
         (% (|PatternMatchResult| #1# . #2#)))
        (SPADCALL |x| |p| |l| (CONS (|function| |EXPR;kfltmatch|) %)
                  (QREFELT % 607))) 

(SDEFUN |EXPR;Zero;%;227| ((% (%))) (|spadConstant| % 46)) 

(SDEFUN |EXPR;+;3%;228| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 64))) 

(SDEFUN |EXPR;=;2%B;229| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 51))) 

(SDEFUN |EXPR;smaller?;2%B;230| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 94))) 

(SDEFUN |EXPR;coerce;K%;231| ((|k| (|Kernel| %)) (% (%)))
        (SPADCALL 1 |k| (QREFELT % 608))) 

(SDEFUN |EXPR;kernels;%L;232| ((|x| (%)) (% (|List| (|Kernel| %))))
        (SPROG ((#1=#:G569 NIL) (|f| NIL) (#2=#:G568 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |f| NIL) (LETT #1# (SPADCALL |x| (QREFELT % 611)))
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QCAR |f|) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |EXPR;coerce;R%;233| ((|x| (R)) (% (%)))
        (COND ((SPADCALL |x| (QREFELT % 612)) (|spadConstant| % 47))
              ('T (SPADCALL (SPADCALL |x| (QREFELT % 613)) (QREFELT % 136))))) 

(SDEFUN |EXPR;retract;%R;234| ((|x| (%)) (% (R)))
        (COND ((SPADCALL |x| (QREFELT % 54)) (|spadConstant| % 87))
              ('T (|EXPR;retNotUnit| |x| %)))) 

(SDEFUN |EXPR;coerce;%Of;235| ((|x| (%)) (% (|OutputForm|)))
        (SPADCALL |x| (QREFELT % 615))) 

(SDEFUN |EXPR;kereval|
        ((|k| (|Kernel| %)) (|lk| (|List| (|Kernel| %))) (|lv| (|List| %))
         (% (%)))
        (SPROG NIL
               (SPADCALL |lk| |lv| |k|
                         (CONS #'|EXPR;kereval!1| (VECTOR |lk| |lv| %))
                         (QREFELT % 621)))) 

(SDEFUN |EXPR;kereval!1| ((|x2| NIL) ($$ NIL))
        (PROG (% |lv| |lk|)
          (LETT % (QREFELT $$ 2))
          (LETT |lv| (QREFELT $$ 1))
          (LETT |lk| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|EXPR;kereval!0| (VECTOR % |lv| |lk|))
                             |x2| (QREFELT % 618))))))) 

(SDEFUN |EXPR;kereval!0| ((|x1| NIL) ($$ NIL))
        (PROG (|lk| |lv| %)
          (LETT |lk| (QREFELT $$ 2))
          (LETT |lv| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x1| |lk| |lv| (QREFELT % 617)))))) 

(SDEFUN |EXPR;subeval|
        ((|k| (|Kernel| %)) (|lk| (|List| (|Kernel| %))) (|lv| (|List| %))
         (% (%)))
        (SPROG NIL
               (SEQ
                (SPADCALL |lk| |lv| |k|
                          (CONS #'|EXPR;subeval!0| (VECTOR |lv| |lk| %))
                          (QREFELT % 621))))) 

(SDEFUN |EXPR;subeval!0| ((|x| NIL) ($$ NIL))
        (PROG (% |lk| |lv|)
          (LETT % (QREFELT $$ 2))
          (LETT |lk| (QREFELT $$ 1))
          (LETT |lv| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G602 NIL) (|a| NIL) (#2=#:G601 NIL))
                   (SEQ
                    (SPADCALL (SPADCALL |x| (QREFELT % 31))
                              (PROGN
                               (LETT #2# NIL)
                               (SEQ (LETT |a| NIL)
                                    (LETT #1# (SPADCALL |x| (QREFELT % 79)))
                                    G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN (LETT |a| (CAR #1#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (SPADCALL |a| |lk| |lv|
                                                       (QREFELT % 622))
                                             #2#))))
                                    (LETT #1# (CDR #1#)) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT % 623)))))))) 

(SDEFUN |EXPR;isPlus;%U;238| ((|x| (%)) (% (|Union| (|List| %) "failed")))
        (SPROG
         ((#1=#:G618 NIL) (|t| NIL) (#2=#:G617 NIL)
          (|l|
           (|List| (|Record| (|:| |k| (|Kernel| %)) (|:| |c| (|Integer|))))))
         (SEQ
          (COND
           ((OR (NULL (LETT |l| (SPADCALL |x| (QREFELT % 611))))
                (NULL (CDR |l|)))
            (CONS 1 "failed"))
           ('T
            (CONS 0
                  (PROGN
                   (LETT #2# NIL)
                   (SEQ (LETT |t| NIL) (LETT #1# |l|) G190
                        (COND
                         ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS
                                 (SPADCALL (QCDR |t|) (QCAR |t|)
                                           (QREFELT % 608))
                                 #2#))))
                        (LETT #1# (CDR #1#)) (GO G190) G191
                        (EXIT (NREVERSE #2#)))))))))) 

(SDEFUN |EXPR;isMult;%U;239|
        ((|x| (%))
         (%
          (|Union| (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| %)))
                   "failed")))
        (SPROG
         ((|t| (|Record| (|:| |k| (|Kernel| %)) (|:| |c| (|Integer|))))
          (|l|
           (|List| (|Record| (|:| |k| (|Kernel| %)) (|:| |c| (|Integer|))))))
         (SEQ
          (COND
           ((OR (NULL (LETT |l| (SPADCALL |x| (QREFELT % 611))))
                (NULL (NULL (CDR |l|))))
            (CONS 1 "failed"))
           ('T
            (SEQ (LETT |t| (SPADCALL |l| (QREFELT % 626)))
                 (EXIT (CONS 0 (CONS (QCDR |t|) (QCAR |t|)))))))))) 

(SDEFUN |EXPR;eval;%LL%;240|
        ((|x| (%)) (|lk| (|List| (|Kernel| %))) (|lv| (|List| %)) (% (%)))
        (SPROG
         ((#1=#:G634 NIL) (#2=#:G633 (%)) (#3=#:G635 (%)) (#4=#:G637 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |t| NIL) (LETT #4# (SPADCALL |x| (QREFELT % 611))) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (QCDR |t|)
                                   (|EXPR;kereval| (QCAR |t|) |lk| |lv| %)
                                   (QREFELT % 58)))
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT % 65))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| % 47))))))) 

(SDEFUN |EXPR;subst;%LL%;241|
        ((|x| (%)) (|lk| (|List| (|Kernel| %))) (|lv| (|List| %)) (% (%)))
        (SPROG
         ((#1=#:G640 NIL) (#2=#:G639 (%)) (#3=#:G641 (%)) (#4=#:G643 NIL)
          (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |t| NIL) (LETT #4# (SPADCALL |x| (QREFELT % 611))) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (QCDR |t|)
                                   (|EXPR;subeval| (QCAR |t|) |lk| |lv| %)
                                   (QREFELT % 58)))
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT % 65))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| % 47))))))) 

(SDEFUN |EXPR;retractIfCan;%U;242| ((|x| (%)) (% (|Union| R "failed")))
        (COND ((SPADCALL |x| (QREFELT % 54)) (CONS 0 (|spadConstant| % 87)))
              ('T (|EXPR;retNotUnitIfCan| |x| %)))) 

(SDEFUN |EXPR;-;2%;243| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 55))) 

(SDEFUN |EXPR;smaller?;2%B;244| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 94))) 

(SDEFUN |EXPR;=;2%B;245| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 51))) 

(PUT '|EXPR;coerce;K%;246| '|SPADreplace| '(XLAM (|k|) |k|)) 

(SDEFUN |EXPR;coerce;K%;246| ((|k| (|Kernel| %)) (% (%))) |k|) 

(PUT '|EXPR;kernels;%L;247| '|SPADreplace| 'LIST) 

(SDEFUN |EXPR;kernels;%L;247| ((|x| (%)) (% (|List| (|Kernel| %)))) (LIST |x|)) 

(SDEFUN |EXPR;coerce;R%;248| ((|x| (R)) (% (%))) (SPADCALL |x| (QREFELT % 613))) 

(SDEFUN |EXPR;retract;%R;249| ((|x| (%)) (% (R))) (|EXPR;retNotUnit| |x| %)) 

(SDEFUN |EXPR;retractIfCan;%U;250| ((|x| (%)) (% (|Union| R "failed")))
        (|EXPR;retNotUnitIfCan| |x| %)) 

(SDEFUN |EXPR;coerce;%Of;251| ((|x| (%)) (% (|OutputForm|)))
        (SPADCALL |x| (QREFELT % 615))) 

(SDEFUN |EXPR;eval;%LL%;252|
        ((|x| (%)) (|lk| (|List| (|Kernel| %))) (|lv| (|List| %)) (% (%)))
        (SPROG NIL
               (SPADCALL |lk| |lv| |x|
                         (CONS #'|EXPR;eval;%LL%;252!1| (VECTOR |lk| |lv| %))
                         (QREFELT % 621)))) 

(SDEFUN |EXPR;eval;%LL%;252!1| ((|x1| NIL) ($$ NIL))
        (PROG (% |lv| |lk|)
          (LETT % (QREFELT $$ 2))
          (LETT |lv| (QREFELT $$ 1))
          (LETT |lk| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL
                    (CONS #'|EXPR;eval;%LL%;252!0| (VECTOR % |lv| |lk|)) |x1|
                    (QREFELT % 618))))))) 

(SDEFUN |EXPR;eval;%LL%;252!0| ((|x2| NIL) ($$ NIL))
        (PROG (|lk| |lv| %)
          (LETT |lk| (QREFELT $$ 2))
          (LETT |lv| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x2| |lk| |lv| (QREFELT % 617)))))) 

(SDEFUN |EXPR;subst;%LL%;253|
        ((|x| (%)) (|lk| (|List| (|Kernel| %))) (|lv| (|List| %)) (% (%)))
        (SPROG NIL
               (SEQ
                (SPADCALL |lk| |lv| |x|
                          (CONS #'|EXPR;subst;%LL%;253!0| (VECTOR |lv| |lk| %))
                          (QREFELT % 621))))) 

(SDEFUN |EXPR;subst;%LL%;253!0| ((|x1| NIL) ($$ NIL))
        (PROG (% |lk| |lv|)
          (LETT % (QREFELT $$ 2))
          (LETT |lk| (QREFELT $$ 1))
          (LETT |lv| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G688 NIL) (|a| NIL) (#2=#:G687 NIL))
                   (SEQ
                    (SPADCALL (SPADCALL |x1| (QREFELT % 31))
                              (PROGN
                               (LETT #2# NIL)
                               (SEQ (LETT |a| NIL)
                                    (LETT #1# (SPADCALL |x1| (QREFELT % 79)))
                                    G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN (LETT |a| (CAR #1#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (SPADCALL |a| |lk| |lv|
                                                       (QREFELT % 622))
                                             #2#))))
                                    (LETT #1# (CDR #1#)) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT % 623)))))))) 

(SDEFUN |EXPR;convert;%If;254| ((|x| (%)) (% (|InputForm|)))
        (SPADCALL |x| (QREFELT % 561))) 

(DECLAIM (NOTINLINE |Expression;|)) 

(DEFUN |Expression;| (|#1|)
  (SPROG
   ((#1=#:G734 NIL) (|pv$| NIL) (#2=#:G729 NIL) (#3=#:G730 NIL) (#4=#:G731 NIL)
    (#5=#:G732 NIL) (#6=#:G733 NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|Expression| DV$1))
    (LETT % (GETREFV 662))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
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
                                        (LETT #6#
                                              (|HasCategory| |#1| '(|Ring|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #6#)
                                        (|HasCategory| |#1| '(|Group|))
                                        (OR (|HasCategory| |#1| '(|Group|))
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))
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
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))
                                          (|HasCategory| (|Integer|)
                                                         '(|AbelianGroup|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          #6#
                                          (|HasCategory| (|Integer|)
                                                         '(|AbelianGroup|)))
                                         (|HasCategory| |#1|
                                                        '(|AbelianGroup|)))
                                        (|HasCategory| |#1| '(|SemiGroup|))
                                        (OR (|HasCategory| |#1| '(|Group|))
                                            (|HasCategory| |#1|
                                                           '(|SemiGroup|)))
                                        (OR (|HasCategory| |#1| '(|Group|))
                                            #6#)
                                        (LETT #5#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#1|
                                                              '(|IntegralDomain|))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #5#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #6#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          #6#
                                          (|HasCategory| (|Integer|)
                                                         '(|AbelianGroup|)))
                                         (|HasCategory| |#1|
                                                        '(|AbelianGroup|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Integer|)))
                                         #6#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|)))
                                        (LETT #4#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|)))
                                         #4#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #3#)
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|AbelianSemiGroup|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))
                                          (|HasCategory| (|Integer|)
                                                         '(|AbelianGroup|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))
                                          (|HasCategory| (|Integer|)
                                                         '(|AbelianMonoid|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          #6#
                                          (|HasCategory| (|Integer|)
                                                         '(|AbelianGroup|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          #6#
                                          (|HasCategory| (|Integer|)
                                                         '(|AbelianMonoid|)))
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #2#)
                                        (OR
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
                                         #6#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          #6#
                                          (|HasCategory| (|Integer|)
                                                         '(|AbelianMonoid|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|AbelianMonoid|))
                                          #6#)
                                         #2#
                                         (|HasCategory| |#1| '(|SemiGroup|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          #6#
                                          (|HasCategory| (|Integer|)
                                                         '(|AbelianMonoid|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|AbelianMonoid|))
                                          #6#)
                                         #2#)))))
    (|haddProp| |$ConstructorCache| '|Expression| (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| % '(|RetractableTo| (|Integer|)))
         (|augmentPredVector| % 8589934592))
    (AND (|HasCategory| % '(|Ring|)) (|augmentPredVector| % 17179869184))
    (AND (|HasCategory| |#1| '(|IntegralDomain|))
         (|HasCategory| % '(|RetractableTo| (|Integer|)))
         (|augmentPredVector| % 34359738368))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| % '(|CharacteristicNonZero|))))
     (|augmentPredVector| % 68719476736))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| % 137438953472))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 7 '|%symbol|)
    (QSETREFV % 8 '|%alg|)
    (COND ((|testBitVector| |pv$| 1))
          ('T
           (QSETREFV % 37
                     (CONS (|dispatchFunction| |EXPR;operator;2Bo;4|) %))))
    (COND
     ((|testBitVector| |pv$| 5)
      (PROGN
       (COND
        ((|testBitVector| |pv$| 1)
         (PROGN
          (QSETREFV % 45
                    (|Fraction|
                     (|SparseMultivariatePolynomial| |#1| (|Kernel| %))))
          (QSETREFV % 47
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |EXPR;Zero;%;6|) % 47)))
          (QSETREFV % 49
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |EXPR;One;%;7|) % 49)))
          (QSETREFV % 52 (CONS (|dispatchFunction| |EXPR;one?;%B;8|) %))
          (QSETREFV % 54 (CONS (|dispatchFunction| |EXPR;zero?;%B;9|) %))
          (QSETREFV % 56 (CONS (|dispatchFunction| |EXPR;-;2%;10|) %))
          (QSETREFV % 59 (CONS (|dispatchFunction| |EXPR;*;I2%;11|) %))
          (QSETREFV % 61 (CONS (|dispatchFunction| |EXPR;coerce;I%;12|) %))
          (QSETREFV % 63 (CONS (|dispatchFunction| |EXPR;*;3%;13|) %))
          (QSETREFV % 65 (CONS (|dispatchFunction| |EXPR;+;3%;14|) %))
          (QSETREFV % 67 (CONS (|dispatchFunction| |EXPR;-;3%;15|) %))
          (QSETREFV % 69 (CONS (|dispatchFunction| |EXPR;/;3%;16|) %))
          (QSETREFV % 73 (CONS (|dispatchFunction| |EXPR;number?;%B;17|) %))
          (QSETREFV % 90 (CONS (|dispatchFunction| |EXPR;^;%Nni%;19|) %))
          (QSETREFV % 91 (CONS (|dispatchFunction| |EXPR;^;%I%;20|) %))
          (QSETREFV % 93 (CONS (|dispatchFunction| |EXPR;^;%Pi%;21|) %))
          (QSETREFV % 95 (CONS (|dispatchFunction| |EXPR;smaller?;2%B;22|) %))
          (QSETREFV % 96 (CONS (|dispatchFunction| |EXPR;=;2%B;23|) %))
          (QSETREFV % 99 (CONS (|dispatchFunction| |EXPR;numer;%Smp;24|) %))
          (QSETREFV % 101 (CONS (|dispatchFunction| |EXPR;denom;%Smp;25|) %))
          (QSETREFV % 102
                    (|Record|
                     (|:| |num|
                          (|SparseMultivariatePolynomial| |#1| (|Kernel| %)))
                     (|:| |den|
                          (|SparseMultivariatePolynomial| |#1| (|Kernel| %)))))
          (QSETREFV % 104 (CONS (|dispatchFunction| |EXPR;coerce;Smp%;26|) %))
          (QSETREFV % 106 (CONS (|dispatchFunction| |EXPR;coerce;P%;27|) %))
          (QSETREFV % 110 (CONS (|dispatchFunction| |EXPR;coerce;F%;28|) %))
          (QSETREFV % 111 (CONS (|dispatchFunction| |EXPR;reduce;2%;29|) %))
          (DEFVAR |algreduc_flag| 'NIL)
          (QSETREFV % 127
                    (CONS
                     (|dispatchFunction| |EXPR;getSimplifyDenomsFlag;B;35|) %))
          (QSETREFV % 128
                    (CONS
                     (|dispatchFunction| |EXPR;setSimplifyDenomsFlag;2B;36|)
                     %))
          (QSETREFV % 139 (CONS (|dispatchFunction| |EXPR;/;2Smp%;38|) %))
          (QSETREFV % 148
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MM;39|) %))
          (QSETREFV % 156
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MVR;40|) %))
          (QSETREFV % 161 (CONS (|dispatchFunction| |EXPR;rootOf;SupS%;42|) %))
          (QSETREFV % 163
                    (CONS (|dispatchFunction| |EXPR;rootSum;%SupS%;43|) %))
          (QSETREFV % 166 (CONS (|dispatchFunction| |EXPR;pi;%;44|) %))
          (QSETREFV % 168 (CONS (|dispatchFunction| |EXPR;exp;2%;45|) %))
          (QSETREFV % 170 (CONS (|dispatchFunction| |EXPR;log;2%;46|) %))
          (QSETREFV % 172 (CONS (|dispatchFunction| |EXPR;sin;2%;47|) %))
          (QSETREFV % 174 (CONS (|dispatchFunction| |EXPR;cos;2%;48|) %))
          (QSETREFV % 176 (CONS (|dispatchFunction| |EXPR;tan;2%;49|) %))
          (QSETREFV % 178 (CONS (|dispatchFunction| |EXPR;cot;2%;50|) %))
          (QSETREFV % 180 (CONS (|dispatchFunction| |EXPR;sec;2%;51|) %))
          (QSETREFV % 182 (CONS (|dispatchFunction| |EXPR;csc;2%;52|) %))
          (QSETREFV % 184 (CONS (|dispatchFunction| |EXPR;asin;2%;53|) %))
          (QSETREFV % 186 (CONS (|dispatchFunction| |EXPR;acos;2%;54|) %))
          (QSETREFV % 188 (CONS (|dispatchFunction| |EXPR;atan;2%;55|) %))
          (QSETREFV % 190 (CONS (|dispatchFunction| |EXPR;acot;2%;56|) %))
          (QSETREFV % 192 (CONS (|dispatchFunction| |EXPR;asec;2%;57|) %))
          (QSETREFV % 194 (CONS (|dispatchFunction| |EXPR;acsc;2%;58|) %))
          (QSETREFV % 196 (CONS (|dispatchFunction| |EXPR;sinh;2%;59|) %))
          (QSETREFV % 198 (CONS (|dispatchFunction| |EXPR;cosh;2%;60|) %))
          (QSETREFV % 200 (CONS (|dispatchFunction| |EXPR;tanh;2%;61|) %))
          (QSETREFV % 202 (CONS (|dispatchFunction| |EXPR;coth;2%;62|) %))
          (QSETREFV % 204 (CONS (|dispatchFunction| |EXPR;sech;2%;63|) %))
          (QSETREFV % 206 (CONS (|dispatchFunction| |EXPR;csch;2%;64|) %))
          (QSETREFV % 208 (CONS (|dispatchFunction| |EXPR;asinh;2%;65|) %))
          (QSETREFV % 210 (CONS (|dispatchFunction| |EXPR;acosh;2%;66|) %))
          (QSETREFV % 212 (CONS (|dispatchFunction| |EXPR;atanh;2%;67|) %))
          (QSETREFV % 214 (CONS (|dispatchFunction| |EXPR;acoth;2%;68|) %))
          (QSETREFV % 216 (CONS (|dispatchFunction| |EXPR;asech;2%;69|) %))
          (QSETREFV % 218 (CONS (|dispatchFunction| |EXPR;acsch;2%;70|) %))
          (QSETREFV % 221 (CONS (|dispatchFunction| |EXPR;abs;2%;71|) %))
          (QSETREFV % 223 (CONS (|dispatchFunction| |EXPR;sign;2%;72|) %))
          (QSETREFV % 225 (CONS (|dispatchFunction| |EXPR;unitStep;2%;73|) %))
          (QSETREFV % 227 (CONS (|dispatchFunction| |EXPR;ceiling;2%;74|) %))
          (QSETREFV % 229 (CONS (|dispatchFunction| |EXPR;floor;2%;75|) %))
          (QSETREFV % 231
                    (CONS (|dispatchFunction| |EXPR;fractionPart;2%;76|) %))
          (QSETREFV % 233
                    (CONS (|dispatchFunction| |EXPR;diracDelta;2%;77|) %))
          (QSETREFV % 235 (CONS (|dispatchFunction| |EXPR;conjugate;2%;78|) %))
          (QSETREFV % 237 (CONS (|dispatchFunction| |EXPR;Gamma;2%;79|) %))
          (QSETREFV % 239 (CONS (|dispatchFunction| |EXPR;Gamma;3%;80|) %))
          (QSETREFV % 241 (CONS (|dispatchFunction| |EXPR;Beta;3%;81|) %))
          (QSETREFV % 243 (CONS (|dispatchFunction| |EXPR;Beta;4%;82|) %))
          (QSETREFV % 245 (CONS (|dispatchFunction| |EXPR;digamma;2%;83|) %))
          (QSETREFV % 247 (CONS (|dispatchFunction| |EXPR;polygamma;3%;84|) %))
          (QSETREFV % 249 (CONS (|dispatchFunction| |EXPR;besselJ;3%;85|) %))
          (QSETREFV % 251 (CONS (|dispatchFunction| |EXPR;besselY;3%;86|) %))
          (QSETREFV % 253 (CONS (|dispatchFunction| |EXPR;besselI;3%;87|) %))
          (QSETREFV % 255 (CONS (|dispatchFunction| |EXPR;besselK;3%;88|) %))
          (QSETREFV % 257 (CONS (|dispatchFunction| |EXPR;airyAi;2%;89|) %))
          (QSETREFV % 259
                    (CONS (|dispatchFunction| |EXPR;airyAiPrime;2%;90|) %))
          (QSETREFV % 261 (CONS (|dispatchFunction| |EXPR;airyBi;2%;91|) %))
          (QSETREFV % 263
                    (CONS (|dispatchFunction| |EXPR;airyBiPrime;2%;92|) %))
          (QSETREFV % 265 (CONS (|dispatchFunction| |EXPR;lambertW;2%;93|) %))
          (QSETREFV % 267 (CONS (|dispatchFunction| |EXPR;polylog;3%;94|) %))
          (QSETREFV % 269
                    (CONS (|dispatchFunction| |EXPR;weierstrassP;4%;95|) %))
          (QSETREFV % 271
                    (CONS (|dispatchFunction| |EXPR;weierstrassPPrime;4%;96|)
                          %))
          (QSETREFV % 273
                    (CONS (|dispatchFunction| |EXPR;weierstrassSigma;4%;97|)
                          %))
          (QSETREFV % 275
                    (CONS (|dispatchFunction| |EXPR;weierstrassZeta;4%;98|) %))
          (QSETREFV % 277
                    (CONS (|dispatchFunction| |EXPR;weierstrassPInverse;4%;99|)
                          %))
          (QSETREFV % 279
                    (CONS (|dispatchFunction| |EXPR;whittakerM;4%;100|) %))
          (QSETREFV % 281
                    (CONS (|dispatchFunction| |EXPR;whittakerW;4%;101|) %))
          (QSETREFV % 283 (CONS (|dispatchFunction| |EXPR;angerJ;3%;102|) %))
          (QSETREFV % 285 (CONS (|dispatchFunction| |EXPR;weberE;3%;103|) %))
          (QSETREFV % 287 (CONS (|dispatchFunction| |EXPR;struveH;3%;104|) %))
          (QSETREFV % 289 (CONS (|dispatchFunction| |EXPR;struveL;3%;105|) %))
          (QSETREFV % 291 (CONS (|dispatchFunction| |EXPR;hankelH1;3%;106|) %))
          (QSETREFV % 293 (CONS (|dispatchFunction| |EXPR;hankelH2;3%;107|) %))
          (QSETREFV % 295 (CONS (|dispatchFunction| |EXPR;lommelS1;4%;108|) %))
          (QSETREFV % 297 (CONS (|dispatchFunction| |EXPR;lommelS2;4%;109|) %))
          (QSETREFV % 299 (CONS (|dispatchFunction| |EXPR;kummerM;4%;110|) %))
          (QSETREFV % 301 (CONS (|dispatchFunction| |EXPR;kummerU;4%;111|) %))
          (QSETREFV % 303
                    (CONS (|dispatchFunction| |EXPR;legendreP;4%;112|) %))
          (QSETREFV % 305
                    (CONS (|dispatchFunction| |EXPR;legendreQ;4%;113|) %))
          (QSETREFV % 307
                    (CONS (|dispatchFunction| |EXPR;kelvinBei;3%;114|) %))
          (QSETREFV % 309
                    (CONS (|dispatchFunction| |EXPR;kelvinBer;3%;115|) %))
          (QSETREFV % 311
                    (CONS (|dispatchFunction| |EXPR;kelvinKei;3%;116|) %))
          (QSETREFV % 313
                    (CONS (|dispatchFunction| |EXPR;kelvinKer;3%;117|) %))
          (QSETREFV % 315
                    (CONS (|dispatchFunction| |EXPR;ellipticK;2%;118|) %))
          (QSETREFV % 317
                    (CONS (|dispatchFunction| |EXPR;ellipticE;2%;119|) %))
          (QSETREFV % 319
                    (CONS (|dispatchFunction| |EXPR;ellipticE;3%;120|) %))
          (QSETREFV % 321
                    (CONS (|dispatchFunction| |EXPR;ellipticF;3%;121|) %))
          (QSETREFV % 323
                    (CONS (|dispatchFunction| |EXPR;ellipticPi;4%;122|) %))
          (QSETREFV % 325 (CONS (|dispatchFunction| |EXPR;jacobiSn;3%;123|) %))
          (QSETREFV % 327 (CONS (|dispatchFunction| |EXPR;jacobiCn;3%;124|) %))
          (QSETREFV % 329 (CONS (|dispatchFunction| |EXPR;jacobiDn;3%;125|) %))
          (QSETREFV % 331
                    (CONS (|dispatchFunction| |EXPR;jacobiZeta;3%;126|) %))
          (QSETREFV % 333
                    (CONS (|dispatchFunction| |EXPR;jacobiTheta;3%;127|) %))
          (QSETREFV % 335 (CONS (|dispatchFunction| |EXPR;lerchPhi;4%;128|) %))
          (QSETREFV % 337
                    (CONS (|dispatchFunction| |EXPR;riemannZeta;2%;129|) %))
          (QSETREFV % 339
                    (CONS (|dispatchFunction| |EXPR;charlierC;4%;130|) %))
          (QSETREFV % 341 (CONS (|dispatchFunction| |EXPR;hahn_p;6%;131|) %))
          (QSETREFV % 343 (CONS (|dispatchFunction| |EXPR;hahnQ;6%;132|) %))
          (QSETREFV % 345 (CONS (|dispatchFunction| |EXPR;hahnR;6%;133|) %))
          (QSETREFV % 347 (CONS (|dispatchFunction| |EXPR;hahnS;6%;134|) %))
          (QSETREFV % 349 (CONS (|dispatchFunction| |EXPR;hermiteH;3%;135|) %))
          (QSETREFV % 351
                    (CONS (|dispatchFunction| |EXPR;krawtchoukK;5%;136|) %))
          (QSETREFV % 353 (CONS (|dispatchFunction| |EXPR;jacobiP;5%;137|) %))
          (QSETREFV % 355
                    (CONS (|dispatchFunction| |EXPR;laguerreL;4%;138|) %))
          (QSETREFV % 357 (CONS (|dispatchFunction| |EXPR;meixnerM;5%;139|) %))
          (QSETREFV % 359 (CONS (|dispatchFunction| |EXPR;meixnerP;5%;140|) %))
          (QSETREFV % 361 (CONS (|dispatchFunction| |EXPR;racahR;7%;141|) %))
          (QSETREFV % 363 (CONS (|dispatchFunction| |EXPR;wilsonW;7%;142|) %))
          (COND
           ((|testBitVector| |pv$| 34)
            (PROGN
             (QSETREFV % 366
                       (CONS
                        (|dispatchFunction| |EXPR;hypergeometricF;2L2%;143|)
                        (|getDomainView| % '(|RetractableTo| (|Integer|)))))
             (QSETREFV % 368
                       (CONS (|dispatchFunction| |EXPR;meijerG;4L2%;144|)
                             (|getDomainView| %
                                              '(|RetractableTo|
                                                (|Integer|))))))))
          (QSETREFV % 84 (CONS (|dispatchFunction| |EXPR;^;3%;145|) %))
          (QSETREFV % 372
                    (CONS (|dispatchFunction| |EXPR;factorial;2%;146|) %))
          (QSETREFV % 374 (CONS (|dispatchFunction| |EXPR;binomial;3%;147|) %))
          (QSETREFV % 376
                    (CONS (|dispatchFunction| |EXPR;permutation;3%;148|) %))
          (QSETREFV % 378
                    (CONS (|dispatchFunction| |EXPR;factorials;2%;149|) %))
          (QSETREFV % 380
                    (CONS (|dispatchFunction| |EXPR;factorials;%S%;150|) %))
          (QSETREFV % 382
                    (CONS (|dispatchFunction| |EXPR;summation;%S%;151|) %))
          (QSETREFV % 386
                    (CONS (|dispatchFunction| |EXPR;summation;%Sb%;152|) %))
          (QSETREFV % 388 (CONS (|dispatchFunction| |EXPR;product;%S%;153|) %))
          (QSETREFV % 390
                    (CONS (|dispatchFunction| |EXPR;product;%Sb%;154|) %))
          (QSETREFV % 393 (CONS (|dispatchFunction| |EXPR;erf;2%;155|) %))
          (QSETREFV % 395 (CONS (|dispatchFunction| |EXPR;erfi;2%;156|) %))
          (QSETREFV % 397 (CONS (|dispatchFunction| |EXPR;Ei;2%;157|) %))
          (QSETREFV % 399 (CONS (|dispatchFunction| |EXPR;Si;2%;158|) %))
          (QSETREFV % 401 (CONS (|dispatchFunction| |EXPR;Ci;2%;159|) %))
          (QSETREFV % 403 (CONS (|dispatchFunction| |EXPR;Shi;2%;160|) %))
          (QSETREFV % 405 (CONS (|dispatchFunction| |EXPR;Chi;2%;161|) %))
          (QSETREFV % 407 (CONS (|dispatchFunction| |EXPR;li;2%;162|) %))
          (QSETREFV % 409 (CONS (|dispatchFunction| |EXPR;dilog;2%;163|) %))
          (QSETREFV % 411 (CONS (|dispatchFunction| |EXPR;fresnelS;2%;164|) %))
          (QSETREFV % 413 (CONS (|dispatchFunction| |EXPR;fresnelC;2%;165|) %))
          (QSETREFV % 415
                    (CONS (|dispatchFunction| |EXPR;integral;%S%;166|) %))
          (QSETREFV % 417
                    (CONS (|dispatchFunction| |EXPR;integral;%Sb%;167|) %))
          (QSETREFV % 37 (CONS (|dispatchFunction| |EXPR;operator;2Bo;168|) %))
          (COND
           ((|HasCategory| |#1| '(|GcdDomain|))
            (PROGN
             (COND
              ((|domainEqual| |#1| (|Integer|))
               (PROGN
                (QSETREFV % 468
                          (|Record| (|:| |svz| (|List| (|Symbol|)))
                                    (|:| |sm|
                                         (|List| (|Polynomial| (|Integer|))))
                                    (|:| |msizes| (|List| (|Integer|)))
                                    (|:| |sp| (|Integer|))))
                (QSETREFV % 469 (|ModularAlgebraicGcdTools3|))
                (QSETREFV % 470
                          (|ModularAlgebraicGcd|
                           (|SparseUnivariatePolynomial|
                            (|Polynomial| (|Integer|)))
                           (QREFELT % 468) (QREFELT % 469)))
                (QSETREFV % 479 (|ModularEvaluation2|))
                (QSETREFV % 480 (|ModularAlgebraicGcdTools4|))
                (QSETREFV % 481
                          (|ModularAlgebraicGcd2|
                           (|Record| (|:| |var| (|Symbol|))
                                     (|:| |coef|
                                          (|SparseUnivariatePolynomial|
                                           (|Fraction|
                                            (|Polynomial| (|Integer|))))))
                           (|FakePolynomial|)
                           (|SparseUnivariatePolynomial|
                            (|Polynomial| (|Integer|)))
                           (QREFELT % 468) (QREFELT % 479) (QREFELT % 480)))
                (QSETREFV % 506
                          (CONS
                           (|dispatchFunction| |EXPR;gcdPolynomial;3Sup;187|)
                           %))))
              ('T
               (QSETREFV % 506
                         (CONS
                          (|dispatchFunction| |EXPR;gcdPolynomial;3Sup;188|)
                          %))))
             (COND
              ((|testBitVector| |pv$| 27)
               (QSETREFV % 513
                         (CONS
                          (|dispatchFunction| |EXPR;factorPolynomial;SupF;189|)
                          %)))))))
          (COND
           ((|domainEqual| |#1| (|AlgebraicNumber|))
            (QSETREFV % 518
                      (CONS (|dispatchFunction| |EXPR;coerce;An%;190|) %))))
          (COND
           ((|testBitVector| |pv$| 14)
            (PROGN
             (QSETREFV % 521 (CONS (|dispatchFunction| |EXPR;^;%F%;191|) %))
             (QSETREFV % 132
                       (CONS (|dispatchFunction| |EXPR;minPoly;KSup;192|) %))
             (QSETREFV % 524
                       (CONS
                        (|dispatchFunction| |EXPR;definingPolynomial;2%;193|)
                        %))
             (QSETREFV % 526
                       (CONS (|dispatchFunction| |EXPR;retract;%F;194|) %))
             (QSETREFV % 72
                       (CONS (|dispatchFunction| |EXPR;retractIfCan;%U;195|)
                             %))
             (COND ((|domainEqual| |#1| (|AlgebraicNumber|)))
                   ('T
                    (PROGN
                     (QSETREFV % 518
                               (CONS (|dispatchFunction| |EXPR;coerce;An%;198|)
                                     %))
                     (QSETREFV % 536
                               (CONS
                                (|dispatchFunction| |EXPR;retractIfCan;%U;199|)
                                %))))))))
          (COND
           ((|testBitVector| |pv$| 9)
            (PROGN
             (QSETREFV % 562
                       (CONS (|dispatchFunction| |EXPR;convert;%If;204|) %))
             (QSETREFV % 565
                       (CONS (|dispatchFunction| |EXPR;eval;%Bo%S%;205|) %))
             (QSETREFV % 564
                       (CONS (|dispatchFunction| |EXPR;eval;%LLS%;206|) %)))))
          (COND
           ((|testBitVector| |pv$| 13)
            (QSETREFV % 587
                      (CONS (|dispatchFunction| |EXPR;patternMatch;%P2Pmr;207|)
                            %))))
          (COND
           ((|testBitVector| |pv$| 12)
            (QSETREFV % 593
                      (CONS (|dispatchFunction| |EXPR;patternMatch;%P2Pmr;208|)
                            %))))))
        ('T
         (PROGN
          (SETELT % 45 (|SparseMultivariatePolynomial| |#1| (|Kernel| %)))
          (QSETREFV % 47
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |EXPR;Zero;%;209|) % 47)))
          (QSETREFV % 49
                    (CONS #'|makeSpadConstant|
                          (LIST (|dispatchFunction| |EXPR;One;%;210|) % 49)))
          (QSETREFV % 56 (CONS (|dispatchFunction| |EXPR;-;2%;211|) %))
          (QSETREFV % 59 (CONS (|dispatchFunction| |EXPR;*;I2%;212|) %))
          (QSETREFV % 63 (CONS (|dispatchFunction| |EXPR;*;3%;213|) %))
          (QSETREFV % 65 (CONS (|dispatchFunction| |EXPR;+;3%;214|) %))
          (QSETREFV % 96 (CONS (|dispatchFunction| |EXPR;=;2%B;215|) %))
          (QSETREFV % 95 (CONS (|dispatchFunction| |EXPR;smaller?;2%B;216|) %))
          (QSETREFV % 99 (CONS (|dispatchFunction| |EXPR;numer;%Smp;217|) %))
          (QSETREFV % 104 (CONS (|dispatchFunction| |EXPR;coerce;Smp%;218|) %))
          (QSETREFV % 106 (CONS (|dispatchFunction| |EXPR;coerce;P%;219|) %))
          (QSETREFV % 148
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MM;220|) %))
          (QSETREFV % 156
                    (CONS (|dispatchFunction| |EXPR;reducedSystem;MVR;221|) %))
          (COND
           ((|testBitVector| |pv$| 9)
            (QSETREFV % 562
                      (CONS (|dispatchFunction| |EXPR;convert;%If;222|) %))))
          (COND
           ((|testBitVector| |pv$| 13)
            (PROGN
             (QSETREFV % 587
                       (CONS
                        (|dispatchFunction| |EXPR;patternMatch;%P2Pmr;224|)
                        %)))))
          (COND
           ((|testBitVector| |pv$| 12)
            (PROGN
             (QSETREFV % 593
                       (CONS
                        (|dispatchFunction| |EXPR;patternMatch;%P2Pmr;226|)
                        %))))))))))
     ((|HasCategory| |#1| '(|AbelianMonoid|))
      (PROGN
       (SETELT % 45 (|FreeModule| (|Integer|) (|Kernel| %)))
       (QSETREFV % 47
                 (CONS #'|makeSpadConstant|
                       (LIST (|dispatchFunction| |EXPR;Zero;%;227|) % 47)))
       (QSETREFV % 65 (CONS (|dispatchFunction| |EXPR;+;3%;228|) %))
       (QSETREFV % 96 (CONS (|dispatchFunction| |EXPR;=;2%B;229|) %))
       (QSETREFV % 95 (CONS (|dispatchFunction| |EXPR;smaller?;2%B;230|) %))
       (QSETREFV % 136 (CONS (|dispatchFunction| |EXPR;coerce;K%;231|) %))
       (QSETREFV % 75 (CONS (|dispatchFunction| |EXPR;kernels;%L;232|) %))
       (QSETREFV % 537 (CONS (|dispatchFunction| |EXPR;coerce;R%;233|) %))
       (QSETREFV % 453 (CONS (|dispatchFunction| |EXPR;retract;%R;234|) %))
       (QSETREFV % 616 (CONS (|dispatchFunction| |EXPR;coerce;%Of;235|) %))
       (QSETREFV % 625 (CONS (|dispatchFunction| |EXPR;isPlus;%U;238|) %))
       (QSETREFV % 629 (CONS (|dispatchFunction| |EXPR;isMult;%U;239|) %))
       (QSETREFV % 617 (CONS (|dispatchFunction| |EXPR;eval;%LL%;240|) %))
       (QSETREFV % 622 (CONS (|dispatchFunction| |EXPR;subst;%LL%;241|) %))
       (QSETREFV % 630
                 (CONS (|dispatchFunction| |EXPR;retractIfCan;%U;242|) %))
       (COND
        ((|HasCategory| |#1| '(|AbelianGroup|))
         (QSETREFV % 56 (CONS (|dispatchFunction| |EXPR;-;2%;243|) %))))))
     ('T
      (PROGN
       (SETELT % 45 (|Kernel| %))
       (QSETREFV % 95 (CONS (|dispatchFunction| |EXPR;smaller?;2%B;244|) %))
       (QSETREFV % 96 (CONS (|dispatchFunction| |EXPR;=;2%B;245|) %))
       (QSETREFV % 136 (CONS (|dispatchFunction| |EXPR;coerce;K%;246|) %))
       (QSETREFV % 75 (CONS (|dispatchFunction| |EXPR;kernels;%L;247|) %))
       (QSETREFV % 537 (CONS (|dispatchFunction| |EXPR;coerce;R%;248|) %))
       (QSETREFV % 453 (CONS (|dispatchFunction| |EXPR;retract;%R;249|) %))
       (QSETREFV % 630
                 (CONS (|dispatchFunction| |EXPR;retractIfCan;%U;250|) %))
       (QSETREFV % 616 (CONS (|dispatchFunction| |EXPR;coerce;%Of;251|) %))
       (QSETREFV % 617 (CONS (|dispatchFunction| |EXPR;eval;%LL%;252|) %))
       (QSETREFV % 622 (CONS (|dispatchFunction| |EXPR;subst;%LL%;253|) %))
       (COND
        ((|testBitVector| |pv$| 9)
         (QSETREFV % 562
                   (CONS (|dispatchFunction| |EXPR;convert;%If;254|) %)))))))
    %))) 

(DEFUN |Expression| (#1=#:G735)
  (SPROG NIL
         (PROG (#2=#:G736)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Expression|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Expression;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|Expression|)))))))))) 

(MAKEPROP '|Expression| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) 'SYMBOL 'ALGOP (|Boolean|)
              (|BasicOperator|) |EXPR;belong?;BoB;1| (|Kernel| %)
              (0 . |retract|) (|Union| 6 '"failed") (|Kernel| $$)
              (|KernelFunctions2| 6 $$) (5 . |constantIfCan|)
              (|Union| 12 '#1="failed") (10 . |retractIfCan|)
              (|FunctionSpace2&| $$ 6 15) (15 . |belong?|) (20 . |operator|)
              (|ExpressionSpace2&| $$ 15) (25 . |belong?|) (30 . |operator|)
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
              (|Union| 519 '#1#) (220 . |retractIfCan|) (225 . |number?|)
              (|List| 12) (230 . |kernels|) (235 . |is?|) (241 . |first|)
              (|List| $$) (246 . |argument|) (251 . |#|) (256 . |elt|)
              (262 . ^) (268 . |algtower|) (273 . ^) (279 . |first|)
              (284 . |second|) (289 . |Zero|) (293 . |numerator|)
              (298 . |denominator|) (303 . ^) (309 . ^) (|PositiveInteger|)
              (315 . ^) (321 . |smaller?|) (327 . |smaller?|) (333 . =)
              (339 . |numer|) (|SparseMultivariatePolynomial| 6 12)
              (344 . |numer|) (349 . |denom|) (354 . |denom|) 'EREP
              (359 . |One|) (363 . |coerce|) (|Polynomial| 6) (368 . |coerce|)
              (|Fraction| 105) (373 . |numer|) (378 . |denom|) (383 . |coerce|)
              (388 . |reduce|) (|Mapping| 9 15) (393 . |select!|)
              (|AlgebraicManipulations| 6 $$) (399 . |ratDenom|) (405 . |is?|)
              (411 . ~=) (|SparseUnivariatePolynomial| %) (417 . |univariate|)
              (|SparseUnivariatePolynomial| 41) (423 . |leadingCoefficient|)
              (428 . |reductum|) (433 . *) (439 . |monomial|) (446 . -)
              (452 . /) (458 . |getSimplifyDenomsFlag|)
              (462 . |setSimplifyDenomsFlag|) (467 . |elt|)
              (|SingletonAsOrderedSet|) (473 . |create|) (477 . |minPoly|)
              (|SparseUnivariatePolynomial| $$)
              (|PolynomialCategoryQuotientFunctions| 514 15 6 41 $$)
              (482 . |univariate|) (489 . |coerce|) (494 . |eval|)
              (501 . |retract|) (506 . /) (|Mapping| $$ $$) (|Matrix| $$)
              (512 . |map|) (|Matrix| 41) (|Matrix| %) (518 . |reducedSystem|)
              (|Matrix| 6) (523 . |reducedSystem|) (528 . |reducedSystem|)
              (|Vector| $$) (533 . |map|)
              (|Record| (|:| |mat| 143) (|:| |vec| (|Vector| 41))) (|Vector| %)
              (539 . |reducedSystem|)
              (|Record| (|:| |mat| 146) (|:| |vec| (|Vector| 6)))
              (545 . |reducedSystem|) (551 . |reducedSystem|) (557 . |member?|)
              (563 . |concat|) (|AlgebraicFunction| 6 $$) (569 . |rootOf|)
              (575 . |rootOf|) (581 . |rootSum|) (588 . |rootSum|)
              (|ElementaryFunction| 6 $$) (595 . |pi|) (599 . |pi|)
              (603 . |exp|) (608 . |exp|) (613 . |log|) (618 . |log|)
              (623 . |sin|) (628 . |sin|) (633 . |cos|) (638 . |cos|)
              (643 . |tan|) (648 . |tan|) (653 . |cot|) (658 . |cot|)
              (663 . |sec|) (668 . |sec|) (673 . |csc|) (678 . |csc|)
              (683 . |asin|) (688 . |asin|) (693 . |acos|) (698 . |acos|)
              (703 . |atan|) (708 . |atan|) (713 . |acot|) (718 . |acot|)
              (723 . |asec|) (728 . |asec|) (733 . |acsc|) (738 . |acsc|)
              (743 . |sinh|) (748 . |sinh|) (753 . |cosh|) (758 . |cosh|)
              (763 . |tanh|) (768 . |tanh|) (773 . |coth|) (778 . |coth|)
              (783 . |sech|) (788 . |sech|) (793 . |csch|) (798 . |csch|)
              (803 . |asinh|) (808 . |asinh|) (813 . |acosh|) (818 . |acosh|)
              (823 . |atanh|) (828 . |atanh|) (833 . |acoth|) (838 . |acoth|)
              (843 . |asech|) (848 . |asech|) (853 . |acsch|) (858 . |acsch|)
              (|FunctionalSpecialFunction| 6 $$) (863 . |abs|) (868 . |abs|)
              (873 . |sign|) (878 . |sign|) (883 . |unitStep|)
              (888 . |unitStep|) (893 . |ceiling|) (898 . |ceiling|)
              (903 . |floor|) (908 . |floor|) (913 . |fractionPart|)
              (918 . |fractionPart|) (923 . |diracDelta|) (928 . |diracDelta|)
              (933 . |conjugate|) (938 . |conjugate|) (943 . |Gamma|)
              (948 . |Gamma|) (953 . |Gamma|) (959 . |Gamma|) (965 . |Beta|)
              (971 . |Beta|) (977 . |Beta|) (984 . |Beta|) (991 . |digamma|)
              (996 . |digamma|) (1001 . |polygamma|) (1007 . |polygamma|)
              (1013 . |besselJ|) (1019 . |besselJ|) (1025 . |besselY|)
              (1031 . |besselY|) (1037 . |besselI|) (1043 . |besselI|)
              (1049 . |besselK|) (1055 . |besselK|) (1061 . |airyAi|)
              (1066 . |airyAi|) (1071 . |airyAiPrime|) (1076 . |airyAiPrime|)
              (1081 . |airyBi|) (1086 . |airyBi|) (1091 . |airyBiPrime|)
              (1096 . |airyBiPrime|) (1101 . |lambertW|) (1106 . |lambertW|)
              (1111 . |polylog|) (1117 . |polylog|) (1123 . |weierstrassP|)
              (1130 . |weierstrassP|) (1137 . |weierstrassPPrime|)
              (1144 . |weierstrassPPrime|) (1151 . |weierstrassSigma|)
              (1158 . |weierstrassSigma|) (1165 . |weierstrassZeta|)
              (1172 . |weierstrassZeta|) (1179 . |weierstrassPInverse|)
              (1186 . |weierstrassPInverse|) (1193 . |whittakerM|)
              (1200 . |whittakerM|) (1207 . |whittakerW|) (1214 . |whittakerW|)
              (1221 . |angerJ|) (1227 . |angerJ|) (1233 . |weberE|)
              (1239 . |weberE|) (1245 . |struveH|) (1251 . |struveH|)
              (1257 . |struveL|) (1263 . |struveL|) (1269 . |hankelH1|)
              (1275 . |hankelH1|) (1281 . |hankelH2|) (1287 . |hankelH2|)
              (1293 . |lommelS1|) (1300 . |lommelS1|) (1307 . |lommelS2|)
              (1314 . |lommelS2|) (1321 . |kummerM|) (1328 . |kummerM|)
              (1335 . |kummerU|) (1342 . |kummerU|) (1349 . |legendreP|)
              (1356 . |legendreP|) (1363 . |legendreQ|) (1370 . |legendreQ|)
              (1377 . |kelvinBei|) (1383 . |kelvinBei|) (1389 . |kelvinBer|)
              (1395 . |kelvinBer|) (1401 . |kelvinKei|) (1407 . |kelvinKei|)
              (1413 . |kelvinKer|) (1419 . |kelvinKer|) (1425 . |ellipticK|)
              (1430 . |ellipticK|) (1435 . |ellipticE|) (1440 . |ellipticE|)
              (1445 . |ellipticE|) (1451 . |ellipticE|) (1457 . |ellipticF|)
              (1463 . |ellipticF|) (1469 . |ellipticPi|) (1476 . |ellipticPi|)
              (1483 . |jacobiSn|) (1489 . |jacobiSn|) (1495 . |jacobiCn|)
              (1501 . |jacobiCn|) (1507 . |jacobiDn|) (1513 . |jacobiDn|)
              (1519 . |jacobiZeta|) (1525 . |jacobiZeta|)
              (1531 . |jacobiTheta|) (1537 . |jacobiTheta|) (1543 . |lerchPhi|)
              (1550 . |lerchPhi|) (1557 . |riemannZeta|) (1562 . |riemannZeta|)
              (1567 . |charlierC|) (1574 . |charlierC|) (1581 . |hahn_p|)
              (1590 . |hahn_p|) (1599 . |hahnQ|) (1608 . |hahnQ|)
              (1617 . |hahnR|) (1626 . |hahnR|) (1635 . |hahnS|)
              (1644 . |hahnS|) (1653 . |hermiteH|) (1659 . |hermiteH|)
              (1665 . |krawtchoukK|) (1673 . |krawtchoukK|) (1681 . |jacobiP|)
              (1689 . |jacobiP|) (1697 . |laguerreL|) (1704 . |laguerreL|)
              (1711 . |meixnerM|) (1719 . |meixnerM|) (1727 . |meixnerP|)
              (1735 . |meixnerP|) (1743 . |racahR|) (1753 . |racahR|)
              (1763 . |wilsonW|) (1773 . |wilsonW|) (1783 . |hypergeometricF|)
              (|List| %) (1790 . |hypergeometricF|) (1797 . |meijerG|)
              (1806 . |meijerG|) (|CombinatorialFunction| 6 $$) (1815 . ^)
              (1821 . |factorial|) (1826 . |factorial|) (1831 . |binomial|)
              (1837 . |binomial|) (1843 . |permutation|) (1849 . |permutation|)
              (1855 . |factorials|) (1860 . |factorials|) (1865 . |factorials|)
              (1871 . |factorials|) (1877 . |summation|) (1883 . |summation|)
              (|SegmentBinding| $$) (1889 . |summation|) (|SegmentBinding| %)
              (1895 . |summation|) (1901 . |product|) (1907 . |product|)
              (1913 . |product|) (1919 . |product|)
              (|LiouvillianFunction| 6 $$) (1925 . |erf|) (1930 . |erf|)
              (1935 . |erfi|) (1940 . |erfi|) (1945 . |Ei|) (1950 . |Ei|)
              (1955 . |Si|) (1960 . |Si|) (1965 . |Ci|) (1970 . |Ci|)
              (1975 . |Shi|) (1980 . |Shi|) (1985 . |Chi|) (1990 . |Chi|)
              (1995 . |li|) (2000 . |li|) (2005 . |dilog|) (2010 . |dilog|)
              (2015 . |fresnelS|) (2020 . |fresnelS|) (2025 . |fresnelC|)
              (2030 . |fresnelC|) (2035 . |integral|) (2041 . |integral|)
              (2047 . |integral|) (2053 . |integral|) (2059 . |belong?|)
              (2064 . |operator|) (2069 . |belong?|) (2074 . |operator|)
              (2079 . |belong?|) (2084 . |operator|) (2089 . |belong?|)
              (2094 . |operator|) (2099 . |belong?|) (2104 . |operator|)
              (|Fraction| 41) (2109 . |coerce|) (|Fraction| 433)
              (|PolynomialCategoryQuotientFunctions| 514 15 6 41 428)
              (2114 . |univariate|) (|SparseUnivariatePolynomial| 428)
              (2120 . |numer|) (2125 . |degree|) (2131 . |degree|)
              (2136 . |rem|) (2142 . |coerce|) (2147 . |elt|) (2153 . |Zero|)
              (2157 . ~=) (2163 . |leadingCoefficient|) (2168 . |reductum|)
              (2173 . |concat|) (2179 . |removeDuplicates|) (2184 . =)
              (2190 . |coefficients|) (|Mapping| 9 $$) (2195 . |every?|)
              (|Mapping| 41 $$)
              (|UnivariatePolynomialCategoryFunctions2| $$ 133 41 120)
              (2201 . |map|) (2207 . |retract|) (2212 . |monomial|)
              (2218 . |coerce|) (2223 . -) (2229 . =) (|Polynomial| 57)
              (2235 . |One|) (2239 . |One|) (2243 . |monomial|)
              (2250 . |coerce|) (|Mapping| 458 15) (|Mapping| 458 57)
              (|PolynomialCategoryLifting| 514 15 57 41 458) (2255 . |map|)
              (2262 . |multivariate|) 'MD 'MOP1 'MGCD1 (2268 . |coerce|)
              (|Mapping| 41 27) (|Mapping| 41 57)
              (|PolynomialCategoryLifting| (|IndexedExponents| 27) 27 57 458
                                           41)
              (2273 . |map|) (|Mapping| $$ 41)
              (|UnivariatePolynomialCategoryFunctions2| 41 120 $$ 133)
              (2280 . |map|) 'MEV2 'MOP2 'MGCD2 (|Fraction| 458) (2286 . /)
              (2292 . |coerce|) (|SparseUnivariatePolynomial| 482)
              (2297 . |coerce|) (|Mapping| 482 $$)
              (|UnivariatePolynomialCategoryFunctions2| $$ 133 482 485)
              (2302 . |map|) (2308 . =) (2314 . |One|) (2318 . |gcdPolynomial|)
              (2324 . |concat|) (2330 . |algtower|) (2335 . |kernels|)
              (2340 . |setUnion|) (2346 . |sort|) (2351 . |new|)
              (2355 . |cons|) (2361 . |setDifference|) (|List| 458)
              (2367 . |algebraicGcd|)
              (|Record| (|:| |var| 27) (|:| |coef| 485)) (|List| 503)
              (2377 . |algebraicGcd|) (2387 . |gcdPolynomial|)
              (|GcdDomain&| $$) (2393 . |gcdPolynomial|) (|Factored| 133)
              (|ExpressionFactorPolynomial| 6 $$) (2399 . |factorPolynomial|)
              (|Factored| 118) (2404 . |factorPolynomial|)
              (|IndexedExponents| 15) (2409 . |Zero|) (2413 . |monomial|)
              (|AlgebraicNumber|) (2419 . |coerce|) (|Fraction| 57) (2424 . ^)
              (2430 . ^) (2436 . |minPoly|) (2441 . |definingPolynomial|)
              (2446 . |definingPolynomial|) (2451 . |retract|)
              (2456 . |retract|) (2461 . |retractIfCan|) (2466 . |coerce|)
              (|Expression| 6) (|Mapping| 6 57) (|Expression| 57)
              (|FunctionSpaceFunctions2| 57 531 6 529) (2471 . |map|)
              (2477 . /) (|Union| 517 '"failed") (2483 . |retractIfCan|)
              (2488 . |coerce|) (2493 . |coerce|) (2498 . |is?|)
              (|Union| 27 '#1#) (2504 . |retractIfCan|)
              (|SparseUnivariatePolynomial| 517) (2509 . |Zero|)
              (2513 . |Zero|) (2517 . ~=) (2523 . |degree|) (2528 . |monomial|)
              (2534 . +) (2540 . |rootOf|) (2546 . |operator|) (2551 . |elt|)
              (|Union| 15 '"failed") (2557 . |mainVariable|)
              (2562 . |leadingCoefficient|) (2567 . |Zero|) (2571 . |ground?|)
              (2576 . ^) (2582 . *) (2588 . +) (|InputForm|) (2594 . |convert|)
              (2599 . |convert|) (|List| 10) (2604 . |eval|) (2612 . |eval|)
              (2620 . |variables|) (2625 . |concat|)
              (2630 . |removeDuplicates|) (2635 . |scripted?|) (|Mapping| 9 27)
              (2640 . |select|) (|MakeUnaryCompiledFunction| $$ $$ $$)
              (2646 . |compiledFunction|) (|Mapping| % %) (|List| 574)
              (2652 . |eval|) (2659 . |coerce|) (|Equation| $$) (2664 . =)
              (|List| 632) (2670 . |subst|) (|PatternMatchResult| 57 $$)
              (|Pattern| 57) (|PatternMatchFunctionSpace| 57 6 $$)
              (2676 . |patternMatch|) (|PatternMatchResult| 57 %)
              (2683 . |patternMatch|) (|PatternMatchResult| (|Float|) $$)
              (|Pattern| (|Float|))
              (|PatternMatchFunctionSpace| (|Float|) 6 $$)
              (2690 . |patternMatch|) (|PatternMatchResult| (|Float|) %)
              (2697 . |patternMatch|) (2704 . |reducedSystem|)
              (2709 . |reducedSystem|) (|PatternMatchKernel| 57 $$)
              (2715 . |patternMatch|) (|PatternMatchResult| 57 45)
              (|Mapping| 598 15 583 598)
              (|PatternMatchPolynomialCategory| 57 514 15 6 45)
              (2722 . |patternMatch|) (|PatternMatchKernel| (|Float|) $$)
              (2730 . |patternMatch|) (|PatternMatchResult| (|Float|) 45)
              (|Mapping| 604 15 589 604)
              (|PatternMatchPolynomialCategory| (|Float|) 514 15 6 45)
              (2737 . |patternMatch|) (2745 . |monomial|)
              (|Record| (|:| |k| 15) (|:| |c| 57)) (|List| 609)
              (2751 . |listOfTerms|) (2756 . |zero?|) (2761 . |constantKernel|)
              (|OutputForm|) (2766 . |coerce|) (2771 . |coerce|)
              (2776 . |eval|) (2783 . |map|) (|Mapping| $$ 15)
              (|ListToMap| 15 $$) (2789 . |match|) (2797 . |subst|)
              (2804 . |kernel|) (|Union| 365 '#2="failed") (2810 . |isPlus|)
              (2815 . |first|) (|Record| (|:| |coef| 57) (|:| |var| 12))
              (|Union| 627 '#2#) (2820 . |isMult|) (2825 . |retractIfCan|)
              (|String|) (|Equation| %) (|Mapping| % 365) (|List| 633)
              (|Union| 152 '#3="failed") (|Union| 637 '#3#) (|List| 118)
              (|Matrix| 57)
              (|Record| (|:| |mat| 638) (|:| |vec| (|Vector| 57)))
              (|Union| % '"failed") (|Factored| %)
              (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 642 '"failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef| 365) (|:| |generator| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Polynomial| %) (|Union| 107 '#1#) (|Fraction| 118)
              (|Polynomial| 654) (|Fraction| 652) (|Fraction| 6)
              (|Union| 57 '#1#) (|Union| 105 '#1#) (|List| 35)
              (|Record| (|:| |val| %) (|:| |exponent| 57)) (|Union| 658 '#2#)
              (|Record| (|:| |var| 12) (|:| |exponent| 57)) (|Union| 660 '#2#))
           '#(~= 2830 |zerosOf| 2836 |zeroOf| 2863 |zero?| 2890 |wilsonW| 2895
              |whittakerW| 2905 |whittakerM| 2912 |weierstrassZeta| 2919
              |weierstrassSigma| 2926 |weierstrassPPrime| 2933
              |weierstrassPInverse| 2940 |weierstrassP| 2947 |weberE| 2954
              |variables| 2960 |univariate| 2970 |unitStep| 2976 |unitNormal|
              2981 |unitCanonical| 2986 |unit?| 2991 |tower| 2996 |tanh| 3006
              |tan| 3011 |summation| 3016 |subtractIfCan| 3028 |subst| 3034
              |struveL| 3053 |struveH| 3059 |squareFreePolynomial| 3065
              |squareFreePart| 3070 |squareFree| 3075 |sqrt| 3080
              |solveLinearPolynomialEquation| 3085 |smaller?| 3091 |sizeLess?|
              3097 |sinh| 3103 |sin| 3108 |sign| 3113 |setSimplifyDenomsFlag|
              3118 |sech| 3123 |sec| 3128 |sample| 3133 |rootsOf| 3137
              |rootSum| 3164 |rootOf| 3171 |rightRecip| 3198 |rightPower| 3203
              |riemannZeta| 3215 |retractIfCan| 3220 |retract| 3260 |rem| 3300
              |reducedSystem| 3306 |reduce| 3328 |recip| 3333 |racahR| 3338
              |quo| 3348 |product| 3354 |principalIdeal| 3366 |prime?| 3371
              |polylog| 3376 |polygamma| 3382 |plenaryPower| 3388 |pi| 3394
              |permutation| 3398 |patternMatch| 3404 |paren| 3418 |opposite?|
              3423 |operators| 3429 |operator| 3434 |one?| 3439 |odd?| 3444
              |numerator| 3449 |numer| 3454 |number?| 3459 |nthRoot| 3464
              |multiEuclidean| 3470 |minPoly| 3476 |meixnerP| 3481 |meixnerM|
              3489 |meijerG| 3497 |map| 3506 |mainKernel| 3512 |lommelS2| 3517
              |lommelS1| 3524 |log| 3531 |li| 3536 |lerchPhi| 3541 |legendreQ|
              3548 |legendreP| 3555 |leftRecip| 3562 |leftPower| 3567 |lcmCoef|
              3579 |lcm| 3585 |latex| 3596 |lambertW| 3601 |laguerreL| 3606
              |kummerU| 3613 |kummerM| 3620 |krawtchoukK| 3627 |kernels| 3635
              |kernel| 3645 |kelvinKer| 3657 |kelvinKei| 3663 |kelvinBer| 3669
              |kelvinBei| 3675 |jacobiZeta| 3681 |jacobiTheta| 3687 |jacobiSn|
              3693 |jacobiP| 3699 |jacobiDn| 3707 |jacobiCn| 3713 |isTimes|
              3719 |isPower| 3724 |isPlus| 3729 |isMult| 3734 |isExpt| 3739
              |is?| 3756 |inv| 3768 |integral| 3773 |hypergeometricF| 3785
              |hermiteH| 3792 |height| 3798 |hankelH2| 3803 |hankelH1| 3809
              |hahn_p| 3815 |hahnS| 3824 |hahnR| 3833 |hahnQ| 3842 |ground?|
              3851 |ground| 3856 |getSimplifyDenomsFlag| 3861 |gcdPolynomial|
              3865 |gcd| 3871 |fresnelS| 3882 |fresnelC| 3887 |freeOf?| 3892
              |fractionPart| 3904 |floor| 3909 |factorials| 3914 |factorial|
              3925 |factorSquareFreePolynomial| 3930 |factorPolynomial| 3935
              |factor| 3940 |extendedEuclidean| 3945 |exquo| 3958
              |expressIdealMember| 3964 |exp| 3970 |even?| 3975 |eval| 3980
              |euclideanSize| 4124 |erfi| 4129 |erf| 4134 |elt| 4139
              |ellipticPi| 4235 |ellipticK| 4242 |ellipticF| 4247 |ellipticE|
              4253 |divide| 4264 |distribute| 4270 |diracDelta| 4281 |dilog|
              4286 |digamma| 4291 |differentiate| 4296 |denominator| 4322
              |denom| 4327 |definingPolynomial| 4332 |csch| 4337 |csc| 4342
              |coth| 4347 |cot| 4352 |cosh| 4357 |cos| 4362 |convert| 4367
              |conjugate| 4387 |conditionP| 4398 |commutator| 4403 |coerce|
              4409 |charthRoot| 4479 |charlierC| 4484 |characteristic| 4491
              |ceiling| 4495 |box| 4500 |binomial| 4505 |besselY| 4511
              |besselK| 4517 |besselJ| 4523 |besselI| 4529 |belong?| 4535
              |atanh| 4540 |atan| 4545 |associator| 4550 |associates?| 4557
              |asinh| 4563 |asin| 4568 |asech| 4573 |asec| 4578 |applyQuote|
              4583 |antiCommutator| 4619 |annihilate?| 4625 |angerJ| 4631
              |algtower| 4637 |airyBiPrime| 4647 |airyBi| 4652 |airyAiPrime|
              4657 |airyAi| 4662 |acsch| 4667 |acsc| 4672 |acoth| 4677 |acot|
              4682 |acosh| 4687 |acos| 4692 |abs| 4697 ^ 4702 |Zero| 4732 |Si|
              4736 |Shi| 4741 |One| 4746 |Gamma| 4750 |Ei| 4761 D 4766 |Ci|
              4792 |Chi| 4797 |Beta| 4802 = 4815 / 4821 - 4833 + 4844 * 4850)
           'NIL
           (CONS
            (|makeByteWordVec2| 31
                                '(1 0 1 0 1 1 28 1 1 1 1 1 1 1 5 4 3 2 1 1 1 21
                                  21 5 2 1 1 5 5 2 1 1 26 5 5 2 6 1 21 26 5 5 2
                                  6 1 1 15 7 17 5 15 0 21 17 16 30 0 0 31 1 17
                                  13 12 0 0 19 1 1 14 5 1 1 20 0 0 0 0 0 0 19 1
                                  1 1 1 1 1 1 1 1 18 14 11 10 9 8 5 1 1 1 1 20
                                  0 0 0 0 0 0 0 0))
            (CONS
             '#(|AlgebraicallyClosedFunctionSpace&| NIL
                |AlgebraicallyClosedField&| |FunctionSpace2&| |Field&|
                |EuclideanDomain&| |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |GcdDomain&| NIL NIL
                |DivisionRing&| NIL |PartialDifferentialRing&| NIL NIL
                |Algebra&| |Algebra&| |EntireRing&| |Algebra&| NIL |Rng&| NIL
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| NIL |FullyLinearlyExplicitOver&|
                |Module&| |Module&| |Module&| NIL |NonAssociativeRing&| NIL NIL
                NIL NIL |NonAssociativeRng&| NIL NIL NIL NIL NIL NIL NIL
                |AbelianGroup&| |Group&| NIL NIL NIL NIL
                |NonAssociativeSemiRng&| NIL |MagmaWithUnit&| |AbelianMonoid&|
                NIL |ExpressionSpace2&| |AbelianSemiGroup&| NIL |Magma&| NIL
                NIL |FullyRetractableTo&| NIL |RetractableTo&| NIL
                |TranscendentalFunctionCategory&| |RetractableTo&|
                |RetractableTo&| NIL |RetractableTo&| |RetractableTo&|
                |RetractableTo&| |Evalable&| |RetractableTo&| NIL
                |RetractableTo&| |SetCategory&| NIL |RadicalCategory&| NIL
                |ElementaryFunctionCategory&| NIL |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| NIL NIL NIL NIL NIL NIL NIL
                NIL NIL NIL NIL NIL NIL NIL NIL NIL |InnerEvalable&|
                |InnerEvalable&| NIL NIL NIL |BasicType&|)
             (CONS
              '#((|AlgebraicallyClosedFunctionSpace| 6) (|FunctionSpace| 6)
                 (|AlgebraicallyClosedField|) (|FunctionSpace2| 6 15) (|Field|)
                 (|EuclideanDomain|) (|PolynomialFactorizationExplicit|)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|GcdDomain|) (|IntegralDomain|) (|CommutativeRing|)
                 (|DivisionRing|) (|LeftOreRing|)
                 (|PartialDifferentialRing| 27) (|CharacteristicZero|)
                 (|CharacteristicNonZero|) (|Algebra| 6) (|Algebra| 519)
                 (|EntireRing|) (|Algebra| $$) (|Ring|) (|Rng|) (|SemiRing|)
                 (|NonAssociativeAlgebra| 6) (|NonAssociativeAlgebra| 519)
                 (|NonAssociativeAlgebra| $$) (|SemiRng|)
                 (|FullyLinearlyExplicitOver| 6) (|Module| 6) (|Module| 519)
                 (|Module| $$) (|LinearlyExplicitOver| 57)
                 (|NonAssociativeRing|) (|LinearlyExplicitOver| 6)
                 (|BiModule| 6 6) (|BiModule| $$ $$) (|BiModule| 519 519)
                 (|NonAssociativeRng|) (|RightModule| 57) (|RightModule| $$)
                 (|RightModule| 6) (|LeftModule| 6) (|LeftModule| $$)
                 (|RightModule| 519) (|LeftModule| 519) (|AbelianGroup|)
                 (|Group|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|ExpressionSpace|)
                 (|NonAssociativeSemiRng|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|AbelianMonoid|) (|FullyPatternMatchable| 6)
                 (|ExpressionSpace2| 15) (|AbelianSemiGroup|)
                 (|LiouvillianFunctionCategory|) (|Magma|)
                 (|PatternMatchable| 57) (|PatternMatchable| (|Float|))
                 (|FullyRetractableTo| 6) (|Comparable|) (|RetractableTo| 517)
                 (|CombinatorialOpsCategory|)
                 (|TranscendentalFunctionCategory|) (|RetractableTo| 57)
                 (|RetractableTo| (|Polynomial| 6)) (|CommutativeStar|)
                 (|RetractableTo| (|Fraction| (|Polynomial| 6)))
                 (|RetractableTo| 519) (|RetractableTo| 15) (|Evalable| $$)
                 (|RetractableTo| 27) (|Patternable| 6) (|RetractableTo| 6)
                 (|SetCategory|) (|CoercibleFrom| 517) (|RadicalCategory|)
                 (|CombinatorialFunctionCategory|)
                 (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|)
                 (|PrimitiveFunctionCategory|) (|SpecialFunctionCategory|)
                 (|unitsKnown|) (|CoercibleFrom| 57) (|ConvertibleTo| 583)
                 (|ConvertibleTo| 589) (|ConvertibleTo| 560) (|TwoSidedRecip|)
                 (|CoercibleFrom| (|Polynomial| 6)) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|)
                 (|CoercibleFrom| (|Fraction| (|Polynomial| 6)))
                 (|CoercibleFrom| 519) (|CoercibleTo| 614) (|CoercibleFrom| 15)
                 (|InnerEvalable| 15 $$) (|InnerEvalable| $$ $$)
                 (|CoercibleFrom| 27) (|Type|) (|CoercibleFrom| 6)
                 (|BasicType|))
              (|makeByteWordVec2| 661
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
                                    1 78 2 0 86 0 6 0 87 1 0 0 0 88 1 0 0 0 89
                                    2 0 0 0 35 90 2 0 0 0 57 91 2 0 0 0 92 93 2
                                    45 9 0 0 94 2 0 9 0 0 95 2 0 9 0 0 96 1 45
                                    41 0 97 1 0 98 0 99 1 45 41 0 100 1 0 98 0
                                    101 0 41 0 103 1 0 0 98 104 1 0 0 105 106 1
                                    107 105 0 108 1 107 105 0 109 1 0 0 107 110
                                    1 0 0 0 111 2 42 0 112 0 113 2 114 2 2 42
                                    115 2 15 9 0 27 116 2 0 9 0 0 117 2 41 118
                                    0 15 119 1 120 41 0 121 1 120 0 0 122 2 41
                                    0 0 0 123 3 41 0 0 15 35 124 2 41 0 0 0 125
                                    2 45 0 41 41 126 0 0 9 127 1 0 9 9 128 2 42
                                    15 0 57 129 0 130 0 131 1 0 118 12 132 3
                                    134 133 2 15 133 135 1 0 0 12 136 3 133 0 0
                                    130 2 137 1 133 2 0 138 2 0 0 98 98 139 2
                                    141 0 140 0 142 1 45 143 144 145 1 41 146
                                    144 147 1 0 146 144 148 2 149 0 140 0 150 2
                                    45 151 144 152 153 2 41 154 144 152 155 2 0
                                    154 144 152 156 2 42 9 15 0 157 2 42 0 15 0
                                    158 2 159 2 133 27 160 2 0 0 118 27 161 3
                                    159 2 2 133 27 162 3 0 0 0 118 27 163 0 164
                                    2 165 0 0 0 166 1 164 2 2 167 1 0 0 0 168 1
                                    164 2 2 169 1 0 0 0 170 1 164 2 2 171 1 0 0
                                    0 172 1 164 2 2 173 1 0 0 0 174 1 164 2 2
                                    175 1 0 0 0 176 1 164 2 2 177 1 0 0 0 178 1
                                    164 2 2 179 1 0 0 0 180 1 164 2 2 181 1 0 0
                                    0 182 1 164 2 2 183 1 0 0 0 184 1 164 2 2
                                    185 1 0 0 0 186 1 164 2 2 187 1 0 0 0 188 1
                                    164 2 2 189 1 0 0 0 190 1 164 2 2 191 1 0 0
                                    0 192 1 164 2 2 193 1 0 0 0 194 1 164 2 2
                                    195 1 0 0 0 196 1 164 2 2 197 1 0 0 0 198 1
                                    164 2 2 199 1 0 0 0 200 1 164 2 2 201 1 0 0
                                    0 202 1 164 2 2 203 1 0 0 0 204 1 164 2 2
                                    205 1 0 0 0 206 1 164 2 2 207 1 0 0 0 208 1
                                    164 2 2 209 1 0 0 0 210 1 164 2 2 211 1 0 0
                                    0 212 1 164 2 2 213 1 0 0 0 214 1 164 2 2
                                    215 1 0 0 0 216 1 164 2 2 217 1 0 0 0 218 1
                                    219 2 2 220 1 0 0 0 221 1 219 2 2 222 1 0 0
                                    0 223 1 219 2 2 224 1 0 0 0 225 1 219 2 2
                                    226 1 0 0 0 227 1 219 2 2 228 1 0 0 0 229 1
                                    219 2 2 230 1 0 0 0 231 1 219 2 2 232 1 0 0
                                    0 233 1 219 2 2 234 1 0 0 0 235 1 219 2 2
                                    236 1 0 0 0 237 2 219 2 2 2 238 2 0 0 0 0
                                    239 2 219 2 2 2 240 2 0 0 0 0 241 3 219 2 2
                                    2 2 242 3 0 0 0 0 0 243 1 219 2 2 244 1 0 0
                                    0 245 2 219 2 2 2 246 2 0 0 0 0 247 2 219 2
                                    2 2 248 2 0 0 0 0 249 2 219 2 2 2 250 2 0 0
                                    0 0 251 2 219 2 2 2 252 2 0 0 0 0 253 2 219
                                    2 2 2 254 2 0 0 0 0 255 1 219 2 2 256 1 0 0
                                    0 257 1 219 2 2 258 1 0 0 0 259 1 219 2 2
                                    260 1 0 0 0 261 1 219 2 2 262 1 0 0 0 263 1
                                    219 2 2 264 1 0 0 0 265 2 219 2 2 2 266 2 0
                                    0 0 0 267 3 219 2 2 2 2 268 3 0 0 0 0 0 269
                                    3 219 2 2 2 2 270 3 0 0 0 0 0 271 3 219 2 2
                                    2 2 272 3 0 0 0 0 0 273 3 219 2 2 2 2 274 3
                                    0 0 0 0 0 275 3 219 2 2 2 2 276 3 0 0 0 0 0
                                    277 3 219 2 2 2 2 278 3 0 0 0 0 0 279 3 219
                                    2 2 2 2 280 3 0 0 0 0 0 281 2 219 2 2 2 282
                                    2 0 0 0 0 283 2 219 2 2 2 284 2 0 0 0 0 285
                                    2 219 2 2 2 286 2 0 0 0 0 287 2 219 2 2 2
                                    288 2 0 0 0 0 289 2 219 2 2 2 290 2 0 0 0 0
                                    291 2 219 2 2 2 292 2 0 0 0 0 293 3 219 2 2
                                    2 2 294 3 0 0 0 0 0 295 3 219 2 2 2 2 296 3
                                    0 0 0 0 0 297 3 219 2 2 2 2 298 3 0 0 0 0 0
                                    299 3 219 2 2 2 2 300 3 0 0 0 0 0 301 3 219
                                    2 2 2 2 302 3 0 0 0 0 0 303 3 219 2 2 2 2
                                    304 3 0 0 0 0 0 305 2 219 2 2 2 306 2 0 0 0
                                    0 307 2 219 2 2 2 308 2 0 0 0 0 309 2 219 2
                                    2 2 310 2 0 0 0 0 311 2 219 2 2 2 312 2 0 0
                                    0 0 313 1 219 2 2 314 1 0 0 0 315 1 219 2 2
                                    316 1 0 0 0 317 2 219 2 2 2 318 2 0 0 0 0
                                    319 2 219 2 2 2 320 2 0 0 0 0 321 3 219 2 2
                                    2 2 322 3 0 0 0 0 0 323 2 219 2 2 2 324 2 0
                                    0 0 0 325 2 219 2 2 2 326 2 0 0 0 0 327 2
                                    219 2 2 2 328 2 0 0 0 0 329 2 219 2 2 2 330
                                    2 0 0 0 0 331 2 219 2 2 2 332 2 0 0 0 0 333
                                    3 219 2 2 2 2 334 3 0 0 0 0 0 335 1 219 2 2
                                    336 1 0 0 0 337 3 219 2 2 2 2 338 3 0 0 0 0
                                    0 339 5 219 2 2 2 2 2 2 340 5 0 0 0 0 0 0 0
                                    341 5 219 2 2 2 2 2 2 342 5 0 0 0 0 0 0 0
                                    343 5 219 2 2 2 2 2 2 344 5 0 0 0 0 0 0 0
                                    345 5 219 2 2 2 2 2 2 346 5 0 0 0 0 0 0 0
                                    347 2 219 2 2 2 348 2 0 0 0 0 349 4 219 2 2
                                    2 2 2 350 4 0 0 0 0 0 0 351 4 219 2 2 2 2 2
                                    352 4 0 0 0 0 0 0 353 3 219 2 2 2 2 354 3 0
                                    0 0 0 0 355 4 219 2 2 2 2 2 356 4 0 0 0 0 0
                                    0 357 4 219 2 2 2 2 2 358 4 0 0 0 0 0 0 359
                                    6 219 2 2 2 2 2 2 2 360 6 0 0 0 0 0 0 0 0
                                    361 6 219 2 2 2 2 2 2 2 362 6 0 0 0 0 0 0 0
                                    0 363 3 219 2 78 78 2 364 3 0 0 365 365 0
                                    366 5 219 2 78 78 78 78 2 367 5 0 0 365 365
                                    365 365 0 368 2 369 2 2 2 370 1 369 2 2 371
                                    1 0 0 0 372 2 369 2 2 2 373 2 0 0 0 0 374 2
                                    369 2 2 2 375 2 0 0 0 0 376 1 369 2 2 377 1
                                    0 0 0 378 2 369 2 2 27 379 2 0 0 0 27 380 2
                                    369 2 2 27 381 2 0 0 0 27 382 2 369 2 2 383
                                    384 2 0 0 0 385 386 2 369 2 2 27 387 2 0 0
                                    0 27 388 2 369 2 2 383 389 2 0 0 0 385 390
                                    1 391 2 2 392 1 0 0 0 393 1 391 2 2 394 1 0
                                    0 0 395 1 391 2 2 396 1 0 0 0 397 1 391 2 2
                                    398 1 0 0 0 399 1 391 2 2 400 1 0 0 0 401 1
                                    391 2 2 402 1 0 0 0 403 1 391 2 2 404 1 0 0
                                    0 405 1 391 2 2 406 1 0 0 0 407 1 391 2 2
                                    408 1 0 0 0 409 1 391 2 2 410 1 0 0 0 411 1
                                    391 2 2 412 1 0 0 0 413 2 391 2 2 27 414 2
                                    0 0 0 27 415 2 391 2 2 383 416 2 0 0 0 385
                                    417 1 159 9 10 418 1 159 10 10 419 1 164 9
                                    10 420 1 164 10 10 421 1 369 9 10 422 1 369
                                    10 10 423 1 391 9 10 424 1 391 10 10 425 1
                                    219 9 10 426 1 219 10 10 427 1 428 0 41 429
                                    2 431 430 428 15 432 1 430 433 0 434 2 41
                                    35 0 15 435 1 133 35 0 436 2 133 0 0 0 437
                                    1 41 0 15 438 2 433 428 0 428 439 0 133 0
                                    440 2 133 9 0 0 441 1 133 2 0 442 1 133 0 0
                                    443 2 42 0 0 0 444 1 42 0 0 445 2 41 9 0 0
                                    446 1 133 78 0 447 2 78 9 448 0 449 2 451
                                    120 450 133 452 1 0 6 0 453 2 120 0 41 35
                                    454 1 120 0 41 455 2 120 0 0 0 456 2 15 9 0
                                    0 457 0 458 0 459 0 35 0 460 3 458 0 0 27
                                    35 461 1 458 0 57 462 3 465 458 463 464 41
                                    466 2 41 0 118 15 467 1 41 0 57 471 3 474
                                    41 472 473 458 475 2 477 133 476 120 478 2
                                    482 0 458 458 483 1 482 0 458 484 1 485 0
                                    482 486 2 488 485 487 133 489 2 133 9 0 0
                                    490 0 133 0 491 2 45 118 118 118 492 2 78 0
                                    0 0 493 1 0 74 365 494 1 0 74 365 495 2 42
                                    0 0 0 496 1 42 0 0 497 0 27 0 498 2 42 0 15
                                    0 499 2 38 0 0 0 500 6 470 458 458 458 501
                                    38 27 38 502 6 481 458 503 503 504 38 27 38
                                    505 2 0 118 118 118 506 2 507 118 118 118
                                    508 1 510 509 133 511 1 0 512 118 513 0 514
                                    0 515 2 41 0 6 514 516 1 0 0 517 518 2 159
                                    2 2 519 520 2 0 0 0 519 521 1 159 133 15
                                    522 1 159 2 2 523 1 0 0 0 524 1 45 519 0
                                    525 1 0 519 0 526 1 45 71 0 527 1 6 0 57
                                    528 2 532 529 530 531 533 2 517 0 0 0 534 1
                                    0 535 0 536 1 0 0 6 537 1 517 0 519 538 2
                                    10 9 0 27 539 1 0 540 0 541 0 542 0 543 0
                                    120 0 544 2 120 9 0 0 545 1 120 35 0 546 2
                                    542 0 517 35 547 2 542 0 0 0 548 2 517 0
                                    118 27 549 1 531 10 10 550 2 531 0 10 365
                                    551 1 41 552 0 553 1 41 6 0 554 0 517 0 555
                                    1 120 9 0 556 2 517 0 0 35 557 2 517 0 0 0
                                    558 2 517 0 0 0 559 1 45 560 0 561 1 0 560
                                    0 562 4 0 0 0 563 365 27 564 4 0 0 0 10 0
                                    27 565 1 0 38 0 566 1 38 0 365 567 1 38 0 0
                                    568 1 27 9 0 569 2 38 0 570 0 571 2 572 140
                                    2 27 573 3 0 0 0 563 575 576 1 0 0 27 577 2
                                    578 0 2 2 579 2 0 0 0 580 581 3 584 582 2
                                    583 582 585 3 0 586 0 583 586 587 3 590 588
                                    2 589 588 591 3 0 592 0 589 592 593 1 45
                                    146 144 594 2 45 154 144 152 595 3 596 582
                                    15 583 582 597 4 600 598 45 583 598 599 601
                                    3 602 588 15 589 588 603 4 606 604 45 589
                                    604 605 607 2 45 0 57 15 608 1 45 610 0 611
                                    1 6 9 0 612 1 16 15 6 613 1 45 614 0 615 1
                                    0 614 0 616 3 0 0 0 74 365 617 2 0 0 574 12
                                    618 4 620 2 42 78 15 619 621 3 0 0 0 74 365
                                    622 2 0 0 10 365 623 1 0 624 0 625 1 610
                                    609 0 626 1 0 628 0 629 1 0 14 0 630 2 0 9
                                    0 0 117 1 1 365 118 1 1 1 365 649 1 2 1 365
                                    118 27 1 1 1 365 0 1 2 1 365 0 27 1 1 1 0
                                    118 1 1 1 0 649 1 2 1 0 118 27 1 1 1 0 0 1
                                    2 1 0 0 27 1 1 33 9 0 54 6 1 0 0 0 0 0 0 0
                                    363 3 1 0 0 0 0 281 3 1 0 0 0 0 279 3 1 0 0
                                    0 0 275 3 1 0 0 0 0 273 3 1 0 0 0 0 271 3 1
                                    0 0 0 0 277 3 1 0 0 0 0 269 2 1 0 0 0 285 1
                                    0 38 0 566 1 0 38 365 1 2 1 651 0 12 1 1 1
                                    0 0 225 1 1 648 0 1 1 1 0 0 1 1 1 9 0 1 1 0
                                    74 365 1 1 0 74 0 1 1 1 0 0 200 1 1 0 0 176
                                    2 1 0 0 385 386 2 1 0 0 27 382 2 22 640 0 0
                                    1 2 0 0 0 632 1 2 0 0 0 580 581 3 0 0 0 74
                                    365 622 2 1 0 0 0 289 2 1 0 0 0 287 1 28
                                    512 118 1 1 1 0 0 1 1 1 641 0 1 1 1 0 0 1 2
                                    28 636 637 118 1 2 0 9 0 0 95 2 1 9 0 0 1 1
                                    1 0 0 196 1 1 0 0 172 1 1 0 0 223 1 1 9 9
                                    128 1 1 0 0 204 1 1 0 0 180 0 32 0 1 1 1
                                    365 118 1 1 1 365 649 1 2 1 365 118 27 1 1
                                    1 365 0 1 2 1 365 0 27 1 3 1 0 0 118 27 163
                                    1 1 0 118 1 1 1 0 649 1 2 1 0 118 27 161 1
                                    1 0 0 1 2 1 0 0 27 1 1 16 640 0 1 2 16 0 0
                                    92 1 2 16 0 0 35 1 1 1 0 0 337 1 0 18 0 19
                                    1 0 540 0 541 1 0 14 0 630 1 19 535 0 536 1
                                    20 71 0 72 1 1 650 0 1 1 14 655 0 1 1 5 656
                                    0 1 1 0 12 0 13 1 0 27 0 1 1 0 6 0 453 1 19
                                    517 0 1 1 20 519 0 526 1 1 107 0 1 1 14 57
                                    0 1 1 5 105 0 1 2 1 0 0 0 1 1 25 638 144 1
                                    2 25 639 144 152 1 1 5 146 144 148 2 5 154
                                    144 152 156 1 1 0 0 111 1 16 640 0 1 6 1 0
                                    0 0 0 0 0 0 361 2 1 0 0 0 1 2 1 0 0 27 388
                                    2 1 0 0 385 390 1 1 646 365 1 1 1 9 0 1 2 1
                                    0 0 0 267 2 1 0 0 0 247 2 2 0 0 92 1 0 1 0
                                    166 2 1 0 0 0 376 3 12 592 0 589 592 593 3
                                    13 586 0 583 586 587 1 0 0 0 1 2 33 9 0 0 1
                                    1 0 563 0 1 1 0 10 10 37 1 16 9 0 52 1 34 9
                                    0 1 1 5 0 0 88 1 5 98 0 99 1 1 9 0 73 2 1 0
                                    0 57 1 2 1 624 365 0 1 1 35 118 12 132 4 1
                                    0 0 0 0 0 359 4 1 0 0 0 0 0 357 5 36 0 365
                                    365 365 365 0 368 2 0 0 574 12 618 1 0 18 0
                                    1 3 1 0 0 0 0 297 3 1 0 0 0 0 295 1 1 0 0
                                    170 1 1 0 0 407 3 1 0 0 0 0 335 3 1 0 0 0 0
                                    305 3 1 0 0 0 0 303 1 16 640 0 1 2 16 0 0
                                    92 1 2 16 0 0 35 1 2 1 647 0 0 1 2 1 0 0 0
                                    1 1 1 0 365 1 1 0 631 0 1 1 1 0 0 265 3 1 0
                                    0 0 0 355 3 1 0 0 0 0 301 3 1 0 0 0 0 299 4
                                    1 0 0 0 0 0 351 1 0 74 0 75 1 0 74 365 495
                                    2 0 0 10 0 1 2 0 0 10 365 623 2 1 0 0 0 313
                                    2 1 0 0 0 311 2 1 0 0 0 309 2 1 0 0 0 307 2
                                    1 0 0 0 331 2 1 0 0 0 333 2 1 0 0 0 325 4 1
                                    0 0 0 0 0 353 2 1 0 0 0 329 2 1 0 0 0 327 1
                                    16 624 0 1 1 5 659 0 1 1 29 624 0 625 1 29
                                    628 0 629 2 5 661 0 27 1 2 5 661 0 10 1 1
                                    16 661 0 1 2 0 9 0 10 1 2 0 9 0 27 76 1 8 0
                                    0 1 2 1 0 0 385 417 2 1 0 0 27 415 3 36 0
                                    365 365 0 366 2 1 0 0 0 349 1 0 35 0 1 2 1
                                    0 0 0 293 2 1 0 0 0 291 5 1 0 0 0 0 0 0 341
                                    5 1 0 0 0 0 0 0 347 5 1 0 0 0 0 0 0 345 5 1
                                    0 0 0 0 0 0 343 1 0 9 0 70 1 0 6 0 1 0 1 9
                                    127 2 1 118 118 118 506 1 1 0 365 1 2 1 0 0
                                    0 1 1 1 0 0 411 1 1 0 0 413 2 0 9 0 0 1 2 0
                                    9 0 27 1 1 1 0 0 231 1 1 0 0 229 1 1 0 0
                                    378 2 1 0 0 27 380 1 1 0 0 372 1 28 512 118
                                    1 1 28 512 118 513 1 1 641 0 1 3 1 643 0 0
                                    0 1 2 1 644 0 0 1 2 1 640 0 0 1 2 1 624 365
                                    0 1 1 1 0 0 168 1 34 9 0 1 3 0 0 0 12 0 1 2
                                    0 0 0 580 1 3 0 0 0 74 365 617 2 0 0 0 632
                                    1 3 0 0 0 365 365 1 3 0 0 0 0 0 1 3 0 0 0
                                    38 575 1 3 0 0 0 38 634 1 3 0 0 0 27 574 1
                                    3 0 0 0 27 633 1 3 0 0 0 563 575 576 3 0 0
                                    0 10 633 1 3 0 0 0 563 634 1 3 0 0 0 10 574
                                    1 4 9 0 0 10 0 27 565 4 9 0 0 563 365 27
                                    564 4 5 0 0 27 35 633 1 4 5 0 0 27 35 574 1
                                    4 5 0 0 38 657 634 1 4 5 0 0 38 657 575 1 1
                                    1 35 0 1 1 1 0 0 395 1 1 0 0 393 2 0 0 10 0
                                    1 4 0 0 10 0 0 0 1 3 0 0 10 0 0 1 5 0 0 10
                                    0 0 0 0 1 7 0 0 10 0 0 0 0 0 0 1 6 0 0 10 0
                                    0 0 0 0 1 8 0 0 10 0 0 0 0 0 0 0 1 10 0 0
                                    10 0 0 0 0 0 0 0 0 0 1 9 0 0 10 0 0 0 0 0 0
                                    0 0 1 2 0 0 10 365 1 3 1 0 0 0 0 323 1 1 0
                                    0 315 2 1 0 0 0 321 1 1 0 0 317 2 1 0 0 0
                                    319 2 1 645 0 0 1 2 0 0 0 0 1 1 0 0 0 1 1 1
                                    0 0 233 1 1 0 0 409 1 1 0 0 245 2 5 0 0 38
                                    1 2 5 0 0 27 1 3 5 0 0 27 35 1 3 5 0 0 38
                                    657 1 1 1 0 0 89 1 1 98 0 101 1 35 0 0 524
                                    1 1 0 0 206 1 1 0 0 182 1 1 0 0 202 1 1 0 0
                                    178 1 1 0 0 198 1 1 0 0 174 1 9 560 0 562 1
                                    10 589 0 1 1 11 583 0 1 1 1 0 641 1 2 7 0 0
                                    0 1 1 1 0 0 235 1 37 635 144 1 2 18 0 0 0 1
                                    1 0 614 0 616 1 0 0 12 136 1 0 0 27 577 1 0
                                    0 6 537 1 19 0 517 518 1 24 0 519 1 1 23 0
                                    57 61 1 1 0 0 1 1 1 0 107 110 1 1 0 652 1 1
                                    1 0 653 1 1 1 0 654 1 1 5 0 105 106 1 5 0
                                    98 104 1 38 640 0 1 3 1 0 0 0 0 339 0 5 35
                                    1 1 1 0 0 227 1 0 0 0 1 2 1 0 0 0 374 2 1 0
                                    0 0 251 2 1 0 0 0 255 2 1 0 0 0 249 2 1 0 0
                                    0 253 1 0 9 10 11 1 1 0 0 212 1 1 0 0 188 3
                                    5 0 0 0 0 1 2 1 9 0 0 1 1 1 0 0 208 1 1 0 0
                                    184 1 1 0 0 216 1 1 0 0 192 2 0 0 27 0 1 3
                                    0 0 27 0 0 1 5 0 0 27 0 0 0 0 1 4 0 0 27 0
                                    0 0 1 2 0 0 27 365 1 2 5 0 0 0 1 2 5 9 0 0
                                    1 2 1 0 0 0 283 1 1 74 365 494 1 1 74 0 83
                                    1 1 0 0 263 1 1 0 0 261 1 1 0 0 259 1 1 0 0
                                    257 1 1 0 0 218 1 1 0 0 194 1 1 0 0 214 1 1
                                    0 0 190 1 1 0 0 210 1 1 0 0 186 1 1 0 0 221
                                    2 8 0 0 57 91 2 1 0 0 519 521 2 1 0 0 0 84
                                    2 16 0 0 92 93 2 16 0 0 35 90 0 33 0 47 1 1
                                    0 0 399 1 1 0 0 403 0 16 0 49 2 1 0 0 0 239
                                    1 1 0 0 237 1 1 0 0 397 2 5 0 0 27 1 2 5 0
                                    0 38 1 3 5 0 0 38 657 1 3 5 0 0 27 35 1 1 1
                                    0 0 401 1 1 0 0 405 3 1 0 0 0 0 243 2 1 0 0
                                    0 241 2 0 9 0 0 96 2 8 0 0 0 69 2 1 0 98 98
                                    139 1 22 0 0 56 2 22 0 0 0 67 2 29 0 0 0 65
                                    2 25 0 0 57 1 2 33 0 35 0 1 2 22 0 57 0 59
                                    2 29 0 92 0 1 2 2 0 6 0 1 2 1 0 0 519 1 2 1
                                    0 519 0 1 2 5 0 0 6 1 2 16 0 0 0 63)))))
           '|lookupComplete|)) 
