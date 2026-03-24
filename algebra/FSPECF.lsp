
(SDEFUN |FSPECF;abs;2F;1| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 13) |x| (QREFELT % 60))) 

(SDEFUN |FSPECF;sign;2F;2| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 14) |x| (QREFELT % 60))) 

(SDEFUN |FSPECF;unitStep;2F;3| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 15) |x| (QREFELT % 60))) 

(SDEFUN |FSPECF;ceiling;2F;4| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 16) |x| (QREFELT % 60))) 

(SDEFUN |FSPECF;floor;2F;5| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 17) |x| (QREFELT % 60))) 

(SDEFUN |FSPECF;fractionPart;2F;6| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 18) |x| (QREFELT % 60))) 

(SDEFUN |FSPECF;diracDelta;2F;7| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 19) |x| (QREFELT % 60))) 

(SDEFUN |FSPECF;conjugate;2F;8| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 20) |x| (QREFELT % 60))) 

(SDEFUN |FSPECF;Gamma;2F;9| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 21) |x| (QREFELT % 60))) 

(SDEFUN |FSPECF;Gamma;3F;10| ((|a| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 22) |a| |x| (QREFELT % 70))) 

(SDEFUN |FSPECF;Beta;3F;11| ((|x| (F)) (|y| (F)) (% (F)))
        (SPADCALL (QREFELT % 23) |x| |y| (QREFELT % 70))) 

(SDEFUN |FSPECF;Beta;4F;12| ((|x| (F)) (|a| (F)) (|b| (F)) (% (F)))
        (SPADCALL (QREFELT % 24) |x| |a| |b| (QREFELT % 73))) 

(SDEFUN |FSPECF;digamma;2F;13| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 25) |x| (QREFELT % 60))) 

(SDEFUN |FSPECF;polygamma;3F;14| ((|k| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 26) |k| |x| (QREFELT % 70))) 

(SDEFUN |FSPECF;besselJ;3F;15| ((|a| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 27) |a| |x| (QREFELT % 70))) 

(SDEFUN |FSPECF;besselY;3F;16| ((|a| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 28) |a| |x| (QREFELT % 70))) 

(SDEFUN |FSPECF;besselI;3F;17| ((|a| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 29) |a| |x| (QREFELT % 70))) 

(SDEFUN |FSPECF;besselK;3F;18| ((|a| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 30) |a| |x| (QREFELT % 70))) 

(SDEFUN |FSPECF;airyAi;2F;19| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 31) |x| (QREFELT % 60))) 

(SDEFUN |FSPECF;airyAiPrime;2F;20| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 32) |x| (QREFELT % 60))) 

(SDEFUN |FSPECF;airyBi;2F;21| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 33) |x| (QREFELT % 60))) 

(SDEFUN |FSPECF;airyBiPrime;2F;22| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 34) |x| (QREFELT % 60))) 

(SDEFUN |FSPECF;lambertW;2F;23| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 35) |x| (QREFELT % 60))) 

(SDEFUN |FSPECF;polylog;3F;24| ((|s| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 36) |s| |x| (QREFELT % 70))) 

(SDEFUN |FSPECF;weierstrassP;4F;25| ((|g2| (F)) (|g3| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 37) |g2| |g3| |x| (QREFELT % 73))) 

(SDEFUN |FSPECF;weierstrassPPrime;4F;26|
        ((|g2| (F)) (|g3| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 38) |g2| |g3| |x| (QREFELT % 73))) 

(SDEFUN |FSPECF;weierstrassSigma;4F;27|
        ((|g2| (F)) (|g3| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 39) |g2| |g3| |x| (QREFELT % 73))) 

(SDEFUN |FSPECF;weierstrassZeta;4F;28|
        ((|g2| (F)) (|g3| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 40) |g2| |g3| |x| (QREFELT % 73))) 

(SDEFUN |FSPECF;hypergeometricF;2L2F;29|
        ((|a| (|List| F)) (|b| (|List| F)) (|z| (F)) (% (F)))
        (SPROG
         ((|q| (F)) (|p| (F)) (|nbi| #1=(|NonNegativeInteger|)) (|nai| #1#))
         (SEQ (LETT |nai| (LENGTH |a|)) (LETT |nbi| (LENGTH |b|))
              (COND
               ((SPADCALL |z| (|spadConstant| % 92) (QREFELT % 94))
                (COND ((<= |nai| (+ |nbi| 1)) (EXIT (|spadConstant| % 96))))))
              (LETT |p| (SPADCALL (LENGTH |a|) (QREFELT % 98)))
              (LETT |q| (SPADCALL (LENGTH |b|) (QREFELT % 98)))
              (EXIT
               (SPADCALL (QREFELT % 41)
                         (SPADCALL
                          (SPADCALL |a|
                                    (SPADCALL |b| (LIST |z|) (QREFELT % 100))
                                    (QREFELT % 100))
                          (LIST |p| |q|) (QREFELT % 100))
                         (QREFELT % 102)))))) 

(SDEFUN |FSPECF;meijerG;4L2F;30|
        ((|a| (|List| F)) (|b| (|List| F)) (|c| (|List| F)) (|d| (|List| F))
         (|z| (F)) (% (F)))
        (SPROG ((|m2| (F)) (|m1| (F)) (|n2| (F)) (|n1| (F)))
               (SEQ (LETT |n1| (SPADCALL (LENGTH |a|) (QREFELT % 98)))
                    (LETT |n2| (SPADCALL (LENGTH |b|) (QREFELT % 98)))
                    (LETT |m1| (SPADCALL (LENGTH |c|) (QREFELT % 98)))
                    (LETT |m2| (SPADCALL (LENGTH |d|) (QREFELT % 98)))
                    (EXIT
                     (SPADCALL (QREFELT % 42)
                               (SPADCALL
                                (SPADCALL |a|
                                          (SPADCALL |b|
                                                    (SPADCALL |c|
                                                              (SPADCALL |d|
                                                                        (LIST
                                                                         |z|)
                                                                        (QREFELT
                                                                         %
                                                                         100))
                                                              (QREFELT % 100))
                                                    (QREFELT % 100))
                                          (QREFELT % 100))
                                (LIST |n1| |n2| |m1| |m2|) (QREFELT % 100))
                               (QREFELT % 102)))))) 

(SDEFUN |FSPECF;grad2|
        ((|l| (|List| F)) (|t| (|Symbol|)) (|op| (|BasicOperator|))
         (|d2| (|Mapping| F F F)) (% (F)))
        (SPROG ((|dm| (F)) (|x2| (F)) (|x1| (F)))
               (SEQ (LETT |x1| (SPADCALL |l| 1 (QREFELT % 117)))
                    (LETT |x2| (SPADCALL |l| 2 (QREFELT % 117)))
                    (LETT |dm|
                          (SPADCALL (SPADCALL (QREFELT % 118))
                                    (QREFELT % 119)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |x1| |t| (QREFELT % 120))
                                (SPADCALL (QREFELT % 106)
                                          (LIST
                                           (SPADCALL |op| (LIST |dm| |x2|)
                                                     (QREFELT % 102))
                                           |dm| |x1|)
                                          (QREFELT % 121))
                                (QREFELT % 122))
                      (SPADCALL (SPADCALL |x2| |t| (QREFELT % 120))
                                (SPADCALL |x1| |x2| |d2|) (QREFELT % 122))
                      (QREFELT % 123)))))) 

(SDEFUN |FSPECF;grad3|
        ((|l| (|List| F)) (|t| (|Symbol|)) (|op| (|BasicOperator|))
         (|d3| (|Mapping| F F F F)) (% (F)))
        (SPROG ((|dm2| (F)) (|dm1| (F)) (|x3| (F)) (|x2| (F)) (|x1| (F)))
               (SEQ (LETT |x1| (SPADCALL |l| 1 (QREFELT % 117)))
                    (LETT |x2| (SPADCALL |l| 2 (QREFELT % 117)))
                    (LETT |x3| (SPADCALL |l| 3 (QREFELT % 117)))
                    (LETT |dm1|
                          (SPADCALL (SPADCALL (QREFELT % 118))
                                    (QREFELT % 119)))
                    (LETT |dm2|
                          (SPADCALL (SPADCALL (QREFELT % 118))
                                    (QREFELT % 119)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL |x1| |t| (QREFELT % 120))
                                 (SPADCALL (QREFELT % 106)
                                           (LIST
                                            (SPADCALL |op|
                                                      (LIST |dm1| |x2| |x3|)
                                                      (QREFELT % 102))
                                            |dm1| |x1|)
                                           (QREFELT % 121))
                                 (QREFELT % 122))
                       (SPADCALL (SPADCALL |x2| |t| (QREFELT % 120))
                                 (SPADCALL (QREFELT % 106)
                                           (LIST
                                            (SPADCALL |op|
                                                      (LIST |x1| |dm2| |x3|)
                                                      (QREFELT % 102))
                                            |dm2| |x2|)
                                           (QREFELT % 121))
                                 (QREFELT % 122))
                       (QREFELT % 123))
                      (SPADCALL (SPADCALL |x3| |t| (QREFELT % 120))
                                (SPADCALL |x1| |x2| |x3| |d3|) (QREFELT % 122))
                      (QREFELT % 123)))))) 

(SDEFUN |FSPECF;grad4|
        ((|l| (|List| F)) (|t| (|Symbol|)) (|op| (|BasicOperator|))
         (|d4| (|Mapping| F F F F F)) (% (F)))
        (SPROG
         ((|kd3| (F)) (|kd2| (F)) (|kd1| (F)) (|dm3| (F)) (|dm2| (F))
          (|dm1| (F)) (|x4| (F)) (|x3| (F)) (|x2| (F)) (|x1| (F)))
         (SEQ (LETT |x1| (SPADCALL |l| 1 (QREFELT % 117)))
              (LETT |x2| (SPADCALL |l| 2 (QREFELT % 117)))
              (LETT |x3| (SPADCALL |l| 3 (QREFELT % 117)))
              (LETT |x4| (SPADCALL |l| 4 (QREFELT % 117)))
              (LETT |dm1|
                    (SPADCALL (SPADCALL (QREFELT % 118)) (QREFELT % 119)))
              (LETT |dm2|
                    (SPADCALL (SPADCALL (QREFELT % 118)) (QREFELT % 119)))
              (LETT |dm3|
                    (SPADCALL (SPADCALL (QREFELT % 118)) (QREFELT % 119)))
              (LETT |kd1|
                    (SPADCALL (QREFELT % 106)
                              (LIST
                               (SPADCALL |op| (LIST |dm1| |x2| |x3| |x4|)
                                         (QREFELT % 102))
                               |dm1| |x1|)
                              (QREFELT % 121)))
              (LETT |kd2|
                    (SPADCALL (QREFELT % 106)
                              (LIST
                               (SPADCALL |op| (LIST |x1| |dm2| |x3| |x4|)
                                         (QREFELT % 102))
                               |dm2| |x2|)
                              (QREFELT % 121)))
              (LETT |kd3|
                    (SPADCALL (QREFELT % 106)
                              (LIST
                               (SPADCALL |op| (LIST |x1| |x2| |dm3| |x4|)
                                         (QREFELT % 102))
                               |dm3| |x3|)
                              (QREFELT % 121)))
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |x1| |t| (QREFELT % 120)) |kd1|
                            (QREFELT % 122))
                  (SPADCALL (SPADCALL |x2| |t| (QREFELT % 120)) |kd2|
                            (QREFELT % 122))
                  (QREFELT % 123))
                 (SPADCALL (SPADCALL |x3| |t| (QREFELT % 120)) |kd3|
                           (QREFELT % 122))
                 (QREFELT % 123))
                (SPADCALL (SPADCALL |x4| |t| (QREFELT % 120))
                          (SPADCALL |x1| |x2| |x3| |x4| |d4|) (QREFELT % 122))
                (QREFELT % 123)))))) 

(SDEFUN |FSPECF;weierstrassPInverse;4F;34|
        ((|g2| (F)) (|g3| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 124) |g2| |g3| |z| (QREFELT % 73))) 

(SDEFUN |FSPECF;eWeierstrassPInverse| ((|g2| (F)) (|g3| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 124) (LIST |g2| |g3| |z|) (QREFELT % 121))) 

(SDEFUN |FSPECF;elWeierstrassPInverse| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eWeierstrassPInverse| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) (SPADCALL |l| 3 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;eWeierstrassPInverseGrad_g2| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|s2| (F)) (|s1| (F)) (|delta| (F)) (|wpi| (F)) (|z| (F)) (|g3| (F))
          (|g2| (F)))
         (SEQ (LETT |g2| (SPADCALL |l| 1 (QREFELT % 117)))
              (LETT |g3| (SPADCALL |l| 2 (QREFELT % 117)))
              (LETT |z| (SPADCALL |l| 3 (QREFELT % 117)))
              (LETT |wpi| (SPADCALL |g2| |g3| |z| (QREFELT % 125)))
              (LETT |delta|
                    (SPADCALL (SPADCALL |g2| 3 (QREFELT % 129))
                              (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT % 129))
                                        (QREFELT % 114))
                              (QREFELT % 130)))
              (LETT |s1|
                    (SPADCALL
                     (SPADCALL (SPADCALL 18 |g3| (QREFELT % 114))
                               (SPADCALL |g2| |g3| |wpi| (QREFELT % 90))
                               (QREFELT % 122))
                     (SPADCALL (SPADCALL |g2| 2 (QREFELT % 129)) |wpi|
                               (QREFELT % 122))
                     (QREFELT % 130)))
              (LETT |s2|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL 36 |g3| (QREFELT % 114))
                                (SPADCALL |z| 2 (QREFELT % 129))
                                (QREFELT % 122))
                      (SPADCALL
                       (SPADCALL 2 (SPADCALL |g2| 2 (QREFELT % 129))
                                 (QREFELT % 114))
                       |z| (QREFELT % 122))
                      (QREFELT % 130))
                     (SPADCALL (SPADCALL 6 |g2| (QREFELT % 114)) |g3|
                               (QREFELT % 122))
                     (QREFELT % 130)))
              (EXIT
               (SPADCALL
                (SPADCALL |s1|
                          (SPADCALL |s2|
                                    (SPADCALL |g2| |g3| |wpi| (QREFELT % 88))
                                    (QREFELT % 131))
                          (QREFELT % 123))
                (SPADCALL 4 |delta| (QREFELT % 114)) (QREFELT % 131)))))) 

(SDEFUN |FSPECF;eWeierstrassPInverseGrad_g3| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|s2| (F)) (|s1| (F)) (|delta| (F)) (|wpi| (F)) (|z| (F)) (|g3| (F))
          (|g2| (F)))
         (SEQ (LETT |g2| (SPADCALL |l| 1 (QREFELT % 117)))
              (LETT |g3| (SPADCALL |l| 2 (QREFELT % 117)))
              (LETT |z| (SPADCALL |l| 3 (QREFELT % 117)))
              (LETT |wpi| (SPADCALL |g2| |g3| |z| (QREFELT % 125)))
              (LETT |delta|
                    (SPADCALL (SPADCALL |g2| 3 (QREFELT % 129))
                              (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT % 129))
                                        (QREFELT % 114))
                              (QREFELT % 130)))
              (LETT |s1|
                    (SPADCALL
                     (SPADCALL (SPADCALL 9 |g3| (QREFELT % 114)) |wpi|
                               (QREFELT % 122))
                     (SPADCALL (SPADCALL 6 |g2| (QREFELT % 114))
                               (SPADCALL |g2| |g3| |wpi| (QREFELT % 90))
                               (QREFELT % 122))
                     (QREFELT % 130)))
              (LETT |s2|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL 12 |g2| (QREFELT % 114))
                                 (SPADCALL |z| 2 (QREFELT % 129))
                                 (QREFELT % 122))
                       (QREFELT % 132))
                      (SPADCALL (SPADCALL 18 |g3| (QREFELT % 114)) |z|
                                (QREFELT % 122))
                      (QREFELT % 123))
                     (SPADCALL 2 (SPADCALL |g2| 2 (QREFELT % 129))
                               (QREFELT % 114))
                     (QREFELT % 123)))
              (EXIT
               (SPADCALL
                (SPADCALL |s1|
                          (SPADCALL |s2|
                                    (SPADCALL |g2| |g3| |wpi| (QREFELT % 88))
                                    (QREFELT % 131))
                          (QREFELT % 123))
                (SPADCALL 2 |delta| (QREFELT % 114)) (QREFELT % 131)))))) 

(SDEFUN |FSPECF;eWeierstrassPInverseGrad_z| ((|l| (|List| F)) (% (F)))
        (SPROG ((|z| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ (LETT |g2| (SPADCALL |l| 1 (QREFELT % 117)))
                    (LETT |g3| (SPADCALL |l| 2 (QREFELT % 117)))
                    (LETT |z| (SPADCALL |l| 3 (QREFELT % 117)))
                    (EXIT
                     (SPADCALL (|spadConstant| % 96)
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL 4 (SPADCALL |z| 3 (QREFELT % 129))
                                            (QREFELT % 114))
                                  (SPADCALL |g2| |z| (QREFELT % 122))
                                  (QREFELT % 130))
                                 |g3| (QREFELT % 130))
                                (QREFELT % 135))
                               (QREFELT % 131)))))) 

(SDEFUN |FSPECF;whittakerM;4F;40| ((|k| (F)) (|m| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 138) |k| |m| |z| (QREFELT % 73))) 

(SDEFUN |FSPECF;eWhittakerM| ((|k| (F)) (|m| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 138) (LIST |k| |m| |z|) (QREFELT % 121))) 

(SDEFUN |FSPECF;elWhittakerM| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eWhittakerM| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) (SPADCALL |l| 3 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;eWhittakerMGrad_z| ((|k| (F)) (|m| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT % 109) (SPADCALL |k| |z| (QREFELT % 131))
                    (QREFELT % 130))
          (SPADCALL |k| |m| |z| (QREFELT % 139)) (QREFELT % 122))
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL (QREFELT % 109) |k| (QREFELT % 123)) |m|
                     (QREFELT % 123))
           (SPADCALL (SPADCALL |k| (|spadConstant| % 96) (QREFELT % 123)) |m|
                     |z| (QREFELT % 139))
           (QREFELT % 122))
          |z| (QREFELT % 131))
         (QREFELT % 123))) 

(SDEFUN |FSPECF;dWhittakerM| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad3| |l| |t| (QREFELT % 138)
         (CONS (|function| |FSPECF;eWhittakerMGrad_z|) %) %)) 

(SDEFUN |FSPECF;whittakerW;4F;45| ((|k| (F)) (|m| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 142) |k| |m| |z| (QREFELT % 73))) 

(SDEFUN |FSPECF;eWhittakerW| ((|k| (F)) (|m| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 142) (LIST |k| |m| |z|) (QREFELT % 121))) 

(SDEFUN |FSPECF;elWhittakerW| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eWhittakerW| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) (SPADCALL |l| 3 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;eWhittakerWGrad_z| ((|k| (F)) (|m| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT % 109) (SPADCALL |k| |z| (QREFELT % 131))
                    (QREFELT % 130))
          (SPADCALL |k| |m| |z| (QREFELT % 143)) (QREFELT % 122))
         (SPADCALL
          (SPADCALL (SPADCALL |k| (|spadConstant| % 96) (QREFELT % 123)) |m|
                    |z| (QREFELT % 143))
          |z| (QREFELT % 131))
         (QREFELT % 130))) 

(SDEFUN |FSPECF;dWhittakerW| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad3| |l| |t| (QREFELT % 142)
         (CONS (|function| |FSPECF;eWhittakerWGrad_z|) %) %)) 

(SDEFUN |FSPECF;angerJ;3F;50| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 144) |v| |z| (QREFELT % 70))) 

(SDEFUN |FSPECF;eAngerJ| ((|v| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |z| (|spadConstant| % 92) (QREFELT % 94))
          (SPADCALL
           (SPADCALL (SPADCALL |v| (SPADCALL (QREFELT % 146)) (QREFELT % 122))
                     (QREFELT % 147))
           (SPADCALL |v| (SPADCALL (QREFELT % 146)) (QREFELT % 122))
           (QREFELT % 131)))
         ('T (SPADCALL (QREFELT % 144) (LIST |v| |z|) (QREFELT % 121))))) 

(SDEFUN |FSPECF;elAngerJ| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eAngerJ| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;eAngerJGrad_z| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| % 96) (QREFELT % 123)) |z|
                     (QREFELT % 145))
           (QREFELT % 132))
          (SPADCALL
           (SPADCALL |v| (SPADCALL |v| |z| (QREFELT % 145)) (QREFELT % 122))
           |z| (QREFELT % 131))
          (QREFELT % 123))
         (SPADCALL
          (SPADCALL (SPADCALL |v| (SPADCALL (QREFELT % 146)) (QREFELT % 122))
                    (QREFELT % 147))
          (SPADCALL (SPADCALL (QREFELT % 146)) |z| (QREFELT % 122))
          (QREFELT % 131))
         (QREFELT % 130))) 

(SDEFUN |FSPECF;dAngerJ| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 144)
         (CONS (|function| |FSPECF;eAngerJGrad_z|) %) %)) 

(SDEFUN |FSPECF;eeAngerJ| ((|l| (|List| F)) (% (F)))
        (SPADCALL (QREFELT % 144) |l| (QREFELT % 121))) 

(SDEFUN |FSPECF;weberE;3F;56| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 148) |v| |z| (QREFELT % 70))) 

(SDEFUN |FSPECF;eWeberE| ((|v| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |z| (|spadConstant| % 92) (QREFELT % 94))
          (SPADCALL
           (SPADCALL 2
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL (QREFELT % 109) |v| (QREFELT % 122))
                                 (SPADCALL (QREFELT % 146)) (QREFELT % 122))
                       (QREFELT % 147))
                      2 (QREFELT % 150))
                     (QREFELT % 114))
           (SPADCALL |v| (SPADCALL (QREFELT % 146)) (QREFELT % 122))
           (QREFELT % 131)))
         ('T (SPADCALL (QREFELT % 148) (LIST |v| |z|) (QREFELT % 121))))) 

(SDEFUN |FSPECF;elWeberE| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eWeberE| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;eWeberEGrad_z| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| % 96) (QREFELT % 123)) |z|
                     (QREFELT % 149))
           (QREFELT % 132))
          (SPADCALL
           (SPADCALL |v| (SPADCALL |v| |z| (QREFELT % 149)) (QREFELT % 122))
           |z| (QREFELT % 131))
          (QREFELT % 123))
         (SPADCALL
          (SPADCALL (|spadConstant| % 96)
                    (SPADCALL
                     (SPADCALL |v| (SPADCALL (QREFELT % 146)) (QREFELT % 122))
                     (QREFELT % 151))
                    (QREFELT % 130))
          (SPADCALL (SPADCALL (QREFELT % 146)) |z| (QREFELT % 122))
          (QREFELT % 131))
         (QREFELT % 130))) 

(SDEFUN |FSPECF;dWeberE| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 148)
         (CONS (|function| |FSPECF;eWeberEGrad_z|) %) %)) 

(SDEFUN |FSPECF;eeWeberE| ((|l| (|List| F)) (% (F)))
        (SPADCALL (QREFELT % 148) |l| (QREFELT % 121))) 

(SDEFUN |FSPECF;struveH;3F;62| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 152) |v| |z| (QREFELT % 70))) 

(SDEFUN |FSPECF;eStruveH| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 152) (LIST |v| |z|) (QREFELT % 121))) 

(SDEFUN |FSPECF;elStruveH| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eStruveH| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;eStruveHGrad_z| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| % 96) (QREFELT % 123)) |z|
                     (QREFELT % 153))
           (QREFELT % 132))
          (SPADCALL
           (SPADCALL |v| (SPADCALL |v| |z| (QREFELT % 153)) (QREFELT % 122))
           |z| (QREFELT % 131))
          (QREFELT % 123))
         (SPADCALL
          (SPADCALL (SPADCALL (QREFELT % 109) |z| (QREFELT % 122)) |v|
                    (QREFELT % 154))
          (SPADCALL (SPADCALL (SPADCALL (QREFELT % 146)) (QREFELT % 135))
                    (SPADCALL (SPADCALL |v| (QREFELT % 116) (QREFELT % 123))
                              (QREFELT % 69))
                    (QREFELT % 122))
          (QREFELT % 131))
         (QREFELT % 123))) 

(SDEFUN |FSPECF;dStruveH| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 152)
         (CONS (|function| |FSPECF;eStruveHGrad_z|) %) %)) 

(SDEFUN |FSPECF;struveL;3F;67| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 155) |v| |z| (QREFELT % 70))) 

(SDEFUN |FSPECF;eStruveL| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 155) (LIST |v| |z|) (QREFELT % 121))) 

(SDEFUN |FSPECF;elStruveL| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eStruveL| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;eStruveLGrad_z| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |v| (|spadConstant| % 96) (QREFELT % 123)) |z|
                    (QREFELT % 156))
          (SPADCALL
           (SPADCALL |v| (SPADCALL |v| |z| (QREFELT % 156)) (QREFELT % 122))
           |z| (QREFELT % 131))
          (QREFELT % 123))
         (SPADCALL
          (SPADCALL (SPADCALL (QREFELT % 109) |z| (QREFELT % 122)) |v|
                    (QREFELT % 154))
          (SPADCALL (SPADCALL (SPADCALL (QREFELT % 146)) (QREFELT % 135))
                    (SPADCALL (SPADCALL |v| (QREFELT % 116) (QREFELT % 123))
                              (QREFELT % 69))
                    (QREFELT % 122))
          (QREFELT % 131))
         (QREFELT % 123))) 

(SDEFUN |FSPECF;dStruveL| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 155)
         (CONS (|function| |FSPECF;eStruveLGrad_z|) %) %)) 

(SDEFUN |FSPECF;hankelH1;3F;72| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 157) |v| |z| (QREFELT % 70))) 

(SDEFUN |FSPECF;eHankelH1| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 157) (LIST |v| |z|) (QREFELT % 121))) 

(SDEFUN |FSPECF;elHankelH1| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eHankelH1| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;eHankelH1Grad_z| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |v| (|spadConstant| % 96) (QREFELT % 123)) |z|
                    (QREFELT % 158))
          (QREFELT % 132))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT % 158)) (QREFELT % 122)) |z|
          (QREFELT % 131))
         (QREFELT % 123))) 

(SDEFUN |FSPECF;dHankelH1| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 157)
         (CONS (|function| |FSPECF;eHankelH1Grad_z|) %) %)) 

(SDEFUN |FSPECF;hankelH2;3F;77| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 159) |v| |z| (QREFELT % 70))) 

(SDEFUN |FSPECF;eHankelH2| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 159) (LIST |v| |z|) (QREFELT % 121))) 

(SDEFUN |FSPECF;elHankelH2| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eHankelH2| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;eHankelH2Grad_z| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |v| (|spadConstant| % 96) (QREFELT % 123)) |z|
                    (QREFELT % 160))
          (QREFELT % 132))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT % 160)) (QREFELT % 122)) |z|
          (QREFELT % 131))
         (QREFELT % 123))) 

(SDEFUN |FSPECF;dHankelH2| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 159)
         (CONS (|function| |FSPECF;eHankelH2Grad_z|) %) %)) 

(SDEFUN |FSPECF;lommelS1;4F;82| ((|m| (F)) (|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 161) |m| |v| |z| (QREFELT % 73))) 

(SDEFUN |FSPECF;eLommelS1| ((|m| (F)) (|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 161) (LIST |m| |v| |z|) (QREFELT % 121))) 

(SDEFUN |FSPECF;elLommelS1| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eLommelS1| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) (SPADCALL |l| 3 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;eLommelS1Grad_z| ((|m| (F)) (|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL |v| (SPADCALL |m| |v| |z| (QREFELT % 162))
                     (QREFELT % 122))
           |z| (QREFELT % 131))
          (QREFELT % 132))
         (SPADCALL
          (SPADCALL (SPADCALL |m| |v| (QREFELT % 123)) (|spadConstant| % 96)
                    (QREFELT % 130))
          (SPADCALL (SPADCALL |m| (|spadConstant| % 96) (QREFELT % 130))
                    (SPADCALL |v| (|spadConstant| % 96) (QREFELT % 130)) |z|
                    (QREFELT % 162))
          (QREFELT % 122))
         (QREFELT % 123))) 

(SDEFUN |FSPECF;dLommelS1| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad3| |l| |t| (QREFELT % 161)
         (CONS (|function| |FSPECF;eLommelS1Grad_z|) %) %)) 

(SDEFUN |FSPECF;lommelS2;4F;87| ((|mu| (F)) (|nu| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 163) |mu| |nu| |z| (QREFELT % 73))) 

(SDEFUN |FSPECF;eLommelS2| ((|mu| (F)) (|nu| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 163) (LIST |mu| |nu| |z|) (QREFELT % 121))) 

(SDEFUN |FSPECF;elLommelS2| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eLommelS2| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) (SPADCALL |l| 3 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;eLommelS2Grad_z| ((|m| (F)) (|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL |v| (SPADCALL |m| |v| |z| (QREFELT % 164))
                     (QREFELT % 122))
           |z| (QREFELT % 131))
          (QREFELT % 132))
         (SPADCALL
          (SPADCALL (SPADCALL |m| |v| (QREFELT % 123)) (|spadConstant| % 96)
                    (QREFELT % 130))
          (SPADCALL (SPADCALL |m| (|spadConstant| % 96) (QREFELT % 130))
                    (SPADCALL |v| (|spadConstant| % 96) (QREFELT % 130)) |z|
                    (QREFELT % 164))
          (QREFELT % 122))
         (QREFELT % 123))) 

(SDEFUN |FSPECF;dLommelS2| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad3| |l| |t| (QREFELT % 163)
         (CONS (|function| |FSPECF;eLommelS2Grad_z|) %) %)) 

(SDEFUN |FSPECF;kummerM;4F;92| ((|mu| (F)) (|nu| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 165) |mu| |nu| |z| (QREFELT % 73))) 

(SDEFUN |FSPECF;eKummerM| ((|a| (F)) (|b| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |z| (|spadConstant| % 92) (QREFELT % 94))
          (|spadConstant| % 96))
         ('T (SPADCALL (QREFELT % 165) (LIST |a| |b| |z|) (QREFELT % 121))))) 

(SDEFUN |FSPECF;elKummerM| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eKummerM| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) (SPADCALL |l| 3 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;eKummerMGrad_z| ((|a| (F)) (|b| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |z| |a| (QREFELT % 123)) |b| (QREFELT % 130))
           (SPADCALL |a| |b| |z| (QREFELT % 166)) (QREFELT % 122))
          (SPADCALL (SPADCALL |b| |a| (QREFELT % 130))
                    (SPADCALL
                     (SPADCALL |a| (|spadConstant| % 96) (QREFELT % 130)) |b|
                     |z| (QREFELT % 166))
                    (QREFELT % 122))
          (QREFELT % 123))
         |z| (QREFELT % 131))) 

(SDEFUN |FSPECF;dKummerM| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad3| |l| |t| (QREFELT % 165)
         (CONS (|function| |FSPECF;eKummerMGrad_z|) %) %)) 

(SDEFUN |FSPECF;kummerU;4F;97| ((|a| (F)) (|b| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 167) |a| |b| |z| (QREFELT % 73))) 

(SDEFUN |FSPECF;eKummerU| ((|a| (F)) (|b| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 167) (LIST |a| |b| |z|) (QREFELT % 121))) 

(SDEFUN |FSPECF;elKummerU| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eKummerU| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) (SPADCALL |l| 3 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;eKummerUGrad_z| ((|a| (F)) (|b| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |z| |a| (QREFELT % 123)) |b| (QREFELT % 130))
           (SPADCALL |a| |b| |z| (QREFELT % 168)) (QREFELT % 122))
          (SPADCALL (SPADCALL |a| (|spadConstant| % 96) (QREFELT % 130)) |b|
                    |z| (QREFELT % 168))
          (QREFELT % 130))
         |z| (QREFELT % 131))) 

(SDEFUN |FSPECF;dKummerU| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad3| |l| |t| (QREFELT % 167)
         (CONS (|function| |FSPECF;eKummerUGrad_z|) %) %)) 

(SDEFUN |FSPECF;legendreP;4F;102| ((|nu| (F)) (|mu| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 169) |nu| |mu| |z| (QREFELT % 73))) 

(SDEFUN |FSPECF;eLegendreP| ((|nu| (F)) (|mu| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 169) (LIST |nu| |mu| |z|) (QREFELT % 121))) 

(SDEFUN |FSPECF;elLegendreP| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eLegendreP| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) (SPADCALL |l| 3 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;eLegendrePGrad_z| ((|nu| (F)) (|mu| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |nu| |mu| (QREFELT % 130)) (|spadConstant| % 96)
                    (QREFELT % 123))
          (SPADCALL (SPADCALL |nu| (|spadConstant| % 96) (QREFELT % 123)) |mu|
                    |z| (QREFELT % 170))
          (QREFELT % 122))
         (SPADCALL
          (SPADCALL (SPADCALL |nu| (|spadConstant| % 96) (QREFELT % 123)) |z|
                    (QREFELT % 122))
          (SPADCALL |nu| |mu| |z| (QREFELT % 170)) (QREFELT % 122))
         (QREFELT % 130))) 

(SDEFUN |FSPECF;dLegendreP| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad3| |l| |t| (QREFELT % 169)
         (CONS (|function| |FSPECF;eLegendrePGrad_z|) %) %)) 

(SDEFUN |FSPECF;legendreQ;4F;107| ((|nu| (F)) (|mu| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 171) |nu| |mu| |z| (QREFELT % 73))) 

(SDEFUN |FSPECF;eLegendreQ| ((|nu| (F)) (|mu| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 171) (LIST |nu| |mu| |z|) (QREFELT % 121))) 

(SDEFUN |FSPECF;elLegendreQ| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eLegendreQ| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) (SPADCALL |l| 3 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;eLegendreQGrad_z| ((|nu| (F)) (|mu| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |nu| |mu| (QREFELT % 130)) (|spadConstant| % 96)
                    (QREFELT % 123))
          (SPADCALL (SPADCALL |nu| (|spadConstant| % 96) (QREFELT % 123)) |mu|
                    |z| (QREFELT % 172))
          (QREFELT % 122))
         (SPADCALL
          (SPADCALL (SPADCALL |nu| (|spadConstant| % 96) (QREFELT % 123)) |z|
                    (QREFELT % 122))
          (SPADCALL |nu| |mu| |z| (QREFELT % 172)) (QREFELT % 122))
         (QREFELT % 130))) 

(SDEFUN |FSPECF;dLegendreQ| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad3| |l| |t| (QREFELT % 171)
         (CONS (|function| |FSPECF;eLegendreQGrad_z|) %) %)) 

(SDEFUN |FSPECF;kelvinBei;3F;112| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 173) |v| |z| (QREFELT % 70))) 

(SDEFUN |FSPECF;eKelvinBei| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 173) (LIST |v| |z|) (QREFELT % 121))) 

(SDEFUN |FSPECF;elKelvinBei| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eKelvinBei| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;eKelvinBeiGrad_z| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT % 109)
                    (SPADCALL (SPADCALL 2 (QREFELT % 98)) (QREFELT % 135))
                    (QREFELT % 122))
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| % 96) (QREFELT % 123)) |z|
                     (QREFELT % 174))
           (SPADCALL (SPADCALL |v| (|spadConstant| % 96) (QREFELT % 123)) |z|
                     (QREFELT % 175))
           (QREFELT % 130))
          (QREFELT % 122))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT % 174)) (QREFELT % 122)) |z|
          (QREFELT % 131))
         (QREFELT % 123))) 

(SDEFUN |FSPECF;dKelvinBei| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 173)
         (CONS (|function| |FSPECF;eKelvinBeiGrad_z|) %) %)) 

(SDEFUN |FSPECF;kelvinBer;3F;117| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 176) |v| |z| (QREFELT % 70))) 

(SDEFUN |FSPECF;eKelvinBer| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 176) (LIST |v| |z|) (QREFELT % 121))) 

(SDEFUN |FSPECF;elKelvinBer| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eKelvinBer| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;eKelvinBerGrad_z| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT % 109)
                    (SPADCALL (SPADCALL 2 (QREFELT % 98)) (QREFELT % 135))
                    (QREFELT % 122))
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| % 96) (QREFELT % 123)) |z|
                     (QREFELT % 175))
           (SPADCALL (SPADCALL |v| (|spadConstant| % 96) (QREFELT % 123)) |z|
                     (QREFELT % 174))
           (QREFELT % 123))
          (QREFELT % 122))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT % 175)) (QREFELT % 122)) |z|
          (QREFELT % 131))
         (QREFELT % 123))) 

(SDEFUN |FSPECF;dKelvinBer| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 176)
         (CONS (|function| |FSPECF;eKelvinBerGrad_z|) %) %)) 

(SDEFUN |FSPECF;kelvinKei;3F;122| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 177) |v| |z| (QREFELT % 70))) 

(SDEFUN |FSPECF;eKelvinKei| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 177) (LIST |v| |z|) (QREFELT % 121))) 

(SDEFUN |FSPECF;elKelvinKei| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eKelvinKei| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;eKelvinKeiGrad_z| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT % 109)
                    (SPADCALL (SPADCALL 2 (QREFELT % 98)) (QREFELT % 135))
                    (QREFELT % 122))
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| % 96) (QREFELT % 123)) |z|
                     (QREFELT % 178))
           (SPADCALL (SPADCALL |v| (|spadConstant| % 96) (QREFELT % 123)) |z|
                     (QREFELT % 179))
           (QREFELT % 130))
          (QREFELT % 122))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT % 178)) (QREFELT % 122)) |z|
          (QREFELT % 131))
         (QREFELT % 123))) 

(SDEFUN |FSPECF;dKelvinKei| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 177)
         (CONS (|function| |FSPECF;eKelvinKeiGrad_z|) %) %)) 

(SDEFUN |FSPECF;kelvinKer;3F;127| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 180) |v| |z| (QREFELT % 70))) 

(SDEFUN |FSPECF;eKelvinKer| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 180) (LIST |v| |z|) (QREFELT % 121))) 

(SDEFUN |FSPECF;elKelvinKer| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eKelvinKer| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;eKelvinKerGrad_z| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT % 109)
                    (SPADCALL (SPADCALL 2 (QREFELT % 98)) (QREFELT % 135))
                    (QREFELT % 122))
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| % 96) (QREFELT % 123)) |z|
                     (QREFELT % 179))
           (SPADCALL (SPADCALL |v| (|spadConstant| % 96) (QREFELT % 123)) |z|
                     (QREFELT % 178))
           (QREFELT % 123))
          (QREFELT % 122))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT % 179)) (QREFELT % 122)) |z|
          (QREFELT % 131))
         (QREFELT % 123))) 

(SDEFUN |FSPECF;dKelvinKer| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 180)
         (CONS (|function| |FSPECF;eKelvinKerGrad_z|) %) %)) 

(SDEFUN |FSPECF;ellipticK;2F;132| ((|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 181) |m| (QREFELT % 60))) 

(SDEFUN |FSPECF;eEllipticK| ((|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 181) (LIST |m|) (QREFELT % 121))) 

(SDEFUN |FSPECF;elEllipticK| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eEllipticK| (SPADCALL |l| 1 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;dEllipticK| ((|m| (F)) (% (F)))
        (SPADCALL
         (SPADCALL (QREFELT % 109)
                   (SPADCALL (SPADCALL |m| (QREFELT % 183))
                             (SPADCALL
                              (SPADCALL (|spadConstant| % 96) |m|
                                        (QREFELT % 130))
                              (SPADCALL |m| (QREFELT % 182)) (QREFELT % 122))
                             (QREFELT % 130))
                   (QREFELT % 122))
         (SPADCALL |m| (SPADCALL (|spadConstant| % 96) |m| (QREFELT % 130))
                   (QREFELT % 122))
         (QREFELT % 131))) 

(SDEFUN |FSPECF;ellipticE;2F;136| ((|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 188) |m| (QREFELT % 60))) 

(SDEFUN |FSPECF;eEllipticE| ((|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 188) (LIST |m|) (QREFELT % 121))) 

(SDEFUN |FSPECF;elEllipticE| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eEllipticE| (SPADCALL |l| 1 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;dEllipticE| ((|m| (F)) (% (F)))
        (SPADCALL
         (SPADCALL (QREFELT % 109)
                   (SPADCALL (SPADCALL |m| (QREFELT % 183))
                             (SPADCALL |m| (QREFELT % 182)) (QREFELT % 130))
                   (QREFELT % 122))
         |m| (QREFELT % 131))) 

(SDEFUN |FSPECF;ellipticE;3F;140| ((|z| (F)) (|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 189) |z| |m| (QREFELT % 70))) 

(SDEFUN |FSPECF;eEllipticE2| ((|z| (F)) (|m| (F)) (% (F)))
        (COND
         ((SPADCALL |z| (|spadConstant| % 92) (QREFELT % 94))
          (|spadConstant| % 92))
         ((SPADCALL |z| (|spadConstant| % 96) (QREFELT % 94))
          (|FSPECF;eEllipticE| |m| %))
         ('T (SPADCALL (QREFELT % 189) (LIST |z| |m|) (QREFELT % 121))))) 

(SDEFUN |FSPECF;elEllipticE2| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eEllipticE2| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;eEllipticE2Grad_z| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 117)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 117)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 96)
                                 (SPADCALL |m| (SPADCALL |z| 2 (QREFELT % 129))
                                           (QREFELT % 122))
                                 (QREFELT % 130))
                       (QREFELT % 135))
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 96)
                                 (SPADCALL |z| 2 (QREFELT % 129))
                                 (QREFELT % 130))
                       (QREFELT % 135))
                      (QREFELT % 131)))))) 

(SDEFUN |FSPECF;eEllipticE2Grad_m| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 117)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 117)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (QREFELT % 109)
                                (SPADCALL (SPADCALL |z| |m| (QREFELT % 190))
                                          (SPADCALL |z| |m| (QREFELT % 191))
                                          (QREFELT % 130))
                                (QREFELT % 122))
                      |m| (QREFELT % 131)))))) 

(SDEFUN |FSPECF;inEllipticE2| ((|li| (|List| (|InputForm|))) (% (|InputForm|)))
        (SPADCALL (CONS (SPADCALL '|ellipticE| (QREFELT % 193)) |li|)
                  (QREFELT % 194))) 

(SDEFUN |FSPECF;ellipticF;3F;146| ((|z| (F)) (|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 197) |z| |m| (QREFELT % 70))) 

(SDEFUN |FSPECF;eEllipticF| ((|z| (F)) (|m| (F)) (% (F)))
        (COND
         ((SPADCALL |z| (|spadConstant| % 92) (QREFELT % 94))
          (|spadConstant| % 92))
         ((SPADCALL |z| (|spadConstant| % 96) (QREFELT % 94))
          (SPADCALL |m| (QREFELT % 182)))
         ('T (SPADCALL (QREFELT % 197) (LIST |z| |m|) (QREFELT % 121))))) 

(SDEFUN |FSPECF;elEllipticF| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eEllipticF| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;eEllipticFGrad_z| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 117)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 117)))
                    (EXIT
                     (SPADCALL (|spadConstant| % 96)
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (|spadConstant| % 96)
                                           (SPADCALL |m|
                                                     (SPADCALL |z| 2
                                                               (QREFELT % 129))
                                                     (QREFELT % 122))
                                           (QREFELT % 130))
                                 (QREFELT % 135))
                                (SPADCALL
                                 (SPADCALL (|spadConstant| % 96)
                                           (SPADCALL |z| 2 (QREFELT % 129))
                                           (QREFELT % 130))
                                 (QREFELT % 135))
                                (QREFELT % 122))
                               (QREFELT % 131)))))) 

(SDEFUN |FSPECF;eEllipticFGrad_m| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 117)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 117)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (QREFELT % 109)
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |z| |m| (QREFELT % 190))
                                            (SPADCALL
                                             (SPADCALL (|spadConstant| % 96)
                                                       |m| (QREFELT % 130))
                                             (SPADCALL |z| |m| (QREFELT % 191))
                                             (QREFELT % 122))
                                            (QREFELT % 130))
                                  |m| (QREFELT % 131))
                                 (SPADCALL
                                  (SPADCALL |z|
                                            (SPADCALL
                                             (SPADCALL (|spadConstant| % 96)
                                                       (SPADCALL |z| 2
                                                                 (QREFELT %
                                                                          129))
                                                       (QREFELT % 130))
                                             (QREFELT % 135))
                                            (QREFELT % 122))
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| % 96)
                                             (SPADCALL |m|
                                                       (SPADCALL |z| 2
                                                                 (QREFELT %
                                                                          129))
                                                       (QREFELT % 122))
                                             (QREFELT % 130))
                                   (QREFELT % 135))
                                  (QREFELT % 131))
                                 (QREFELT % 130))
                                (QREFELT % 122))
                      (SPADCALL (|spadConstant| % 96) |m| (QREFELT % 130))
                      (QREFELT % 131)))))) 

(SDEFUN |FSPECF;ellipticPi;4F;151| ((|z| (F)) (|n| (F)) (|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 198) |z| |n| |m| (QREFELT % 73))) 

(SDEFUN |FSPECF;eEllipticPi| ((|z| (F)) (|n| (F)) (|m| (F)) (% (F)))
        (COND
         ((SPADCALL |z| (|spadConstant| % 92) (QREFELT % 94))
          (|spadConstant| % 92))
         ('T (SPADCALL (QREFELT % 198) (LIST |z| |n| |m|) (QREFELT % 121))))) 

(SDEFUN |FSPECF;elEllipticPi| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eEllipticPi| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) (SPADCALL |l| 3 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;eEllipticPiGrad_z| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|n| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 117)))
                    (LETT |n| (SPADCALL |l| 2 (QREFELT % 117)))
                    (LETT |m| (SPADCALL |l| 3 (QREFELT % 117)))
                    (EXIT
                     (SPADCALL (|spadConstant| % 96)
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (|spadConstant| % 96)
                                           (SPADCALL |n|
                                                     (SPADCALL |z| 2
                                                               (QREFELT % 129))
                                                     (QREFELT % 122))
                                           (QREFELT % 130))
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| % 96)
                                            (SPADCALL |m|
                                                      (SPADCALL |z| 2
                                                                (QREFELT %
                                                                         129))
                                                      (QREFELT % 122))
                                            (QREFELT % 130))
                                  (QREFELT % 135))
                                 (QREFELT % 122))
                                (SPADCALL
                                 (SPADCALL (|spadConstant| % 96)
                                           (SPADCALL |z| 2 (QREFELT % 129))
                                           (QREFELT % 130))
                                 (QREFELT % 135))
                                (QREFELT % 122))
                               (QREFELT % 131)))))) 

(SDEFUN |FSPECF;eEllipticPiGrad_n| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|t4| (F)) (|t3| (F)) (|t2| (F)) (|t1| (F)) (|m| (F)) (|n| (F))
          (|z| (F)))
         (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 117)))
              (LETT |n| (SPADCALL |l| 2 (QREFELT % 117)))
              (LETT |m| (SPADCALL |l| 3 (QREFELT % 117)))
              (LETT |t1|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL |n| 2 (QREFELT % 129)) |m|
                                 (QREFELT % 130))
                       (SPADCALL |z| |n| |m| (QREFELT % 199)) (QREFELT % 122))
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL |n| (|spadConstant| % 96) (QREFELT % 130))
                        (SPADCALL |n| |m| (QREFELT % 130)) (QREFELT % 122))
                       |n| (QREFELT % 122))
                      (QREFELT % 131))
                     (QREFELT % 132)))
              (LETT |t2|
                    (SPADCALL (SPADCALL |z| |m| (QREFELT % 191))
                              (SPADCALL
                               (SPADCALL |n| (|spadConstant| % 96)
                                         (QREFELT % 130))
                               |n| (QREFELT % 122))
                              (QREFELT % 131)))
              (LETT |t3|
                    (SPADCALL
                     (SPADCALL (SPADCALL |z| |m| (QREFELT % 190))
                               (SPADCALL
                                (SPADCALL |n| (|spadConstant| % 96)
                                          (QREFELT % 130))
                                (SPADCALL |n| |m| (QREFELT % 130))
                                (QREFELT % 122))
                               (QREFELT % 131))
                     (QREFELT % 132)))
              (LETT |t4|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |n| |z| (QREFELT % 122))
                                (SPADCALL
                                 (SPADCALL (|spadConstant| % 96)
                                           (SPADCALL |m|
                                                     (SPADCALL |z| 2
                                                               (QREFELT % 129))
                                                     (QREFELT % 122))
                                           (QREFELT % 130))
                                 (QREFELT % 135))
                                (QREFELT % 122))
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 96)
                                 (SPADCALL |z| 2 (QREFELT % 129))
                                 (QREFELT % 130))
                       (QREFELT % 135))
                      (QREFELT % 122))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 96)
                                 (SPADCALL |n| (SPADCALL |z| 2 (QREFELT % 129))
                                           (QREFELT % 122))
                                 (QREFELT % 130))
                       (SPADCALL |n| (|spadConstant| % 96) (QREFELT % 130))
                       (QREFELT % 122))
                      (SPADCALL |n| |m| (QREFELT % 130)) (QREFELT % 122))
                     (QREFELT % 131)))
              (EXIT
               (SPADCALL (QREFELT % 109)
                         (SPADCALL
                          (SPADCALL (SPADCALL |t1| |t2| (QREFELT % 123)) |t3|
                                    (QREFELT % 123))
                          |t4| (QREFELT % 123))
                         (QREFELT % 122)))))) 

(SDEFUN |FSPECF;eEllipticPiGrad_m| ((|l| (|List| F)) (% (F)))
        (SPROG ((|t2| (F)) (|t1| (F)) (|m| (F)) (|n| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 117)))
                    (LETT |n| (SPADCALL |l| 2 (QREFELT % 117)))
                    (LETT |m| (SPADCALL |l| 3 (QREFELT % 117)))
                    (LETT |t1|
                          (SPADCALL
                           (SPADCALL (SPADCALL |m| |z| (QREFELT % 122))
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| % 96)
                                                (SPADCALL |z| 2
                                                          (QREFELT % 129))
                                                (QREFELT % 130))
                                      (QREFELT % 135))
                                     (QREFELT % 122))
                           (SPADCALL
                            (SPADCALL (|spadConstant| % 96)
                                      (SPADCALL |m|
                                                (SPADCALL |z| 2
                                                          (QREFELT % 129))
                                                (QREFELT % 122))
                                      (QREFELT % 130))
                            (QREFELT % 135))
                           (QREFELT % 131)))
                    (LETT |t2|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |z| |m| (QREFELT % 190))
                                      (QREFELT % 132))
                            |t1| (QREFELT % 123))
                           (SPADCALL (|spadConstant| % 96) |m| (QREFELT % 130))
                           (QREFELT % 131)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (QREFELT % 109)
                                (SPADCALL
                                 (SPADCALL |z| |n| |m| (QREFELT % 199)) |t2|
                                 (QREFELT % 123))
                                (QREFELT % 122))
                      (SPADCALL |n| |m| (QREFELT % 130)) (QREFELT % 131)))))) 

(SDEFUN |FSPECF;jacobiSn;3F;157| ((|z| (F)) (|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 200) |z| |m| (QREFELT % 70))) 

(SDEFUN |FSPECF;eJacobiSn| ((|z| (F)) (|m| (F)) (% (F)))
        (SPROG ((#1=#:G467 NIL) (|args| (|List| F)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |z| (|spadConstant| % 92) (QREFELT % 94))
                   (|spadConstant| % 92))
                  ('T
                   (SEQ
                    (COND
                     ((SPADCALL |z| (QREFELT % 197) (QREFELT % 202))
                      (SEQ
                       (LETT |args|
                             (SPADCALL (SPADCALL |z| (QREFELT % 204))
                                       (QREFELT % 206)))
                       (EXIT
                        (COND
                         ((SPADCALL |m| (SPADCALL |args| 2 (QREFELT % 117))
                                    (QREFELT % 94))
                          (PROGN
                           (LETT #1# (SPADCALL |args| 1 (QREFELT % 117)))
                           (GO #2=#:G466))))))))
                    (EXIT
                     (SPADCALL (QREFELT % 200) (LIST |z| |m|)
                               (QREFELT % 121)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |FSPECF;elJacobiSn| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eJacobiSn| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;jacobiGradHelper| ((|z| (F)) (|m| (F)) (% (F)))
        (SPADCALL
         (SPADCALL |z|
                   (SPADCALL
                    (SPADCALL (SPADCALL |z| |m| (QREFELT % 201)) |m|
                              (QREFELT % 190))
                    (SPADCALL (|spadConstant| % 96) |m| (QREFELT % 130))
                    (QREFELT % 131))
                   (QREFELT % 130))
         |m| (QREFELT % 131))) 

(SDEFUN |FSPECF;eJacobiSnGrad_z| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 117)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 117)))
                    (EXIT
                     (SPADCALL (SPADCALL |z| |m| (QREFELT % 207))
                               (SPADCALL |z| |m| (QREFELT % 208))
                               (QREFELT % 122)))))) 

(SDEFUN |FSPECF;eJacobiSnGrad_m| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 117)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 117)))
                    (EXIT
                     (SPADCALL (QREFELT % 109)
                               (SPADCALL
                                (SPADCALL (|FSPECF;eJacobiSnGrad_z| |l| %)
                                          (|FSPECF;jacobiGradHelper| |z| |m| %)
                                          (QREFELT % 122))
                                (SPADCALL
                                 (SPADCALL (SPADCALL |z| |m| (QREFELT % 201))
                                           (SPADCALL
                                            (SPADCALL |z| |m| (QREFELT % 207))
                                            2 (QREFELT % 150))
                                           (QREFELT % 122))
                                 (SPADCALL (|spadConstant| % 96) |m|
                                           (QREFELT % 130))
                                 (QREFELT % 131))
                                (QREFELT % 123))
                               (QREFELT % 122)))))) 

(SDEFUN |FSPECF;jacobiCn;3F;163| ((|z| (F)) (|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 209) |z| |m| (QREFELT % 70))) 

(SDEFUN |FSPECF;eJacobiCn| ((|z| (F)) (|m| (F)) (% (F)))
        (COND
         ((SPADCALL |z| (|spadConstant| % 92) (QREFELT % 94))
          (|spadConstant| % 96))
         ('T (SPADCALL (QREFELT % 209) (LIST |z| |m|) (QREFELT % 121))))) 

(SDEFUN |FSPECF;elJacobiCn| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eJacobiCn| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;eJacobiCnGrad_z| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 117)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 117)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |z| |m| (QREFELT % 201))
                                (SPADCALL |z| |m| (QREFELT % 208))
                                (QREFELT % 122))
                      (QREFELT % 132)))))) 

(SDEFUN |FSPECF;eJacobiCnGrad_m| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 117)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 117)))
                    (EXIT
                     (SPADCALL (QREFELT % 109)
                               (SPADCALL
                                (SPADCALL (|FSPECF;eJacobiCnGrad_z| |l| %)
                                          (|FSPECF;jacobiGradHelper| |z| |m| %)
                                          (QREFELT % 122))
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |z| |m| (QREFELT % 201))
                                            2 (QREFELT % 150))
                                  (SPADCALL |z| |m| (QREFELT % 207))
                                  (QREFELT % 122))
                                 (SPADCALL (|spadConstant| % 96) |m|
                                           (QREFELT % 130))
                                 (QREFELT % 131))
                                (QREFELT % 130))
                               (QREFELT % 122)))))) 

(SDEFUN |FSPECF;jacobiDn;3F;168| ((|z| (F)) (|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 210) |z| |m| (QREFELT % 70))) 

(SDEFUN |FSPECF;eJacobiDn| ((|z| (F)) (|m| (F)) (% (F)))
        (COND
         ((SPADCALL |z| (|spadConstant| % 92) (QREFELT % 94))
          (|spadConstant| % 96))
         ('T (SPADCALL (QREFELT % 210) (LIST |z| |m|) (QREFELT % 121))))) 

(SDEFUN |FSPECF;elJacobiDn| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eJacobiDn| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;eJacobiDnGrad_z| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 117)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 117)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL |m| (SPADCALL |z| |m| (QREFELT % 201))
                                 (QREFELT % 122))
                       (SPADCALL |z| |m| (QREFELT % 207)) (QREFELT % 122))
                      (QREFELT % 132)))))) 

(SDEFUN |FSPECF;eJacobiDnGrad_m| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 117)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 117)))
                    (EXIT
                     (SPADCALL (QREFELT % 109)
                               (SPADCALL
                                (SPADCALL (|FSPECF;eJacobiDnGrad_z| |l| %)
                                          (|FSPECF;jacobiGradHelper| |z| |m| %)
                                          (QREFELT % 122))
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |z| |m| (QREFELT % 201))
                                            2 (QREFELT % 150))
                                  (SPADCALL |z| |m| (QREFELT % 208))
                                  (QREFELT % 122))
                                 (SPADCALL (|spadConstant| % 96) |m|
                                           (QREFELT % 130))
                                 (QREFELT % 131))
                                (QREFELT % 130))
                               (QREFELT % 122)))))) 

(SDEFUN |FSPECF;jacobiZeta;3F;173| ((|z| (F)) (|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 211) |z| |m| (QREFELT % 70))) 

(SDEFUN |FSPECF;eJacobiZeta| ((|z| (F)) (|m| (F)) (% (F)))
        (COND
         ((SPADCALL |z| (|spadConstant| % 92) (QREFELT % 94))
          (|spadConstant| % 92))
         ('T (SPADCALL (QREFELT % 211) (LIST |z| |m|) (QREFELT % 121))))) 

(SDEFUN |FSPECF;elJacobiZeta| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eJacobiZeta| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;eJacobiZetaGrad_z| ((|l| (|List| F)) (% (F)))
        (SPROG ((|dn| (F)) (|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 117)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 117)))
                    (LETT |dn| (SPADCALL |z| |m| (QREFELT % 208)))
                    (EXIT
                     (SPADCALL (SPADCALL |dn| |dn| (QREFELT % 122))
                               (SPADCALL (SPADCALL |m| (QREFELT % 183))
                                         (SPADCALL |m| (QREFELT % 182))
                                         (QREFELT % 131))
                               (QREFELT % 130)))))) 

(SDEFUN |FSPECF;eJacobiZetaGrad_m| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|res4| (F)) (|res3| (F)) (|res2| (F)) (|res1| (F)) (|dn| (F))
          (|er| (F)) (|ee| (F)) (|ek| (F)) (|m| (F)) (|z| (F)))
         (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 117)))
              (LETT |m| (SPADCALL |l| 2 (QREFELT % 117)))
              (LETT |ek| (SPADCALL |m| (QREFELT % 182)))
              (LETT |ee| (SPADCALL |m| (QREFELT % 183)))
              (LETT |er| (SPADCALL |ee| |ek| (QREFELT % 131)))
              (LETT |dn| (SPADCALL |z| |m| (QREFELT % 208)))
              (LETT |res1|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |dn| |dn| (QREFELT % 122)) |m|
                                (QREFELT % 123))
                      (|spadConstant| % 96) (QREFELT % 130))
                     (SPADCALL |z| |m| (QREFELT % 212)) (QREFELT % 122)))
              (LETT |res2|
                    (SPADCALL |res1|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL |m| (|spadConstant| % 96)
                                           (QREFELT % 130))
                                 |z| (QREFELT % 122))
                                |dn| (QREFELT % 122))
                               |dn| (QREFELT % 122))
                              (QREFELT % 123)))
              (LETT |res3|
                    (SPADCALL |res2|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |m|
                                          (SPADCALL |z| |m| (QREFELT % 207))
                                          (QREFELT % 122))
                                (SPADCALL |z| |m| (QREFELT % 208))
                                (QREFELT % 122))
                               (SPADCALL |z| |m| (QREFELT % 201))
                               (QREFELT % 122))
                              (QREFELT % 130)))
              (LETT |res4|
                    (SPADCALL |res3|
                              (SPADCALL
                               (SPADCALL |z|
                                         (SPADCALL
                                          (SPADCALL (|spadConstant| % 96) |m|
                                                    (QREFELT % 130))
                                          (SPADCALL |dn| |dn| (QREFELT % 122))
                                          (QREFELT % 123))
                                         (QREFELT % 122))
                               |er| (QREFELT % 122))
                              (QREFELT % 123)))
              (EXIT
               (SPADCALL
                (SPADCALL (QREFELT % 109)
                          (SPADCALL |res4|
                                    (SPADCALL
                                     (SPADCALL |z| |er| (QREFELT % 122)) |er|
                                     (QREFELT % 122))
                                    (QREFELT % 130))
                          (QREFELT % 122))
                (SPADCALL (SPADCALL |m| |m| (QREFELT % 122)) |m|
                          (QREFELT % 130))
                (QREFELT % 131)))))) 

(SDEFUN |FSPECF;jacobiTheta;3F;178| ((|z| (F)) (|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 213) |z| |m| (QREFELT % 70))) 

(SDEFUN |FSPECF;eJacobiTheta| ((|z| (F)) (|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 213) (LIST |z| |m|) (QREFELT % 121))) 

(SDEFUN |FSPECF;elJacobiTheta| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eJacobiTheta| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;eJacobiThetaGrad_z| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 117)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 117)))
                    (EXIT
                     (SPADCALL (SPADCALL |z| |m| (QREFELT % 212))
                               (SPADCALL |z| |m| (QREFELT % 214))
                               (QREFELT % 122)))))) 

(SDEFUN |FSPECF;eJacobiThetaGrad_m| ((|l| (|List| F)) (% (F)))
        (SPROG ((|dm| (F)) (|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 117)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 117)))
                    (LETT |dm|
                          (SPADCALL (SPADCALL (QREFELT % 118))
                                    (QREFELT % 119)))
                    (EXIT
                     (SPADCALL (QREFELT % 106)
                               (LIST
                                (SPADCALL (QREFELT % 213) (LIST |z| |dm|)
                                          (QREFELT % 102))
                                |dm| |m|)
                               (QREFELT % 121)))))) 

(SDEFUN |FSPECF;lerchPhi;4F;183| ((|z| (F)) (|s| (F)) (|a| (F)) (% (F)))
        (SPADCALL (QREFELT % 215) |z| |s| |a| (QREFELT % 73))) 

(SDEFUN |FSPECF;eLerchPhi| ((|z| (F)) (|s| (F)) (|a| (F)) (% (F)))
        (COND
         ((SPADCALL |a| (|spadConstant| % 96) (QREFELT % 94))
          (SPADCALL (SPADCALL |s| |z| (QREFELT % 86)) |z| (QREFELT % 131)))
         ('T (SPADCALL (QREFELT % 215) (LIST |z| |s| |a|) (QREFELT % 121))))) 

(SDEFUN |FSPECF;elLerchPhi| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eLerchPhi| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) (SPADCALL |l| 3 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;dLerchPhi| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (SPROG ((|dm| (F)) (|da| (F)) (|dz| (F)) (|a| (F)) (|s| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 117)))
                    (LETT |s| (SPADCALL |l| 2 (QREFELT % 117)))
                    (LETT |a| (SPADCALL |l| 3 (QREFELT % 117)))
                    (LETT |dz|
                          (SPADCALL
                           (SPADCALL (SPADCALL |z| |t| (QREFELT % 120))
                                     (SPADCALL
                                      (SPADCALL |z|
                                                (SPADCALL |s|
                                                          (|spadConstant| % 96)
                                                          (QREFELT % 130))
                                                |a| (QREFELT % 216))
                                      (SPADCALL |a|
                                                (SPADCALL |z| |s| |a|
                                                          (QREFELT % 216))
                                                (QREFELT % 122))
                                      (QREFELT % 130))
                                     (QREFELT % 122))
                           |z| (QREFELT % 131)))
                    (LETT |da|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |a| |t| (QREFELT % 120)) |s|
                                      (QREFELT % 122))
                            (SPADCALL |z|
                                      (SPADCALL |s| (|spadConstant| % 96)
                                                (QREFELT % 123))
                                      |a| (QREFELT % 216))
                            (QREFELT % 122))
                           (QREFELT % 132)))
                    (LETT |dm|
                          (SPADCALL (SPADCALL (QREFELT % 118))
                                    (QREFELT % 119)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL |s| |t| (QREFELT % 120))
                                 (SPADCALL (QREFELT % 106)
                                           (LIST
                                            (SPADCALL (QREFELT % 215)
                                                      (LIST |z| |dm| |a|)
                                                      (QREFELT % 102))
                                            |dm| |s|)
                                           (QREFELT % 121))
                                 (QREFELT % 122))
                       |dz| (QREFELT % 123))
                      |da| (QREFELT % 123)))))) 

(SDEFUN |FSPECF;riemannZeta;2F;187| ((|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 217) |z| (QREFELT % 60))) 

(SDEFUN |FSPECF;eRiemannZeta| ((|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 217) (LIST |z|) (QREFELT % 121))) 

(SDEFUN |FSPECF;elRiemannZeta| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eRiemannZeta| (SPADCALL |l| 1 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;charlierC;4F;190| ((|n| (F)) (|a| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 43) |n| |a| |z| (QREFELT % 73))) 

(SDEFUN |FSPECF;eCharlierC| ((|n| (F)) (|a| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |n| (|spadConstant| % 92) (QREFELT % 94))
          (|spadConstant| % 96))
         ((SPADCALL |n| (|spadConstant| % 96) (QREFELT % 94))
          (SPADCALL (SPADCALL |z| |a| (QREFELT % 130)) |a| (QREFELT % 131)))
         ('T (SPADCALL (QREFELT % 43) (LIST |n| |a| |z|) (QREFELT % 121))))) 

(SDEFUN |FSPECF;elCharlierC| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eCharlierC| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) (SPADCALL |l| 3 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;hermiteH;3F;193| ((|n| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 48) |n| |z| (QREFELT % 70))) 

(SDEFUN |FSPECF;eHermiteH| ((|n| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |n| (SPADCALL (|spadConstant| % 96) (QREFELT % 132))
                    (QREFELT % 94))
          (|spadConstant| % 92))
         ((SPADCALL |n| (|spadConstant| % 92) (QREFELT % 94))
          (|spadConstant| % 96))
         ((SPADCALL |n| (|spadConstant| % 96) (QREFELT % 94))
          (SPADCALL (SPADCALL 2 (QREFELT % 98)) |z| (QREFELT % 122)))
         ('T (SPADCALL (QREFELT % 48) (LIST |n| |z|) (QREFELT % 121))))) 

(SDEFUN |FSPECF;elHermiteH| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eHermiteH| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;eHermiteHGrad_z| ((|n| (F)) (|z| (F)) (% (F)))
        (SPADCALL (SPADCALL (SPADCALL 2 (QREFELT % 98)) |n| (QREFELT % 122))
                  (SPADCALL
                   (SPADCALL |n| (|spadConstant| % 96) (QREFELT % 130)) |z|
                   (QREFELT % 220))
                  (QREFELT % 122))) 

(SDEFUN |FSPECF;dHermiteH| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 48)
         (CONS (|function| |FSPECF;eHermiteHGrad_z|) %) %)) 

(SDEFUN |FSPECF;jacobiP;5F;198|
        ((|n| (F)) (|a| (F)) (|b| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 49) |n| |a| |b| |z| (QREFELT % 221))) 

(SDEFUN |FSPECF;eJacobiP| ((|n| (F)) (|a| (F)) (|b| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |n| (SPADCALL (|spadConstant| % 96) (QREFELT % 132))
                    (QREFELT % 94))
          (|spadConstant| % 92))
         ((SPADCALL |n| (|spadConstant| % 92) (QREFELT % 94))
          (|spadConstant| % 96))
         ((SPADCALL |n| (|spadConstant| % 96) (QREFELT % 94))
          (SPADCALL
           (SPADCALL (QREFELT % 109) (SPADCALL |a| |b| (QREFELT % 130))
                     (QREFELT % 122))
           (SPADCALL
            (SPADCALL (|spadConstant| % 96)
                      (SPADCALL (QREFELT % 109)
                                (SPADCALL |a| |b| (QREFELT % 123))
                                (QREFELT % 122))
                      (QREFELT % 123))
            |z| (QREFELT % 122))
           (QREFELT % 123)))
         ('T (SPADCALL (QREFELT % 49) (LIST |n| |a| |b| |z|) (QREFELT % 121))))) 

(SDEFUN |FSPECF;elJacobiP| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eJacobiP| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) (SPADCALL |l| 3 (QREFELT % 117))
         (SPADCALL |l| 4 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;eJacobiPGrad_z|
        ((|n| (F)) (|a| (F)) (|b| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL (QREFELT % 109)
                   (SPADCALL
                    (SPADCALL (SPADCALL |a| |b| (QREFELT % 123)) |n|
                              (QREFELT % 123))
                    (|spadConstant| % 96) (QREFELT % 123))
                   (QREFELT % 122))
         (SPADCALL (SPADCALL |n| (|spadConstant| % 96) (QREFELT % 130))
                   (SPADCALL |a| (|spadConstant| % 96) (QREFELT % 123))
                   (SPADCALL |b| (|spadConstant| % 96) (QREFELT % 123)) |z|
                   (QREFELT % 222))
         (QREFELT % 122))) 

(SDEFUN |FSPECF;dJacobiP| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad4| |l| |t| (QREFELT % 49)
         (CONS (|function| |FSPECF;eJacobiPGrad_z|) %) %)) 

(SDEFUN |FSPECF;laguerreL;4F;203| ((|n| (F)) (|a| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 51) |n| |a| |z| (QREFELT % 73))) 

(SDEFUN |FSPECF;eLaguerreL| ((|n| (F)) (|a| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |n| (SPADCALL (|spadConstant| % 96) (QREFELT % 132))
                    (QREFELT % 94))
          (|spadConstant| % 92))
         ((SPADCALL |n| (|spadConstant| % 92) (QREFELT % 94))
          (|spadConstant| % 96))
         ((SPADCALL |n| (|spadConstant| % 96) (QREFELT % 94))
          (SPADCALL (SPADCALL (|spadConstant| % 96) |a| (QREFELT % 123)) |z|
                    (QREFELT % 130)))
         ('T (SPADCALL (QREFELT % 51) (LIST |n| |a| |z|) (QREFELT % 121))))) 

(SDEFUN |FSPECF;elLaguerreL| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eLaguerreL| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) (SPADCALL |l| 3 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;eLaguerreLGrad_z| ((|n| (F)) (|a| (F)) (|z| (F)) (% (F)))
        (SPADCALL (SPADCALL |n| (|spadConstant| % 96) (QREFELT % 130))
                  (SPADCALL |a| (|spadConstant| % 96) (QREFELT % 123)) |z|
                  (QREFELT % 223))) 

(SDEFUN |FSPECF;dLaguerreL| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad3| |l| |t| (QREFELT % 51)
         (CONS (|function| |FSPECF;eLaguerreLGrad_z|) %) %)) 

(SDEFUN |FSPECF;hahn_p;6F;208|
        ((|n| (F)) (|a| (F)) (|b| (F)) (|c| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 44) |n| |a| |b| |c| |z| (QREFELT % 224))) 

(SDEFUN |FSPECF;e_hahn_p|
        ((|n| (F)) (|a| (F)) (|b| (F)) (|c| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |n| (|spadConstant| % 92) (QREFELT % 94))
          (|spadConstant| % 96))
         ('T
          (SPADCALL (QREFELT % 44) (LIST |n| |a| |b| |c| |z|)
                    (QREFELT % 121))))) 

(SDEFUN |FSPECF;el_hahn_p| ((|l| (|List| F)) (% (F)))
        (|FSPECF;e_hahn_p| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) (SPADCALL |l| 3 (QREFELT % 117))
         (SPADCALL |l| 4 (QREFELT % 117)) (SPADCALL |l| 5 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;hahnQ;6F;211|
        ((|n| (F)) (|a| (F)) (|b| (F)) (|c| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 45) |n| |a| |b| |c| |z| (QREFELT % 224))) 

(SDEFUN |FSPECF;e_hahnQ|
        ((|n| (F)) (|a| (F)) (|b| (F)) (|c| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |n| (|spadConstant| % 92) (QREFELT % 94))
          (|spadConstant| % 96))
         ('T
          (SPADCALL (QREFELT % 45) (LIST |n| |a| |b| |c| |z|)
                    (QREFELT % 121))))) 

(SDEFUN |FSPECF;el_hahnQ| ((|l| (|List| F)) (% (F)))
        (|FSPECF;e_hahnQ| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) (SPADCALL |l| 3 (QREFELT % 117))
         (SPADCALL |l| 4 (QREFELT % 117)) (SPADCALL |l| 5 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;hahnR;6F;214|
        ((|n| (F)) (|a| (F)) (|b| (F)) (|c| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 46) |n| |a| |b| |c| |z| (QREFELT % 224))) 

(SDEFUN |FSPECF;e_hahnR|
        ((|n| (F)) (|a| (F)) (|b| (F)) (|c| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |n| (|spadConstant| % 92) (QREFELT % 94))
          (|spadConstant| % 96))
         ('T
          (SPADCALL (QREFELT % 46) (LIST |n| |a| |b| |c| |z|)
                    (QREFELT % 121))))) 

(SDEFUN |FSPECF;el_hahnR| ((|l| (|List| F)) (% (F)))
        (|FSPECF;e_hahnR| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) (SPADCALL |l| 3 (QREFELT % 117))
         (SPADCALL |l| 4 (QREFELT % 117)) (SPADCALL |l| 5 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;hahnS;6F;217|
        ((|n| (F)) (|a| (F)) (|b| (F)) (|c| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 47) |n| |a| |b| |c| |z| (QREFELT % 224))) 

(SDEFUN |FSPECF;e_hahnS|
        ((|n| (F)) (|a| (F)) (|b| (F)) (|c| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |n| (|spadConstant| % 92) (QREFELT % 94))
          (|spadConstant| % 96))
         ('T
          (SPADCALL (QREFELT % 47) (LIST |n| |a| |b| |c| |z|)
                    (QREFELT % 121))))) 

(SDEFUN |FSPECF;el_hahnS| ((|l| (|List| F)) (% (F)))
        (|FSPECF;e_hahnS| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) (SPADCALL |l| 3 (QREFELT % 117))
         (SPADCALL |l| 4 (QREFELT % 117)) (SPADCALL |l| 5 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;krawtchoukK;5F;220|
        ((|n| (F)) (|b| (F)) (|c| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 50) |n| |b| |c| |z| (QREFELT % 221))) 

(SDEFUN |FSPECF;e_krawtchoukK|
        ((|n| (F)) (|b| (F)) (|c| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |n| (|spadConstant| % 92) (QREFELT % 94))
          (|spadConstant| % 96))
         ('T (SPADCALL (QREFELT % 50) (LIST |n| |b| |c| |z|) (QREFELT % 121))))) 

(SDEFUN |FSPECF;el_krawtchoukK| ((|l| (|List| F)) (% (F)))
        (|FSPECF;e_krawtchoukK| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) (SPADCALL |l| 3 (QREFELT % 117))
         (SPADCALL |l| 4 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;meixnerM;5F;223|
        ((|n| (F)) (|b| (F)) (|c| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 52) |n| |b| |c| |z| (QREFELT % 221))) 

(SDEFUN |FSPECF;eMeixnerM| ((|n| (F)) (|b| (F)) (|c| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |n| (|spadConstant| % 92) (QREFELT % 94))
          (|spadConstant| % 96))
         ((SPADCALL |n| (|spadConstant| % 96) (QREFELT % 94))
          (SPADCALL
           (SPADCALL
            (SPADCALL (SPADCALL |c| (|spadConstant| % 96) (QREFELT % 130)) |z|
                      (QREFELT % 122))
            (SPADCALL |c| |b| (QREFELT % 122)) (QREFELT % 131))
           (|spadConstant| % 96) (QREFELT % 123)))
         ('T (SPADCALL (QREFELT % 52) (LIST |n| |b| |c| |z|) (QREFELT % 121))))) 

(SDEFUN |FSPECF;elMeixnerM| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eMeixnerM| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) (SPADCALL |l| 3 (QREFELT % 117))
         (SPADCALL |l| 4 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;meixnerP;5F;226|
        ((|n| (F)) (|b| (F)) (|c| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 53) |n| |b| |c| |z| (QREFELT % 221))) 

(SDEFUN |FSPECF;e_meixnerP| ((|n| (F)) (|b| (F)) (|c| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |n| (|spadConstant| % 92) (QREFELT % 94))
          (|spadConstant| % 96))
         ('T (SPADCALL (QREFELT % 53) (LIST |n| |b| |c| |z|) (QREFELT % 121))))) 

(SDEFUN |FSPECF;el_meixnerP| ((|l| (|List| F)) (% (F)))
        (|FSPECF;e_meixnerP| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) (SPADCALL |l| 3 (QREFELT % 117))
         (SPADCALL |l| 4 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;racahR;7F;229|
        ((|n| (F)) (|a| (F)) (|b| (F)) (|c| (F)) (|d| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 54) |n| |a| |b| |c| |d| |z| (QREFELT % 232))) 

(SDEFUN |FSPECF;e_racahR|
        ((|n| (F)) (|a| (F)) (|b| (F)) (|c| (F)) (|d| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |n| (|spadConstant| % 92) (QREFELT % 94))
          (|spadConstant| % 96))
         ('T
          (SPADCALL (QREFELT % 54) (LIST |n| |a| |b| |c| |d| |z|)
                    (QREFELT % 121))))) 

(SDEFUN |FSPECF;el_racahR| ((|l| (|List| F)) (% (F)))
        (|FSPECF;e_racahR| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) (SPADCALL |l| 3 (QREFELT % 117))
         (SPADCALL |l| 4 (QREFELT % 117)) (SPADCALL |l| 5 (QREFELT % 117))
         (SPADCALL |l| 6 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;wilsonW;7F;232|
        ((|n| (F)) (|a| (F)) (|b| (F)) (|c| (F)) (|d| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 55) |n| |a| |b| |c| |d| |z| (QREFELT % 232))) 

(SDEFUN |FSPECF;e_wilsonW|
        ((|n| (F)) (|a| (F)) (|b| (F)) (|c| (F)) (|d| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |n| (|spadConstant| % 96) (QREFELT % 94))
          (|spadConstant| % 96))
         ('T
          (SPADCALL (QREFELT % 55) (LIST |n| |a| |b| |c| |d| |z|)
                    (QREFELT % 121))))) 

(SDEFUN |FSPECF;el_wilsonW| ((|l| (|List| F)) (% (F)))
        (|FSPECF;e_wilsonW| (SPADCALL |l| 1 (QREFELT % 117))
         (SPADCALL |l| 2 (QREFELT % 117)) (SPADCALL |l| 3 (QREFELT % 117))
         (SPADCALL |l| 4 (QREFELT % 117)) (SPADCALL |l| 5 (QREFELT % 117))
         (SPADCALL |l| 6 (QREFELT % 117)) %)) 

(SDEFUN |FSPECF;belong?;BoB;235| ((|op| (|BasicOperator|)) (% (|Boolean|)))
        (SPADCALL |op| (QREFELT % 8) (QREFELT % 235))) 

(SDEFUN |FSPECF;operator;2Bo;236|
        ((|op| (|BasicOperator|)) (% (|BasicOperator|)))
        (COND ((SPADCALL |op| '|abs| (QREFELT % 237)) (QREFELT % 13))
              ((SPADCALL |op| '|sign| (QREFELT % 237)) (QREFELT % 14))
              ((SPADCALL |op| '|unitStep| (QREFELT % 237)) (QREFELT % 15))
              ((SPADCALL |op| '|ceiling| (QREFELT % 237)) (QREFELT % 16))
              ((SPADCALL |op| '|floor| (QREFELT % 237)) (QREFELT % 17))
              ((SPADCALL |op| '|fractionPart| (QREFELT % 237)) (QREFELT % 18))
              ((SPADCALL |op| '|diracDelta| (QREFELT % 237)) (QREFELT % 19))
              ((SPADCALL |op| '|conjugate| (QREFELT % 237)) (QREFELT % 20))
              ((SPADCALL |op| '|Gamma| (QREFELT % 237)) (QREFELT % 21))
              ((SPADCALL |op| '|Gamma2| (QREFELT % 237)) (QREFELT % 22))
              ((SPADCALL |op| '|Beta| (QREFELT % 237)) (QREFELT % 23))
              ((SPADCALL |op| '|Beta3| (QREFELT % 237)) (QREFELT % 24))
              ((SPADCALL |op| '|digamma| (QREFELT % 237)) (QREFELT % 25))
              ((SPADCALL |op| '|polygamma| (QREFELT % 237)) (QREFELT % 26))
              ((SPADCALL |op| '|besselJ| (QREFELT % 237)) (QREFELT % 27))
              ((SPADCALL |op| '|besselY| (QREFELT % 237)) (QREFELT % 28))
              ((SPADCALL |op| '|besselI| (QREFELT % 237)) (QREFELT % 29))
              ((SPADCALL |op| '|besselK| (QREFELT % 237)) (QREFELT % 30))
              ((SPADCALL |op| '|airyAi| (QREFELT % 237)) (QREFELT % 31))
              ((SPADCALL |op| '|airyAiPrime| (QREFELT % 237)) (QREFELT % 32))
              ((SPADCALL |op| '|airyBi| (QREFELT % 237)) (QREFELT % 33))
              ((SPADCALL |op| '|airyBiPrime| (QREFELT % 237)) (QREFELT % 34))
              ((SPADCALL |op| '|lambertW| (QREFELT % 237)) (QREFELT % 35))
              ((SPADCALL |op| '|polylog| (QREFELT % 237)) (QREFELT % 36))
              ((SPADCALL |op| '|weierstrassP| (QREFELT % 237)) (QREFELT % 37))
              ((SPADCALL |op| '|weierstrassPPrime| (QREFELT % 237))
               (QREFELT % 38))
              ((SPADCALL |op| '|weierstrassSigma| (QREFELT % 237))
               (QREFELT % 39))
              ((SPADCALL |op| '|weierstrassZeta| (QREFELT % 237))
               (QREFELT % 40))
              ((SPADCALL |op| '|hypergeometricF| (QREFELT % 237))
               (QREFELT % 41))
              ((SPADCALL |op| '|meijerG| (QREFELT % 237)) (QREFELT % 42))
              ((SPADCALL |op| '|weierstrassPInverse| (QREFELT % 237))
               (QREFELT % 124))
              ((SPADCALL |op| '|whittakerM| (QREFELT % 237)) (QREFELT % 138))
              ((SPADCALL |op| '|whittakerW| (QREFELT % 237)) (QREFELT % 142))
              ((SPADCALL |op| '|angerJ| (QREFELT % 237)) (QREFELT % 144))
              ((SPADCALL |op| '|weberE| (QREFELT % 237)) (QREFELT % 148))
              ((SPADCALL |op| '|struveH| (QREFELT % 237)) (QREFELT % 152))
              ((SPADCALL |op| '|struveL| (QREFELT % 237)) (QREFELT % 155))
              ((SPADCALL |op| '|hankelH1| (QREFELT % 237)) (QREFELT % 157))
              ((SPADCALL |op| '|hankelH2| (QREFELT % 237)) (QREFELT % 159))
              ((SPADCALL |op| '|lommelS1| (QREFELT % 237)) (QREFELT % 161))
              ((SPADCALL |op| '|lommelS2| (QREFELT % 237)) (QREFELT % 163))
              ((SPADCALL |op| '|kummerM| (QREFELT % 237)) (QREFELT % 165))
              ((SPADCALL |op| '|kummerU| (QREFELT % 237)) (QREFELT % 167))
              ((SPADCALL |op| '|legendreP| (QREFELT % 237)) (QREFELT % 169))
              ((SPADCALL |op| '|legendreQ| (QREFELT % 237)) (QREFELT % 171))
              ((SPADCALL |op| '|kelvinBei| (QREFELT % 237)) (QREFELT % 173))
              ((SPADCALL |op| '|kelvinBer| (QREFELT % 237)) (QREFELT % 176))
              ((SPADCALL |op| '|kelvinKei| (QREFELT % 237)) (QREFELT % 177))
              ((SPADCALL |op| '|kelvinKer| (QREFELT % 237)) (QREFELT % 180))
              ((SPADCALL |op| '|ellipticK| (QREFELT % 237)) (QREFELT % 181))
              ((SPADCALL |op| '|ellipticE| (QREFELT % 237)) (QREFELT % 188))
              ((SPADCALL |op| '|ellipticE2| (QREFELT % 237)) (QREFELT % 189))
              ((SPADCALL |op| '|ellipticF| (QREFELT % 237)) (QREFELT % 197))
              ((SPADCALL |op| '|ellipticPi| (QREFELT % 237)) (QREFELT % 198))
              ((SPADCALL |op| '|jacobiSn| (QREFELT % 237)) (QREFELT % 200))
              ((SPADCALL |op| '|jacobiCn| (QREFELT % 237)) (QREFELT % 209))
              ((SPADCALL |op| '|jacobiDn| (QREFELT % 237)) (QREFELT % 210))
              ((SPADCALL |op| '|jacobiZeta| (QREFELT % 237)) (QREFELT % 211))
              ((SPADCALL |op| '|jacobiTheta| (QREFELT % 237)) (QREFELT % 213))
              ((SPADCALL |op| '|lerchPhi| (QREFELT % 237)) (QREFELT % 215))
              ((SPADCALL |op| '|riemannZeta| (QREFELT % 237)) (QREFELT % 217))
              ((SPADCALL |op| '|charlierC| (QREFELT % 237)) (QREFELT % 43))
              ((SPADCALL |op| '|hahn_p| (QREFELT % 237)) (QREFELT % 44))
              ((SPADCALL |op| '|hahnQ| (QREFELT % 237)) (QREFELT % 45))
              ((SPADCALL |op| '|hahnR| (QREFELT % 237)) (QREFELT % 46))
              ((SPADCALL |op| '|hahnS| (QREFELT % 237)) (QREFELT % 47))
              ((SPADCALL |op| '|hermiteH| (QREFELT % 237)) (QREFELT % 48))
              ((SPADCALL |op| '|jacobiP| (QREFELT % 237)) (QREFELT % 49))
              ((SPADCALL |op| '|krawtchoukK| (QREFELT % 237)) (QREFELT % 50))
              ((SPADCALL |op| '|laguerreL| (QREFELT % 237)) (QREFELT % 51))
              ((SPADCALL |op| '|meixnerM| (QREFELT % 237)) (QREFELT % 52))
              ((SPADCALL |op| '|meixnerP| (QREFELT % 237)) (QREFELT % 53))
              ((SPADCALL |op| '|racahR| (QREFELT % 237)) (QREFELT % 54))
              ((SPADCALL |op| '|wilsonW| (QREFELT % 237)) (QREFELT % 55))
              ((SPADCALL |op| '|%logGamma| (QREFELT % 237)) (QREFELT % 56))
              ((SPADCALL |op| '|%eis| (QREFELT % 237)) (QREFELT % 57))
              ((SPADCALL |op| '|%erfs| (QREFELT % 237)) (QREFELT % 58))
              ((SPADCALL |op| '|%erfis| (QREFELT % 237)) (QREFELT % 59))
              ('T (|error| "Not a special operator")))) 

(SDEFUN |FSPECF;iGamma| ((|x| (F)) (% (F)))
        (COND ((SPADCALL |x| (|spadConstant| % 96) (QREFELT % 94)) |x|)
              ('T (SPADCALL (QREFELT % 21) |x| (QREFELT % 239))))) 

(SDEFUN |FSPECF;iabs| ((|x| (F)) (% (F)))
        (COND ((SPADCALL |x| (QREFELT % 240)) (|spadConstant| % 92))
              ((SPADCALL |x| (QREFELT % 241)) (|spadConstant| % 96))
              ((SPADCALL |x| (QREFELT % 13) (QREFELT % 202)) |x|)
              ((SPADCALL |x| (QREFELT % 20) (QREFELT % 202))
               (SPADCALL (QREFELT % 13)
                         (SPADCALL
                          (SPADCALL (SPADCALL |x| (QREFELT % 204))
                                    (QREFELT % 206))
                          1 (QREFELT % 117))
                         (QREFELT % 239)))
              ((SPADCALL |x| (|spadConstant| % 92) (QREFELT % 242))
               (SPADCALL (QREFELT % 13) (SPADCALL |x| (QREFELT % 132))
                         (QREFELT % 239)))
              ('T (SPADCALL (QREFELT % 13) |x| (QREFELT % 239))))) 

(SDEFUN |FSPECF;iconjugate| ((|x| (F)) (% (F)))
        (COND ((SPADCALL |x| (QREFELT % 240)) (|spadConstant| % 92))
              ((SPADCALL |x| (QREFELT % 20) (QREFELT % 202))
               (SPADCALL
                (SPADCALL (SPADCALL |x| (QREFELT % 204)) (QREFELT % 206)) 1
                (QREFELT % 117)))
              ((SPADCALL |x| (QREFELT % 13) (QREFELT % 202)) |x|)
              ('T (SPADCALL (QREFELT % 20) |x| (QREFELT % 239))))) 

(SDEFUN |FSPECF;retract_Q;FU;240|
        ((|x| (F)) (% (|Union| (|Fraction| (|Integer|)) "failed")))
        (SPADCALL |x| (QREFELT % 244))) 

(SDEFUN |FSPECF;coerce_Q;FF;241| ((|x| (|Fraction| (|Integer|))) (% (F)))
        (SPADCALL |x| (QREFELT % 246))) 

(PUT '|FSPECF;retract_Q;FU;242| '|SPADreplace| '(XLAM (|x|) (CONS 1 "failed"))) 

(SDEFUN |FSPECF;retract_Q;FU;242|
        ((|x| (F)) (% (|Union| (|Fraction| (|Integer|)) "failed")))
        (CONS 1 "failed")) 

(SDEFUN |FSPECF;isign| ((|x| (F)) (% (F)))
        (SPROG
         ((|r1| (|Integer|))
          (|ru| (|Union| (|Fraction| (|Integer|)) "failed")))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT % 240)) (|spadConstant| % 92))
                (#1='T
                 (SEQ (LETT |ru| (SPADCALL |x| (QREFELT % 245)))
                      (EXIT
                       (COND
                        ((QEQCAR |ru| 0)
                         (SEQ
                          (LETT |r1| (SPADCALL (QCDR |ru|) (QREFELT % 248)))
                          (EXIT
                           (COND ((EQL |r1| 1) (|spadConstant| % 96))
                                 ((EQL |r1| 0) (|spadConstant| % 92))
                                 (#1#
                                  (SPADCALL (|spadConstant| % 96)
                                            (QREFELT % 132)))))))
                        ((SPADCALL |x| (QREFELT % 14) (QREFELT % 202)) |x|)
                        (#1#
                         (SPADCALL (QREFELT % 14) |x| (QREFELT % 239))))))))))) 

(SDEFUN |FSPECF;i_unitStep| ((|x| (F)) (% (F)))
        (SPROG
         ((|r1| (|Integer|))
          (|ru| (|Union| (|Fraction| (|Integer|)) "failed")))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT % 240)) (|spadConstant| % 96))
                ('T
                 (SEQ (LETT |ru| (SPADCALL |x| (QREFELT % 245)))
                      (EXIT
                       (COND
                        ((QEQCAR |ru| 0)
                         (SEQ
                          (LETT |r1| (SPADCALL (QCDR |ru|) (QREFELT % 248)))
                          (EXIT
                           (COND
                            ((OR (EQL |r1| 1) (EQL |r1| 0))
                             (|spadConstant| % 96))
                            ('T (|spadConstant| % 92))))))
                        ((OR (SPADCALL |x| (QREFELT % 13) (QREFELT % 202))
                             (OR (SPADCALL |x| (QREFELT % 15) (QREFELT % 202))
                                 (SPADCALL |x| (QREFELT % 18)
                                           (QREFELT % 202))))
                         (|spadConstant| % 96))
                        ('T
                         (SPADCALL (QREFELT % 15) |x| (QREFELT % 239))))))))))) 

(SDEFUN |FSPECF;i_ceiling| ((|x| (F)) (% (F)))
        (SPROG ((|ru| (|Union| (|Fraction| (|Integer|)) "failed")))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT % 240)) (|spadConstant| % 92))
                      ('T
                       (SEQ (LETT |ru| (SPADCALL |x| (QREFELT % 245)))
                            (EXIT
                             (COND
                              ((QEQCAR |ru| 0)
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (QCDR |ru|) (QREFELT % 250))
                                 (QREFELT % 251))
                                (QREFELT % 247)))
                              ((OR
                                (SPADCALL |x| (QREFELT % 16) (QREFELT % 202))
                                (SPADCALL |x| (QREFELT % 17) (QREFELT % 202)))
                               |x|)
                              ('T
                               (SPADCALL (QREFELT % 16) |x|
                                         (QREFELT % 239))))))))))) 

(SDEFUN |FSPECF;i_floor| ((|x| (F)) (% (F)))
        (SPROG ((|ru| (|Union| (|Fraction| (|Integer|)) "failed")))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT % 240)) (|spadConstant| % 92))
                      (#1='T
                       (SEQ (LETT |ru| (SPADCALL |x| (QREFELT % 245)))
                            (EXIT
                             (COND
                              ((QEQCAR |ru| 0)
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (QCDR |ru|) (QREFELT % 252))
                                 (QREFELT % 251))
                                (QREFELT % 247)))
                              ((OR
                                (SPADCALL |x| (QREFELT % 16) (QREFELT % 202))
                                (SPADCALL |x| (QREFELT % 17) (QREFELT % 202)))
                               |x|)
                              ((SPADCALL |x| (QREFELT % 18) (QREFELT % 202))
                               (|spadConstant| % 92))
                              (#1#
                               (SPADCALL (QREFELT % 17) |x|
                                         (QREFELT % 239))))))))))) 

(SDEFUN |FSPECF;i_fractionPart| ((|x| (F)) (% (F)))
        (SPROG ((|ru| (|Union| (|Fraction| (|Integer|)) "failed")))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT % 240)) (|spadConstant| % 92))
                      (#1='T
                       (SEQ (LETT |ru| (SPADCALL |x| (QREFELT % 245)))
                            (EXIT
                             (COND
                              ((QEQCAR |ru| 0)
                               (SPADCALL (SPADCALL (QCDR |ru|) (QREFELT % 253))
                                         (QREFELT % 247)))
                              ((OR
                                (SPADCALL |x| (QREFELT % 16) (QREFELT % 202))
                                (SPADCALL |x| (QREFELT % 17) (QREFELT % 202)))
                               (|spadConstant| % 92))
                              ((SPADCALL |x| (QREFELT % 18) (QREFELT % 202))
                               |x|)
                              (#1#
                               (SPADCALL (QREFELT % 18) |x|
                                         (QREFELT % 239))))))))))) 

(SDEFUN |FSPECF;i_diracDelta| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 19) |x| (QREFELT % 239))) 

(SDEFUN |FSPECF;iBeta| ((|x| (F)) (|y| (F)) (% (F)))
        (SPADCALL (QREFELT % 23) (LIST |x| |y|) (QREFELT % 121))) 

(SDEFUN |FSPECF;idigamma| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 25) |x| (QREFELT % 239))) 

(SDEFUN |FSPECF;iiipolygamma| ((|n| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 26) (LIST |n| |x|) (QREFELT % 121))) 

(SDEFUN |FSPECF;iiiBesselJ| ((|x| (F)) (|y| (F)) (% (F)))
        (SPADCALL (QREFELT % 27) (LIST |x| |y|) (QREFELT % 121))) 

(SDEFUN |FSPECF;iiiBesselY| ((|x| (F)) (|y| (F)) (% (F)))
        (SPADCALL (QREFELT % 28) (LIST |x| |y|) (QREFELT % 121))) 

(SDEFUN |FSPECF;iiiBesselI| ((|x| (F)) (|y| (F)) (% (F)))
        (SPADCALL (QREFELT % 29) (LIST |x| |y|) (QREFELT % 121))) 

(SDEFUN |FSPECF;iiiBesselK| ((|x| (F)) (|y| (F)) (% (F)))
        (SPADCALL (QREFELT % 30) (LIST |x| |y|) (QREFELT % 121))) 

(SDEFUN |FSPECF;iAiryAi;2F;256| ((|x| (F)) (% (F)))
        (COND
         ((SPADCALL |x| (QREFELT % 240))
          (SPADCALL (|spadConstant| % 96)
                    (SPADCALL
                     (SPADCALL (SPADCALL 3 (QREFELT % 98)) (QREFELT % 115)
                               (QREFELT % 154))
                     (SPADCALL (QREFELT % 115) (QREFELT % 69)) (QREFELT % 122))
                    (QREFELT % 131)))
         ('T (SPADCALL (QREFELT % 31) |x| (QREFELT % 239))))) 

(SDEFUN |FSPECF;iAiryAiPrime;2F;257| ((|x| (F)) (% (F)))
        (COND
         ((SPADCALL |x| (QREFELT % 240))
          (SPADCALL
           (SPADCALL (|spadConstant| % 96)
                     (SPADCALL
                      (SPADCALL (SPADCALL 3 (QREFELT % 98)) (QREFELT % 110)
                                (QREFELT % 154))
                      (SPADCALL (QREFELT % 110) (QREFELT % 69))
                      (QREFELT % 122))
                     (QREFELT % 131))
           (QREFELT % 132)))
         ('T (SPADCALL (QREFELT % 32) |x| (QREFELT % 239))))) 

(SDEFUN |FSPECF;iAiryBi;2F;258| ((|x| (F)) (% (F)))
        (COND
         ((SPADCALL |x| (QREFELT % 240))
          (SPADCALL (|spadConstant| % 96)
                    (SPADCALL
                     (SPADCALL (SPADCALL 3 (QREFELT % 98)) (QREFELT % 112)
                               (QREFELT % 154))
                     (SPADCALL (QREFELT % 115) (QREFELT % 69)) (QREFELT % 122))
                    (QREFELT % 131)))
         ('T (SPADCALL (QREFELT % 33) |x| (QREFELT % 239))))) 

(SDEFUN |FSPECF;iAiryBiPrime;2F;259| ((|x| (F)) (% (F)))
        (COND
         ((SPADCALL |x| (QREFELT % 240))
          (SPADCALL
           (SPADCALL (SPADCALL 3 (QREFELT % 98)) (QREFELT % 112)
                     (QREFELT % 154))
           (SPADCALL (QREFELT % 110) (QREFELT % 69)) (QREFELT % 131)))
         ('T (SPADCALL (QREFELT % 34) |x| (QREFELT % 239))))) 

(SDEFUN |FSPECF;iAiryAi;2F;260| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 31) |x| (QREFELT % 239))) 

(SDEFUN |FSPECF;iAiryAiPrime;2F;261| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 32) |x| (QREFELT % 239))) 

(SDEFUN |FSPECF;iAiryBi;2F;262| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 33) |x| (QREFELT % 239))) 

(SDEFUN |FSPECF;iAiryBiPrime;2F;263| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 34) |x| (QREFELT % 239))) 

(SDEFUN |FSPECF;iLambertW;2F;264| ((|x| (F)) (% (F)))
        (COND ((SPADCALL |x| (QREFELT % 240)) (|spadConstant| % 92))
              ((SPADCALL |x| (SPADCALL (|spadConstant| % 96) (QREFELT % 258))
                         (QREFELT % 94))
               (|spadConstant| % 96))
              ((SPADCALL |x|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| % 96) (QREFELT % 132))
                           (QREFELT % 258))
                          (QREFELT % 132))
                         (QREFELT % 94))
               (SPADCALL (|spadConstant| % 96) (QREFELT % 132)))
              ('T (SPADCALL (QREFELT % 35) |x| (QREFELT % 239))))) 

(SDEFUN |FSPECF;iLambertW;2F;265| ((|x| (F)) (% (F)))
        (COND ((SPADCALL |x| (QREFELT % 240)) (|spadConstant| % 92))
              ('T (SPADCALL (QREFELT % 35) |x| (QREFELT % 239))))) 

(SDEFUN |FSPECF;iiiPolylog| ((|s| (F)) (|x| (F)) (% (F)))
        (COND
         ((SPADCALL |x| (|spadConstant| % 92) (QREFELT % 94))
          (|spadConstant| % 92))
         ('T (SPADCALL (QREFELT % 36) (LIST |s| |x|) (QREFELT % 121))))) 

(SDEFUN |FSPECF;iiPolylog;3F;267| ((|s| (F)) (|x| (F)) (% (F)))
        (COND
         ((SPADCALL |s| (|spadConstant| % 96) (QREFELT % 94))
          (SPADCALL
           (SPADCALL (SPADCALL (|spadConstant| % 96) |x| (QREFELT % 130))
                     (QREFELT % 260))
           (QREFELT % 132)))
         ((SPADCALL |s| (SPADCALL 2 (QREFELT % 98)) (QREFELT % 94))
          (SPADCALL (SPADCALL (|spadConstant| % 96) |x| (QREFELT % 130))
                    (QREFELT % 261)))
         ('T (|FSPECF;iiiPolylog| |s| |x| %)))) 

(SDEFUN |FSPECF;iiPolylog;3F;268| ((|s| (F)) (|x| (F)) (% (F)))
        (COND
         ((SPADCALL |s| (|spadConstant| % 96) (QREFELT % 94))
          (SPADCALL
           (SPADCALL (SPADCALL (|spadConstant| % 96) |x| (QREFELT % 130))
                     (QREFELT % 260))
           (QREFELT % 132)))
         ('T (|FSPECF;iiiPolylog| |s| |x| %)))) 

(SDEFUN |FSPECF;iiPolylog;3F;269| ((|s| (F)) (|x| (F)) (% (F)))
        (|FSPECF;iiiPolylog| |s| |x| %)) 

(SDEFUN |FSPECF;iPolylog| ((|l| (|List| F)) (% (F)))
        (SPADCALL (|SPADfirst| |l|) (SPADCALL |l| (QREFELT % 263))
                  (QREFELT % 262))) 

(SDEFUN |FSPECF;iWeierstrassP| ((|g2| (F)) (|g3| (F)) (|x| (F)) (% (F)))
        (SPROG ((#1=#:G887 NIL) (|args| (|List| F)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |x| (QREFELT % 124) (QREFELT % 202))
                    (SEQ
                     (LETT |args|
                           (SPADCALL (SPADCALL |x| (QREFELT % 204))
                                     (QREFELT % 206)))
                     (EXIT
                      (COND
                       ((SPADCALL |g2| (SPADCALL |args| 1 (QREFELT % 117))
                                  (QREFELT % 94))
                        (COND
                         ((SPADCALL |g3| (SPADCALL |args| 2 (QREFELT % 117))
                                    (QREFELT % 94))
                          (PROGN
                           (LETT #1# (SPADCALL |args| 3 (QREFELT % 117)))
                           (GO #2=#:G886))))))))))
                  (EXIT
                   (SPADCALL (QREFELT % 37) (LIST |g2| |g3| |x|)
                             (QREFELT % 121)))))
                #2# (EXIT #1#)))) 

(SDEFUN |FSPECF;iWeierstrassPPrime| ((|g2| (F)) (|g3| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 38) (LIST |g2| |g3| |x|) (QREFELT % 121))) 

(SDEFUN |FSPECF;iWeierstrassSigma| ((|g2| (F)) (|g3| (F)) (|x| (F)) (% (F)))
        (COND
         ((SPADCALL |x| (|spadConstant| % 92) (QREFELT % 94))
          (|spadConstant| % 92))
         ('T (SPADCALL (QREFELT % 39) (LIST |g2| |g3| |x|) (QREFELT % 121))))) 

(SDEFUN |FSPECF;iWeierstrassZeta| ((|g2| (F)) (|g3| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 40) (LIST |g2| |g3| |x|) (QREFELT % 121))) 

(SDEFUN |FSPECF;iiabs;2F;275| ((|x| (F)) (% (F)))
        (SPROG
         ((#1=#:G908 NIL) (|b| #2=(|Union| R "failed")) (|a| #2#)
          (|f| (|Fraction| (|Polynomial| R)))
          (|r| (|Union| (|Fraction| (|Polynomial| R)) "failed")))
         (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 265)))
              (EXIT
               (COND ((QEQCAR |r| 1) (|FSPECF;iabs| |x| %))
                     (#3='T
                      (SEQ
                       (EXIT
                        (SEQ (LETT |f| (QCDR |r|))
                             (SEQ
                              (LETT |a|
                                    (SPADCALL (SPADCALL |f| (QREFELT % 268))
                                              (QREFELT % 270)))
                              (EXIT
                               (COND
                                ((QEQCAR |a| 1)
                                 (PROGN
                                  (LETT #1# (|FSPECF;iabs| |x| %))
                                  (GO #4=#:G905)))
                                (#3#
                                 (SEQ
                                  (LETT |b|
                                        (SPADCALL
                                         (SPADCALL |f| (QREFELT % 271))
                                         (QREFELT % 270)))
                                  (EXIT
                                   (COND
                                    ((QEQCAR |b| 1)
                                     (PROGN
                                      (LETT #1# (|FSPECF;iabs| |x| %))
                                      (GO #4#))))))))))
                             (EXIT
                              (SPADCALL
                               (SPADCALL (SPADCALL (QCDR |a|) (QREFELT % 272))
                                         (QREFELT % 273))
                               (SPADCALL (SPADCALL (QCDR |b|) (QREFELT % 272))
                                         (QREFELT % 273))
                               (QREFELT % 131)))))
                       #4# (EXIT #1#)))))))) 

(SDEFUN |FSPECF;iiabs;2F;276| ((|x| (F)) (% (F))) (|FSPECF;iabs| |x| %)) 

(SDEFUN |FSPECF;iiconjugate;2F;277| ((|x| (F)) (% (F)))
        (SPROG ((#1=#:G960 NIL))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |x| (QREFELT % 20) (QREFELT % 202))
                   (SPADCALL
                    (SPADCALL (SPADCALL |x| (QREFELT % 204)) (QREFELT % 206)) 1
                    (QREFELT % 117)))
                  ((SPADCALL |x| (QREFELT % 13) (QREFELT % 202)) |x|)
                  ((QEQCAR (SPADCALL |x| (QREFELT % 276)) 0)
                   (|FSPECF;iconjugate| |x| %))
                  ('T
                   (SEQ
                    (LETT |x|
                          (SPADCALL |x| (SPADCALL |x| (QREFELT % 278))
                                    (SPADCALL
                                     (CONS #'|FSPECF;iiconjugate;2F;277!0| %)
                                     (SPADCALL |x| (QREFELT % 278))
                                     (QREFELT % 291))
                                    (QREFELT % 292)))
                    (COND
                     ((|HasSignature| (QREFELT % 6)
                                      (LIST '|conjugate|
                                            (LIST (|devaluate| (QREFELT % 6))
                                                  (|devaluate|
                                                   (QREFELT % 6)))))
                      (LETT |x|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (ELT % 293)
                                        (SPADCALL |x| (QREFELT % 295))
                                        (QREFELT % 297))
                              (QREFELT % 298))
                             (SPADCALL
                              (SPADCALL (ELT % 293)
                                        (SPADCALL |x| (QREFELT % 299))
                                        (QREFELT % 297))
                              (QREFELT % 298))
                             (QREFELT % 131)))))
                    (EXIT (PROGN (LETT #1# |x|) (GO #2=#:G959)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiconjugate;2F;277!0| ((|k| NIL) (% NIL))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |k| (QREFELT % 280)) (|spadConstant| % 281)
                     (QREFELT % 282))
           (EXIT (|FSPECF;iconjugate| (SPADCALL |k| (QREFELT % 283)) %)))
          ((SPADCALL (SPADCALL |k| (QREFELT % 280)) (|spadConstant| % 284)
                     (QREFELT % 282))
           (COND
            ((QEQCAR (SPADCALL (SPADCALL |k| (QREFELT % 283)) (QREFELT % 276))
                     0)
             (EXIT (|FSPECF;iconjugate| (SPADCALL |k| (QREFELT % 283)) %))))))
         (EXIT (SPADCALL (ELT % 285) |k| (QREFELT % 287))))) 

(SDEFUN |FSPECF;iiGamma;2F;278| ((|x| (F)) (% (F)))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 300)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|FSPECF;iGamma| |x| %))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT % 301))
                                      (QREFELT % 273)))))))) 

(SDEFUN |FSPECF;iiBeta;LF;279| ((|l| (|List| F)) (% (F)))
        (SPROG ((#1=#:G973 NIL) (|s| #2=(|Union| R "failed")) (|r| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT % 300)))
                       (EXIT
                        (COND
                         ((QEQCAR |r| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iBeta| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT % 263)) %))
                           (GO #3=#:G971)))
                         ('T
                          (SEQ
                           (LETT |s|
                                 (SPADCALL (SPADCALL |l| (QREFELT % 263))
                                           (QREFELT % 300)))
                           (EXIT
                            (COND
                             ((QEQCAR |s| 1)
                              (PROGN
                               (LETT #1#
                                     (|FSPECF;iBeta| (|SPADfirst| |l|)
                                      (SPADCALL |l| (QREFELT % 263)) %))
                               (GO #3#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT % 303))
                             (QREFELT % 273)))))
                #3# (EXIT #1#)))) 

(SDEFUN |FSPECF;iidigamma;2F;280| ((|x| (F)) (% (F)))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 300)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|FSPECF;idigamma| |x| %))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT % 305))
                                      (QREFELT % 273)))))))) 

(SDEFUN |FSPECF;iipolygamma;LF;281| ((|l| (|List| F)) (% (F)))
        (SPROG ((#1=#:G986 NIL) (|r| #2=(|Union| R "failed")) (|s| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |s| (SPADCALL (|SPADfirst| |l|) (QREFELT % 300)))
                       (EXIT
                        (COND
                         ((QEQCAR |s| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iiipolygamma| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT % 263)) %))
                           (GO #3=#:G984)))
                         ('T
                          (SEQ
                           (LETT |r|
                                 (SPADCALL (SPADCALL |l| (QREFELT % 263))
                                           (QREFELT % 300)))
                           (EXIT
                            (COND
                             ((QEQCAR |r| 1)
                              (PROGN
                               (LETT #1#
                                     (|FSPECF;iiipolygamma| (|SPADfirst| |l|)
                                      (SPADCALL |l| (QREFELT % 263)) %))
                               (GO #3#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |s|) (QCDR |r|) (QREFELT % 307))
                             (QREFELT % 273)))))
                #3# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiBesselJ;LF;282| ((|l| (|List| F)) (% (F)))
        (SPROG ((#1=#:G994 NIL) (|s| #2=(|Union| R "failed")) (|r| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT % 300)))
                       (EXIT
                        (COND
                         ((QEQCAR |r| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iiiBesselJ| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT % 263)) %))
                           (GO #3=#:G992)))
                         ('T
                          (SEQ
                           (LETT |s|
                                 (SPADCALL (SPADCALL |l| (QREFELT % 263))
                                           (QREFELT % 300)))
                           (EXIT
                            (COND
                             ((QEQCAR |s| 1)
                              (PROGN
                               (LETT #1#
                                     (|FSPECF;iiiBesselJ| (|SPADfirst| |l|)
                                      (SPADCALL |l| (QREFELT % 263)) %))
                               (GO #3#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT % 309))
                             (QREFELT % 273)))))
                #3# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiBesselY;LF;283| ((|l| (|List| F)) (% (F)))
        (SPROG ((#1=#:G1002 NIL) (|s| #2=(|Union| R "failed")) (|r| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT % 300)))
                       (EXIT
                        (COND
                         ((QEQCAR |r| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iiiBesselY| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT % 263)) %))
                           (GO #3=#:G1000)))
                         ('T
                          (SEQ
                           (LETT |s|
                                 (SPADCALL (SPADCALL |l| (QREFELT % 263))
                                           (QREFELT % 300)))
                           (EXIT
                            (COND
                             ((QEQCAR |s| 1)
                              (PROGN
                               (LETT #1#
                                     (|FSPECF;iiiBesselY| (|SPADfirst| |l|)
                                      (SPADCALL |l| (QREFELT % 263)) %))
                               (GO #3#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT % 311))
                             (QREFELT % 273)))))
                #3# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiBesselI;LF;284| ((|l| (|List| F)) (% (F)))
        (SPROG ((#1=#:G1010 NIL) (|s| #2=(|Union| R "failed")) (|r| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT % 300)))
                       (EXIT
                        (COND
                         ((QEQCAR |r| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iiiBesselI| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT % 263)) %))
                           (GO #3=#:G1008)))
                         ('T
                          (SEQ
                           (LETT |s|
                                 (SPADCALL (SPADCALL |l| (QREFELT % 263))
                                           (QREFELT % 300)))
                           (EXIT
                            (COND
                             ((QEQCAR |s| 1)
                              (PROGN
                               (LETT #1#
                                     (|FSPECF;iiiBesselI| (|SPADfirst| |l|)
                                      (SPADCALL |l| (QREFELT % 263)) %))
                               (GO #3#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT % 313))
                             (QREFELT % 273)))))
                #3# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiBesselK;LF;285| ((|l| (|List| F)) (% (F)))
        (SPROG ((#1=#:G1018 NIL) (|s| #2=(|Union| R "failed")) (|r| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT % 300)))
                       (EXIT
                        (COND
                         ((QEQCAR |r| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iiiBesselK| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT % 263)) %))
                           (GO #3=#:G1016)))
                         ('T
                          (SEQ
                           (LETT |s|
                                 (SPADCALL (SPADCALL |l| (QREFELT % 263))
                                           (QREFELT % 300)))
                           (EXIT
                            (COND
                             ((QEQCAR |s| 1)
                              (PROGN
                               (LETT #1#
                                     (|FSPECF;iiiBesselK| (|SPADfirst| |l|)
                                      (SPADCALL |l| (QREFELT % 263)) %))
                               (GO #3#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT % 315))
                             (QREFELT % 273)))))
                #3# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiAiryAi;2F;286| ((|x| (F)) (% (F)))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 300)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (SPADCALL |x| (QREFELT % 254)))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT % 317))
                                      (QREFELT % 273)))))))) 

(SDEFUN |FSPECF;iiAiryAiPrime;2F;287| ((|x| (F)) (% (F)))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 300)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (SPADCALL |x| (QREFELT % 255)))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT % 319))
                                      (QREFELT % 273)))))))) 

(SDEFUN |FSPECF;iiAiryBi;2F;288| ((|x| (F)) (% (F)))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 300)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (SPADCALL |x| (QREFELT % 256)))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT % 321))
                                      (QREFELT % 273)))))))) 

(SDEFUN |FSPECF;iiAiryBiPrime;2F;289| ((|x| (F)) (% (F)))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 300)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (SPADCALL |x| (QREFELT % 257)))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT % 323))
                                      (QREFELT % 273)))))))) 

(SDEFUN |FSPECF;iiGamma;2F;290| ((|x| (F)) (% (F)))
        (SPROG ((#1=#:G1046 NIL) (|r| (|Union| (|Integer|) "failed")))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 326)))
                       (EXIT
                        (COND
                         ((QEQCAR |r| 0)
                          (COND
                           ((>= (QCDR |r|) 1)
                            (PROGN
                             (LETT #1#
                                   (SPADCALL
                                    (SPADCALL (- (QCDR |r|) 1) (QREFELT % 327))
                                    (QREFELT % 98)))
                             (GO #2=#:G1044))))))))
                  (EXIT (|FSPECF;iGamma| |x| %))))
                #2# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiGamma;2F;291| ((|x| (F)) (% (F))) (|FSPECF;iGamma| |x| %)) 

(SDEFUN |FSPECF;iiBeta;LF;292| ((|l| (|List| F)) (% (F)))
        (|FSPECF;iBeta| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT % 263)) %)) 

(SDEFUN |FSPECF;iidigamma;2F;293| ((|x| (F)) (% (F))) (|FSPECF;idigamma| |x| %)) 

(SDEFUN |FSPECF;iipolygamma;LF;294| ((|l| (|List| F)) (% (F)))
        (|FSPECF;iiipolygamma| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT % 263))
         %)) 

(SDEFUN |FSPECF;iiBesselJ;LF;295| ((|l| (|List| F)) (% (F)))
        (|FSPECF;iiiBesselJ| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT % 263))
         %)) 

(SDEFUN |FSPECF;iiBesselY;LF;296| ((|l| (|List| F)) (% (F)))
        (|FSPECF;iiiBesselY| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT % 263))
         %)) 

(SDEFUN |FSPECF;iiBesselI;LF;297| ((|l| (|List| F)) (% (F)))
        (|FSPECF;iiiBesselI| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT % 263))
         %)) 

(SDEFUN |FSPECF;iiBesselK;LF;298| ((|l| (|List| F)) (% (F)))
        (|FSPECF;iiiBesselK| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT % 263))
         %)) 

(SDEFUN |FSPECF;iiAiryAi;2F;299| ((|x| (F)) (% (F)))
        (SPADCALL |x| (QREFELT % 254))) 

(SDEFUN |FSPECF;iiAiryAiPrime;2F;300| ((|x| (F)) (% (F)))
        (SPADCALL |x| (QREFELT % 255))) 

(SDEFUN |FSPECF;iiAiryBi;2F;301| ((|x| (F)) (% (F)))
        (SPADCALL |x| (QREFELT % 256))) 

(SDEFUN |FSPECF;iiAiryBiPrime;2F;302| ((|x| (F)) (% (F)))
        (SPADCALL |x| (QREFELT % 257))) 

(SDEFUN |FSPECF;iiWeierstrassP| ((|l| (|List| F)) (% (F)))
        (|FSPECF;iWeierstrassP| (|SPADfirst| |l|)
         (SPADCALL |l| (QREFELT % 263)) (SPADCALL |l| (QREFELT % 328)) %)) 

(SDEFUN |FSPECF;iiWeierstrassPPrime| ((|l| (|List| F)) (% (F)))
        (|FSPECF;iWeierstrassPPrime| (|SPADfirst| |l|)
         (SPADCALL |l| (QREFELT % 263)) (SPADCALL |l| (QREFELT % 328)) %)) 

(SDEFUN |FSPECF;iiWeierstrassSigma| ((|l| (|List| F)) (% (F)))
        (|FSPECF;iWeierstrassSigma| (|SPADfirst| |l|)
         (SPADCALL |l| (QREFELT % 263)) (SPADCALL |l| (QREFELT % 328)) %)) 

(SDEFUN |FSPECF;iiWeierstrassZeta| ((|l| (|List| F)) (% (F)))
        (|FSPECF;iWeierstrassZeta| (|SPADfirst| |l|)
         (SPADCALL |l| (QREFELT % 263)) (SPADCALL |l| (QREFELT % 328)) %)) 

(SDEFUN |FSPECF;diff1| ((|op| (|BasicOperator|)) (|n| (F)) (|x| (F)) (% (F)))
        (SPROG ((|dm| (F)))
               (SEQ
                (LETT |dm|
                      (SPADCALL (SPADCALL (QREFELT % 118)) (QREFELT % 119)))
                (EXIT
                 (SPADCALL (QREFELT % 106)
                           (LIST
                            (SPADCALL |op| (LIST |dm| |x|) (QREFELT % 102))
                            |dm| |n|)
                           (QREFELT % 121)))))) 

(SDEFUN |FSPECF;iBesselJ| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (SPROG ((|x| (F)) (|n| (F)))
               (SEQ (LETT |n| (|SPADfirst| |l|))
                    (LETT |x| (SPADCALL |l| (QREFELT % 263)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |n| |t| (QREFELT % 120))
                                (|FSPECF;diff1| (QREFELT % 27) |n| |x| %)
                                (QREFELT % 122))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT % 120))
                                 (QREFELT % 109) (QREFELT % 122))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| % 96) (QREFELT % 130))
                         |x| (QREFELT % 77))
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| % 96) (QREFELT % 123))
                         |x| (QREFELT % 77))
                        (QREFELT % 130))
                       (QREFELT % 122))
                      (QREFELT % 123)))))) 

(SDEFUN |FSPECF;iBesselY| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (SPROG ((|x| (F)) (|n| (F)))
               (SEQ (LETT |n| (|SPADfirst| |l|))
                    (LETT |x| (SPADCALL |l| (QREFELT % 263)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |n| |t| (QREFELT % 120))
                                (|FSPECF;diff1| (QREFELT % 28) |n| |x| %)
                                (QREFELT % 122))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT % 120))
                                 (QREFELT % 109) (QREFELT % 122))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| % 96) (QREFELT % 130))
                         |x| (QREFELT % 78))
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| % 96) (QREFELT % 123))
                         |x| (QREFELT % 78))
                        (QREFELT % 130))
                       (QREFELT % 122))
                      (QREFELT % 123)))))) 

(SDEFUN |FSPECF;iBesselI| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (SPROG ((|x| (F)) (|n| (F)))
               (SEQ (LETT |n| (|SPADfirst| |l|))
                    (LETT |x| (SPADCALL |l| (QREFELT % 263)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |n| |t| (QREFELT % 120))
                                (|FSPECF;diff1| (QREFELT % 29) |n| |x| %)
                                (QREFELT % 122))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT % 120))
                                 (QREFELT % 109) (QREFELT % 122))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| % 96) (QREFELT % 130))
                         |x| (QREFELT % 79))
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| % 96) (QREFELT % 123))
                         |x| (QREFELT % 79))
                        (QREFELT % 123))
                       (QREFELT % 122))
                      (QREFELT % 123)))))) 

(SDEFUN |FSPECF;iBesselK| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (SPROG ((|x| (F)) (|n| (F)))
               (SEQ (LETT |n| (|SPADfirst| |l|))
                    (LETT |x| (SPADCALL |l| (QREFELT % 263)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |n| |t| (QREFELT % 120))
                                (|FSPECF;diff1| (QREFELT % 30) |n| |x| %)
                                (QREFELT % 122))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT % 120))
                                 (QREFELT % 109) (QREFELT % 122))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| % 96) (QREFELT % 130))
                         |x| (QREFELT % 80))
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| % 96) (QREFELT % 123))
                         |x| (QREFELT % 80))
                        (QREFELT % 123))
                       (QREFELT % 122))
                      (QREFELT % 130)))))) 

(SDEFUN |FSPECF;dPolylog| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (SPROG ((|x| (F)) (|s| (F)))
               (SEQ (LETT |s| (|SPADfirst| |l|))
                    (LETT |x| (SPADCALL |l| (QREFELT % 263)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |s| |t| (QREFELT % 120))
                                (|FSPECF;diff1| (QREFELT % 36) |s| |x| %)
                                (QREFELT % 122))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT % 120))
                                 (SPADCALL
                                  (SPADCALL |s| (|spadConstant| % 96)
                                            (QREFELT % 130))
                                  |x| (QREFELT % 86))
                                 (QREFELT % 122))
                       |x| (QREFELT % 131))
                      (QREFELT % 123)))))) 

(SDEFUN |FSPECF;ipolygamma| ((|l| (|List| F)) (|x| (|Symbol|)) (% (F)))
        (SPROG ((|y| (F)) (|n| (F)))
               (SEQ
                (COND
                 ((SPADCALL |x| (SPADCALL (|SPADfirst| |l|) (QREFELT % 331))
                            (QREFELT % 332))
                  (|error|
                   "cannot differentiate polygamma with respect to the first argument"))
                 ('T
                  (SEQ (LETT |n| (|SPADfirst| |l|))
                       (LETT |y| (SPADCALL |l| (QREFELT % 263)))
                       (EXIT
                        (SPADCALL (SPADCALL |y| |x| (QREFELT % 120))
                                  (SPADCALL
                                   (SPADCALL |n| (|spadConstant| % 96)
                                             (QREFELT % 123))
                                   |y| (QREFELT % 76))
                                  (QREFELT % 122))))))))) 

(SDEFUN |FSPECF;iBetaGrad1| ((|l| (|List| F)) (% (F)))
        (SPROG ((|y| (F)) (|x| (F)))
               (SEQ (LETT |x| (|SPADfirst| |l|))
                    (LETT |y| (SPADCALL |l| (QREFELT % 263)))
                    (EXIT
                     (SPADCALL (SPADCALL |x| |y| (QREFELT % 72))
                               (SPADCALL (SPADCALL |x| (QREFELT % 75))
                                         (SPADCALL
                                          (SPADCALL |x| |y| (QREFELT % 123))
                                          (QREFELT % 75))
                                         (QREFELT % 130))
                               (QREFELT % 122)))))) 

(SDEFUN |FSPECF;iBetaGrad2| ((|l| (|List| F)) (% (F)))
        (SPROG ((|y| (F)) (|x| (F)))
               (SEQ (LETT |x| (|SPADfirst| |l|))
                    (LETT |y| (SPADCALL |l| (QREFELT % 263)))
                    (EXIT
                     (SPADCALL (SPADCALL |x| |y| (QREFELT % 72))
                               (SPADCALL (SPADCALL |y| (QREFELT % 75))
                                         (SPADCALL
                                          (SPADCALL |x| |y| (QREFELT % 123))
                                          (QREFELT % 75))
                                         (QREFELT % 130))
                               (QREFELT % 122)))))) 

(SDEFUN |FSPECF;elBeta3| ((|l| (|List| F)) (% (F)))
        (SPROG ((|x| (F)))
               (SEQ (LETT |x| (SPADCALL |l| 1 (QREFELT % 117)))
                    (EXIT
                     (COND
                      ((SPADCALL |x| (|spadConstant| % 92) (QREFELT % 94))
                       (|spadConstant| % 92))
                      ('T (SPADCALL (QREFELT % 24) |l| (QREFELT % 121)))))))) 

(SDEFUN |FSPECF;eBeta3Grad1| ((|l| (|List| F)) (% (F)))
        (SPROG ((|b| (F)) (|a| (F)) (|x| (F)))
               (SEQ (LETT |x| (SPADCALL |l| 1 (QREFELT % 117)))
                    (LETT |a| (SPADCALL |l| 2 (QREFELT % 117)))
                    (LETT |b| (SPADCALL |l| 3 (QREFELT % 117)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL |x|
                                (SPADCALL |a| (|spadConstant| % 96)
                                          (QREFELT % 130))
                                (QREFELT % 154))
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 96) |x| (QREFELT % 130))
                       (SPADCALL |b| (|spadConstant| % 96) (QREFELT % 130))
                       (QREFELT % 154))
                      (QREFELT % 122)))))) 

(SDEFUN |FSPECF;eBeta3Grad2| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|sb| (|SegmentBinding| F)) (|ss| (|Segment| F)) (|xd| (F))
          (|dummy_s| (|Symbol|)) (|b| (F)) (|a| (F)) (|x| (F)))
         (SEQ (LETT |x| (SPADCALL |l| 1 (QREFELT % 117)))
              (LETT |a| (SPADCALL |l| 2 (QREFELT % 117)))
              (LETT |b| (SPADCALL |l| 3 (QREFELT % 117)))
              (LETT |dummy_s| (SPADCALL (QREFELT % 118)))
              (LETT |xd| (SPADCALL |dummy_s| (QREFELT % 119)))
              (LETT |ss| (SPADCALL (|spadConstant| % 92) |x| (QREFELT % 334)))
              (LETT |sb| (SPADCALL |dummy_s| |ss| (QREFELT % 336)))
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |xd| (QREFELT % 260))
                           (SPADCALL |xd|
                                     (SPADCALL |a| (|spadConstant| % 96)
                                               (QREFELT % 130))
                                     (QREFELT % 154))
                           (QREFELT % 122))
                 (SPADCALL
                  (SPADCALL (|spadConstant| % 96) |xd| (QREFELT % 130))
                  (SPADCALL |b| (|spadConstant| % 96) (QREFELT % 130))
                  (QREFELT % 154))
                 (QREFELT % 122))
                |sb| (QREFELT % 338)))))) 

(SDEFUN |FSPECF;eBeta3Grad3| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|sb| (|SegmentBinding| F)) (|ss| (|Segment| F)) (|xd| (F))
          (|dummy_s| (|Symbol|)) (|b| (F)) (|a| (F)) (|x| (F)))
         (SEQ (LETT |x| (SPADCALL |l| 1 (QREFELT % 117)))
              (LETT |a| (SPADCALL |l| 2 (QREFELT % 117)))
              (LETT |b| (SPADCALL |l| 3 (QREFELT % 117)))
              (LETT |dummy_s| (SPADCALL (QREFELT % 118)))
              (LETT |xd| (SPADCALL |dummy_s| (QREFELT % 119)))
              (LETT |ss| (SPADCALL (|spadConstant| % 92) |x| (QREFELT % 334)))
              (LETT |sb| (SPADCALL |dummy_s| |ss| (QREFELT % 336)))
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (|spadConstant| % 96) |xd| (QREFELT % 130))
                   (QREFELT % 260))
                  (SPADCALL |xd|
                            (SPADCALL |a| (|spadConstant| % 96)
                                      (QREFELT % 130))
                            (QREFELT % 154))
                  (QREFELT % 122))
                 (SPADCALL
                  (SPADCALL (|spadConstant| % 96) |xd| (QREFELT % 130))
                  (SPADCALL |b| (|spadConstant| % 96) (QREFELT % 130))
                  (QREFELT % 154))
                 (QREFELT % 122))
                |sb| (QREFELT % 338)))))) 

(SDEFUN |FSPECF;inBeta3| ((|li| (|List| (|InputForm|))) (% (|InputForm|)))
        (SPADCALL (CONS (SPADCALL '|Beta| (QREFELT % 193)) |li|)
                  (QREFELT % 194))) 

(SDEFUN |FSPECF;iGamma2| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (SPROG ((|x| (F)) (|a| (F)))
               (SEQ (LETT |a| (|SPADfirst| |l|))
                    (LETT |x| (SPADCALL |l| (QREFELT % 263)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |a| |t| (QREFELT % 120))
                                (|FSPECF;diff1| (QREFELT % 22) |a| |x| %)
                                (QREFELT % 122))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT % 120))
                                 (SPADCALL |x|
                                           (SPADCALL |a| (|spadConstant| % 96)
                                                     (QREFELT % 130))
                                           (QREFELT % 154))
                                 (QREFELT % 122))
                       (SPADCALL (SPADCALL |x| (QREFELT % 132))
                                 (QREFELT % 258))
                       (QREFELT % 122))
                      (QREFELT % 130)))))) 

(SDEFUN |FSPECF;inGamma2| ((|li| (|List| (|InputForm|))) (% (|InputForm|)))
        (SPADCALL (CONS (SPADCALL '|Gamma| (QREFELT % 193)) |li|)
                  (QREFELT % 194))) 

(SDEFUN |FSPECF;dLambertW| ((|x| (F)) (% (F)))
        (SPROG ((|lw| (F)))
               (SEQ (LETT |lw| (SPADCALL |x| (QREFELT % 85)))
                    (EXIT
                     (SPADCALL |lw|
                               (SPADCALL |x|
                                         (SPADCALL (|spadConstant| % 96) |lw|
                                                   (QREFELT % 123))
                                         (QREFELT % 122))
                               (QREFELT % 131)))))) 

(SDEFUN |FSPECF;iWeierstrassPGrad1| ((|l| (|List| F)) (% (F)))
        (SPROG ((|wp| (F)) (|delta| (F)) (|x| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ (LETT |g2| (|SPADfirst| |l|))
                    (LETT |g3| (SPADCALL |l| (QREFELT % 263)))
                    (LETT |x| (SPADCALL |l| (QREFELT % 328)))
                    (LETT |delta|
                          (SPADCALL (SPADCALL |g2| 3 (QREFELT % 129))
                                    (SPADCALL 27
                                              (SPADCALL |g3| 2 (QREFELT % 129))
                                              (QREFELT % 114))
                                    (QREFELT % 130)))
                    (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT % 87)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT % 88))
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL 9 (QREFELT % 109)
                                                 (QREFELT % 114))
                                       |g3| (QREFELT % 122))
                                      (SPADCALL |g2| |g3| |x| (QREFELT % 90))
                                      (QREFELT % 122))
                                     (QREFELT % 132))
                                    (SPADCALL
                                     (SPADCALL (QREFELT % 111)
                                               (SPADCALL |g2| 2
                                                         (QREFELT % 129))
                                               (QREFELT % 122))
                                     |x| (QREFELT % 122))
                                    (QREFELT % 123))
                                   (QREFELT % 122))
                         (SPADCALL (SPADCALL 9 |g3| (QREFELT % 114))
                                   (SPADCALL |wp| 2 (QREFELT % 129))
                                   (QREFELT % 122))
                         (QREFELT % 130))
                        (SPADCALL
                         (SPADCALL (QREFELT % 109)
                                   (SPADCALL |g2| 2 (QREFELT % 129))
                                   (QREFELT % 122))
                         |wp| (QREFELT % 122))
                        (QREFELT % 123))
                       (SPADCALL
                        (SPADCALL (SPADCALL 3 (QREFELT % 109) (QREFELT % 114))
                                  |g2| (QREFELT % 122))
                        |g3| (QREFELT % 122))
                       (QREFELT % 123))
                      |delta| (QREFELT % 131)))))) 

(SDEFUN |FSPECF;iWeierstrassPGrad2| ((|l| (|List| F)) (% (F)))
        (SPROG ((|wp| (F)) (|delta| (F)) (|x| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ (LETT |g2| (|SPADfirst| |l|))
                    (LETT |g3| (SPADCALL |l| (QREFELT % 263)))
                    (LETT |x| (SPADCALL |l| (QREFELT % 328)))
                    (LETT |delta|
                          (SPADCALL (SPADCALL |g2| 3 (QREFELT % 129))
                                    (SPADCALL 27
                                              (SPADCALL |g3| 2 (QREFELT % 129))
                                              (QREFELT % 114))
                                    (QREFELT % 130)))
                    (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT % 87)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT % 88))
                                   (SPADCALL
                                    (SPADCALL (SPADCALL 3 |g2| (QREFELT % 114))
                                              (SPADCALL |g2| |g3| |x|
                                                        (QREFELT % 90))
                                              (QREFELT % 122))
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL 9 (QREFELT % 109)
                                                (QREFELT % 114))
                                      |g3| (QREFELT % 122))
                                     |x| (QREFELT % 122))
                                    (QREFELT % 130))
                                   (QREFELT % 122))
                         (SPADCALL (SPADCALL 6 |g2| (QREFELT % 114))
                                   (SPADCALL |wp| 2 (QREFELT % 129))
                                   (QREFELT % 122))
                         (QREFELT % 123))
                        (SPADCALL (SPADCALL 9 |g3| (QREFELT % 114)) |wp|
                                  (QREFELT % 122))
                        (QREFELT % 130))
                       (SPADCALL |g2| 2 (QREFELT % 129)) (QREFELT % 130))
                      |delta| (QREFELT % 131)))))) 

(SDEFUN |FSPECF;iWeierstrassPGrad3| ((|l| (|List| F)) (% (F)))
        (SPADCALL (|SPADfirst| |l|) (SPADCALL |l| (QREFELT % 263))
                  (SPADCALL |l| (QREFELT % 328)) (QREFELT % 88))) 

(SDEFUN |FSPECF;iWeierstrassPPrimeGrad1| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|wpp2| (F)) (|wpp| (F)) (|wp| (F)) (|delta| (F)) (|x| (F))
          (|g3| (F)) (|g2| (F)))
         (SEQ (LETT |g2| (|SPADfirst| |l|))
              (LETT |g3| (SPADCALL |l| (QREFELT % 263)))
              (LETT |x| (SPADCALL |l| (QREFELT % 328)))
              (LETT |delta|
                    (SPADCALL (SPADCALL |g2| 3 (QREFELT % 129))
                              (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT % 129))
                                        (QREFELT % 114))
                              (QREFELT % 130)))
              (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT % 87)))
              (LETT |wpp| (SPADCALL |g2| |g3| |x| (QREFELT % 88)))
              (LETT |wpp2|
                    (SPADCALL
                     (SPADCALL 6 (SPADCALL |wp| 2 (QREFELT % 129))
                               (QREFELT % 114))
                     (SPADCALL (QREFELT % 109) |g2| (QREFELT % 122))
                     (QREFELT % 130)))
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL |wpp2|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL 9 (QREFELT % 109) (QREFELT % 114))
                                 |g3| (QREFELT % 122))
                                (SPADCALL |g2| |g3| |x| (QREFELT % 90))
                                (QREFELT % 122))
                               (QREFELT % 132))
                              (SPADCALL
                               (SPADCALL (QREFELT % 111)
                                         (SPADCALL |g2| 2 (QREFELT % 129))
                                         (QREFELT % 122))
                               |x| (QREFELT % 122))
                              (QREFELT % 123))
                             (QREFELT % 122))
                   (SPADCALL |wpp|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL 9 (QREFELT % 109) (QREFELT % 114))
                                |g3| (QREFELT % 122))
                               |wp| (QREFELT % 122))
                              (SPADCALL (QREFELT % 111)
                                        (SPADCALL |g2| 2 (QREFELT % 129))
                                        (QREFELT % 122))
                              (QREFELT % 123))
                             (QREFELT % 122))
                   (QREFELT % 123))
                  (SPADCALL
                   (SPADCALL (SPADCALL 18 |g3| (QREFELT % 114)) |wp|
                             (QREFELT % 122))
                   |wpp| (QREFELT % 122))
                  (QREFELT % 130))
                 (SPADCALL
                  (SPADCALL (QREFELT % 109) (SPADCALL |g2| 2 (QREFELT % 129))
                            (QREFELT % 122))
                  |wpp| (QREFELT % 122))
                 (QREFELT % 123))
                |delta| (QREFELT % 131)))))) 

(SDEFUN |FSPECF;iWeierstrassPPrimeGrad2| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|wpp2| (F)) (|wpp| (F)) (|wp| (F)) (|delta| (F)) (|x| (F))
          (|g3| (F)) (|g2| (F)))
         (SEQ (LETT |g2| (|SPADfirst| |l|))
              (LETT |g3| (SPADCALL |l| (QREFELT % 263)))
              (LETT |x| (SPADCALL |l| (QREFELT % 328)))
              (LETT |delta|
                    (SPADCALL (SPADCALL |g2| 3 (QREFELT % 129))
                              (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT % 129))
                                        (QREFELT % 114))
                              (QREFELT % 130)))
              (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT % 87)))
              (LETT |wpp| (SPADCALL |g2| |g3| |x| (QREFELT % 88)))
              (LETT |wpp2|
                    (SPADCALL
                     (SPADCALL 6 (SPADCALL |wp| 2 (QREFELT % 129))
                               (QREFELT % 114))
                     (SPADCALL (QREFELT % 109) |g2| (QREFELT % 122))
                     (QREFELT % 130)))
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL |wpp2|
                             (SPADCALL
                              (SPADCALL (SPADCALL 3 |g2| (QREFELT % 114))
                                        (SPADCALL |g2| |g3| |x| (QREFELT % 90))
                                        (QREFELT % 122))
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL 9 (QREFELT % 109) (QREFELT % 114))
                                |g3| (QREFELT % 122))
                               |x| (QREFELT % 122))
                              (QREFELT % 130))
                             (QREFELT % 122))
                   (SPADCALL |wpp|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (SPADCALL 3 |g2| (QREFELT % 114)) |wp|
                                         (QREFELT % 122))
                               (QREFELT % 132))
                              (SPADCALL
                               (SPADCALL 9 (QREFELT % 109) (QREFELT % 114))
                               |g3| (QREFELT % 122))
                              (QREFELT % 130))
                             (QREFELT % 122))
                   (QREFELT % 123))
                  (SPADCALL
                   (SPADCALL (SPADCALL 12 |g2| (QREFELT % 114)) |wp|
                             (QREFELT % 122))
                   |wpp| (QREFELT % 122))
                  (QREFELT % 123))
                 (SPADCALL (SPADCALL 9 |g3| (QREFELT % 114)) |wpp|
                           (QREFELT % 122))
                 (QREFELT % 130))
                |delta| (QREFELT % 131)))))) 

(SDEFUN |FSPECF;iWeierstrassPPrimeGrad3| ((|l| (|List| F)) (% (F)))
        (SPROG ((|g2| (F)))
               (SEQ (LETT |g2| (|SPADfirst| |l|))
                    (EXIT
                     (SPADCALL
                      (SPADCALL 6
                                (SPADCALL
                                 (SPADCALL |g2| (SPADCALL |l| (QREFELT % 263))
                                           (SPADCALL |l| (QREFELT % 328))
                                           (QREFELT % 87))
                                 2 (QREFELT % 150))
                                (QREFELT % 114))
                      (SPADCALL (QREFELT % 109) |g2| (QREFELT % 122))
                      (QREFELT % 130)))))) 

(SDEFUN |FSPECF;iWeierstrassSigmaGrad1| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|wsp2| (F)) (|wsp| (F)) (|wz| (F)) (|ws| (F)) (|delta| (F))
          (|x| (F)) (|g3| (F)) (|g2| (F)))
         (SEQ (LETT |g2| (|SPADfirst| |l|))
              (LETT |g3| (SPADCALL |l| (QREFELT % 263)))
              (LETT |x| (SPADCALL |l| (QREFELT % 328)))
              (LETT |delta|
                    (SPADCALL (SPADCALL |g2| 3 (QREFELT % 129))
                              (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT % 129))
                                        (QREFELT % 114))
                              (QREFELT % 130)))
              (LETT |ws| (SPADCALL |g2| |g3| |x| (QREFELT % 89)))
              (LETT |wz| (SPADCALL |g2| |g3| |x| (QREFELT % 90)))
              (LETT |wsp| (SPADCALL |wz| |ws| (QREFELT % 122)))
              (LETT |wsp2|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT % 87)) |ws|
                                (QREFELT % 122))
                      (QREFELT % 132))
                     (SPADCALL (SPADCALL |wz| 2 (QREFELT % 129)) |ws|
                               (QREFELT % 122))
                     (QREFELT % 123)))
              (EXIT
               (SPADCALL
                (SPADCALL (QREFELT % 111)
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (SPADCALL 9 |g3| (QREFELT % 114))
                                        |wsp2| (QREFELT % 122))
                              (QREFELT % 132))
                             (SPADCALL (SPADCALL |g2| 2 (QREFELT % 129)) |ws|
                                       (QREFELT % 122))
                             (QREFELT % 130))
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL 3 (QREFELT % 111) (QREFELT % 114))
                                |g2| (QREFELT % 122))
                               |g3| (QREFELT % 122))
                              (SPADCALL |x| 2 (QREFELT % 129)) (QREFELT % 122))
                             |ws| (QREFELT % 122))
                            (QREFELT % 130))
                           (SPADCALL
                            (SPADCALL (SPADCALL |g2| 2 (QREFELT % 129)) |x|
                                      (QREFELT % 122))
                            |wsp| (QREFELT % 122))
                           (QREFELT % 123))
                          (QREFELT % 122))
                |delta| (QREFELT % 131)))))) 

(SDEFUN |FSPECF;iWeierstrassSigmaGrad2| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|wsp2| (F)) (|wsp| (F)) (|wz| (F)) (|ws| (F)) (|delta| (F))
          (|x| (F)) (|g3| (F)) (|g2| (F)))
         (SEQ (LETT |g2| (|SPADfirst| |l|))
              (LETT |g3| (SPADCALL |l| (QREFELT % 263)))
              (LETT |x| (SPADCALL |l| (QREFELT % 328)))
              (LETT |delta|
                    (SPADCALL (SPADCALL |g2| 3 (QREFELT % 129))
                              (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT % 129))
                                        (QREFELT % 114))
                              (QREFELT % 130)))
              (LETT |ws| (SPADCALL |g2| |g3| |x| (QREFELT % 89)))
              (LETT |wz| (SPADCALL |g2| |g3| |x| (QREFELT % 90)))
              (LETT |wsp| (SPADCALL |wz| |ws| (QREFELT % 122)))
              (LETT |wsp2|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT % 87)) |ws|
                                (QREFELT % 122))
                      (QREFELT % 132))
                     (SPADCALL (SPADCALL |wz| 2 (QREFELT % 129)) |ws|
                               (QREFELT % 122))
                     (QREFELT % 123)))
              (EXIT
               (SPADCALL
                (SPADCALL (QREFELT % 109)
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (SPADCALL 3 |g2| (QREFELT % 114)) |wsp2|
                                       (QREFELT % 122))
                             (SPADCALL (SPADCALL 9 |g3| (QREFELT % 114)) |ws|
                                       (QREFELT % 122))
                             (QREFELT % 123))
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (QREFELT % 111)
                                        (SPADCALL |g2| 2 (QREFELT % 129))
                                        (QREFELT % 122))
                              (SPADCALL |x| 2 (QREFELT % 129)) (QREFELT % 122))
                             |ws| (QREFELT % 122))
                            (QREFELT % 123))
                           (SPADCALL
                            (SPADCALL (SPADCALL 9 |g3| (QREFELT % 114)) |x|
                                      (QREFELT % 122))
                            |wsp| (QREFELT % 122))
                           (QREFELT % 130))
                          (QREFELT % 122))
                |delta| (QREFELT % 131)))))) 

(SDEFUN |FSPECF;iWeierstrassSigmaGrad3| ((|l| (|List| F)) (% (F)))
        (SPROG ((|x| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ (LETT |g2| (|SPADfirst| |l|))
                    (LETT |g3| (SPADCALL |l| (QREFELT % 263)))
                    (LETT |x| (SPADCALL |l| (QREFELT % 328)))
                    (EXIT
                     (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT % 90))
                               (SPADCALL |g2| |g3| |x| (QREFELT % 89))
                               (QREFELT % 122)))))) 

(SDEFUN |FSPECF;iWeierstrassZetaGrad1| ((|l| (|List| F)) (% (F)))
        (SPROG ((|wp| (F)) (|delta| (F)) (|x| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ (LETT |g2| (|SPADfirst| |l|))
                    (LETT |g3| (SPADCALL |l| (QREFELT % 263)))
                    (LETT |x| (SPADCALL |l| (QREFELT % 328)))
                    (LETT |delta|
                          (SPADCALL (SPADCALL |g2| 3 (QREFELT % 129))
                                    (SPADCALL 27
                                              (SPADCALL |g3| 2 (QREFELT % 129))
                                              (QREFELT % 114))
                                    (QREFELT % 130)))
                    (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT % 87)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (QREFELT % 109)
                                   (SPADCALL |g2| |g3| |x| (QREFELT % 90))
                                   (QREFELT % 122))
                         (SPADCALL
                          (SPADCALL (SPADCALL 9 |g3| (QREFELT % 114)) |wp|
                                    (QREFELT % 122))
                          (SPADCALL (QREFELT % 109)
                                    (SPADCALL |g2| 2 (QREFELT % 129))
                                    (QREFELT % 122))
                          (QREFELT % 123))
                         (QREFELT % 122))
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (QREFELT % 109) |g2| (QREFELT % 122)) |x|
                          (QREFELT % 122))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (QREFELT % 109) |g2| (QREFELT % 122)) |wp|
                           (QREFELT % 122))
                          (SPADCALL
                           (SPADCALL 3 (QREFELT % 111) (QREFELT % 114)) |g3|
                           (QREFELT % 122))
                          (QREFELT % 123))
                         (QREFELT % 122))
                        (QREFELT % 130))
                       (SPADCALL
                        (SPADCALL (SPADCALL 9 (QREFELT % 111) (QREFELT % 114))
                                  |g3| (QREFELT % 122))
                        (SPADCALL |g2| |g3| |x| (QREFELT % 88))
                        (QREFELT % 122))
                       (QREFELT % 123))
                      |delta| (QREFELT % 131)))))) 

(SDEFUN |FSPECF;iWeierstrassZetaGrad2| ((|l| (|List| F)) (% (F)))
        (SPROG ((|wp| (F)) (|delta| (F)) (|x| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ (LETT |g2| (|SPADfirst| |l|))
                    (LETT |g3| (SPADCALL |l| (QREFELT % 263)))
                    (LETT |x| (SPADCALL |l| (QREFELT % 328)))
                    (LETT |delta|
                          (SPADCALL (SPADCALL |g2| 3 (QREFELT % 129))
                                    (SPADCALL 27
                                              (SPADCALL |g3| 2 (QREFELT % 129))
                                              (QREFELT % 114))
                                    (QREFELT % 130)))
                    (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT % 87)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL 3 (SPADCALL |g2| |g3| |x| (QREFELT % 90))
                                    (QREFELT % 114))
                          (SPADCALL (SPADCALL |g2| |wp| (QREFELT % 122))
                                    (SPADCALL
                                     (SPADCALL 3 (QREFELT % 109)
                                               (QREFELT % 114))
                                     |g3| (QREFELT % 122))
                                    (QREFELT % 123))
                          (QREFELT % 122))
                         (QREFELT % 132))
                        (SPADCALL
                         (SPADCALL (QREFELT % 109) |x| (QREFELT % 122))
                         (SPADCALL
                          (SPADCALL (SPADCALL 9 |g3| (QREFELT % 114)) |wp|
                                    (QREFELT % 122))
                          (SPADCALL (QREFELT % 109)
                                    (SPADCALL |g2| 2 (QREFELT % 129))
                                    (QREFELT % 122))
                          (QREFELT % 123))
                         (QREFELT % 122))
                        (QREFELT % 123))
                       (SPADCALL
                        (SPADCALL (SPADCALL 3 (QREFELT % 109) (QREFELT % 114))
                                  |g2| (QREFELT % 122))
                        (SPADCALL |g2| |g3| |x| (QREFELT % 88))
                        (QREFELT % 122))
                       (QREFELT % 130))
                      |delta| (QREFELT % 131)))))) 

(SDEFUN |FSPECF;iWeierstrassZetaGrad3| ((|l| (|List| F)) (% (F)))
        (SPADCALL
         (SPADCALL (|SPADfirst| |l|) (SPADCALL |l| (QREFELT % 263))
                   (SPADCALL |l| (QREFELT % 328)) (QREFELT % 87))
         (QREFELT % 132))) 

(SDEFUN |FSPECF;dconjugate| ((|lo| (|List| (|OutputForm|))) (% (|OutputForm|)))
        (SPADCALL (SPADCALL |lo| 1 (QREFELT % 341)) (QREFELT % 342))) 

(SDEFUN |FSPECF;get_int_listf| ((|lf| (|List| F)) (% (|List| (|Integer|))))
        (SPADCALL (ELT % 345) |lf| (QREFELT % 349))) 

(SDEFUN |FSPECF;replace_i|
        ((|lp| (|List| F)) (|v| (F)) (|i| (|NonNegativeInteger|))
         (% (|List| F)))
        (SPROG ((#1=#:G1179 NIL))
               (SPADCALL
                (SPADCALL |lp|
                          (PROG1 (LETT #1# (- |i| 1))
                            (|check_subtype2| (>= #1# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #1#))
                          (QREFELT % 350))
                (CONS |v| (SPADCALL |lp| |i| (QREFELT % 351)))
                (QREFELT % 100)))) 

(SDEFUN |FSPECF;iiHypergeometricF;LF;339| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((#1=#:G1185 NIL) (#2=#:G1186 NIL) (|q| #3=(|Integer|)) (|p| #3#)
          (|pqi| (|List| (|Integer|))) (|pq| (|List| F))
          (|nn| (|NonNegativeInteger|)) (#4=#:G1181 NIL) (|z| (F))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (LENGTH |l|))
                (LETT |z| (SPADCALL |l| (- |n| 2) (QREFELT % 117)))
                (COND
                 ((SPADCALL |z| (|spadConstant| % 92) (QREFELT % 94))
                  (SEQ
                   (EXIT
                    (SEQ
                     (LETT |nn|
                           (PROG1 (LETT #4# (- |n| 2))
                             (|check_subtype2| (>= #4# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #4#)))
                     (LETT |pq| (SPADCALL |l| |nn| (QREFELT % 351)))
                     (LETT |pqi| (|FSPECF;get_int_listf| |pq| %))
                     (LETT |p| (|SPADfirst| |pqi|))
                     (LETT |q| (|SPADfirst| (CDR |pqi|)))
                     (EXIT
                      (COND
                       ((<= |p| (+ |q| 1))
                        (PROGN
                         (LETT #1#
                               (PROGN
                                (LETT #2# (|spadConstant| % 96))
                                (GO #5=#:G1184)))
                         (GO #6=#:G1182)))))))
                   #6# (EXIT #1#))))
                (EXIT (SPADCALL (QREFELT % 41) |l| (QREFELT % 121)))))
          #5# (EXIT #2#)))) 

(SDEFUN |FSPECF;idvsum|
        ((|op| (|BasicOperator|)) (|n| (|Integer|)) (|l| (|List| F))
         (|x| (|Symbol|)) (% (F)))
        (SPROG
         ((|res| (F)) (|nl| (|List| F)) (|dm| (F)) (#1=#:G1194 NIL) (|i| NIL)
          (#2=#:G1195 NIL) (|a| NIL))
         (SEQ (LETT |res| (|spadConstant| % 92))
              (SEQ (LETT |a| NIL) (LETT #2# |l|) (LETT |i| 1) (LETT #1# |n|)
                   G190
                   (COND
                    ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                         (PROGN (LETT |a| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |dm|
                          (SPADCALL (SPADCALL (QREFELT % 118))
                                    (QREFELT % 119)))
                    (LETT |nl| (|FSPECF;replace_i| |l| |dm| |i| %))
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (SPADCALL
                                      (SPADCALL |a| |x| (QREFELT % 120))
                                      (SPADCALL (QREFELT % 106)
                                                (LIST
                                                 (SPADCALL |op| |nl|
                                                           (QREFELT % 102))
                                                 |dm| |a|)
                                                (QREFELT % 121))
                                      (QREFELT % 122))
                                     (QREFELT % 123)))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FSPECF;dvhypergeom| ((|l| #1=(|List| F)) (|x| (|Symbol|)) (% (F)))
        (SPROG
         ((|aprod| (F)) (|nl| (|List| F)) (|nl1| (|List| F)) (|nl0| (|List| F))
          (|bprod| (F)) (|b| (F)) (#2=#:G1206 NIL) (|i| NIL) (|a| (F))
          (#3=#:G1205 NIL) (|q| #4=(|Integer|)) (|p| #4#) (|z| (F))
          (|l1| (|List| F)) (|ol| #1#) (|pqi| (|List| (|Integer|)))
          (|pq| (|List| F)) (|nn| (|NonNegativeInteger|)) (#5=#:G1196 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |l|))
              (LETT |nn|
                    (PROG1 (LETT #5# (- |n| 2))
                      (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #5#)))
              (LETT |pq| (SPADCALL |l| |nn| (QREFELT % 351)))
              (LETT |pqi| (|FSPECF;get_int_listf| |pq| %)) (LETT |ol| |l|)
              (LETT |l| (SPADCALL |l| |nn| (QREFELT % 350)))
              (LETT |l1| (REVERSE |l|)) (LETT |z| (|SPADfirst| |l1|))
              (LETT |p| (|SPADfirst| |pqi|))
              (LETT |q| (|SPADfirst| (CDR |pqi|)))
              (LETT |aprod| (|spadConstant| % 96)) (LETT |nl| NIL)
              (SEQ (LETT |i| 1) (LETT #3# |p|) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ (LETT |a| (|SPADfirst| |l|))
                        (LETT |nl|
                              (CONS
                               (SPADCALL |a| (|spadConstant| % 96)
                                         (QREFELT % 123))
                               |nl|))
                        (LETT |aprod| (SPADCALL |aprod| |a| (QREFELT % 122)))
                        (EXIT (LETT |l| (CDR |l|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |bprod| (|spadConstant| % 96))
              (SEQ (LETT |i| 1) (LETT #2# |q|) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ (LETT |b| (|SPADfirst| |l|))
                        (LETT |nl|
                              (CONS
                               (SPADCALL |b| (|spadConstant| % 96)
                                         (QREFELT % 123))
                               |nl|))
                        (LETT |bprod| (SPADCALL |bprod| |b| (QREFELT % 122)))
                        (EXIT (LETT |l| (CDR |l|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |nl0| (NREVERSE |nl|)) (LETT |nl1| (CONS |z| |pq|))
              (LETT |nl| (SPADCALL |nl0| |nl1| (QREFELT % 100)))
              (LETT |aprod| (SPADCALL |aprod| |bprod| (QREFELT % 131)))
              (EXIT
               (SPADCALL (|FSPECF;idvsum| (QREFELT % 41) (- |nn| 1) |ol| |x| %)
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| |x| (QREFELT % 120)) |aprod|
                                    (QREFELT % 122))
                          (SPADCALL (QREFELT % 41) |nl| (QREFELT % 102))
                          (QREFELT % 122))
                         (QREFELT % 123)))))) 

(SDEFUN |FSPECF;add_pairs_to_list|
        ((|lp| (|List| (|List| F))) (|l| (|List| F)) (% (|List| F)))
        (SPROG ((#1=#:G1212 NIL) (|p| NIL))
               (SEQ
                (SEQ (LETT |p| NIL) (LETT #1# |lp|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (LENGTH |p|) 2 (QREFELT % 352))
                         (|error| "not a list of pairs"))
                        ('T
                         (LETT |l|
                               (CONS (SPADCALL |p| 2 (QREFELT % 117))
                                     (CONS (SPADCALL |p| 1 (QREFELT % 117))
                                           |l|)))))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT |l|)))) 

(SDEFUN |FSPECF;dvmeijer| ((|l| #1=(|List| F)) (|x| (|Symbol|)) (% (F)))
        (SPROG
         ((|om| (F)) (|nm| (F)) (|l2| (|List| F)) (|sign| (F)) (|na| (F))
          (|a| (F)) (|n2| (|Integer|)) (|n1| (|Integer|)) (|z| (F))
          (|l1| (|List| F)) (|nli| (|List| (|Integer|))) (|nl| (|List| F))
          (|l0| #1#) (|nn| (|NonNegativeInteger|)) (#2=#:G1213 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |l|))
              (LETT |nn|
                    (PROG1 (LETT #2# (- |n| 4))
                      (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #2#)))
              (LETT |l0| |l|) (LETT |nl| (SPADCALL |l| |nn| (QREFELT % 351)))
              (LETT |nli| (|FSPECF;get_int_listf| |nl| %))
              (LETT |l| (SPADCALL |l| |nn| (QREFELT % 350)))
              (LETT |l1| (REVERSE |l|)) (LETT |z| (|SPADfirst| |l1|))
              (LETT |n1| (|SPADfirst| |nli|))
              (LETT |n2| (SPADCALL |nli| 2 (QREFELT % 353)))
              (LETT |a| (|SPADfirst| |l|)) (LETT |sign| (|spadConstant| % 96))
              (COND
               ((OR (> |n1| 0) (> |n2| 0))
                (SEQ
                 (LETT |na|
                       (SPADCALL |a| (|spadConstant| % 96) (QREFELT % 130)))
                 (COND
                  ((EQL |n1| 0)
                   (LETT |sign|
                         (SPADCALL (|spadConstant| % 96) (QREFELT % 132)))))
                 (EXIT (LETT |l2| (CONS |na| (CDR |l|))))))
               ('T
                (SEQ (LETT |na| |a|)
                     (COND
                      ((> (SPADCALL |nli| 3 (QREFELT % 353)) 0)
                       (LETT |sign|
                             (SPADCALL (|spadConstant| % 96)
                                       (QREFELT % 132)))))
                     (EXIT
                      (LETT |l2|
                            (CONS
                             (SPADCALL |a| (|spadConstant| % 96)
                                       (QREFELT % 123))
                             (CDR |l|)))))))
              (LETT |nm|
                    (SPADCALL (QREFELT % 42)
                              (SPADCALL |l2| |nl| (QREFELT % 100))
                              (QREFELT % 102)))
              (LETT |om| (SPADCALL (QREFELT % 42) |l0| (QREFELT % 102)))
              (EXIT
               (SPADCALL (|FSPECF;idvsum| (QREFELT % 42) (- |nn| 1) |l0| |x| %)
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| |x| (QREFELT % 120))
                                    (SPADCALL
                                     (SPADCALL |sign| |nm| (QREFELT % 122))
                                     (SPADCALL |na| |om| (QREFELT % 122))
                                     (QREFELT % 123))
                                    (QREFELT % 122))
                          |z| (QREFELT % 131))
                         (QREFELT % 123)))))) 

(SDEFUN |FSPECF;get_if_list|
        ((|n| (|Integer|)) (|lf| (|List| (|InputForm|)))
         (% (|List| (|List| (|InputForm|)))))
        (SPROG ((|a| (|List| (|InputForm|))) (#1=#:G1226 NIL) (|i| NIL))
               (SEQ (LETT |a| NIL)
                    (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ (LETT |a| (CONS (|SPADfirst| |lf|) |a|))
                              (EXIT (LETT |lf| (CDR |lf|))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (LETT |a|
                          (CONS (SPADCALL '|construct| (QREFELT % 193))
                                (NREVERSE |a|)))
                    (EXIT (LIST |a| |lf|))))) 

(SDEFUN |FSPECF;get_if_lists|
        ((|ln| (|List| (|Integer|))) (|lf| (|List| (|InputForm|)))
         (% (|List| (|List| (|InputForm|)))))
        (SPROG
         ((|rl| (|List| (|List| (|InputForm|))))
          (|al| (|List| (|List| (|InputForm|)))) (#1=#:G1232 NIL) (|n| NIL))
         (SEQ (LETT |rl| NIL)
              (SEQ (LETT |n| NIL) (LETT #1# |ln|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |al| (|FSPECF;get_if_list| |n| |lf| %))
                        (LETT |rl| (CONS (|SPADfirst| |al|) |rl|))
                        (EXIT (LETT |lf| (|SPADfirst| (CDR |al|)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |rl| (NREVERSE |rl|)) (EXIT (CONS |lf| |rl|))))) 

(SDEFUN |FSPECF;get_int_listi|
        ((|n| (|Integer|)) (|lo| (|List| (|InputForm|)))
         (% (|List| (|Integer|))))
        (SPROG
         ((|rl| (|List| (|Integer|))) (|p| (|Integer|)) (#1=#:G1239 NIL)
          (|i| NIL) (|n0| (|NonNegativeInteger|)) (#2=#:G1233 NIL))
         (SEQ
          (LETT |n0|
                (PROG1 (LETT #2# (- (LENGTH |lo|) |n|))
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#)))
          (LETT |lo| (SPADCALL |lo| |n0| (QREFELT % 355))) (LETT |rl| NIL)
          (SEQ (LETT |i| 1) (LETT #1# |n|) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ (LETT |p| (SPADCALL (|SPADfirst| |lo|) (QREFELT % 357)))
                    (LETT |rl| (CONS |p| |rl|)) (EXIT (LETT |lo| (CDR |lo|))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (LETT |rl| (NREVERSE |rl|)) (EXIT |rl|)))) 

(SDEFUN |FSPECF;get_of_list|
        ((|n| (|Integer|)) (|lo| (|List| (|OutputForm|)))
         (% (|List| (|List| (|OutputForm|)))))
        (SPROG ((|a| (|List| (|OutputForm|))) (#1=#:G1245 NIL) (|i| NIL))
               (SEQ (LETT |a| NIL)
                    (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ (LETT |a| (CONS (|SPADfirst| |lo|) |a|))
                              (EXIT (LETT |lo| (CDR |lo|))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (LETT |a| (NREVERSE |a|)) (EXIT (LIST |a| |lo|))))) 

(SDEFUN |FSPECF;get_of_lists|
        ((|ln| (|List| (|Integer|))) (|lo| (|List| (|OutputForm|)))
         (% (|List| (|List| (|OutputForm|)))))
        (SPROG
         ((|rl| (|List| (|List| (|OutputForm|))))
          (|al| (|List| (|List| (|OutputForm|)))) (#1=#:G1251 NIL) (|n| NIL))
         (SEQ (LETT |rl| NIL)
              (SEQ (LETT |n| NIL) (LETT #1# |ln|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |al| (|FSPECF;get_of_list| |n| |lo| %))
                        (LETT |rl| (CONS (|SPADfirst| |al|) |rl|))
                        (EXIT (LETT |lo| (|SPADfirst| (CDR |al|)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |rl| (NREVERSE |rl|)) (EXIT (CONS |lo| |rl|))))) 

(SDEFUN |FSPECF;get_int_listo|
        ((|n| (|Integer|)) (|lo| (|List| (|OutputForm|)))
         (% (|List| (|Integer|))))
        (SPROG
         ((|rl| (|List| (|Integer|))) (|p| (|Integer|)) (#1=#:G1258 NIL)
          (|i| NIL) (|n0| (|NonNegativeInteger|)) (#2=#:G1252 NIL))
         (SEQ
          (LETT |n0|
                (PROG1 (LETT #2# (- (LENGTH |lo|) |n|))
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#)))
          (LETT |lo| (SPADCALL |lo| |n0| (QREFELT % 358))) (LETT |rl| NIL)
          (SEQ (LETT |i| 1) (LETT #1# |n|) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ (LETT |p| (SPADCALL (|SPADfirst| |lo|) (QREFELT % 357)))
                    (LETT |rl| (CONS |p| |rl|)) (EXIT (LETT |lo| (CDR |lo|))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (LETT |rl| (NREVERSE |rl|)) (EXIT |rl|)))) 

(SDEFUN |FSPECF;dhyper0|
        ((|op| (|OutputForm|)) (|lo| (|List| (|OutputForm|)))
         (% (|OutputForm|)))
        (SPROG
         ((|z| (|OutputForm|)) (|b| #1=(|List| (|OutputForm|))) (|a| #1#)
          (|al| (|List| (|List| (|OutputForm|)))) (|pql| (|List| (|Integer|)))
          (|n0| (|NonNegativeInteger|)) (#2=#:G1259 NIL))
         (SEQ
          (LETT |n0|
                (PROG1 (LETT #2# (- (LENGTH |lo|) 2))
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#)))
          (LETT |pql| (|FSPECF;get_int_listo| 2 |lo| %))
          (LETT |lo| (SPADCALL |lo| |n0| (QREFELT % 359)))
          (LETT |al| (|FSPECF;get_of_lists| |pql| |lo| %))
          (LETT |lo| (|SPADfirst| |al|)) (LETT |al| (CDR |al|))
          (LETT |a| (|SPADfirst| |al|)) (LETT |b| (|SPADfirst| (CDR |al|)))
          (LETT |z| (|SPADfirst| |lo|))
          (EXIT
           (SPADCALL |op|
                     (LIST (SPADCALL |a| (QREFELT % 360))
                           (SPADCALL |b| (QREFELT % 360)) |z|)
                     (QREFELT % 361)))))) 

(SDEFUN |FSPECF;dhyper| ((|lo| (|List| (|OutputForm|))) (% (|OutputForm|)))
        (|FSPECF;dhyper0| (SPADCALL '|hypergeometricF| (QREFELT % 362)) |lo| %)) 

(SDEFUN |FSPECF;ddhyper| ((|lo| (|List| (|OutputForm|))) (% (|OutputForm|)))
        (|FSPECF;dhyper0| (|SPADfirst| |lo|) (CDR |lo|) %)) 

(SDEFUN |FSPECF;dmeijer0|
        ((|op| (|OutputForm|)) (|lo| (|List| (|OutputForm|)))
         (% (|OutputForm|)))
        (SPROG
         ((|z| (|OutputForm|)) (|al| (|List| (|List| (|OutputForm|))))
          (|nl| (|List| (|Integer|))) (|n0| (|NonNegativeInteger|))
          (#1=#:G1264 NIL))
         (SEQ
          (LETT |n0|
                (PROG1 (LETT #1# (- (LENGTH |lo|) 4))
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#)))
          (LETT |nl| (|FSPECF;get_int_listo| 4 |lo| %))
          (LETT |lo| (SPADCALL |lo| |n0| (QREFELT % 359)))
          (LETT |al| (|FSPECF;get_of_lists| |nl| |lo| %))
          (LETT |lo| (|SPADfirst| |al|)) (LETT |al| (CDR |al|))
          (LETT |z| (|SPADfirst| |lo|))
          (EXIT
           (SPADCALL |op|
                     (SPADCALL (SPADCALL (ELT % 360) |al| (QREFELT % 365))
                               (LIST |z|) (QREFELT % 366))
                     (QREFELT % 361)))))) 

(SDEFUN |FSPECF;dmeijer| ((|lo| (|List| (|OutputForm|))) (% (|OutputForm|)))
        (|FSPECF;dmeijer0| (SPADCALL '|meijerG| (QREFELT % 362)) |lo| %)) 

(SDEFUN |FSPECF;ddmeijer| ((|lo| (|List| (|OutputForm|))) (% (|OutputForm|)))
        (|FSPECF;dmeijer0| (|SPADfirst| |lo|) (CDR |lo|) %)) 

(SDEFUN |FSPECF;inhyper| ((|lf| (|List| (|InputForm|))) (% (|InputForm|)))
        (SPROG
         ((|li| (|List| #1=(|InputForm|))) (|zi| #1#) (|bi| #2=(|InputForm|))
          (|b| #3=(|List| (|InputForm|))) (|ai| #2#) (|a| #3#)
          (|al| (|List| (|List| (|InputForm|)))) (|pqi| (|List| (|Integer|))))
         (SEQ (LETT |pqi| (|FSPECF;get_int_listi| 2 |lf| %))
              (LETT |al| (|FSPECF;get_if_lists| |pqi| |lf| %))
              (LETT |lf| (|SPADfirst| |al|)) (LETT |al| (CDR |al|))
              (LETT |a| (|SPADfirst| |al|))
              (LETT |ai| (SPADCALL |a| (QREFELT % 194)))
              (LETT |b| (|SPADfirst| (CDR |al|)))
              (LETT |bi| (SPADCALL |b| (QREFELT % 194)))
              (LETT |zi| (|SPADfirst| |lf|))
              (LETT |li|
                    (LIST (SPADCALL '|hypergeometricF| (QREFELT % 193)) |ai|
                          |bi| |zi|))
              (EXIT (SPADCALL |li| (QREFELT % 194)))))) 

(SDEFUN |FSPECF;inmeijer| ((|lf| (|List| (|InputForm|))) (% (|InputForm|)))
        (SPROG
         ((|li| (|List| #1=(|InputForm|))) (|zi| #1#) (|di| #2=(|InputForm|))
          (|d| #3=(|List| (|InputForm|)))
          (|al| (|List| (|List| (|InputForm|)))) (|ci| #2#) (|c| #3#)
          (|bi| #2#) (|b| #3#) (|ai| #2#) (|a| #3#)
          (|pqi| (|List| (|Integer|))))
         (SEQ (LETT |pqi| (|FSPECF;get_int_listi| 4 |lf| %))
              (LETT |al| (|FSPECF;get_if_lists| |pqi| |lf| %))
              (LETT |lf| (|SPADfirst| |al|)) (LETT |al| (CDR |al|))
              (LETT |a| (|SPADfirst| |al|))
              (LETT |ai| (SPADCALL |a| (QREFELT % 194))) (LETT |al| (CDR |al|))
              (LETT |b| (|SPADfirst| |al|))
              (LETT |bi| (SPADCALL |b| (QREFELT % 194))) (LETT |al| (CDR |al|))
              (LETT |c| (|SPADfirst| |al|))
              (LETT |ci| (SPADCALL |c| (QREFELT % 194))) (LETT |al| (CDR |al|))
              (LETT |d| (|SPADfirst| |al|))
              (LETT |di| (SPADCALL |d| (QREFELT % 194)))
              (LETT |zi| (|SPADfirst| |lf|))
              (LETT |li|
                    (LIST (SPADCALL '|meijerG| (QREFELT % 193)) |ai| |bi| |ci|
                          |di| |zi|))
              (EXIT (SPADCALL |li| (QREFELT % 194)))))) 

(SDEFUN |FSPECF;iiHypergeometricF;LF;358| ((|l| (|List| F)) (% (F)))
        (SPADCALL (QREFELT % 41) |l| (QREFELT % 121))) 

(SDEFUN |FSPECF;iiMeijerG| ((|l| (|List| F)) (% (F)))
        (SPADCALL (QREFELT % 42) |l| (QREFELT % 121))) 

(SDEFUN |FSPECF;d_eis| ((|x| (F)) (% (F)))
        (SPADCALL
         (SPADCALL (SPADCALL (QREFELT % 57) |x| (QREFELT % 239))
                   (QREFELT % 132))
         (SPADCALL (|spadConstant| % 96) |x| (QREFELT % 131)) (QREFELT % 123))) 

(SDEFUN |FSPECF;d_erfs| ((|x| (F)) (% (F)))
        (SPADCALL
         (SPADCALL (SPADCALL 2 |x| (QREFELT % 114))
                   (SPADCALL (QREFELT % 58) |x| (QREFELT % 239))
                   (QREFELT % 122))
         (SPADCALL (SPADCALL 2 (QREFELT % 98))
                   (SPADCALL (SPADCALL (QREFELT % 146)) (QREFELT % 135))
                   (QREFELT % 131))
         (QREFELT % 130))) 

(SDEFUN |FSPECF;d_erfis| ((|x| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL 2 |x| (QREFELT % 114))
                    (SPADCALL (QREFELT % 59) |x| (QREFELT % 239))
                    (QREFELT % 122))
          (QREFELT % 132))
         (SPADCALL (SPADCALL 2 (QREFELT % 98))
                   (SPADCALL (SPADCALL (QREFELT % 146)) (QREFELT % 135))
                   (QREFELT % 131))
         (QREFELT % 123))) 

(DECLAIM (NOTINLINE |FunctionalSpecialFunction;|)) 

(DEFUN |FunctionalSpecialFunction;| (|#1| |#2|)
  (SPROG
   ((#1=#:G165 NIL) (|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|FunctionalSpecialFunction| DV$1 DV$2))
    (LETT % (GETREFV 368))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|RetractableTo|
                                                         (|Integer|)))))))
    (|haddProp| |$ConstructorCache| '|FunctionalSpecialFunction|
                (LIST DV$1 DV$2) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 8 '|special|)
    (QSETREFV % 13 (SPADCALL '|abs| (QREFELT % 12)))
    (QSETREFV % 14 (SPADCALL '|sign| (QREFELT % 12)))
    (QSETREFV % 15 (SPADCALL '|unitStep| (QREFELT % 12)))
    (QSETREFV % 16 (SPADCALL '|ceiling| (QREFELT % 12)))
    (QSETREFV % 17 (SPADCALL '|floor| (QREFELT % 12)))
    (QSETREFV % 18 (SPADCALL '|fractionPart| (QREFELT % 12)))
    (QSETREFV % 19 (SPADCALL '|diracDelta| (QREFELT % 12)))
    (QSETREFV % 20 (SPADCALL '|conjugate| (QREFELT % 12)))
    (QSETREFV % 21 (SPADCALL '|Gamma| (QREFELT % 12)))
    (QSETREFV % 22 (SPADCALL '|Gamma2| (QREFELT % 12)))
    (QSETREFV % 23 (SPADCALL '|Beta| (QREFELT % 12)))
    (QSETREFV % 24 (SPADCALL '|Beta3| (QREFELT % 12)))
    (QSETREFV % 25 (SPADCALL '|digamma| (QREFELT % 12)))
    (QSETREFV % 26 (SPADCALL '|polygamma| (QREFELT % 12)))
    (QSETREFV % 27 (SPADCALL '|besselJ| (QREFELT % 12)))
    (QSETREFV % 28 (SPADCALL '|besselY| (QREFELT % 12)))
    (QSETREFV % 29 (SPADCALL '|besselI| (QREFELT % 12)))
    (QSETREFV % 30 (SPADCALL '|besselK| (QREFELT % 12)))
    (QSETREFV % 31 (SPADCALL '|airyAi| (QREFELT % 12)))
    (QSETREFV % 32 (SPADCALL '|airyAiPrime| (QREFELT % 12)))
    (QSETREFV % 33 (SPADCALL '|airyBi| (QREFELT % 12)))
    (QSETREFV % 34 (SPADCALL '|airyBiPrime| (QREFELT % 12)))
    (QSETREFV % 35 (SPADCALL '|lambertW| (QREFELT % 12)))
    (QSETREFV % 36 (SPADCALL '|polylog| (QREFELT % 12)))
    (QSETREFV % 37 (SPADCALL '|weierstrassP| (QREFELT % 12)))
    (QSETREFV % 38 (SPADCALL '|weierstrassPPrime| (QREFELT % 12)))
    (QSETREFV % 39 (SPADCALL '|weierstrassSigma| (QREFELT % 12)))
    (QSETREFV % 40 (SPADCALL '|weierstrassZeta| (QREFELT % 12)))
    (QSETREFV % 41 (SPADCALL '|hypergeometricF| (QREFELT % 12)))
    (QSETREFV % 42 (SPADCALL '|meijerG| (QREFELT % 12)))
    (QSETREFV % 43 (SPADCALL '|charlierC| (QREFELT % 12)))
    (QSETREFV % 44 (SPADCALL '|hahn_p| (QREFELT % 12)))
    (QSETREFV % 45 (SPADCALL '|hahnQ| (QREFELT % 12)))
    (QSETREFV % 46 (SPADCALL '|hahnR| (QREFELT % 12)))
    (QSETREFV % 47 (SPADCALL '|hahnS| (QREFELT % 12)))
    (QSETREFV % 48 (SPADCALL '|hermiteH| (QREFELT % 12)))
    (QSETREFV % 49 (SPADCALL '|jacobiP| (QREFELT % 12)))
    (QSETREFV % 50 (SPADCALL '|krawtchoukK| (QREFELT % 12)))
    (QSETREFV % 51 (SPADCALL '|laguerreL| (QREFELT % 12)))
    (QSETREFV % 52 (SPADCALL '|meixnerM| (QREFELT % 12)))
    (QSETREFV % 53 (SPADCALL '|meixnerP| (QREFELT % 12)))
    (QSETREFV % 54 (SPADCALL '|racahR| (QREFELT % 12)))
    (QSETREFV % 55 (SPADCALL '|wilsonW| (QREFELT % 12)))
    (QSETREFV % 56 (SPADCALL '|%logGamma| (QREFELT % 12)))
    (QSETREFV % 57 (SPADCALL '|%eis| (QREFELT % 12)))
    (QSETREFV % 58 (SPADCALL '|%erfs| (QREFELT % 12)))
    (QSETREFV % 59 (SPADCALL '|%erfis| (QREFELT % 12)))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV % 103
                 (CONS (|dispatchFunction| |FSPECF;hypergeometricF;2L2F;29|)
                       %))
       (QSETREFV % 104
                 (CONS (|dispatchFunction| |FSPECF;meijerG;4L2F;30|) %)))))
    (QSETREFV % 106
              (SPADCALL (SPADCALL '|%diff| (QREFELT % 12)) (QREFELT % 105)))
    (QSETREFV % 109
              (PROG2
                  (LETT #1#
                        (SPADCALL (SPADCALL 2 (QREFELT % 98)) (QREFELT % 108)))
                  (QCDR #1#)
                (|check_union2| (QEQCAR #1# 0) |#2| (|Union| |#2| #2="failed")
                                #1#)))
    (QSETREFV % 110
              (PROG2
                  (LETT #1#
                        (SPADCALL (SPADCALL 3 (QREFELT % 98)) (QREFELT % 108)))
                  (QCDR #1#)
                (|check_union2| (QEQCAR #1# 0) |#2| (|Union| |#2| #2#) #1#)))
    (QSETREFV % 111
              (PROG2
                  (LETT #1#
                        (SPADCALL (SPADCALL 4 (QREFELT % 98)) (QREFELT % 108)))
                  (QCDR #1#)
                (|check_union2| (QEQCAR #1# 0) |#2| (|Union| |#2| #2#) #1#)))
    (QSETREFV % 112
              (PROG2
                  (LETT #1#
                        (SPADCALL (SPADCALL 6 (QREFELT % 98)) (QREFELT % 108)))
                  (QCDR #1#)
                (|check_union2| (QEQCAR #1# 0) |#2| (|Union| |#2| #2#) #1#)))
    (QSETREFV % 115 (SPADCALL 2 (QREFELT % 110) (QREFELT % 114)))
    (QSETREFV % 116 (SPADCALL 3 (QREFELT % 109) (QREFELT % 114)))
    (QSETREFV % 124 (SPADCALL '|weierstrassPInverse| (QREFELT % 12)))
    (SPADCALL (QREFELT % 124)
              (CONS (|function| |FSPECF;elWeierstrassPInverse|) %)
              (QREFELT % 128))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT % 124)
                 (LIST
                  (CONS (|function| |FSPECF;eWeierstrassPInverseGrad_g2|) %)
                  (CONS (|function| |FSPECF;eWeierstrassPInverseGrad_g3|) %)
                  (CONS (|function| |FSPECF;eWeierstrassPInverseGrad_z|) %))
                 (QREFELT % 137)))))
    (QSETREFV % 138 (SPADCALL '|whittakerM| (QREFELT % 12)))
    (SPADCALL (QREFELT % 138) (CONS (|function| |FSPECF;elWhittakerM|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 138) '|%specialDiff|
              (CONS (|function| |FSPECF;dWhittakerM|) %) (QREFELT % 141))
    (QSETREFV % 142 (SPADCALL '|whittakerW| (QREFELT % 12)))
    (SPADCALL (QREFELT % 142) (CONS (|function| |FSPECF;elWhittakerW|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 142) '|%specialDiff|
              (CONS (|function| |FSPECF;dWhittakerW|) %) (QREFELT % 141))
    (QSETREFV % 144 (SPADCALL '|angerJ| (QREFELT % 12)))
    (COND
     ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
      (PROGN
       (SPADCALL (QREFELT % 144) (CONS (|function| |FSPECF;elAngerJ|) %)
                 (QREFELT % 128))
       (SPADCALL (QREFELT % 144) '|%specialDiff|
                 (CONS (|function| |FSPECF;dAngerJ|) %) (QREFELT % 141))))
     ('T
      (PROGN
       (SPADCALL (QREFELT % 144) (CONS (|function| |FSPECF;eeAngerJ|) %)
                 (QREFELT % 128)))))
    (QSETREFV % 148 (SPADCALL '|weberE| (QREFELT % 12)))
    (COND
     ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
      (PROGN
       (SPADCALL (QREFELT % 148) (CONS (|function| |FSPECF;elWeberE|) %)
                 (QREFELT % 128))
       (SPADCALL (QREFELT % 148) '|%specialDiff|
                 (CONS (|function| |FSPECF;dWeberE|) %) (QREFELT % 141))))
     ('T
      (PROGN
       (SPADCALL (QREFELT % 148) (CONS (|function| |FSPECF;eeWeberE|) %)
                 (QREFELT % 128)))))
    (QSETREFV % 152 (SPADCALL '|struveH| (QREFELT % 12)))
    (SPADCALL (QREFELT % 152) (CONS (|function| |FSPECF;elStruveH|) %)
              (QREFELT % 128))
    (COND
     ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
      (COND
       ((|HasCategory| |#2| '(|RadicalCategory|))
        (PROGN
         (SPADCALL (QREFELT % 152) '|%specialDiff|
                   (CONS (|function| |FSPECF;dStruveH|) %)
                   (QREFELT % 141)))))))
    (QSETREFV % 155 (SPADCALL '|struveL| (QREFELT % 12)))
    (SPADCALL (QREFELT % 155) (CONS (|function| |FSPECF;elStruveL|) %)
              (QREFELT % 128))
    (COND
     ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
      (COND
       ((|HasCategory| |#2| '(|RadicalCategory|))
        (PROGN
         (SPADCALL (QREFELT % 155) '|%specialDiff|
                   (CONS (|function| |FSPECF;dStruveL|) %)
                   (QREFELT % 141)))))))
    (QSETREFV % 157 (SPADCALL '|hankelH1| (QREFELT % 12)))
    (SPADCALL (QREFELT % 157) (CONS (|function| |FSPECF;elHankelH1|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 157) '|%specialDiff|
              (CONS (|function| |FSPECF;dHankelH1|) %) (QREFELT % 141))
    (QSETREFV % 159 (SPADCALL '|hankelH2| (QREFELT % 12)))
    (SPADCALL (QREFELT % 159) (CONS (|function| |FSPECF;elHankelH2|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 159) '|%specialDiff|
              (CONS (|function| |FSPECF;dHankelH2|) %) (QREFELT % 141))
    (QSETREFV % 161 (SPADCALL '|lommelS1| (QREFELT % 12)))
    (SPADCALL (QREFELT % 161) (CONS (|function| |FSPECF;elLommelS1|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 161) '|%specialDiff|
              (CONS (|function| |FSPECF;dLommelS1|) %) (QREFELT % 141))
    (QSETREFV % 163 (SPADCALL '|lommelS2| (QREFELT % 12)))
    (SPADCALL (QREFELT % 163) (CONS (|function| |FSPECF;elLommelS2|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 163) '|%specialDiff|
              (CONS (|function| |FSPECF;dLommelS2|) %) (QREFELT % 141))
    (QSETREFV % 165 (SPADCALL '|kummerM| (QREFELT % 12)))
    (SPADCALL (QREFELT % 165) (CONS (|function| |FSPECF;elKummerM|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 165) '|%specialDiff|
              (CONS (|function| |FSPECF;dKummerM|) %) (QREFELT % 141))
    (QSETREFV % 167 (SPADCALL '|kummerU| (QREFELT % 12)))
    (SPADCALL (QREFELT % 167) (CONS (|function| |FSPECF;elKummerU|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 167) '|%specialDiff|
              (CONS (|function| |FSPECF;dKummerU|) %) (QREFELT % 141))
    (QSETREFV % 169 (SPADCALL '|legendreP| (QREFELT % 12)))
    (SPADCALL (QREFELT % 169) (CONS (|function| |FSPECF;elLegendreP|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 169) '|%specialDiff|
              (CONS (|function| |FSPECF;dLegendreP|) %) (QREFELT % 141))
    (QSETREFV % 171 (SPADCALL '|legendreQ| (QREFELT % 12)))
    (SPADCALL (QREFELT % 171) (CONS (|function| |FSPECF;elLegendreQ|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 171) '|%specialDiff|
              (CONS (|function| |FSPECF;dLegendreQ|) %) (QREFELT % 141))
    (QSETREFV % 173 (SPADCALL '|kelvinBei| (QREFELT % 12)))
    (SPADCALL (QREFELT % 173) (CONS (|function| |FSPECF;elKelvinBei|) %)
              (QREFELT % 128))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT % 173) '|%specialDiff|
                 (CONS (|function| |FSPECF;dKelvinBei|) %) (QREFELT % 141)))))
    (QSETREFV % 176 (SPADCALL '|kelvinBer| (QREFELT % 12)))
    (SPADCALL (QREFELT % 176) (CONS (|function| |FSPECF;elKelvinBer|) %)
              (QREFELT % 128))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT % 176) '|%specialDiff|
                 (CONS (|function| |FSPECF;dKelvinBer|) %) (QREFELT % 141)))))
    (QSETREFV % 177 (SPADCALL '|kelvinKei| (QREFELT % 12)))
    (SPADCALL (QREFELT % 177) (CONS (|function| |FSPECF;elKelvinKei|) %)
              (QREFELT % 128))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT % 177) '|%specialDiff|
                 (CONS (|function| |FSPECF;dKelvinKei|) %) (QREFELT % 141)))))
    (QSETREFV % 180 (SPADCALL '|kelvinKer| (QREFELT % 12)))
    (SPADCALL (QREFELT % 180) (CONS (|function| |FSPECF;elKelvinKer|) %)
              (QREFELT % 128))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT % 180) '|%specialDiff|
                 (CONS (|function| |FSPECF;dKelvinKer|) %) (QREFELT % 141)))))
    (QSETREFV % 181 (SPADCALL '|ellipticK| (QREFELT % 12)))
    (SPADCALL (QREFELT % 181) (CONS (|function| |FSPECF;elEllipticK|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 181) (CONS (|function| |FSPECF;dEllipticK|) %)
              (QREFELT % 187))
    (QSETREFV % 188 (SPADCALL '|ellipticE| (QREFELT % 12)))
    (SPADCALL (QREFELT % 188) (CONS (|function| |FSPECF;elEllipticE|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 188) (CONS (|function| |FSPECF;dEllipticE|) %)
              (QREFELT % 187))
    (QSETREFV % 189 (SPADCALL '|ellipticE2| (QREFELT % 12)))
    (SPADCALL (QREFELT % 189) (CONS (|function| |FSPECF;elEllipticE2|) %)
              (QREFELT % 128))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT % 189)
                 (LIST (CONS (|function| |FSPECF;eEllipticE2Grad_z|) %)
                       (CONS (|function| |FSPECF;eEllipticE2Grad_m|) %))
                 (QREFELT % 137)))))
    (SPADCALL (QREFELT % 189) (CONS (|function| |FSPECF;inEllipticE2|) %)
              (QREFELT % 196))
    (QSETREFV % 197 (SPADCALL '|ellipticF| (QREFELT % 12)))
    (SPADCALL (QREFELT % 197) (CONS (|function| |FSPECF;elEllipticF|) %)
              (QREFELT % 128))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT % 197)
                 (LIST (CONS (|function| |FSPECF;eEllipticFGrad_z|) %)
                       (CONS (|function| |FSPECF;eEllipticFGrad_m|) %))
                 (QREFELT % 137)))))
    (QSETREFV % 198 (SPADCALL '|ellipticPi| (QREFELT % 12)))
    (SPADCALL (QREFELT % 198) (CONS (|function| |FSPECF;elEllipticPi|) %)
              (QREFELT % 128))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT % 198)
                 (LIST (CONS (|function| |FSPECF;eEllipticPiGrad_z|) %)
                       (CONS (|function| |FSPECF;eEllipticPiGrad_n|) %)
                       (CONS (|function| |FSPECF;eEllipticPiGrad_m|) %))
                 (QREFELT % 137)))))
    (QSETREFV % 200 (SPADCALL '|jacobiSn| (QREFELT % 12)))
    (SPADCALL (QREFELT % 200) (CONS (|function| |FSPECF;elJacobiSn|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 200)
              (LIST (CONS (|function| |FSPECF;eJacobiSnGrad_z|) %)
                    (CONS (|function| |FSPECF;eJacobiSnGrad_m|) %))
              (QREFELT % 137))
    (QSETREFV % 209 (SPADCALL '|jacobiCn| (QREFELT % 12)))
    (SPADCALL (QREFELT % 209) (CONS (|function| |FSPECF;elJacobiCn|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 209)
              (LIST (CONS (|function| |FSPECF;eJacobiCnGrad_z|) %)
                    (CONS (|function| |FSPECF;eJacobiCnGrad_m|) %))
              (QREFELT % 137))
    (QSETREFV % 210 (SPADCALL '|jacobiDn| (QREFELT % 12)))
    (SPADCALL (QREFELT % 210) (CONS (|function| |FSPECF;elJacobiDn|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 210)
              (LIST (CONS (|function| |FSPECF;eJacobiDnGrad_z|) %)
                    (CONS (|function| |FSPECF;eJacobiDnGrad_m|) %))
              (QREFELT % 137))
    (QSETREFV % 211 (SPADCALL '|jacobiZeta| (QREFELT % 12)))
    (SPADCALL (QREFELT % 211) (CONS (|function| |FSPECF;elJacobiZeta|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 211)
              (LIST (CONS (|function| |FSPECF;eJacobiZetaGrad_z|) %)
                    (CONS (|function| |FSPECF;eJacobiZetaGrad_m|) %))
              (QREFELT % 137))
    (QSETREFV % 213 (SPADCALL '|jacobiTheta| (QREFELT % 12)))
    (SPADCALL (QREFELT % 213) (CONS (|function| |FSPECF;elJacobiTheta|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 213)
              (LIST (CONS (|function| |FSPECF;eJacobiThetaGrad_z|) %)
                    (CONS (|function| |FSPECF;eJacobiThetaGrad_m|) %))
              (QREFELT % 137))
    (QSETREFV % 215 (SPADCALL '|lerchPhi| (QREFELT % 12)))
    (SPADCALL (QREFELT % 215) (CONS (|function| |FSPECF;elLerchPhi|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 215) '|%specialDiff|
              (CONS (|function| |FSPECF;dLerchPhi|) %) (QREFELT % 141))
    (QSETREFV % 217 (SPADCALL '|riemannZeta| (QREFELT % 12)))
    (SPADCALL (QREFELT % 217) (CONS (|function| |FSPECF;elRiemannZeta|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 43) (CONS (|function| |FSPECF;elCharlierC|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 48) (CONS (|function| |FSPECF;elHermiteH|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 48) '|%specialDiff|
              (CONS (|function| |FSPECF;dHermiteH|) %) (QREFELT % 141))
    (SPADCALL (QREFELT % 49) (CONS (|function| |FSPECF;elJacobiP|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 49) '|%specialDiff|
              (CONS (|function| |FSPECF;dJacobiP|) %) (QREFELT % 141))
    (SPADCALL (QREFELT % 51) (CONS (|function| |FSPECF;elLaguerreL|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 51) '|%specialDiff|
              (CONS (|function| |FSPECF;dLaguerreL|) %) (QREFELT % 141))
    (SPADCALL (QREFELT % 44) (CONS (|function| |FSPECF;el_hahn_p|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 45) (CONS (|function| |FSPECF;el_hahnQ|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 46) (CONS (|function| |FSPECF;el_hahnR|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 47) (CONS (|function| |FSPECF;el_hahnS|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 50) (CONS (|function| |FSPECF;el_krawtchoukK|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 52) (CONS (|function| |FSPECF;elMeixnerM|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 53) (CONS (|function| |FSPECF;el_meixnerP|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 54) (CONS (|function| |FSPECF;el_racahR|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 55) (CONS (|function| |FSPECF;el_wilsonW|) %)
              (QREFELT % 128))
    (COND
     ((|HasCategory| |#2| '(|RetractableTo| (|Fraction| (|Integer|))))
      (PROGN
       (QSETREFV % 245 (CONS (|dispatchFunction| |FSPECF;retract_Q;FU;240|) %))
       (QSETREFV % 247
                 (CONS (|dispatchFunction| |FSPECF;coerce_Q;FF;241|) %))))
     ('T
      (QSETREFV % 245
                (CONS (|dispatchFunction| |FSPECF;retract_Q;FU;242|) %))))
    (SPADCALL (QREFELT % 14) (CONS #'|FunctionalSpecialFunction!0| %)
              (QREFELT % 187))
    (SPADCALL (QREFELT % 14) (CONS (|function| |FSPECF;isign|) %)
              (QREFELT % 249))
    (SPADCALL (QREFELT % 15) (ELT % 67) (QREFELT % 187))
    (SPADCALL (QREFELT % 15) (CONS (|function| |FSPECF;i_unitStep|) %)
              (QREFELT % 249))
    (SPADCALL (QREFELT % 16) (CONS (|function| |FSPECF;i_ceiling|) %)
              (QREFELT % 249))
    (SPADCALL (QREFELT % 17) (CONS (|function| |FSPECF;i_floor|) %)
              (QREFELT % 249))
    (SPADCALL (QREFELT % 18) (CONS (|function| |FSPECF;i_fractionPart|) %)
              (QREFELT % 249))
    (SPADCALL (QREFELT % 19) (CONS (|function| |FSPECF;i_diracDelta|) %)
              (QREFELT % 249))
    (COND
     ((|HasCategory| |#2| '(|ElementaryFunctionCategory|))
      (PROGN
       (QSETREFV % 254 (CONS (|dispatchFunction| |FSPECF;iAiryAi;2F;256|) %))
       (QSETREFV % 255
                 (CONS (|dispatchFunction| |FSPECF;iAiryAiPrime;2F;257|) %))
       (QSETREFV % 256 (CONS (|dispatchFunction| |FSPECF;iAiryBi;2F;258|) %))
       (QSETREFV % 257
                 (CONS (|dispatchFunction| |FSPECF;iAiryBiPrime;2F;259|) %))))
     ('T
      (PROGN
       (QSETREFV % 254 (CONS (|dispatchFunction| |FSPECF;iAiryAi;2F;260|) %))
       (QSETREFV % 255
                 (CONS (|dispatchFunction| |FSPECF;iAiryAiPrime;2F;261|) %))
       (QSETREFV % 256 (CONS (|dispatchFunction| |FSPECF;iAiryBi;2F;262|) %))
       (QSETREFV % 257
                 (CONS (|dispatchFunction| |FSPECF;iAiryBiPrime;2F;263|) %)))))
    (COND
     ((|HasCategory| |#2| '(|ElementaryFunctionCategory|))
      (QSETREFV % 259 (CONS (|dispatchFunction| |FSPECF;iLambertW;2F;264|) %)))
     ('T
      (QSETREFV % 259
                (CONS (|dispatchFunction| |FSPECF;iLambertW;2F;265|) %))))
    (COND
     ((|HasCategory| |#2| '(|ElementaryFunctionCategory|))
      (COND
       ((|HasCategory| |#2| '(|LiouvillianFunctionCategory|))
        (QSETREFV % 262
                  (CONS (|dispatchFunction| |FSPECF;iiPolylog;3F;267|) %)))
       ('T
        (QSETREFV % 262
                  (CONS (|dispatchFunction| |FSPECF;iiPolylog;3F;268|) %)))))
     ('T
      (QSETREFV % 262
                (CONS (|dispatchFunction| |FSPECF;iiPolylog;3F;269|) %))))
    (COND
     ((|HasSignature| |#1|
                      (LIST '|abs|
                            (LIST (|devaluate| |#1|) (|devaluate| |#1|))))
      (PROGN
       (QSETREFV % 274 (CONS (|dispatchFunction| |FSPECF;iiabs;2F;275|) %))))
     ('T (QSETREFV % 274 (CONS (|dispatchFunction| |FSPECF;iiabs;2F;276|) %))))
    (COND
     ((|HasCategory| |#1| '(|SpecialFunctionCategory|))
      (PROGN
       (QSETREFV % 302 (CONS (|dispatchFunction| |FSPECF;iiGamma;2F;278|) %))
       (QSETREFV % 304 (CONS (|dispatchFunction| |FSPECF;iiBeta;LF;279|) %))
       (QSETREFV % 306 (CONS (|dispatchFunction| |FSPECF;iidigamma;2F;280|) %))
       (QSETREFV % 308
                 (CONS (|dispatchFunction| |FSPECF;iipolygamma;LF;281|) %))
       (QSETREFV % 310 (CONS (|dispatchFunction| |FSPECF;iiBesselJ;LF;282|) %))
       (QSETREFV % 312 (CONS (|dispatchFunction| |FSPECF;iiBesselY;LF;283|) %))
       (QSETREFV % 314 (CONS (|dispatchFunction| |FSPECF;iiBesselI;LF;284|) %))
       (QSETREFV % 316 (CONS (|dispatchFunction| |FSPECF;iiBesselK;LF;285|) %))
       (QSETREFV % 318 (CONS (|dispatchFunction| |FSPECF;iiAiryAi;2F;286|) %))
       (QSETREFV % 320
                 (CONS (|dispatchFunction| |FSPECF;iiAiryAiPrime;2F;287|) %))
       (QSETREFV % 322 (CONS (|dispatchFunction| |FSPECF;iiAiryBi;2F;288|) %))
       (QSETREFV % 324
                 (CONS (|dispatchFunction| |FSPECF;iiAiryBiPrime;2F;289|) %))))
     ('T
      (PROGN
       (COND
        ((|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (QSETREFV % 302
                   (CONS (|dispatchFunction| |FSPECF;iiGamma;2F;290|) %)))
        ('T
         (QSETREFV % 302
                   (CONS (|dispatchFunction| |FSPECF;iiGamma;2F;291|) %))))
       (QSETREFV % 304 (CONS (|dispatchFunction| |FSPECF;iiBeta;LF;292|) %))
       (QSETREFV % 306 (CONS (|dispatchFunction| |FSPECF;iidigamma;2F;293|) %))
       (QSETREFV % 308
                 (CONS (|dispatchFunction| |FSPECF;iipolygamma;LF;294|) %))
       (QSETREFV % 310 (CONS (|dispatchFunction| |FSPECF;iiBesselJ;LF;295|) %))
       (QSETREFV % 312 (CONS (|dispatchFunction| |FSPECF;iiBesselY;LF;296|) %))
       (QSETREFV % 314 (CONS (|dispatchFunction| |FSPECF;iiBesselI;LF;297|) %))
       (QSETREFV % 316 (CONS (|dispatchFunction| |FSPECF;iiBesselK;LF;298|) %))
       (QSETREFV % 318 (CONS (|dispatchFunction| |FSPECF;iiAiryAi;2F;299|) %))
       (QSETREFV % 320
                 (CONS (|dispatchFunction| |FSPECF;iiAiryAiPrime;2F;300|) %))
       (QSETREFV % 322 (CONS (|dispatchFunction| |FSPECF;iiAiryBi;2F;301|) %))
       (QSETREFV % 324
                 (CONS (|dispatchFunction| |FSPECF;iiAiryBiPrime;2F;302|)
                       %)))))
    (SPADCALL (QREFELT % 21) (ELT % 302) (QREFELT % 249))
    (SPADCALL (QREFELT % 13) (ELT % 274) (QREFELT % 249))
    (SPADCALL (QREFELT % 20) (ELT % 285) (QREFELT % 249))
    (SPADCALL (QREFELT % 23) (ELT % 304) (QREFELT % 128))
    (SPADCALL (QREFELT % 25) (ELT % 306) (QREFELT % 249))
    (SPADCALL (QREFELT % 26) (ELT % 308) (QREFELT % 128))
    (SPADCALL (QREFELT % 27) (ELT % 310) (QREFELT % 128))
    (SPADCALL (QREFELT % 28) (ELT % 312) (QREFELT % 128))
    (SPADCALL (QREFELT % 29) (ELT % 314) (QREFELT % 128))
    (SPADCALL (QREFELT % 30) (ELT % 316) (QREFELT % 128))
    (SPADCALL (QREFELT % 31) (ELT % 318) (QREFELT % 249))
    (SPADCALL (QREFELT % 32) (ELT % 320) (QREFELT % 249))
    (SPADCALL (QREFELT % 33) (ELT % 322) (QREFELT % 249))
    (SPADCALL (QREFELT % 34) (ELT % 324) (QREFELT % 249))
    (SPADCALL (QREFELT % 35) (ELT % 259) (QREFELT % 249))
    (SPADCALL (QREFELT % 36) (CONS (|function| |FSPECF;iPolylog|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 37) (CONS (|function| |FSPECF;iiWeierstrassP|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 38) (CONS (|function| |FSPECF;iiWeierstrassPPrime|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 39) (CONS (|function| |FSPECF;iiWeierstrassSigma|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 40) (CONS (|function| |FSPECF;iiWeierstrassZeta|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 41) (ELT % 329) (QREFELT % 128))
    (SPADCALL (QREFELT % 42) (CONS (|function| |FSPECF;iiMeijerG|) %)
              (QREFELT % 128))
    (SPADCALL (QREFELT % 24) (CONS (|function| |FSPECF;elBeta3|) %)
              (QREFELT % 128))
    (COND
     ((|HasCategory| |#2| '(|ElementaryFunctionCategory|))
      (COND
       ((|HasCategory| |#2| '(|PrimitiveFunctionCategory|))
        (PROGN
         (SPADCALL (QREFELT % 24)
                   (LIST (CONS (|function| |FSPECF;eBeta3Grad1|) %)
                         (CONS (|function| |FSPECF;eBeta3Grad2|) %)
                         (CONS (|function| |FSPECF;eBeta3Grad3|) %))
                   (QREFELT % 137)))))))
    (SPADCALL (QREFELT % 24) (CONS (|function| |FSPECF;inBeta3|) %)
              (QREFELT % 196))
    (COND
     ((|HasCategory| |#2| '(|ElementaryFunctionCategory|))
      (PROGN
       (SPADCALL (QREFELT % 22) '|%specialDiff|
                 (CONS (|function| |FSPECF;iGamma2|) %) (QREFELT % 141)))))
    (SPADCALL (QREFELT % 22) (CONS (|function| |FSPECF;inGamma2|) %)
              (QREFELT % 196))
    (SPADCALL (QREFELT % 20) (CONS (|function| |FSPECF;dconjugate|) %)
              (QREFELT % 344))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV % 329
                 (CONS (|dispatchFunction| |FSPECF;iiHypergeometricF;LF;339|)
                       %))
       (SPADCALL (QREFELT % 41) '|%diffDisp|
                 (CONS (|function| |FSPECF;ddhyper|) %) (QREFELT % 141))
       (SPADCALL (QREFELT % 42) '|%diffDisp|
                 (CONS (|function| |FSPECF;ddmeijer|) %) (QREFELT % 141))
       (SPADCALL (QREFELT % 41) (CONS (|function| |FSPECF;dhyper|) %)
                 (QREFELT % 344))
       (SPADCALL (QREFELT % 42) (CONS (|function| |FSPECF;dmeijer|) %)
                 (QREFELT % 344))
       (SPADCALL (QREFELT % 41) '|%specialDiff|
                 (CONS (|function| |FSPECF;dvhypergeom|) %) (QREFELT % 141))
       (SPADCALL (QREFELT % 42) '|%specialDiff|
                 (CONS (|function| |FSPECF;dvmeijer|) %) (QREFELT % 141))
       (SPADCALL (QREFELT % 41) (CONS (|function| |FSPECF;inhyper|) %)
                 (QREFELT % 196))
       (SPADCALL (QREFELT % 42) (CONS (|function| |FSPECF;inmeijer|) %)
                 (QREFELT % 196))))
     ('T
      (QSETREFV % 329
                (CONS (|dispatchFunction| |FSPECF;iiHypergeometricF;LF;358|)
                      %))))
    (COND
     ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
      (COND
       ((|HasCategory| |#2| '(|RadicalCategory|))
        (PROGN
         (SPADCALL (QREFELT % 58) (CONS (|function| |FSPECF;d_erfs|) %)
                   (QREFELT % 187))
         (SPADCALL (QREFELT % 59) (CONS (|function| |FSPECF;d_erfis|) %)
                   (QREFELT % 187)))))))
    (SPADCALL (QREFELT % 13) (CONS #'|FunctionalSpecialFunction!1| %)
              (QREFELT % 187))
    (SPADCALL (QREFELT % 21) (CONS #'|FunctionalSpecialFunction!2| %)
              (QREFELT % 187))
    (SPADCALL (QREFELT % 56) (ELT % 75) (QREFELT % 187))
    (SPADCALL (QREFELT % 23)
              (LIST (CONS (|function| |FSPECF;iBetaGrad1|) %)
                    (CONS (|function| |FSPECF;iBetaGrad2|) %))
              (QREFELT % 137))
    (SPADCALL (QREFELT % 25) (CONS #'|FunctionalSpecialFunction!3| %)
              (QREFELT % 187))
    (SPADCALL (QREFELT % 57) (CONS (|function| |FSPECF;d_eis|) %)
              (QREFELT % 187))
    (SPADCALL (QREFELT % 31) (ELT % 82) (QREFELT % 187))
    (SPADCALL (QREFELT % 32) (CONS #'|FunctionalSpecialFunction!4| %)
              (QREFELT % 187))
    (SPADCALL (QREFELT % 33) (ELT % 84) (QREFELT % 187))
    (SPADCALL (QREFELT % 34) (CONS #'|FunctionalSpecialFunction!5| %)
              (QREFELT % 187))
    (SPADCALL (QREFELT % 35) (CONS (|function| |FSPECF;dLambertW|) %)
              (QREFELT % 187))
    (SPADCALL (QREFELT % 37)
              (LIST (CONS (|function| |FSPECF;iWeierstrassPGrad1|) %)
                    (CONS (|function| |FSPECF;iWeierstrassPGrad2|) %)
                    (CONS (|function| |FSPECF;iWeierstrassPGrad3|) %))
              (QREFELT % 137))
    (SPADCALL (QREFELT % 38)
              (LIST (CONS (|function| |FSPECF;iWeierstrassPPrimeGrad1|) %)
                    (CONS (|function| |FSPECF;iWeierstrassPPrimeGrad2|) %)
                    (CONS (|function| |FSPECF;iWeierstrassPPrimeGrad3|) %))
              (QREFELT % 137))
    (SPADCALL (QREFELT % 39)
              (LIST (CONS (|function| |FSPECF;iWeierstrassSigmaGrad1|) %)
                    (CONS (|function| |FSPECF;iWeierstrassSigmaGrad2|) %)
                    (CONS (|function| |FSPECF;iWeierstrassSigmaGrad3|) %))
              (QREFELT % 137))
    (SPADCALL (QREFELT % 40)
              (LIST (CONS (|function| |FSPECF;iWeierstrassZetaGrad1|) %)
                    (CONS (|function| |FSPECF;iWeierstrassZetaGrad2|) %)
                    (CONS (|function| |FSPECF;iWeierstrassZetaGrad3|) %))
              (QREFELT % 137))
    (SPADCALL (QREFELT % 26) '|%specialDiff|
              (CONS (|function| |FSPECF;ipolygamma|) %) (QREFELT % 141))
    (SPADCALL (QREFELT % 27) '|%specialDiff|
              (CONS (|function| |FSPECF;iBesselJ|) %) (QREFELT % 141))
    (SPADCALL (QREFELT % 28) '|%specialDiff|
              (CONS (|function| |FSPECF;iBesselY|) %) (QREFELT % 141))
    (SPADCALL (QREFELT % 29) '|%specialDiff|
              (CONS (|function| |FSPECF;iBesselI|) %) (QREFELT % 141))
    (SPADCALL (QREFELT % 30) '|%specialDiff|
              (CONS (|function| |FSPECF;iBesselK|) %) (QREFELT % 141))
    (SPADCALL (QREFELT % 36) '|%specialDiff|
              (CONS (|function| |FSPECF;dPolylog|) %) (QREFELT % 141))
    %))) 

(DEFUN |FunctionalSpecialFunction| (&REST #1=#:G1351)
  (SPROG NIL
         (PROG (#2=#:G1352)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FunctionalSpecialFunction|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FunctionalSpecialFunction;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FunctionalSpecialFunction|)))))))))) 

(DEFUN |FunctionalSpecialFunction!5| (|x| %)
  (SPADCALL |x| (SPADCALL |x| (QREFELT % 83)) (QREFELT % 122))) 

(DEFUN |FunctionalSpecialFunction!4| (|x| %)
  (SPADCALL |x| (SPADCALL |x| (QREFELT % 81)) (QREFELT % 122))) 

(DEFUN |FunctionalSpecialFunction!3| (|x| %)
  (SPADCALL (|spadConstant| % 96) |x| (QREFELT % 76))) 

(DEFUN |FunctionalSpecialFunction!2| (|x| %)
  (SPADCALL (SPADCALL |x| (QREFELT % 75)) (SPADCALL |x| (QREFELT % 69))
            (QREFELT % 122))) 

(DEFUN |FunctionalSpecialFunction!1| (|x| %)
  (SPADCALL (SPADCALL |x| (QREFELT % 61)) (SPADCALL |x| (QREFELT % 367))
            (QREFELT % 122))) 

(DEFUN |FunctionalSpecialFunction!0| (|x| %)
  (SPADCALL (SPADCALL 2 (QREFELT % 98)) (SPADCALL |x| (QREFELT % 67))
            (QREFELT % 122))) 

(MAKEPROP '|FunctionalSpecialFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'SPECIAL
              (|BasicOperator|) (|Symbol|) (|CommonOperators|) (0 . |operator|)
              '|opabs| '|opsign| '|op_unitStep| '|op_ceiling| '|op_floor|
              '|op_fractionPart| '|op_diracDelta| '|opconjugate| '|opGamma|
              '|opGamma2| '|opBeta| '|opBeta3| '|opdigamma| '|oppolygamma|
              '|opBesselJ| '|opBesselY| '|opBesselI| '|opBesselK| '|opAiryAi|
              '|opAiryAiPrime| '|opAiryBi| '|opAiryBiPrime| '|opLambertW|
              '|opPolylog| '|opWeierstrassP| '|opWeierstrassPPrime|
              '|opWeierstrassSigma| '|opWeierstrassZeta| '|opHypergeometricF|
              '|opMeijerG| '|opCharlierC| '|op_hahn_p| '|op_hahnQ| '|op_hahnR|
              '|op_hahnS| '|opHermiteH| '|opJacobiP| '|op_krawtchoukK|
              '|opLaguerreL| '|opMeixnerM| '|op_meixnerP| '|op_racahR|
              '|op_wilsonW| '|op_log_gamma| '|op_eis| '|op_erfs| '|op_erfis|
              (5 . |elt|) |FSPECF;abs;2F;1| |FSPECF;sign;2F;2|
              |FSPECF;unitStep;2F;3| |FSPECF;ceiling;2F;4| |FSPECF;floor;2F;5|
              |FSPECF;fractionPart;2F;6| |FSPECF;diracDelta;2F;7|
              |FSPECF;conjugate;2F;8| |FSPECF;Gamma;2F;9| (11 . |elt|)
              |FSPECF;Gamma;3F;10| |FSPECF;Beta;3F;11| (18 . |elt|)
              |FSPECF;Beta;4F;12| |FSPECF;digamma;2F;13|
              |FSPECF;polygamma;3F;14| |FSPECF;besselJ;3F;15|
              |FSPECF;besselY;3F;16| |FSPECF;besselI;3F;17|
              |FSPECF;besselK;3F;18| |FSPECF;airyAi;2F;19|
              |FSPECF;airyAiPrime;2F;20| |FSPECF;airyBi;2F;21|
              |FSPECF;airyBiPrime;2F;22| |FSPECF;lambertW;2F;23|
              |FSPECF;polylog;3F;24| |FSPECF;weierstrassP;4F;25|
              |FSPECF;weierstrassPPrime;4F;26| |FSPECF;weierstrassSigma;4F;27|
              |FSPECF;weierstrassZeta;4F;28| (26 . |Zero|) (30 . |Zero|)
              (|Boolean|) (34 . =) (40 . |One|) (44 . |One|) (|Integer|)
              (48 . |coerce|) (|List| 7) (53 . |concat|) (|List| %)
              (59 . |elt|) (65 . |hypergeometricF|) (72 . |meijerG|)
              (81 . |operator|) '|opdiff| (|Union| % '"failed") (86 . |recip|)
              '|ahalf| '|athird| '|afourth| '|asixth| (|PositiveInteger|)
              (91 . *) '|twothirds| '|threehalfs| (97 . |elt|) (103 . |new|)
              (107 . |coerce|) (112 . |differentiate|) (118 . |kernel|)
              (124 . *) (130 . +) '|opWeierstrassPInverse|
              |FSPECF;weierstrassPInverse;4F;34| (|Mapping| 7 99)
              (|BasicOperatorFunctions1| 7) (136 . |evaluate|) (142 . ^)
              (148 . -) (154 . /) (160 . -)
              (|SparseMultivariatePolynomial| 6 205) (165 . |One|)
              (169 . |sqrt|) (|List| 126) (174 . |derivative|) '|opWhittakerM|
              |FSPECF;whittakerM;4F;40| (|None|) (180 . |setProperty|)
              '|opWhittakerW| |FSPECF;whittakerW;4F;45| '|opAngerJ|
              |FSPECF;angerJ;3F;50| (187 . |pi|) (191 . |sin|) '|opWeberE|
              |FSPECF;weberE;3F;56| (196 . ^) (202 . |cos|) '|opStruveH|
              |FSPECF;struveH;3F;62| (207 . ^) '|opStruveL|
              |FSPECF;struveL;3F;67| '|opHankelH1| |FSPECF;hankelH1;3F;72|
              '|opHankelH2| |FSPECF;hankelH2;3F;77| '|opLommelS1|
              |FSPECF;lommelS1;4F;82| '|opLommelS2| |FSPECF;lommelS2;4F;87|
              '|opKummerM| |FSPECF;kummerM;4F;92| '|opKummerU|
              |FSPECF;kummerU;4F;97| '|opLegendreP| |FSPECF;legendreP;4F;102|
              '|opLegendreQ| |FSPECF;legendreQ;4F;107| '|opKelvinBei|
              |FSPECF;kelvinBei;3F;112| |FSPECF;kelvinBer;3F;117|
              '|opKelvinBer| '|opKelvinKei| |FSPECF;kelvinKei;3F;122|
              |FSPECF;kelvinKer;3F;127| '|opKelvinKer| '|opEllipticK|
              |FSPECF;ellipticK;2F;132| |FSPECF;ellipticE;2F;136|
              (|Fraction| 97) (213 . |One|) (|Mapping| 7 7)
              (217 . |derivative|) '|opEllipticE| '|opEllipticE2|
              |FSPECF;ellipticE;3F;140| |FSPECF;ellipticF;3F;146| (|InputForm|)
              (223 . |convert|) (228 . |convert|) (|Mapping| 192 354)
              (233 . |input|) '|opEllipticF| '|opEllipticPi|
              |FSPECF;ellipticPi;4F;151| '|opJacobiSn| |FSPECF;jacobiSn;3F;157|
              (239 . |is?|) (|Kernel| %) (245 . |retract|) (|Kernel| 7)
              (250 . |argument|) |FSPECF;jacobiCn;3F;163|
              |FSPECF;jacobiDn;3F;168| '|opJacobiCn| '|opJacobiDn|
              '|opJacobiZeta| |FSPECF;jacobiZeta;3F;173| '|opJacobiTheta|
              |FSPECF;jacobiTheta;3F;178| '|opLerchPhi|
              |FSPECF;lerchPhi;4F;183| '|opRiemannZeta|
              |FSPECF;riemannZeta;2F;187| |FSPECF;charlierC;4F;190|
              |FSPECF;hermiteH;3F;193| (255 . |elt|) |FSPECF;jacobiP;5F;198|
              |FSPECF;laguerreL;4F;203| (264 . |elt|) |FSPECF;hahn_p;6F;208|
              |FSPECF;hahnQ;6F;211| |FSPECF;hahnR;6F;214| |FSPECF;hahnS;6F;217|
              |FSPECF;krawtchoukK;5F;220| |FSPECF;meixnerM;5F;223|
              |FSPECF;meixnerP;5F;226| (274 . |elt|) |FSPECF;racahR;7F;229|
              |FSPECF;wilsonW;7F;232| (285 . |has?|) |FSPECF;belong?;BoB;235|
              (291 . |is?|) |FSPECF;operator;2Bo;236| (297 . |kernel|)
              (303 . |zero?|) (308 . |one?|) (313 . |smaller?|)
              (|Union| 184 '#1="failed") (319 . |retractIfCan|)
              (324 . |retract_Q|) (329 . |coerce|) (334 . |coerce_Q|)
              (339 . |sign|) (344 . |evaluate|) (350 . |ceiling|)
              (355 . |coerce|) (360 . |floor|) (365 . |fractionPart|)
              (370 . |iAiryAi|) (375 . |iAiryAiPrime|) (380 . |iAiryBi|)
              (385 . |iAiryBiPrime|) (390 . |exp|) (395 . |iLambertW|)
              (400 . |log|) (405 . |dilog|) (410 . |iiPolylog|)
              (416 . |second|) (|Union| 267 '#1#) (421 . |retractIfCan|)
              (|Polynomial| 6) (|Fraction| 266) (426 . |numer|)
              (|Union| 6 '"failed") (431 . |retractIfCan|) (436 . |denom|)
              (441 . |abs|) (446 . |coerce|) (451 . |iiabs|) (|Union| 10 '#1#)
              (456 . |retractIfCan|) (|List| 203) (461 . |kernels|)
              (|NonNegativeInteger|) (466 . |height|) (471 . |Zero|) (475 . =)
              (481 . |coerce|) (486 . |One|) |FSPECF;iiconjugate;2F;277|
              (|Mapping| % %) (490 . |map|) (|Mapping| 7 205) (|List| 205)
              (|ListFunctions2| 205 7) (496 . |map|) (502 . |eval|)
              (509 . |conjugate|) (|SparseMultivariatePolynomial| 6 203)
              (514 . |numer|) (|Mapping| 6 6) (519 . |map|) (525 . |coerce|)
              (530 . |denom|) (535 . |retractIfCan|) (540 . |Gamma|)
              (545 . |iiGamma|) (550 . |Beta|) (556 . |iiBeta|)
              (561 . |digamma|) (566 . |iidigamma|) (571 . |polygamma|)
              (577 . |iipolygamma|) (582 . |besselJ|) (588 . |iiBesselJ|)
              (593 . |besselY|) (599 . |iiBesselY|) (604 . |besselI|)
              (610 . |iiBesselI|) (615 . |besselK|) (621 . |iiBesselK|)
              (626 . |airyAi|) (631 . |iiAiryAi|) (636 . |airyAiPrime|)
              (641 . |iiAiryAiPrime|) (646 . |airyBi|) (651 . |iiAiryBi|)
              (656 . |airyBiPrime|) (661 . |iiAiryBiPrime|) (|Union| 97 '#1#)
              (666 . |retractIfCan|) (671 . |factorial|) (676 . |third|)
              (681 . |iiHypergeometricF|) (|List| 10) (686 . |variables|)
              (691 . |member?|) (|Segment| 7) (697 . |segment|)
              (|SegmentBinding| 7) (703 . |equation|) (|SegmentBinding| %)
              (709 . |integral|) (|OutputForm|) (|List| 339) (715 . |elt|)
              (721 . |overbar|) (|Mapping| 339 340) (726 . |display|)
              (732 . |retract|) (|List| 97) (|Mapping| 97 7)
              (|ListFunctions2| 7 97) (737 . |map|) (743 . |first|)
              (749 . |rest|) (755 . ~=) (761 . |elt|) (|List| 192)
              (767 . |rest|) (|SExpression|) (773 . |integer|) (778 . |rest|)
              (784 . |first|) (790 . |bracket|) (795 . |prefix|)
              (801 . |coerce|) (|List| 340) (|ListFunctions2| 340 339)
              (806 . |map|) (812 . |concat|) (818 . |inv|))
           '#(|wilsonW| 823 |whittakerW| 833 |whittakerM| 840 |weierstrassZeta|
              847 |weierstrassSigma| 854 |weierstrassPPrime| 861
              |weierstrassPInverse| 868 |weierstrassP| 875 |weberE| 882
              |unitStep| 888 |struveL| 893 |struveH| 899 |sign| 905
              |riemannZeta| 910 |retract_Q| 915 |racahR| 920 |polylog| 930
              |polygamma| 936 |operator| 942 |meixnerP| 947 |meixnerM| 955
              |meijerG| 963 |lommelS2| 972 |lommelS1| 979 |lerchPhi| 986
              |legendreQ| 993 |legendreP| 1000 |lambertW| 1007 |laguerreL| 1012
              |kummerU| 1019 |kummerM| 1026 |krawtchoukK| 1033 |kelvinKer| 1041
              |kelvinKei| 1047 |kelvinBer| 1053 |kelvinBei| 1059 |jacobiZeta|
              1065 |jacobiTheta| 1071 |jacobiSn| 1077 |jacobiP| 1083 |jacobiDn|
              1091 |jacobiCn| 1097 |iipolygamma| 1103 |iidigamma| 1108
              |iiconjugate| 1113 |iiabs| 1118 |iiPolylog| 1123
              |iiHypergeometricF| 1129 |iiGamma| 1134 |iiBeta| 1139 |iiBesselY|
              1144 |iiBesselK| 1149 |iiBesselJ| 1154 |iiBesselI| 1159
              |iiAiryBiPrime| 1164 |iiAiryBi| 1169 |iiAiryAiPrime| 1174
              |iiAiryAi| 1179 |iLambertW| 1184 |iAiryBiPrime| 1189 |iAiryBi|
              1194 |iAiryAiPrime| 1199 |iAiryAi| 1204 |hypergeometricF| 1209
              |hermiteH| 1216 |hankelH2| 1222 |hankelH1| 1228 |hahn_p| 1234
              |hahnS| 1243 |hahnR| 1252 |hahnQ| 1261 |fractionPart| 1270
              |floor| 1275 |ellipticPi| 1280 |ellipticK| 1287 |ellipticF| 1292
              |ellipticE| 1298 |diracDelta| 1309 |digamma| 1314 |conjugate|
              1319 |coerce_Q| 1324 |charlierC| 1329 |ceiling| 1336 |besselY|
              1341 |besselK| 1347 |besselJ| 1353 |besselI| 1359 |belong?| 1365
              |angerJ| 1370 |airyBiPrime| 1376 |airyBi| 1381 |airyAiPrime| 1386
              |airyAi| 1391 |abs| 1396 |Gamma| 1401 |Beta| 1412)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|belong?| ((|Boolean|) (|BasicOperator|))) T)
                              '((|operator|
                                 ((|BasicOperator|) (|BasicOperator|)))
                                T)
                              '((|abs| (|#2| |#2|)) T)
                              '((|sign| (|#2| |#2|)) T)
                              '((|unitStep| (|#2| |#2|)) T)
                              '((|ceiling| (|#2| |#2|)) T)
                              '((|floor| (|#2| |#2|)) T)
                              '((|fractionPart| (|#2| |#2|)) T)
                              '((|diracDelta| (|#2| |#2|)) T)
                              '((|conjugate| (|#2| |#2|)) T)
                              '((|Gamma| (|#2| |#2|)) T)
                              '((|Gamma| (|#2| |#2| |#2|)) T)
                              '((|Beta| (|#2| |#2| |#2|)) T)
                              '((|Beta| (|#2| |#2| |#2| |#2|)) T)
                              '((|digamma| (|#2| |#2|)) T)
                              '((|polygamma| (|#2| |#2| |#2|)) T)
                              '((|besselJ| (|#2| |#2| |#2|)) T)
                              '((|besselY| (|#2| |#2| |#2|)) T)
                              '((|besselI| (|#2| |#2| |#2|)) T)
                              '((|besselK| (|#2| |#2| |#2|)) T)
                              '((|airyAi| (|#2| |#2|)) T)
                              '((|airyAiPrime| (|#2| |#2|)) T)
                              '((|airyBi| (|#2| |#2|)) T)
                              '((|airyBiPrime| (|#2| |#2|)) T)
                              '((|lambertW| (|#2| |#2|)) T)
                              '((|polylog| (|#2| |#2| |#2|)) T)
                              '((|weierstrassP| (|#2| |#2| |#2| |#2|)) T)
                              '((|weierstrassPPrime| (|#2| |#2| |#2| |#2|)) T)
                              '((|weierstrassSigma| (|#2| |#2| |#2| |#2|)) T)
                              '((|weierstrassZeta| (|#2| |#2| |#2| |#2|)) T)
                              '((|weierstrassPInverse| (|#2| |#2| |#2| |#2|))
                                T)
                              '((|whittakerM| (|#2| |#2| |#2| |#2|)) T)
                              '((|whittakerW| (|#2| |#2| |#2| |#2|)) T)
                              '((|angerJ| (|#2| |#2| |#2|)) T)
                              '((|weberE| (|#2| |#2| |#2|)) T)
                              '((|struveH| (|#2| |#2| |#2|)) T)
                              '((|struveL| (|#2| |#2| |#2|)) T)
                              '((|hankelH1| (|#2| |#2| |#2|)) T)
                              '((|hankelH2| (|#2| |#2| |#2|)) T)
                              '((|lommelS1| (|#2| |#2| |#2| |#2|)) T)
                              '((|lommelS2| (|#2| |#2| |#2| |#2|)) T)
                              '((|kummerM| (|#2| |#2| |#2| |#2|)) T)
                              '((|kummerU| (|#2| |#2| |#2| |#2|)) T)
                              '((|legendreP| (|#2| |#2| |#2| |#2|)) T)
                              '((|legendreQ| (|#2| |#2| |#2| |#2|)) T)
                              '((|kelvinBei| (|#2| |#2| |#2|)) T)
                              '((|kelvinBer| (|#2| |#2| |#2|)) T)
                              '((|kelvinKei| (|#2| |#2| |#2|)) T)
                              '((|kelvinKer| (|#2| |#2| |#2|)) T)
                              '((|ellipticK| (|#2| |#2|)) T)
                              '((|ellipticE| (|#2| |#2|)) T)
                              '((|ellipticE| (|#2| |#2| |#2|)) T)
                              '((|ellipticF| (|#2| |#2| |#2|)) T)
                              '((|ellipticPi| (|#2| |#2| |#2| |#2|)) T)
                              '((|jacobiSn| (|#2| |#2| |#2|)) T)
                              '((|jacobiCn| (|#2| |#2| |#2|)) T)
                              '((|jacobiDn| (|#2| |#2| |#2|)) T)
                              '((|jacobiZeta| (|#2| |#2| |#2|)) T)
                              '((|jacobiTheta| (|#2| |#2| |#2|)) T)
                              '((|lerchPhi| (|#2| |#2| |#2| |#2|)) T)
                              '((|riemannZeta| (|#2| |#2|)) T)
                              '((|charlierC| (|#2| |#2| |#2| |#2|)) T)
                              '((|hahn_p| (|#2| |#2| |#2| |#2| |#2| |#2|)) T)
                              '((|hahnQ| (|#2| |#2| |#2| |#2| |#2| |#2|)) T)
                              '((|hahnR| (|#2| |#2| |#2| |#2| |#2| |#2|)) T)
                              '((|hahnS| (|#2| |#2| |#2| |#2| |#2| |#2|)) T)
                              '((|hermiteH| (|#2| |#2| |#2|)) T)
                              '((|jacobiP| (|#2| |#2| |#2| |#2| |#2|)) T)
                              '((|krawtchoukK| (|#2| |#2| |#2| |#2| |#2|)) T)
                              '((|laguerreL| (|#2| |#2| |#2| |#2|)) T)
                              '((|meixnerM| (|#2| |#2| |#2| |#2| |#2|)) T)
                              '((|meixnerP| (|#2| |#2| |#2| |#2| |#2|)) T)
                              '((|racahR| (|#2| |#2| |#2| |#2| |#2| |#2| |#2|))
                                T)
                              '((|wilsonW|
                                 (|#2| |#2| |#2| |#2| |#2| |#2| |#2|))
                                T)
                              '((|hypergeometricF|
                                 (|#2| (|List| |#2|) (|List| |#2|) |#2|))
                                (|has| 7 (|RetractableTo| 97)))
                              '((|meijerG|
                                 (|#2| (|List| |#2|) (|List| |#2|)
                                  (|List| |#2|) (|List| |#2|) |#2|))
                                (|has| 7 (|RetractableTo| 97)))
                              '((|iiGamma| (|#2| |#2|)) T)
                              '((|iiabs| (|#2| |#2|)) T)
                              '((|iiconjugate| (|#2| |#2|)) T)
                              '((|iiBeta| (|#2| (|List| |#2|))) T)
                              '((|iidigamma| (|#2| |#2|)) T)
                              '((|iipolygamma| (|#2| (|List| |#2|))) T)
                              '((|iiBesselJ| (|#2| (|List| |#2|))) T)
                              '((|iiBesselY| (|#2| (|List| |#2|))) T)
                              '((|iiBesselI| (|#2| (|List| |#2|))) T)
                              '((|iiBesselK| (|#2| (|List| |#2|))) T)
                              '((|iiAiryAi| (|#2| |#2|)) T)
                              '((|iiAiryAiPrime| (|#2| |#2|)) T)
                              '((|iiAiryBi| (|#2| |#2|)) T)
                              '((|iiAiryBiPrime| (|#2| |#2|)) T)
                              '((|iAiryAi| (|#2| |#2|)) T)
                              '((|iAiryAiPrime| (|#2| |#2|)) T)
                              '((|iAiryBi| (|#2| |#2|)) T)
                              '((|iAiryBiPrime| (|#2| |#2|)) T)
                              '((|iiHypergeometricF| (|#2| (|List| |#2|))) T)
                              '((|iiPolylog| (|#2| |#2| |#2|)) T)
                              '((|iLambertW| (|#2| |#2|)) T)
                              '((|retract_Q|
                                 ((|Union| (|Fraction| (|Integer|)) "failed")
                                  |#2|))
                                T)
                              '((|coerce_Q| (|#2| (|Fraction| (|Integer|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 367
                                            '(1 11 9 10 12 2 7 0 9 0 60 3 7 0 9
                                              0 0 70 4 7 0 9 0 0 0 73 0 6 0 91
                                              0 7 0 92 2 7 93 0 0 94 0 6 0 95 0
                                              7 0 96 1 7 0 97 98 2 99 0 0 0 100
                                              2 7 0 9 101 102 3 0 7 99 99 7 103
                                              5 0 7 99 99 99 99 7 104 1 7 9 9
                                              105 1 7 107 0 108 2 7 0 113 0 114
                                              2 99 7 0 97 117 0 10 0 118 1 7 0
                                              10 119 2 7 0 0 10 120 2 7 0 9 101
                                              121 2 7 0 0 0 122 2 7 0 0 0 123 2
                                              127 9 9 126 128 2 7 0 0 113 129 2
                                              7 0 0 0 130 2 7 0 0 0 131 1 7 0 0
                                              132 0 133 0 134 1 7 0 0 135 2 127
                                              9 9 136 137 3 9 0 0 10 140 141 0
                                              7 0 146 1 7 0 0 147 2 7 0 0 97
                                              150 1 7 0 0 151 2 7 0 0 0 154 0
                                              184 0 185 2 127 9 9 186 187 1 10
                                              192 0 193 1 192 0 101 194 2 9 0 0
                                              195 196 2 7 93 0 9 202 1 7 203 0
                                              204 1 205 99 0 206 5 7 0 9 0 0 0
                                              0 221 6 7 0 9 0 0 0 0 0 224 7 7 0
                                              9 0 0 0 0 0 0 232 2 9 93 0 10 235
                                              2 9 93 0 10 237 2 7 0 9 0 239 1 7
                                              93 0 240 1 7 93 0 241 2 7 93 0 0
                                              242 1 7 243 0 244 1 0 243 7 245 1
                                              7 0 184 246 1 0 7 184 247 1 184
                                              97 0 248 2 127 9 9 186 249 1 184
                                              97 0 250 1 184 0 97 251 1 184 97
                                              0 252 1 184 0 0 253 1 0 7 7 254 1
                                              0 7 7 255 1 0 7 7 256 1 0 7 7 257
                                              1 7 0 0 258 1 0 7 7 259 1 7 0 0
                                              260 1 7 0 0 261 2 0 7 7 7 262 1
                                              99 7 0 263 1 7 264 0 265 1 267
                                              266 0 268 1 266 269 0 270 1 267
                                              266 0 271 1 6 0 0 272 1 7 0 6 273
                                              1 0 7 7 274 1 7 275 0 276 1 7 277
                                              0 278 1 205 279 0 280 0 279 0 281
                                              2 279 93 0 0 282 1 7 0 203 283 0
                                              113 0 284 2 7 0 286 203 287 2 290
                                              99 288 289 291 3 7 0 0 277 101
                                              292 1 6 0 0 293 1 7 294 0 295 2
                                              133 0 296 0 297 1 7 0 294 298 1 7
                                              294 0 299 1 7 269 0 300 1 6 0 0
                                              301 1 0 7 7 302 2 6 0 0 0 303 1 0
                                              7 99 304 1 6 0 0 305 1 0 7 7 306
                                              2 6 0 0 0 307 1 0 7 99 308 2 6 0
                                              0 0 309 1 0 7 99 310 2 6 0 0 0
                                              311 1 0 7 99 312 2 6 0 0 0 313 1
                                              0 7 99 314 2 6 0 0 0 315 1 0 7 99
                                              316 1 6 0 0 317 1 0 7 7 318 1 6 0
                                              0 319 1 0 7 7 320 1 6 0 0 321 1 0
                                              7 7 322 1 6 0 0 323 1 0 7 7 324 1
                                              7 325 0 326 1 97 0 0 327 1 99 7 0
                                              328 1 0 7 99 329 1 7 330 0 331 2
                                              330 93 10 0 332 2 333 0 7 7 334 2
                                              335 0 10 333 336 2 7 0 0 337 338
                                              2 340 339 0 97 341 1 339 0 0 342
                                              2 9 0 0 343 344 1 7 97 0 345 2
                                              348 346 347 99 349 2 99 0 0 279
                                              350 2 99 0 0 279 351 2 279 93 0 0
                                              352 2 346 97 0 97 353 2 354 0 0
                                              279 355 1 356 97 0 357 2 340 0 0
                                              279 358 2 340 0 0 279 359 1 339 0
                                              101 360 2 339 0 0 101 361 1 10
                                              339 0 362 2 364 340 343 363 365 2
                                              340 0 0 0 366 1 7 0 0 367 6 0 7 7
                                              7 7 7 7 7 234 3 0 7 7 7 7 143 3 0
                                              7 7 7 7 139 3 0 7 7 7 7 90 3 0 7
                                              7 7 7 89 3 0 7 7 7 7 88 3 0 7 7 7
                                              7 125 3 0 7 7 7 7 87 2 0 7 7 7
                                              149 1 0 7 7 63 2 0 7 7 7 156 2 0
                                              7 7 7 153 1 0 7 7 62 1 0 7 7 218
                                              1 0 243 7 245 6 0 7 7 7 7 7 7 7
                                              233 2 0 7 7 7 86 2 0 7 7 7 76 1 0
                                              9 9 238 4 0 7 7 7 7 7 231 4 0 7 7
                                              7 7 7 230 5 1 7 99 99 99 99 7 104
                                              3 0 7 7 7 7 164 3 0 7 7 7 7 162 3
                                              0 7 7 7 7 216 3 0 7 7 7 7 172 3 0
                                              7 7 7 7 170 1 0 7 7 85 3 0 7 7 7
                                              7 223 3 0 7 7 7 7 168 3 0 7 7 7 7
                                              166 4 0 7 7 7 7 7 229 2 0 7 7 7
                                              179 2 0 7 7 7 178 2 0 7 7 7 175 2
                                              0 7 7 7 174 2 0 7 7 7 212 2 0 7 7
                                              7 214 2 0 7 7 7 201 4 0 7 7 7 7 7
                                              222 2 0 7 7 7 208 2 0 7 7 7 207 1
                                              0 7 99 308 1 0 7 7 306 1 0 7 7
                                              285 1 0 7 7 274 2 0 7 7 7 262 1 0
                                              7 99 329 1 0 7 7 302 1 0 7 99 304
                                              1 0 7 99 312 1 0 7 99 316 1 0 7
                                              99 310 1 0 7 99 314 1 0 7 7 324 1
                                              0 7 7 322 1 0 7 7 320 1 0 7 7 318
                                              1 0 7 7 259 1 0 7 7 257 1 0 7 7
                                              256 1 0 7 7 255 1 0 7 7 254 3 1 7
                                              99 99 7 103 2 0 7 7 7 220 2 0 7 7
                                              7 160 2 0 7 7 7 158 5 0 7 7 7 7 7
                                              7 225 5 0 7 7 7 7 7 7 228 5 0 7 7
                                              7 7 7 7 227 5 0 7 7 7 7 7 7 226 1
                                              0 7 7 66 1 0 7 7 65 3 0 7 7 7 7
                                              199 1 0 7 7 182 2 0 7 7 7 191 1 0
                                              7 7 183 2 0 7 7 7 190 1 0 7 7 67
                                              1 0 7 7 75 1 0 7 7 68 1 0 7 184
                                              247 3 0 7 7 7 7 219 1 0 7 7 64 2
                                              0 7 7 7 78 2 0 7 7 7 80 2 0 7 7 7
                                              77 2 0 7 7 7 79 1 0 93 9 236 2 0
                                              7 7 7 145 1 0 7 7 84 1 0 7 7 83 1
                                              0 7 7 82 1 0 7 7 81 1 0 7 7 61 1
                                              0 7 7 69 2 0 7 7 7 71 3 0 7 7 7 7
                                              74 2 0 7 7 7 72)))))
           '|lookupComplete|)) 
