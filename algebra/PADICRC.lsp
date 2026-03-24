
(PUT '|PADICRC;getExpon| '|SPADreplace| 'QCAR) 

(SDEFUN |PADICRC;getExpon| ((|x| (%)) (% (|Integer|))) (QCAR |x|)) 

(PUT '|PADICRC;getZp| '|SPADreplace| 'QCDR) 

(SDEFUN |PADICRC;getZp| ((|x| (%)) (% (PADIC))) (QCDR |x|)) 

(PUT '|PADICRC;makeQp| '|SPADreplace| 'CONS) 

(SDEFUN |PADICRC;makeQp| ((|r| (|Integer|)) (|int| (PADIC)) (% (%)))
        (CONS |r| |int|)) 

(SDEFUN |PADICRC;Zero;%;4| ((% (%)))
        (|PADICRC;makeQp| 0 (|spadConstant| % 13) %)) 

(SDEFUN |PADICRC;One;%;5| ((% (%)))
        (|PADICRC;makeQp| 0 (|spadConstant| % 15) %)) 

(SDEFUN |PADICRC;coerce;I%;6| ((|x| (|Integer|)) (% (%)))
        (SPADCALL (SPADCALL |x| (QREFELT % 17)) (QREFELT % 18))) 

(SDEFUN |PADICRC;coerce;F%;7| ((|r| (|Fraction| (|Integer|))) (% (%)))
        (SPADCALL (SPADCALL (SPADCALL |r| (QREFELT % 21)) (QREFELT % 19))
                  (SPADCALL (SPADCALL |r| (QREFELT % 22)) (QREFELT % 19))
                  (QREFELT % 23))) 

(SDEFUN |PADICRC;coerce;PADIC%;8| ((|x| (PADIC)) (% (%)))
        (|PADICRC;makeQp| 0 |x| %)) 

(SDEFUN |PADICRC;retractIfCan;%U;9| ((|x| (%)) (% (|Union| PADIC "failed")))
        (SPROG ((|n| (|Integer|)))
               (SEQ (LETT |n| (|PADICRC;getExpon| |x| %))
                    (COND
                     ((< |n| 0)
                      (SEQ (LETT |x| (SPADCALL (- |n|) |x| (QREFELT % 25)))
                           (EXIT (LETT |n| (|PADICRC;getExpon| |x| %))))))
                    (EXIT
                     (COND ((< |n| 0) (CONS 1 "failed"))
                           ('T
                            (CONS 0
                                  (SPADCALL (EXPT (QREFELT % 6) |n|)
                                            (|PADICRC;getZp| |x| %)
                                            (QREFELT % 26))))))))) 

(SDEFUN |PADICRC;numer;%PADIC;10| ((|x| (%)) (% (PADIC)))
        (SPROG ((|n| (|Integer|)))
               (SEQ (LETT |n| (|PADICRC;getExpon| |x| %))
                    (COND
                     ((< |n| 0)
                      (SEQ (LETT |x| (SPADCALL (- |n|) |x| (QREFELT % 25)))
                           (EXIT (LETT |n| (|PADICRC;getExpon| |x| %))))))
                    (EXIT
                     (COND ((<= |n| 0) (|PADICRC;getZp| |x| %))
                           ('T
                            (SPADCALL (EXPT (QREFELT % 6) |n|)
                                      (|PADICRC;getZp| |x| %)
                                      (QREFELT % 26)))))))) 

(SDEFUN |PADICRC;denom;%PADIC;11| ((|x| (%)) (% (PADIC)))
        (SPROG ((|n| (|Integer|)))
               (SEQ (LETT |n| (|PADICRC;getExpon| |x| %))
                    (COND
                     ((< |n| 0)
                      (SEQ (LETT |x| (SPADCALL (- |n|) |x| (QREFELT % 25)))
                           (EXIT (LETT |n| (|PADICRC;getExpon| |x| %))))))
                    (EXIT
                     (COND
                      ((<= |n| 0)
                       (SPADCALL (EXPT (QREFELT % 6) (- |n|)) (QREFELT % 17)))
                      ('T (|spadConstant| % 15))))))) 

(SDEFUN |PADICRC;wholePart;%PADIC;12| ((|x| (%)) (% (PADIC)))
        (SPROG ((|ix| (PADIC)) (#1=#:G53 NIL) (|i| NIL) (|n| (|Integer|)))
               (SEQ (LETT |n| (|PADICRC;getExpon| |x| %))
                    (COND
                     ((< |n| 0)
                      (SEQ (LETT |x| (SPADCALL (- |n|) |x| (QREFELT % 25)))
                           (EXIT (LETT |n| (|PADICRC;getExpon| |x| %))))))
                    (EXIT
                     (COND
                      ((>= |n| 0)
                       (SPADCALL (EXPT (QREFELT % 6) |n|)
                                 (|PADICRC;getZp| |x| %) (QREFELT % 26)))
                      ('T
                       (SEQ (LETT |ix| (|PADICRC;getZp| |x| %))
                            (SEQ (LETT |i| 1) (LETT #1# (- |n|)) G190
                                 (COND ((|greater_SI| |i| #1#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT |ix| (SPADCALL |ix| (QREFELT % 31)))))
                                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT |ix|)))))))) 

(SDEFUN |PADICRC;removeZeroes;2%;13| ((|x| (%)) (% (%)))
        (SPROG ((|xx| (PADIC)))
               (COND
                ((SPADCALL
                  (SPADCALL (LETT |xx| (|PADICRC;getZp| |x| %)) (QREFELT % 34))
                  (QREFELT % 36))
                 (|spadConstant| % 14))
                ((ZEROP (SPADCALL |xx| (QREFELT % 37)))
                 (SPADCALL
                  (|PADICRC;makeQp| (+ (|PADICRC;getExpon| |x| %) 1)
                   (SPADCALL |xx| (QREFELT % 31)) %)
                  (QREFELT % 38)))
                ('T |x|)))) 

(SDEFUN |PADICRC;removeZeroes;I2%;14| ((|n| (|Integer|)) (|x| (%)) (% (%)))
        (SPROG ((|xx| (PADIC)))
               (COND ((<= |n| 0) |x|)
                     ((SPADCALL
                       (SPADCALL (LETT |xx| (|PADICRC;getZp| |x| %))
                                 (QREFELT % 34))
                       (QREFELT % 36))
                      (|spadConstant| % 14))
                     ((ZEROP (SPADCALL |xx| (QREFELT % 37)))
                      (SPADCALL (- |n| 1)
                                (|PADICRC;makeQp|
                                 (+ (|PADICRC;getExpon| |x| %) 1)
                                 (SPADCALL |xx| (QREFELT % 31)) %)
                                (QREFELT % 25)))
                     ('T |x|)))) 

(SDEFUN |PADICRC;=;2%B;15| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((#1=#:G260 NIL) (#2=#:G193 NIL) (|n| (|Integer|)))
               (SEQ
                (COND ((EQ |x| |y|) 'T)
                      (#3='T
                       (SEQ
                        (LETT |n|
                              (- (|PADICRC;getExpon| |x| %)
                                 (|PADICRC;getExpon| |y| %)))
                        (EXIT
                         (COND
                          ((>= |n| 0)
                           (SPADCALL
                            (SPADCALL
                             (EXPT (QREFELT % 6)
                                   (PROG1 (LETT #2# |n|)
                                     (|check_subtype2| (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #2#)))
                             (|PADICRC;getZp| |x| %) (QREFELT % 26))
                            (|PADICRC;getZp| |y| %) (QREFELT % 39)))
                          (#3#
                           (SPADCALL
                            (SPADCALL
                             (EXPT (QREFELT % 6)
                                   (PROG1 (LETT #1# (- |n|))
                                     (|check_subtype2| (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #1#)))
                             (|PADICRC;getZp| |y| %) (QREFELT % 26))
                            (|PADICRC;getZp| |x| %) (QREFELT % 39))))))))))) 

(SDEFUN |PADICRC;+;3%;16| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG ((#1=#:G278 NIL) (#2=#:G274 NIL) (|n| (|Integer|)))
               (SEQ
                (LETT |n|
                      (- (|PADICRC;getExpon| |x| %)
                         (|PADICRC;getExpon| |y| %)))
                (EXIT
                 (COND
                  ((>= |n| 0)
                   (|PADICRC;makeQp| (|PADICRC;getExpon| |y| %)
                    (SPADCALL (|PADICRC;getZp| |y| %)
                              (SPADCALL
                               (EXPT (QREFELT % 6)
                                     (PROG1 (LETT #2# |n|)
                                       (|check_subtype2| (>= #2# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #2#)))
                               (|PADICRC;getZp| |x| %) (QREFELT % 26))
                              (QREFELT % 41))
                    %))
                  ('T
                   (|PADICRC;makeQp| (|PADICRC;getExpon| |x| %)
                    (SPADCALL (|PADICRC;getZp| |x| %)
                              (SPADCALL
                               (EXPT (QREFELT % 6)
                                     (PROG1 (LETT #1# (- |n|))
                                       (|check_subtype2| (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #1#)))
                               (|PADICRC;getZp| |y| %) (QREFELT % 26))
                              (QREFELT % 41))
                    %))))))) 

(SDEFUN |PADICRC;-;2%;17| ((|x| (%)) (% (%)))
        (|PADICRC;makeQp| (|PADICRC;getExpon| |x| %)
         (SPADCALL (|PADICRC;getZp| |x| %) (QREFELT % 43)) %)) 

(SDEFUN |PADICRC;-;3%;18| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG ((#1=#:G296 NIL) (#2=#:G292 NIL) (|n| (|Integer|)))
               (SEQ
                (LETT |n|
                      (- (|PADICRC;getExpon| |x| %)
                         (|PADICRC;getExpon| |y| %)))
                (EXIT
                 (COND
                  ((>= |n| 0)
                   (|PADICRC;makeQp| (|PADICRC;getExpon| |y| %)
                    (SPADCALL
                     (SPADCALL
                      (EXPT (QREFELT % 6)
                            (PROG1 (LETT #2# |n|)
                              (|check_subtype2| (>= #2# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #2#)))
                      (|PADICRC;getZp| |x| %) (QREFELT % 26))
                     (|PADICRC;getZp| |y| %) (QREFELT % 45))
                    %))
                  ('T
                   (|PADICRC;makeQp| (|PADICRC;getExpon| |x| %)
                    (SPADCALL (|PADICRC;getZp| |x| %)
                              (SPADCALL
                               (EXPT (QREFELT % 6)
                                     (PROG1 (LETT #1# (- |n|))
                                       (|check_subtype2| (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #1#)))
                               (|PADICRC;getZp| |y| %) (QREFELT % 26))
                              (QREFELT % 45))
                    %))))))) 

(SDEFUN |PADICRC;*;I2%;19| ((|n| (|Integer|)) (|x| (%)) (% (%)))
        (|PADICRC;makeQp| (|PADICRC;getExpon| |x| %)
         (SPADCALL |n| (|PADICRC;getZp| |x| %) (QREFELT % 26)) %)) 

(SDEFUN |PADICRC;*;3%;20| ((|x| (%)) (|y| (%)) (% (%)))
        (|PADICRC;makeQp|
         (+ (|PADICRC;getExpon| |x| %) (|PADICRC;getExpon| |y| %))
         (SPADCALL (|PADICRC;getZp| |x| %) (|PADICRC;getZp| |y| %)
                   (QREFELT % 48))
         %)) 

(SDEFUN |PADICRC;^;%I%;21| ((|x| (%)) (|n| (|Integer|)) (% (%)))
        (SPROG ((#1=#:G303 NIL) (#2=#:G302 NIL))
               (COND ((ZEROP |n|) (|spadConstant| % 16))
                     ((PLUSP |n|)
                      (SPADCALL |x|
                                (PROG1 (LETT #2# |n|)
                                  (|check_subtype2| (> #2# 0)
                                                    '(|PositiveInteger|)
                                                    '(|Integer|) #2#))
                                (QREFELT % 52)))
                     ('T
                      (SPADCALL
                       (SPADCALL |x|
                                 (PROG1 (LETT #1# (- |n|))
                                   (|check_subtype2| (> #1# 0)
                                                     '(|PositiveInteger|)
                                                     '(|Integer|) #1#))
                                 (QREFELT % 52))
                       (QREFELT % 53)))))) 

(SDEFUN |PADICRC;recip;%U;22| ((|x| (%)) (% (|Union| % #1="failed")))
        (SPROG ((|inv| (|Union| PADIC #1#)) (|xx| (PADIC)))
               (SEQ (LETT |x| (SPADCALL 1000 |x| (QREFELT % 25)))
                    (EXIT
                     (COND
                      ((ZEROP
                        (SPADCALL (LETT |xx| (|PADICRC;getZp| |x| %))
                                  (QREFELT % 37)))
                       (CONS 1 "failed"))
                      (#2='T
                       (SEQ (LETT |inv| (SPADCALL |xx| (QREFELT % 56)))
                            (EXIT
                             (COND ((QEQCAR |inv| 1) (CONS 1 "failed"))
                                   (#2#
                                    (CONS 0
                                          (|PADICRC;makeQp|
                                           (- (|PADICRC;getExpon| |x| %))
                                           (QCDR |inv|) %)))))))))))) 

(SDEFUN |PADICRC;inv;2%;23| ((|x| (%)) (% (%)))
        (SPROG ((|inv| (|Union| % "failed")))
               (SEQ (LETT |inv| (SPADCALL |x| (QREFELT % 57)))
                    (EXIT
                     (COND ((QEQCAR |inv| 1) (|error| "inv: no inverse"))
                           ('T (QCDR |inv|))))))) 

(SDEFUN |PADICRC;/;3%;24| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| (SPADCALL |y| (QREFELT % 53)) (QREFELT % 49))) 

(SDEFUN |PADICRC;/;2PADIC%;25| ((|x| (PADIC)) (|y| (PADIC)) (% (%)))
        (SPADCALL (SPADCALL |x| (QREFELT % 18)) (SPADCALL |y| (QREFELT % 18))
                  (QREFELT % 23))) 

(SDEFUN |PADICRC;*;PADIC2%;26| ((|x| (PADIC)) (|y| (%)) (% (%)))
        (|PADICRC;makeQp| (|PADICRC;getExpon| |y| %)
         (SPADCALL |x| (|PADICRC;getZp| |y| %) (QREFELT % 48)) %)) 

(SDEFUN |PADICRC;approximate;%IF;27|
        ((|x| (%)) (|n| (|Integer|)) (% (|Fraction| (|Integer|))))
        (SPROG ((|k| (|Integer|)))
               (SEQ (LETT |k| (|PADICRC;getExpon| |x| %))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL (QREFELT % 6) (QREFELT % 60)) |k|
                                (QREFELT % 61))
                      (SPADCALL (|PADICRC;getZp| |x| %) (- |n| |k|)
                                (QREFELT % 62))
                      (QREFELT % 63)))))) 

(SDEFUN |PADICRC;cfStream| ((|x| (%)) (% (|Stream| (|Fraction| (|Integer|)))))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|PADICRC;cfStream!0| (VECTOR % |x|))
                          (QREFELT % 69))))) 

(SDEFUN |PADICRC;cfStream!0| (($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|invx| NIL) (|x0| NIL))
                   (SEQ (LETT |invx| (SPADCALL |x| (QREFELT % 53)))
                        (LETT |x0|
                              (SPADCALL |invx| (|spadConstant| % 65)
                                        (QREFELT % 64)))
                        (EXIT
                         (SPADCALL |x0|
                                   (|PADICRC;cfStream|
                                    (SPADCALL |invx|
                                              (SPADCALL |x0| (QREFELT % 24))
                                              (QREFELT % 46))
                                    %)
                                   (QREFELT % 67))))))))) 

(SDEFUN |PADICRC;continuedFraction;%Cf;29|
        ((|x| (%)) (% (|ContinuedFraction| (|Fraction| (|Integer|)))))
        (SPROG ((|x0| (|Fraction| (|Integer|))))
               (SEQ (LETT |x0| (SPADCALL |x| 1 (QREFELT % 64)))
                    (EXIT
                     (SPADCALL |x0|
                               (|PADICRC;cfStream|
                                (SPADCALL |x| (SPADCALL |x0| (QREFELT % 24))
                                          (QREFELT % 46))
                                %)
                               (QREFELT % 71)))))) 

(SDEFUN |PADICRC;termOutput|
        ((|k| (|Integer|)) (|c| (|Integer|)) (% (|OutputForm|)))
        (SPROG ((|mon| (|OutputForm|)))
               (SEQ
                (COND ((EQL |k| 0) (SPADCALL |c| (QREFELT % 10)))
                      (#1='T
                       (SEQ
                        (LETT |mon|
                              (COND ((EQL |k| 1) (QREFELT % 11))
                                    (#1#
                                     (SPADCALL (QREFELT % 11)
                                               (SPADCALL |k| (QREFELT % 10))
                                               (QREFELT % 73)))))
                        (EXIT
                         (COND ((EQL |c| 1) |mon|)
                               ((EQL |c| -1) (SPADCALL |mon| (QREFELT % 74)))
                               (#1#
                                (SPADCALL (SPADCALL |c| (QREFELT % 10)) |mon|
                                          (QREFELT % 75))))))))))) 

(PUT '|PADICRC;showAll?| '|SPADreplace| '(XLAM NIL |$streamsShowAll|)) 

(SDEFUN |PADICRC;showAll?| ((% (|Boolean|))) |$streamsShowAll|) 

(SDEFUN |PADICRC;coerce;%Of;32| ((|x| (%)) (% (|OutputForm|)))
        (SPROG
         ((|l| (|List| (|OutputForm|))) (|uu| (|Stream| (|Integer|)))
          (|uu1| (|Stream| (|Integer|))) (|n| NIL) (#1=#:G362 NIL)
          (|count| (|NonNegativeInteger|)) (|zp| (PADIC)) (|m| (|Integer|)))
         (SEQ (LETT |x| (SPADCALL |$streamCount| |x| (QREFELT % 25)))
              (LETT |m| (|PADICRC;getExpon| |x| %))
              (LETT |zp| (|PADICRC;getZp| |x| %))
              (LETT |uu| (SPADCALL |zp| (QREFELT % 34))) (LETT |l| NIL)
              (EXIT
               (COND
                ((SPADCALL |uu| (QREFELT % 36)) (SPADCALL 0 (QREFELT % 10)))
                (#2='T
                 (SEQ (LETT |count| |$streamCount|)
                      (SEQ (LETT |n| 0) (LETT #1# |count|) G190
                           (COND
                            ((OR (|greater_SI| |n| #1#)
                                 (NULL (NULL (SPADCALL |uu| (QREFELT % 36)))))
                             (GO G191)))
                           (SEQ
                            (COND
                             ((SPADCALL (SPADCALL |uu| (QREFELT % 76)) 0
                                        (QREFELT % 77))
                              (LETT |l|
                                    (CONS
                                     (|PADICRC;termOutput| (+ |n| |m|)
                                      (SPADCALL |uu| (QREFELT % 76)) %)
                                     |l|))))
                            (EXIT (LETT |uu| (SPADCALL |uu| (QREFELT % 78)))))
                           (LETT |n| (|inc_SI| |n|)) (GO G190) G191 (EXIT NIL))
                      (COND
                       ((|PADICRC;showAll?| %)
                        (SEQ (LETT |uu1| |uu|)
                             (EXIT
                              (SEQ (LETT |n| (+ |count| 1)) G190
                                   (COND
                                    ((NULL
                                      (COND
                                       ((SPADCALL |uu| (QREFELT % 79))
                                        (NULL
                                         (SPADCALL |uu1|
                                                   (SPADCALL |uu|
                                                             (QREFELT % 78))
                                                   (QREFELT % 80))))
                                       ('T NIL)))
                                     (GO G191)))
                                   (SEQ
                                    (COND
                                     ((SPADCALL (SPADCALL |uu| (QREFELT % 76))
                                                0 (QREFELT % 77))
                                      (LETT |l|
                                            (CONS
                                             (|PADICRC;termOutput| (+ |n| |m|)
                                              (SPADCALL |uu| (QREFELT % 76)) %)
                                             |l|))))
                                    (COND
                                     ((ODDP |n|)
                                      (LETT |uu1|
                                            (SPADCALL |uu1| (QREFELT % 78)))))
                                    (EXIT
                                     (LETT |uu|
                                           (SPADCALL |uu| (QREFELT % 78)))))
                                   (LETT |n| (+ |n| 1)) (GO G190) G191
                                   (EXIT NIL))))))
                      (LETT |l|
                            (COND ((SPADCALL |uu| (QREFELT % 81)) |l|)
                                  (#2#
                                   (SEQ
                                    (COND
                                     ((SPADCALL |uu|
                                                (SPADCALL |uu| (QREFELT % 78))
                                                (QREFELT % 80))
                                      (COND
                                       ((EQL (SPADCALL |uu| (QREFELT % 76)) 0)
                                        (EXIT |l|)))))
                                    (EXIT
                                     (CONS
                                      (SPADCALL (SPADCALL 'O (QREFELT % 83))
                                                (LIST
                                                 (SPADCALL (QREFELT % 11)
                                                           (SPADCALL
                                                            (+ |n| |m|)
                                                            (QREFELT % 10))
                                                           (QREFELT % 73)))
                                                (QREFELT % 85))
                                      |l|))))))
                      (EXIT
                       (COND ((NULL |l|) (SPADCALL 0 (QREFELT % 87)))
                             (#2#
                              (SPADCALL (ELT % 88) (NREVERSE |l|)
                                        (QREFELT % 91)))))))))))) 

(DECLAIM (NOTINLINE |PAdicRationalConstructor;|)) 

(DEFUN |PAdicRationalConstructor;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G393 NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 |#1|)
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|PAdicRationalConstructor| DV$1 DV$2))
    (LETT % (GETREFV 130))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory| |#2|
                                                       '(|RetractableTo|
                                                         (|Symbol|)))
                                        (|HasCategory| |#2|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#2|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#2|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#2| '(|RealConstant|))
                                        (|HasCategory| |#2|
                                                       '(|OrderedIntegralDomain|))
                                        (|HasCategory| |#2| '(|OrderedSet|))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|OrderedIntegralDomain|))
                                         (|HasCategory| |#2| '(|OrderedSet|)))
                                        (|HasCategory| |#2|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#2| '(|StepThrough|))
                                        (|HasCategory| |#2|
                                                       (LIST '|InnerEvalable|
                                                             '(|Symbol|)
                                                             (|devaluate|
                                                              |#2|)))
                                        (|HasCategory| |#2|
                                                       (LIST '|Evalable|
                                                             (|devaluate|
                                                              |#2|)))
                                        (|HasCategory| |#2|
                                                       (LIST '|Eltable|
                                                             (|devaluate| |#2|)
                                                             (|devaluate|
                                                              |#2|)))
                                        (|HasCategory| |#2|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (|HasCategory| |#2|
                                                       '(|DifferentialRing|))
                                        (|HasCategory| |#2|
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (|HasCategory| |#2|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Float|))))
                                        (|HasCategory| |#2|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Integer|))))
                                        (|HasCategory| |#2|
                                                       '(|PatternMatchable|
                                                         (|Float|)))
                                        (|HasCategory| |#2|
                                                       '(|PatternMatchable|
                                                         (|Integer|)))
                                        (|HasCategory| |#2|
                                                       '(|EuclideanDomain|))
                                        (|HasCategory| |#2|
                                                       '(|IntegerNumberSystem|))
                                        (LETT #1#
                                              (|HasCategory| |#2|
                                                             '(|Comparable|)))
                                        (OR #1#
                                            (|HasCategory| |#2|
                                                           '(|OrderedIntegralDomain|))
                                            (|HasCategory| |#2|
                                                           '(|OrderedSet|)))))))
    (|haddProp| |$ConstructorCache| '|PAdicRationalConstructor|
                (LIST DV$1 DV$2) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND (|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
         (|HasCategory| % '(|CharacteristicNonZero|))
         (|augmentPredVector| % 33554432))
    (AND
     (OR (|HasCategory| |#2| '(|CharacteristicNonZero|))
         (AND (|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
              (|HasCategory| % '(|CharacteristicNonZero|))))
     (|augmentPredVector| % 67108864))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 11 (SPADCALL |#1| (QREFELT % 10)))
    (QSETREFV % 12 (|Record| (|:| |expon| (|Integer|)) (|:| |pint| |#2|)))
    %))) 

(DEFUN |PAdicRationalConstructor| (&REST #1=#:G394)
  (SPROG NIL
         (PROG (#2=#:G395)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(NIL T))
                                               (HGET |$ConstructorCache|
                                                     '|PAdicRationalConstructor|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PAdicRationalConstructor;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|PAdicRationalConstructor|)))))))))) 

(MAKEPROP '|PAdicRationalConstructor| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|OutputForm|) (|Integer|) (0 . |coerce|) 'PEXPR '|Rep|
              (5 . |Zero|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |PADICRC;Zero;%;4|) %))
              (9 . |One|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |PADICRC;One;%;5|) %))
              (13 . |coerce|) |PADICRC;coerce;PADIC%;8| |PADICRC;coerce;I%;6|
              (|Fraction| 9) (18 . |numer|) (23 . |denom|) |PADICRC;/;3%;24|
              |PADICRC;coerce;F%;7| |PADICRC;removeZeroes;I2%;14| (28 . *)
              (|Union| 7 '"failed") |PADICRC;retractIfCan;%U;9|
              |PADICRC;numer;%PADIC;10| |PADICRC;denom;%PADIC;11|
              (34 . |quotientByP|) |PADICRC;wholePart;%PADIC;12| (|Stream| 9)
              (39 . |digits|) (|Boolean|) (44 . |empty?|) (49 . |moduloP|)
              |PADICRC;removeZeroes;2%;13| (54 . =) |PADICRC;=;2%B;15| (60 . +)
              |PADICRC;+;3%;16| (66 . -) |PADICRC;-;2%;17| (71 . -)
              |PADICRC;-;3%;18| |PADICRC;*;I2%;19| (77 . *) |PADICRC;*;3%;20|
              (|PositiveInteger|) (|RepeatedSquaring| $$) (83 . |expt|)
              |PADICRC;inv;2%;23| |PADICRC;^;%I%;21| (|Union| % '"failed")
              (89 . |recip|) |PADICRC;recip;%U;22| |PADICRC;/;2PADIC%;25|
              |PADICRC;*;PADIC2%;26| (94 . |coerce|) (99 . ^)
              (105 . |approximate|) (111 . *) |PADICRC;approximate;%IF;27|
              (117 . |One|) (|Stream| 20) (121 . |concat|) (|Mapping| %)
              (127 . |delay|) (|ContinuedFraction| 20)
              (132 . |reducedContinuedFraction|)
              |PADICRC;continuedFraction;%Cf;29| (138 . ^) (144 . -) (149 . *)
              (155 . |frst|) (160 . ~=) (166 . |rst|)
              (171 . |explicitEntries?|) (176 . |eq?|)
              (182 . |explicitlyEmpty?|) (|Symbol|) (187 . |coerce|) (|List| %)
              (192 . |prefix|) (|NonNegativeInteger|) (198 . |coerce|)
              (203 . +) (|Mapping| 8 8 8) (|List| 8) (209 . |reduce|)
              |PADICRC;coerce;%Of;32| (|String|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|SparseUnivariatePolynomial| %) (|Union| 84 '"failed")
              (|Record| (|:| |coef| 84) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 100 '"failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Factored| %) (|Mapping| 7 7)
              (|Record| (|:| |mat| 108) (|:| |vec| (|Vector| 7))) (|Matrix| %)
              (|Vector| %) (|Matrix| 7) (|Union| 107 '#1="failed")
              (|InputForm|) (|Pattern| 125) (|Pattern| 9) (|List| 7)
              (|Equation| 7) (|List| 114) (|List| 82) (|Matrix| 9)
              (|Record| (|:| |mat| 117) (|:| |vec| (|Vector| 9))) (|List| 86)
              (|PatternMatchResult| 125 %) (|PatternMatchResult| 9 %)
              (|Union| 123 '#1#) (|List| 96) (|Factored| 96) (|Float|)
              (|DoubleFloat|) (|Union| 20 '#2="failed") (|Union| 9 '#2#)
              (|Union| 82 '#2#))
           '#(~= 215 |zero?| 221 |wholePart| 226 |unitNormal| 231
              |unitCanonical| 236 |unit?| 241 |subtractIfCan| 246
              |squareFreePolynomial| 252 |squareFreePart| 257 |squareFree| 262
              |solveLinearPolynomialEquation| 267 |smaller?| 273 |sizeLess?|
              279 |sign| 285 |sample| 290 |rightRecip| 294 |rightPower| 299
              |retractIfCan| 311 |retract| 331 |removeZeroes| 351 |rem| 362
              |reducedSystem| 368 |recip| 390 |quo| 395 |principalIdeal| 401
              |prime?| 406 |positive?| 411 |plenaryPower| 416 |patternMatch|
              422 |opposite?| 436 |one?| 442 |numerator| 447 |numer| 452
              |nextItem| 457 |negative?| 462 |multiEuclidean| 467 |min| 473
              |max| 479 |map| 485 |leftRecip| 491 |leftPower| 496 |lcmCoef| 508
              |lcm| 514 |latex| 525 |inv| 530 |init| 535 |gcdPolynomial| 539
              |gcd| 545 |fractionPart| 556 |floor| 561
              |factorSquareFreePolynomial| 566 |factorPolynomial| 571 |factor|
              576 |extendedEuclidean| 581 |exquo| 594 |expressIdealMember| 600
              |eval| 606 |euclideanSize| 646 |elt| 651 |divide| 657
              |differentiate| 663 |denominator| 713 |denom| 718 |convert| 723
              |continuedFraction| 748 |conditionP| 753 |commutator| 758
              |coerce| 764 |charthRoot| 794 |characteristic| 799 |ceiling| 803
              |associator| 808 |associates?| 815 |approximate| 821
              |antiCommutator| 827 |annihilate?| 833 |abs| 839 ^ 844 |Zero| 862
              |One| 866 D 870 >= 920 > 926 = 932 <= 938 < 944 / 950 - 962 + 973
              * 979)
           'NIL
           (CONS
            (|makeByteWordVec2| 25
                                '(0 0 1 0 0 0 7 0 0 7 0 0 0 0 16 15 4 3 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 17 7 0 0 0 0 0 17 7 0 0
                                  0 0 0 0 0 7 0 7 0 0 0 9 0 0 0 0 0 21 20 11 25
                                  0 0 0 13 10 10 6 2 0 0 0 0 19 18 14 13 12 10
                                  10 8 6 6 5 2 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|QuotientFieldCategory&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL NIL |GcdDomain&| NIL
                |OrderedRing&| NIL NIL |DivisionRing&| |DifferentialExtension&|
                |DifferentialRing&| |PartialDifferentialRing&| NIL NIL
                |Algebra&| |EntireRing&| |Algebra&| |Algebra&| NIL NIL |Rng&|
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| NIL |Module&| |Module&| |Module&|
                |FullyLinearlyExplicitOver&| NIL NIL |NonAssociativeRing&| NIL
                NIL NIL NIL NIL NIL NIL |NonAssociativeRng&| NIL NIL NIL NIL
                NIL NIL |AbelianGroup&| NIL NIL NIL NIL |OrderedSet&|
                |AbelianMonoid&| |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL
                NIL NIL NIL NIL NIL |AbelianSemiGroup&| |Magma&|
                |FullyEvalableOver&| |Evalable&| |RetractableTo&|
                |RetractableTo&| NIL |RetractableTo&| |SetCategory&| NIL
                |RetractableTo&| NIL NIL NIL NIL |InnerEvalable&|
                |InnerEvalable&| NIL NIL |PartialOrder&| NIL NIL NIL NIL NIL
                |BasicType&| NIL NIL NIL NIL NIL NIL NIL)
             (CONS
              '#((|QuotientFieldCategory| 7) (|Field|)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|OrderedIntegralDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|OrderedRing|) (|LeftOreRing|) (|CommutativeRing|)
                 (|DivisionRing|) (|DifferentialExtension| 7)
                 (|DifferentialRing|) (|PartialDifferentialRing| 82)
                 (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|Algebra| $$) (|EntireRing|) (|Algebra| 20) (|Algebra| 7)
                 (|Ring|) (|SemiRing|) (|Rng|) (|NonAssociativeAlgebra| $$)
                 (|NonAssociativeAlgebra| 20) (|NonAssociativeAlgebra| 7)
                 (|SemiRng|) (|Module| $$) (|Module| 20) (|Module| 7)
                 (|FullyLinearlyExplicitOver| 7) (|LinearlyExplicitOver| 9)
                 (|OrderedAbelianGroup|) (|NonAssociativeRing|)
                 (|BiModule| $$ $$) (|BiModule| 20 20) (|BiModule| 7 7)
                 (|LinearlyExplicitOver| 7) (|RightModule| 9)
                 (|OrderedCancellationAbelianMonoid|) (|RightModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| $$) (|LeftModule| 20)
                 (|RightModule| 20) (|LeftModule| 7) (|RightModule| 7)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|) (|OrderedSet|)
                 (|AbelianMonoid|) (|NonAssociativeSemiRng|) (|MagmaWithUnit|)
                 (|SemiGroup|) (|FullyPatternMatchable| 7)
                 (|PatternMatchable| 9) (|PatternMatchable| 125)
                 (|StepThrough|) (|Comparable|) (|AbelianSemiGroup|) (|Magma|)
                 (|FullyEvalableOver| 7) (|Evalable| 7) (|RetractableTo| 9)
                 (|RetractableTo| 20) (|RealConstant|) (|RetractableTo| 82)
                 (|SetCategory|) (|CommutativeStar|) (|RetractableTo| 7)
                 (|Patternable| 7) (|ConvertibleTo| 112) (|ConvertibleTo| 111)
                 (|Eltable| 7 $$) (|InnerEvalable| 7 7) (|InnerEvalable| 82 7)
                 (|CoercibleFrom| 9) (|CoercibleFrom| 20) (|PartialOrder|)
                 (|ConvertibleTo| 125) (|ConvertibleTo| 126)
                 (|ConvertibleTo| 110) (|CoercibleFrom| 82) (|CoercibleTo| 8)
                 (|BasicType|) (|unitsKnown|) (|TwoSidedRecip|)
                 (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|CoercibleFrom| 7) (|Type|))
              (|makeByteWordVec2| 129
                                  '(1 9 8 0 10 0 7 0 13 0 7 0 15 1 7 0 9 17 1
                                    20 9 0 21 1 20 9 0 22 2 7 0 9 0 26 1 7 0 0
                                    31 1 7 33 0 34 1 33 35 0 36 1 7 9 0 37 2 7
                                    35 0 0 39 2 7 0 0 0 41 1 7 0 0 43 2 7 0 0 0
                                    45 2 7 0 0 0 48 2 51 2 2 50 52 1 7 55 0 56
                                    1 20 0 9 60 2 20 0 0 9 61 2 7 9 0 9 62 2 20
                                    0 0 9 63 0 9 0 65 2 66 0 20 0 67 1 66 0 68
                                    69 2 70 0 20 66 71 2 8 0 0 0 73 1 8 0 0 74
                                    2 8 0 0 0 75 1 33 9 0 76 2 9 35 0 0 77 1 33
                                    0 0 78 1 33 35 0 79 2 33 35 0 0 80 1 33 35
                                    0 81 1 82 8 0 83 2 8 0 0 84 85 1 86 8 0 87
                                    2 8 0 0 0 88 2 90 8 89 0 91 2 0 35 0 0 1 1
                                    0 35 0 1 1 22 7 0 32 1 0 94 0 1 1 0 0 0 1 1
                                    0 35 0 1 2 0 55 0 0 1 1 1 124 96 1 1 0 0 0
                                    1 1 0 103 0 1 2 1 122 123 96 1 2 24 35 0 0
                                    1 2 0 35 0 0 1 1 7 9 0 1 0 0 0 1 1 0 55 0 1
                                    2 0 0 0 50 1 2 0 0 0 86 1 1 0 27 0 28 1 10
                                    127 0 1 1 10 128 0 1 1 2 129 0 1 1 0 7 0 1
                                    1 10 20 0 1 1 10 9 0 1 1 2 82 0 1 2 0 0 9 0
                                    25 1 0 0 0 38 2 0 0 0 0 1 2 0 105 106 107 1
                                    1 0 108 106 1 1 17 117 106 1 2 17 118 106
                                    107 1 1 0 55 0 57 2 0 0 0 0 1 1 0 98 84 1 1
                                    0 35 0 1 1 7 35 0 1 2 0 0 0 50 1 3 20 120 0
                                    111 120 1 3 21 121 0 112 121 1 2 0 35 0 0 1
                                    1 0 35 0 1 1 0 0 0 1 1 0 7 0 29 1 11 55 0 1
                                    1 7 35 0 1 2 0 97 84 0 1 2 8 0 0 0 1 2 8 0
                                    0 0 1 2 0 0 104 0 1 1 0 55 0 1 2 0 0 0 50 1
                                    2 0 0 0 86 1 2 0 95 0 0 1 2 0 0 0 0 1 1 0 0
                                    84 1 1 0 93 0 1 1 0 0 0 53 0 11 0 1 2 0 96
                                    96 96 1 2 0 0 0 0 1 1 0 0 84 1 1 22 0 0 1 1
                                    23 7 0 1 1 1 124 96 1 1 1 124 96 1 1 0 103
                                    0 1 3 0 101 0 0 0 1 2 0 102 0 0 1 2 0 55 0
                                    0 1 2 0 97 84 0 1 3 13 0 0 113 113 1 2 13 0
                                    0 114 1 3 13 0 0 7 7 1 2 13 0 0 115 1 3 12
                                    0 0 82 7 1 3 12 0 0 116 113 1 1 0 86 0 1 2
                                    14 0 0 7 1 2 0 99 0 0 1 3 0 0 0 104 86 1 2
                                    0 0 0 104 1 1 16 0 0 1 2 16 0 0 86 1 2 15 0
                                    0 116 1 2 15 0 0 82 1 3 15 0 0 82 86 1 3 15
                                    0 0 116 119 1 1 0 0 0 1 1 0 7 0 30 1 5 110
                                    0 1 1 18 111 0 1 1 19 112 0 1 1 6 125 0 1 1
                                    6 126 0 1 1 0 70 0 72 1 26 109 106 1 2 0 0
                                    0 0 1 1 0 8 0 92 1 0 0 9 19 1 0 0 0 1 1 0 0
                                    20 24 1 0 0 7 18 1 2 0 82 1 1 27 55 0 1 0 0
                                    86 1 1 23 7 0 1 3 0 0 0 0 0 1 2 0 35 0 0 1
                                    2 0 20 0 9 64 2 0 0 0 0 1 2 0 35 0 0 1 1 7
                                    0 0 1 2 0 0 0 50 1 2 0 0 0 86 1 2 0 0 0 9
                                    54 0 0 0 14 0 0 0 16 3 0 0 0 104 86 1 2 0 0
                                    0 104 1 1 16 0 0 1 2 16 0 0 86 1 2 15 0 0
                                    82 1 3 15 0 0 82 86 1 2 15 0 0 116 1 3 15 0
                                    0 116 119 1 2 8 35 0 0 1 2 8 35 0 0 1 2 0
                                    35 0 0 40 2 8 35 0 0 1 2 8 35 0 0 1 2 0 0 0
                                    0 23 2 0 0 7 7 58 2 0 0 0 0 46 1 0 0 0 44 2
                                    0 0 0 0 42 2 0 0 50 0 1 2 0 0 0 0 49 2 0 0
                                    9 0 47 2 0 0 86 0 1 2 0 0 0 20 1 2 0 0 20 0
                                    1 2 0 0 7 0 59 2 0 0 0 7 1 2 17 0 0 9
                                    1)))))
           '|lookupComplete|)) 
