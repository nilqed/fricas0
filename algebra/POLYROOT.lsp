
(SDEFUN |POLYROOT;zroot|
        ((|x| (|Integer|)) (|n| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |exponent| (|NonNegativeInteger|))
                    (|:| |coef| (|Integer|)) (|:| |radicand| (|Integer|)))))
        (SPROG
         ((#1=#:G12 NIL) (#2=#:G11 #3=(|Integer|)) (#4=#:G13 #3#)
          (#5=#:G16 NIL) (#6=#:G0 NIL)
          (|s|
           (|Record| (|:| |exponent| (|NonNegativeInteger|))
                     (|:| |coef| (|Integer|)) (|:| |radicand| (|List| #3#)))))
         (SEQ
          (COND ((OR (ZEROP |x|) (EQL |x| 1)) (VECTOR 1 |x| 1))
                ('T
                 (SEQ
                  (LETT |s|
                        (SPADCALL (SPADCALL |x| (QREFELT % 15)) |n|
                                  (QREFELT % 20)))
                  (EXIT
                   (VECTOR (QVELT |s| 0) (QVELT |s| 1)
                           (PROGN
                            (LETT #1# NIL)
                            (SEQ (LETT #6# NIL) (LETT #5# (QVELT |s| 2)) G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN (LETT #6# (CAR #5#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #4# #6#)
                                    (COND (#1# (LETT #2# (* #2# #4#)))
                                          ('T
                                           (PROGN
                                            (LETT #2# #4#)
                                            (LETT #1# 'T)))))))
                                 (LETT #5# (CDR #5#)) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#1# #2#) ('T 1))))))))))) 

(SDEFUN |POLYROOT;iroot|
        ((|x| (|Integer|)) (|n| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |exponent| (|NonNegativeInteger|))
                    (|:| |coef| (|Integer|)))))
        (SPROG
         ((#1=#:G26 NIL) (|p| (|Integer|)) (|nn| (|Integer|)) (|e| (|Integer|))
          (|ru| (|Union| (|Integer|) "failed")))
         (SEQ
          (COND ((EQL |x| 1) (CONS 1 1))
                ('T
                 (SEQ (LETT |e| 1) (LETT |nn| |n|) (LETT |p| 2)
                      (SEQ G190 (COND ((NULL (<= |p| |nn|)) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL (EQL (REM |nn| |p|) 0))
                               (LETT |p| (SPADCALL |p| (QREFELT % 22))))
                              ('T
                               (SEQ
                                (LETT |ru| (SPADCALL |x| |p| (QREFELT % 25)))
                                (EXIT
                                 (COND
                                  ((QEQCAR |ru| 0)
                                   (SEQ (LETT |x| (QCDR |ru|))
                                        (LETT |e| (* |e| |p|))
                                        (EXIT (LETT |nn| (REM |nn| |p|)))))
                                  ('T
                                   (LETT |p|
                                         (SPADCALL |p| (QREFELT % 22)))))))))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (CONS
                        (PROG1 (LETT #1# (QUOTIENT2 |n| |e|))
                          (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #1#))
                        |x|)))))))) 

(SDEFUN |POLYROOT;czroot|
        ((|x| (|Integer|)) (|n| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                    (|:| |radicand| F))))
        (SPROG
         ((|rec|
           (|Record| (|:| |exponent| (|NonNegativeInteger|))
                     (|:| |coef| (|Integer|)) (|:| |radicand| (|Integer|)))))
         (SEQ (LETT |rec| (|POLYROOT;zroot| |x| |n| %))
              (COND
               ((EQL (QVELT |rec| 0) 2)
                (COND
                 ((< (QVELT |rec| 2) 0)
                  (EXIT
                   (VECTOR (QVELT |rec| 0)
                           (SPADCALL (QVELT |rec| 1)
                                     (SPADCALL
                                      (SPADCALL (SPADCALL (QREFELT % 26))
                                                (QREFELT % 27))
                                      (QREFELT % 28))
                                     (QREFELT % 29))
                           (SPADCALL (- (QVELT |rec| 2)) (QREFELT % 30))))))))
              (EXIT
               (VECTOR (QVELT |rec| 0)
                       (SPADCALL (QVELT |rec| 1) (QREFELT % 30))
                       (SPADCALL (QVELT |rec| 2) (QREFELT % 30))))))) 

(SDEFUN |POLYROOT;qroot;FNniR;4|
        ((|x| (|Fraction| (|Integer|))) (|n| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                    (|:| |radicand| F))))
        (SPROG
         ((|m| (|NonNegativeInteger|)) (#1=#:G36 NIL)
          (|sd|
           #2=(|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                        (|:| |radicand| F)))
          (|sn| #2#))
         (SEQ
          (LETT |sn| (|POLYROOT;czroot| (SPADCALL |x| (QREFELT % 32)) |n| %))
          (LETT |sd| (|POLYROOT;czroot| (SPADCALL |x| (QREFELT % 33)) |n| %))
          (LETT |m|
                (PROG1
                    (LETT #1#
                          (SPADCALL (QVELT |sn| 0) (QVELT |sd| 0)
                                    (QREFELT % 34)))
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#)))
          (EXIT
           (VECTOR |m| (SPADCALL (QVELT |sn| 1) (QVELT |sd| 1) (QREFELT % 35))
                   (SPADCALL
                    (SPADCALL (QVELT |sn| 2) (QUOTIENT2 |m| (QVELT |sn| 0))
                              (QREFELT % 36))
                    (SPADCALL (QVELT |sd| 2) (QUOTIENT2 |m| (QVELT |sd| 0))
                              (QREFELT % 36))
                    (QREFELT % 35))))))) 

(SDEFUN |POLYROOT;qroot;FNniR;5|
        ((|x| (|Fraction| (|Integer|))) (|n| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                    (|:| |radicand| F))))
        (SPROG
         ((|m| (|NonNegativeInteger|)) (#1=#:G42 NIL)
          (|sd|
           #2=(|Record| (|:| |exponent| (|NonNegativeInteger|))
                        (|:| |coef| (|Integer|)) (|:| |radicand| (|Integer|))))
          (|sn| #2#))
         (SEQ
          (LETT |sn| (|POLYROOT;zroot| (SPADCALL |x| (QREFELT % 32)) |n| %))
          (LETT |sd| (|POLYROOT;zroot| (SPADCALL |x| (QREFELT % 33)) |n| %))
          (LETT |m|
                (PROG1
                    (LETT #1#
                          (SPADCALL (QVELT |sn| 0) (QVELT |sd| 0)
                                    (QREFELT % 34)))
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#)))
          (EXIT
           (VECTOR |m|
                   (SPADCALL (SPADCALL (QVELT |sn| 1) (QREFELT % 30))
                             (SPADCALL (QVELT |sd| 1) (QREFELT % 30))
                             (QREFELT % 35))
                   (SPADCALL
                    (SPADCALL
                     (EXPT (QVELT |sn| 2) (QUOTIENT2 |m| (QVELT |sn| 0)))
                     (QREFELT % 30))
                    (SPADCALL
                     (EXPT (QVELT |sd| 2) (QUOTIENT2 |m| (QVELT |sd| 0)))
                     (QREFELT % 30))
                    (QREFELT % 35))))))) 

(SDEFUN |POLYROOT;rroot;RNniR;6|
        ((|x| (R)) (|n| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                    (|:| |radicand| F))))
        (SPROG ((|r| (|Union| (|Fraction| (|Integer|)) "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 40)))
                    (EXIT
                     (COND
                      ((QEQCAR |r| 1)
                       (VECTOR |n| (|spadConstant| % 41)
                               (SPADCALL (SPADCALL |x| (QREFELT % 27))
                                         (QREFELT % 28))))
                      ('T (SPADCALL (QCDR |r|) |n| (QREFELT % 38)))))))) 

(SDEFUN |POLYROOT;rroot;RNniR;7|
        ((|x| (R)) (|n| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                    (|:| |radicand| F))))
        (SPROG ((|r| (|Union| (|Integer|) "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 43)))
                    (EXIT
                     (COND
                      ((QEQCAR |r| 1)
                       (VECTOR |n| (|spadConstant| % 41)
                               (SPADCALL (SPADCALL |x| (QREFELT % 27))
                                         (QREFELT % 28))))
                      ('T
                       (SPADCALL (SPADCALL (QCDR |r|) (QREFELT % 44)) |n|
                                 (QREFELT % 38)))))))) 

(SDEFUN |POLYROOT;rroot;RNniR;8|
        ((|x| (R)) (|n| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                    (|:| |radicand| F))))
        (VECTOR |n| (|spadConstant| % 41)
                (SPADCALL (SPADCALL |x| (QREFELT % 27)) (QREFELT % 28)))) 

(SDEFUN |POLYROOT;rsplit|
        ((|l| (|List| P)) (% (|Record| (|:| |coef| R) (|:| |poly| P))))
        (SPROG
         ((|r| (R)) (|p| (P)) (|u| (|Union| R "failed")) (#1=#:G68 NIL)
          (|q| NIL))
         (SEQ (LETT |r| (|spadConstant| % 11)) (LETT |p| (|spadConstant| % 12))
              (SEQ (LETT |q| NIL) (LETT #1# |l|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |q| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |u| (SPADCALL |q| (QREFELT % 46)))
                        (EXIT
                         (COND
                          ((QEQCAR |u| 1)
                           (LETT |p| (SPADCALL |p| |q| (QREFELT % 47))))
                          ('T
                           (LETT |r|
                                 (SPADCALL |r| (QCDR |u|) (QREFELT % 48)))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |r| |p|))))) 

(SDEFUN |POLYROOT;nthr;PNniR;10|
        ((|x| (P)) (|n| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| P)
                    (|:| |radicand| (|List| P)))))
        (SPROG
         ((|rad2| (|List| P)) (#1=#:G87 NIL) (|ri| NIL) (#2=#:G86 NIL)
          (|e2| (|NonNegativeInteger|)) (|e| (|NonNegativeInteger|))
          (|l| (|Integer|))
          (|rec2|
           (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| P)
                     (|:| |radicand| (|List| P))))
          (#3=#:G76 NIL) (|xu| (|Union| P #4="failed")) (|cp| (P))
          (|rec|
           (|Record| (|:| |exponent| (|NonNegativeInteger|))
                     (|:| |coef| (|Integer|))))
          (|r| (|Union| (|Integer|) "failed")) (|c| (R)))
         (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 49)))
              (EXIT
               (COND
                ((QEQCAR |r| 0)
                 (SEQ (LETT |rec| (|POLYROOT;zroot| (QCDR |r|) |n| %))
                      (EXIT
                       (VECTOR (QVELT |rec| 0)
                               (SPADCALL (QVELT |rec| 1) (QREFELT % 50))
                               (LIST
                                (SPADCALL (QVELT |rec| 2) (QREFELT % 50)))))))
                (#5='T
                 (SEQ (LETT |c| (SPADCALL |x| (QREFELT % 51)))
                      (LETT |r| (SPADCALL |c| (QREFELT % 43)))
                      (EXIT
                       (COND
                        ((QEQCAR |r| 0)
                         (SEQ (LETT |rec| (|POLYROOT;iroot| (QCDR |r|) |n| %))
                              (EXIT
                               (COND
                                ((EQL (QCAR |rec|) |n|)
                                 (SPADCALL (SPADCALL |x| (QREFELT % 52)) |n|
                                           (QREFELT % 56)))
                                (#5#
                                 (SEQ (LETT |cp| (SPADCALL |c| (QREFELT % 27)))
                                      (LETT |xu|
                                            (SPADCALL |x| |cp| (QREFELT % 58)))
                                      (LETT |rec2|
                                            (SPADCALL
                                             (SPADCALL
                                              (PROG2 (LETT #3# |xu|)
                                                  (QCDR #3#)
                                                (|check_union2| (QEQCAR #3# 0)
                                                                (QREFELT % 9)
                                                                (|Union|
                                                                 (QREFELT % 9)
                                                                 #4#)
                                                                #3#))
                                              (QREFELT % 52))
                                             |n| (QREFELT % 56)))
                                      (EXIT
                                       (COND
                                        ((EQL (QCAR |rec|) 1)
                                         (VECTOR (QVELT |rec2| 0)
                                                 (SPADCALL
                                                  (SPADCALL (QCDR |rec|)
                                                            (QREFELT % 50))
                                                  (QVELT |rec2| 1)
                                                  (QREFELT % 47))
                                                 (QVELT |rec2| 2)))
                                        (#5#
                                         (SEQ
                                          (LETT |l|
                                                (SPADCALL (QCAR |rec|)
                                                          (QVELT |rec2| 0)
                                                          (QREFELT % 34)))
                                          (LETT |e|
                                                (QUOTIENT2 |l| (QCAR |rec|)))
                                          (LETT |e2|
                                                (QUOTIENT2 |l|
                                                           (QVELT |rec2| 0)))
                                          (LETT |rad2|
                                                (PROGN
                                                 (LETT #2# NIL)
                                                 (SEQ (LETT |ri| NIL)
                                                      (LETT #1#
                                                            (QVELT |rec2| 2))
                                                      G190
                                                      (COND
                                                       ((OR (ATOM #1#)
                                                            (PROGN
                                                             (LETT |ri|
                                                                   (CAR #1#))
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (LETT #2#
                                                              (CONS
                                                               (SPADCALL |ri|
                                                                         |e2|
                                                                         (QREFELT
                                                                          %
                                                                          59))
                                                               #2#))))
                                                      (LETT #1# (CDR #1#))
                                                      (GO G190) G191
                                                      (EXIT (NREVERSE #2#)))))
                                          (EXIT
                                           (VECTOR |l| (QVELT |rec2| 1)
                                                   (CONS
                                                    (SPADCALL
                                                     (SPADCALL (QCDR |rec|)
                                                               (QREFELT % 50))
                                                     |e| (QREFELT % 59))
                                                    |rad2|)))))))))))))
                        (#5#
                         (SPADCALL (SPADCALL |x| (QREFELT % 52)) |n|
                                   (QREFELT % 56)))))))))))) 

(SDEFUN |POLYROOT;nthr;PNniR;11|
        ((|x| (P)) (|n| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| P)
                    (|:| |radicand| (|List| P)))))
        (SPADCALL (SPADCALL |x| (QREFELT % 52)) |n| (QREFELT % 56))) 

(SDEFUN |POLYROOT;froot;FNniR;12|
        ((|x| (F)) (|n| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                    (|:| |radicand| F))))
        (SPROG
         ((|m| (|NonNegativeInteger|)) (#1=#:G94 NIL)
          (|rd|
           #2=(|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                        (|:| |radicand| F)))
          (|rn| #2#) (|pd| #3=(|Record| (|:| |coef| R) (|:| |poly| P)))
          (|pn| #3#)
          (|sd|
           #4=(|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| P)
                        (|:| |radicand| (|List| P))))
          (|sn| #4#))
         (SEQ
          (COND
           ((OR (SPADCALL |x| (QREFELT % 62))
                (SPADCALL |x| (|spadConstant| % 41) (QREFELT % 63)))
            (VECTOR 1 |x| (|spadConstant| % 41)))
           ('T
            (SEQ
             (LETT |sn|
                   (SPADCALL (SPADCALL |x| (QREFELT % 64)) |n| (QREFELT % 60)))
             (LETT |sd|
                   (SPADCALL (SPADCALL |x| (QREFELT % 65)) |n| (QREFELT % 60)))
             (LETT |pn| (|POLYROOT;rsplit| (QVELT |sn| 2) %))
             (LETT |pd| (|POLYROOT;rsplit| (QVELT |sd| 2) %))
             (LETT |rn| (SPADCALL (QCAR |pn|) (QVELT |sn| 0) (QREFELT % 42)))
             (LETT |rd| (SPADCALL (QCAR |pd|) (QVELT |sd| 0) (QREFELT % 42)))
             (LETT |m|
                   (PROG1
                       (LETT #1#
                             (SPADCALL
                              (LIST (QVELT |rn| 0) (QVELT |rd| 0)
                                    (QVELT |sn| 0) (QVELT |sd| 0))
                              (QREFELT % 67)))
                     (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #1#)))
             (EXIT
              (VECTOR |m|
                      (SPADCALL
                       (SPADCALL (SPADCALL (QVELT |sn| 1) (QREFELT % 28))
                                 (SPADCALL (QVELT |sd| 1) (QREFELT % 28))
                                 (QREFELT % 35))
                       (SPADCALL (QVELT |rn| 1) (QVELT |rd| 1) (QREFELT % 35))
                       (QREFELT % 68))
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (QVELT |rn| 2)
                                   (QUOTIENT2 |m| (QVELT |rn| 0))
                                   (QREFELT % 36))
                         (SPADCALL (QVELT |rd| 2)
                                   (QUOTIENT2 |m| (QVELT |rd| 0))
                                   (QREFELT % 36))
                         (QREFELT % 35))
                        (SPADCALL
                         (SPADCALL (QCDR |pn|) (QUOTIENT2 |m| (QVELT |sn| 0))
                                   (QREFELT % 59))
                         (QREFELT % 28))
                        (QREFELT % 68))
                       (SPADCALL
                        (SPADCALL (QCDR |pd|) (QUOTIENT2 |m| (QVELT |sd| 0))
                                  (QREFELT % 59))
                        (QREFELT % 28))
                       (QREFELT % 35)))))))))) 

(DECLAIM (NOTINLINE |PolynomialRoots;|)) 

(DEFUN |PolynomialRoots;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT DV$5 (|devaluate| |#5|))
    (LETT |dv$| (LIST '|PolynomialRoots| DV$1 DV$2 DV$3 DV$4 DV$5))
    (LETT % (GETREFV 70))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#3| '(|GcdDomain|))))))
    (|haddProp| |$ConstructorCache| '|PolynomialRoots|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (QSETREFV % 10 |#5|)
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|HasSignature| |#3| (LIST '|imaginary| (LIST (|devaluate| |#3|))))
      (PROGN
       (QSETREFV % 38 (CONS (|dispatchFunction| |POLYROOT;qroot;FNniR;4|) %))))
     ('T
      (QSETREFV % 38 (CONS (|dispatchFunction| |POLYROOT;qroot;FNniR;5|) %))))
    (COND
     ((|HasCategory| |#3| '(|RetractableTo| (|Fraction| (|Integer|))))
      (QSETREFV % 42 (CONS (|dispatchFunction| |POLYROOT;rroot;RNniR;6|) %)))
     ((|HasCategory| |#3| '(|RetractableTo| (|Integer|)))
      (QSETREFV % 42 (CONS (|dispatchFunction| |POLYROOT;rroot;RNniR;7|) %)))
     ('T
      (QSETREFV % 42 (CONS (|dispatchFunction| |POLYROOT;rroot;RNniR;8|) %))))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (COND
        ((|HasCategory| |#3| '(|RetractableTo| (|Integer|)))
         (QSETREFV % 60
                   (CONS (|dispatchFunction| |POLYROOT;nthr;PNniR;10|) %)))
        ('T
         (QSETREFV % 60
                   (CONS (|dispatchFunction| |POLYROOT;nthr;PNniR;11|) %))))
       (QSETREFV % 69
                 (CONS (|dispatchFunction| |POLYROOT;froot;FNniR;12|) %)))))
    %))) 

(DEFUN |PolynomialRoots| (&REST #1=#:G97)
  (SPROG NIL
         (PROG (#2=#:G98)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PolynomialRoots|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PolynomialRoots;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PolynomialRoots|)))))))))) 

(MAKEPROP '|PolynomialRoots| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (0 . |One|)
              (4 . |One|) (|Factored| %) (|Integer|) (8 . |squareFree|)
              (|Record| (|:| |exponent| 18) (|:| |coef| 14)
                        (|:| |radicand| (|List| 14)))
              (|Factored| 14) (|NonNegativeInteger|) (|FactoredFunctions| 14)
              (13 . |nthRoot|) (|IntegerPrimesPackage| 14) (19 . |nextPrime|)
              (|Union| 14 '"failed") (|IntegerRoots| 14)
              (24 . |perfectNthRoot|) (30 . |imaginary|) (34 . |coerce|)
              (39 . |coerce|) (44 . *) (50 . |coerce|) (|Fraction| 14)
              (55 . |numer|) (60 . |denom|) (65 . |lcm|) (71 . /) (77 . ^)
              (|Record| (|:| |exponent| 18) (|:| |coef| 10)
                        (|:| |radicand| 10))
              (83 . |qroot|) (|Union| 31 '#1="failed") (89 . |retractIfCan|)
              (94 . |One|) (98 . |rroot|) (104 . |retractIfCan|)
              (109 . |coerce|) (|Union| 8 '#1#) (114 . |retractIfCan|)
              (119 . *) (125 . *) (131 . |retractIfCan|) (136 . |coerce|)
              (141 . |content|) (146 . |squareFree|)
              (|Record| (|:| |exponent| 18) (|:| |coef| 9)
                        (|:| |radicand| (|List| 9)))
              (|Factored| 9) (|FactoredFunctions| 9) (151 . |nthRoot|)
              (|Union| % '"failed") (157 . |exquo|) (163 . ^) (169 . |nthr|)
              (|Boolean|) (175 . |zero?|) (180 . =) (186 . |numer|)
              (191 . |denom|) (|List| %) (196 . |lcm|) (201 . *)
              (207 . |froot|))
           '#(|rroot| 213 |qroot| 219 |nthr| 225 |froot| 231) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|rroot|
                                 ((|Record|
                                   (|:| |exponent| (|NonNegativeInteger|))
                                   (|:| |coef| |#5|) (|:| |radicand| |#5|))
                                  |#3| (|NonNegativeInteger|)))
                                T)
                              '((|qroot|
                                 ((|Record|
                                   (|:| |exponent| (|NonNegativeInteger|))
                                   (|:| |coef| |#5|) (|:| |radicand| |#5|))
                                  (|Fraction| (|Integer|))
                                  (|NonNegativeInteger|)))
                                T)
                              '((|froot|
                                 ((|Record|
                                   (|:| |exponent| (|NonNegativeInteger|))
                                   (|:| |coef| |#5|) (|:| |radicand| |#5|))
                                  |#5| (|NonNegativeInteger|)))
                                (|has| 8 (|GcdDomain|)))
                              '((|nthr|
                                 ((|Record|
                                   (|:| |exponent| (|NonNegativeInteger|))
                                   (|:| |coef| |#4|)
                                   (|:| |radicand| (|List| |#4|)))
                                  |#4| (|NonNegativeInteger|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 69
                                            '(0 8 0 11 0 9 0 12 1 14 13 0 15 2
                                              19 16 17 18 20 1 21 14 14 22 2 24
                                              23 14 18 25 0 8 0 26 1 9 0 8 27 1
                                              10 0 9 28 2 10 0 14 0 29 1 10 0
                                              14 30 1 31 14 0 32 1 31 14 0 33 2
                                              14 0 0 0 34 2 10 0 0 0 35 2 10 0
                                              0 18 36 2 0 37 31 18 38 1 8 39 0
                                              40 0 10 0 41 2 0 37 8 18 42 1 8
                                              23 0 43 1 31 0 14 44 1 9 45 0 46
                                              2 9 0 0 0 47 2 8 0 0 0 48 1 9 23
                                              0 49 1 9 0 14 50 1 9 8 0 51 1 9
                                              13 0 52 2 55 53 54 18 56 2 9 57 0
                                              0 58 2 9 0 0 18 59 2 0 53 9 18 60
                                              1 10 61 0 62 2 10 61 0 0 63 1 10
                                              9 0 64 1 10 9 0 65 1 14 0 66 67 2
                                              10 0 0 0 68 2 0 37 10 18 69 2 0
                                              37 8 18 42 2 0 37 31 18 38 2 0 53
                                              9 18 60 2 1 37 10 18 69)))))
           '|lookupComplete|)) 
