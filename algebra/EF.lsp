
(SDEFUN |EF;pi;F;1| (($ F)) (SPADCALL (SPADCALL (QREFELT $ 40)) (QREFELT $ 41))) 

(SDEFUN |EF;pi;F;2| (($ F)) (QREFELT $ 42)) 

(SDEFUN |EF;pi;F;3| (($ F)) (QREFELT $ 42)) 

(SDEFUN |EF;iisqrt1| (($ F)) (QREFELT $ 47)) 

(SDEFUN |EF;iisqrt2;F;5| (($ F))
        (SPADCALL (SPADCALL (SPADCALL 2 (QREFELT $ 52)) (QREFELT $ 53))
                  (QREFELT $ 41))) 

(SDEFUN |EF;iisqrt3;F;6| (($ F))
        (SPADCALL (SPADCALL (SPADCALL 3 (QREFELT $ 52)) (QREFELT $ 53))
                  (QREFELT $ 41))) 

(SDEFUN |EF;iisqrt2;F;7| (($ F)) (QREFELT $ 54)) 

(SDEFUN |EF;iisqrt3;F;8| (($ F)) (QREFELT $ 55)) 

(SDEFUN |EF;iisqrt2;F;9| (($ F)) (QREFELT $ 54)) 

(SDEFUN |EF;iisqrt3;F;10| (($ F)) (QREFELT $ 55)) 

(SDEFUN |EF;ipi| ((|l| |List| F) ($ F)) (SPADCALL (QREFELT $ 45))) 

(SDEFUN |EF;log;2F;12| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 14) |x| (QREFELT $ 59))) 

(SDEFUN |EF;exp;2F;13| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 15) |x| (QREFELT $ 59))) 

(SDEFUN |EF;sin;2F;14| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 16) |x| (QREFELT $ 59))) 

(SDEFUN |EF;cos;2F;15| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 17) |x| (QREFELT $ 59))) 

(SDEFUN |EF;tan;2F;16| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 18) |x| (QREFELT $ 59))) 

(SDEFUN |EF;cot;2F;17| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 19) |x| (QREFELT $ 59))) 

(SDEFUN |EF;sec;2F;18| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 20) |x| (QREFELT $ 59))) 

(SDEFUN |EF;csc;2F;19| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 21) |x| (QREFELT $ 59))) 

(SDEFUN |EF;asin;2F;20| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 22) |x| (QREFELT $ 59))) 

(SDEFUN |EF;acos;2F;21| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 23) |x| (QREFELT $ 59))) 

(SDEFUN |EF;atan;2F;22| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 24) |x| (QREFELT $ 59))) 

(SDEFUN |EF;acot;2F;23| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 25) |x| (QREFELT $ 59))) 

(SDEFUN |EF;asec;2F;24| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 26) |x| (QREFELT $ 59))) 

(SDEFUN |EF;acsc;2F;25| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 27) |x| (QREFELT $ 59))) 

(SDEFUN |EF;sinh;2F;26| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 28) |x| (QREFELT $ 59))) 

(SDEFUN |EF;cosh;2F;27| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 29) |x| (QREFELT $ 59))) 

(SDEFUN |EF;tanh;2F;28| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 30) |x| (QREFELT $ 59))) 

(SDEFUN |EF;coth;2F;29| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 31) |x| (QREFELT $ 59))) 

(SDEFUN |EF;sech;2F;30| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 32) |x| (QREFELT $ 59))) 

(SDEFUN |EF;csch;2F;31| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 33) |x| (QREFELT $ 59))) 

(SDEFUN |EF;asinh;2F;32| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 34) |x| (QREFELT $ 59))) 

(SDEFUN |EF;acosh;2F;33| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 35) |x| (QREFELT $ 59))) 

(SDEFUN |EF;atanh;2F;34| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 36) |x| (QREFELT $ 59))) 

(SDEFUN |EF;acoth;2F;35| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 37) |x| (QREFELT $ 59))) 

(SDEFUN |EF;asech;2F;36| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 38) |x| (QREFELT $ 59))) 

(SDEFUN |EF;acsch;2F;37| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 39) |x| (QREFELT $ 59))) 

(SDEFUN |EF;kernel| ((|x| F) ($ |Kernel| F)) (SPADCALL |x| (QREFELT $ 87))) 

(SDEFUN |EF;posrem| ((|n| |Integer|) (|m| |Integer|) ($ |Integer|))
        (SPROG ((|r| (|Integer|)))
               (SEQ (LETT |r| (REM |n| |m|) |EF;posrem|)
                    (EXIT (COND ((< |r| 0) (+ |r| |m|)) ('T |r|)))))) 

(SDEFUN |EF;valueOrPole|
        ((|rec| |Record| (|:| |func| F) (|:| |pole| (|Boolean|))) ($ F))
        (COND ((QCDR |rec|) (|error| "Invalid argument")) ('T (QCAR |rec|)))) 

(SDEFUN |EF;belong?;BoB;41| ((|op| |BasicOperator|) ($ |Boolean|))
        (SPADCALL |op| (QREFELT $ 8) (QREFELT $ 91))) 

(SDEFUN |EF;operator;2Bo;42| ((|op| |BasicOperator|) ($ |BasicOperator|))
        (COND ((SPADCALL |op| '|pi| (QREFELT $ 93)) (QREFELT $ 13))
              ((SPADCALL |op| '|log| (QREFELT $ 93)) (QREFELT $ 14))
              ((SPADCALL |op| '|exp| (QREFELT $ 93)) (QREFELT $ 15))
              ((SPADCALL |op| '|sin| (QREFELT $ 93)) (QREFELT $ 16))
              ((SPADCALL |op| '|cos| (QREFELT $ 93)) (QREFELT $ 17))
              ((SPADCALL |op| '|tan| (QREFELT $ 93)) (QREFELT $ 18))
              ((SPADCALL |op| '|cot| (QREFELT $ 93)) (QREFELT $ 19))
              ((SPADCALL |op| '|sec| (QREFELT $ 93)) (QREFELT $ 20))
              ((SPADCALL |op| '|csc| (QREFELT $ 93)) (QREFELT $ 21))
              ((SPADCALL |op| '|asin| (QREFELT $ 93)) (QREFELT $ 22))
              ((SPADCALL |op| '|acos| (QREFELT $ 93)) (QREFELT $ 23))
              ((SPADCALL |op| '|atan| (QREFELT $ 93)) (QREFELT $ 24))
              ((SPADCALL |op| '|acot| (QREFELT $ 93)) (QREFELT $ 25))
              ((SPADCALL |op| '|asec| (QREFELT $ 93)) (QREFELT $ 26))
              ((SPADCALL |op| '|acsc| (QREFELT $ 93)) (QREFELT $ 27))
              ((SPADCALL |op| '|sinh| (QREFELT $ 93)) (QREFELT $ 28))
              ((SPADCALL |op| '|cosh| (QREFELT $ 93)) (QREFELT $ 29))
              ((SPADCALL |op| '|tanh| (QREFELT $ 93)) (QREFELT $ 30))
              ((SPADCALL |op| '|coth| (QREFELT $ 93)) (QREFELT $ 31))
              ((SPADCALL |op| '|sech| (QREFELT $ 93)) (QREFELT $ 32))
              ((SPADCALL |op| '|csch| (QREFELT $ 93)) (QREFELT $ 33))
              ((SPADCALL |op| '|asinh| (QREFELT $ 93)) (QREFELT $ 34))
              ((SPADCALL |op| '|acosh| (QREFELT $ 93)) (QREFELT $ 35))
              ((SPADCALL |op| '|atanh| (QREFELT $ 93)) (QREFELT $ 36))
              ((SPADCALL |op| '|acoth| (QREFELT $ 93)) (QREFELT $ 37))
              ((SPADCALL |op| '|asech| (QREFELT $ 93)) (QREFELT $ 38))
              ((SPADCALL |op| '|acsch| (QREFELT $ 93)) (QREFELT $ 39))
              ('T (|error| "Not an elementary operator")))) 

(SDEFUN |EF;dropfun| ((|x| F) ($ F))
        (SPROG ((#1=#:G927 NIL) (|k| (|Union| (|Kernel| F) "failed")))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |k| (SPADCALL |x| (QREFELT $ 96)) . #2=(|EF;dropfun|))
                   (EXIT
                    (COND
                     ((OR (QEQCAR |k| 1)
                          (NULL (SPADCALL (QCDR |k|) (QREFELT $ 99))))
                      (PROGN
                       (LETT #1# (|spadConstant| $ 89) . #2#)
                       (GO #3=#:G925))))))
                  (EXIT (|SPADfirst| (SPADCALL (QCDR |k|) (QREFELT $ 99))))))
                #3# (EXIT #1#)))) 

(SDEFUN |EF;specialTrigs;FLU;44|
        ((|x| F)
         (|values| |List| (|Record| (|:| |func| F) (|:| |pole| (|Boolean|))))
         ($ |Union| F "failed"))
        (SPROG
         ((|s| (|Integer|)) (|n| (|Union| (|Integer|) "failed"))
          (|m| (|Integer|)) (|q| (|Fraction| (|Integer|)))
          (|r| (|Union| (|Fraction| (|Integer|)) "failed")) (|y| (F)))
         (SEQ
          (LETT |r|
                (SPADCALL
                 (LETT |y|
                       (SPADCALL |x| (SPADCALL (QREFELT $ 45)) (QREFELT $ 100))
                       . #1=(|EF;specialTrigs;FLU;44|))
                 (QREFELT $ 102))
                . #1#)
          (EXIT
           (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                 (#2='T
                  (SEQ (LETT |q| (QCDR |r|) . #1#)
                       (LETT |m| (SPADCALL |values| (QREFELT $ 105)) . #1#)
                       (LETT |n| (SPADCALL |q| (QREFELT $ 108)) . #1#)
                       (EXIT
                        (COND
                         ((QEQCAR |n| 0)
                          (COND
                           ((SPADCALL (QCDR |n|) (QREFELT $ 109))
                            (CONS 0
                                  (|EF;valueOrPole|
                                   (SPADCALL |values| |m| (QREFELT $ 110)) $)))
                           (#2#
                            (CONS 0
                                  (|EF;valueOrPole|
                                   (SPADCALL |values| (+ |m| 1)
                                             (QREFELT $ 110))
                                   $)))))
                         (#2#
                          (SEQ
                           (LETT |n|
                                 (SPADCALL (SPADCALL 2 |q| (QREFELT $ 113))
                                           (QREFELT $ 108))
                                 . #1#)
                           (EXIT
                            (COND
                             ((QEQCAR |n| 0)
                              (SEQ
                               (LETT |s| (|EF;posrem| (QCDR |n|) 4 $) . #1#)
                               (EXIT
                                (COND
                                 ((EQL |s| 1)
                                  (CONS 0
                                        (|EF;valueOrPole|
                                         (SPADCALL |values| (+ |m| 2)
                                                   (QREFELT $ 110))
                                         $)))
                                 (#2#
                                  (CONS 0
                                        (|EF;valueOrPole|
                                         (SPADCALL |values| (+ |m| 3)
                                                   (QREFELT $ 110))
                                         $)))))))
                             (#2#
                              (SEQ
                               (LETT |n|
                                     (SPADCALL (SPADCALL 3 |q| (QREFELT $ 113))
                                               (QREFELT $ 108))
                                     . #1#)
                               (EXIT
                                (COND
                                 ((QEQCAR |n| 0)
                                  (SEQ
                                   (LETT |s| (|EF;posrem| (QCDR |n|) 6 $)
                                         . #1#)
                                   (EXIT
                                    (COND
                                     ((EQL |s| 1)
                                      (CONS 0
                                            (|EF;valueOrPole|
                                             (SPADCALL |values| (+ |m| 4)
                                                       (QREFELT $ 110))
                                             $)))
                                     ((EQL |s| 2)
                                      (CONS 0
                                            (|EF;valueOrPole|
                                             (SPADCALL |values| (+ |m| 5)
                                                       (QREFELT $ 110))
                                             $)))
                                     ((EQL |s| 4)
                                      (CONS 0
                                            (|EF;valueOrPole|
                                             (SPADCALL |values| (+ |m| 6)
                                                       (QREFELT $ 110))
                                             $)))
                                     (#2#
                                      (CONS 0
                                            (|EF;valueOrPole|
                                             (SPADCALL |values| (+ |m| 7)
                                                       (QREFELT $ 110))
                                             $)))))))
                                 (#2#
                                  (SEQ
                                   (LETT |n|
                                         (SPADCALL
                                          (SPADCALL 4 |q| (QREFELT $ 113))
                                          (QREFELT $ 108))
                                         . #1#)
                                   (EXIT
                                    (COND
                                     ((QEQCAR |n| 0)
                                      (SEQ
                                       (LETT |s| (|EF;posrem| (QCDR |n|) 8 $)
                                             . #1#)
                                       (EXIT
                                        (COND
                                         ((EQL |s| 1)
                                          (CONS 0
                                                (|EF;valueOrPole|
                                                 (SPADCALL |values| (+ |m| 8)
                                                           (QREFELT $ 110))
                                                 $)))
                                         ((EQL |s| 3)
                                          (CONS 0
                                                (|EF;valueOrPole|
                                                 (SPADCALL |values| (+ |m| 9)
                                                           (QREFELT $ 110))
                                                 $)))
                                         ((EQL |s| 5)
                                          (CONS 0
                                                (|EF;valueOrPole|
                                                 (SPADCALL |values| (+ |m| 10)
                                                           (QREFELT $ 110))
                                                 $)))
                                         (#2#
                                          (CONS 0
                                                (|EF;valueOrPole|
                                                 (SPADCALL |values| (+ |m| 11)
                                                           (QREFELT $ 110))
                                                 $)))))))
                                     (#2#
                                      (SEQ
                                       (LETT |n|
                                             (SPADCALL
                                              (SPADCALL 6 |q| (QREFELT $ 113))
                                              (QREFELT $ 108))
                                             . #1#)
                                       (EXIT
                                        (COND
                                         ((QEQCAR |n| 0)
                                          (SEQ
                                           (LETT |s|
                                                 (|EF;posrem| (QCDR |n|) 12 $)
                                                 . #1#)
                                           (EXIT
                                            (COND
                                             ((EQL |s| 1)
                                              (CONS 0
                                                    (|EF;valueOrPole|
                                                     (SPADCALL |values|
                                                               (+ |m| 12)
                                                               (QREFELT $ 110))
                                                     $)))
                                             ((EQL |s| 5)
                                              (CONS 0
                                                    (|EF;valueOrPole|
                                                     (SPADCALL |values|
                                                               (+ |m| 13)
                                                               (QREFELT $ 110))
                                                     $)))
                                             ((EQL |s| 7)
                                              (CONS 0
                                                    (|EF;valueOrPole|
                                                     (SPADCALL |values|
                                                               (+ |m| 14)
                                                               (QREFELT $ 110))
                                                     $)))
                                             (#2#
                                              (CONS 0
                                                    (|EF;valueOrPole|
                                                     (SPADCALL |values|
                                                               (+ |m| 15)
                                                               (QREFELT $ 110))
                                                     $)))))))
                                         (#2#
                                          (CONS 1
                                                "failed"))))))))))))))))))))))))))) 

(PUT '|EF;specialTrigs;FLU;45| '|SPADreplace|
     '(XLAM (|x| |values|) (CONS 1 "failed"))) 

(SDEFUN |EF;specialTrigs;FLU;45|
        ((|x| F)
         (|values| |List| (|Record| (|:| |func| F) (|:| |pole| (|Boolean|))))
         ($ |Union| F "failed"))
        (CONS 1 "failed")) 

(SDEFUN |EF;isin| ((|x| F) ($ F))
        (SPROG
         ((|u| (|Union| F "failed")) (|s3| (F)) (|s2| (F)) (|h| (F)) (|y| (F)))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 116)) (|spadConstant| $ 89))
                (#1='T
                 (SEQ (LETT |y| (|EF;dropfun| |x| $) . #2=(|EF;isin|))
                      (EXIT
                       (COND
                        ((SPADCALL |x| (QREFELT $ 22) (QREFELT $ 117)) |y|)
                        ((SPADCALL |x| (QREFELT $ 23) (QREFELT $ 117))
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 48)
                                    (SPADCALL |y| 2 (QREFELT $ 118))
                                    (QREFELT $ 119))
                          (QREFELT $ 50)))
                        ((SPADCALL |x| (QREFELT $ 24) (QREFELT $ 117))
                         (SPADCALL |y|
                                   (SPADCALL
                                    (SPADCALL (|spadConstant| $ 48)
                                              (SPADCALL |y| 2 (QREFELT $ 118))
                                              (QREFELT $ 120))
                                    (QREFELT $ 50))
                                   (QREFELT $ 100)))
                        ((SPADCALL |x| (QREFELT $ 25) (QREFELT $ 117))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 48)
                                     (SPADCALL |y| 2 (QREFELT $ 118))
                                     (QREFELT $ 120))
                           (QREFELT $ 50))
                          (QREFELT $ 121)))
                        ((SPADCALL |x| (QREFELT $ 26) (QREFELT $ 117))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                     (|spadConstant| $ 48) (QREFELT $ 119))
                           (QREFELT $ 50))
                          |y| (QREFELT $ 100)))
                        ((SPADCALL |x| (QREFELT $ 27) (QREFELT $ 117))
                         (SPADCALL |y| (QREFELT $ 121)))
                        (#1#
                         (SEQ
                          (LETT |h|
                                (SPADCALL (SPADCALL 2 (QREFELT $ 56))
                                          (QREFELT $ 121))
                                . #2#)
                          (LETT |s2|
                                (SPADCALL |h| (SPADCALL (QREFELT $ 57))
                                          (QREFELT $ 122))
                                . #2#)
                          (LETT |s3|
                                (SPADCALL |h| (SPADCALL (QREFELT $ 58))
                                          (QREFELT $ 122))
                                . #2#)
                          (LETT |u|
                                (SPADCALL |x|
                                          (LIST
                                           (CONS (|spadConstant| $ 89) NIL)
                                           (CONS (|spadConstant| $ 89) NIL)
                                           (CONS (|spadConstant| $ 48) NIL)
                                           (CONS
                                            (SPADCALL (|spadConstant| $ 48)
                                                      (QREFELT $ 49))
                                            NIL)
                                           (CONS |s3| NIL) (CONS |s3| NIL)
                                           (CONS (SPADCALL |s3| (QREFELT $ 49))
                                                 NIL)
                                           (CONS (SPADCALL |s3| (QREFELT $ 49))
                                                 NIL)
                                           (CONS |s2| NIL) (CONS |s2| NIL)
                                           (CONS (SPADCALL |s2| (QREFELT $ 49))
                                                 NIL)
                                           (CONS (SPADCALL |s2| (QREFELT $ 49))
                                                 NIL)
                                           (CONS |h| NIL) (CONS |h| NIL)
                                           (CONS (SPADCALL |h| (QREFELT $ 49))
                                                 NIL)
                                           (CONS (SPADCALL |h| (QREFELT $ 49))
                                                 NIL))
                                          (QREFELT $ 115))
                                . #2#)
                          (EXIT
                           (COND ((QEQCAR |u| 0) (QCDR |u|))
                                 (#1#
                                  (SPADCALL (QREFELT $ 16) |x|
                                            (QREFELT $ 123))))))))))))))) 

(SDEFUN |EF;icos| ((|x| F) ($ F))
        (SPROG
         ((|u| (|Union| F "failed")) (|s3| (F)) (|s2| (F)) (|h| (F)) (|y| (F)))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 116)) (|spadConstant| $ 48))
                (#1='T
                 (SEQ (LETT |y| (|EF;dropfun| |x| $) . #2=(|EF;icos|))
                      (EXIT
                       (COND
                        ((SPADCALL |x| (QREFELT $ 22) (QREFELT $ 117))
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 48)
                                    (SPADCALL |y| 2 (QREFELT $ 118))
                                    (QREFELT $ 119))
                          (QREFELT $ 50)))
                        ((SPADCALL |x| (QREFELT $ 23) (QREFELT $ 117)) |y|)
                        ((SPADCALL |x| (QREFELT $ 24) (QREFELT $ 117))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 48)
                                     (SPADCALL |y| 2 (QREFELT $ 118))
                                     (QREFELT $ 120))
                           (QREFELT $ 50))
                          (QREFELT $ 121)))
                        ((SPADCALL |x| (QREFELT $ 25) (QREFELT $ 117))
                         (SPADCALL |y|
                                   (SPADCALL
                                    (SPADCALL (|spadConstant| $ 48)
                                              (SPADCALL |y| 2 (QREFELT $ 118))
                                              (QREFELT $ 120))
                                    (QREFELT $ 50))
                                   (QREFELT $ 100)))
                        ((SPADCALL |x| (QREFELT $ 26) (QREFELT $ 117))
                         (SPADCALL |y| (QREFELT $ 121)))
                        ((SPADCALL |x| (QREFELT $ 27) (QREFELT $ 117))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                     (|spadConstant| $ 48) (QREFELT $ 119))
                           (QREFELT $ 50))
                          |y| (QREFELT $ 100)))
                        (#1#
                         (SEQ
                          (LETT |h|
                                (SPADCALL (SPADCALL 2 (QREFELT $ 56))
                                          (QREFELT $ 121))
                                . #2#)
                          (LETT |s2|
                                (SPADCALL |h| (SPADCALL (QREFELT $ 57))
                                          (QREFELT $ 122))
                                . #2#)
                          (LETT |s3|
                                (SPADCALL |h| (SPADCALL (QREFELT $ 58))
                                          (QREFELT $ 122))
                                . #2#)
                          (LETT |u|
                                (SPADCALL |x|
                                          (LIST
                                           (CONS (|spadConstant| $ 48) NIL)
                                           (CONS
                                            (SPADCALL (|spadConstant| $ 48)
                                                      (QREFELT $ 49))
                                            NIL)
                                           (CONS (|spadConstant| $ 89) NIL)
                                           (CONS (|spadConstant| $ 89) NIL)
                                           (CONS |h| NIL)
                                           (CONS (SPADCALL |h| (QREFELT $ 49))
                                                 NIL)
                                           (CONS (SPADCALL |h| (QREFELT $ 49))
                                                 NIL)
                                           (CONS |h| NIL) (CONS |s2| NIL)
                                           (CONS (SPADCALL |s2| (QREFELT $ 49))
                                                 NIL)
                                           (CONS (SPADCALL |s2| (QREFELT $ 49))
                                                 NIL)
                                           (CONS |s2| NIL) (CONS |s3| NIL)
                                           (CONS (SPADCALL |s3| (QREFELT $ 49))
                                                 NIL)
                                           (CONS (SPADCALL |s3| (QREFELT $ 49))
                                                 NIL)
                                           (CONS |s3| NIL))
                                          (QREFELT $ 115))
                                . #2#)
                          (EXIT
                           (COND ((QEQCAR |u| 0) (QCDR |u|))
                                 (#1#
                                  (SPADCALL (QREFELT $ 17) |x|
                                            (QREFELT $ 123))))))))))))))) 

(SDEFUN |EF;itan| ((|x| F) ($ F))
        (SPROG ((|u| (|Union| F "failed")) (|s33| (F)) (|s3| (F)) (|y| (F)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 116)) (|spadConstant| $ 89))
                      (#1='T
                       (SEQ (LETT |y| (|EF;dropfun| |x| $) . #2=(|EF;itan|))
                            (EXIT
                             (COND
                              ((SPADCALL |x| (QREFELT $ 22) (QREFELT $ 117))
                               (SPADCALL |y|
                                         (SPADCALL
                                          (SPADCALL (|spadConstant| $ 48)
                                                    (SPADCALL |y| 2
                                                              (QREFELT $ 118))
                                                    (QREFELT $ 119))
                                          (QREFELT $ 50))
                                         (QREFELT $ 100)))
                              ((SPADCALL |x| (QREFELT $ 23) (QREFELT $ 117))
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 48)
                                           (SPADCALL |y| 2 (QREFELT $ 118))
                                           (QREFELT $ 119))
                                 (QREFELT $ 50))
                                |y| (QREFELT $ 100)))
                              ((SPADCALL |x| (QREFELT $ 24) (QREFELT $ 117))
                               |y|)
                              ((SPADCALL |x| (QREFELT $ 25) (QREFELT $ 117))
                               (SPADCALL |y| (QREFELT $ 121)))
                              ((SPADCALL |x| (QREFELT $ 26) (QREFELT $ 117))
                               (SPADCALL
                                (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                          (|spadConstant| $ 48)
                                          (QREFELT $ 119))
                                (QREFELT $ 50)))
                              ((SPADCALL |x| (QREFELT $ 27) (QREFELT $ 117))
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                           (|spadConstant| $ 48)
                                           (QREFELT $ 119))
                                 (QREFELT $ 50))
                                (QREFELT $ 121)))
                              (#1#
                               (SEQ
                                (LETT |s33|
                                      (SPADCALL
                                       (LETT |s3| (SPADCALL (QREFELT $ 58))
                                             . #2#)
                                       (SPADCALL 3 (QREFELT $ 56))
                                       (QREFELT $ 100))
                                      . #2#)
                                (LETT |u|
                                      (SPADCALL |x|
                                                (LIST
                                                 (CONS (|spadConstant| $ 89)
                                                       NIL)
                                                 (CONS (|spadConstant| $ 89)
                                                       NIL)
                                                 (CONS (|spadConstant| $ 89)
                                                       'T)
                                                 (CONS (|spadConstant| $ 89)
                                                       'T)
                                                 (CONS |s3| NIL)
                                                 (CONS
                                                  (SPADCALL |s3|
                                                            (QREFELT $ 49))
                                                  NIL)
                                                 (CONS |s3| NIL)
                                                 (CONS
                                                  (SPADCALL |s3|
                                                            (QREFELT $ 49))
                                                  NIL)
                                                 (CONS (|spadConstant| $ 48)
                                                       NIL)
                                                 (CONS
                                                  (SPADCALL
                                                   (|spadConstant| $ 48)
                                                   (QREFELT $ 49))
                                                  NIL)
                                                 (CONS (|spadConstant| $ 48)
                                                       NIL)
                                                 (CONS
                                                  (SPADCALL
                                                   (|spadConstant| $ 48)
                                                   (QREFELT $ 49))
                                                  NIL)
                                                 (CONS |s33| NIL)
                                                 (CONS
                                                  (SPADCALL |s33|
                                                            (QREFELT $ 49))
                                                  NIL)
                                                 (CONS |s33| NIL)
                                                 (CONS
                                                  (SPADCALL |s33|
                                                            (QREFELT $ 49))
                                                  NIL))
                                                (QREFELT $ 115))
                                      . #2#)
                                (EXIT
                                 (COND ((QEQCAR |u| 0) (QCDR |u|))
                                       (#1#
                                        (SPADCALL (QREFELT $ 18) |x|
                                                  (QREFELT $ 123))))))))))))))) 

(SDEFUN |EF;icot| ((|x| F) ($ F))
        (SPROG ((|u| (|Union| F "failed")) (|s33| (F)) (|s3| (F)) (|y| (F)))
               (SEQ
                (COND
                 ((SPADCALL |x| (QREFELT $ 116)) (|error| "Invalid argument"))
                 (#1='T
                  (SEQ (LETT |y| (|EF;dropfun| |x| $) . #2=(|EF;icot|))
                       (EXIT
                        (COND
                         ((SPADCALL |x| (QREFELT $ 22) (QREFELT $ 117))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 48)
                                      (SPADCALL |y| 2 (QREFELT $ 118))
                                      (QREFELT $ 119))
                            (QREFELT $ 50))
                           |y| (QREFELT $ 100)))
                         ((SPADCALL |x| (QREFELT $ 23) (QREFELT $ 117))
                          (SPADCALL |y|
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| $ 48)
                                               (SPADCALL |y| 2 (QREFELT $ 118))
                                               (QREFELT $ 119))
                                     (QREFELT $ 50))
                                    (QREFELT $ 100)))
                         ((SPADCALL |x| (QREFELT $ 24) (QREFELT $ 117))
                          (SPADCALL |y| (QREFELT $ 121)))
                         ((SPADCALL |x| (QREFELT $ 25) (QREFELT $ 117)) |y|)
                         ((SPADCALL |x| (QREFELT $ 26) (QREFELT $ 117))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                      (|spadConstant| $ 48) (QREFELT $ 119))
                            (QREFELT $ 50))
                           (QREFELT $ 121)))
                         ((SPADCALL |x| (QREFELT $ 27) (QREFELT $ 117))
                          (SPADCALL
                           (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                     (|spadConstant| $ 48) (QREFELT $ 119))
                           (QREFELT $ 50)))
                         (#1#
                          (SEQ
                           (LETT |s33|
                                 (SPADCALL
                                  (LETT |s3| (SPADCALL (QREFELT $ 58)) . #2#)
                                  (SPADCALL 3 (QREFELT $ 56)) (QREFELT $ 100))
                                 . #2#)
                           (LETT |u|
                                 (SPADCALL |x|
                                           (LIST
                                            (CONS (|spadConstant| $ 89) 'T)
                                            (CONS (|spadConstant| $ 89) 'T)
                                            (CONS (|spadConstant| $ 89) NIL)
                                            (CONS (|spadConstant| $ 89) NIL)
                                            (CONS |s33| NIL)
                                            (CONS
                                             (SPADCALL |s33| (QREFELT $ 49))
                                             NIL)
                                            (CONS |s33| NIL)
                                            (CONS
                                             (SPADCALL |s33| (QREFELT $ 49))
                                             NIL)
                                            (CONS (|spadConstant| $ 48) NIL)
                                            (CONS
                                             (SPADCALL (|spadConstant| $ 48)
                                                       (QREFELT $ 49))
                                             NIL)
                                            (CONS (|spadConstant| $ 48) NIL)
                                            (CONS
                                             (SPADCALL (|spadConstant| $ 48)
                                                       (QREFELT $ 49))
                                             NIL)
                                            (CONS |s3| NIL)
                                            (CONS
                                             (SPADCALL |s3| (QREFELT $ 49))
                                             NIL)
                                            (CONS |s3| NIL)
                                            (CONS
                                             (SPADCALL |s3| (QREFELT $ 49))
                                             NIL))
                                           (QREFELT $ 115))
                                 . #2#)
                           (EXIT
                            (COND ((QEQCAR |u| 0) (QCDR |u|))
                                  (#1#
                                   (SPADCALL (QREFELT $ 19) |x|
                                             (QREFELT $ 123))))))))))))))) 

(SDEFUN |EF;isec| ((|x| F) ($ F))
        (SPROG
         ((|u| (|Union| F "failed")) (|h| (F)) (|s3| (F)) (|s2| (F)) (|y| (F)))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 116)) (|spadConstant| $ 48))
                (#1='T
                 (SEQ (LETT |y| (|EF;dropfun| |x| $) . #2=(|EF;isec|))
                      (EXIT
                       (COND
                        ((SPADCALL |x| (QREFELT $ 22) (QREFELT $ 117))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 48)
                                     (SPADCALL |y| 2 (QREFELT $ 118))
                                     (QREFELT $ 119))
                           (QREFELT $ 50))
                          (QREFELT $ 121)))
                        ((SPADCALL |x| (QREFELT $ 23) (QREFELT $ 117))
                         (SPADCALL |y| (QREFELT $ 121)))
                        ((SPADCALL |x| (QREFELT $ 24) (QREFELT $ 117))
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 48)
                                    (SPADCALL |y| 2 (QREFELT $ 118))
                                    (QREFELT $ 120))
                          (QREFELT $ 50)))
                        ((SPADCALL |x| (QREFELT $ 25) (QREFELT $ 117))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 48)
                                     (SPADCALL |y| 2 (QREFELT $ 118))
                                     (QREFELT $ 120))
                           (QREFELT $ 50))
                          |y| (QREFELT $ 100)))
                        ((SPADCALL |x| (QREFELT $ 26) (QREFELT $ 117)) |y|)
                        ((SPADCALL |x| (QREFELT $ 27) (QREFELT $ 117))
                         (SPADCALL |y|
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                              (|spadConstant| $ 48)
                                              (QREFELT $ 119))
                                    (QREFELT $ 50))
                                   (QREFELT $ 100)))
                        (#1#
                         (SEQ (LETT |s2| (SPADCALL (QREFELT $ 57)) . #2#)
                              (LETT |s3|
                                    (SPADCALL
                                     (SPADCALL 2 (SPADCALL (QREFELT $ 58))
                                               (QREFELT $ 124))
                                     (SPADCALL 3 (QREFELT $ 56))
                                     (QREFELT $ 100))
                                    . #2#)
                              (LETT |h| (SPADCALL 2 (QREFELT $ 56)) . #2#)
                              (LETT |u|
                                    (SPADCALL |x|
                                              (LIST
                                               (CONS (|spadConstant| $ 48) NIL)
                                               (CONS
                                                (SPADCALL (|spadConstant| $ 48)
                                                          (QREFELT $ 49))
                                                NIL)
                                               (CONS (|spadConstant| $ 89) 'T)
                                               (CONS (|spadConstant| $ 89) 'T)
                                               (CONS |h| NIL)
                                               (CONS
                                                (SPADCALL |h| (QREFELT $ 49))
                                                NIL)
                                               (CONS
                                                (SPADCALL |h| (QREFELT $ 49))
                                                NIL)
                                               (CONS |h| NIL) (CONS |s2| NIL)
                                               (CONS
                                                (SPADCALL |s2| (QREFELT $ 49))
                                                NIL)
                                               (CONS
                                                (SPADCALL |s2| (QREFELT $ 49))
                                                NIL)
                                               (CONS |s2| NIL) (CONS |s3| NIL)
                                               (CONS
                                                (SPADCALL |s3| (QREFELT $ 49))
                                                NIL)
                                               (CONS
                                                (SPADCALL |s3| (QREFELT $ 49))
                                                NIL)
                                               (CONS |s3| NIL))
                                              (QREFELT $ 115))
                                    . #2#)
                              (EXIT
                               (COND ((QEQCAR |u| 0) (QCDR |u|))
                                     (#1#
                                      (SPADCALL (QREFELT $ 20) |x|
                                                (QREFELT $ 123))))))))))))))) 

(SDEFUN |EF;icsc| ((|x| F) ($ F))
        (SPROG
         ((|u| (|Union| F "failed")) (|h| (F)) (|s3| (F)) (|s2| (F)) (|y| (F)))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 116)) (|error| "Invalid argument"))
                (#1='T
                 (SEQ (LETT |y| (|EF;dropfun| |x| $) . #2=(|EF;icsc|))
                      (EXIT
                       (COND
                        ((SPADCALL |x| (QREFELT $ 22) (QREFELT $ 117))
                         (SPADCALL |y| (QREFELT $ 121)))
                        ((SPADCALL |x| (QREFELT $ 23) (QREFELT $ 117))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 48)
                                     (SPADCALL |y| 2 (QREFELT $ 118))
                                     (QREFELT $ 119))
                           (QREFELT $ 50))
                          (QREFELT $ 121)))
                        ((SPADCALL |x| (QREFELT $ 24) (QREFELT $ 117))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 48)
                                     (SPADCALL |y| 2 (QREFELT $ 118))
                                     (QREFELT $ 120))
                           (QREFELT $ 50))
                          |y| (QREFELT $ 100)))
                        ((SPADCALL |x| (QREFELT $ 25) (QREFELT $ 117))
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 48)
                                    (SPADCALL |y| 2 (QREFELT $ 118))
                                    (QREFELT $ 120))
                          (QREFELT $ 50)))
                        ((SPADCALL |x| (QREFELT $ 26) (QREFELT $ 117))
                         (SPADCALL |y|
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                              (|spadConstant| $ 48)
                                              (QREFELT $ 119))
                                    (QREFELT $ 50))
                                   (QREFELT $ 100)))
                        ((SPADCALL |x| (QREFELT $ 27) (QREFELT $ 117)) |y|)
                        (#1#
                         (SEQ (LETT |s2| (SPADCALL (QREFELT $ 57)) . #2#)
                              (LETT |s3|
                                    (SPADCALL
                                     (SPADCALL 2 (SPADCALL (QREFELT $ 58))
                                               (QREFELT $ 124))
                                     (SPADCALL 3 (QREFELT $ 56))
                                     (QREFELT $ 100))
                                    . #2#)
                              (LETT |h| (SPADCALL 2 (QREFELT $ 56)) . #2#)
                              (LETT |u|
                                    (SPADCALL |x|
                                              (LIST
                                               (CONS (|spadConstant| $ 89) 'T)
                                               (CONS (|spadConstant| $ 89) 'T)
                                               (CONS (|spadConstant| $ 48) NIL)
                                               (CONS
                                                (SPADCALL (|spadConstant| $ 48)
                                                          (QREFELT $ 49))
                                                NIL)
                                               (CONS |s3| NIL) (CONS |s3| NIL)
                                               (CONS
                                                (SPADCALL |s3| (QREFELT $ 49))
                                                NIL)
                                               (CONS
                                                (SPADCALL |s3| (QREFELT $ 49))
                                                NIL)
                                               (CONS |s2| NIL) (CONS |s2| NIL)
                                               (CONS
                                                (SPADCALL |s2| (QREFELT $ 49))
                                                NIL)
                                               (CONS
                                                (SPADCALL |s2| (QREFELT $ 49))
                                                NIL)
                                               (CONS |h| NIL) (CONS |h| NIL)
                                               (CONS
                                                (SPADCALL |h| (QREFELT $ 49))
                                                NIL)
                                               (CONS
                                                (SPADCALL |h| (QREFELT $ 49))
                                                NIL))
                                              (QREFELT $ 115))
                                    . #2#)
                              (EXIT
                               (COND ((QEQCAR |u| 0) (QCDR |u|))
                                     (#1#
                                      (SPADCALL (QREFELT $ 21) |x|
                                                (QREFELT $ 123))))))))))))))) 

(SDEFUN |EF;iasin| ((|x| F) ($ F))
        (COND ((SPADCALL |x| (QREFELT $ 116)) (|spadConstant| $ 89))
              ((SPADCALL |x| (|spadConstant| $ 48) (QREFELT $ 125))
               (SPADCALL (SPADCALL (QREFELT $ 45)) (SPADCALL 2 (QREFELT $ 56))
                         (QREFELT $ 100)))
              (#1='T
               (COND
                ((SPADCALL |x| (SPADCALL (|spadConstant| $ 48) (QREFELT $ 49))
                           (QREFELT $ 125))
                 (SPADCALL
                  (SPADCALL (SPADCALL (QREFELT $ 45))
                            (SPADCALL 2 (QREFELT $ 56)) (QREFELT $ 100))
                  (QREFELT $ 49)))
                (#1# (SPADCALL (QREFELT $ 22) |x| (QREFELT $ 123))))))) 

(SDEFUN |EF;iacos| ((|x| F) ($ F))
        (COND
         ((SPADCALL |x| (QREFELT $ 116))
          (SPADCALL (SPADCALL (QREFELT $ 45)) (SPADCALL 2 (QREFELT $ 56))
                    (QREFELT $ 100)))
         ((SPADCALL |x| (|spadConstant| $ 48) (QREFELT $ 125))
          (|spadConstant| $ 89))
         (#1='T
          (COND
           ((SPADCALL |x| (SPADCALL (|spadConstant| $ 48) (QREFELT $ 49))
                      (QREFELT $ 125))
            (SPADCALL (QREFELT $ 45)))
           (#1# (SPADCALL (QREFELT $ 23) |x| (QREFELT $ 123))))))) 

(SDEFUN |EF;iatan| ((|x| F) ($ F))
        (SPROG ((|r3| (F)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 116)) (|spadConstant| $ 89))
                      ((SPADCALL |x| (|spadConstant| $ 48) (QREFELT $ 125))
                       (SPADCALL (SPADCALL (QREFELT $ 45))
                                 (SPADCALL 4 (QREFELT $ 56)) (QREFELT $ 100)))
                      (#1='T
                       (COND
                        ((SPADCALL |x|
                                   (SPADCALL (|spadConstant| $ 48)
                                             (QREFELT $ 49))
                                   (QREFELT $ 125))
                         (SPADCALL
                          (SPADCALL (SPADCALL (QREFELT $ 45))
                                    (SPADCALL 4 (QREFELT $ 56))
                                    (QREFELT $ 100))
                          (QREFELT $ 49)))
                        (#1#
                         (SEQ (LETT |r3| (SPADCALL (QREFELT $ 58)) |EF;iatan|)
                              (EXIT
                               (COND
                                ((SPADCALL |x| |r3| (QREFELT $ 125))
                                 (SPADCALL (SPADCALL (QREFELT $ 45))
                                           (SPADCALL 3 (QREFELT $ 56))
                                           (QREFELT $ 100)))
                                ((SPADCALL (SPADCALL |x| |r3| (QREFELT $ 122))
                                           (|spadConstant| $ 48)
                                           (QREFELT $ 125))
                                 (SPADCALL (SPADCALL (QREFELT $ 45))
                                           (SPADCALL 6 (QREFELT $ 56))
                                           (QREFELT $ 100)))
                                (#1#
                                 (SPADCALL (QREFELT $ 24) |x|
                                           (QREFELT $ 123))))))))))))) 

(SDEFUN |EF;iacot| ((|x| F) ($ F))
        (SPROG ((|xx| (F)) (|r3| (F)))
               (SEQ
                (COND
                 ((SPADCALL |x| (QREFELT $ 116))
                  (SPADCALL (SPADCALL (QREFELT $ 45))
                            (SPADCALL 2 (QREFELT $ 56)) (QREFELT $ 100)))
                 ((SPADCALL |x| (|spadConstant| $ 48) (QREFELT $ 125))
                  (SPADCALL (SPADCALL (QREFELT $ 45))
                            (SPADCALL 4 (QREFELT $ 56)) (QREFELT $ 100)))
                 (#1='T
                  (COND
                   ((SPADCALL |x|
                              (SPADCALL (|spadConstant| $ 48) (QREFELT $ 49))
                              (QREFELT $ 125))
                    (SPADCALL
                     (SPADCALL 3 (SPADCALL (QREFELT $ 45)) (QREFELT $ 124))
                     (SPADCALL 4 (QREFELT $ 56)) (QREFELT $ 100)))
                   (#1#
                    (SEQ
                     (LETT |r3| (SPADCALL (QREFELT $ 58)) . #2=(|EF;iacot|))
                     (EXIT
                      (COND
                       ((SPADCALL |x| |r3| (QREFELT $ 125))
                        (SPADCALL (SPADCALL (QREFELT $ 45))
                                  (SPADCALL 6 (QREFELT $ 56)) (QREFELT $ 100)))
                       ((SPADCALL |x| (SPADCALL |r3| (QREFELT $ 49))
                                  (QREFELT $ 125))
                        (SPADCALL
                         (SPADCALL 5 (SPADCALL (QREFELT $ 45)) (QREFELT $ 124))
                         (SPADCALL 6 (QREFELT $ 56)) (QREFELT $ 100)))
                       (#1#
                        (SEQ
                         (LETT |xx| (SPADCALL |x| |r3| (QREFELT $ 122)) . #2#)
                         (EXIT
                          (COND
                           ((SPADCALL |xx| (|spadConstant| $ 48)
                                      (QREFELT $ 125))
                            (SPADCALL (SPADCALL (QREFELT $ 45))
                                      (SPADCALL 3 (QREFELT $ 56))
                                      (QREFELT $ 100)))
                           ((SPADCALL |xx|
                                      (SPADCALL (|spadConstant| $ 48)
                                                (QREFELT $ 49))
                                      (QREFELT $ 125))
                            (SPADCALL
                             (SPADCALL 2 (SPADCALL (QREFELT $ 45))
                                       (QREFELT $ 124))
                             (SPADCALL 3 (QREFELT $ 56)) (QREFELT $ 100)))
                           (#1#
                            (SPADCALL (QREFELT $ 25) |x|
                                      (QREFELT $ 123))))))))))))))))) 

(SDEFUN |EF;iasec| ((|x| F) ($ F))
        (COND ((SPADCALL |x| (QREFELT $ 116)) (|error| "Invalid argument"))
              ((SPADCALL |x| (|spadConstant| $ 48) (QREFELT $ 125))
               (|spadConstant| $ 89))
              (#1='T
               (COND
                ((SPADCALL |x| (SPADCALL (|spadConstant| $ 48) (QREFELT $ 49))
                           (QREFELT $ 125))
                 (SPADCALL (QREFELT $ 45)))
                (#1# (SPADCALL (QREFELT $ 26) |x| (QREFELT $ 123))))))) 

(SDEFUN |EF;iacsc| ((|x| F) ($ F))
        (COND ((SPADCALL |x| (QREFELT $ 116)) (|error| "Invalid argument"))
              ((SPADCALL |x| (|spadConstant| $ 48) (QREFELT $ 125))
               (SPADCALL (SPADCALL (QREFELT $ 45)) (SPADCALL 2 (QREFELT $ 56))
                         (QREFELT $ 100)))
              (#1='T
               (COND
                ((SPADCALL |x| (SPADCALL (|spadConstant| $ 48) (QREFELT $ 49))
                           (QREFELT $ 125))
                 (SPADCALL
                  (SPADCALL (SPADCALL (QREFELT $ 45))
                            (SPADCALL 2 (QREFELT $ 56)) (QREFELT $ 100))
                  (QREFELT $ 49)))
                (#1# (SPADCALL (QREFELT $ 27) |x| (QREFELT $ 123))))))) 

(SDEFUN |EF;isinh| ((|x| F) ($ F))
        (SPROG ((|y| (F)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 116)) (|spadConstant| $ 89))
                      (#1='T
                       (SEQ (LETT |y| (|EF;dropfun| |x| $) |EF;isinh|)
                            (EXIT
                             (COND
                              ((SPADCALL |x| (QREFELT $ 34) (QREFELT $ 117))
                               |y|)
                              ((SPADCALL |x| (QREFELT $ 35) (QREFELT $ 117))
                               (SPADCALL
                                (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                          (|spadConstant| $ 48)
                                          (QREFELT $ 119))
                                (QREFELT $ 50)))
                              ((SPADCALL |x| (QREFELT $ 36) (QREFELT $ 117))
                               (SPADCALL |y|
                                         (SPADCALL
                                          (SPADCALL (|spadConstant| $ 48)
                                                    (SPADCALL |y| 2
                                                              (QREFELT $ 118))
                                                    (QREFELT $ 119))
                                          (QREFELT $ 50))
                                         (QREFELT $ 100)))
                              ((SPADCALL |x| (QREFELT $ 37) (QREFELT $ 117))
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                            (|spadConstant| $ 48)
                                            (QREFELT $ 119))
                                  (QREFELT $ 50))
                                 (QREFELT $ 121))
                                (QREFELT $ 49)))
                              ((SPADCALL |x| (QREFELT $ 38) (QREFELT $ 117))
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 48)
                                           (SPADCALL |y| 2 (QREFELT $ 118))
                                           (QREFELT $ 119))
                                 (QREFELT $ 50))
                                |y| (QREFELT $ 100)))
                              ((SPADCALL |x| (QREFELT $ 39) (QREFELT $ 117))
                               (SPADCALL |y| (QREFELT $ 121)))
                              (#1#
                               (SPADCALL (QREFELT $ 28) |x|
                                         (QREFELT $ 123))))))))))) 

(SDEFUN |EF;icosh| ((|x| F) ($ F))
        (SPROG ((|y| (F)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 116)) (|spadConstant| $ 48))
                      (#1='T
                       (SEQ (LETT |y| (|EF;dropfun| |x| $) |EF;icosh|)
                            (EXIT
                             (COND
                              ((SPADCALL |x| (QREFELT $ 34) (QREFELT $ 117))
                               (SPADCALL
                                (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                          (|spadConstant| $ 48)
                                          (QREFELT $ 120))
                                (QREFELT $ 50)))
                              ((SPADCALL |x| (QREFELT $ 35) (QREFELT $ 117))
                               |y|)
                              ((SPADCALL |x| (QREFELT $ 36) (QREFELT $ 117))
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 48)
                                           (SPADCALL |y| 2 (QREFELT $ 118))
                                           (QREFELT $ 119))
                                 (QREFELT $ 50))
                                (QREFELT $ 121)))
                              ((SPADCALL |x| (QREFELT $ 37) (QREFELT $ 117))
                               (SPADCALL |y|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |y| 2 (QREFELT $ 118))
                                           (|spadConstant| $ 48)
                                           (QREFELT $ 119))
                                          (QREFELT $ 50))
                                         (QREFELT $ 100)))
                              ((SPADCALL |x| (QREFELT $ 38) (QREFELT $ 117))
                               (SPADCALL |y| (QREFELT $ 121)))
                              ((SPADCALL |x| (QREFELT $ 39) (QREFELT $ 117))
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                           (|spadConstant| $ 48)
                                           (QREFELT $ 120))
                                 (QREFELT $ 50))
                                |y| (QREFELT $ 100)))
                              (#1#
                               (SPADCALL (QREFELT $ 29) |x|
                                         (QREFELT $ 123))))))))))) 

(SDEFUN |EF;itanh| ((|x| F) ($ F))
        (SPROG ((|y| (F)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 116)) (|spadConstant| $ 89))
                      (#1='T
                       (SEQ (LETT |y| (|EF;dropfun| |x| $) |EF;itanh|)
                            (EXIT
                             (COND
                              ((SPADCALL |x| (QREFELT $ 34) (QREFELT $ 117))
                               (SPADCALL |y|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |y| 2 (QREFELT $ 118))
                                           (|spadConstant| $ 48)
                                           (QREFELT $ 120))
                                          (QREFELT $ 50))
                                         (QREFELT $ 100)))
                              ((SPADCALL |x| (QREFELT $ 35) (QREFELT $ 117))
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                           (|spadConstant| $ 48)
                                           (QREFELT $ 119))
                                 (QREFELT $ 50))
                                |y| (QREFELT $ 100)))
                              ((SPADCALL |x| (QREFELT $ 36) (QREFELT $ 117))
                               |y|)
                              ((SPADCALL |x| (QREFELT $ 37) (QREFELT $ 117))
                               (SPADCALL |y| (QREFELT $ 121)))
                              ((SPADCALL |x| (QREFELT $ 38) (QREFELT $ 117))
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 48)
                                          (SPADCALL |y| 2 (QREFELT $ 118))
                                          (QREFELT $ 119))
                                (QREFELT $ 50)))
                              ((SPADCALL |x| (QREFELT $ 39) (QREFELT $ 117))
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                           (|spadConstant| $ 48)
                                           (QREFELT $ 120))
                                 (QREFELT $ 50))
                                (QREFELT $ 121)))
                              (#1#
                               (SPADCALL (QREFELT $ 30) |x|
                                         (QREFELT $ 123))))))))))) 

(SDEFUN |EF;icoth| ((|x| F) ($ F))
        (SPROG ((|y| (F)))
               (SEQ
                (COND
                 ((SPADCALL |x| (QREFELT $ 116)) (|error| "Invalid argument"))
                 (#1='T
                  (SEQ (LETT |y| (|EF;dropfun| |x| $) |EF;icoth|)
                       (EXIT
                        (COND
                         ((SPADCALL |x| (QREFELT $ 34) (QREFELT $ 117))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                      (|spadConstant| $ 48) (QREFELT $ 120))
                            (QREFELT $ 50))
                           |y| (QREFELT $ 100)))
                         ((SPADCALL |x| (QREFELT $ 35) (QREFELT $ 117))
                          (SPADCALL |y|
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                               (|spadConstant| $ 48)
                                               (QREFELT $ 119))
                                     (QREFELT $ 50))
                                    (QREFELT $ 100)))
                         ((SPADCALL |x| (QREFELT $ 36) (QREFELT $ 117))
                          (SPADCALL |y| (QREFELT $ 121)))
                         ((SPADCALL |x| (QREFELT $ 37) (QREFELT $ 117)) |y|)
                         ((SPADCALL |x| (QREFELT $ 38) (QREFELT $ 117))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 48)
                                      (SPADCALL |y| 2 (QREFELT $ 118))
                                      (QREFELT $ 119))
                            (QREFELT $ 50))
                           (QREFELT $ 121)))
                         ((SPADCALL |x| (QREFELT $ 39) (QREFELT $ 117))
                          (SPADCALL
                           (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                     (|spadConstant| $ 48) (QREFELT $ 120))
                           (QREFELT $ 50)))
                         (#1#
                          (SPADCALL (QREFELT $ 31) |x| (QREFELT $ 123))))))))))) 

(SDEFUN |EF;isech| ((|x| F) ($ F))
        (SPROG ((|y| (F)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT $ 116)) (|spadConstant| $ 48))
                      (#1='T
                       (SEQ (LETT |y| (|EF;dropfun| |x| $) |EF;isech|)
                            (EXIT
                             (COND
                              ((SPADCALL |x| (QREFELT $ 34) (QREFELT $ 117))
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                           (|spadConstant| $ 48)
                                           (QREFELT $ 120))
                                 (QREFELT $ 50))
                                (QREFELT $ 121)))
                              ((SPADCALL |x| (QREFELT $ 35) (QREFELT $ 117))
                               (SPADCALL |y| (QREFELT $ 121)))
                              ((SPADCALL |x| (QREFELT $ 36) (QREFELT $ 117))
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 48)
                                          (SPADCALL |y| 2 (QREFELT $ 118))
                                          (QREFELT $ 119))
                                (QREFELT $ 50)))
                              ((SPADCALL |x| (QREFELT $ 37) (QREFELT $ 117))
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                           (|spadConstant| $ 48)
                                           (QREFELT $ 119))
                                 (QREFELT $ 50))
                                |y| (QREFELT $ 100)))
                              ((SPADCALL |x| (QREFELT $ 38) (QREFELT $ 117))
                               |y|)
                              ((SPADCALL |x| (QREFELT $ 39) (QREFELT $ 117))
                               (SPADCALL |y|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |y| 2 (QREFELT $ 118))
                                           (|spadConstant| $ 48)
                                           (QREFELT $ 120))
                                          (QREFELT $ 50))
                                         (QREFELT $ 100)))
                              (#1#
                               (SPADCALL (QREFELT $ 32) |x|
                                         (QREFELT $ 123))))))))))) 

(SDEFUN |EF;icsch| ((|x| F) ($ F))
        (SPROG ((|y| (F)))
               (SEQ
                (COND
                 ((SPADCALL |x| (QREFELT $ 116)) (|error| "Invalid argument"))
                 (#1='T
                  (SEQ (LETT |y| (|EF;dropfun| |x| $) |EF;icsch|)
                       (EXIT
                        (COND
                         ((SPADCALL |x| (QREFELT $ 34) (QREFELT $ 117))
                          (SPADCALL |y| (QREFELT $ 121)))
                         ((SPADCALL |x| (QREFELT $ 35) (QREFELT $ 117))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                      (|spadConstant| $ 48) (QREFELT $ 119))
                            (QREFELT $ 50))
                           (QREFELT $ 121)))
                         ((SPADCALL |x| (QREFELT $ 36) (QREFELT $ 117))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 48)
                                      (SPADCALL |y| 2 (QREFELT $ 118))
                                      (QREFELT $ 119))
                            (QREFELT $ 50))
                           |y| (QREFELT $ 100)))
                         ((SPADCALL |x| (QREFELT $ 37) (QREFELT $ 117))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |y| 2 (QREFELT $ 118))
                                      (|spadConstant| $ 48) (QREFELT $ 119))
                            (QREFELT $ 50))
                           (QREFELT $ 49)))
                         ((SPADCALL |x| (QREFELT $ 38) (QREFELT $ 117))
                          (SPADCALL |y|
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| $ 48)
                                               (SPADCALL |y| 2 (QREFELT $ 118))
                                               (QREFELT $ 119))
                                     (QREFELT $ 50))
                                    (QREFELT $ 100)))
                         ((SPADCALL |x| (QREFELT $ 39) (QREFELT $ 117)) |y|)
                         (#1#
                          (SPADCALL (QREFELT $ 33) |x| (QREFELT $ 123))))))))))) 

(SDEFUN |EF;iasinh| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 34) |x| (QREFELT $ 123))) 

(SDEFUN |EF;iacosh| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 35) |x| (QREFELT $ 123))) 

(SDEFUN |EF;iatanh| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 36) |x| (QREFELT $ 123))) 

(SDEFUN |EF;iacoth| ((|x| F) ($ F))
        (COND ((SPADCALL |x| (QREFELT $ 116)) (|error| "Invalid argument"))
              ('T (SPADCALL (QREFELT $ 37) |x| (QREFELT $ 123))))) 

(SDEFUN |EF;iasech| ((|x| F) ($ F))
        (COND ((SPADCALL |x| (QREFELT $ 116)) (|error| "Invalid argument"))
              ('T (SPADCALL (QREFELT $ 38) |x| (QREFELT $ 123))))) 

(SDEFUN |EF;iacsch| ((|x| F) ($ F))
        (COND ((SPADCALL |x| (QREFELT $ 116)) (|error| "Invalid argument"))
              ('T (SPADCALL (QREFELT $ 39) |x| (QREFELT $ 123))))) 

(SDEFUN |EF;iexp| ((|x| F) ($ F))
        (SPROG
         ((|u| (|Union| F "failed")) (|s3| (F)) (|s2| (F)) (|h| (F)) (|y| (F))
          (|xi| (F)) (|i| (F)) (#1=#:G1153 NIL) (|kx| (|Kernel| F))
          (|kxu| (|Union| (|Kernel| F) "failed")))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 116)) (|spadConstant| $ 48))
                ((SPADCALL |x| (QREFELT $ 14) (QREFELT $ 117))
                 (|SPADfirst| (SPADCALL (|EF;kernel| |x| $) (QREFELT $ 99))))
                (#2='T
                 (SEQ
                  (EXIT
                   (SEQ
                    (SEQ
                     (LETT |kxu| (SPADCALL |x| (QREFELT $ 96))
                           . #3=(|EF;iexp|))
                     (EXIT
                      (COND
                       ((QEQCAR |kxu| 0)
                        (COND
                         ((SPADCALL (LETT |kx| (QCDR |kxu|) . #3#) '|lambertW|
                                    (QREFELT $ 126))
                          (PROGN
                           (LETT #1#
                                 (SPADCALL
                                  (|SPADfirst| (SPADCALL |kx| (QREFELT $ 99)))
                                  |x| (QREFELT $ 100))
                                 . #3#)
                           (GO #4=#:G1149))))))))
                    (COND
                     ((SPADCALL |x| (|spadConstant| $ 89) (QREFELT $ 127))
                      (COND
                       ((NULL (SPADCALL |x| (QREFELT $ 129)))
                        (EXIT
                         (SPADCALL (|EF;iexp| (SPADCALL |x| (QREFELT $ 49)) $)
                                   (QREFELT $ 121)))))))
                    (EXIT
                     (COND
                      ((|HasCategory| (QREFELT $ 6)
                                      (LIST '|RetractableTo| '(|Integer|)))
                       (SEQ (LETT |i| (|EF;iisqrt1| $) . #3#)
                            (LETT |xi| (SPADCALL |x| |i| (QREFELT $ 100))
                                  . #3#)
                            (LETT |y|
                                  (SPADCALL |xi| (SPADCALL (QREFELT $ 45))
                                            (QREFELT $ 100))
                                  . #3#)
                            (EXIT
                             (COND
                              ((QEQCAR (SPADCALL |y| (QREFELT $ 102)) 1)
                               (SPADCALL (QREFELT $ 15) |x| (QREFELT $ 123)))
                              (#2#
                               (SEQ
                                (LETT |h|
                                      (SPADCALL (SPADCALL 2 (QREFELT $ 56))
                                                (QREFELT $ 121))
                                      . #3#)
                                (LETT |s2|
                                      (SPADCALL |h| (SPADCALL (QREFELT $ 57))
                                                (QREFELT $ 122))
                                      . #3#)
                                (LETT |s3|
                                      (SPADCALL |h| (SPADCALL (QREFELT $ 58))
                                                (QREFELT $ 122))
                                      . #3#)
                                (LETT |u|
                                      (SPADCALL |xi|
                                                (LIST
                                                 (CONS (|spadConstant| $ 48)
                                                       NIL)
                                                 (CONS
                                                  (SPADCALL
                                                   (|spadConstant| $ 48)
                                                   (QREFELT $ 49))
                                                  NIL)
                                                 (CONS |i| NIL)
                                                 (CONS
                                                  (SPADCALL |i| (QREFELT $ 49))
                                                  NIL)
                                                 (CONS
                                                  (SPADCALL |h|
                                                            (SPADCALL |i| |s3|
                                                                      (QREFELT
                                                                       $ 122))
                                                            (QREFELT $ 120))
                                                  NIL)
                                                 (CONS
                                                  (SPADCALL
                                                   (SPADCALL |h|
                                                             (QREFELT $ 49))
                                                   (SPADCALL |i| |s3|
                                                             (QREFELT $ 122))
                                                   (QREFELT $ 120))
                                                  NIL)
                                                 (CONS
                                                  (SPADCALL
                                                   (SPADCALL |h|
                                                             (QREFELT $ 49))
                                                   (SPADCALL |i| |s3|
                                                             (QREFELT $ 122))
                                                   (QREFELT $ 119))
                                                  NIL)
                                                 (CONS
                                                  (SPADCALL |h|
                                                            (SPADCALL |i| |s3|
                                                                      (QREFELT
                                                                       $ 122))
                                                            (QREFELT $ 119))
                                                  NIL)
                                                 (CONS
                                                  (SPADCALL |s2|
                                                            (SPADCALL |i| |s2|
                                                                      (QREFELT
                                                                       $ 122))
                                                            (QREFELT $ 120))
                                                  NIL)
                                                 (CONS
                                                  (SPADCALL
                                                   (SPADCALL |s2|
                                                             (QREFELT $ 49))
                                                   (SPADCALL |i| |s2|
                                                             (QREFELT $ 122))
                                                   (QREFELT $ 120))
                                                  NIL)
                                                 (CONS
                                                  (SPADCALL
                                                   (SPADCALL |s2|
                                                             (QREFELT $ 49))
                                                   (SPADCALL |i| |s2|
                                                             (QREFELT $ 122))
                                                   (QREFELT $ 119))
                                                  NIL)
                                                 (CONS
                                                  (SPADCALL |s2|
                                                            (SPADCALL |i| |s2|
                                                                      (QREFELT
                                                                       $ 122))
                                                            (QREFELT $ 119))
                                                  NIL)
                                                 (CONS
                                                  (SPADCALL |s3|
                                                            (SPADCALL |i| |h|
                                                                      (QREFELT
                                                                       $ 122))
                                                            (QREFELT $ 120))
                                                  NIL)
                                                 (CONS
                                                  (SPADCALL
                                                   (SPADCALL |s3|
                                                             (QREFELT $ 49))
                                                   (SPADCALL |i| |h|
                                                             (QREFELT $ 122))
                                                   (QREFELT $ 120))
                                                  NIL)
                                                 (CONS
                                                  (SPADCALL
                                                   (SPADCALL |s3|
                                                             (QREFELT $ 49))
                                                   (SPADCALL |i| |h|
                                                             (QREFELT $ 122))
                                                   (QREFELT $ 119))
                                                  NIL)
                                                 (CONS
                                                  (SPADCALL |s3|
                                                            (SPADCALL |i| |h|
                                                                      (QREFELT
                                                                       $ 122))
                                                            (QREFELT $ 119))
                                                  NIL))
                                                (QREFELT $ 115))
                                      . #3#)
                                (EXIT
                                 (COND ((QEQCAR |u| 0) (QCDR |u|))
                                       (#2#
                                        (SPADCALL (QREFELT $ 15) |x|
                                                  (QREFELT $ 123)))))))))))
                      (#2# (SPADCALL (QREFELT $ 15) |x| (QREFELT $ 123)))))))
                  #4# (EXIT #1#))))))) 

(SDEFUN |EF;localReal?;FB;71| ((|x| F) ($ |Boolean|))
        (SPROG ((|u| (|Union| R "failed")))
               (SEQ
                (LETT |u| (SPADCALL |x| (QREFELT $ 131)) |EF;localReal?;FB;71|)
                (EXIT
                 (COND
                  ((QEQCAR |u| 0)
                   (SPADCALL (QCDR |u|) (SPADCALL (QCDR |u|) (QREFELT $ 132))
                             (QREFELT $ 133)))
                  ('T NIL)))))) 

(PUT '|EF;localReal?;FB;72| '|SPADreplace| '(XLAM (|x|) 'T)) 

(SDEFUN |EF;localReal?;FB;72| ((|x| F) ($ |Boolean|)) 'T) 

(PUT '|EF;localReal?;FB;73| '|SPADreplace| '(XLAM (|x|) 'T)) 

(SDEFUN |EF;localReal?;FB;73| ((|x| F) ($ |Boolean|)) 'T) 

(SDEFUN |EF;iiilog| ((|x| F) ($ F))
        (SPROG
         ((|arg| (F))
          (|rec|
           (|Record| (|:| |var| (|Kernel| F)) (|:| |exponent| (|Integer|))))
          (|u|
           (|Union|
            (|Record| (|:| |var| (|Kernel| F)) (|:| |exponent| (|Integer|)))
            "failed")))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 116)) (|error| "Invalid argument"))
                ((SPADCALL |x| (|spadConstant| $ 48) (QREFELT $ 125))
                 (|spadConstant| $ 89))
                (#1='T
                 (SEQ
                  (LETT |u| (SPADCALL |x| (QREFELT $ 15) (QREFELT $ 137))
                        . #2=(|EF;iiilog|))
                  (EXIT
                   (COND
                    ((QEQCAR |u| 0)
                     (SEQ (LETT |rec| (QCDR |u|) . #2#)
                          (LETT |arg|
                                (|SPADfirst|
                                 (SPADCALL (QCAR |rec|) (QREFELT $ 99)))
                                . #2#)
                          (EXIT
                           (COND
                            ((SPADCALL |arg| (QREFELT $ 134))
                             (SPADCALL (QCDR |rec|)
                                       (|SPADfirst|
                                        (SPADCALL (QCAR |rec|) (QREFELT $ 99)))
                                       (QREFELT $ 138)))
                            (#1# (|EF;ilog| |x| $))))))
                    (#1# (|EF;ilog| |x| $)))))))))) 

(SDEFUN |EF;ilog| ((|x| F) ($ F))
        (SPROG
         ((#1=#:G1177 NIL)
          (|den| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (|num1| (|Boolean|))
          (|num| (|SparseMultivariatePolynomial| R (|Kernel| F))))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |num1|
                   (SPADCALL
                    (LETT |num| (SPADCALL |x| (QREFELT $ 140))
                          . #2=(|EF;ilog|))
                    (|spadConstant| $ 142) (QREFELT $ 143))
                   . #2#)
             (EXIT
              (COND
               ((OR |num1|
                    (SPADCALL |num|
                              (SPADCALL (|spadConstant| $ 142) (QREFELT $ 146))
                              (QREFELT $ 143)))
                (COND
                 ((SPADCALL (LETT |den| (SPADCALL |x| (QREFELT $ 144)) . #2#)
                            (|spadConstant| $ 142) (QREFELT $ 145))
                  (COND
                   ((NULL (SPADCALL |x| (QREFELT $ 129)))
                    (PROGN
                     (LETT #1#
                           (SPADCALL
                            (SPADCALL (QREFELT $ 14)
                                      (SPADCALL
                                       (COND (|num1| |den|)
                                             ('T
                                              (SPADCALL |den|
                                                        (QREFELT $ 146))))
                                       (QREFELT $ 147))
                                      (QREFELT $ 123))
                            (QREFELT $ 49))
                           . #2#)
                     (GO #3=#:G1175))))))))))
            (EXIT (SPADCALL (QREFELT $ 14) |x| (QREFELT $ 123)))))
          #3# (EXIT #1#)))) 

(SDEFUN |EF;iilog;2F;76| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 131)) |EF;iilog;2F;76|)
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;iiilog| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 148))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iiexp;2F;77| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 131)) |EF;iiexp;2F;77|)
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;iexp| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 150))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iilog;2F;78| ((|x| F) ($ F)) (|EF;iiilog| |x| $)) 

(SDEFUN |EF;iiexp;2F;79| ((|x| F) ($ F)) (|EF;iexp| |x| $)) 

(SDEFUN |EF;iisin;2F;80| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 131)) |EF;iisin;2F;80|)
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;isin| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 152))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iicos;2F;81| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 131)) |EF;iicos;2F;81|)
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;icos| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 154))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iitan;2F;82| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 131)) |EF;iitan;2F;82|)
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;itan| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 156))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iicot;2F;83| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 131)) |EF;iicot;2F;83|)
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;icot| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 158))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iisec;2F;84| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 131)) |EF;iisec;2F;84|)
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;isec| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 160))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iicsc;2F;85| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 131)) |EF;iicsc;2F;85|)
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;icsc| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 162))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iisin;2F;86| ((|x| F) ($ F)) (|EF;isin| |x| $)) 

(SDEFUN |EF;iicos;2F;87| ((|x| F) ($ F)) (|EF;icos| |x| $)) 

(SDEFUN |EF;iitan;2F;88| ((|x| F) ($ F)) (|EF;itan| |x| $)) 

(SDEFUN |EF;iicot;2F;89| ((|x| F) ($ F)) (|EF;icot| |x| $)) 

(SDEFUN |EF;iisec;2F;90| ((|x| F) ($ F)) (|EF;isec| |x| $)) 

(SDEFUN |EF;iicsc;2F;91| ((|x| F) ($ F)) (|EF;icsc| |x| $)) 

(SDEFUN |EF;iiasin;2F;92| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 131)) |EF;iiasin;2F;92|)
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;iasin| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 164))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iiacos;2F;93| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 131)) |EF;iiacos;2F;93|)
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;iacos| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 166))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iiatan;2F;94| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 131)) |EF;iiatan;2F;94|)
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;iatan| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 168))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iiacot;2F;95| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 131)) |EF;iiacot;2F;95|)
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;iacot| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 170))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iiasec;2F;96| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 131)) |EF;iiasec;2F;96|)
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;iasec| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 172))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iiacsc;2F;97| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 131)) |EF;iiacsc;2F;97|)
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|EF;iacsc| |x| $))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 174))
                                      (QREFELT $ 41)))))))) 

(SDEFUN |EF;iiasin;2F;98| ((|x| F) ($ F)) (|EF;iasin| |x| $)) 

(SDEFUN |EF;iiacos;2F;99| ((|x| F) ($ F)) (|EF;iacos| |x| $)) 

(SDEFUN |EF;iiatan;2F;100| ((|x| F) ($ F)) (|EF;iatan| |x| $)) 

(SDEFUN |EF;iiacot;2F;101| ((|x| F) ($ F)) (|EF;iacot| |x| $)) 

(SDEFUN |EF;iiasec;2F;102| ((|x| F) ($ F)) (|EF;iasec| |x| $)) 

(SDEFUN |EF;iiacsc;2F;103| ((|x| F) ($ F)) (|EF;iacsc| |x| $)) 

(SDEFUN |EF;iisinh;2F;104| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 131)) |EF;iisinh;2F;104|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (|EF;isinh| |x| $))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 176))
                                  (QREFELT $ 41)))))))) 

(SDEFUN |EF;iicosh;2F;105| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 131)) |EF;iicosh;2F;105|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (|EF;icosh| |x| $))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 178))
                                  (QREFELT $ 41)))))))) 

(SDEFUN |EF;iitanh;2F;106| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 131)) |EF;iitanh;2F;106|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (|EF;itanh| |x| $))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 180))
                                  (QREFELT $ 41)))))))) 

(SDEFUN |EF;iicoth;2F;107| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 131)) |EF;iicoth;2F;107|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (|EF;icoth| |x| $))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 182))
                                  (QREFELT $ 41)))))))) 

(SDEFUN |EF;iisech;2F;108| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 131)) |EF;iisech;2F;108|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (|EF;isech| |x| $))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 184))
                                  (QREFELT $ 41)))))))) 

(SDEFUN |EF;iicsch;2F;109| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 131)) |EF;iicsch;2F;109|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (|EF;icsch| |x| $))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 186))
                                  (QREFELT $ 41)))))))) 

(SDEFUN |EF;iisinh;2F;110| ((|x| F) ($ F)) (|EF;isinh| |x| $)) 

(SDEFUN |EF;iicosh;2F;111| ((|x| F) ($ F)) (|EF;icosh| |x| $)) 

(SDEFUN |EF;iitanh;2F;112| ((|x| F) ($ F)) (|EF;itanh| |x| $)) 

(SDEFUN |EF;iicoth;2F;113| ((|x| F) ($ F)) (|EF;icoth| |x| $)) 

(SDEFUN |EF;iisech;2F;114| ((|x| F) ($ F)) (|EF;isech| |x| $)) 

(SDEFUN |EF;iicsch;2F;115| ((|x| F) ($ F)) (|EF;icsch| |x| $)) 

(SDEFUN |EF;iiasinh;2F;116| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 131)) |EF;iiasinh;2F;116|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (|EF;iasinh| |x| $))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 188))
                                  (QREFELT $ 41)))))))) 

(SDEFUN |EF;iiacosh;2F;117| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 131)) |EF;iiacosh;2F;117|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (|EF;iacosh| |x| $))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 190))
                                  (QREFELT $ 41)))))))) 

(SDEFUN |EF;iiatanh;2F;118| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 131)) |EF;iiatanh;2F;118|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (|EF;iatanh| |x| $))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 192))
                                  (QREFELT $ 41)))))))) 

(SDEFUN |EF;iiacoth;2F;119| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 131)) |EF;iiacoth;2F;119|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (|EF;iacoth| |x| $))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 194))
                                  (QREFELT $ 41)))))))) 

(SDEFUN |EF;iiasech;2F;120| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 131)) |EF;iiasech;2F;120|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (|EF;iasech| |x| $))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 196))
                                  (QREFELT $ 41)))))))) 

(SDEFUN |EF;iiacsch;2F;121| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 131)) |EF;iiacsch;2F;121|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (|EF;iacsch| |x| $))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 198))
                                  (QREFELT $ 41)))))))) 

(SDEFUN |EF;iiasinh;2F;122| ((|x| F) ($ F)) (|EF;iasinh| |x| $)) 

(SDEFUN |EF;iiacosh;2F;123| ((|x| F) ($ F)) (|EF;iacosh| |x| $)) 

(SDEFUN |EF;iiatanh;2F;124| ((|x| F) ($ F)) (|EF;iatanh| |x| $)) 

(SDEFUN |EF;iiacoth;2F;125| ((|x| F) ($ F)) (|EF;iacoth| |x| $)) 

(SDEFUN |EF;iiasech;2F;126| ((|x| F) ($ F)) (|EF;iasech| |x| $)) 

(SDEFUN |EF;iiacsch;2F;127| ((|x| F) ($ F)) (|EF;iacsch| |x| $)) 

(DECLAIM (NOTINLINE |ElementaryFunction;|)) 

(DEFUN |ElementaryFunction| (&REST #1=#:G1434)
  (SPROG NIL
         (PROG (#2=#:G1435)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ElementaryFunction|)
                                               '|domainEqualList|)
                    . #3=(|ElementaryFunction|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ElementaryFunction;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ElementaryFunction|)))))))))) 

(DEFUN |ElementaryFunction;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ElementaryFunction|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|ElementaryFunction| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 207) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ElementaryFunction|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 '|elem|)
          (QSETREFV $ 13 (SPADCALL '|pi| (QREFELT $ 12)))
          (QSETREFV $ 14 (SPADCALL '|log| (QREFELT $ 12)))
          (QSETREFV $ 15 (SPADCALL '|exp| (QREFELT $ 12)))
          (QSETREFV $ 16 (SPADCALL '|sin| (QREFELT $ 12)))
          (QSETREFV $ 17 (SPADCALL '|cos| (QREFELT $ 12)))
          (QSETREFV $ 18 (SPADCALL '|tan| (QREFELT $ 12)))
          (QSETREFV $ 19 (SPADCALL '|cot| (QREFELT $ 12)))
          (QSETREFV $ 20 (SPADCALL '|sec| (QREFELT $ 12)))
          (QSETREFV $ 21 (SPADCALL '|csc| (QREFELT $ 12)))
          (QSETREFV $ 22 (SPADCALL '|asin| (QREFELT $ 12)))
          (QSETREFV $ 23 (SPADCALL '|acos| (QREFELT $ 12)))
          (QSETREFV $ 24 (SPADCALL '|atan| (QREFELT $ 12)))
          (QSETREFV $ 25 (SPADCALL '|acot| (QREFELT $ 12)))
          (QSETREFV $ 26 (SPADCALL '|asec| (QREFELT $ 12)))
          (QSETREFV $ 27 (SPADCALL '|acsc| (QREFELT $ 12)))
          (QSETREFV $ 28 (SPADCALL '|sinh| (QREFELT $ 12)))
          (QSETREFV $ 29 (SPADCALL '|cosh| (QREFELT $ 12)))
          (QSETREFV $ 30 (SPADCALL '|tanh| (QREFELT $ 12)))
          (QSETREFV $ 31 (SPADCALL '|coth| (QREFELT $ 12)))
          (QSETREFV $ 32 (SPADCALL '|sech| (QREFELT $ 12)))
          (QSETREFV $ 33 (SPADCALL '|csch| (QREFELT $ 12)))
          (QSETREFV $ 34 (SPADCALL '|asinh| (QREFELT $ 12)))
          (QSETREFV $ 35 (SPADCALL '|acosh| (QREFELT $ 12)))
          (QSETREFV $ 36 (SPADCALL '|atanh| (QREFELT $ 12)))
          (QSETREFV $ 37 (SPADCALL '|acoth| (QREFELT $ 12)))
          (QSETREFV $ 38 (SPADCALL '|asech| (QREFELT $ 12)))
          (QSETREFV $ 39 (SPADCALL '|acsch| (QREFELT $ 12)))
          (COND
           ((|HasCategory| |#1| '(|TranscendentalFunctionCategory|))
            (QSETREFV $ 42
                      (SPADCALL (SPADCALL (QREFELT $ 40)) (QREFELT $ 41))))
           ('T (SETELT $ 42 (SPADCALL (QREFELT $ 13) NIL (QREFELT $ 44)))))
          (COND
           ((|HasCategory| |#1| '(|TranscendentalFunctionCategory|))
            (COND
             ((|HasCategory| |#1| '(|arbitraryPrecision|))
              (QSETREFV $ 45 (CONS (|dispatchFunction| |EF;pi;F;1|) $)))
             ('T (QSETREFV $ 45 (CONS (|dispatchFunction| |EF;pi;F;2|) $)))))
           ('T (QSETREFV $ 45 (CONS (|dispatchFunction| |EF;pi;F;3|) $))))
          (COND
           ((|HasSignature| |#1| (LIST '|imaginary| (LIST (|devaluate| |#1|))))
            (QSETREFV $ 47
                      (SPADCALL (SPADCALL (QREFELT $ 46)) (QREFELT $ 41))))
           ('T
            (SETELT $ 47
                    (SPADCALL (SPADCALL (|spadConstant| $ 48) (QREFELT $ 49))
                              (QREFELT $ 50)))))
          (COND
           ((|HasCategory| |#1| '(|RadicalCategory|))
            (PROGN
             (QSETREFV $ 54
                       (SPADCALL
                        (SPADCALL (SPADCALL 2 (QREFELT $ 52)) (QREFELT $ 53))
                        (QREFELT $ 41)))
             (QSETREFV $ 55
                       (SPADCALL
                        (SPADCALL (SPADCALL 3 (QREFELT $ 52)) (QREFELT $ 53))
                        (QREFELT $ 41)))))
           ('T
            (PROGN
             (SETELT $ 54
                     (SPADCALL (SPADCALL 2 (QREFELT $ 56)) (QREFELT $ 50)))
             (SETELT $ 55
                     (SPADCALL (SPADCALL 3 (QREFELT $ 56)) (QREFELT $ 50))))))
          (COND
           ((|HasCategory| |#1| '(|RadicalCategory|))
            (COND
             ((|HasCategory| |#1| '(|arbitraryPrecision|))
              (PROGN
               (QSETREFV $ 57 (CONS (|dispatchFunction| |EF;iisqrt2;F;5|) $))
               (QSETREFV $ 58 (CONS (|dispatchFunction| |EF;iisqrt3;F;6|) $))))
             ('T
              (PROGN
               (QSETREFV $ 57 (CONS (|dispatchFunction| |EF;iisqrt2;F;7|) $))
               (QSETREFV $ 58
                         (CONS (|dispatchFunction| |EF;iisqrt3;F;8|) $))))))
           ('T
            (PROGN
             (QSETREFV $ 57 (CONS (|dispatchFunction| |EF;iisqrt2;F;9|) $))
             (QSETREFV $ 58 (CONS (|dispatchFunction| |EF;iisqrt3;F;10|) $)))))
          (COND
           ((|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
            (QSETREFV $ 115
                      (CONS (|dispatchFunction| |EF;specialTrigs;FLU;44|) $)))
           ('T
            (QSETREFV $ 115
                      (CONS (|dispatchFunction| |EF;specialTrigs;FLU;45|) $))))
          (COND
           ((|HasSignature| |#1| (LIST '|imaginary| (LIST (|devaluate| |#1|))))
            (COND
             ((|HasSignature| |#1|
                              (LIST '|conjugate|
                                    (LIST (|devaluate| |#1|)
                                          (|devaluate| |#1|))))
              (QSETREFV $ 134
                        (CONS (|dispatchFunction| |EF;localReal?;FB;71|) $)))
             ('T
              (QSETREFV $ 134
                        (CONS (|dispatchFunction| |EF;localReal?;FB;72|) $)))))
           ('T
            (QSETREFV $ 134
                      (CONS (|dispatchFunction| |EF;localReal?;FB;73|) $))))
          (COND
           ((|HasCategory| |#1| '(|ElementaryFunctionCategory|))
            (PROGN
             (QSETREFV $ 149 (CONS (|dispatchFunction| |EF;iilog;2F;76|) $))
             (QSETREFV $ 151 (CONS (|dispatchFunction| |EF;iiexp;2F;77|) $))))
           ('T
            (PROGN
             (QSETREFV $ 149 (CONS (|dispatchFunction| |EF;iilog;2F;78|) $))
             (QSETREFV $ 151 (CONS (|dispatchFunction| |EF;iiexp;2F;79|) $)))))
          (COND
           ((|HasCategory| |#1| '(|TrigonometricFunctionCategory|))
            (PROGN
             (QSETREFV $ 153 (CONS (|dispatchFunction| |EF;iisin;2F;80|) $))
             (QSETREFV $ 155 (CONS (|dispatchFunction| |EF;iicos;2F;81|) $))
             (QSETREFV $ 157 (CONS (|dispatchFunction| |EF;iitan;2F;82|) $))
             (QSETREFV $ 159 (CONS (|dispatchFunction| |EF;iicot;2F;83|) $))
             (QSETREFV $ 161 (CONS (|dispatchFunction| |EF;iisec;2F;84|) $))
             (QSETREFV $ 163 (CONS (|dispatchFunction| |EF;iicsc;2F;85|) $))))
           ('T
            (PROGN
             (QSETREFV $ 153 (CONS (|dispatchFunction| |EF;iisin;2F;86|) $))
             (QSETREFV $ 155 (CONS (|dispatchFunction| |EF;iicos;2F;87|) $))
             (QSETREFV $ 157 (CONS (|dispatchFunction| |EF;iitan;2F;88|) $))
             (QSETREFV $ 159 (CONS (|dispatchFunction| |EF;iicot;2F;89|) $))
             (QSETREFV $ 161 (CONS (|dispatchFunction| |EF;iisec;2F;90|) $))
             (QSETREFV $ 163 (CONS (|dispatchFunction| |EF;iicsc;2F;91|) $)))))
          (COND
           ((|HasCategory| |#1| '(|ArcTrigonometricFunctionCategory|))
            (PROGN
             (QSETREFV $ 165 (CONS (|dispatchFunction| |EF;iiasin;2F;92|) $))
             (QSETREFV $ 167 (CONS (|dispatchFunction| |EF;iiacos;2F;93|) $))
             (QSETREFV $ 169 (CONS (|dispatchFunction| |EF;iiatan;2F;94|) $))
             (QSETREFV $ 171 (CONS (|dispatchFunction| |EF;iiacot;2F;95|) $))
             (QSETREFV $ 173 (CONS (|dispatchFunction| |EF;iiasec;2F;96|) $))
             (QSETREFV $ 175 (CONS (|dispatchFunction| |EF;iiacsc;2F;97|) $))))
           ('T
            (PROGN
             (QSETREFV $ 165 (CONS (|dispatchFunction| |EF;iiasin;2F;98|) $))
             (QSETREFV $ 167 (CONS (|dispatchFunction| |EF;iiacos;2F;99|) $))
             (QSETREFV $ 169 (CONS (|dispatchFunction| |EF;iiatan;2F;100|) $))
             (QSETREFV $ 171 (CONS (|dispatchFunction| |EF;iiacot;2F;101|) $))
             (QSETREFV $ 173 (CONS (|dispatchFunction| |EF;iiasec;2F;102|) $))
             (QSETREFV $ 175
                       (CONS (|dispatchFunction| |EF;iiacsc;2F;103|) $)))))
          (COND
           ((|HasCategory| |#1| '(|HyperbolicFunctionCategory|))
            (PROGN
             (QSETREFV $ 177 (CONS (|dispatchFunction| |EF;iisinh;2F;104|) $))
             (QSETREFV $ 179 (CONS (|dispatchFunction| |EF;iicosh;2F;105|) $))
             (QSETREFV $ 181 (CONS (|dispatchFunction| |EF;iitanh;2F;106|) $))
             (QSETREFV $ 183 (CONS (|dispatchFunction| |EF;iicoth;2F;107|) $))
             (QSETREFV $ 185 (CONS (|dispatchFunction| |EF;iisech;2F;108|) $))
             (QSETREFV $ 187
                       (CONS (|dispatchFunction| |EF;iicsch;2F;109|) $))))
           ('T
            (PROGN
             (QSETREFV $ 177 (CONS (|dispatchFunction| |EF;iisinh;2F;110|) $))
             (QSETREFV $ 179 (CONS (|dispatchFunction| |EF;iicosh;2F;111|) $))
             (QSETREFV $ 181 (CONS (|dispatchFunction| |EF;iitanh;2F;112|) $))
             (QSETREFV $ 183 (CONS (|dispatchFunction| |EF;iicoth;2F;113|) $))
             (QSETREFV $ 185 (CONS (|dispatchFunction| |EF;iisech;2F;114|) $))
             (QSETREFV $ 187
                       (CONS (|dispatchFunction| |EF;iicsch;2F;115|) $)))))
          (COND
           ((|HasCategory| |#1| '(|ArcHyperbolicFunctionCategory|))
            (PROGN
             (QSETREFV $ 189 (CONS (|dispatchFunction| |EF;iiasinh;2F;116|) $))
             (QSETREFV $ 191 (CONS (|dispatchFunction| |EF;iiacosh;2F;117|) $))
             (QSETREFV $ 193 (CONS (|dispatchFunction| |EF;iiatanh;2F;118|) $))
             (QSETREFV $ 195 (CONS (|dispatchFunction| |EF;iiacoth;2F;119|) $))
             (QSETREFV $ 197 (CONS (|dispatchFunction| |EF;iiasech;2F;120|) $))
             (QSETREFV $ 199
                       (CONS (|dispatchFunction| |EF;iiacsch;2F;121|) $))))
           ('T
            (PROGN
             (QSETREFV $ 189 (CONS (|dispatchFunction| |EF;iiasinh;2F;122|) $))
             (QSETREFV $ 191 (CONS (|dispatchFunction| |EF;iiacosh;2F;123|) $))
             (QSETREFV $ 193 (CONS (|dispatchFunction| |EF;iiatanh;2F;124|) $))
             (QSETREFV $ 195 (CONS (|dispatchFunction| |EF;iiacoth;2F;125|) $))
             (QSETREFV $ 197 (CONS (|dispatchFunction| |EF;iiasech;2F;126|) $))
             (QSETREFV $ 199
                       (CONS (|dispatchFunction| |EF;iiacsch;2F;127|) $)))))
          (SPADCALL (QREFELT $ 13) (CONS (|function| |EF;ipi|) $)
                    (QREFELT $ 202))
          (SPADCALL (QREFELT $ 14) (ELT $ 149) (QREFELT $ 204))
          (SPADCALL (QREFELT $ 15) (ELT $ 151) (QREFELT $ 204))
          (SPADCALL (QREFELT $ 16) (ELT $ 153) (QREFELT $ 204))
          (SPADCALL (QREFELT $ 17) (ELT $ 155) (QREFELT $ 204))
          (SPADCALL (QREFELT $ 18) (ELT $ 157) (QREFELT $ 204))
          (SPADCALL (QREFELT $ 19) (ELT $ 159) (QREFELT $ 204))
          (SPADCALL (QREFELT $ 20) (ELT $ 161) (QREFELT $ 204))
          (SPADCALL (QREFELT $ 21) (ELT $ 163) (QREFELT $ 204))
          (SPADCALL (QREFELT $ 22) (ELT $ 165) (QREFELT $ 204))
          (SPADCALL (QREFELT $ 23) (ELT $ 167) (QREFELT $ 204))
          (SPADCALL (QREFELT $ 24) (ELT $ 169) (QREFELT $ 204))
          (SPADCALL (QREFELT $ 25) (ELT $ 171) (QREFELT $ 204))
          (SPADCALL (QREFELT $ 26) (ELT $ 173) (QREFELT $ 204))
          (SPADCALL (QREFELT $ 27) (ELT $ 175) (QREFELT $ 204))
          (SPADCALL (QREFELT $ 28) (ELT $ 177) (QREFELT $ 204))
          (SPADCALL (QREFELT $ 29) (ELT $ 179) (QREFELT $ 204))
          (SPADCALL (QREFELT $ 30) (ELT $ 181) (QREFELT $ 204))
          (SPADCALL (QREFELT $ 31) (ELT $ 183) (QREFELT $ 204))
          (SPADCALL (QREFELT $ 32) (ELT $ 185) (QREFELT $ 204))
          (SPADCALL (QREFELT $ 33) (ELT $ 187) (QREFELT $ 204))
          (SPADCALL (QREFELT $ 34) (ELT $ 189) (QREFELT $ 204))
          (SPADCALL (QREFELT $ 35) (ELT $ 191) (QREFELT $ 204))
          (SPADCALL (QREFELT $ 36) (ELT $ 193) (QREFELT $ 204))
          (SPADCALL (QREFELT $ 37) (ELT $ 195) (QREFELT $ 204))
          (SPADCALL (QREFELT $ 38) (ELT $ 197) (QREFELT $ 204))
          (SPADCALL (QREFELT $ 39) (ELT $ 199) (QREFELT $ 204))
          (SPADCALL (QREFELT $ 15) (ELT $ 61) (QREFELT $ 205))
          (SPADCALL (QREFELT $ 14) (ELT $ 121) (QREFELT $ 205))
          (SPADCALL (QREFELT $ 16) (ELT $ 63) (QREFELT $ 205))
          (SPADCALL (QREFELT $ 17) (CONS #'|ElementaryFunction!0| $)
                    (QREFELT $ 205))
          (SPADCALL (QREFELT $ 18) (CONS #'|ElementaryFunction!1| $)
                    (QREFELT $ 205))
          (SPADCALL (QREFELT $ 19) (CONS #'|ElementaryFunction!2| $)
                    (QREFELT $ 205))
          (SPADCALL (QREFELT $ 20) (CONS #'|ElementaryFunction!3| $)
                    (QREFELT $ 205))
          (SPADCALL (QREFELT $ 21) (CONS #'|ElementaryFunction!4| $)
                    (QREFELT $ 205))
          (SPADCALL (QREFELT $ 22) (CONS #'|ElementaryFunction!5| $)
                    (QREFELT $ 205))
          (SPADCALL (QREFELT $ 23) (CONS #'|ElementaryFunction!6| $)
                    (QREFELT $ 205))
          (SPADCALL (QREFELT $ 24) (CONS #'|ElementaryFunction!7| $)
                    (QREFELT $ 205))
          (SPADCALL (QREFELT $ 25) (CONS #'|ElementaryFunction!8| $)
                    (QREFELT $ 205))
          (SPADCALL (QREFELT $ 26) (CONS #'|ElementaryFunction!9| $)
                    (QREFELT $ 205))
          (SPADCALL (QREFELT $ 27) (CONS #'|ElementaryFunction!10| $)
                    (QREFELT $ 205))
          (SPADCALL (QREFELT $ 28) (ELT $ 75) (QREFELT $ 205))
          (SPADCALL (QREFELT $ 29) (ELT $ 74) (QREFELT $ 205))
          (SPADCALL (QREFELT $ 30) (CONS #'|ElementaryFunction!11| $)
                    (QREFELT $ 205))
          (SPADCALL (QREFELT $ 31) (CONS #'|ElementaryFunction!12| $)
                    (QREFELT $ 205))
          (SPADCALL (QREFELT $ 32) (CONS #'|ElementaryFunction!13| $)
                    (QREFELT $ 205))
          (SPADCALL (QREFELT $ 33) (CONS #'|ElementaryFunction!14| $)
                    (QREFELT $ 205))
          (SPADCALL (QREFELT $ 34) (CONS #'|ElementaryFunction!15| $)
                    (QREFELT $ 205))
          (SPADCALL (QREFELT $ 35) (CONS #'|ElementaryFunction!16| $)
                    (QREFELT $ 205))
          (SPADCALL (QREFELT $ 36) (CONS #'|ElementaryFunction!17| $)
                    (QREFELT $ 205))
          (SPADCALL (QREFELT $ 37) (CONS #'|ElementaryFunction!18| $)
                    (QREFELT $ 205))
          (SPADCALL (QREFELT $ 38) (CONS #'|ElementaryFunction!19| $)
                    (QREFELT $ 205))
          (SPADCALL (QREFELT $ 39) (CONS #'|ElementaryFunction!20| $)
                    (QREFELT $ 205))
          $))) 

(DEFUN |ElementaryFunction!20| (|x| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (SPADCALL |x| 2 (QREFELT $ 118))
              (SPADCALL
               (SPADCALL
                (SPADCALL (SPADCALL |x| 2 (QREFELT $ 118)) (QREFELT $ 121))
                (|spadConstant| $ 48) (QREFELT $ 120))
               (QREFELT $ 50))
              (QREFELT $ 122))
    (QREFELT $ 121))
   (QREFELT $ 49))) 

(DEFUN |ElementaryFunction!19| (|x| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (SPADCALL |x| 2 (QREFELT $ 118))
              (SPADCALL
               (SPADCALL
                (SPADCALL (SPADCALL |x| 2 (QREFELT $ 118)) (QREFELT $ 121))
                (|spadConstant| $ 48) (QREFELT $ 119))
               (QREFELT $ 50))
              (QREFELT $ 122))
    (QREFELT $ 121))
   (QREFELT $ 49))) 

(DEFUN |ElementaryFunction!18| (|x| $)
  (SPADCALL
   (SPADCALL (|spadConstant| $ 48) (SPADCALL |x| 2 (QREFELT $ 118))
             (QREFELT $ 119))
   (QREFELT $ 121))) 

(DEFUN |ElementaryFunction!17| (|x| $)
  (SPADCALL
   (SPADCALL (|spadConstant| $ 48) (SPADCALL |x| 2 (QREFELT $ 118))
             (QREFELT $ 119))
   (QREFELT $ 121))) 

(DEFUN |ElementaryFunction!16| (|x| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (SPADCALL |x| 2 (QREFELT $ 118)) (|spadConstant| $ 48)
              (QREFELT $ 119))
    (QREFELT $ 50))
   (QREFELT $ 121))) 

(DEFUN |ElementaryFunction!15| (|x| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (|spadConstant| $ 48) (SPADCALL |x| 2 (QREFELT $ 118))
              (QREFELT $ 120))
    (QREFELT $ 50))
   (QREFELT $ 121))) 

(DEFUN |ElementaryFunction!14| (|x| $)
  (SPADCALL
   (SPADCALL (SPADCALL |x| (QREFELT $ 77)) (SPADCALL |x| (QREFELT $ 79))
             (QREFELT $ 122))
   (QREFELT $ 49))) 

(DEFUN |ElementaryFunction!13| (|x| $)
  (SPADCALL
   (SPADCALL (SPADCALL |x| (QREFELT $ 76)) (SPADCALL |x| (QREFELT $ 78))
             (QREFELT $ 122))
   (QREFELT $ 49))) 

(DEFUN |ElementaryFunction!12| (|x| $)
  (SPADCALL (|spadConstant| $ 48)
            (SPADCALL (SPADCALL |x| (QREFELT $ 77)) 2 (QREFELT $ 206))
            (QREFELT $ 119))) 

(DEFUN |ElementaryFunction!11| (|x| $)
  (SPADCALL (|spadConstant| $ 48)
            (SPADCALL (SPADCALL |x| (QREFELT $ 76)) 2 (QREFELT $ 206))
            (QREFELT $ 119))) 

(DEFUN |ElementaryFunction!10| (|x| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (SPADCALL |x| 2 (QREFELT $ 118))
              (SPADCALL
               (SPADCALL (|spadConstant| $ 48)
                         (SPADCALL (SPADCALL |x| 2 (QREFELT $ 118))
                                   (QREFELT $ 121))
                         (QREFELT $ 119))
               (QREFELT $ 50))
              (QREFELT $ 122))
    (QREFELT $ 121))
   (QREFELT $ 49))) 

(DEFUN |ElementaryFunction!9| (|x| $)
  (SPADCALL
   (SPADCALL (SPADCALL |x| 2 (QREFELT $ 118))
             (SPADCALL
              (SPADCALL (|spadConstant| $ 48)
                        (SPADCALL (SPADCALL |x| 2 (QREFELT $ 118))
                                  (QREFELT $ 121))
                        (QREFELT $ 119))
              (QREFELT $ 50))
             (QREFELT $ 122))
   (QREFELT $ 121))) 

(DEFUN |ElementaryFunction!8| (|x| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (|spadConstant| $ 48) (SPADCALL |x| 2 (QREFELT $ 118))
              (QREFELT $ 120))
    (QREFELT $ 121))
   (QREFELT $ 49))) 

(DEFUN |ElementaryFunction!7| (|x| $)
  (SPADCALL
   (SPADCALL (|spadConstant| $ 48) (SPADCALL |x| 2 (QREFELT $ 118))
             (QREFELT $ 120))
   (QREFELT $ 121))) 

(DEFUN |ElementaryFunction!6| (|x| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL
     (SPADCALL (|spadConstant| $ 48) (SPADCALL |x| 2 (QREFELT $ 118))
               (QREFELT $ 119))
     (QREFELT $ 50))
    (QREFELT $ 121))
   (QREFELT $ 49))) 

(DEFUN |ElementaryFunction!5| (|x| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (|spadConstant| $ 48) (SPADCALL |x| 2 (QREFELT $ 118))
              (QREFELT $ 119))
    (QREFELT $ 50))
   (QREFELT $ 121))) 

(DEFUN |ElementaryFunction!4| (|x| $)
  (SPADCALL
   (SPADCALL (SPADCALL |x| (QREFELT $ 65)) (SPADCALL |x| (QREFELT $ 67))
             (QREFELT $ 122))
   (QREFELT $ 49))) 

(DEFUN |ElementaryFunction!3| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 64)) (SPADCALL |x| (QREFELT $ 66))
            (QREFELT $ 122))) 

(DEFUN |ElementaryFunction!2| (|x| $)
  (SPADCALL (SPADCALL (|spadConstant| $ 48) (QREFELT $ 49))
            (SPADCALL (SPADCALL |x| (QREFELT $ 65)) 2 (QREFELT $ 206))
            (QREFELT $ 119))) 

(DEFUN |ElementaryFunction!1| (|x| $)
  (SPADCALL (|spadConstant| $ 48)
            (SPADCALL (SPADCALL |x| (QREFELT $ 64)) 2 (QREFELT $ 206))
            (QREFELT $ 120))) 

(DEFUN |ElementaryFunction!0| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 62)) (QREFELT $ 49))) 

(MAKEPROP '|ElementaryFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'ELEM
              (|BasicOperator|) (|Symbol|) (|CommonOperators|) (0 . |operator|)
              '|oppi| '|oplog| '|opexp| '|opsin| '|opcos| '|optan| '|opcot|
              '|opsec| '|opcsc| '|opasin| '|opacos| '|opatan| '|opacot|
              '|opasec| '|opacsc| '|opsinh| '|opcosh| '|optanh| '|opcoth|
              '|opsech| '|opcsch| '|opasinh| '|opacosh| '|opatanh| '|opacoth|
              '|opasech| '|opacsch| (5 . |pi|) (9 . |coerce|) '|Pie| (|List| $)
              (14 . |kernel|) (20 . |pi|) (24 . |imaginary|) '|isqrt1|
              (28 . |One|) (32 . -) (37 . |sqrt|) (|Integer|) (42 . |coerce|)
              (47 . |sqrt|) '|isqrt2| '|isqrt3| (52 . |coerce|)
              (57 . |iisqrt2|) (61 . |iisqrt3|) (65 . |elt|) |EF;log;2F;12|
              |EF;exp;2F;13| |EF;sin;2F;14| |EF;cos;2F;15| |EF;tan;2F;16|
              |EF;cot;2F;17| |EF;sec;2F;18| |EF;csc;2F;19| |EF;asin;2F;20|
              |EF;acos;2F;21| |EF;atan;2F;22| |EF;acot;2F;23| |EF;asec;2F;24|
              |EF;acsc;2F;25| |EF;sinh;2F;26| |EF;cosh;2F;27| |EF;tanh;2F;28|
              |EF;coth;2F;29| |EF;sech;2F;30| |EF;csch;2F;31| |EF;asinh;2F;32|
              |EF;acosh;2F;33| |EF;atanh;2F;34| |EF;acoth;2F;35|
              |EF;asech;2F;36| |EF;acsch;2F;37| (|Kernel| $) (71 . |retract|)
              (76 . |Zero|) (80 . |Zero|) (|Boolean|) (84 . |has?|)
              |EF;belong?;BoB;41| (90 . |is?|) |EF;operator;2Bo;42|
              (|Union| 86 '#1="failed") (96 . |retractIfCan|) (|List| 7)
              (|Kernel| 7) (101 . |argument|) (106 . /) (|Union| 107 '#1#)
              (112 . |retractIfCan|) (|Record| (|:| |func| 7) (|:| |pole| 90))
              (|List| 103) (117 . |minIndex|) (|Union| 51 '"failed")
              (|Fraction| 51) (122 . |retractIfCan|) (127 . |even?|)
              (132 . |elt|) (138 . |One|) (|PositiveInteger|) (142 . *)
              (|Union| 7 '"failed") (148 . |specialTrigs|) (154 . |zero?|)
              (159 . |is?|) (165 . ^) (171 . -) (177 . +) (183 . |inv|)
              (188 . *) (194 . |kernel|) (200 . *) (206 . =) (212 . |is?|)
              (218 . |smaller?|) (|List| 10) (224 . |variables|)
              (|Union| 6 '#1#) (229 . |retractIfCan|) (234 . |conjugate|)
              (239 . =) (245 . |localReal?|)
              (|Record| (|:| |var| 86) (|:| |exponent| 51))
              (|Union| 135 '"failed") (250 . |isExpt|) (256 . *)
              (|SparseMultivariatePolynomial| 6 86) (262 . |numer|)
              (|SparseMultivariatePolynomial| 6 98) (267 . |One|) (271 . =)
              (277 . |denom|) (282 . ~=) (288 . -) (293 . |coerce|)
              (298 . |log|) (303 . |iilog|) (308 . |exp|) (313 . |iiexp|)
              (318 . |sin|) (323 . |iisin|) (328 . |cos|) (333 . |iicos|)
              (338 . |tan|) (343 . |iitan|) (348 . |cot|) (353 . |iicot|)
              (358 . |sec|) (363 . |iisec|) (368 . |csc|) (373 . |iicsc|)
              (378 . |asin|) (383 . |iiasin|) (388 . |acos|) (393 . |iiacos|)
              (398 . |atan|) (403 . |iiatan|) (408 . |acot|) (413 . |iiacot|)
              (418 . |asec|) (423 . |iiasec|) (428 . |acsc|) (433 . |iiacsc|)
              (438 . |sinh|) (443 . |iisinh|) (448 . |cosh|) (453 . |iicosh|)
              (458 . |tanh|) (463 . |iitanh|) (468 . |coth|) (473 . |iicoth|)
              (478 . |sech|) (483 . |iisech|) (488 . |csch|) (493 . |iicsch|)
              (498 . |asinh|) (503 . |iiasinh|) (508 . |acosh|)
              (513 . |iiacosh|) (518 . |atanh|) (523 . |iiatanh|)
              (528 . |acoth|) (533 . |iiacoth|) (538 . |asech|)
              (543 . |iiasech|) (548 . |acsch|) (553 . |iiacsch|)
              (|Mapping| 7 97) (|BasicOperatorFunctions1| 7) (558 . |evaluate|)
              (|Mapping| 7 7) (564 . |evaluate|) (570 . |derivative|)
              (576 . ^))
           '#(|tanh| 582 |tan| 587 |specialTrigs| 592 |sinh| 598 |sin| 603
              |sech| 608 |sec| 613 |pi| 618 |operator| 622 |log| 627
              |localReal?| 632 |iitanh| 637 |iitan| 642 |iisqrt3| 647 |iisqrt2|
              651 |iisinh| 655 |iisin| 660 |iisech| 665 |iisec| 670 |iilog| 675
              |iiexp| 680 |iicsch| 685 |iicsc| 690 |iicoth| 695 |iicot| 700
              |iicosh| 705 |iicos| 710 |iiatanh| 715 |iiatan| 720 |iiasinh| 725
              |iiasin| 730 |iiasech| 735 |iiasec| 740 |iiacsch| 745 |iiacsc|
              750 |iiacoth| 755 |iiacot| 760 |iiacosh| 765 |iiacos| 770 |exp|
              775 |csch| 780 |csc| 785 |coth| 790 |cot| 795 |cosh| 800 |cos|
              805 |belong?| 810 |atanh| 815 |atan| 820 |asinh| 825 |asin| 830
              |asech| 835 |asec| 840 |acsch| 845 |acsc| 850 |acoth| 855 |acot|
              860 |acosh| 865 |acos| 870)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 206
                                                 '(1 11 9 10 12 0 6 0 40 1 7 0
                                                   6 41 2 7 0 9 43 44 0 0 7 45
                                                   0 6 0 46 0 7 0 48 1 7 0 0 49
                                                   1 7 0 0 50 1 6 0 51 52 1 6 0
                                                   0 53 1 7 0 51 56 0 0 7 57 0
                                                   0 7 58 2 7 0 9 0 59 1 7 86 0
                                                   87 0 6 0 88 0 7 0 89 2 9 90
                                                   0 10 91 2 9 90 0 10 93 1 7
                                                   95 0 96 1 98 97 0 99 2 7 0 0
                                                   0 100 1 7 101 0 102 1 104 51
                                                   0 105 1 107 106 0 108 1 51
                                                   90 0 109 2 104 103 0 51 110
                                                   0 6 0 111 2 107 0 112 0 113
                                                   2 0 114 7 104 115 1 7 90 0
                                                   116 2 7 90 0 9 117 2 7 0 0
                                                   112 118 2 7 0 0 0 119 2 7 0
                                                   0 0 120 1 7 0 0 121 2 7 0 0
                                                   0 122 2 7 0 9 0 123 2 7 0
                                                   112 0 124 2 7 90 0 0 125 2
                                                   98 90 0 10 126 2 7 90 0 0
                                                   127 1 7 128 0 129 1 7 130 0
                                                   131 1 6 0 0 132 2 6 90 0 0
                                                   133 1 0 90 7 134 2 7 136 0 9
                                                   137 2 7 0 51 0 138 1 7 139 0
                                                   140 0 141 0 142 2 141 90 0 0
                                                   143 1 7 139 0 144 2 141 90 0
                                                   0 145 1 141 0 0 146 1 7 0
                                                   139 147 1 6 0 0 148 1 0 7 7
                                                   149 1 6 0 0 150 1 0 7 7 151
                                                   1 6 0 0 152 1 0 7 7 153 1 6
                                                   0 0 154 1 0 7 7 155 1 6 0 0
                                                   156 1 0 7 7 157 1 6 0 0 158
                                                   1 0 7 7 159 1 6 0 0 160 1 0
                                                   7 7 161 1 6 0 0 162 1 0 7 7
                                                   163 1 6 0 0 164 1 0 7 7 165
                                                   1 6 0 0 166 1 0 7 7 167 1 6
                                                   0 0 168 1 0 7 7 169 1 6 0 0
                                                   170 1 0 7 7 171 1 6 0 0 172
                                                   1 0 7 7 173 1 6 0 0 174 1 0
                                                   7 7 175 1 6 0 0 176 1 0 7 7
                                                   177 1 6 0 0 178 1 0 7 7 179
                                                   1 6 0 0 180 1 0 7 7 181 1 6
                                                   0 0 182 1 0 7 7 183 1 6 0 0
                                                   184 1 0 7 7 185 1 6 0 0 186
                                                   1 0 7 7 187 1 6 0 0 188 1 0
                                                   7 7 189 1 6 0 0 190 1 0 7 7
                                                   191 1 6 0 0 192 1 0 7 7 193
                                                   1 6 0 0 194 1 0 7 7 195 1 6
                                                   0 0 196 1 0 7 7 197 1 6 0 0
                                                   198 1 0 7 7 199 2 201 9 9
                                                   200 202 2 201 9 9 203 204 2
                                                   201 9 9 203 205 2 7 0 0 51
                                                   206 1 0 7 7 76 1 0 7 7 64 2
                                                   0 114 7 104 115 1 0 7 7 74 1
                                                   0 7 7 62 1 0 7 7 78 1 0 7 7
                                                   66 0 0 7 45 1 0 9 9 94 1 0 7
                                                   7 60 1 0 90 7 134 1 0 7 7
                                                   181 1 0 7 7 157 0 0 7 58 0 0
                                                   7 57 1 0 7 7 177 1 0 7 7 153
                                                   1 0 7 7 185 1 0 7 7 161 1 0
                                                   7 7 149 1 0 7 7 151 1 0 7 7
                                                   187 1 0 7 7 163 1 0 7 7 183
                                                   1 0 7 7 159 1 0 7 7 179 1 0
                                                   7 7 155 1 0 7 7 193 1 0 7 7
                                                   169 1 0 7 7 189 1 0 7 7 165
                                                   1 0 7 7 197 1 0 7 7 173 1 0
                                                   7 7 199 1 0 7 7 175 1 0 7 7
                                                   195 1 0 7 7 171 1 0 7 7 191
                                                   1 0 7 7 167 1 0 7 7 61 1 0 7
                                                   7 79 1 0 7 7 67 1 0 7 7 77 1
                                                   0 7 7 65 1 0 7 7 75 1 0 7 7
                                                   63 1 0 90 9 92 1 0 7 7 82 1
                                                   0 7 7 70 1 0 7 7 80 1 0 7 7
                                                   68 1 0 7 7 84 1 0 7 7 72 1 0
                                                   7 7 85 1 0 7 7 73 1 0 7 7 83
                                                   1 0 7 7 71 1 0 7 7 81 1 0 7
                                                   7 69)))))
           '|lookupComplete|)) 
