
(SDEFUN |COMBF;factorial;2F;1| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 13) |x| (QREFELT $ 23))) 

(SDEFUN |COMBF;binomial;3F;2| ((|x| F) (|y| F) ($ F))
        (SPADCALL (QREFELT $ 15) (LIST |x| |y|) (QREFELT $ 26))) 

(SDEFUN |COMBF;permutation;3F;3| ((|x| F) (|y| F) ($ F))
        (SPADCALL (QREFELT $ 14) (LIST |x| |y|) (QREFELT $ 26))) 

(SDEFUN |COMBF;number?| ((|x| F) ($ |Boolean|))
        (COND
         ((|HasCategory| (QREFELT $ 6) (LIST '|RetractableTo| '(|Integer|)))
          (COND ((SPADCALL |x| (QREFELT $ 30)) 'T)
                (#1='T (QEQCAR (SPADCALL |x| (QREFELT $ 32)) 0))))
         (#1# (SPADCALL |x| (QREFELT $ 30))))) 

(SDEFUN |COMBF;^;3F;5| ((|x| F) (|y| F) ($ F))
        (SPROG
         ((|expr| (|Record| (|:| |val| F) (|:| |exponent| (|Integer|))))
          (|exp|
           (|Union| (|Record| (|:| |val| F) (|:| |exponent| (|Integer|)))
                    "failed"))
          (|args| (|List| F)))
         (SEQ
          (COND
           ((SPADCALL |x| '|%power| (QREFELT $ 33))
            (SEQ
             (LETT |args|
                   (SPADCALL (|SPADfirst| (SPADCALL |x| (QREFELT $ 35)))
                             (QREFELT $ 38))
                   . #1=(|COMBF;^;3F;5|))
             (COND
              ((NULL (EQL (LENGTH |args|) 2))
               (EXIT (|error| "Too many arguments to ^"))))
             (COND
              ((|COMBF;number?| (|SPADfirst| |args|) $)
               (COND
                ((|COMBF;number?| |y| $)
                 (EXIT
                  (SPADCALL (QREFELT $ 20)
                            (LIST
                             (SPADCALL (|SPADfirst| |args|) |y| (QREFELT $ 39))
                             (SPADCALL |args| (QREFELT $ 40)))
                            (QREFELT $ 26)))))))
             (EXIT
              (SPADCALL (QREFELT $ 20)
                        (LIST (|SPADfirst| |args|)
                              (SPADCALL (SPADCALL |args| (QREFELT $ 40)) |y|
                                        (QREFELT $ 41)))
                        (QREFELT $ 26)))))
           (#2='T
            (SEQ (LETT |exp| (SPADCALL |x| (QREFELT $ 44)) . #1#)
                 (EXIT
                  (COND
                   ((QEQCAR |exp| 0)
                    (SEQ (LETT |expr| (QCDR |exp|) . #1#)
                         (EXIT
                          (SPADCALL (QREFELT $ 20)
                                    (LIST (QCAR |expr|)
                                          (SPADCALL (QCDR |expr|) |y|
                                                    (QREFELT $ 46)))
                                    (QREFELT $ 26)))))
                   (#2#
                    (SPADCALL (QREFELT $ 20) (LIST |x| |y|)
                              (QREFELT $ 26))))))))))) 

(SDEFUN |COMBF;belong?;BoB;6| ((|op| |BasicOperator|) ($ |Boolean|))
        (SPADCALL |op| (QREFELT $ 8) (QREFELT $ 47))) 

(SDEFUN |COMBF;fourth| ((|l| |List| F) ($ F))
        (SPADCALL (CDR |l|) (QREFELT $ 49))) 

(SDEFUN |COMBF;dvpow1| ((|l| |List| F) ($ F))
        (SPADCALL (SPADCALL |l| (QREFELT $ 40))
                  (SPADCALL (|SPADfirst| |l|)
                            (SPADCALL (SPADCALL |l| (QREFELT $ 40))
                                      (|spadConstant| $ 50) (QREFELT $ 51))
                            (QREFELT $ 39))
                  (QREFELT $ 41))) 

(SDEFUN |COMBF;factorials;2F;9| ((|x| F) ($ F))
        (|COMBF;facts| |x| (SPADCALL |x| (QREFELT $ 53)) $)) 

(SDEFUN |COMBF;factorials;FSF;10| ((|x| F) (|v| |Symbol|) ($ F))
        (|COMBF;facts| |x| (LIST |v|) $)) 

(SDEFUN |COMBF;facts| ((|x| F) (|l| |List| (|Symbol|)) ($ F))
        (SPADCALL (|COMBF;smpfact| (SPADCALL |x| (QREFELT $ 57)) |l| $)
                  (|COMBF;smpfact| (SPADCALL |x| (QREFELT $ 58)) |l| $)
                  (QREFELT $ 59))) 

(SDEFUN |COMBF;summand| ((|l| |List| F) ($ F))
        (SPADCALL (|SPADfirst| |l|)
                  (SPADCALL (SPADCALL |l| (QREFELT $ 40)) (QREFELT $ 61))
                  (SPADCALL |l| (QREFELT $ 49)) (QREFELT $ 62))) 

(SDEFUN |COMBF;product;FSF;13| ((|x| F) (|i| |Symbol|) ($ F))
        (SPROG ((|k| (|Kernel| F)) (|dm| (F)))
               (SEQ
                (LETT |dm| (SPADCALL (SPADCALL (QREFELT $ 63)) (QREFELT $ 64))
                      . #1=(|COMBF;product;FSF;13|))
                (EXIT
                 (SPADCALL (QREFELT $ 18)
                           (LIST
                            (SPADCALL |x|
                                      (LETT |k| (SPADCALL |i| (QREFELT $ 65))
                                            . #1#)
                                      |dm| (QREFELT $ 62))
                            |dm| (SPADCALL |k| (QREFELT $ 66)))
                           (QREFELT $ 26)))))) 

(SDEFUN |COMBF;summation;FSF;14| ((|x| F) (|i| |Symbol|) ($ F))
        (SPROG ((|k| (|Kernel| F)) (|dm| (F)))
               (SEQ
                (LETT |dm| (SPADCALL (SPADCALL (QREFELT $ 63)) (QREFELT $ 64))
                      . #1=(|COMBF;summation;FSF;14|))
                (EXIT
                 (SPADCALL (QREFELT $ 16)
                           (LIST
                            (SPADCALL |x|
                                      (LETT |k| (SPADCALL |i| (QREFELT $ 65))
                                            . #1#)
                                      |dm| (QREFELT $ 62))
                            |dm| (SPADCALL |k| (QREFELT $ 66)))
                           (QREFELT $ 26)))))) 

(SDEFUN |COMBF;dvsum| ((|l| |List| F) (|x| |Symbol|) ($ F))
        (SPADCALL (QREFELT $ 16)
                  (LIST (SPADCALL (|SPADfirst| |l|) |x| (QREFELT $ 69))
                        (SPADCALL |l| (QREFELT $ 40))
                        (SPADCALL |l| (QREFELT $ 49)))
                  (QREFELT $ 26))) 

(SDEFUN |COMBF;dvdsum| ((|l| |List| F) (|x| |Symbol|) ($ F))
        (SPROG
         ((|dh| (F)) (|dg| (F)) (|dm| (F)) (|r1| (F)) (|h| (F)) (|g| (F))
          (|v| (F)) (|f| (F)) (|y| (F)))
         (SEQ
          (COND
           ((EQUAL |x|
                   (SPADCALL
                    (LETT |y| (SPADCALL |l| (QREFELT $ 49))
                          . #1=(|COMBF;dvdsum|))
                    (QREFELT $ 70)))
            (|spadConstant| $ 71))
           ('T
            (SEQ (LETT |f| (|SPADfirst| |l|) . #1#)
                 (LETT |v| (SPADCALL |l| (QREFELT $ 40)) . #1#)
                 (LETT |g| (SPADCALL |l| 4 (QREFELT $ 72)) . #1#)
                 (LETT |h| (SPADCALL |l| 5 (QREFELT $ 72)) . #1#)
                 (LETT |r1|
                       (SPADCALL (QREFELT $ 17)
                                 (LIST (SPADCALL |f| |x| (QREFELT $ 69)) |v|
                                       |y| |g| |h|)
                                 (QREFELT $ 26))
                       . #1#)
                 (COND
                  ((OR
                    (SPADCALL |x| (SPADCALL |h| (QREFELT $ 53)) (QREFELT $ 73))
                    (SPADCALL |x| (SPADCALL |g| (QREFELT $ 53))
                              (QREFELT $ 73)))
                   (EXIT
                    (SEQ
                     (LETT |dm|
                           (SPADCALL (SPADCALL (QREFELT $ 63)) (QREFELT $ 64))
                           . #1#)
                     (LETT |dg|
                           (SPADCALL (QREFELT $ 22)
                                     (LIST
                                      (SPADCALL (QREFELT $ 17)
                                                (LIST |f| |v| |y| |dm| |h|)
                                                (QREFELT $ 26))
                                      |dm| |g|)
                                     (QREFELT $ 74))
                           . #1#)
                     (LETT |dh|
                           (SPADCALL (QREFELT $ 22)
                                     (LIST
                                      (SPADCALL (QREFELT $ 17)
                                                (LIST |f| |v| |y| |g| |dm|)
                                                (QREFELT $ 26))
                                      |dm| |h|)
                                     (QREFELT $ 74))
                           . #1#)
                     (EXIT
                      (SPADCALL
                       (SPADCALL |r1|
                                 (SPADCALL (SPADCALL |g| |x| (QREFELT $ 69))
                                           |dg| (QREFELT $ 41))
                                 (QREFELT $ 75))
                       (SPADCALL (SPADCALL |h| |x| (QREFELT $ 69)) |dh|
                                 (QREFELT $ 41))
                       (QREFELT $ 75)))))))
                 (EXIT |r1|))))))) 

(SDEFUN |COMBF;dvprod| ((|l| |List| F) (|x| |Symbol|) ($ F))
        (SPROG ((|p| (F)) (|f| (F)) (|dm| (|Symbol|)))
               (SEQ
                (LETT |dm|
                      (SPADCALL
                       (SPADCALL (SPADCALL (QREFELT $ 63)) (QREFELT $ 64))
                       (QREFELT $ 70))
                      . #1=(|COMBF;dvprod|))
                (LETT |f|
                      (SPADCALL (|SPADfirst| |l|)
                                (SPADCALL (SPADCALL |l| (QREFELT $ 40))
                                          (QREFELT $ 61))
                                (SPADCALL |dm| (QREFELT $ 64)) (QREFELT $ 62))
                      . #1#)
                (LETT |p| (SPADCALL |f| |dm| (QREFELT $ 67)) . #1#)
                (EXIT
                 (SPADCALL (QREFELT $ 16)
                           (LIST
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|SPADfirst| |l|) |x| (QREFELT $ 69))
                              (|SPADfirst| |l|) (QREFELT $ 59))
                             |p| (QREFELT $ 41))
                            (SPADCALL |l| (QREFELT $ 40))
                            (SPADCALL |l| (QREFELT $ 49)))
                           (QREFELT $ 26)))))) 

(SDEFUN |COMBF;dvdprod| ((|l| |List| F) (|x| |Symbol|) ($ F))
        (SPROG ((|g| (F)) (|h| (F)) (|y| (F)))
               (COND
                ((EQUAL |x|
                        (SPADCALL
                         (LETT |y| (SPADCALL |l| (QREFELT $ 49))
                               . #1=(|COMBF;dvdprod|))
                         (QREFELT $ 70)))
                 (|spadConstant| $ 71))
                ((OR
                  (SPADCALL |x|
                            (SPADCALL
                             (LETT |h|
                                   (SPADCALL (CDR (CDR |l|)) (QREFELT $ 49))
                                   . #1#)
                             (QREFELT $ 53))
                            (QREFELT $ 73))
                  (SPADCALL |x|
                            (SPADCALL
                             (LETT |g| (SPADCALL (CDR |l|) (QREFELT $ 49))
                                   . #1#)
                             (QREFELT $ 53))
                            (QREFELT $ 73)))
                 (|error|
                  "a product cannot be differentiated with respect to a bound"))
                ('T
                 (SPADCALL
                  (SPADCALL (QREFELT $ 17)
                            (CONS
                             (SPADCALL
                              (SPADCALL (|SPADfirst| |l|) |x| (QREFELT $ 69))
                              (|SPADfirst| |l|) (QREFELT $ 59))
                             (CDR |l|))
                            (QREFELT $ 26))
                  (SPADCALL (QREFELT $ 19) |l| (QREFELT $ 26))
                  (QREFELT $ 41)))))) 

(SDEFUN |COMBF;dprod| ((|l| |List| F) ($ |OutputForm|))
        (SPADCALL (SPADCALL (|COMBF;summand| |l| $) (QREFELT $ 77))
                  (SPADCALL (SPADCALL |l| (QREFELT $ 49)) (QREFELT $ 77))
                  (QREFELT $ 78))) 

(SDEFUN |COMBF;ddprod| ((|l| |List| F) ($ |OutputForm|))
        (SPADCALL (SPADCALL (|COMBF;summand| |l| $) (QREFELT $ 77))
                  (SPADCALL
                   (SPADCALL (SPADCALL |l| (QREFELT $ 49)) (QREFELT $ 77))
                   (SPADCALL (|COMBF;fourth| |l| $) (QREFELT $ 77))
                   (QREFELT $ 79))
                  (SPADCALL (|COMBF;fourth| (CDR |l|) $) (QREFELT $ 77))
                  (QREFELT $ 80))) 

(SDEFUN |COMBF;dsum| ((|l| |List| F) ($ |OutputForm|))
        (SPADCALL (SPADCALL (|COMBF;summand| |l| $) (QREFELT $ 77))
                  (SPADCALL (SPADCALL |l| (QREFELT $ 49)) (QREFELT $ 77))
                  (QREFELT $ 81))) 

(SDEFUN |COMBF;ddsum| ((|l| |List| F) ($ |OutputForm|))
        (SPADCALL (SPADCALL (|COMBF;summand| |l| $) (QREFELT $ 77))
                  (SPADCALL
                   (SPADCALL (SPADCALL |l| (QREFELT $ 49)) (QREFELT $ 77))
                   (SPADCALL (|COMBF;fourth| |l| $) (QREFELT $ 77))
                   (QREFELT $ 79))
                  (SPADCALL (|COMBF;fourth| (CDR |l|) $) (QREFELT $ 77))
                  (QREFELT $ 82))) 

(SDEFUN |COMBF;equalsumprod|
        ((|s1| |Kernel| F) (|s2| |Kernel| F) ($ |Boolean|))
        (SPROG ((|l2| #1=(|List| F)) (|l1| #1#))
               (SEQ
                (LETT |l1| (SPADCALL |s1| (QREFELT $ 38))
                      . #2=(|COMBF;equalsumprod|))
                (LETT |l2| (SPADCALL |s2| (QREFELT $ 38)) . #2#)
                (EXIT
                 (SPADCALL
                  (SPADCALL (|SPADfirst| |l1|)
                            (SPADCALL (SPADCALL |l1| (QREFELT $ 40))
                                      (QREFELT $ 61))
                            (SPADCALL |l2| (QREFELT $ 40)) (QREFELT $ 62))
                  (|SPADfirst| |l2|) (QREFELT $ 83)))))) 

(SDEFUN |COMBF;equaldsumprod|
        ((|s1| |Kernel| F) (|s2| |Kernel| F) ($ |Boolean|))
        (SPROG ((|l2| #1=(|List| F)) (|l1| #1#))
               (SEQ
                (LETT |l1| (SPADCALL |s1| (QREFELT $ 38))
                      . #2=(|COMBF;equaldsumprod|))
                (LETT |l2| (SPADCALL |s2| (QREFELT $ 38)) . #2#)
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL (CDR |l1|) (QREFELT $ 49))
                             (SPADCALL (CDR |l2|) (QREFELT $ 49))
                             (QREFELT $ 83))
                   (COND
                    ((SPADCALL (SPADCALL (CDR (CDR |l1|)) (QREFELT $ 49))
                               (SPADCALL (CDR (CDR |l2|)) (QREFELT $ 49))
                               (QREFELT $ 83))
                     (SPADCALL
                      (SPADCALL (|SPADfirst| |l1|)
                                (SPADCALL (SPADCALL |l1| (QREFELT $ 40))
                                          (QREFELT $ 61))
                                (SPADCALL |l2| (QREFELT $ 40)) (QREFELT $ 62))
                      (|SPADfirst| |l2|) (QREFELT $ 83)))
                    (#3='T NIL)))
                  (#3# NIL)))))) 

(SDEFUN |COMBF;product;FSbF;25| ((|x| F) (|s| |SegmentBinding| F) ($ F))
        (SPROG ((|dm| (F)) (|k| (|Kernel| F)))
               (SEQ
                (LETT |k|
                      (SPADCALL (SPADCALL |s| (QREFELT $ 85)) (QREFELT $ 65))
                      . #1=(|COMBF;product;FSbF;25|))
                (LETT |dm| (SPADCALL (SPADCALL (QREFELT $ 63)) (QREFELT $ 64))
                      . #1#)
                (EXIT
                 (SPADCALL (QREFELT $ 19)
                           (LIST (SPADCALL |x| |k| |dm| (QREFELT $ 62)) |dm|
                                 (SPADCALL |k| (QREFELT $ 66))
                                 (SPADCALL (SPADCALL |s| (QREFELT $ 87))
                                           (QREFELT $ 88))
                                 (SPADCALL (SPADCALL |s| (QREFELT $ 87))
                                           (QREFELT $ 89)))
                           (QREFELT $ 26)))))) 

(SDEFUN |COMBF;summation;FSbF;26| ((|x| F) (|s| |SegmentBinding| F) ($ F))
        (SPROG ((|dm| (F)) (|k| (|Kernel| F)))
               (SEQ
                (LETT |k|
                      (SPADCALL (SPADCALL |s| (QREFELT $ 85)) (QREFELT $ 65))
                      . #1=(|COMBF;summation;FSbF;26|))
                (LETT |dm| (SPADCALL (SPADCALL (QREFELT $ 63)) (QREFELT $ 64))
                      . #1#)
                (EXIT
                 (SPADCALL (QREFELT $ 17)
                           (LIST (SPADCALL |x| |k| |dm| (QREFELT $ 62)) |dm|
                                 (SPADCALL |k| (QREFELT $ 66))
                                 (SPADCALL (SPADCALL |s| (QREFELT $ 87))
                                           (QREFELT $ 88))
                                 (SPADCALL (SPADCALL |s| (QREFELT $ 87))
                                           (QREFELT $ 89)))
                           (QREFELT $ 26)))))) 

(SDEFUN |COMBF;smpfact|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F))
         (|l| |List| (|Symbol|)) ($ F))
        (SPROG NIL
               (SPADCALL (CONS #'|COMBF;smpfact!0| (VECTOR $ |l|)) (ELT $ 92)
                         |p| (QREFELT $ 97)))) 

(SDEFUN |COMBF;smpfact!0| ((|x| NIL) ($$ NIL))
        (PROG (|l| $)
          (LETT |l| (QREFELT $$ 1) . #1=(|COMBF;smpfact|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|COMBF;K2fact| |x| |l| $))))) 

(SDEFUN |COMBF;K2fact| ((|k| |Kernel| F) (|l| |List| (|Symbol|)) ($ F))
        (SPROG
         ((|p| (F)) (|n| (F)) (|args| (|List| F)) (#1=#:G835 NIL) (|a| NIL)
          (#2=#:G834 NIL) (#3=#:G833 NIL) (|kf| (F)) (|v| NIL) (#4=#:G832 NIL))
         (SEQ
          (COND
           ((OR
             (NULL
              (PROGN
               (LETT #4# NIL . #5=(|COMBF;K2fact|))
               (SEQ (LETT |v| NIL . #5#)
                    (LETT #3#
                          (SPADCALL
                           (LETT |kf| (SPADCALL |k| (QREFELT $ 66)) . #5#)
                           (QREFELT $ 53))
                          . #5#)
                    G190
                    (COND
                     ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#) . #5#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL |v| |l| (QREFELT $ 73))
                        (LETT #4# (CONS |v| #4#) . #5#)))))
                    (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                    (EXIT (NREVERSE #4#)))))
             (NULL
              (LETT |args|
                    (PROGN
                     (LETT #2# NIL . #5#)
                     (SEQ (LETT |a| NIL . #5#)
                          (LETT #1# (SPADCALL |k| (QREFELT $ 38)) . #5#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |a| (CAR #1#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2# (CONS (|COMBF;facts| |a| |l| $) #2#)
                                  . #5#)))
                          (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #5#)))
            |kf|)
           ((SPADCALL |k| (QREFELT $ 14) (QREFELT $ 98))
            (SPADCALL
             (SPADCALL (LETT |n| (|SPADfirst| |args|) . #5#) (QREFELT $ 24))
             (SPADCALL
              (SPADCALL |n| (SPADCALL |args| (QREFELT $ 40)) (QREFELT $ 51))
              (QREFELT $ 24))
             (QREFELT $ 59)))
           ((SPADCALL |k| (QREFELT $ 15) (QREFELT $ 98))
            (SEQ (LETT |n| (|SPADfirst| |args|) . #5#)
                 (LETT |p| (SPADCALL |args| (QREFELT $ 40)) . #5#)
                 (EXIT
                  (SPADCALL (SPADCALL |n| (QREFELT $ 24))
                            (SPADCALL (SPADCALL |p| (QREFELT $ 24))
                                      (SPADCALL
                                       (SPADCALL |n| |p| (QREFELT $ 51))
                                       (QREFELT $ 24))
                                      (QREFELT $ 41))
                            (QREFELT $ 59)))))
           ('T
            (SPADCALL (SPADCALL |k| (QREFELT $ 99)) |args| (QREFELT $ 26))))))) 

(SDEFUN |COMBF;operator;2Bo;29| ((|op| |BasicOperator|) ($ |BasicOperator|))
        (COND ((SPADCALL |op| '|factorial| (QREFELT $ 100)) (QREFELT $ 13))
              ((SPADCALL |op| '|permutation| (QREFELT $ 100)) (QREFELT $ 14))
              ((SPADCALL |op| '|binomial| (QREFELT $ 100)) (QREFELT $ 15))
              ((SPADCALL |op| '|summation| (QREFELT $ 100)) (QREFELT $ 16))
              ((SPADCALL |op| '|%defsum| (QREFELT $ 100)) (QREFELT $ 17))
              ((SPADCALL |op| '|product| (QREFELT $ 100)) (QREFELT $ 18))
              ((SPADCALL |op| '|%defprod| (QREFELT $ 100)) (QREFELT $ 19))
              ((SPADCALL |op| '|%power| (QREFELT $ 100)) (QREFELT $ 20))
              ('T (|error| "Not a combinatorial operator")))) 

(SDEFUN |COMBF;iprod| ((|l| |List| F) ($ F))
        (COND
         ((SPADCALL (|SPADfirst| |l|) (QREFELT $ 102)) (|spadConstant| $ 71))
         ((SPADCALL (|SPADfirst| |l|) (|spadConstant| $ 50) (QREFELT $ 83))
          (|spadConstant| $ 50))
         ('T (SPADCALL (QREFELT $ 18) |l| (QREFELT $ 74))))) 

(SDEFUN |COMBF;isum| ((|l| |List| F) ($ F))
        (COND
         ((SPADCALL (|SPADfirst| |l|) (QREFELT $ 102)) (|spadConstant| $ 71))
         ('T (SPADCALL (QREFELT $ 16) |l| (QREFELT $ 74))))) 

(SDEFUN |COMBF;idprod| ((|l| |List| F) ($ F))
        (COND
         ((SPADCALL (SPADCALL (SPADCALL |l| (QREFELT $ 40)) (QREFELT $ 70))
                    (SPADCALL (|SPADfirst| |l|) (QREFELT $ 53)) (QREFELT $ 73))
          (SPADCALL (QREFELT $ 19) |l| (QREFELT $ 74)))
         ('T
          (SPADCALL (|SPADfirst| |l|)
                    (SPADCALL
                     (SPADCALL (|COMBF;fourth| (CDR |l|) $)
                               (|COMBF;fourth| |l| $) (QREFELT $ 51))
                     (|spadConstant| $ 50) (QREFELT $ 75))
                    (QREFELT $ 39))))) 

(SDEFUN |COMBF;idsum| ((|l| |List| F) ($ F))
        (COND
         ((SPADCALL (SPADCALL (SPADCALL |l| (QREFELT $ 40)) (QREFELT $ 70))
                    (SPADCALL (|SPADfirst| |l|) (QREFELT $ 53)) (QREFELT $ 73))
          (SPADCALL (QREFELT $ 17) |l| (QREFELT $ 74)))
         ('T
          (SPADCALL (|SPADfirst| |l|)
                    (SPADCALL
                     (SPADCALL (|COMBF;fourth| (CDR |l|) $)
                               (|COMBF;fourth| |l| $) (QREFELT $ 51))
                     (|spadConstant| $ 50) (QREFELT $ 75))
                    (QREFELT $ 41))))) 

(SDEFUN |COMBF;ifact| ((|x| F) ($ F))
        (COND
         ((OR (SPADCALL |x| (QREFELT $ 102))
              (SPADCALL |x| (|spadConstant| $ 50) (QREFELT $ 83)))
          (|spadConstant| $ 50))
         ('T (SPADCALL (QREFELT $ 13) |x| (QREFELT $ 104))))) 

(SDEFUN |COMBF;ibinom| ((|l| |List| F) ($ F))
        (SPROG ((#1=#:G861 NIL) (|p| (F)) (|n| (F)))
               (SEQ
                (EXIT
                 (SEQ (LETT |n| (|SPADfirst| |l|) . #2=(|COMBF;ibinom|))
                      (SEQ (LETT |p| (SPADCALL |l| (QREFELT $ 40)) . #2#)
                           (EXIT
                            (COND
                             ((OR
                               (SPADCALL |p| (|spadConstant| $ 71)
                                         (QREFELT $ 83))
                               (SPADCALL |p| |n| (QREFELT $ 83)))
                              (PROGN
                               (LETT #1# (|spadConstant| $ 50) . #2#)
                               (GO #3=#:G859))))))
                      (COND
                       ((OR (SPADCALL |p| (|spadConstant| $ 50) (QREFELT $ 83))
                            (SPADCALL |p|
                                      (SPADCALL |n| (|spadConstant| $ 50)
                                                (QREFELT $ 51))
                                      (QREFELT $ 83)))
                        (EXIT |n|)))
                      (EXIT (SPADCALL (QREFELT $ 15) |l| (QREFELT $ 74)))))
                #3# (EXIT #1#)))) 

(SDEFUN |COMBF;iperm| ((|l| |List| F) ($ F))
        (COND
         ((SPADCALL (SPADCALL |l| (QREFELT $ 40)) (QREFELT $ 102))
          (|spadConstant| $ 50))
         ('T (SPADCALL (QREFELT $ 14) |l| (QREFELT $ 74))))) 

(SDEFUN |COMBF;iidsum;LF;37| ((|l| |List| F) ($ F))
        (SPROG
         ((#1=#:G874 NIL) (#2=#:G873 (F)) (#3=#:G875 (F)) (#4=#:G879 NIL)
          (|i| NIL) (#5=#:G878 NIL) (|k| (|Union| (|Kernel| F) #6="failed"))
          (|r2| #7=(|Union| (|Integer|) #6#)) (|r1| #7#))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |r1| (SPADCALL (|COMBF;fourth| |l| $) (QREFELT $ 107))
                   . #8=(|COMBF;iidsum;LF;37|))
             (EXIT
              (COND
               ((QEQCAR |r1| 1)
                (PROGN (LETT #5# (|COMBF;idsum| |l| $) . #8#) (GO #9=#:G876)))
               (#10='T
                (SEQ
                 (LETT |r2|
                       (SPADCALL (|COMBF;fourth| (CDR |l|) $) (QREFELT $ 107))
                       . #8#)
                 (EXIT
                  (COND
                   ((QEQCAR |r2| 1)
                    (PROGN (LETT #5# (|COMBF;idsum| |l| $) . #8#) (GO #9#)))
                   (#10#
                    (SEQ
                     (LETT |k|
                           (SPADCALL (SPADCALL |l| (QREFELT $ 40))
                                     (QREFELT $ 109))
                           . #8#)
                     (EXIT
                      (COND
                       ((QEQCAR |k| 1)
                        (PROGN
                         (LETT #5# (|COMBF;idsum| |l| $) . #8#)
                         (GO #9#))))))))))))))
            (EXIT
             (PROGN
              (LETT #1# NIL . #8#)
              (SEQ (LETT |i| (QCDR |r1|) . #8#) (LETT #4# (QCDR |r2|) . #8#)
                   G190 (COND ((> |i| #4#) (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #3#
                            (SPADCALL (|SPADfirst| |l|) (QCDR |k|)
                                      (SPADCALL |i| (QREFELT $ 110))
                                      (QREFELT $ 62))
                            . #8#)
                      (COND
                       (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 75)) . #8#))
                       ('T
                        (PROGN (LETT #2# #3# . #8#) (LETT #1# 'T . #8#)))))))
                   (LETT |i| (+ |i| 1) . #8#) (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) (#10# (|spadConstant| $ 71)))))))
          #9# (EXIT #5#)))) 

(SDEFUN |COMBF;iidprod;LF;38| ((|l| |List| F) ($ F))
        (SPROG
         ((#1=#:G890 NIL) (#2=#:G889 (F)) (#3=#:G891 (F)) (#4=#:G895 NIL)
          (|i| NIL) (#5=#:G894 NIL) (|k| (|Union| (|Kernel| F) #6="failed"))
          (|r2| #7=(|Union| (|Integer|) #6#)) (|r1| #7#))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |r1| (SPADCALL (|COMBF;fourth| |l| $) (QREFELT $ 107))
                   . #8=(|COMBF;iidprod;LF;38|))
             (EXIT
              (COND
               ((QEQCAR |r1| 1)
                (PROGN (LETT #5# (|COMBF;idprod| |l| $) . #8#) (GO #9=#:G892)))
               (#10='T
                (SEQ
                 (LETT |r2|
                       (SPADCALL (|COMBF;fourth| (CDR |l|) $) (QREFELT $ 107))
                       . #8#)
                 (EXIT
                  (COND
                   ((QEQCAR |r2| 1)
                    (PROGN (LETT #5# (|COMBF;idprod| |l| $) . #8#) (GO #9#)))
                   (#10#
                    (SEQ
                     (LETT |k|
                           (SPADCALL (SPADCALL |l| (QREFELT $ 40))
                                     (QREFELT $ 109))
                           . #8#)
                     (EXIT
                      (COND
                       ((QEQCAR |k| 1)
                        (PROGN
                         (LETT #5# (|COMBF;idprod| |l| $) . #8#)
                         (GO #9#))))))))))))))
            (EXIT
             (PROGN
              (LETT #1# NIL . #8#)
              (SEQ (LETT |i| (QCDR |r1|) . #8#) (LETT #4# (QCDR |r2|) . #8#)
                   G190 (COND ((> |i| #4#) (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #3#
                            (SPADCALL (|SPADfirst| |l|) (QCDR |k|)
                                      (SPADCALL |i| (QREFELT $ 110))
                                      (QREFELT $ 62))
                            . #8#)
                      (COND
                       (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 41)) . #8#))
                       ('T
                        (PROGN (LETT #2# #3# . #8#) (LETT #1# 'T . #8#)))))))
                   (LETT |i| (+ |i| 1) . #8#) (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) (#10# (|spadConstant| $ 50)))))))
          #9# (EXIT #5#)))) 

(SDEFUN |COMBF;iiipow| ((|l| |List| F) ($ F))
        (SPROG
         ((|r| (|Union| (|Fraction| (|Integer|)) "failed")) (|y| (F))
          (|rec|
           (|Record| (|:| |var| (|Kernel| F)) (|:| |exponent| (|Integer|))))
          (|u|
           (|Union|
            (|Record| (|:| |var| (|Kernel| F)) (|:| |exponent| (|Integer|)))
            "failed"))
          (|x| (F)))
         (SEQ
          (LETT |u|
                (SPADCALL (LETT |x| (|SPADfirst| |l|) . #1=(|COMBF;iiipow|))
                          '|exp| (QREFELT $ 115))
                . #1#)
          (EXIT
           (COND ((QEQCAR |u| 1) (SPADCALL (QREFELT $ 20) |l| (QREFELT $ 74)))
                 (#2='T
                  (SEQ (LETT |rec| (QCDR |u|) . #1#)
                       (LETT |y|
                             (|SPADfirst|
                              (SPADCALL (QCAR |rec|) (QREFELT $ 38)))
                             . #1#)
                       (LETT |r| (SPADCALL |y| (QREFELT $ 32)) . #1#)
                       (EXIT
                        (COND
                         ((QEQCAR |r| 1)
                          (SPADCALL (QREFELT $ 20) |l| (QREFELT $ 74)))
                         (#2#
                          (SPADCALL (SPADCALL (QCAR |rec|) (QREFELT $ 99))
                                    (SPADCALL
                                     (SPADCALL (QCDR |rec|) |y| (QREFELT $ 46))
                                     (SPADCALL |l| (QREFELT $ 40))
                                     (QREFELT $ 41))
                                    (QREFELT $ 23)))))))))))) 

(SDEFUN |COMBF;ipow;LF;40| ((|l| |List| F) ($ F))
        (SPROG ((|r| (|Union| (|Fraction| (|Integer|)) "failed")))
               (SEQ
                (LETT |r|
                      (SPADCALL (SPADCALL |l| (QREFELT $ 40)) (QREFELT $ 32))
                      |COMBF;ipow;LF;40|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (|COMBF;iiipow| |l| $))
                       ('T
                        (SPADCALL (|SPADfirst| |l|) (QCDR |r|)
                                  (QREFELT $ 117)))))))) 

(SDEFUN |COMBF;ipow;LF;41| ((|l| |List| F) ($ F))
        (SPROG ((|r| (|Union| (|Integer|) "failed")))
               (SEQ
                (LETT |r|
                      (SPADCALL (SPADCALL |l| (QREFELT $ 40)) (QREFELT $ 107))
                      |COMBF;ipow;LF;41|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (|COMBF;iiipow| |l| $))
                       ('T
                        (SPADCALL (|SPADfirst| |l|) (QCDR |r|)
                                  (QREFELT $ 119)))))))) 

(SDEFUN |COMBF;ipow;LF;42| ((|l| |List| F) ($ F))
        (SPROG
         ((#1=#:G929 NIL) (|y| (F))
          (|rec|
           (|Record| (|:| |var| (|Kernel| F)) (|:| |exponent| (|Integer|))))
          (|u|
           (|Union|
            (|Record| (|:| |var| (|Kernel| F)) (|:| |exponent| (|Integer|)))
            "failed"))
          (|n| (F)) (|x| (F)))
         (SEQ
          (COND
           ((SPADCALL (LETT |x| (|SPADfirst| |l|) . #2=(|COMBF;ipow;LF;42|))
                      (QREFELT $ 102))
            (COND
             ((SPADCALL (SPADCALL |l| (QREFELT $ 40)) (QREFELT $ 102))
              (|error| "0 ^ 0"))
             (#3='T (|spadConstant| $ 71))))
           ((OR (SPADCALL |x| (|spadConstant| $ 50) (QREFELT $ 83))
                (SPADCALL (LETT |n| (SPADCALL |l| (QREFELT $ 40)) . #2#)
                          (QREFELT $ 102)))
            (|spadConstant| $ 50))
           ('T
            (COND ((SPADCALL |n| (|spadConstant| $ 50) (QREFELT $ 83)) |x|)
                  (#3#
                   (SEQ (LETT |u| (SPADCALL |x| '|exp| (QREFELT $ 115)) . #2#)
                        (EXIT
                         (COND
                          ((QEQCAR |u| 1)
                           (SPADCALL (QREFELT $ 20) |l| (QREFELT $ 74)))
                          (#3#
                           (SEQ
                            (EXIT
                             (SEQ (LETT |rec| (QCDR |u|) . #2#)
                                  (SEQ
                                   (LETT |y|
                                         (|SPADfirst|
                                          (SPADCALL (QCAR |rec|)
                                                    (QREFELT $ 38)))
                                         . #2#)
                                   (EXIT
                                    (COND
                                     ((OR
                                       (SPADCALL |y| (|spadConstant| $ 50)
                                                 (QREFELT $ 83))
                                       (SPADCALL |y|
                                                 (SPADCALL
                                                  (|spadConstant| $ 50)
                                                  (QREFELT $ 120))
                                                 (QREFELT $ 83)))
                                      (PROGN
                                       (LETT #1#
                                             (SPADCALL
                                              (SPADCALL (QCAR |rec|)
                                                        (QREFELT $ 99))
                                              (SPADCALL
                                               (SPADCALL (QCDR |rec|) |y|
                                                         (QREFELT $ 46))
                                               |n| (QREFELT $ 41))
                                              (QREFELT $ 23))
                                             . #2#)
                                       (GO #4=#:G924))))))
                                  (EXIT
                                   (SPADCALL (QREFELT $ 20) |l|
                                             (QREFELT $ 74)))))
                            #4# (EXIT #1#))))))))))))) 

(SDEFUN |COMBF;iifact;2F;43| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 122)) |COMBF;iifact;2F;43|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (|COMBF;ifact| |x| $))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 123))
                                  (QREFELT $ 92)))))))) 

(SDEFUN |COMBF;iiperm;LF;44| ((|l| |List| F) ($ F))
        (SPROG ((#1=#:G942 NIL) (|r2| #2=(|Union| R "failed")) (|r1| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |r1| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 122))
                         . #3=(|COMBF;iiperm;LF;44|))
                   (EXIT
                    (COND
                     ((QEQCAR |r1| 1)
                      (PROGN
                       (LETT #1# (|COMBF;iperm| |l| $) . #3#)
                       (GO #4=#:G940)))
                     ('T
                      (SEQ
                       (LETT |r2|
                             (SPADCALL (SPADCALL |l| (QREFELT $ 40))
                                       (QREFELT $ 122))
                             . #3#)
                       (EXIT
                        (COND
                         ((QEQCAR |r2| 1)
                          (PROGN
                           (LETT #1# (|COMBF;iperm| |l| $) . #3#)
                           (GO #4#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r1|) (QCDR |r2|) (QREFELT $ 125))
                             (QREFELT $ 92)))))
                #4# (EXIT #1#)))) 

(SDEFUN |COMBF;iibinom;LF;45| ((|l| |List| F) ($ F))
        (SPROG
         ((#1=#:G961 NIL) (|r2| #2=(|Union| R #3="failed")) (|r1| #2#)
          (|ans| (F)) (#4=#:G963 NIL) (|i| NIL) (|t| (|Union| (|Integer|) #3#))
          (|s| #2#) (#5=#:G962 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |s| (SPADCALL (SPADCALL |l| (QREFELT $ 40)) (QREFELT $ 122))
                   . #6=(|COMBF;iibinom;LF;45|))
             (EXIT
              (COND
               ((QEQCAR |s| 0)
                (SEQ (LETT |t| (SPADCALL (QCDR |s|) (QREFELT $ 127)) . #6#)
                     (EXIT
                      (COND
                       ((QEQCAR |t| 0)
                        (COND
                         ((SPADCALL (QCDR |t|) 0 (QREFELT $ 128))
                          (PROGN
                           (LETT #1#
                                 (SEQ (LETT |ans| (|spadConstant| $ 50) . #6#)
                                      (SEQ (LETT |i| 0 . #6#)
                                           (LETT #5# (- (QCDR |t|) 1) . #6#)
                                           G190
                                           (COND
                                            ((|greater_SI| |i| #5#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT |ans|
                                                   (SPADCALL |ans|
                                                             (SPADCALL
                                                              (|SPADfirst| |l|)
                                                              (SPADCALL
                                                               (SPADCALL |i|
                                                                         (QREFELT
                                                                          $
                                                                          129))
                                                               (QREFELT $ 92))
                                                              (QREFELT $ 51))
                                                             (QREFELT $ 41))
                                                   . #6#)))
                                           (LETT |i| (|inc_SI| |i|) . #6#)
                                           (GO G190) G191 (EXIT NIL))
                                      (EXIT
                                       (SPADCALL
                                        (SPADCALL 1
                                                  (SPADCALL (QCDR |t|)
                                                            (QREFELT $ 130))
                                                  (QREFELT $ 131))
                                        |ans| (QREFELT $ 132))))
                                 . #6#)
                           (GO #7=#:G959))))))))))))
            (SEQ
             (LETT |s|
                   (SPADCALL
                    (SPADCALL (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 40))
                              (QREFELT $ 51))
                    (QREFELT $ 122))
                   . #6#)
             (EXIT
              (COND
               ((QEQCAR |s| 0)
                (SEQ (LETT |t| (SPADCALL (QCDR |s|) (QREFELT $ 127)) . #6#)
                     (EXIT
                      (COND
                       ((QEQCAR |t| 0)
                        (COND
                         ((SPADCALL (QCDR |t|) 0 (QREFELT $ 128))
                          (PROGN
                           (LETT #1#
                                 (SEQ (LETT |ans| (|spadConstant| $ 50) . #6#)
                                      (SEQ (LETT |i| 1 . #6#)
                                           (LETT #4# (QCDR |t|) . #6#) G190
                                           (COND
                                            ((|greater_SI| |i| #4#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT |ans|
                                                   (SPADCALL |ans|
                                                             (SPADCALL
                                                              (SPADCALL |l|
                                                                        (QREFELT
                                                                         $ 40))
                                                              (SPADCALL
                                                               (SPADCALL |i|
                                                                         (QREFELT
                                                                          $
                                                                          129))
                                                               (QREFELT $ 92))
                                                              (QREFELT $ 75))
                                                             (QREFELT $ 41))
                                                   . #6#)))
                                           (LETT |i| (|inc_SI| |i|) . #6#)
                                           (GO G190) G191 (EXIT NIL))
                                      (EXIT
                                       (SPADCALL
                                        (SPADCALL 1
                                                  (SPADCALL (QCDR |t|)
                                                            (QREFELT $ 130))
                                                  (QREFELT $ 131))
                                        |ans| (QREFELT $ 132))))
                                 . #6#)
                           (GO #7#))))))))))))
            (SEQ (LETT |r1| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 122)) . #6#)
                 (EXIT
                  (COND
                   ((QEQCAR |r1| 1)
                    (PROGN (LETT #1# (|COMBF;ibinom| |l| $) . #6#) (GO #7#)))
                   ('T
                    (SEQ
                     (LETT |r2|
                           (SPADCALL (SPADCALL |l| (QREFELT $ 40))
                                     (QREFELT $ 122))
                           . #6#)
                     (EXIT
                      (COND
                       ((QEQCAR |r2| 1)
                        (PROGN
                         (LETT #1# (|COMBF;ibinom| |l| $) . #6#)
                         (GO #7#))))))))))
            (EXIT
             (SPADCALL (SPADCALL (QCDR |r1|) (QCDR |r2|) (QREFELT $ 133))
                       (QREFELT $ 92)))))
          #7# (EXIT #1#)))) 

(SDEFUN |COMBF;iibinom;LF;46| ((|l| |List| F) ($ F))
        (SPROG ((#1=#:G971 NIL) (|r2| #2=(|Union| R "failed")) (|r1| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |r1| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 122))
                         . #3=(|COMBF;iibinom;LF;46|))
                   (EXIT
                    (COND
                     ((QEQCAR |r1| 1)
                      (PROGN
                       (LETT #1# (|COMBF;ibinom| |l| $) . #3#)
                       (GO #4=#:G969)))
                     ('T
                      (SEQ
                       (LETT |r2|
                             (SPADCALL (SPADCALL |l| (QREFELT $ 40))
                                       (QREFELT $ 122))
                             . #3#)
                       (EXIT
                        (COND
                         ((QEQCAR |r2| 1)
                          (PROGN
                           (LETT #1# (|COMBF;ibinom| |l| $) . #3#)
                           (GO #4#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r1|) (QCDR |r2|) (QREFELT $ 133))
                             (QREFELT $ 92)))))
                #4# (EXIT #1#)))) 

(SDEFUN |COMBF;iibinom;LF;47| ((|l| |List| F) ($ F))
        (SPROG ((#1=#:G979 NIL) (|r2| #2=(|Union| R "failed")) (|r1| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |r1| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 122))
                         . #3=(|COMBF;iibinom;LF;47|))
                   (EXIT
                    (COND
                     ((QEQCAR |r1| 1)
                      (PROGN
                       (LETT #1# (|COMBF;ibinom| |l| $) . #3#)
                       (GO #4=#:G977)))
                     ('T
                      (SEQ
                       (LETT |r2|
                             (SPADCALL (SPADCALL |l| (QREFELT $ 40))
                                       (QREFELT $ 122))
                             . #3#)
                       (EXIT
                        (COND
                         ((QEQCAR |r2| 1)
                          (PROGN
                           (LETT #1# (|COMBF;ibinom| |l| $) . #3#)
                           (GO #4#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r1|) (QCDR |r2|) (QREFELT $ 133))
                             (QREFELT $ 92)))))
                #4# (EXIT #1#)))) 

(SDEFUN |COMBF;iifact;2F;48| ((|x| F) ($ F)) (|COMBF;ifact| |x| $)) 

(SDEFUN |COMBF;iibinom;LF;49| ((|l| |List| F) ($ F)) (|COMBF;ibinom| |l| $)) 

(SDEFUN |COMBF;iiperm;LF;50| ((|l| |List| F) ($ F)) (|COMBF;iperm| |l| $)) 

(SDEFUN |COMBF;iipow;LF;51| ((|l| |List| F) ($ F))
        (SPROG ((#1=#:G990 NIL) (|r2| #2=(|Union| R "failed")) (|r1| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |r1| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 122))
                         . #3=(|COMBF;iipow;LF;51|))
                   (EXIT
                    (COND
                     ((QEQCAR |r1| 1)
                      (PROGN
                       (LETT #1# (SPADCALL |l| (QREFELT $ 118)) . #3#)
                       (GO #4=#:G988)))
                     ('T
                      (SEQ
                       (LETT |r2|
                             (SPADCALL (SPADCALL |l| (QREFELT $ 40))
                                       (QREFELT $ 122))
                             . #3#)
                       (EXIT
                        (COND
                         ((QEQCAR |r2| 1)
                          (PROGN
                           (LETT #1# (SPADCALL |l| (QREFELT $ 118)) . #3#)
                           (GO #4#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r1|) (QCDR |r2|) (QREFELT $ 135))
                             (QREFELT $ 92)))))
                #4# (EXIT #1#)))) 

(SDEFUN |COMBF;iipow;LF;52| ((|l| |List| F) ($ F))
        (SPADCALL |l| (QREFELT $ 118))) 

(SDEFUN |COMBF;dvpow2| ((|l| |List| F) ($ F))
        (COND
         ((SPADCALL (|SPADfirst| |l|) (QREFELT $ 102)) (|spadConstant| $ 71))
         ('T
          (SPADCALL (SPADCALL (|SPADfirst| |l|) (QREFELT $ 137))
                    (SPADCALL (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 40))
                              (QREFELT $ 39))
                    (QREFELT $ 41))))) 

(DECLAIM (NOTINLINE |CombinatorialFunction;|)) 

(DEFUN |CombinatorialFunction| (&REST #1=#:G1045)
  (SPROG NIL
         (PROG (#2=#:G1046)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|CombinatorialFunction|)
                                               '|domainEqualList|)
                    . #3=(|CombinatorialFunction|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |CombinatorialFunction;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|CombinatorialFunction|)))))))))) 

(DEFUN |CombinatorialFunction;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|CombinatorialFunction|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|CombinatorialFunction| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 147) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|CombinatorialFunction|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 '|comb|)
          (QSETREFV $ 13 (SPADCALL '|factorial| (QREFELT $ 12)))
          (QSETREFV $ 14 (SPADCALL '|permutation| (QREFELT $ 12)))
          (QSETREFV $ 15 (SPADCALL '|binomial| (QREFELT $ 12)))
          (QSETREFV $ 16 (SPADCALL '|summation| (QREFELT $ 12)))
          (QSETREFV $ 17 (SPADCALL '|%defsum| (QREFELT $ 12)))
          (QSETREFV $ 18 (SPADCALL '|product| (QREFELT $ 12)))
          (QSETREFV $ 19 (SPADCALL '|%defprod| (QREFELT $ 12)))
          (QSETREFV $ 20 (SPADCALL '|%power| (QREFELT $ 12)))
          (QSETREFV $ 22
                    (SPADCALL (SPADCALL '|%diff| (QREFELT $ 12))
                              (QREFELT $ 21)))
          (COND
           ((|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
            (PROGN
             (QSETREFV $ 111
                       (CONS (|dispatchFunction| |COMBF;iidsum;LF;37|) $))
             (QSETREFV $ 112
                       (CONS (|dispatchFunction| |COMBF;iidprod;LF;38|) $))
             (COND
              ((|HasCategory| |#2| '(|RadicalCategory|))
               (QSETREFV $ 118
                         (CONS (|dispatchFunction| |COMBF;ipow;LF;40|) $)))
              ('T
               (QSETREFV $ 118
                         (CONS (|dispatchFunction| |COMBF;ipow;LF;41|) $))))))
           ('T
            (QSETREFV $ 118 (CONS (|dispatchFunction| |COMBF;ipow;LF;42|) $))))
          (COND
           ((|HasCategory| |#1| '(|CombinatorialFunctionCategory|))
            (PROGN
             (QSETREFV $ 124
                       (CONS (|dispatchFunction| |COMBF;iifact;2F;43|) $))
             (QSETREFV $ 126
                       (CONS (|dispatchFunction| |COMBF;iiperm;LF;44|) $))
             (COND
              ((|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
               (COND
                ((|HasCategory| |#2| '(|Algebra| (|Fraction| (|Integer|))))
                 (QSETREFV $ 134
                           (CONS (|dispatchFunction| |COMBF;iibinom;LF;45|)
                                 $)))
                ('T
                 (QSETREFV $ 134
                           (CONS (|dispatchFunction| |COMBF;iibinom;LF;46|)
                                 $)))))
              ('T
               (QSETREFV $ 134
                         (CONS (|dispatchFunction| |COMBF;iibinom;LF;47|)
                               $))))))
           ('T
            (PROGN
             (QSETREFV $ 124
                       (CONS (|dispatchFunction| |COMBF;iifact;2F;48|) $))
             (QSETREFV $ 134
                       (CONS (|dispatchFunction| |COMBF;iibinom;LF;49|) $))
             (QSETREFV $ 126
                       (CONS (|dispatchFunction| |COMBF;iiperm;LF;50|) $)))))
          (COND
           ((|HasCategory| |#1| '(|ElementaryFunctionCategory|))
            (QSETREFV $ 136 (CONS (|dispatchFunction| |COMBF;iipow;LF;51|) $)))
           ('T
            (QSETREFV $ 136
                      (CONS (|dispatchFunction| |COMBF;iipow;LF;52|) $))))
          (SPADCALL (QREFELT $ 13) (ELT $ 124) (QREFELT $ 140))
          (SPADCALL (QREFELT $ 20) (ELT $ 136) (QREFELT $ 142))
          (SPADCALL (QREFELT $ 14) (ELT $ 126) (QREFELT $ 142))
          (SPADCALL (QREFELT $ 15) (ELT $ 134) (QREFELT $ 142))
          (SPADCALL (QREFELT $ 16) (CONS (|function| |COMBF;isum|) $)
                    (QREFELT $ 142))
          (SPADCALL (QREFELT $ 17) (ELT $ 111) (QREFELT $ 142))
          (SPADCALL (QREFELT $ 18) (CONS (|function| |COMBF;iprod|) $)
                    (QREFELT $ 142))
          (SPADCALL (QREFELT $ 19) (ELT $ 112) (QREFELT $ 142))
          (SPADCALL (QREFELT $ 20)
                    (LIST (CONS (|function| |COMBF;dvpow1|) $)
                          (CONS (|function| |COMBF;dvpow2|) $))
                    (QREFELT $ 144))
          (SPADCALL (QREFELT $ 16) '|%specialDiff|
                    (CONS (|function| |COMBF;dvsum|) $) (QREFELT $ 146))
          (SPADCALL (QREFELT $ 17) '|%specialDiff|
                    (CONS (|function| |COMBF;dvdsum|) $) (QREFELT $ 146))
          (SPADCALL (QREFELT $ 18) '|%specialDiff|
                    (CONS (|function| |COMBF;dvprod|) $) (QREFELT $ 146))
          (SPADCALL (QREFELT $ 19) '|%specialDiff|
                    (CONS (|function| |COMBF;dvdprod|) $) (QREFELT $ 146))
          (SPADCALL (QREFELT $ 16) '|%specialDisp|
                    (CONS (|function| |COMBF;dsum|) $) (QREFELT $ 146))
          (SPADCALL (QREFELT $ 17) '|%specialDisp|
                    (CONS (|function| |COMBF;ddsum|) $) (QREFELT $ 146))
          (SPADCALL (QREFELT $ 18) '|%specialDisp|
                    (CONS (|function| |COMBF;dprod|) $) (QREFELT $ 146))
          (SPADCALL (QREFELT $ 19) '|%specialDisp|
                    (CONS (|function| |COMBF;ddprod|) $) (QREFELT $ 146))
          (SPADCALL (QREFELT $ 16) '|%specialEqual|
                    (CONS (|function| |COMBF;equalsumprod|) $) (QREFELT $ 146))
          (SPADCALL (QREFELT $ 17) '|%specialEqual|
                    (CONS (|function| |COMBF;equaldsumprod|) $)
                    (QREFELT $ 146))
          (SPADCALL (QREFELT $ 18) '|%specialEqual|
                    (CONS (|function| |COMBF;equalsumprod|) $) (QREFELT $ 146))
          (SPADCALL (QREFELT $ 19) '|%specialEqual|
                    (CONS (|function| |COMBF;equaldsumprod|) $)
                    (QREFELT $ 146))
          $))) 

(MAKEPROP '|CombinatorialFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'COMB
              (|BasicOperator|) (|Symbol|) (|CommonOperators|) (0 . |operator|)
              '|opfact| '|opperm| '|opbinom| '|opsum| '|opdsum| '|opprod|
              '|opdprod| '|oppow| (5 . |operator|) '|opdiff| (10 . |elt|)
              |COMBF;factorial;2F;1| (|List| $) (16 . |elt|)
              |COMBF;binomial;3F;2| |COMBF;permutation;3F;3| (|Boolean|)
              (22 . |ground?|) (|Union| 116 '#1="failed") (27 . |retractIfCan|)
              (32 . |is?|) (|List| 60) (38 . |kernels|) (|List| 7) (|Kernel| 7)
              (43 . |argument|) |COMBF;^;3F;5| (48 . |second|) (53 . *)
              (|Record| (|:| |val| $) (|:| |exponent| 45))
              (|Union| 42 '#2="failed") (59 . |isPower|) (|Integer|) (64 . *)
              (70 . |has?|) |COMBF;belong?;BoB;6| (76 . |third|) (81 . |One|)
              (85 . -) (|List| 10) (91 . |variables|) |COMBF;factorials;2F;9|
              |COMBF;factorials;FSF;10| (|SparseMultivariatePolynomial| 6 60)
              (96 . |numer|) (101 . |denom|) (106 . /) (|Kernel| $)
              (112 . |retract|) (117 . |eval|) (124 . |new|) (128 . |coerce|)
              (133 . |kernel|) (138 . |coerce|) |COMBF;product;FSF;13|
              |COMBF;summation;FSF;14| (143 . |differentiate|)
              (149 . |retract|) (154 . |Zero|) (158 . |elt|) (164 . |member?|)
              (170 . |kernel|) (176 . +) (|OutputForm|) (182 . |coerce|)
              (187 . |prod|) (193 . =) (199 . |prod|) (206 . |sum|)
              (212 . |sum|) (219 . =) (|SegmentBinding| 7) (225 . |variable|)
              (|Segment| 7) (230 . |segment|) (235 . |lo|) (240 . |hi|)
              |COMBF;product;FSbF;25| |COMBF;summation;FSbF;26|
              (245 . |coerce|) (|Mapping| 7 37) (|Mapping| 7 6)
              (|SparseMultivariatePolynomial| 6 37)
              (|PolynomialCategoryLifting| (|IndexedExponents| 37) 37 6 95 7)
              (250 . |map|) (257 . |is?|) (263 . |operator|) (268 . |is?|)
              |COMBF;operator;2Bo;29| (274 . |zero?|) (279 . |One|)
              (283 . |kernel|) (289 . |Zero|) (|Union| 45 '#1#)
              (293 . |retractIfCan|) (|Union| 60 '#1#) (298 . |retractIfCan|)
              (303 . |coerce|) (308 . |iidsum|) (313 . |iidprod|)
              (|Record| (|:| |var| 60) (|:| |exponent| 45)) (|Union| 113 '#2#)
              (318 . |isExpt|) (|Fraction| 45) (324 . ^) (330 . |ipow|)
              (335 . ^) (341 . -) (|Union| 6 '#1#) (346 . |retractIfCan|)
              (351 . |factorial|) (356 . |iifact|) (361 . |permutation|)
              (367 . |iiperm|) (372 . |retractIfCan|) (377 . >)
              (383 . |coerce|) (388 . |factorial|) (393 . /) (399 . *)
              (405 . |binomial|) (411 . |iibinom|) (416 . ^) (422 . |iipow|)
              (427 . |log|) (|Mapping| 7 7) (|BasicOperatorFunctions1| 7)
              (432 . |evaluate|) (|Mapping| 7 36) (438 . |evaluate|)
              (|List| 141) (444 . |derivative|) (|None|) (450 . |setProperty|))
           '#(|summation| 457 |product| 469 |permutation| 481 |operator| 487
              |ipow| 492 |iipow| 497 |iiperm| 502 |iifact| 507 |iidsum| 512
              |iidprod| 517 |iibinom| 522 |factorials| 527 |factorial| 538
              |binomial| 543 |belong?| 549 ^ 554)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 146
                                                 '(1 11 9 10 12 1 7 9 9 21 2 7
                                                   0 9 0 23 2 7 0 9 25 26 1 7
                                                   29 0 30 1 7 31 0 32 2 7 29 0
                                                   10 33 1 7 34 0 35 1 37 36 0
                                                   38 1 36 7 0 40 2 7 0 0 0 41
                                                   1 7 43 0 44 2 7 0 45 0 46 2
                                                   9 29 0 10 47 1 36 7 0 49 0 7
                                                   0 50 2 7 0 0 0 51 1 7 52 0
                                                   53 1 7 56 0 57 1 7 56 0 58 2
                                                   7 0 0 0 59 1 7 60 0 61 3 7 0
                                                   0 60 0 62 0 10 0 63 1 7 0 10
                                                   64 1 37 0 10 65 1 7 0 60 66
                                                   2 7 0 0 10 69 1 7 10 0 70 0
                                                   7 0 71 2 36 7 0 45 72 2 52
                                                   29 10 0 73 2 7 0 9 25 74 2 7
                                                   0 0 0 75 1 7 76 0 77 2 76 0
                                                   0 0 78 2 76 0 0 0 79 3 76 0
                                                   0 0 0 80 2 76 0 0 0 81 3 76
                                                   0 0 0 0 82 2 7 29 0 0 83 1
                                                   84 10 0 85 1 84 86 0 87 1 86
                                                   7 0 88 1 86 7 0 89 1 7 0 6
                                                   92 3 96 7 93 94 95 97 2 37
                                                   29 0 9 98 1 37 9 0 99 2 9 29
                                                   0 10 100 1 7 29 0 102 0 6 0
                                                   103 2 7 0 9 0 104 0 6 0 105
                                                   1 7 106 0 107 1 7 108 0 109
                                                   1 7 0 45 110 1 0 7 36 111 1
                                                   0 7 36 112 2 7 114 0 10 115
                                                   2 7 0 0 116 117 1 0 7 36 118
                                                   2 7 0 0 45 119 1 7 0 0 120 1
                                                   7 121 0 122 1 6 0 0 123 1 0
                                                   7 7 124 2 6 0 0 0 125 1 0 7
                                                   36 126 1 6 106 0 127 2 45 29
                                                   0 0 128 1 6 0 45 129 1 45 0
                                                   0 130 2 116 0 45 45 131 2 7
                                                   0 116 0 132 2 6 0 0 0 133 1
                                                   0 7 36 134 2 6 0 0 0 135 1 0
                                                   7 36 136 1 7 0 0 137 2 139 9
                                                   9 138 140 2 139 9 9 141 142
                                                   2 139 9 9 143 144 3 9 0 0 10
                                                   145 146 2 0 7 7 10 68 2 0 7
                                                   7 84 91 2 0 7 7 10 67 2 0 7
                                                   7 84 90 2 0 7 7 7 28 1 0 9 9
                                                   101 1 0 7 36 118 1 0 7 36
                                                   136 1 0 7 36 126 1 0 7 7 124
                                                   1 0 7 36 111 1 0 7 36 112 1
                                                   0 7 36 134 1 0 7 7 54 2 0 7
                                                   7 10 55 1 0 7 7 24 2 0 7 7 7
                                                   27 1 0 29 9 48 2 0 7 7 7
                                                   39)))))
           '|lookupComplete|)) 
