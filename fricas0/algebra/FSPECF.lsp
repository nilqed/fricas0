
(SDEFUN |FSPECF;abs;2F;1| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 13) |x| (QREFELT $ 45))) 

(SDEFUN |FSPECF;conjugate;2F;2| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 14) |x| (QREFELT $ 45))) 

(SDEFUN |FSPECF;Gamma;2F;3| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 15) |x| (QREFELT $ 45))) 

(SDEFUN |FSPECF;Gamma;3F;4| ((|a| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 16) |a| |x| (QREFELT $ 49))) 

(SDEFUN |FSPECF;Beta;3F;5| ((|x| F) (|y| F) ($ F))
        (SPADCALL (QREFELT $ 17) |x| |y| (QREFELT $ 49))) 

(SDEFUN |FSPECF;digamma;2F;6| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 18) |x| (QREFELT $ 45))) 

(SDEFUN |FSPECF;polygamma;3F;7| ((|k| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 19) |k| |x| (QREFELT $ 49))) 

(SDEFUN |FSPECF;besselJ;3F;8| ((|a| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 20) |a| |x| (QREFELT $ 49))) 

(SDEFUN |FSPECF;besselY;3F;9| ((|a| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 21) |a| |x| (QREFELT $ 49))) 

(SDEFUN |FSPECF;besselI;3F;10| ((|a| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 22) |a| |x| (QREFELT $ 49))) 

(SDEFUN |FSPECF;besselK;3F;11| ((|a| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 23) |a| |x| (QREFELT $ 49))) 

(SDEFUN |FSPECF;airyAi;2F;12| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 24) |x| (QREFELT $ 45))) 

(SDEFUN |FSPECF;airyAiPrime;2F;13| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 25) |x| (QREFELT $ 45))) 

(SDEFUN |FSPECF;airyBi;2F;14| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 26) |x| (QREFELT $ 45))) 

(SDEFUN |FSPECF;airyBiPrime;2F;15| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 27) |x| (QREFELT $ 45))) 

(SDEFUN |FSPECF;lambertW;2F;16| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 28) |x| (QREFELT $ 45))) 

(SDEFUN |FSPECF;polylog;3F;17| ((|s| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 29) |s| |x| (QREFELT $ 49))) 

(SDEFUN |FSPECF;weierstrassP;4F;18| ((|g2| F) (|g3| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 30) |g2| |g3| |x| (QREFELT $ 64))) 

(SDEFUN |FSPECF;weierstrassPPrime;4F;19| ((|g2| F) (|g3| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 31) |g2| |g3| |x| (QREFELT $ 64))) 

(SDEFUN |FSPECF;weierstrassSigma;4F;20| ((|g2| F) (|g3| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 32) |g2| |g3| |x| (QREFELT $ 64))) 

(SDEFUN |FSPECF;weierstrassZeta;4F;21| ((|g2| F) (|g3| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 33) |g2| |g3| |x| (QREFELT $ 64))) 

(SDEFUN |FSPECF;hypergeometricF;2L2F;22|
        ((|a| |List| F) (|b| |List| F) (|z| F) ($ F))
        (SPROG
         ((|q| (F)) (|p| (F)) (|nbi| #1=(|NonNegativeInteger|)) (|nai| #1#))
         (SEQ (LETT |nai| (LENGTH |a|) . #2=(|FSPECF;hypergeometricF;2L2F;22|))
              (LETT |nbi| (LENGTH |b|) . #2#)
              (COND
               ((SPADCALL |z| (|spadConstant| $ 70) (QREFELT $ 72))
                (COND
                 ((SPADCALL |nai| (+ |nbi| 1) (QREFELT $ 76))
                  (EXIT (|spadConstant| $ 74))))))
              (LETT |p| (SPADCALL (LENGTH |a|) (QREFELT $ 78)) . #2#)
              (LETT |q| (SPADCALL (LENGTH |b|) (QREFELT $ 78)) . #2#)
              (EXIT
               (SPADCALL (QREFELT $ 34)
                         (SPADCALL
                          (SPADCALL |a|
                                    (SPADCALL |b| (LIST |z|) (QREFELT $ 80))
                                    (QREFELT $ 80))
                          (LIST |p| |q|) (QREFELT $ 80))
                         (QREFELT $ 82)))))) 

(SDEFUN |FSPECF;meijerG;4L2F;23|
        ((|a| |List| F) (|b| |List| F) (|c| |List| F) (|d| |List| F) (|z| F)
         ($ F))
        (SPROG ((|m2| (F)) (|m1| (F)) (|n2| (F)) (|n1| (F)))
               (SEQ
                (LETT |n1| (SPADCALL (LENGTH |a|) (QREFELT $ 78))
                      . #1=(|FSPECF;meijerG;4L2F;23|))
                (LETT |n2| (SPADCALL (LENGTH |b|) (QREFELT $ 78)) . #1#)
                (LETT |m1| (SPADCALL (LENGTH |c|) (QREFELT $ 78)) . #1#)
                (LETT |m2| (SPADCALL (LENGTH |d|) (QREFELT $ 78)) . #1#)
                (EXIT
                 (SPADCALL (QREFELT $ 35)
                           (SPADCALL
                            (SPADCALL |a|
                                      (SPADCALL |b|
                                                (SPADCALL |c|
                                                          (SPADCALL |d|
                                                                    (LIST |z|)
                                                                    (QREFELT $
                                                                             80))
                                                          (QREFELT $ 80))
                                                (QREFELT $ 80))
                                      (QREFELT $ 80))
                            (LIST |n1| |n2| |m1| |m2|) (QREFELT $ 80))
                           (QREFELT $ 82)))))) 

(SDEFUN |FSPECF;grad2|
        ((|l| |List| F) (|t| |Symbol|) (|op| |BasicOperator|)
         (|d2| |Mapping| F F F) ($ F))
        (SPROG ((|dm| (F)) (|x2| (F)) (|x1| (F)))
               (SEQ
                (LETT |x1| (SPADCALL |l| 1 (QREFELT $ 97))
                      . #1=(|FSPECF;grad2|))
                (LETT |x2| (SPADCALL |l| 2 (QREFELT $ 97)) . #1#)
                (LETT |dm| (SPADCALL (SPADCALL (QREFELT $ 98)) (QREFELT $ 99))
                      . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL (SPADCALL |x1| |t| (QREFELT $ 100))
                            (SPADCALL (QREFELT $ 86)
                                      (LIST
                                       (SPADCALL |op| (LIST |dm| |x2|)
                                                 (QREFELT $ 82))
                                       |dm| |x1|)
                                      (QREFELT $ 101))
                            (QREFELT $ 102))
                  (SPADCALL (SPADCALL |x2| |t| (QREFELT $ 100))
                            (SPADCALL |x1| |x2| |d2|) (QREFELT $ 102))
                  (QREFELT $ 103)))))) 

(SDEFUN |FSPECF;grad3|
        ((|l| |List| F) (|t| |Symbol|) (|op| |BasicOperator|)
         (|d3| |Mapping| F F F F) ($ F))
        (SPROG ((|dm2| (F)) (|dm1| (F)) (|x3| (F)) (|x2| (F)) (|x1| (F)))
               (SEQ
                (LETT |x1| (SPADCALL |l| 1 (QREFELT $ 97))
                      . #1=(|FSPECF;grad3|))
                (LETT |x2| (SPADCALL |l| 2 (QREFELT $ 97)) . #1#)
                (LETT |x3| (SPADCALL |l| 3 (QREFELT $ 97)) . #1#)
                (LETT |dm1| (SPADCALL (SPADCALL (QREFELT $ 98)) (QREFELT $ 99))
                      . #1#)
                (LETT |dm2| (SPADCALL (SPADCALL (QREFELT $ 98)) (QREFELT $ 99))
                      . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL |x1| |t| (QREFELT $ 100))
                             (SPADCALL (QREFELT $ 86)
                                       (LIST
                                        (SPADCALL |op| (LIST |dm1| |x2| |x3|)
                                                  (QREFELT $ 82))
                                        |dm1| |x1|)
                                       (QREFELT $ 101))
                             (QREFELT $ 102))
                   (SPADCALL (SPADCALL |x2| |t| (QREFELT $ 100))
                             (SPADCALL (QREFELT $ 86)
                                       (LIST
                                        (SPADCALL |op| (LIST |x1| |dm2| |x3|)
                                                  (QREFELT $ 82))
                                        |dm2| |x2|)
                                       (QREFELT $ 101))
                             (QREFELT $ 102))
                   (QREFELT $ 103))
                  (SPADCALL (SPADCALL |x3| |t| (QREFELT $ 100))
                            (SPADCALL |x1| |x2| |x3| |d3|) (QREFELT $ 102))
                  (QREFELT $ 103)))))) 

(SDEFUN |FSPECF;grad4|
        ((|l| |List| F) (|t| |Symbol|) (|op| |BasicOperator|)
         (|d4| |Mapping| F F F F F) ($ F))
        (SPROG
         ((|kd3| (F)) (|kd2| (F)) (|kd1| (F)) (|dm3| (F)) (|dm2| (F))
          (|dm1| (F)) (|x4| (F)) (|x3| (F)) (|x2| (F)) (|x1| (F)))
         (SEQ (LETT |x1| (SPADCALL |l| 1 (QREFELT $ 97)) . #1=(|FSPECF;grad4|))
              (LETT |x2| (SPADCALL |l| 2 (QREFELT $ 97)) . #1#)
              (LETT |x3| (SPADCALL |l| 3 (QREFELT $ 97)) . #1#)
              (LETT |x4| (SPADCALL |l| 4 (QREFELT $ 97)) . #1#)
              (LETT |dm1| (SPADCALL (SPADCALL (QREFELT $ 98)) (QREFELT $ 99))
                    . #1#)
              (LETT |dm2| (SPADCALL (SPADCALL (QREFELT $ 98)) (QREFELT $ 99))
                    . #1#)
              (LETT |dm3| (SPADCALL (SPADCALL (QREFELT $ 98)) (QREFELT $ 99))
                    . #1#)
              (LETT |kd1|
                    (SPADCALL (QREFELT $ 86)
                              (LIST
                               (SPADCALL |op| (LIST |dm1| |x2| |x3| |x4|)
                                         (QREFELT $ 82))
                               |dm1| |x1|)
                              (QREFELT $ 101))
                    . #1#)
              (LETT |kd2|
                    (SPADCALL (QREFELT $ 86)
                              (LIST
                               (SPADCALL |op| (LIST |x1| |dm2| |x3| |x4|)
                                         (QREFELT $ 82))
                               |dm2| |x2|)
                              (QREFELT $ 101))
                    . #1#)
              (LETT |kd3|
                    (SPADCALL (QREFELT $ 86)
                              (LIST
                               (SPADCALL |op| (LIST |x1| |x2| |dm3| |x4|)
                                         (QREFELT $ 82))
                               |dm3| |x3|)
                              (QREFELT $ 101))
                    . #1#)
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |x1| |t| (QREFELT $ 100)) |kd1|
                            (QREFELT $ 102))
                  (SPADCALL (SPADCALL |x2| |t| (QREFELT $ 100)) |kd2|
                            (QREFELT $ 102))
                  (QREFELT $ 103))
                 (SPADCALL (SPADCALL |x3| |t| (QREFELT $ 100)) |kd3|
                           (QREFELT $ 102))
                 (QREFELT $ 103))
                (SPADCALL (SPADCALL |x4| |t| (QREFELT $ 100))
                          (SPADCALL |x1| |x2| |x3| |x4| |d4|) (QREFELT $ 102))
                (QREFELT $ 103)))))) 

(SDEFUN |FSPECF;weierstrassPInverse;4F;27| ((|g2| F) (|g3| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 104) |g2| |g3| |z| (QREFELT $ 64))) 

(SDEFUN |FSPECF;eWeierstrassPInverse| ((|g2| F) (|g3| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 104) (LIST |g2| |g3| |z|) (QREFELT $ 101))) 

(SDEFUN |FSPECF;elWeierstrassPInverse| ((|l| |List| F) ($ F))
        (|FSPECF;eWeierstrassPInverse| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) (SPADCALL |l| 3 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;eWeierstrassPInverseGrad_g2| ((|l| |List| F) ($ F))
        (SPROG
         ((|s2| (F)) (|s1| (F)) (|delta| (F)) (|wpi| (F)) (|z| (F)) (|g3| (F))
          (|g2| (F)))
         (SEQ
          (LETT |g2| (SPADCALL |l| 1 (QREFELT $ 97))
                . #1=(|FSPECF;eWeierstrassPInverseGrad_g2|))
          (LETT |g3| (SPADCALL |l| 2 (QREFELT $ 97)) . #1#)
          (LETT |z| (SPADCALL |l| 3 (QREFELT $ 97)) . #1#)
          (LETT |wpi| (SPADCALL |g2| |g3| |z| (QREFELT $ 105)) . #1#)
          (LETT |delta|
                (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 109))
                          (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 109))
                                    (QREFELT $ 94))
                          (QREFELT $ 110))
                . #1#)
          (LETT |s1|
                (SPADCALL
                 (SPADCALL (SPADCALL 18 |g3| (QREFELT $ 94))
                           (SPADCALL |g2| |g3| |wpi| (QREFELT $ 68))
                           (QREFELT $ 102))
                 (SPADCALL (SPADCALL |g2| 2 (QREFELT $ 109)) |wpi|
                           (QREFELT $ 102))
                 (QREFELT $ 110))
                . #1#)
          (LETT |s2|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL 36 |g3| (QREFELT $ 94))
                            (SPADCALL |z| 2 (QREFELT $ 109)) (QREFELT $ 102))
                  (SPADCALL
                   (SPADCALL 2 (SPADCALL |g2| 2 (QREFELT $ 109))
                             (QREFELT $ 94))
                   |z| (QREFELT $ 102))
                  (QREFELT $ 110))
                 (SPADCALL (SPADCALL 6 |g2| (QREFELT $ 94)) |g3|
                           (QREFELT $ 102))
                 (QREFELT $ 110))
                . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL |s1|
                      (SPADCALL |s2| (SPADCALL |g2| |g3| |wpi| (QREFELT $ 66))
                                (QREFELT $ 111))
                      (QREFELT $ 103))
            (SPADCALL 4 |delta| (QREFELT $ 94)) (QREFELT $ 111)))))) 

(SDEFUN |FSPECF;eWeierstrassPInverseGrad_g3| ((|l| |List| F) ($ F))
        (SPROG
         ((|s2| (F)) (|s1| (F)) (|delta| (F)) (|wpi| (F)) (|z| (F)) (|g3| (F))
          (|g2| (F)))
         (SEQ
          (LETT |g2| (SPADCALL |l| 1 (QREFELT $ 97))
                . #1=(|FSPECF;eWeierstrassPInverseGrad_g3|))
          (LETT |g3| (SPADCALL |l| 2 (QREFELT $ 97)) . #1#)
          (LETT |z| (SPADCALL |l| 3 (QREFELT $ 97)) . #1#)
          (LETT |wpi| (SPADCALL |g2| |g3| |z| (QREFELT $ 105)) . #1#)
          (LETT |delta|
                (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 109))
                          (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 109))
                                    (QREFELT $ 94))
                          (QREFELT $ 110))
                . #1#)
          (LETT |s1|
                (SPADCALL
                 (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 94)) |wpi|
                           (QREFELT $ 102))
                 (SPADCALL (SPADCALL 6 |g2| (QREFELT $ 94))
                           (SPADCALL |g2| |g3| |wpi| (QREFELT $ 68))
                           (QREFELT $ 102))
                 (QREFELT $ 110))
                . #1#)
          (LETT |s2|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL 12 |g2| (QREFELT $ 94))
                             (SPADCALL |z| 2 (QREFELT $ 109)) (QREFELT $ 102))
                   (QREFELT $ 112))
                  (SPADCALL (SPADCALL 18 |g3| (QREFELT $ 94)) |z|
                            (QREFELT $ 102))
                  (QREFELT $ 103))
                 (SPADCALL 2 (SPADCALL |g2| 2 (QREFELT $ 109)) (QREFELT $ 94))
                 (QREFELT $ 103))
                . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL |s1|
                      (SPADCALL |s2| (SPADCALL |g2| |g3| |wpi| (QREFELT $ 66))
                                (QREFELT $ 111))
                      (QREFELT $ 103))
            (SPADCALL 2 |delta| (QREFELT $ 94)) (QREFELT $ 111)))))) 

(SDEFUN |FSPECF;eWeierstrassPInverseGrad_z| ((|l| |List| F) ($ F))
        (SPROG ((|z| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ
                (LETT |g2| (SPADCALL |l| 1 (QREFELT $ 97))
                      . #1=(|FSPECF;eWeierstrassPInverseGrad_z|))
                (LETT |g3| (SPADCALL |l| 2 (QREFELT $ 97)) . #1#)
                (LETT |z| (SPADCALL |l| 3 (QREFELT $ 97)) . #1#)
                (EXIT
                 (SPADCALL (|spadConstant| $ 74)
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL 4 (SPADCALL |z| 3 (QREFELT $ 109))
                                        (QREFELT $ 94))
                              (SPADCALL |g2| |z| (QREFELT $ 102))
                              (QREFELT $ 110))
                             |g3| (QREFELT $ 110))
                            (QREFELT $ 115))
                           (QREFELT $ 111)))))) 

(SDEFUN |FSPECF;whittakerM;4F;33| ((|k| F) (|m| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 118) |k| |m| |z| (QREFELT $ 64))) 

(SDEFUN |FSPECF;eWhittakerM| ((|k| F) (|m| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 118) (LIST |k| |m| |z|) (QREFELT $ 101))) 

(SDEFUN |FSPECF;elWhittakerM| ((|l| |List| F) ($ F))
        (|FSPECF;eWhittakerM| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) (SPADCALL |l| 3 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;eWhittakerMGrad_z| ((|k| F) (|m| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT $ 89) (SPADCALL |k| |z| (QREFELT $ 111))
                    (QREFELT $ 110))
          (SPADCALL |k| |m| |z| (QREFELT $ 119)) (QREFELT $ 102))
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL (QREFELT $ 89) |k| (QREFELT $ 103)) |m|
                     (QREFELT $ 103))
           (SPADCALL (SPADCALL |k| (|spadConstant| $ 74) (QREFELT $ 103)) |m|
                     |z| (QREFELT $ 119))
           (QREFELT $ 102))
          |z| (QREFELT $ 111))
         (QREFELT $ 103))) 

(SDEFUN |FSPECF;dWhittakerM| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad3| |l| |t| (QREFELT $ 118)
         (CONS (|function| |FSPECF;eWhittakerMGrad_z|) $) $)) 

(SDEFUN |FSPECF;whittakerW;4F;38| ((|k| F) (|m| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 122) |k| |m| |z| (QREFELT $ 64))) 

(SDEFUN |FSPECF;eWhittakerW| ((|k| F) (|m| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 122) (LIST |k| |m| |z|) (QREFELT $ 101))) 

(SDEFUN |FSPECF;elWhittakerW| ((|l| |List| F) ($ F))
        (|FSPECF;eWhittakerW| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) (SPADCALL |l| 3 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;eWhittakerWGrad_z| ((|k| F) (|m| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT $ 89) (SPADCALL |k| |z| (QREFELT $ 111))
                    (QREFELT $ 110))
          (SPADCALL |k| |m| |z| (QREFELT $ 123)) (QREFELT $ 102))
         (SPADCALL
          (SPADCALL (SPADCALL |k| (|spadConstant| $ 74) (QREFELT $ 103)) |m|
                    |z| (QREFELT $ 123))
          |z| (QREFELT $ 111))
         (QREFELT $ 110))) 

(SDEFUN |FSPECF;dWhittakerW| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad3| |l| |t| (QREFELT $ 122)
         (CONS (|function| |FSPECF;eWhittakerWGrad_z|) $) $)) 

(SDEFUN |FSPECF;angerJ;3F;43| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 124) |v| |z| (QREFELT $ 49))) 

(SDEFUN |FSPECF;eAngerJ| ((|v| F) (|z| F) ($ F))
        (COND
         ((SPADCALL |z| (|spadConstant| $ 70) (QREFELT $ 72))
          (SPADCALL
           (SPADCALL (SPADCALL |v| (SPADCALL (QREFELT $ 126)) (QREFELT $ 102))
                     (QREFELT $ 127))
           (SPADCALL |v| (SPADCALL (QREFELT $ 126)) (QREFELT $ 102))
           (QREFELT $ 111)))
         ('T (SPADCALL (QREFELT $ 124) (LIST |v| |z|) (QREFELT $ 101))))) 

(SDEFUN |FSPECF;elAngerJ| ((|l| |List| F) ($ F))
        (|FSPECF;eAngerJ| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;eAngerJGrad_z| ((|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 74) (QREFELT $ 103)) |z|
                     (QREFELT $ 125))
           (QREFELT $ 112))
          (SPADCALL
           (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 125)) (QREFELT $ 102))
           |z| (QREFELT $ 111))
          (QREFELT $ 103))
         (SPADCALL
          (SPADCALL (SPADCALL |v| (SPADCALL (QREFELT $ 126)) (QREFELT $ 102))
                    (QREFELT $ 127))
          (SPADCALL (SPADCALL (QREFELT $ 126)) |z| (QREFELT $ 102))
          (QREFELT $ 111))
         (QREFELT $ 110))) 

(SDEFUN |FSPECF;dAngerJ| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 124)
         (CONS (|function| |FSPECF;eAngerJGrad_z|) $) $)) 

(SDEFUN |FSPECF;eeAngerJ| ((|l| |List| F) ($ F))
        (SPADCALL (QREFELT $ 124) |l| (QREFELT $ 101))) 

(SDEFUN |FSPECF;weberE;3F;49| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 128) |v| |z| (QREFELT $ 49))) 

(SDEFUN |FSPECF;eWeberE| ((|v| F) (|z| F) ($ F))
        (COND
         ((SPADCALL |z| (|spadConstant| $ 70) (QREFELT $ 72))
          (SPADCALL
           (SPADCALL 2
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL (QREFELT $ 89) |v| (QREFELT $ 102))
                                 (SPADCALL (QREFELT $ 126)) (QREFELT $ 102))
                       (QREFELT $ 127))
                      2 (QREFELT $ 130))
                     (QREFELT $ 94))
           (SPADCALL |v| (SPADCALL (QREFELT $ 126)) (QREFELT $ 102))
           (QREFELT $ 111)))
         ('T (SPADCALL (QREFELT $ 128) (LIST |v| |z|) (QREFELT $ 101))))) 

(SDEFUN |FSPECF;elWeberE| ((|l| |List| F) ($ F))
        (|FSPECF;eWeberE| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;eWeberEGrad_z| ((|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 74) (QREFELT $ 103)) |z|
                     (QREFELT $ 129))
           (QREFELT $ 112))
          (SPADCALL
           (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 129)) (QREFELT $ 102))
           |z| (QREFELT $ 111))
          (QREFELT $ 103))
         (SPADCALL
          (SPADCALL (|spadConstant| $ 74)
                    (SPADCALL
                     (SPADCALL |v| (SPADCALL (QREFELT $ 126)) (QREFELT $ 102))
                     (QREFELT $ 131))
                    (QREFELT $ 110))
          (SPADCALL (SPADCALL (QREFELT $ 126)) |z| (QREFELT $ 102))
          (QREFELT $ 111))
         (QREFELT $ 110))) 

(SDEFUN |FSPECF;dWeberE| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 128)
         (CONS (|function| |FSPECF;eWeberEGrad_z|) $) $)) 

(SDEFUN |FSPECF;eeWeberE| ((|l| |List| F) ($ F))
        (SPADCALL (QREFELT $ 128) |l| (QREFELT $ 101))) 

(SDEFUN |FSPECF;struveH;3F;55| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 132) |v| |z| (QREFELT $ 49))) 

(SDEFUN |FSPECF;eStruveH| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 132) (LIST |v| |z|) (QREFELT $ 101))) 

(SDEFUN |FSPECF;elStruveH| ((|l| |List| F) ($ F))
        (|FSPECF;eStruveH| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;eStruveHGrad_z| ((|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 74) (QREFELT $ 103)) |z|
                     (QREFELT $ 133))
           (QREFELT $ 112))
          (SPADCALL
           (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 133)) (QREFELT $ 102))
           |z| (QREFELT $ 111))
          (QREFELT $ 103))
         (SPADCALL
          (SPADCALL (SPADCALL (QREFELT $ 89) |z| (QREFELT $ 102)) |v|
                    (QREFELT $ 134))
          (SPADCALL (SPADCALL (SPADCALL (QREFELT $ 126)) (QREFELT $ 115))
                    (SPADCALL (SPADCALL |v| (QREFELT $ 96) (QREFELT $ 103))
                              (QREFELT $ 48))
                    (QREFELT $ 102))
          (QREFELT $ 111))
         (QREFELT $ 103))) 

(SDEFUN |FSPECF;dStruveH| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 132)
         (CONS (|function| |FSPECF;eStruveHGrad_z|) $) $)) 

(SDEFUN |FSPECF;struveL;3F;60| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 135) |v| |z| (QREFELT $ 49))) 

(SDEFUN |FSPECF;eStruveL| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 135) (LIST |v| |z|) (QREFELT $ 101))) 

(SDEFUN |FSPECF;elStruveL| ((|l| |List| F) ($ F))
        (|FSPECF;eStruveL| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;eStruveLGrad_z| ((|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |v| (|spadConstant| $ 74) (QREFELT $ 103)) |z|
                    (QREFELT $ 136))
          (SPADCALL
           (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 136)) (QREFELT $ 102))
           |z| (QREFELT $ 111))
          (QREFELT $ 103))
         (SPADCALL
          (SPADCALL (SPADCALL (QREFELT $ 89) |z| (QREFELT $ 102)) |v|
                    (QREFELT $ 134))
          (SPADCALL (SPADCALL (SPADCALL (QREFELT $ 126)) (QREFELT $ 115))
                    (SPADCALL (SPADCALL |v| (QREFELT $ 96) (QREFELT $ 103))
                              (QREFELT $ 48))
                    (QREFELT $ 102))
          (QREFELT $ 111))
         (QREFELT $ 103))) 

(SDEFUN |FSPECF;dStruveL| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 135)
         (CONS (|function| |FSPECF;eStruveLGrad_z|) $) $)) 

(SDEFUN |FSPECF;hankelH1;3F;65| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 137) |v| |z| (QREFELT $ 49))) 

(SDEFUN |FSPECF;eHankelH1| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 137) (LIST |v| |z|) (QREFELT $ 101))) 

(SDEFUN |FSPECF;elHankelH1| ((|l| |List| F) ($ F))
        (|FSPECF;eHankelH1| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;eHankelH1Grad_z| ((|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |v| (|spadConstant| $ 74) (QREFELT $ 103)) |z|
                    (QREFELT $ 138))
          (QREFELT $ 112))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 138)) (QREFELT $ 102)) |z|
          (QREFELT $ 111))
         (QREFELT $ 103))) 

(SDEFUN |FSPECF;dHankelH1| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 137)
         (CONS (|function| |FSPECF;eHankelH1Grad_z|) $) $)) 

(SDEFUN |FSPECF;hankelH2;3F;70| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 139) |v| |z| (QREFELT $ 49))) 

(SDEFUN |FSPECF;eHankelH2| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 139) (LIST |v| |z|) (QREFELT $ 101))) 

(SDEFUN |FSPECF;elHankelH2| ((|l| |List| F) ($ F))
        (|FSPECF;eHankelH2| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;eHankelH2Grad_z| ((|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |v| (|spadConstant| $ 74) (QREFELT $ 103)) |z|
                    (QREFELT $ 140))
          (QREFELT $ 112))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 140)) (QREFELT $ 102)) |z|
          (QREFELT $ 111))
         (QREFELT $ 103))) 

(SDEFUN |FSPECF;dHankelH2| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 139)
         (CONS (|function| |FSPECF;eHankelH2Grad_z|) $) $)) 

(SDEFUN |FSPECF;lommelS1;4F;75| ((|m| F) (|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 141) |m| |v| |z| (QREFELT $ 64))) 

(SDEFUN |FSPECF;eLommelS1| ((|m| F) (|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 141) (LIST |m| |v| |z|) (QREFELT $ 101))) 

(SDEFUN |FSPECF;elLommelS1| ((|l| |List| F) ($ F))
        (|FSPECF;eLommelS1| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) (SPADCALL |l| 3 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;eLommelS1Grad_z| ((|m| F) (|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL |v| (SPADCALL |m| |v| |z| (QREFELT $ 142))
                     (QREFELT $ 102))
           |z| (QREFELT $ 111))
          (QREFELT $ 112))
         (SPADCALL
          (SPADCALL (SPADCALL |m| |v| (QREFELT $ 103)) (|spadConstant| $ 74)
                    (QREFELT $ 110))
          (SPADCALL (SPADCALL |m| (|spadConstant| $ 74) (QREFELT $ 110))
                    (SPADCALL |v| (|spadConstant| $ 74) (QREFELT $ 110)) |z|
                    (QREFELT $ 142))
          (QREFELT $ 102))
         (QREFELT $ 103))) 

(SDEFUN |FSPECF;dLommelS1| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad3| |l| |t| (QREFELT $ 141)
         (CONS (|function| |FSPECF;eLommelS1Grad_z|) $) $)) 

(SDEFUN |FSPECF;lommelS2;4F;80| ((|mu| F) (|nu| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 143) |mu| |nu| |z| (QREFELT $ 64))) 

(SDEFUN |FSPECF;eLommelS2| ((|mu| F) (|nu| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 143) (LIST |mu| |nu| |z|) (QREFELT $ 101))) 

(SDEFUN |FSPECF;elLommelS2| ((|l| |List| F) ($ F))
        (|FSPECF;eLommelS2| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) (SPADCALL |l| 3 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;eLommelS2Grad_z| ((|m| F) (|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL |v| (SPADCALL |m| |v| |z| (QREFELT $ 144))
                     (QREFELT $ 102))
           |z| (QREFELT $ 111))
          (QREFELT $ 112))
         (SPADCALL
          (SPADCALL (SPADCALL |m| |v| (QREFELT $ 103)) (|spadConstant| $ 74)
                    (QREFELT $ 110))
          (SPADCALL (SPADCALL |m| (|spadConstant| $ 74) (QREFELT $ 110))
                    (SPADCALL |v| (|spadConstant| $ 74) (QREFELT $ 110)) |z|
                    (QREFELT $ 144))
          (QREFELT $ 102))
         (QREFELT $ 103))) 

(SDEFUN |FSPECF;dLommelS2| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad3| |l| |t| (QREFELT $ 143)
         (CONS (|function| |FSPECF;eLommelS2Grad_z|) $) $)) 

(SDEFUN |FSPECF;kummerM;4F;85| ((|mu| F) (|nu| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 145) |mu| |nu| |z| (QREFELT $ 64))) 

(SDEFUN |FSPECF;eKummerM| ((|a| F) (|b| F) (|z| F) ($ F))
        (COND
         ((SPADCALL |z| (|spadConstant| $ 70) (QREFELT $ 72))
          (|spadConstant| $ 74))
         ('T (SPADCALL (QREFELT $ 145) (LIST |a| |b| |z|) (QREFELT $ 101))))) 

(SDEFUN |FSPECF;elKummerM| ((|l| |List| F) ($ F))
        (|FSPECF;eKummerM| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) (SPADCALL |l| 3 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;eKummerMGrad_z| ((|a| F) (|b| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |z| |a| (QREFELT $ 103)) |b| (QREFELT $ 110))
           (SPADCALL |a| |b| |z| (QREFELT $ 146)) (QREFELT $ 102))
          (SPADCALL (SPADCALL |b| |a| (QREFELT $ 110))
                    (SPADCALL
                     (SPADCALL |a| (|spadConstant| $ 74) (QREFELT $ 110)) |b|
                     |z| (QREFELT $ 146))
                    (QREFELT $ 102))
          (QREFELT $ 103))
         |z| (QREFELT $ 111))) 

(SDEFUN |FSPECF;dKummerM| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad3| |l| |t| (QREFELT $ 145)
         (CONS (|function| |FSPECF;eKummerMGrad_z|) $) $)) 

(SDEFUN |FSPECF;kummerU;4F;90| ((|a| F) (|b| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 147) |a| |b| |z| (QREFELT $ 64))) 

(SDEFUN |FSPECF;eKummerU| ((|a| F) (|b| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 147) (LIST |a| |b| |z|) (QREFELT $ 101))) 

(SDEFUN |FSPECF;elKummerU| ((|l| |List| F) ($ F))
        (|FSPECF;eKummerU| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) (SPADCALL |l| 3 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;eKummerUGrad_z| ((|a| F) (|b| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |z| |a| (QREFELT $ 103)) |b| (QREFELT $ 110))
           (SPADCALL |a| |b| |z| (QREFELT $ 148)) (QREFELT $ 102))
          (SPADCALL (SPADCALL |a| (|spadConstant| $ 74) (QREFELT $ 110)) |b|
                    |z| (QREFELT $ 148))
          (QREFELT $ 110))
         |z| (QREFELT $ 111))) 

(SDEFUN |FSPECF;dKummerU| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad3| |l| |t| (QREFELT $ 147)
         (CONS (|function| |FSPECF;eKummerUGrad_z|) $) $)) 

(SDEFUN |FSPECF;legendreP;4F;95| ((|nu| F) (|mu| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 149) |nu| |mu| |z| (QREFELT $ 64))) 

(SDEFUN |FSPECF;eLegendreP| ((|nu| F) (|mu| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 149) (LIST |nu| |mu| |z|) (QREFELT $ 101))) 

(SDEFUN |FSPECF;elLegendreP| ((|l| |List| F) ($ F))
        (|FSPECF;eLegendreP| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) (SPADCALL |l| 3 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;eLegendrePGrad_z| ((|nu| F) (|mu| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |nu| |mu| (QREFELT $ 110)) (|spadConstant| $ 74)
                    (QREFELT $ 103))
          (SPADCALL (SPADCALL |nu| (|spadConstant| $ 74) (QREFELT $ 103)) |mu|
                    |z| (QREFELT $ 150))
          (QREFELT $ 102))
         (SPADCALL
          (SPADCALL (SPADCALL |nu| (|spadConstant| $ 74) (QREFELT $ 103)) |z|
                    (QREFELT $ 102))
          (SPADCALL |nu| |mu| |z| (QREFELT $ 150)) (QREFELT $ 102))
         (QREFELT $ 110))) 

(SDEFUN |FSPECF;dLegendreP| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad3| |l| |t| (QREFELT $ 149)
         (CONS (|function| |FSPECF;eLegendrePGrad_z|) $) $)) 

(SDEFUN |FSPECF;legendreQ;4F;100| ((|nu| F) (|mu| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 151) |nu| |mu| |z| (QREFELT $ 64))) 

(SDEFUN |FSPECF;eLegendreQ| ((|nu| F) (|mu| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 151) (LIST |nu| |mu| |z|) (QREFELT $ 101))) 

(SDEFUN |FSPECF;elLegendreQ| ((|l| |List| F) ($ F))
        (|FSPECF;eLegendreQ| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) (SPADCALL |l| 3 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;eLegendreQGrad_z| ((|nu| F) (|mu| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |nu| |mu| (QREFELT $ 110)) (|spadConstant| $ 74)
                    (QREFELT $ 103))
          (SPADCALL (SPADCALL |nu| (|spadConstant| $ 74) (QREFELT $ 103)) |mu|
                    |z| (QREFELT $ 152))
          (QREFELT $ 102))
         (SPADCALL
          (SPADCALL (SPADCALL |nu| (|spadConstant| $ 74) (QREFELT $ 103)) |z|
                    (QREFELT $ 102))
          (SPADCALL |nu| |mu| |z| (QREFELT $ 152)) (QREFELT $ 102))
         (QREFELT $ 110))) 

(SDEFUN |FSPECF;dLegendreQ| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad3| |l| |t| (QREFELT $ 151)
         (CONS (|function| |FSPECF;eLegendreQGrad_z|) $) $)) 

(SDEFUN |FSPECF;kelvinBei;3F;105| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 153) |v| |z| (QREFELT $ 49))) 

(SDEFUN |FSPECF;eKelvinBei| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 153) (LIST |v| |z|) (QREFELT $ 101))) 

(SDEFUN |FSPECF;elKelvinBei| ((|l| |List| F) ($ F))
        (|FSPECF;eKelvinBei| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;eKelvinBeiGrad_z| ((|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT $ 89)
                    (SPADCALL (SPADCALL 2 (QREFELT $ 78)) (QREFELT $ 115))
                    (QREFELT $ 102))
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 74) (QREFELT $ 103)) |z|
                     (QREFELT $ 154))
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 74) (QREFELT $ 103)) |z|
                     (QREFELT $ 155))
           (QREFELT $ 110))
          (QREFELT $ 102))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 154)) (QREFELT $ 102)) |z|
          (QREFELT $ 111))
         (QREFELT $ 103))) 

(SDEFUN |FSPECF;dKelvinBei| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 153)
         (CONS (|function| |FSPECF;eKelvinBeiGrad_z|) $) $)) 

(SDEFUN |FSPECF;kelvinBer;3F;110| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 156) |v| |z| (QREFELT $ 49))) 

(SDEFUN |FSPECF;eKelvinBer| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 156) (LIST |v| |z|) (QREFELT $ 101))) 

(SDEFUN |FSPECF;elKelvinBer| ((|l| |List| F) ($ F))
        (|FSPECF;eKelvinBer| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;eKelvinBerGrad_z| ((|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT $ 89)
                    (SPADCALL (SPADCALL 2 (QREFELT $ 78)) (QREFELT $ 115))
                    (QREFELT $ 102))
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 74) (QREFELT $ 103)) |z|
                     (QREFELT $ 155))
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 74) (QREFELT $ 103)) |z|
                     (QREFELT $ 154))
           (QREFELT $ 103))
          (QREFELT $ 102))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 155)) (QREFELT $ 102)) |z|
          (QREFELT $ 111))
         (QREFELT $ 103))) 

(SDEFUN |FSPECF;dKelvinBer| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 156)
         (CONS (|function| |FSPECF;eKelvinBerGrad_z|) $) $)) 

(SDEFUN |FSPECF;kelvinKei;3F;115| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 157) |v| |z| (QREFELT $ 49))) 

(SDEFUN |FSPECF;eKelvinKei| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 157) (LIST |v| |z|) (QREFELT $ 101))) 

(SDEFUN |FSPECF;elKelvinKei| ((|l| |List| F) ($ F))
        (|FSPECF;eKelvinKei| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;eKelvinKeiGrad_z| ((|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT $ 89)
                    (SPADCALL (SPADCALL 2 (QREFELT $ 78)) (QREFELT $ 115))
                    (QREFELT $ 102))
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 74) (QREFELT $ 103)) |z|
                     (QREFELT $ 158))
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 74) (QREFELT $ 103)) |z|
                     (QREFELT $ 159))
           (QREFELT $ 110))
          (QREFELT $ 102))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 158)) (QREFELT $ 102)) |z|
          (QREFELT $ 111))
         (QREFELT $ 103))) 

(SDEFUN |FSPECF;dKelvinKei| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 157)
         (CONS (|function| |FSPECF;eKelvinKeiGrad_z|) $) $)) 

(SDEFUN |FSPECF;kelvinKer;3F;120| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 160) |v| |z| (QREFELT $ 49))) 

(SDEFUN |FSPECF;eKelvinKer| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 160) (LIST |v| |z|) (QREFELT $ 101))) 

(SDEFUN |FSPECF;elKelvinKer| ((|l| |List| F) ($ F))
        (|FSPECF;eKelvinKer| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;eKelvinKerGrad_z| ((|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT $ 89)
                    (SPADCALL (SPADCALL 2 (QREFELT $ 78)) (QREFELT $ 115))
                    (QREFELT $ 102))
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 74) (QREFELT $ 103)) |z|
                     (QREFELT $ 159))
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 74) (QREFELT $ 103)) |z|
                     (QREFELT $ 158))
           (QREFELT $ 103))
          (QREFELT $ 102))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 159)) (QREFELT $ 102)) |z|
          (QREFELT $ 111))
         (QREFELT $ 103))) 

(SDEFUN |FSPECF;dKelvinKer| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 160)
         (CONS (|function| |FSPECF;eKelvinKerGrad_z|) $) $)) 

(SDEFUN |FSPECF;ellipticK;2F;125| ((|m| F) ($ F))
        (SPADCALL (QREFELT $ 161) |m| (QREFELT $ 45))) 

(SDEFUN |FSPECF;eEllipticK| ((|m| F) ($ F))
        (SPADCALL (QREFELT $ 161) (LIST |m|) (QREFELT $ 101))) 

(SDEFUN |FSPECF;elEllipticK| ((|l| |List| F) ($ F))
        (|FSPECF;eEllipticK| (SPADCALL |l| 1 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;dEllipticK| ((|m| F) ($ F))
        (SPADCALL
         (SPADCALL (QREFELT $ 89)
                   (SPADCALL (SPADCALL |m| (QREFELT $ 163))
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 74) |m|
                                        (QREFELT $ 110))
                              (SPADCALL |m| (QREFELT $ 162)) (QREFELT $ 102))
                             (QREFELT $ 110))
                   (QREFELT $ 102))
         (SPADCALL |m| (SPADCALL (|spadConstant| $ 74) |m| (QREFELT $ 110))
                   (QREFELT $ 102))
         (QREFELT $ 111))) 

(SDEFUN |FSPECF;ellipticE;2F;129| ((|m| F) ($ F))
        (SPADCALL (QREFELT $ 168) |m| (QREFELT $ 45))) 

(SDEFUN |FSPECF;eEllipticE| ((|m| F) ($ F))
        (SPADCALL (QREFELT $ 168) (LIST |m|) (QREFELT $ 101))) 

(SDEFUN |FSPECF;elEllipticE| ((|l| |List| F) ($ F))
        (|FSPECF;eEllipticE| (SPADCALL |l| 1 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;dEllipticE| ((|m| F) ($ F))
        (SPADCALL
         (SPADCALL (QREFELT $ 89)
                   (SPADCALL (SPADCALL |m| (QREFELT $ 163))
                             (SPADCALL |m| (QREFELT $ 162)) (QREFELT $ 110))
                   (QREFELT $ 102))
         |m| (QREFELT $ 111))) 

(SDEFUN |FSPECF;ellipticE;3F;133| ((|z| F) (|m| F) ($ F))
        (SPADCALL (QREFELT $ 169) |z| |m| (QREFELT $ 49))) 

(SDEFUN |FSPECF;eEllipticE2| ((|z| F) (|m| F) ($ F))
        (COND
         ((SPADCALL |z| (|spadConstant| $ 70) (QREFELT $ 72))
          (|spadConstant| $ 70))
         ((SPADCALL |z| (|spadConstant| $ 74) (QREFELT $ 72))
          (|FSPECF;eEllipticE| |m| $))
         ('T (SPADCALL (QREFELT $ 169) (LIST |z| |m|) (QREFELT $ 101))))) 

(SDEFUN |FSPECF;elEllipticE2| ((|l| |List| F) ($ F))
        (|FSPECF;eEllipticE2| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;eEllipticE2Grad_z| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 97))
                      . #1=(|FSPECF;eEllipticE2Grad_z|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 97)) . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 74)
                             (SPADCALL |m| (SPADCALL |z| 2 (QREFELT $ 109))
                                       (QREFELT $ 102))
                             (QREFELT $ 110))
                   (QREFELT $ 115))
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 74)
                             (SPADCALL |z| 2 (QREFELT $ 109)) (QREFELT $ 110))
                   (QREFELT $ 115))
                  (QREFELT $ 111)))))) 

(SDEFUN |FSPECF;eEllipticE2Grad_m| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 97))
                      . #1=(|FSPECF;eEllipticE2Grad_m|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 97)) . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL (QREFELT $ 89)
                            (SPADCALL (SPADCALL |z| |m| (QREFELT $ 170))
                                      (SPADCALL |z| |m| (QREFELT $ 171))
                                      (QREFELT $ 110))
                            (QREFELT $ 102))
                  |m| (QREFELT $ 111)))))) 

(SDEFUN |FSPECF;inEllipticE2| ((|li| |List| (|InputForm|)) ($ |InputForm|))
        (SPADCALL (CONS (SPADCALL '|ellipticE| (QREFELT $ 173)) |li|)
                  (QREFELT $ 174))) 

(SDEFUN |FSPECF;ellipticF;3F;139| ((|z| F) (|m| F) ($ F))
        (SPADCALL (QREFELT $ 177) |z| |m| (QREFELT $ 49))) 

(SDEFUN |FSPECF;eEllipticF| ((|z| F) (|m| F) ($ F))
        (COND
         ((SPADCALL |z| (|spadConstant| $ 70) (QREFELT $ 72))
          (|spadConstant| $ 70))
         ((SPADCALL |z| (|spadConstant| $ 74) (QREFELT $ 72))
          (SPADCALL |m| (QREFELT $ 162)))
         ('T (SPADCALL (QREFELT $ 177) (LIST |z| |m|) (QREFELT $ 101))))) 

(SDEFUN |FSPECF;elEllipticF| ((|l| |List| F) ($ F))
        (|FSPECF;eEllipticF| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;eEllipticFGrad_z| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 97))
                      . #1=(|FSPECF;eEllipticFGrad_z|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 97)) . #1#)
                (EXIT
                 (SPADCALL (|spadConstant| $ 74)
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 74)
                                       (SPADCALL |m|
                                                 (SPADCALL |z| 2
                                                           (QREFELT $ 109))
                                                 (QREFELT $ 102))
                                       (QREFELT $ 110))
                             (QREFELT $ 115))
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 74)
                                       (SPADCALL |z| 2 (QREFELT $ 109))
                                       (QREFELT $ 110))
                             (QREFELT $ 115))
                            (QREFELT $ 102))
                           (QREFELT $ 111)))))) 

(SDEFUN |FSPECF;eEllipticFGrad_m| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 97))
                      . #1=(|FSPECF;eEllipticFGrad_m|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 97)) . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL (QREFELT $ 89)
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (SPADCALL |z| |m| (QREFELT $ 170))
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| $ 74) |m|
                                                   (QREFELT $ 110))
                                         (SPADCALL |z| |m| (QREFELT $ 171))
                                         (QREFELT $ 102))
                                        (QREFELT $ 110))
                              |m| (QREFELT $ 111))
                             (SPADCALL
                              (SPADCALL |z|
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| $ 74)
                                                   (SPADCALL |z| 2
                                                             (QREFELT $ 109))
                                                   (QREFELT $ 110))
                                         (QREFELT $ 115))
                                        (QREFELT $ 102))
                              (SPADCALL
                               (SPADCALL (|spadConstant| $ 74)
                                         (SPADCALL |m|
                                                   (SPADCALL |z| 2
                                                             (QREFELT $ 109))
                                                   (QREFELT $ 102))
                                         (QREFELT $ 110))
                               (QREFELT $ 115))
                              (QREFELT $ 111))
                             (QREFELT $ 110))
                            (QREFELT $ 102))
                  (SPADCALL (|spadConstant| $ 74) |m| (QREFELT $ 110))
                  (QREFELT $ 111)))))) 

(SDEFUN |FSPECF;ellipticPi;4F;144| ((|z| F) (|n| F) (|m| F) ($ F))
        (SPADCALL (QREFELT $ 178) |z| |n| |m| (QREFELT $ 64))) 

(SDEFUN |FSPECF;eEllipticPi| ((|z| F) (|n| F) (|m| F) ($ F))
        (COND
         ((SPADCALL |z| (|spadConstant| $ 70) (QREFELT $ 72))
          (|spadConstant| $ 70))
         ('T (SPADCALL (QREFELT $ 178) (LIST |z| |n| |m|) (QREFELT $ 101))))) 

(SDEFUN |FSPECF;elEllipticPi| ((|l| |List| F) ($ F))
        (|FSPECF;eEllipticPi| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) (SPADCALL |l| 3 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;eEllipticPiGrad_z| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|n| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 97))
                      . #1=(|FSPECF;eEllipticPiGrad_z|))
                (LETT |n| (SPADCALL |l| 2 (QREFELT $ 97)) . #1#)
                (LETT |m| (SPADCALL |l| 3 (QREFELT $ 97)) . #1#)
                (EXIT
                 (SPADCALL (|spadConstant| $ 74)
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 74)
                                       (SPADCALL |n|
                                                 (SPADCALL |z| 2
                                                           (QREFELT $ 109))
                                                 (QREFELT $ 102))
                                       (QREFELT $ 110))
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 74)
                                        (SPADCALL |m|
                                                  (SPADCALL |z| 2
                                                            (QREFELT $ 109))
                                                  (QREFELT $ 102))
                                        (QREFELT $ 110))
                              (QREFELT $ 115))
                             (QREFELT $ 102))
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 74)
                                       (SPADCALL |z| 2 (QREFELT $ 109))
                                       (QREFELT $ 110))
                             (QREFELT $ 115))
                            (QREFELT $ 102))
                           (QREFELT $ 111)))))) 

(SDEFUN |FSPECF;eEllipticPiGrad_n| ((|l| |List| F) ($ F))
        (SPROG
         ((|t4| (F)) (|t3| (F)) (|t2| (F)) (|t1| (F)) (|m| (F)) (|n| (F))
          (|z| (F)))
         (SEQ
          (LETT |z| (SPADCALL |l| 1 (QREFELT $ 97))
                . #1=(|FSPECF;eEllipticPiGrad_n|))
          (LETT |n| (SPADCALL |l| 2 (QREFELT $ 97)) . #1#)
          (LETT |m| (SPADCALL |l| 3 (QREFELT $ 97)) . #1#)
          (LETT |t1|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL |n| 2 (QREFELT $ 109)) |m|
                             (QREFELT $ 110))
                   (SPADCALL |z| |n| |m| (QREFELT $ 179)) (QREFELT $ 102))
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL |n| (|spadConstant| $ 74) (QREFELT $ 110))
                    (SPADCALL |n| |m| (QREFELT $ 110)) (QREFELT $ 102))
                   |n| (QREFELT $ 102))
                  (QREFELT $ 111))
                 (QREFELT $ 112))
                . #1#)
          (LETT |t2|
                (SPADCALL (SPADCALL |z| |m| (QREFELT $ 171))
                          (SPADCALL
                           (SPADCALL |n| (|spadConstant| $ 74) (QREFELT $ 110))
                           |n| (QREFELT $ 102))
                          (QREFELT $ 111))
                . #1#)
          (LETT |t3|
                (SPADCALL
                 (SPADCALL (SPADCALL |z| |m| (QREFELT $ 170))
                           (SPADCALL
                            (SPADCALL |n| (|spadConstant| $ 74)
                                      (QREFELT $ 110))
                            (SPADCALL |n| |m| (QREFELT $ 110)) (QREFELT $ 102))
                           (QREFELT $ 111))
                 (QREFELT $ 112))
                . #1#)
          (LETT |t4|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |n| |z| (QREFELT $ 102))
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 74)
                                       (SPADCALL |m|
                                                 (SPADCALL |z| 2
                                                           (QREFELT $ 109))
                                                 (QREFELT $ 102))
                                       (QREFELT $ 110))
                             (QREFELT $ 115))
                            (QREFELT $ 102))
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 74)
                             (SPADCALL |z| 2 (QREFELT $ 109)) (QREFELT $ 110))
                   (QREFELT $ 115))
                  (QREFELT $ 102))
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 74)
                             (SPADCALL |n| (SPADCALL |z| 2 (QREFELT $ 109))
                                       (QREFELT $ 102))
                             (QREFELT $ 110))
                   (SPADCALL |n| (|spadConstant| $ 74) (QREFELT $ 110))
                   (QREFELT $ 102))
                  (SPADCALL |n| |m| (QREFELT $ 110)) (QREFELT $ 102))
                 (QREFELT $ 111))
                . #1#)
          (EXIT
           (SPADCALL (QREFELT $ 89)
                     (SPADCALL
                      (SPADCALL (SPADCALL |t1| |t2| (QREFELT $ 103)) |t3|
                                (QREFELT $ 103))
                      |t4| (QREFELT $ 103))
                     (QREFELT $ 102)))))) 

(SDEFUN |FSPECF;eEllipticPiGrad_m| ((|l| |List| F) ($ F))
        (SPROG ((|t2| (F)) (|t1| (F)) (|m| (F)) (|n| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 97))
                      . #1=(|FSPECF;eEllipticPiGrad_m|))
                (LETT |n| (SPADCALL |l| 2 (QREFELT $ 97)) . #1#)
                (LETT |m| (SPADCALL |l| 3 (QREFELT $ 97)) . #1#)
                (LETT |t1|
                      (SPADCALL
                       (SPADCALL (SPADCALL |m| |z| (QREFELT $ 102))
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| $ 74)
                                            (SPADCALL |z| 2 (QREFELT $ 109))
                                            (QREFELT $ 110))
                                  (QREFELT $ 115))
                                 (QREFELT $ 102))
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 74)
                                  (SPADCALL |m|
                                            (SPADCALL |z| 2 (QREFELT $ 109))
                                            (QREFELT $ 102))
                                  (QREFELT $ 110))
                        (QREFELT $ 115))
                       (QREFELT $ 111))
                      . #1#)
                (LETT |t2|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |z| |m| (QREFELT $ 170))
                                  (QREFELT $ 112))
                        |t1| (QREFELT $ 103))
                       (SPADCALL (|spadConstant| $ 74) |m| (QREFELT $ 110))
                       (QREFELT $ 111))
                      . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL (QREFELT $ 89)
                            (SPADCALL (SPADCALL |z| |n| |m| (QREFELT $ 179))
                                      |t2| (QREFELT $ 103))
                            (QREFELT $ 102))
                  (SPADCALL |n| |m| (QREFELT $ 110)) (QREFELT $ 111)))))) 

(SDEFUN |FSPECF;jacobiSn;3F;150| ((|z| F) (|m| F) ($ F))
        (SPADCALL (QREFELT $ 180) |z| |m| (QREFELT $ 49))) 

(SDEFUN |FSPECF;eJacobiSn| ((|z| F) (|m| F) ($ F))
        (SPROG ((#1=#:G1155 NIL) (|args| (|List| F)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |z| (|spadConstant| $ 70) (QREFELT $ 72))
                   (|spadConstant| $ 70))
                  ('T
                   (SEQ
                    (COND
                     ((SPADCALL |z| (QREFELT $ 177) (QREFELT $ 182))
                      (SEQ
                       (LETT |args|
                             (SPADCALL (SPADCALL |z| (QREFELT $ 184))
                                       (QREFELT $ 186))
                             . #2=(|FSPECF;eJacobiSn|))
                       (EXIT
                        (COND
                         ((SPADCALL |m| (SPADCALL |args| 2 (QREFELT $ 97))
                                    (QREFELT $ 72))
                          (PROGN
                           (LETT #1# (SPADCALL |args| 1 (QREFELT $ 97)) . #2#)
                           (GO #3=#:G1154))))))))
                    (EXIT
                     (SPADCALL (QREFELT $ 180) (LIST |z| |m|)
                               (QREFELT $ 101)))))))
                #3# (EXIT #1#)))) 

(SDEFUN |FSPECF;elJacobiSn| ((|l| |List| F) ($ F))
        (|FSPECF;eJacobiSn| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;jacobiGradHelper| ((|z| F) (|m| F) ($ F))
        (SPADCALL
         (SPADCALL |z|
                   (SPADCALL
                    (SPADCALL (SPADCALL |z| |m| (QREFELT $ 181)) |m|
                              (QREFELT $ 170))
                    (SPADCALL (|spadConstant| $ 74) |m| (QREFELT $ 110))
                    (QREFELT $ 111))
                   (QREFELT $ 110))
         |m| (QREFELT $ 111))) 

(SDEFUN |FSPECF;eJacobiSnGrad_z| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 97))
                      . #1=(|FSPECF;eJacobiSnGrad_z|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 97)) . #1#)
                (EXIT
                 (SPADCALL (SPADCALL |z| |m| (QREFELT $ 187))
                           (SPADCALL |z| |m| (QREFELT $ 188))
                           (QREFELT $ 102)))))) 

(SDEFUN |FSPECF;eJacobiSnGrad_m| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 97))
                      . #1=(|FSPECF;eJacobiSnGrad_m|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 97)) . #1#)
                (EXIT
                 (SPADCALL (QREFELT $ 89)
                           (SPADCALL
                            (SPADCALL (|FSPECF;eJacobiSnGrad_z| |l| $)
                                      (|FSPECF;jacobiGradHelper| |z| |m| $)
                                      (QREFELT $ 102))
                            (SPADCALL
                             (SPADCALL (SPADCALL |z| |m| (QREFELT $ 181))
                                       (SPADCALL
                                        (SPADCALL |z| |m| (QREFELT $ 187)) 2
                                        (QREFELT $ 130))
                                       (QREFELT $ 102))
                             (SPADCALL (|spadConstant| $ 74) |m|
                                       (QREFELT $ 110))
                             (QREFELT $ 111))
                            (QREFELT $ 103))
                           (QREFELT $ 102)))))) 

(SDEFUN |FSPECF;jacobiCn;3F;156| ((|z| F) (|m| F) ($ F))
        (SPADCALL (QREFELT $ 189) |z| |m| (QREFELT $ 49))) 

(SDEFUN |FSPECF;eJacobiCn| ((|z| F) (|m| F) ($ F))
        (COND
         ((SPADCALL |z| (|spadConstant| $ 70) (QREFELT $ 72))
          (|spadConstant| $ 74))
         ('T (SPADCALL (QREFELT $ 189) (LIST |z| |m|) (QREFELT $ 101))))) 

(SDEFUN |FSPECF;elJacobiCn| ((|l| |List| F) ($ F))
        (|FSPECF;eJacobiCn| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;eJacobiCnGrad_z| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 97))
                      . #1=(|FSPECF;eJacobiCnGrad_z|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 97)) . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL (SPADCALL |z| |m| (QREFELT $ 181))
                            (SPADCALL |z| |m| (QREFELT $ 188)) (QREFELT $ 102))
                  (QREFELT $ 112)))))) 

(SDEFUN |FSPECF;eJacobiCnGrad_m| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 97))
                      . #1=(|FSPECF;eJacobiCnGrad_m|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 97)) . #1#)
                (EXIT
                 (SPADCALL (QREFELT $ 89)
                           (SPADCALL
                            (SPADCALL (|FSPECF;eJacobiCnGrad_z| |l| $)
                                      (|FSPECF;jacobiGradHelper| |z| |m| $)
                                      (QREFELT $ 102))
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (SPADCALL |z| |m| (QREFELT $ 181)) 2
                                        (QREFELT $ 130))
                              (SPADCALL |z| |m| (QREFELT $ 187))
                              (QREFELT $ 102))
                             (SPADCALL (|spadConstant| $ 74) |m|
                                       (QREFELT $ 110))
                             (QREFELT $ 111))
                            (QREFELT $ 110))
                           (QREFELT $ 102)))))) 

(SDEFUN |FSPECF;jacobiDn;3F;161| ((|z| F) (|m| F) ($ F))
        (SPADCALL (QREFELT $ 190) |z| |m| (QREFELT $ 49))) 

(SDEFUN |FSPECF;eJacobiDn| ((|z| F) (|m| F) ($ F))
        (COND
         ((SPADCALL |z| (|spadConstant| $ 70) (QREFELT $ 72))
          (|spadConstant| $ 74))
         ('T (SPADCALL (QREFELT $ 190) (LIST |z| |m|) (QREFELT $ 101))))) 

(SDEFUN |FSPECF;elJacobiDn| ((|l| |List| F) ($ F))
        (|FSPECF;eJacobiDn| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;eJacobiDnGrad_z| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 97))
                      . #1=(|FSPECF;eJacobiDnGrad_z|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 97)) . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL |m| (SPADCALL |z| |m| (QREFELT $ 181))
                             (QREFELT $ 102))
                   (SPADCALL |z| |m| (QREFELT $ 187)) (QREFELT $ 102))
                  (QREFELT $ 112)))))) 

(SDEFUN |FSPECF;eJacobiDnGrad_m| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 97))
                      . #1=(|FSPECF;eJacobiDnGrad_m|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 97)) . #1#)
                (EXIT
                 (SPADCALL (QREFELT $ 89)
                           (SPADCALL
                            (SPADCALL (|FSPECF;eJacobiDnGrad_z| |l| $)
                                      (|FSPECF;jacobiGradHelper| |z| |m| $)
                                      (QREFELT $ 102))
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (SPADCALL |z| |m| (QREFELT $ 181)) 2
                                        (QREFELT $ 130))
                              (SPADCALL |z| |m| (QREFELT $ 188))
                              (QREFELT $ 102))
                             (SPADCALL (|spadConstant| $ 74) |m|
                                       (QREFELT $ 110))
                             (QREFELT $ 111))
                            (QREFELT $ 110))
                           (QREFELT $ 102)))))) 

(SDEFUN |FSPECF;jacobiZeta;3F;166| ((|z| F) (|m| F) ($ F))
        (SPADCALL (QREFELT $ 191) |z| |m| (QREFELT $ 49))) 

(SDEFUN |FSPECF;eJacobiZeta| ((|z| F) (|m| F) ($ F))
        (COND
         ((SPADCALL |z| (|spadConstant| $ 70) (QREFELT $ 72))
          (|spadConstant| $ 70))
         ('T (SPADCALL (QREFELT $ 191) (LIST |z| |m|) (QREFELT $ 101))))) 

(SDEFUN |FSPECF;elJacobiZeta| ((|l| |List| F) ($ F))
        (|FSPECF;eJacobiZeta| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;eJacobiZetaGrad_z| ((|l| |List| F) ($ F))
        (SPROG ((|dn| (F)) (|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 97))
                      . #1=(|FSPECF;eJacobiZetaGrad_z|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 97)) . #1#)
                (LETT |dn| (SPADCALL |z| |m| (QREFELT $ 188)) . #1#)
                (EXIT
                 (SPADCALL (SPADCALL |dn| |dn| (QREFELT $ 102))
                           (SPADCALL (SPADCALL |m| (QREFELT $ 163))
                                     (SPADCALL |m| (QREFELT $ 162))
                                     (QREFELT $ 111))
                           (QREFELT $ 110)))))) 

(SDEFUN |FSPECF;eJacobiZetaGrad_m| ((|l| |List| F) ($ F))
        (SPROG
         ((|res4| (F)) (|res3| (F)) (|res2| (F)) (|res1| (F)) (|dn| (F))
          (|er| (F)) (|ee| (F)) (|ek| (F)) (|m| (F)) (|z| (F)))
         (SEQ
          (LETT |z| (SPADCALL |l| 1 (QREFELT $ 97))
                . #1=(|FSPECF;eJacobiZetaGrad_m|))
          (LETT |m| (SPADCALL |l| 2 (QREFELT $ 97)) . #1#)
          (LETT |ek| (SPADCALL |m| (QREFELT $ 162)) . #1#)
          (LETT |ee| (SPADCALL |m| (QREFELT $ 163)) . #1#)
          (LETT |er| (SPADCALL |ee| |ek| (QREFELT $ 111)) . #1#)
          (LETT |dn| (SPADCALL |z| |m| (QREFELT $ 188)) . #1#)
          (LETT |res1|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |dn| |dn| (QREFELT $ 102)) |m|
                            (QREFELT $ 103))
                  (|spadConstant| $ 74) (QREFELT $ 110))
                 (SPADCALL |z| |m| (QREFELT $ 192)) (QREFELT $ 102))
                . #1#)
          (LETT |res2|
                (SPADCALL |res1|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL |m| (|spadConstant| $ 74)
                                       (QREFELT $ 110))
                             |z| (QREFELT $ 102))
                            |dn| (QREFELT $ 102))
                           |dn| (QREFELT $ 102))
                          (QREFELT $ 103))
                . #1#)
          (LETT |res3|
                (SPADCALL |res2|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL |m| (SPADCALL |z| |m| (QREFELT $ 187))
                                      (QREFELT $ 102))
                            (SPADCALL |z| |m| (QREFELT $ 188)) (QREFELT $ 102))
                           (SPADCALL |z| |m| (QREFELT $ 181)) (QREFELT $ 102))
                          (QREFELT $ 110))
                . #1#)
          (LETT |res4|
                (SPADCALL |res3|
                          (SPADCALL
                           (SPADCALL |z|
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| $ 74) |m|
                                                (QREFELT $ 110))
                                      (SPADCALL |dn| |dn| (QREFELT $ 102))
                                      (QREFELT $ 103))
                                     (QREFELT $ 102))
                           |er| (QREFELT $ 102))
                          (QREFELT $ 103))
                . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (QREFELT $ 89)
                      (SPADCALL |res4|
                                (SPADCALL (SPADCALL |z| |er| (QREFELT $ 102))
                                          |er| (QREFELT $ 102))
                                (QREFELT $ 110))
                      (QREFELT $ 102))
            (SPADCALL (SPADCALL |m| |m| (QREFELT $ 102)) |m| (QREFELT $ 110))
            (QREFELT $ 111)))))) 

(SDEFUN |FSPECF;jacobiTheta;3F;171| ((|z| F) (|m| F) ($ F))
        (SPADCALL (QREFELT $ 193) |z| |m| (QREFELT $ 49))) 

(SDEFUN |FSPECF;eJacobiTheta| ((|z| F) (|m| F) ($ F))
        (SPADCALL (QREFELT $ 193) (LIST |z| |m|) (QREFELT $ 101))) 

(SDEFUN |FSPECF;elJacobiTheta| ((|l| |List| F) ($ F))
        (|FSPECF;eJacobiTheta| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;eJacobiThetaGrad_z| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 97))
                      . #1=(|FSPECF;eJacobiThetaGrad_z|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 97)) . #1#)
                (EXIT
                 (SPADCALL (SPADCALL |z| |m| (QREFELT $ 192))
                           (SPADCALL |z| |m| (QREFELT $ 194))
                           (QREFELT $ 102)))))) 

(SDEFUN |FSPECF;eJacobiThetaGrad_m| ((|l| |List| F) ($ F))
        (SPROG ((|dm| (F)) (|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 97))
                      . #1=(|FSPECF;eJacobiThetaGrad_m|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 97)) . #1#)
                (LETT |dm| (SPADCALL (SPADCALL (QREFELT $ 98)) (QREFELT $ 99))
                      . #1#)
                (EXIT
                 (SPADCALL (QREFELT $ 86)
                           (LIST
                            (SPADCALL (QREFELT $ 193) (LIST |z| |dm|)
                                      (QREFELT $ 82))
                            |dm| |m|)
                           (QREFELT $ 101)))))) 

(SDEFUN |FSPECF;lerchPhi;4F;176| ((|z| F) (|s| F) (|a| F) ($ F))
        (SPADCALL (QREFELT $ 195) |z| |s| |a| (QREFELT $ 64))) 

(SDEFUN |FSPECF;eLerchPhi| ((|z| F) (|s| F) (|a| F) ($ F))
        (COND
         ((SPADCALL |a| (|spadConstant| $ 74) (QREFELT $ 72))
          (SPADCALL (SPADCALL |s| |z| (QREFELT $ 63)) |z| (QREFELT $ 111)))
         ('T (SPADCALL (QREFELT $ 195) (LIST |z| |s| |a|) (QREFELT $ 101))))) 

(SDEFUN |FSPECF;elLerchPhi| ((|l| |List| F) ($ F))
        (|FSPECF;eLerchPhi| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) (SPADCALL |l| 3 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;dLerchPhi| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (SPROG ((|dm| (F)) (|da| (F)) (|dz| (F)) (|a| (F)) (|s| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 97))
                      . #1=(|FSPECF;dLerchPhi|))
                (LETT |s| (SPADCALL |l| 2 (QREFELT $ 97)) . #1#)
                (LETT |a| (SPADCALL |l| 3 (QREFELT $ 97)) . #1#)
                (LETT |dz|
                      (SPADCALL
                       (SPADCALL (SPADCALL |z| |t| (QREFELT $ 100))
                                 (SPADCALL
                                  (SPADCALL |z|
                                            (SPADCALL |s| (|spadConstant| $ 74)
                                                      (QREFELT $ 110))
                                            |a| (QREFELT $ 196))
                                  (SPADCALL |a|
                                            (SPADCALL |z| |s| |a|
                                                      (QREFELT $ 196))
                                            (QREFELT $ 102))
                                  (QREFELT $ 110))
                                 (QREFELT $ 102))
                       |z| (QREFELT $ 111))
                      . #1#)
                (LETT |da|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |a| |t| (QREFELT $ 100)) |s|
                                  (QREFELT $ 102))
                        (SPADCALL |z|
                                  (SPADCALL |s| (|spadConstant| $ 74)
                                            (QREFELT $ 103))
                                  |a| (QREFELT $ 196))
                        (QREFELT $ 102))
                       (QREFELT $ 112))
                      . #1#)
                (LETT |dm| (SPADCALL (SPADCALL (QREFELT $ 98)) (QREFELT $ 99))
                      . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL |s| |t| (QREFELT $ 100))
                             (SPADCALL (QREFELT $ 86)
                                       (LIST
                                        (SPADCALL (QREFELT $ 195)
                                                  (LIST |z| |dm| |a|)
                                                  (QREFELT $ 82))
                                        |dm| |s|)
                                       (QREFELT $ 101))
                             (QREFELT $ 102))
                   |dz| (QREFELT $ 103))
                  |da| (QREFELT $ 103)))))) 

(SDEFUN |FSPECF;riemannZeta;2F;180| ((|z| F) ($ F))
        (SPADCALL (QREFELT $ 197) |z| (QREFELT $ 45))) 

(SDEFUN |FSPECF;eRiemannZeta| ((|z| F) ($ F))
        (SPADCALL (QREFELT $ 197) (LIST |z|) (QREFELT $ 101))) 

(SDEFUN |FSPECF;elRiemannZeta| ((|l| |List| F) ($ F))
        (|FSPECF;eRiemannZeta| (SPADCALL |l| 1 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;charlierC;4F;183| ((|n| F) (|a| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 36) |n| |a| |z| (QREFELT $ 64))) 

(SDEFUN |FSPECF;eCharlierC| ((|n| F) (|a| F) (|z| F) ($ F))
        (COND
         ((SPADCALL |n| (|spadConstant| $ 70) (QREFELT $ 72))
          (|spadConstant| $ 74))
         ((SPADCALL |n| (|spadConstant| $ 74) (QREFELT $ 72))
          (SPADCALL (SPADCALL |z| |a| (QREFELT $ 110)) |a| (QREFELT $ 111)))
         ('T (SPADCALL (QREFELT $ 36) (LIST |n| |a| |z|) (QREFELT $ 101))))) 

(SDEFUN |FSPECF;elCharlierC| ((|l| |List| F) ($ F))
        (|FSPECF;eCharlierC| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) (SPADCALL |l| 3 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;hermiteH;3F;186| ((|n| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 37) |n| |z| (QREFELT $ 49))) 

(SDEFUN |FSPECF;eHermiteH| ((|n| F) (|z| F) ($ F))
        (COND
         ((SPADCALL |n| (SPADCALL (|spadConstant| $ 74) (QREFELT $ 112))
                    (QREFELT $ 72))
          (|spadConstant| $ 70))
         ((SPADCALL |n| (|spadConstant| $ 70) (QREFELT $ 72))
          (|spadConstant| $ 74))
         ((SPADCALL |n| (|spadConstant| $ 74) (QREFELT $ 72))
          (SPADCALL (SPADCALL 2 (QREFELT $ 78)) |z| (QREFELT $ 102)))
         ('T (SPADCALL (QREFELT $ 37) (LIST |n| |z|) (QREFELT $ 101))))) 

(SDEFUN |FSPECF;elHermiteH| ((|l| |List| F) ($ F))
        (|FSPECF;eHermiteH| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;eHermiteHGrad_z| ((|n| F) (|z| F) ($ F))
        (SPADCALL (SPADCALL (SPADCALL 2 (QREFELT $ 78)) |n| (QREFELT $ 102))
                  (SPADCALL
                   (SPADCALL |n| (|spadConstant| $ 74) (QREFELT $ 110)) |z|
                   (QREFELT $ 200))
                  (QREFELT $ 102))) 

(SDEFUN |FSPECF;dHermiteH| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 37)
         (CONS (|function| |FSPECF;eHermiteHGrad_z|) $) $)) 

(SDEFUN |FSPECF;jacobiP;5F;191| ((|n| F) (|a| F) (|b| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 38) |n| |a| |b| |z| (QREFELT $ 201))) 

(SDEFUN |FSPECF;eJacobiP| ((|n| F) (|a| F) (|b| F) (|z| F) ($ F))
        (COND
         ((SPADCALL |n| (SPADCALL (|spadConstant| $ 74) (QREFELT $ 112))
                    (QREFELT $ 72))
          (|spadConstant| $ 70))
         ((SPADCALL |n| (|spadConstant| $ 70) (QREFELT $ 72))
          (|spadConstant| $ 74))
         ((SPADCALL |n| (|spadConstant| $ 74) (QREFELT $ 72))
          (SPADCALL
           (SPADCALL (QREFELT $ 89) (SPADCALL |a| |b| (QREFELT $ 110))
                     (QREFELT $ 102))
           (SPADCALL
            (SPADCALL (|spadConstant| $ 74)
                      (SPADCALL (QREFELT $ 89)
                                (SPADCALL |a| |b| (QREFELT $ 103))
                                (QREFELT $ 102))
                      (QREFELT $ 103))
            |z| (QREFELT $ 102))
           (QREFELT $ 103)))
         ('T (SPADCALL (QREFELT $ 38) (LIST |n| |a| |b| |z|) (QREFELT $ 101))))) 

(SDEFUN |FSPECF;elJacobiP| ((|l| |List| F) ($ F))
        (|FSPECF;eJacobiP| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) (SPADCALL |l| 3 (QREFELT $ 97))
         (SPADCALL |l| 4 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;eJacobiPGrad_z| ((|n| F) (|a| F) (|b| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL (QREFELT $ 89)
                   (SPADCALL
                    (SPADCALL (SPADCALL |a| |b| (QREFELT $ 103)) |n|
                              (QREFELT $ 103))
                    (|spadConstant| $ 74) (QREFELT $ 103))
                   (QREFELT $ 102))
         (SPADCALL (SPADCALL |n| (|spadConstant| $ 74) (QREFELT $ 110))
                   (SPADCALL |a| (|spadConstant| $ 74) (QREFELT $ 103))
                   (SPADCALL |b| (|spadConstant| $ 74) (QREFELT $ 103)) |z|
                   (QREFELT $ 202))
         (QREFELT $ 102))) 

(SDEFUN |FSPECF;dJacobiP| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad4| |l| |t| (QREFELT $ 38)
         (CONS (|function| |FSPECF;eJacobiPGrad_z|) $) $)) 

(SDEFUN |FSPECF;laguerreL;4F;196| ((|n| F) (|a| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 39) |n| |a| |z| (QREFELT $ 64))) 

(SDEFUN |FSPECF;eLaguerreL| ((|n| F) (|a| F) (|z| F) ($ F))
        (COND
         ((SPADCALL |n| (SPADCALL (|spadConstant| $ 74) (QREFELT $ 112))
                    (QREFELT $ 72))
          (|spadConstant| $ 70))
         ((SPADCALL |n| (|spadConstant| $ 70) (QREFELT $ 72))
          (|spadConstant| $ 74))
         ((SPADCALL |n| (|spadConstant| $ 74) (QREFELT $ 72))
          (SPADCALL (SPADCALL (|spadConstant| $ 74) |a| (QREFELT $ 103)) |z|
                    (QREFELT $ 110)))
         ('T (SPADCALL (QREFELT $ 39) (LIST |n| |a| |z|) (QREFELT $ 101))))) 

(SDEFUN |FSPECF;elLaguerreL| ((|l| |List| F) ($ F))
        (|FSPECF;eLaguerreL| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) (SPADCALL |l| 3 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;eLaguerreLGrad_z| ((|n| F) (|a| F) (|z| F) ($ F))
        (SPADCALL (SPADCALL |n| (|spadConstant| $ 74) (QREFELT $ 110))
                  (SPADCALL |a| (|spadConstant| $ 74) (QREFELT $ 103)) |z|
                  (QREFELT $ 203))) 

(SDEFUN |FSPECF;dLaguerreL| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad3| |l| |t| (QREFELT $ 39)
         (CONS (|function| |FSPECF;eLaguerreLGrad_z|) $) $)) 

(SDEFUN |FSPECF;meixnerM;5F;201| ((|n| F) (|b| F) (|c| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 40) |n| |b| |c| |z| (QREFELT $ 201))) 

(SDEFUN |FSPECF;eMeixnerM| ((|n| F) (|b| F) (|c| F) (|z| F) ($ F))
        (COND
         ((SPADCALL |n| (|spadConstant| $ 70) (QREFELT $ 72))
          (|spadConstant| $ 74))
         ((SPADCALL |n| (|spadConstant| $ 74) (QREFELT $ 72))
          (SPADCALL
           (SPADCALL
            (SPADCALL (SPADCALL |c| (|spadConstant| $ 74) (QREFELT $ 110)) |z|
                      (QREFELT $ 102))
            (SPADCALL |c| |b| (QREFELT $ 102)) (QREFELT $ 111))
           (|spadConstant| $ 74) (QREFELT $ 103)))
         ('T (SPADCALL (QREFELT $ 40) (LIST |n| |b| |c| |z|) (QREFELT $ 101))))) 

(SDEFUN |FSPECF;elMeixnerM| ((|l| |List| F) ($ F))
        (|FSPECF;eMeixnerM| (SPADCALL |l| 1 (QREFELT $ 97))
         (SPADCALL |l| 2 (QREFELT $ 97)) (SPADCALL |l| 3 (QREFELT $ 97))
         (SPADCALL |l| 4 (QREFELT $ 97)) $)) 

(SDEFUN |FSPECF;belong?;BoB;204| ((|op| |BasicOperator|) ($ |Boolean|))
        (SPADCALL |op| (QREFELT $ 8) (QREFELT $ 205))) 

(SDEFUN |FSPECF;operator;2Bo;205| ((|op| |BasicOperator|) ($ |BasicOperator|))
        (COND ((SPADCALL |op| '|abs| (QREFELT $ 207)) (QREFELT $ 13))
              ((SPADCALL |op| '|conjugate| (QREFELT $ 207)) (QREFELT $ 14))
              ((SPADCALL |op| '|Gamma| (QREFELT $ 207)) (QREFELT $ 15))
              ((SPADCALL |op| '|Gamma2| (QREFELT $ 207)) (QREFELT $ 16))
              ((SPADCALL |op| '|Beta| (QREFELT $ 207)) (QREFELT $ 17))
              ((SPADCALL |op| '|digamma| (QREFELT $ 207)) (QREFELT $ 18))
              ((SPADCALL |op| '|polygamma| (QREFELT $ 207)) (QREFELT $ 19))
              ((SPADCALL |op| '|besselJ| (QREFELT $ 207)) (QREFELT $ 20))
              ((SPADCALL |op| '|besselY| (QREFELT $ 207)) (QREFELT $ 21))
              ((SPADCALL |op| '|besselI| (QREFELT $ 207)) (QREFELT $ 22))
              ((SPADCALL |op| '|besselK| (QREFELT $ 207)) (QREFELT $ 23))
              ((SPADCALL |op| '|airyAi| (QREFELT $ 207)) (QREFELT $ 24))
              ((SPADCALL |op| '|airyAiPrime| (QREFELT $ 207)) (QREFELT $ 25))
              ((SPADCALL |op| '|airyBi| (QREFELT $ 207)) (QREFELT $ 26))
              ((SPADCALL |op| '|airyBiPrime| (QREFELT $ 207)) (QREFELT $ 27))
              ((SPADCALL |op| '|lambertW| (QREFELT $ 207)) (QREFELT $ 28))
              ((SPADCALL |op| '|polylog| (QREFELT $ 207)) (QREFELT $ 29))
              ((SPADCALL |op| '|weierstrassP| (QREFELT $ 207)) (QREFELT $ 30))
              ((SPADCALL |op| '|weierstrassPPrime| (QREFELT $ 207))
               (QREFELT $ 31))
              ((SPADCALL |op| '|weierstrassSigma| (QREFELT $ 207))
               (QREFELT $ 32))
              ((SPADCALL |op| '|weierstrassZeta| (QREFELT $ 207))
               (QREFELT $ 33))
              ((SPADCALL |op| '|hypergeometricF| (QREFELT $ 207))
               (QREFELT $ 34))
              ((SPADCALL |op| '|meijerG| (QREFELT $ 207)) (QREFELT $ 35))
              ((SPADCALL |op| '|weierstrassPInverse| (QREFELT $ 207))
               (QREFELT $ 104))
              ((SPADCALL |op| '|whittakerM| (QREFELT $ 207)) (QREFELT $ 118))
              ((SPADCALL |op| '|whittakerW| (QREFELT $ 207)) (QREFELT $ 122))
              ((SPADCALL |op| '|angerJ| (QREFELT $ 207)) (QREFELT $ 124))
              ((SPADCALL |op| '|weberE| (QREFELT $ 207)) (QREFELT $ 128))
              ((SPADCALL |op| '|struveH| (QREFELT $ 207)) (QREFELT $ 132))
              ((SPADCALL |op| '|struveL| (QREFELT $ 207)) (QREFELT $ 135))
              ((SPADCALL |op| '|hankelH1| (QREFELT $ 207)) (QREFELT $ 137))
              ((SPADCALL |op| '|hankelH2| (QREFELT $ 207)) (QREFELT $ 139))
              ((SPADCALL |op| '|lommelS1| (QREFELT $ 207)) (QREFELT $ 141))
              ((SPADCALL |op| '|lommelS2| (QREFELT $ 207)) (QREFELT $ 143))
              ((SPADCALL |op| '|kummerM| (QREFELT $ 207)) (QREFELT $ 145))
              ((SPADCALL |op| '|kummerU| (QREFELT $ 207)) (QREFELT $ 147))
              ((SPADCALL |op| '|legendreP| (QREFELT $ 207)) (QREFELT $ 149))
              ((SPADCALL |op| '|legendreQ| (QREFELT $ 207)) (QREFELT $ 151))
              ((SPADCALL |op| '|kelvinBei| (QREFELT $ 207)) (QREFELT $ 153))
              ((SPADCALL |op| '|kelvinBer| (QREFELT $ 207)) (QREFELT $ 156))
              ((SPADCALL |op| '|kelvinKei| (QREFELT $ 207)) (QREFELT $ 157))
              ((SPADCALL |op| '|kelvinKer| (QREFELT $ 207)) (QREFELT $ 160))
              ((SPADCALL |op| '|ellipticK| (QREFELT $ 207)) (QREFELT $ 161))
              ((SPADCALL |op| '|ellipticE| (QREFELT $ 207)) (QREFELT $ 168))
              ((SPADCALL |op| '|ellipticE2| (QREFELT $ 207)) (QREFELT $ 169))
              ((SPADCALL |op| '|ellipticF| (QREFELT $ 207)) (QREFELT $ 177))
              ((SPADCALL |op| '|ellipticPi| (QREFELT $ 207)) (QREFELT $ 178))
              ((SPADCALL |op| '|jacobiSn| (QREFELT $ 207)) (QREFELT $ 180))
              ((SPADCALL |op| '|jacobiCn| (QREFELT $ 207)) (QREFELT $ 189))
              ((SPADCALL |op| '|jacobiDn| (QREFELT $ 207)) (QREFELT $ 190))
              ((SPADCALL |op| '|jacobiZeta| (QREFELT $ 207)) (QREFELT $ 191))
              ((SPADCALL |op| '|jacobiTheta| (QREFELT $ 207)) (QREFELT $ 193))
              ((SPADCALL |op| '|lerchPhi| (QREFELT $ 207)) (QREFELT $ 195))
              ((SPADCALL |op| '|riemannZeta| (QREFELT $ 207)) (QREFELT $ 197))
              ((SPADCALL |op| '|charlierC| (QREFELT $ 207)) (QREFELT $ 36))
              ((SPADCALL |op| '|hermiteH| (QREFELT $ 207)) (QREFELT $ 37))
              ((SPADCALL |op| '|jacobiP| (QREFELT $ 207)) (QREFELT $ 38))
              ((SPADCALL |op| '|laguerreL| (QREFELT $ 207)) (QREFELT $ 39))
              ((SPADCALL |op| '|meixnerM| (QREFELT $ 207)) (QREFELT $ 40))
              ((SPADCALL |op| '|%logGamma| (QREFELT $ 207)) (QREFELT $ 41))
              ((SPADCALL |op| '|%eis| (QREFELT $ 207)) (QREFELT $ 42))
              ((SPADCALL |op| '|%erfs| (QREFELT $ 207)) (QREFELT $ 43))
              ((SPADCALL |op| '|%erfis| (QREFELT $ 207)) (QREFELT $ 44))
              ('T (|error| "Not a special operator")))) 

(SDEFUN |FSPECF;iGamma| ((|x| F) ($ F))
        (COND ((SPADCALL |x| (|spadConstant| $ 74) (QREFELT $ 72)) |x|)
              ('T (SPADCALL (QREFELT $ 15) |x| (QREFELT $ 209))))) 

(SDEFUN |FSPECF;iabs| ((|x| F) ($ F))
        (COND ((SPADCALL |x| (QREFELT $ 210)) (|spadConstant| $ 70))
              ((SPADCALL |x| (QREFELT $ 211)) (|spadConstant| $ 74))
              ((SPADCALL |x| (QREFELT $ 13) (QREFELT $ 182)) |x|)
              ((SPADCALL |x| (QREFELT $ 14) (QREFELT $ 182))
               (SPADCALL (QREFELT $ 13)
                         (SPADCALL
                          (SPADCALL (SPADCALL |x| (QREFELT $ 184))
                                    (QREFELT $ 186))
                          1 (QREFELT $ 97))
                         (QREFELT $ 209)))
              ((SPADCALL |x| (|spadConstant| $ 70) (QREFELT $ 212))
               (SPADCALL (QREFELT $ 13) (SPADCALL |x| (QREFELT $ 112))
                         (QREFELT $ 209)))
              ('T (SPADCALL (QREFELT $ 13) |x| (QREFELT $ 209))))) 

(SDEFUN |FSPECF;iconjugate| ((|x| F) ($ F))
        (COND ((SPADCALL |x| (QREFELT $ 210)) (|spadConstant| $ 70))
              ((SPADCALL |x| (QREFELT $ 14) (QREFELT $ 182))
               (SPADCALL
                (SPADCALL (SPADCALL |x| (QREFELT $ 184)) (QREFELT $ 186)) 1
                (QREFELT $ 97)))
              ((SPADCALL |x| (QREFELT $ 13) (QREFELT $ 182)) |x|)
              ('T (SPADCALL (QREFELT $ 14) |x| (QREFELT $ 209))))) 

(SDEFUN |FSPECF;iBeta| ((|x| F) (|y| F) ($ F))
        (SPADCALL (QREFELT $ 17) (LIST |x| |y|) (QREFELT $ 101))) 

(SDEFUN |FSPECF;idigamma| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 18) |x| (QREFELT $ 209))) 

(SDEFUN |FSPECF;iiipolygamma| ((|n| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 19) (LIST |n| |x|) (QREFELT $ 101))) 

(SDEFUN |FSPECF;iiiBesselJ| ((|x| F) (|y| F) ($ F))
        (SPADCALL (QREFELT $ 20) (LIST |x| |y|) (QREFELT $ 101))) 

(SDEFUN |FSPECF;iiiBesselY| ((|x| F) (|y| F) ($ F))
        (SPADCALL (QREFELT $ 21) (LIST |x| |y|) (QREFELT $ 101))) 

(SDEFUN |FSPECF;iiiBesselI| ((|x| F) (|y| F) ($ F))
        (SPADCALL (QREFELT $ 22) (LIST |x| |y|) (QREFELT $ 101))) 

(SDEFUN |FSPECF;iiiBesselK| ((|x| F) (|y| F) ($ F))
        (SPADCALL (QREFELT $ 23) (LIST |x| |y|) (QREFELT $ 101))) 

(SDEFUN |FSPECF;iAiryAi;2F;216| ((|x| F) ($ F))
        (COND
         ((SPADCALL |x| (QREFELT $ 210))
          (SPADCALL (|spadConstant| $ 74)
                    (SPADCALL
                     (SPADCALL (SPADCALL 3 (QREFELT $ 78)) (QREFELT $ 95)
                               (QREFELT $ 134))
                     (SPADCALL (QREFELT $ 95) (QREFELT $ 48)) (QREFELT $ 102))
                    (QREFELT $ 111)))
         ('T (SPADCALL (QREFELT $ 24) |x| (QREFELT $ 209))))) 

(SDEFUN |FSPECF;iAiryAiPrime;2F;217| ((|x| F) ($ F))
        (COND
         ((SPADCALL |x| (QREFELT $ 210))
          (SPADCALL
           (SPADCALL (|spadConstant| $ 74)
                     (SPADCALL
                      (SPADCALL (SPADCALL 3 (QREFELT $ 78)) (QREFELT $ 90)
                                (QREFELT $ 134))
                      (SPADCALL (QREFELT $ 90) (QREFELT $ 48)) (QREFELT $ 102))
                     (QREFELT $ 111))
           (QREFELT $ 112)))
         ('T (SPADCALL (QREFELT $ 25) |x| (QREFELT $ 209))))) 

(SDEFUN |FSPECF;iAiryBi;2F;218| ((|x| F) ($ F))
        (COND
         ((SPADCALL |x| (QREFELT $ 210))
          (SPADCALL (|spadConstant| $ 74)
                    (SPADCALL
                     (SPADCALL (SPADCALL 3 (QREFELT $ 78)) (QREFELT $ 92)
                               (QREFELT $ 134))
                     (SPADCALL (QREFELT $ 95) (QREFELT $ 48)) (QREFELT $ 102))
                    (QREFELT $ 111)))
         ('T (SPADCALL (QREFELT $ 26) |x| (QREFELT $ 209))))) 

(SDEFUN |FSPECF;iAiryBiPrime;2F;219| ((|x| F) ($ F))
        (COND
         ((SPADCALL |x| (QREFELT $ 210))
          (SPADCALL
           (SPADCALL (SPADCALL 3 (QREFELT $ 78)) (QREFELT $ 92)
                     (QREFELT $ 134))
           (SPADCALL (QREFELT $ 90) (QREFELT $ 48)) (QREFELT $ 111)))
         ('T (SPADCALL (QREFELT $ 27) |x| (QREFELT $ 209))))) 

(SDEFUN |FSPECF;iAiryAi;2F;220| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 24) |x| (QREFELT $ 209))) 

(SDEFUN |FSPECF;iAiryAiPrime;2F;221| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 25) |x| (QREFELT $ 209))) 

(SDEFUN |FSPECF;iAiryBi;2F;222| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 26) |x| (QREFELT $ 209))) 

(SDEFUN |FSPECF;iAiryBiPrime;2F;223| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 27) |x| (QREFELT $ 209))) 

(SDEFUN |FSPECF;iLambertW;2F;224| ((|x| F) ($ F))
        (COND ((SPADCALL |x| (QREFELT $ 210)) (|spadConstant| $ 70))
              ((SPADCALL |x| (SPADCALL (|spadConstant| $ 74) (QREFELT $ 217))
                         (QREFELT $ 72))
               (|spadConstant| $ 74))
              ((SPADCALL |x|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 74) (QREFELT $ 112))
                           (QREFELT $ 217))
                          (QREFELT $ 112))
                         (QREFELT $ 72))
               (SPADCALL (|spadConstant| $ 74) (QREFELT $ 112)))
              ('T (SPADCALL (QREFELT $ 28) |x| (QREFELT $ 209))))) 

(SDEFUN |FSPECF;iLambertW;2F;225| ((|x| F) ($ F))
        (COND ((SPADCALL |x| (QREFELT $ 210)) (|spadConstant| $ 70))
              ('T (SPADCALL (QREFELT $ 28) |x| (QREFELT $ 209))))) 

(SDEFUN |FSPECF;iiPolylog;3F;226| ((|s| F) (|x| F) ($ F))
        (COND
         ((SPADCALL |s| (|spadConstant| $ 74) (QREFELT $ 72))
          (SPADCALL
           (SPADCALL (SPADCALL (|spadConstant| $ 74) |x| (QREFELT $ 110))
                     (QREFELT $ 219))
           (QREFELT $ 112)))
         ((SPADCALL |s| (SPADCALL 2 (QREFELT $ 78)) (QREFELT $ 72))
          (SPADCALL (SPADCALL (|spadConstant| $ 74) |x| (QREFELT $ 110))
                    (QREFELT $ 220)))
         ('T (SPADCALL (QREFELT $ 29) (LIST |s| |x|) (QREFELT $ 101))))) 

(SDEFUN |FSPECF;iiPolylog;3F;227| ((|s| F) (|x| F) ($ F))
        (COND
         ((SPADCALL |s| (|spadConstant| $ 74) (QREFELT $ 72))
          (SPADCALL
           (SPADCALL (SPADCALL (|spadConstant| $ 74) |x| (QREFELT $ 110))
                     (QREFELT $ 219))
           (QREFELT $ 112)))
         ('T (SPADCALL (QREFELT $ 29) (LIST |s| |x|) (QREFELT $ 101))))) 

(SDEFUN |FSPECF;iiPolylog;3F;228| ((|s| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 29) (LIST |s| |x|) (QREFELT $ 101))) 

(SDEFUN |FSPECF;iPolylog| ((|l| |List| F) ($ F))
        (SPADCALL (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 222))
                  (QREFELT $ 221))) 

(SDEFUN |FSPECF;iWeierstrassP| ((|g2| F) (|g3| F) (|x| F) ($ F))
        (SPROG ((#1=#:G1455 NIL) (|args| (|List| F)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |x| (QREFELT $ 104) (QREFELT $ 182))
                    (SEQ
                     (LETT |args|
                           (SPADCALL (SPADCALL |x| (QREFELT $ 184))
                                     (QREFELT $ 186))
                           . #2=(|FSPECF;iWeierstrassP|))
                     (EXIT
                      (COND
                       ((SPADCALL |g2| (SPADCALL |args| 1 (QREFELT $ 97))
                                  (QREFELT $ 72))
                        (COND
                         ((SPADCALL |g3| (SPADCALL |args| 2 (QREFELT $ 97))
                                    (QREFELT $ 72))
                          (PROGN
                           (LETT #1# (SPADCALL |args| 3 (QREFELT $ 97)) . #2#)
                           (GO #3=#:G1454))))))))))
                  (EXIT
                   (SPADCALL (QREFELT $ 30) (LIST |g2| |g3| |x|)
                             (QREFELT $ 101)))))
                #3# (EXIT #1#)))) 

(SDEFUN |FSPECF;iWeierstrassPPrime| ((|g2| F) (|g3| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 31) (LIST |g2| |g3| |x|) (QREFELT $ 101))) 

(SDEFUN |FSPECF;iWeierstrassSigma| ((|g2| F) (|g3| F) (|x| F) ($ F))
        (COND
         ((SPADCALL |x| (|spadConstant| $ 70) (QREFELT $ 72))
          (|spadConstant| $ 70))
         ('T (SPADCALL (QREFELT $ 32) (LIST |g2| |g3| |x|) (QREFELT $ 101))))) 

(SDEFUN |FSPECF;iWeierstrassZeta| ((|g2| F) (|g3| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 33) (LIST |g2| |g3| |x|) (QREFELT $ 101))) 

(SDEFUN |FSPECF;iiabs;2F;234| ((|x| F) ($ F))
        (SPROG
         ((#1=#:G1479 NIL) (|b| #2=(|Union| R "failed")) (|a| #2#)
          (|f| (|Fraction| (|Polynomial| R)))
          (|r| (|Union| (|Fraction| (|Polynomial| R)) "failed")))
         (SEQ
          (LETT |r| (SPADCALL |x| (QREFELT $ 224))
                . #3=(|FSPECF;iiabs;2F;234|))
          (EXIT
           (COND ((QEQCAR |r| 1) (|FSPECF;iabs| |x| $))
                 (#4='T
                  (SEQ
                   (EXIT
                    (SEQ (LETT |f| (QCDR |r|) . #3#)
                         (SEQ
                          (LETT |a|
                                (SPADCALL (SPADCALL |f| (QREFELT $ 227))
                                          (QREFELT $ 229))
                                . #3#)
                          (EXIT
                           (COND
                            ((QEQCAR |a| 1)
                             (PROGN
                              (LETT #1# (|FSPECF;iabs| |x| $) . #3#)
                              (GO #5=#:G1476)))
                            (#4#
                             (SEQ
                              (LETT |b|
                                    (SPADCALL (SPADCALL |f| (QREFELT $ 230))
                                              (QREFELT $ 229))
                                    . #3#)
                              (EXIT
                               (COND
                                ((QEQCAR |b| 1)
                                 (PROGN
                                  (LETT #1# (|FSPECF;iabs| |x| $) . #3#)
                                  (GO #5#))))))))))
                         (EXIT
                          (SPADCALL
                           (SPADCALL (SPADCALL (QCDR |a|) (QREFELT $ 231))
                                     (QREFELT $ 232))
                           (SPADCALL (SPADCALL (QCDR |b|) (QREFELT $ 231))
                                     (QREFELT $ 232))
                           (QREFELT $ 111)))))
                   #5# (EXIT #1#)))))))) 

(SDEFUN |FSPECF;iiabs;2F;235| ((|x| F) ($ F)) (|FSPECF;iabs| |x| $)) 

(SDEFUN |FSPECF;iiconjugate;2F;236| ((|x| F) ($ F))
        (SPROG ((#1=#:G1525 NIL))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |x| (QREFELT $ 14) (QREFELT $ 182))
                   (SPADCALL
                    (SPADCALL (SPADCALL |x| (QREFELT $ 184)) (QREFELT $ 186)) 1
                    (QREFELT $ 97)))
                  ((SPADCALL |x| (QREFELT $ 13) (QREFELT $ 182)) |x|)
                  ((QEQCAR (SPADCALL |x| (QREFELT $ 235)) 0)
                   (|FSPECF;iconjugate| |x| $))
                  ('T
                   (SEQ
                    (LETT |x|
                          (SPADCALL |x| (SPADCALL |x| (QREFELT $ 237))
                                    (SPADCALL
                                     (CONS #'|FSPECF;iiconjugate;2F;236!0| $)
                                     (SPADCALL |x| (QREFELT $ 237))
                                     (QREFELT $ 249))
                                    (QREFELT $ 250))
                          . #2=(|FSPECF;iiconjugate;2F;236|))
                    (COND
                     ((|HasSignature| (QREFELT $ 6)
                                      (LIST '|conjugate|
                                            (LIST (|devaluate| (QREFELT $ 6))
                                                  (|devaluate|
                                                   (QREFELT $ 6)))))
                      (LETT |x|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (ELT $ 251)
                                        (SPADCALL |x| (QREFELT $ 253))
                                        (QREFELT $ 255))
                              (QREFELT $ 256))
                             (SPADCALL
                              (SPADCALL (ELT $ 251)
                                        (SPADCALL |x| (QREFELT $ 257))
                                        (QREFELT $ 255))
                              (QREFELT $ 256))
                             (QREFELT $ 111))
                            . #2#)))
                    (EXIT (PROGN (LETT #1# |x| . #2#) (GO #3=#:G1524)))))))
                #3# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiconjugate;2F;236!0| ((|k| NIL) ($ NIL))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |k| (QREFELT $ 238)) (|spadConstant| $ 239)
                     (QREFELT $ 240))
           (EXIT (|FSPECF;iconjugate| (SPADCALL |k| (QREFELT $ 241)) $)))
          ((SPADCALL (SPADCALL |k| (QREFELT $ 238)) (|spadConstant| $ 242)
                     (QREFELT $ 240))
           (COND
            ((QEQCAR (SPADCALL (SPADCALL |k| (QREFELT $ 241)) (QREFELT $ 235))
                     0)
             (EXIT (|FSPECF;iconjugate| (SPADCALL |k| (QREFELT $ 241)) $))))))
         (EXIT (SPADCALL (ELT $ 243) |k| (QREFELT $ 245))))) 

(SDEFUN |FSPECF;iiGamma;2F;237| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 258))
                      |FSPECF;iiGamma;2F;237|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (|FSPECF;iGamma| |x| $))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 259))
                                  (QREFELT $ 232)))))))) 

(SDEFUN |FSPECF;iiBeta;LF;238| ((|l| |List| F) ($ F))
        (SPROG ((#1=#:G1538 NIL) (|s| #2=(|Union| R "failed")) (|r| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 258))
                         . #3=(|FSPECF;iiBeta;LF;238|))
                   (EXIT
                    (COND
                     ((QEQCAR |r| 1)
                      (PROGN
                       (LETT #1#
                             (|FSPECF;iBeta| (|SPADfirst| |l|)
                              (SPADCALL |l| (QREFELT $ 222)) $)
                             . #3#)
                       (GO #4=#:G1536)))
                     ('T
                      (SEQ
                       (LETT |s|
                             (SPADCALL (SPADCALL |l| (QREFELT $ 222))
                                       (QREFELT $ 258))
                             . #3#)
                       (EXIT
                        (COND
                         ((QEQCAR |s| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iBeta| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT $ 222)) $)
                                 . #3#)
                           (GO #4#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT $ 261))
                             (QREFELT $ 232)))))
                #4# (EXIT #1#)))) 

(SDEFUN |FSPECF;iidigamma;2F;239| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 258))
                      |FSPECF;iidigamma;2F;239|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (|FSPECF;idigamma| |x| $))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 263))
                                  (QREFELT $ 232)))))))) 

(SDEFUN |FSPECF;iipolygamma;LF;240| ((|l| |List| F) ($ F))
        (SPROG ((#1=#:G1551 NIL) (|r| #2=(|Union| R "failed")) (|s| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |s| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 258))
                         . #3=(|FSPECF;iipolygamma;LF;240|))
                   (EXIT
                    (COND
                     ((QEQCAR |s| 1)
                      (PROGN
                       (LETT #1#
                             (|FSPECF;iiipolygamma| (|SPADfirst| |l|)
                              (SPADCALL |l| (QREFELT $ 222)) $)
                             . #3#)
                       (GO #4=#:G1549)))
                     ('T
                      (SEQ
                       (LETT |r|
                             (SPADCALL (SPADCALL |l| (QREFELT $ 222))
                                       (QREFELT $ 258))
                             . #3#)
                       (EXIT
                        (COND
                         ((QEQCAR |r| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iiipolygamma| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT $ 222)) $)
                                 . #3#)
                           (GO #4#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |s|) (QCDR |r|) (QREFELT $ 265))
                             (QREFELT $ 232)))))
                #4# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiBesselJ;LF;241| ((|l| |List| F) ($ F))
        (SPROG ((#1=#:G1559 NIL) (|s| #2=(|Union| R "failed")) (|r| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 258))
                         . #3=(|FSPECF;iiBesselJ;LF;241|))
                   (EXIT
                    (COND
                     ((QEQCAR |r| 1)
                      (PROGN
                       (LETT #1#
                             (|FSPECF;iiiBesselJ| (|SPADfirst| |l|)
                              (SPADCALL |l| (QREFELT $ 222)) $)
                             . #3#)
                       (GO #4=#:G1557)))
                     ('T
                      (SEQ
                       (LETT |s|
                             (SPADCALL (SPADCALL |l| (QREFELT $ 222))
                                       (QREFELT $ 258))
                             . #3#)
                       (EXIT
                        (COND
                         ((QEQCAR |s| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iiiBesselJ| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT $ 222)) $)
                                 . #3#)
                           (GO #4#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT $ 267))
                             (QREFELT $ 232)))))
                #4# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiBesselY;LF;242| ((|l| |List| F) ($ F))
        (SPROG ((#1=#:G1567 NIL) (|s| #2=(|Union| R "failed")) (|r| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 258))
                         . #3=(|FSPECF;iiBesselY;LF;242|))
                   (EXIT
                    (COND
                     ((QEQCAR |r| 1)
                      (PROGN
                       (LETT #1#
                             (|FSPECF;iiiBesselY| (|SPADfirst| |l|)
                              (SPADCALL |l| (QREFELT $ 222)) $)
                             . #3#)
                       (GO #4=#:G1565)))
                     ('T
                      (SEQ
                       (LETT |s|
                             (SPADCALL (SPADCALL |l| (QREFELT $ 222))
                                       (QREFELT $ 258))
                             . #3#)
                       (EXIT
                        (COND
                         ((QEQCAR |s| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iiiBesselY| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT $ 222)) $)
                                 . #3#)
                           (GO #4#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT $ 269))
                             (QREFELT $ 232)))))
                #4# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiBesselI;LF;243| ((|l| |List| F) ($ F))
        (SPROG ((#1=#:G1575 NIL) (|s| #2=(|Union| R "failed")) (|r| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 258))
                         . #3=(|FSPECF;iiBesselI;LF;243|))
                   (EXIT
                    (COND
                     ((QEQCAR |r| 1)
                      (PROGN
                       (LETT #1#
                             (|FSPECF;iiiBesselI| (|SPADfirst| |l|)
                              (SPADCALL |l| (QREFELT $ 222)) $)
                             . #3#)
                       (GO #4=#:G1573)))
                     ('T
                      (SEQ
                       (LETT |s|
                             (SPADCALL (SPADCALL |l| (QREFELT $ 222))
                                       (QREFELT $ 258))
                             . #3#)
                       (EXIT
                        (COND
                         ((QEQCAR |s| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iiiBesselI| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT $ 222)) $)
                                 . #3#)
                           (GO #4#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT $ 271))
                             (QREFELT $ 232)))))
                #4# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiBesselK;LF;244| ((|l| |List| F) ($ F))
        (SPROG ((#1=#:G1583 NIL) (|s| #2=(|Union| R "failed")) (|r| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 258))
                         . #3=(|FSPECF;iiBesselK;LF;244|))
                   (EXIT
                    (COND
                     ((QEQCAR |r| 1)
                      (PROGN
                       (LETT #1#
                             (|FSPECF;iiiBesselK| (|SPADfirst| |l|)
                              (SPADCALL |l| (QREFELT $ 222)) $)
                             . #3#)
                       (GO #4=#:G1581)))
                     ('T
                      (SEQ
                       (LETT |s|
                             (SPADCALL (SPADCALL |l| (QREFELT $ 222))
                                       (QREFELT $ 258))
                             . #3#)
                       (EXIT
                        (COND
                         ((QEQCAR |s| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iiiBesselK| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT $ 222)) $)
                                 . #3#)
                           (GO #4#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT $ 273))
                             (QREFELT $ 232)))))
                #4# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiAiryAi;2F;245| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 258))
                      |FSPECF;iiAiryAi;2F;245|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (SPADCALL |x| (QREFELT $ 213)))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 275))
                                  (QREFELT $ 232)))))))) 

(SDEFUN |FSPECF;iiAiryAiPrime;2F;246| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 258))
                      |FSPECF;iiAiryAiPrime;2F;246|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (SPADCALL |x| (QREFELT $ 214)))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 277))
                                  (QREFELT $ 232)))))))) 

(SDEFUN |FSPECF;iiAiryBi;2F;247| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 258))
                      |FSPECF;iiAiryBi;2F;247|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (SPADCALL |x| (QREFELT $ 215)))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 279))
                                  (QREFELT $ 232)))))))) 

(SDEFUN |FSPECF;iiAiryBi;2F;248| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 258))
                      |FSPECF;iiAiryBi;2F;248|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (SPADCALL |x| (QREFELT $ 216)))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 281))
                                  (QREFELT $ 232)))))))) 

(SDEFUN |FSPECF;iiGamma;2F;249| ((|x| F) ($ F))
        (SPROG ((#1=#:G1610 NIL) (|r| (|Union| (|Integer|) "failed")))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |r| (SPADCALL |x| (QREFELT $ 283))
                         . #2=(|FSPECF;iiGamma;2F;249|))
                   (EXIT
                    (COND
                     ((QEQCAR |r| 0)
                      (COND
                       ((>= (QCDR |r|) 1)
                        (PROGN
                         (LETT #1#
                               (SPADCALL
                                (SPADCALL (- (QCDR |r|) 1) (QREFELT $ 284))
                                (QREFELT $ 78))
                               . #2#)
                         (GO #3=#:G1608))))))))
                  (EXIT (|FSPECF;iGamma| |x| $))))
                #3# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiGamma;2F;250| ((|x| F) ($ F)) (|FSPECF;iGamma| |x| $)) 

(SDEFUN |FSPECF;iiBeta;LF;251| ((|l| |List| F) ($ F))
        (|FSPECF;iBeta| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 222)) $)) 

(SDEFUN |FSPECF;iidigamma;2F;252| ((|x| F) ($ F)) (|FSPECF;idigamma| |x| $)) 

(SDEFUN |FSPECF;iipolygamma;LF;253| ((|l| |List| F) ($ F))
        (|FSPECF;iiipolygamma| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 222))
         $)) 

(SDEFUN |FSPECF;iiBesselJ;LF;254| ((|l| |List| F) ($ F))
        (|FSPECF;iiiBesselJ| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 222))
         $)) 

(SDEFUN |FSPECF;iiBesselY;LF;255| ((|l| |List| F) ($ F))
        (|FSPECF;iiiBesselY| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 222))
         $)) 

(SDEFUN |FSPECF;iiBesselI;LF;256| ((|l| |List| F) ($ F))
        (|FSPECF;iiiBesselI| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 222))
         $)) 

(SDEFUN |FSPECF;iiBesselK;LF;257| ((|l| |List| F) ($ F))
        (|FSPECF;iiiBesselK| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 222))
         $)) 

(SDEFUN |FSPECF;iiAiryAi;2F;258| ((|x| F) ($ F)) (SPADCALL |x| (QREFELT $ 213))) 

(SDEFUN |FSPECF;iiAiryAiPrime;2F;259| ((|x| F) ($ F))
        (SPADCALL |x| (QREFELT $ 214))) 

(SDEFUN |FSPECF;iiAiryBi;2F;260| ((|x| F) ($ F)) (SPADCALL |x| (QREFELT $ 215))) 

(SDEFUN |FSPECF;iiAiryBiPrime;2F;261| ((|x| F) ($ F))
        (SPADCALL |x| (QREFELT $ 216))) 

(SDEFUN |FSPECF;iiWeierstrassP| ((|l| |List| F) ($ F))
        (|FSPECF;iWeierstrassP| (|SPADfirst| |l|)
         (SPADCALL |l| (QREFELT $ 222)) (SPADCALL |l| (QREFELT $ 286)) $)) 

(SDEFUN |FSPECF;iiWeierstrassPPrime| ((|l| |List| F) ($ F))
        (|FSPECF;iWeierstrassPPrime| (|SPADfirst| |l|)
         (SPADCALL |l| (QREFELT $ 222)) (SPADCALL |l| (QREFELT $ 286)) $)) 

(SDEFUN |FSPECF;iiWeierstrassSigma| ((|l| |List| F) ($ F))
        (|FSPECF;iWeierstrassSigma| (|SPADfirst| |l|)
         (SPADCALL |l| (QREFELT $ 222)) (SPADCALL |l| (QREFELT $ 286)) $)) 

(SDEFUN |FSPECF;iiWeierstrassZeta| ((|l| |List| F) ($ F))
        (|FSPECF;iWeierstrassZeta| (|SPADfirst| |l|)
         (SPADCALL |l| (QREFELT $ 222)) (SPADCALL |l| (QREFELT $ 286)) $)) 

(SDEFUN |FSPECF;diff1| ((|op| |BasicOperator|) (|n| F) (|x| F) ($ F))
        (SPROG ((|dm| (F)))
               (SEQ
                (LETT |dm| (SPADCALL (SPADCALL (QREFELT $ 98)) (QREFELT $ 99))
                      |FSPECF;diff1|)
                (EXIT
                 (SPADCALL (QREFELT $ 86)
                           (LIST (SPADCALL |op| (LIST |dm| |x|) (QREFELT $ 82))
                                 |dm| |n|)
                           (QREFELT $ 101)))))) 

(SDEFUN |FSPECF;iBesselJ| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (SPROG ((|x| (F)) (|n| (F)))
               (SEQ (LETT |n| (|SPADfirst| |l|) . #1=(|FSPECF;iBesselJ|))
                    (LETT |x| (SPADCALL |l| (QREFELT $ 222)) . #1#)
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |n| |t| (QREFELT $ 100))
                                (|FSPECF;diff1| (QREFELT $ 20) |n| |x| $)
                                (QREFELT $ 102))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT $ 100))
                                 (QREFELT $ 89) (QREFELT $ 102))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| $ 74) (QREFELT $ 110))
                         |x| (QREFELT $ 54))
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| $ 74) (QREFELT $ 103))
                         |x| (QREFELT $ 54))
                        (QREFELT $ 110))
                       (QREFELT $ 102))
                      (QREFELT $ 103)))))) 

(SDEFUN |FSPECF;iBesselY| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (SPROG ((|x| (F)) (|n| (F)))
               (SEQ (LETT |n| (|SPADfirst| |l|) . #1=(|FSPECF;iBesselY|))
                    (LETT |x| (SPADCALL |l| (QREFELT $ 222)) . #1#)
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |n| |t| (QREFELT $ 100))
                                (|FSPECF;diff1| (QREFELT $ 21) |n| |x| $)
                                (QREFELT $ 102))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT $ 100))
                                 (QREFELT $ 89) (QREFELT $ 102))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| $ 74) (QREFELT $ 110))
                         |x| (QREFELT $ 55))
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| $ 74) (QREFELT $ 103))
                         |x| (QREFELT $ 55))
                        (QREFELT $ 110))
                       (QREFELT $ 102))
                      (QREFELT $ 103)))))) 

(SDEFUN |FSPECF;iBesselI| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (SPROG ((|x| (F)) (|n| (F)))
               (SEQ (LETT |n| (|SPADfirst| |l|) . #1=(|FSPECF;iBesselI|))
                    (LETT |x| (SPADCALL |l| (QREFELT $ 222)) . #1#)
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |n| |t| (QREFELT $ 100))
                                (|FSPECF;diff1| (QREFELT $ 22) |n| |x| $)
                                (QREFELT $ 102))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT $ 100))
                                 (QREFELT $ 89) (QREFELT $ 102))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| $ 74) (QREFELT $ 110))
                         |x| (QREFELT $ 56))
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| $ 74) (QREFELT $ 103))
                         |x| (QREFELT $ 56))
                        (QREFELT $ 103))
                       (QREFELT $ 102))
                      (QREFELT $ 103)))))) 

(SDEFUN |FSPECF;iBesselK| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (SPROG ((|x| (F)) (|n| (F)))
               (SEQ (LETT |n| (|SPADfirst| |l|) . #1=(|FSPECF;iBesselK|))
                    (LETT |x| (SPADCALL |l| (QREFELT $ 222)) . #1#)
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |n| |t| (QREFELT $ 100))
                                (|FSPECF;diff1| (QREFELT $ 23) |n| |x| $)
                                (QREFELT $ 102))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT $ 100))
                                 (QREFELT $ 89) (QREFELT $ 102))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| $ 74) (QREFELT $ 110))
                         |x| (QREFELT $ 57))
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| $ 74) (QREFELT $ 103))
                         |x| (QREFELT $ 57))
                        (QREFELT $ 103))
                       (QREFELT $ 102))
                      (QREFELT $ 110)))))) 

(SDEFUN |FSPECF;dPolylog| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (SPROG ((|x| (F)) (|s| (F)))
               (SEQ (LETT |s| (|SPADfirst| |l|) . #1=(|FSPECF;dPolylog|))
                    (LETT |x| (SPADCALL |l| (QREFELT $ 222)) . #1#)
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |s| |t| (QREFELT $ 100))
                                (|FSPECF;diff1| (QREFELT $ 29) |s| |x| $)
                                (QREFELT $ 102))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT $ 100))
                                 (SPADCALL
                                  (SPADCALL |s| (|spadConstant| $ 74)
                                            (QREFELT $ 110))
                                  |x| (QREFELT $ 63))
                                 (QREFELT $ 102))
                       |x| (QREFELT $ 111))
                      (QREFELT $ 103)))))) 

(SDEFUN |FSPECF;ipolygamma| ((|l| |List| F) (|x| |Symbol|) ($ F))
        (SPROG ((|y| (F)) (|n| (F)))
               (SEQ
                (COND
                 ((SPADCALL |x| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 290))
                            (QREFELT $ 291))
                  (|error|
                   "cannot differentiate polygamma with respect to the first argument"))
                 ('T
                  (SEQ (LETT |n| (|SPADfirst| |l|) . #1=(|FSPECF;ipolygamma|))
                       (LETT |y| (SPADCALL |l| (QREFELT $ 222)) . #1#)
                       (EXIT
                        (SPADCALL (SPADCALL |y| |x| (QREFELT $ 100))
                                  (SPADCALL
                                   (SPADCALL |n| (|spadConstant| $ 74)
                                             (QREFELT $ 103))
                                   |y| (QREFELT $ 53))
                                  (QREFELT $ 102))))))))) 

(SDEFUN |FSPECF;iBetaGrad1| ((|l| |List| F) ($ F))
        (SPROG ((|y| (F)) (|x| (F)))
               (SEQ (LETT |x| (|SPADfirst| |l|) . #1=(|FSPECF;iBetaGrad1|))
                    (LETT |y| (SPADCALL |l| (QREFELT $ 222)) . #1#)
                    (EXIT
                     (SPADCALL (SPADCALL |x| |y| (QREFELT $ 51))
                               (SPADCALL (SPADCALL |x| (QREFELT $ 52))
                                         (SPADCALL
                                          (SPADCALL |x| |y| (QREFELT $ 103))
                                          (QREFELT $ 52))
                                         (QREFELT $ 110))
                               (QREFELT $ 102)))))) 

(SDEFUN |FSPECF;iBetaGrad2| ((|l| |List| F) ($ F))
        (SPROG ((|y| (F)) (|x| (F)))
               (SEQ (LETT |x| (|SPADfirst| |l|) . #1=(|FSPECF;iBetaGrad2|))
                    (LETT |y| (SPADCALL |l| (QREFELT $ 222)) . #1#)
                    (EXIT
                     (SPADCALL (SPADCALL |x| |y| (QREFELT $ 51))
                               (SPADCALL (SPADCALL |y| (QREFELT $ 52))
                                         (SPADCALL
                                          (SPADCALL |x| |y| (QREFELT $ 103))
                                          (QREFELT $ 52))
                                         (QREFELT $ 110))
                               (QREFELT $ 102)))))) 

(SDEFUN |FSPECF;iGamma2| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (SPROG ((|x| (F)) (|a| (F)))
               (SEQ (LETT |a| (|SPADfirst| |l|) . #1=(|FSPECF;iGamma2|))
                    (LETT |x| (SPADCALL |l| (QREFELT $ 222)) . #1#)
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |a| |t| (QREFELT $ 100))
                                (|FSPECF;diff1| (QREFELT $ 16) |a| |x| $)
                                (QREFELT $ 102))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT $ 100))
                                 (SPADCALL |x|
                                           (SPADCALL |a| (|spadConstant| $ 74)
                                                     (QREFELT $ 110))
                                           (QREFELT $ 134))
                                 (QREFELT $ 102))
                       (SPADCALL (SPADCALL |x| (QREFELT $ 112))
                                 (QREFELT $ 217))
                       (QREFELT $ 102))
                      (QREFELT $ 110)))))) 

(SDEFUN |FSPECF;inGamma2| ((|li| |List| (|InputForm|)) ($ |InputForm|))
        (SPADCALL (CONS (SPADCALL '|Gamma| (QREFELT $ 173)) |li|)
                  (QREFELT $ 174))) 

(SDEFUN |FSPECF;dLambertW| ((|x| F) ($ F))
        (SPROG ((|lw| (F)))
               (SEQ
                (LETT |lw| (SPADCALL |x| (QREFELT $ 62)) |FSPECF;dLambertW|)
                (EXIT
                 (SPADCALL |lw|
                           (SPADCALL |x|
                                     (SPADCALL (|spadConstant| $ 74) |lw|
                                               (QREFELT $ 103))
                                     (QREFELT $ 102))
                           (QREFELT $ 111)))))) 

(SDEFUN |FSPECF;iWeierstrassPGrad1| ((|l| |List| F) ($ F))
        (SPROG ((|wp| (F)) (|delta| (F)) (|x| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ
                (LETT |g2| (|SPADfirst| |l|)
                      . #1=(|FSPECF;iWeierstrassPGrad1|))
                (LETT |g3| (SPADCALL |l| (QREFELT $ 222)) . #1#)
                (LETT |x| (SPADCALL |l| (QREFELT $ 286)) . #1#)
                (LETT |delta|
                      (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 109))
                                (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 109))
                                          (QREFELT $ 94))
                                (QREFELT $ 110))
                      . #1#)
                (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT $ 65)) . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT $ 66))
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL 9 (QREFELT $ 89) (QREFELT $ 94))
                                   |g3| (QREFELT $ 102))
                                  (SPADCALL |g2| |g3| |x| (QREFELT $ 68))
                                  (QREFELT $ 102))
                                 (QREFELT $ 112))
                                (SPADCALL
                                 (SPADCALL (QREFELT $ 91)
                                           (SPADCALL |g2| 2 (QREFELT $ 109))
                                           (QREFELT $ 102))
                                 |x| (QREFELT $ 102))
                                (QREFELT $ 103))
                               (QREFELT $ 102))
                     (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 94))
                               (SPADCALL |wp| 2 (QREFELT $ 109))
                               (QREFELT $ 102))
                     (QREFELT $ 110))
                    (SPADCALL
                     (SPADCALL (QREFELT $ 89) (SPADCALL |g2| 2 (QREFELT $ 109))
                               (QREFELT $ 102))
                     |wp| (QREFELT $ 102))
                    (QREFELT $ 103))
                   (SPADCALL
                    (SPADCALL (SPADCALL 3 (QREFELT $ 89) (QREFELT $ 94)) |g2|
                              (QREFELT $ 102))
                    |g3| (QREFELT $ 102))
                   (QREFELT $ 103))
                  |delta| (QREFELT $ 111)))))) 

(SDEFUN |FSPECF;iWeierstrassPGrad2| ((|l| |List| F) ($ F))
        (SPROG ((|wp| (F)) (|delta| (F)) (|x| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ
                (LETT |g2| (|SPADfirst| |l|)
                      . #1=(|FSPECF;iWeierstrassPGrad2|))
                (LETT |g3| (SPADCALL |l| (QREFELT $ 222)) . #1#)
                (LETT |x| (SPADCALL |l| (QREFELT $ 286)) . #1#)
                (LETT |delta|
                      (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 109))
                                (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 109))
                                          (QREFELT $ 94))
                                (QREFELT $ 110))
                      . #1#)
                (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT $ 65)) . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT $ 66))
                               (SPADCALL
                                (SPADCALL (SPADCALL 3 |g2| (QREFELT $ 94))
                                          (SPADCALL |g2| |g3| |x|
                                                    (QREFELT $ 68))
                                          (QREFELT $ 102))
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL 9 (QREFELT $ 89) (QREFELT $ 94))
                                  |g3| (QREFELT $ 102))
                                 |x| (QREFELT $ 102))
                                (QREFELT $ 110))
                               (QREFELT $ 102))
                     (SPADCALL (SPADCALL 6 |g2| (QREFELT $ 94))
                               (SPADCALL |wp| 2 (QREFELT $ 109))
                               (QREFELT $ 102))
                     (QREFELT $ 103))
                    (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 94)) |wp|
                              (QREFELT $ 102))
                    (QREFELT $ 110))
                   (SPADCALL |g2| 2 (QREFELT $ 109)) (QREFELT $ 110))
                  |delta| (QREFELT $ 111)))))) 

(SDEFUN |FSPECF;iWeierstrassPGrad3| ((|l| |List| F) ($ F))
        (SPADCALL (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 222))
                  (SPADCALL |l| (QREFELT $ 286)) (QREFELT $ 66))) 

(SDEFUN |FSPECF;iWeierstrassPPrimeGrad1| ((|l| |List| F) ($ F))
        (SPROG
         ((|wpp2| (F)) (|wpp| (F)) (|wp| (F)) (|delta| (F)) (|x| (F))
          (|g3| (F)) (|g2| (F)))
         (SEQ
          (LETT |g2| (|SPADfirst| |l|) . #1=(|FSPECF;iWeierstrassPPrimeGrad1|))
          (LETT |g3| (SPADCALL |l| (QREFELT $ 222)) . #1#)
          (LETT |x| (SPADCALL |l| (QREFELT $ 286)) . #1#)
          (LETT |delta|
                (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 109))
                          (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 109))
                                    (QREFELT $ 94))
                          (QREFELT $ 110))
                . #1#)
          (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT $ 65)) . #1#)
          (LETT |wpp| (SPADCALL |g2| |g3| |x| (QREFELT $ 66)) . #1#)
          (LETT |wpp2|
                (SPADCALL
                 (SPADCALL 6 (SPADCALL |wp| 2 (QREFELT $ 109)) (QREFELT $ 94))
                 (SPADCALL (QREFELT $ 89) |g2| (QREFELT $ 102))
                 (QREFELT $ 110))
                . #1#)
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
                             (SPADCALL 9 (QREFELT $ 89) (QREFELT $ 94)) |g3|
                             (QREFELT $ 102))
                            (SPADCALL |g2| |g3| |x| (QREFELT $ 68))
                            (QREFELT $ 102))
                           (QREFELT $ 112))
                          (SPADCALL
                           (SPADCALL (QREFELT $ 91)
                                     (SPADCALL |g2| 2 (QREFELT $ 109))
                                     (QREFELT $ 102))
                           |x| (QREFELT $ 102))
                          (QREFELT $ 103))
                         (QREFELT $ 102))
               (SPADCALL |wpp|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL 9 (QREFELT $ 89) (QREFELT $ 94))
                                     |g3| (QREFELT $ 102))
                           |wp| (QREFELT $ 102))
                          (SPADCALL (QREFELT $ 91)
                                    (SPADCALL |g2| 2 (QREFELT $ 109))
                                    (QREFELT $ 102))
                          (QREFELT $ 103))
                         (QREFELT $ 102))
               (QREFELT $ 103))
              (SPADCALL
               (SPADCALL (SPADCALL 18 |g3| (QREFELT $ 94)) |wp|
                         (QREFELT $ 102))
               |wpp| (QREFELT $ 102))
              (QREFELT $ 110))
             (SPADCALL
              (SPADCALL (QREFELT $ 89) (SPADCALL |g2| 2 (QREFELT $ 109))
                        (QREFELT $ 102))
              |wpp| (QREFELT $ 102))
             (QREFELT $ 103))
            |delta| (QREFELT $ 111)))))) 

(SDEFUN |FSPECF;iWeierstrassPPrimeGrad2| ((|l| |List| F) ($ F))
        (SPROG
         ((|wpp2| (F)) (|wpp| (F)) (|wp| (F)) (|delta| (F)) (|x| (F))
          (|g3| (F)) (|g2| (F)))
         (SEQ
          (LETT |g2| (|SPADfirst| |l|) . #1=(|FSPECF;iWeierstrassPPrimeGrad2|))
          (LETT |g3| (SPADCALL |l| (QREFELT $ 222)) . #1#)
          (LETT |x| (SPADCALL |l| (QREFELT $ 286)) . #1#)
          (LETT |delta|
                (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 109))
                          (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 109))
                                    (QREFELT $ 94))
                          (QREFELT $ 110))
                . #1#)
          (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT $ 65)) . #1#)
          (LETT |wpp| (SPADCALL |g2| |g3| |x| (QREFELT $ 66)) . #1#)
          (LETT |wpp2|
                (SPADCALL
                 (SPADCALL 6 (SPADCALL |wp| 2 (QREFELT $ 109)) (QREFELT $ 94))
                 (SPADCALL (QREFELT $ 89) |g2| (QREFELT $ 102))
                 (QREFELT $ 110))
                . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL
             (SPADCALL
              (SPADCALL
               (SPADCALL |wpp2|
                         (SPADCALL
                          (SPADCALL (SPADCALL 3 |g2| (QREFELT $ 94))
                                    (SPADCALL |g2| |g3| |x| (QREFELT $ 68))
                                    (QREFELT $ 102))
                          (SPADCALL
                           (SPADCALL (SPADCALL 9 (QREFELT $ 89) (QREFELT $ 94))
                                     |g3| (QREFELT $ 102))
                           |x| (QREFELT $ 102))
                          (QREFELT $ 110))
                         (QREFELT $ 102))
               (SPADCALL |wpp|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL 3 |g2| (QREFELT $ 94)) |wp|
                                     (QREFELT $ 102))
                           (QREFELT $ 112))
                          (SPADCALL (SPADCALL 9 (QREFELT $ 89) (QREFELT $ 94))
                                    |g3| (QREFELT $ 102))
                          (QREFELT $ 110))
                         (QREFELT $ 102))
               (QREFELT $ 103))
              (SPADCALL
               (SPADCALL (SPADCALL 12 |g2| (QREFELT $ 94)) |wp|
                         (QREFELT $ 102))
               |wpp| (QREFELT $ 102))
              (QREFELT $ 103))
             (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 94)) |wpp| (QREFELT $ 102))
             (QREFELT $ 110))
            |delta| (QREFELT $ 111)))))) 

(SDEFUN |FSPECF;iWeierstrassPPrimeGrad3| ((|l| |List| F) ($ F))
        (SPROG ((|g2| (F)))
               (SEQ
                (LETT |g2| (|SPADfirst| |l|) |FSPECF;iWeierstrassPPrimeGrad3|)
                (EXIT
                 (SPADCALL
                  (SPADCALL 6
                            (SPADCALL
                             (SPADCALL |g2| (SPADCALL |l| (QREFELT $ 222))
                                       (SPADCALL |l| (QREFELT $ 286))
                                       (QREFELT $ 65))
                             2 (QREFELT $ 130))
                            (QREFELT $ 94))
                  (SPADCALL (QREFELT $ 89) |g2| (QREFELT $ 102))
                  (QREFELT $ 110)))))) 

(SDEFUN |FSPECF;iWeierstrassSigmaGrad1| ((|l| |List| F) ($ F))
        (SPROG
         ((|wsp2| (F)) (|wsp| (F)) (|wz| (F)) (|ws| (F)) (|delta| (F))
          (|x| (F)) (|g3| (F)) (|g2| (F)))
         (SEQ
          (LETT |g2| (|SPADfirst| |l|) . #1=(|FSPECF;iWeierstrassSigmaGrad1|))
          (LETT |g3| (SPADCALL |l| (QREFELT $ 222)) . #1#)
          (LETT |x| (SPADCALL |l| (QREFELT $ 286)) . #1#)
          (LETT |delta|
                (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 109))
                          (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 109))
                                    (QREFELT $ 94))
                          (QREFELT $ 110))
                . #1#)
          (LETT |ws| (SPADCALL |g2| |g3| |x| (QREFELT $ 67)) . #1#)
          (LETT |wz| (SPADCALL |g2| |g3| |x| (QREFELT $ 68)) . #1#)
          (LETT |wsp| (SPADCALL |wz| |ws| (QREFELT $ 102)) . #1#)
          (LETT |wsp2|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT $ 65)) |ws|
                            (QREFELT $ 102))
                  (QREFELT $ 112))
                 (SPADCALL (SPADCALL |wz| 2 (QREFELT $ 109)) |ws|
                           (QREFELT $ 102))
                 (QREFELT $ 103))
                . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (QREFELT $ 91)
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 94)) |wsp2|
                                    (QREFELT $ 102))
                          (QREFELT $ 112))
                         (SPADCALL (SPADCALL |g2| 2 (QREFELT $ 109)) |ws|
                                   (QREFELT $ 102))
                         (QREFELT $ 110))
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL 3 (QREFELT $ 91) (QREFELT $ 94))
                                     |g2| (QREFELT $ 102))
                           |g3| (QREFELT $ 102))
                          (SPADCALL |x| 2 (QREFELT $ 109)) (QREFELT $ 102))
                         |ws| (QREFELT $ 102))
                        (QREFELT $ 110))
                       (SPADCALL
                        (SPADCALL (SPADCALL |g2| 2 (QREFELT $ 109)) |x|
                                  (QREFELT $ 102))
                        |wsp| (QREFELT $ 102))
                       (QREFELT $ 103))
                      (QREFELT $ 102))
            |delta| (QREFELT $ 111)))))) 

(SDEFUN |FSPECF;iWeierstrassSigmaGrad2| ((|l| |List| F) ($ F))
        (SPROG
         ((|wsp2| (F)) (|wsp| (F)) (|wz| (F)) (|ws| (F)) (|delta| (F))
          (|x| (F)) (|g3| (F)) (|g2| (F)))
         (SEQ
          (LETT |g2| (|SPADfirst| |l|) . #1=(|FSPECF;iWeierstrassSigmaGrad2|))
          (LETT |g3| (SPADCALL |l| (QREFELT $ 222)) . #1#)
          (LETT |x| (SPADCALL |l| (QREFELT $ 286)) . #1#)
          (LETT |delta|
                (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 109))
                          (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 109))
                                    (QREFELT $ 94))
                          (QREFELT $ 110))
                . #1#)
          (LETT |ws| (SPADCALL |g2| |g3| |x| (QREFELT $ 67)) . #1#)
          (LETT |wz| (SPADCALL |g2| |g3| |x| (QREFELT $ 68)) . #1#)
          (LETT |wsp| (SPADCALL |wz| |ws| (QREFELT $ 102)) . #1#)
          (LETT |wsp2|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT $ 65)) |ws|
                            (QREFELT $ 102))
                  (QREFELT $ 112))
                 (SPADCALL (SPADCALL |wz| 2 (QREFELT $ 109)) |ws|
                           (QREFELT $ 102))
                 (QREFELT $ 103))
                . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (QREFELT $ 89)
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL 3 |g2| (QREFELT $ 94)) |wsp2|
                                   (QREFELT $ 102))
                         (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 94)) |ws|
                                   (QREFELT $ 102))
                         (QREFELT $ 103))
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (QREFELT $ 91)
                                    (SPADCALL |g2| 2 (QREFELT $ 109))
                                    (QREFELT $ 102))
                          (SPADCALL |x| 2 (QREFELT $ 109)) (QREFELT $ 102))
                         |ws| (QREFELT $ 102))
                        (QREFELT $ 103))
                       (SPADCALL
                        (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 94)) |x|
                                  (QREFELT $ 102))
                        |wsp| (QREFELT $ 102))
                       (QREFELT $ 110))
                      (QREFELT $ 102))
            |delta| (QREFELT $ 111)))))) 

(SDEFUN |FSPECF;iWeierstrassSigmaGrad3| ((|l| |List| F) ($ F))
        (SPROG ((|x| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ
                (LETT |g2| (|SPADfirst| |l|)
                      . #1=(|FSPECF;iWeierstrassSigmaGrad3|))
                (LETT |g3| (SPADCALL |l| (QREFELT $ 222)) . #1#)
                (LETT |x| (SPADCALL |l| (QREFELT $ 286)) . #1#)
                (EXIT
                 (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT $ 68))
                           (SPADCALL |g2| |g3| |x| (QREFELT $ 67))
                           (QREFELT $ 102)))))) 

(SDEFUN |FSPECF;iWeierstrassZetaGrad1| ((|l| |List| F) ($ F))
        (SPROG ((|wp| (F)) (|delta| (F)) (|x| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ
                (LETT |g2| (|SPADfirst| |l|)
                      . #1=(|FSPECF;iWeierstrassZetaGrad1|))
                (LETT |g3| (SPADCALL |l| (QREFELT $ 222)) . #1#)
                (LETT |x| (SPADCALL |l| (QREFELT $ 286)) . #1#)
                (LETT |delta|
                      (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 109))
                                (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 109))
                                          (QREFELT $ 94))
                                (QREFELT $ 110))
                      . #1#)
                (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT $ 65)) . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (QREFELT $ 89)
                               (SPADCALL |g2| |g3| |x| (QREFELT $ 68))
                               (QREFELT $ 102))
                     (SPADCALL
                      (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 94)) |wp|
                                (QREFELT $ 102))
                      (SPADCALL (QREFELT $ 89)
                                (SPADCALL |g2| 2 (QREFELT $ 109))
                                (QREFELT $ 102))
                      (QREFELT $ 103))
                     (QREFELT $ 102))
                    (SPADCALL
                     (SPADCALL (SPADCALL (QREFELT $ 89) |g2| (QREFELT $ 102))
                               |x| (QREFELT $ 102))
                     (SPADCALL
                      (SPADCALL (SPADCALL (QREFELT $ 89) |g2| (QREFELT $ 102))
                                |wp| (QREFELT $ 102))
                      (SPADCALL (SPADCALL 3 (QREFELT $ 91) (QREFELT $ 94)) |g3|
                                (QREFELT $ 102))
                      (QREFELT $ 103))
                     (QREFELT $ 102))
                    (QREFELT $ 110))
                   (SPADCALL
                    (SPADCALL (SPADCALL 9 (QREFELT $ 91) (QREFELT $ 94)) |g3|
                              (QREFELT $ 102))
                    (SPADCALL |g2| |g3| |x| (QREFELT $ 66)) (QREFELT $ 102))
                   (QREFELT $ 103))
                  |delta| (QREFELT $ 111)))))) 

(SDEFUN |FSPECF;iWeierstrassZetaGrad2| ((|l| |List| F) ($ F))
        (SPROG ((|wp| (F)) (|delta| (F)) (|x| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ
                (LETT |g2| (|SPADfirst| |l|)
                      . #1=(|FSPECF;iWeierstrassZetaGrad2|))
                (LETT |g3| (SPADCALL |l| (QREFELT $ 222)) . #1#)
                (LETT |x| (SPADCALL |l| (QREFELT $ 286)) . #1#)
                (LETT |delta|
                      (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 109))
                                (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 109))
                                          (QREFELT $ 94))
                                (QREFELT $ 110))
                      . #1#)
                (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT $ 65)) . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL 3 (SPADCALL |g2| |g3| |x| (QREFELT $ 68))
                                (QREFELT $ 94))
                      (SPADCALL (SPADCALL |g2| |wp| (QREFELT $ 102))
                                (SPADCALL
                                 (SPADCALL 3 (QREFELT $ 89) (QREFELT $ 94))
                                 |g3| (QREFELT $ 102))
                                (QREFELT $ 103))
                      (QREFELT $ 102))
                     (QREFELT $ 112))
                    (SPADCALL (SPADCALL (QREFELT $ 89) |x| (QREFELT $ 102))
                              (SPADCALL
                               (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 94)) |wp|
                                         (QREFELT $ 102))
                               (SPADCALL (QREFELT $ 89)
                                         (SPADCALL |g2| 2 (QREFELT $ 109))
                                         (QREFELT $ 102))
                               (QREFELT $ 103))
                              (QREFELT $ 102))
                    (QREFELT $ 103))
                   (SPADCALL
                    (SPADCALL (SPADCALL 3 (QREFELT $ 89) (QREFELT $ 94)) |g2|
                              (QREFELT $ 102))
                    (SPADCALL |g2| |g3| |x| (QREFELT $ 66)) (QREFELT $ 102))
                   (QREFELT $ 110))
                  |delta| (QREFELT $ 111)))))) 

(SDEFUN |FSPECF;iWeierstrassZetaGrad3| ((|l| |List| F) ($ F))
        (SPADCALL
         (SPADCALL (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 222))
                   (SPADCALL |l| (QREFELT $ 286)) (QREFELT $ 65))
         (QREFELT $ 112))) 

(SDEFUN |FSPECF;dconjugate| ((|lo| |List| (|OutputForm|)) ($ |OutputForm|))
        (SPADCALL (SPADCALL |lo| 1 (QREFELT $ 294)) (QREFELT $ 295))) 

(SDEFUN |FSPECF;get_int_listf| ((|lf| |List| F) ($ |List| (|Integer|)))
        (SPADCALL (ELT $ 298) |lf| (QREFELT $ 302))) 

(SDEFUN |FSPECF;replace_i|
        ((|lp| |List| F) (|v| F) (|i| |NonNegativeInteger|) ($ |List| F))
        (SPROG ((#1=#:G1728 NIL))
               (SPADCALL
                (SPADCALL |lp|
                          (PROG1 (LETT #1# (- |i| 1) |FSPECF;replace_i|)
                            (|check_subtype2| (>= #1# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #1#))
                          (QREFELT $ 303))
                (CONS |v| (SPADCALL |lp| |i| (QREFELT $ 304))) (QREFELT $ 80)))) 

(SDEFUN |FSPECF;iiHypergeometricF;LF;293| ((|l| |List| F) ($ F))
        (SPROG
         ((#1=#:G1734 NIL) (#2=#:G1735 NIL) (|q| #3=(|Integer|)) (|p| #3#)
          (|pqi| (|List| (|Integer|))) (|pq| (|List| F))
          (|nn| (|NonNegativeInteger|)) (#4=#:G1730 NIL) (|z| (F))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |n| (LENGTH |l|) . #5=(|FSPECF;iiHypergeometricF;LF;293|))
            (LETT |z| (SPADCALL |l| (- |n| 2) (QREFELT $ 97)) . #5#)
            (COND
             ((SPADCALL |z| (|spadConstant| $ 70) (QREFELT $ 72))
              (SEQ
               (EXIT
                (SEQ
                 (LETT |nn|
                       (PROG1 (LETT #4# (- |n| 2) . #5#)
                         (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #4#))
                       . #5#)
                 (LETT |pq| (SPADCALL |l| |nn| (QREFELT $ 304)) . #5#)
                 (LETT |pqi| (|FSPECF;get_int_listf| |pq| $) . #5#)
                 (LETT |p| (|SPADfirst| |pqi|) . #5#)
                 (LETT |q| (|SPADfirst| (CDR |pqi|)) . #5#)
                 (EXIT
                  (COND
                   ((SPADCALL |p| (+ |q| 1) (QREFELT $ 305))
                    (PROGN
                     (LETT #1#
                           (PROGN
                            (LETT #2# (|spadConstant| $ 74) . #5#)
                            (GO #6=#:G1733))
                           . #5#)
                     (GO #7=#:G1731)))))))
               #7# (EXIT #1#))))
            (EXIT (SPADCALL (QREFELT $ 34) |l| (QREFELT $ 101)))))
          #6# (EXIT #2#)))) 

(SDEFUN |FSPECF;idvsum|
        ((|op| |BasicOperator|) (|n| |Integer|) (|l| |List| F) (|x| |Symbol|)
         ($ F))
        (SPROG
         ((|res| (F)) (|nl| (|List| F)) (|dm| (F)) (#1=#:G1742 NIL) (|i| NIL)
          (#2=#:G1743 NIL) (|a| NIL))
         (SEQ (LETT |res| (|spadConstant| $ 70) . #3=(|FSPECF;idvsum|))
              (SEQ (LETT |a| NIL . #3#) (LETT #2# |l| . #3#) (LETT |i| 1 . #3#)
                   (LETT #1# |n| . #3#) G190
                   (COND
                    ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                         (PROGN (LETT |a| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |dm|
                          (SPADCALL (SPADCALL (QREFELT $ 98)) (QREFELT $ 99))
                          . #3#)
                    (LETT |nl| (|FSPECF;replace_i| |l| |dm| |i| $) . #3#)
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (SPADCALL
                                      (SPADCALL |a| |x| (QREFELT $ 100))
                                      (SPADCALL (QREFELT $ 86)
                                                (LIST
                                                 (SPADCALL |op| |nl|
                                                           (QREFELT $ 82))
                                                 |dm| |a|)
                                                (QREFELT $ 101))
                                      (QREFELT $ 102))
                                     (QREFELT $ 103))
                           . #3#)))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #3#))
                         . #3#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FSPECF;dvhypergeom| ((|l| . #1=(|List| F)) (|x| |Symbol|) ($ F))
        (SPROG
         ((|aprod| (F)) (|nl| (|List| F)) (|nl1| (|List| F)) (|nl0| (|List| F))
          (|bprod| (F)) (|b| (F)) (#2=#:G1752 NIL) (|i| NIL) (|a| (F))
          (#3=#:G1751 NIL) (|q| #4=(|Integer|)) (|p| #4#) (|z| (F))
          (|l1| (|List| F)) (|ol| #1#) (|pqi| (|List| (|Integer|)))
          (|pq| (|List| F)) (|nn| (|NonNegativeInteger|)) (#5=#:G1744 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |l|) . #6=(|FSPECF;dvhypergeom|))
              (LETT |nn|
                    (PROG1 (LETT #5# (- |n| 2) . #6#)
                      (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #5#))
                    . #6#)
              (LETT |pq| (SPADCALL |l| |nn| (QREFELT $ 304)) . #6#)
              (LETT |pqi| (|FSPECF;get_int_listf| |pq| $) . #6#)
              (LETT |ol| |l| . #6#)
              (LETT |l| (SPADCALL |l| |nn| (QREFELT $ 303)) . #6#)
              (LETT |l1| (REVERSE |l|) . #6#)
              (LETT |z| (|SPADfirst| |l1|) . #6#)
              (LETT |p| (|SPADfirst| |pqi|) . #6#)
              (LETT |q| (|SPADfirst| (CDR |pqi|)) . #6#)
              (LETT |aprod| (|spadConstant| $ 74) . #6#) (LETT |nl| NIL . #6#)
              (SEQ (LETT |i| 1 . #6#) (LETT #3# |p| . #6#) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ (LETT |a| (|SPADfirst| |l|) . #6#)
                        (LETT |nl|
                              (CONS
                               (SPADCALL |a| (|spadConstant| $ 74)
                                         (QREFELT $ 103))
                               |nl|)
                              . #6#)
                        (LETT |aprod| (SPADCALL |aprod| |a| (QREFELT $ 102))
                              . #6#)
                        (EXIT (LETT |l| (CDR |l|) . #6#)))
                   (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
              (LETT |bprod| (|spadConstant| $ 74) . #6#)
              (SEQ (LETT |i| 1 . #6#) (LETT #2# |q| . #6#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ (LETT |b| (|SPADfirst| |l|) . #6#)
                        (LETT |nl|
                              (CONS
                               (SPADCALL |b| (|spadConstant| $ 74)
                                         (QREFELT $ 103))
                               |nl|)
                              . #6#)
                        (LETT |bprod| (SPADCALL |bprod| |b| (QREFELT $ 102))
                              . #6#)
                        (EXIT (LETT |l| (CDR |l|) . #6#)))
                   (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
              (LETT |nl0| (NREVERSE |nl|) . #6#)
              (LETT |nl1| (CONS |z| |pq|) . #6#)
              (LETT |nl| (SPADCALL |nl0| |nl1| (QREFELT $ 80)) . #6#)
              (LETT |aprod| (SPADCALL |aprod| |bprod| (QREFELT $ 111)) . #6#)
              (EXIT
               (SPADCALL (|FSPECF;idvsum| (QREFELT $ 34) (- |nn| 1) |ol| |x| $)
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| |x| (QREFELT $ 100)) |aprod|
                                    (QREFELT $ 102))
                          (SPADCALL (QREFELT $ 34) |nl| (QREFELT $ 82))
                          (QREFELT $ 102))
                         (QREFELT $ 103)))))) 

(SDEFUN |FSPECF;add_pairs_to_list|
        ((|lp| |List| (|List| F)) (|l| |List| F) ($ |List| F))
        (SPROG ((#1=#:G1757 NIL) (|p| NIL))
               (SEQ
                (SEQ (LETT |p| NIL . #2=(|FSPECF;add_pairs_to_list|))
                     (LETT #1# |lp| . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (LENGTH |p|) 2 (QREFELT $ 306))
                         (|error| "not a list of pairs"))
                        ('T
                         (LETT |l|
                               (CONS (SPADCALL |p| 2 (QREFELT $ 97))
                                     (CONS (SPADCALL |p| 1 (QREFELT $ 97))
                                           |l|))
                               . #2#)))))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |l|)))) 

(SDEFUN |FSPECF;dvmeijer| ((|l| . #1=(|List| F)) (|x| |Symbol|) ($ F))
        (SPROG
         ((|om| (F)) (|nm| (F)) (|l2| (|List| F)) (|sign| (F)) (|na| (F))
          (|a| (F)) (|n2| (|Integer|)) (|n1| (|Integer|)) (|z| (F))
          (|l1| (|List| F)) (|nli| (|List| (|Integer|))) (|nl| (|List| F))
          (|l0| #1#) (|nn| (|NonNegativeInteger|)) (#2=#:G1758 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |l|) . #3=(|FSPECF;dvmeijer|))
              (LETT |nn|
                    (PROG1 (LETT #2# (- |n| 4) . #3#)
                      (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #2#))
                    . #3#)
              (LETT |l0| |l| . #3#)
              (LETT |nl| (SPADCALL |l| |nn| (QREFELT $ 304)) . #3#)
              (LETT |nli| (|FSPECF;get_int_listf| |nl| $) . #3#)
              (LETT |l| (SPADCALL |l| |nn| (QREFELT $ 303)) . #3#)
              (LETT |l1| (REVERSE |l|) . #3#)
              (LETT |z| (|SPADfirst| |l1|) . #3#)
              (LETT |n1| (|SPADfirst| |nli|) . #3#)
              (LETT |n2| (SPADCALL |nli| 2 (QREFELT $ 307)) . #3#)
              (LETT |a| (|SPADfirst| |l|) . #3#)
              (LETT |sign| (|spadConstant| $ 74) . #3#)
              (COND
               ((OR (SPADCALL |n1| 0 (QREFELT $ 308))
                    (SPADCALL |n2| 0 (QREFELT $ 308)))
                (SEQ
                 (LETT |na|
                       (SPADCALL |a| (|spadConstant| $ 74) (QREFELT $ 110))
                       . #3#)
                 (COND
                  ((EQL |n1| 0)
                   (LETT |sign|
                         (SPADCALL (|spadConstant| $ 74) (QREFELT $ 112))
                         . #3#)))
                 (EXIT (LETT |l2| (CONS |na| (CDR |l|)) . #3#))))
               ('T
                (SEQ (LETT |na| |a| . #3#)
                     (COND
                      ((SPADCALL (SPADCALL |nli| 3 (QREFELT $ 307)) 0
                                 (QREFELT $ 308))
                       (LETT |sign|
                             (SPADCALL (|spadConstant| $ 74) (QREFELT $ 112))
                             . #3#)))
                     (EXIT
                      (LETT |l2|
                            (CONS
                             (SPADCALL |a| (|spadConstant| $ 74)
                                       (QREFELT $ 103))
                             (CDR |l|))
                            . #3#)))))
              (LETT |nm|
                    (SPADCALL (QREFELT $ 35)
                              (SPADCALL |l2| |nl| (QREFELT $ 80))
                              (QREFELT $ 82))
                    . #3#)
              (LETT |om| (SPADCALL (QREFELT $ 35) |l0| (QREFELT $ 82)) . #3#)
              (EXIT
               (SPADCALL (|FSPECF;idvsum| (QREFELT $ 35) (- |nn| 1) |l0| |x| $)
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| |x| (QREFELT $ 100))
                                    (SPADCALL
                                     (SPADCALL |sign| |nm| (QREFELT $ 102))
                                     (SPADCALL |na| |om| (QREFELT $ 102))
                                     (QREFELT $ 103))
                                    (QREFELT $ 102))
                          |z| (QREFELT $ 111))
                         (QREFELT $ 103)))))) 

(SDEFUN |FSPECF;get_if_list|
        ((|n| |Integer|) (|lf| |List| (|InputForm|))
         ($ |List| (|List| (|InputForm|))))
        (SPROG ((|a| (|List| (|InputForm|))) (#1=#:G1770 NIL) (|i| NIL))
               (SEQ (LETT |a| NIL . #2=(|FSPECF;get_if_list|))
                    (SEQ (LETT |i| 1 . #2#) (LETT #1# |n| . #2#) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ (LETT |a| (CONS (|SPADfirst| |lf|) |a|) . #2#)
                              (EXIT (LETT |lf| (CDR |lf|) . #2#)))
                         (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |a|
                          (CONS (SPADCALL '|construct| (QREFELT $ 173))
                                (NREVERSE |a|))
                          . #2#)
                    (EXIT (LIST |a| |lf|))))) 

(SDEFUN |FSPECF;get_if_lists|
        ((|ln| |List| (|Integer|)) (|lf| |List| (|InputForm|))
         ($ |List| (|List| (|InputForm|))))
        (SPROG
         ((|rl| (|List| (|List| (|InputForm|))))
          (|al| (|List| (|List| (|InputForm|)))) (#1=#:G1775 NIL) (|n| NIL))
         (SEQ (LETT |rl| NIL . #2=(|FSPECF;get_if_lists|))
              (SEQ (LETT |n| NIL . #2#) (LETT #1# |ln| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |al| (|FSPECF;get_if_list| |n| |lf| $) . #2#)
                        (LETT |rl| (CONS (|SPADfirst| |al|) |rl|) . #2#)
                        (EXIT (LETT |lf| (|SPADfirst| (CDR |al|)) . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (LETT |rl| (NREVERSE |rl|) . #2#) (EXIT (CONS |lf| |rl|))))) 

(SDEFUN |FSPECF;get_int_listi|
        ((|n| |Integer|) (|lo| |List| (|InputForm|)) ($ |List| (|Integer|)))
        (SPROG
         ((|rl| (|List| (|Integer|))) (|p| (|Integer|)) (#1=#:G1781 NIL)
          (|i| NIL) (|n0| (|NonNegativeInteger|)) (#2=#:G1776 NIL))
         (SEQ
          (LETT |n0|
                (PROG1
                    (LETT #2# (- (LENGTH |lo|) |n|)
                          . #3=(|FSPECF;get_int_listi|))
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#))
                . #3#)
          (LETT |lo| (SPADCALL |lo| |n0| (QREFELT $ 310)) . #3#)
          (LETT |rl| NIL . #3#)
          (SEQ (LETT |i| 1 . #3#) (LETT #1# |n| . #3#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (LETT |p| (SPADCALL (|SPADfirst| |lo|) (QREFELT $ 312)) . #3#)
                (LETT |rl| (CONS |p| |rl|) . #3#)
                (EXIT (LETT |lo| (CDR |lo|) . #3#)))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (LETT |rl| (NREVERSE |rl|) . #3#) (EXIT |rl|)))) 

(SDEFUN |FSPECF;get_of_list|
        ((|n| |Integer|) (|lo| |List| (|OutputForm|))
         ($ |List| (|List| (|OutputForm|))))
        (SPROG ((|a| (|List| (|OutputForm|))) (#1=#:G1786 NIL) (|i| NIL))
               (SEQ (LETT |a| NIL . #2=(|FSPECF;get_of_list|))
                    (SEQ (LETT |i| 1 . #2#) (LETT #1# |n| . #2#) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ (LETT |a| (CONS (|SPADfirst| |lo|) |a|) . #2#)
                              (EXIT (LETT |lo| (CDR |lo|) . #2#)))
                         (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |a| (NREVERSE |a|) . #2#) (EXIT (LIST |a| |lo|))))) 

(SDEFUN |FSPECF;get_of_lists|
        ((|ln| |List| (|Integer|)) (|lo| |List| (|OutputForm|))
         ($ |List| (|List| (|OutputForm|))))
        (SPROG
         ((|rl| (|List| (|List| (|OutputForm|))))
          (|al| (|List| (|List| (|OutputForm|)))) (#1=#:G1791 NIL) (|n| NIL))
         (SEQ (LETT |rl| NIL . #2=(|FSPECF;get_of_lists|))
              (SEQ (LETT |n| NIL . #2#) (LETT #1# |ln| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |al| (|FSPECF;get_of_list| |n| |lo| $) . #2#)
                        (LETT |rl| (CONS (|SPADfirst| |al|) |rl|) . #2#)
                        (EXIT (LETT |lo| (|SPADfirst| (CDR |al|)) . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (LETT |rl| (NREVERSE |rl|) . #2#) (EXIT (CONS |lo| |rl|))))) 

(SDEFUN |FSPECF;get_int_listo|
        ((|n| |Integer|) (|lo| |List| (|OutputForm|)) ($ |List| (|Integer|)))
        (SPROG
         ((|rl| (|List| (|Integer|))) (|p| (|Integer|)) (#1=#:G1797 NIL)
          (|i| NIL) (|n0| (|NonNegativeInteger|)) (#2=#:G1792 NIL))
         (SEQ
          (LETT |n0|
                (PROG1
                    (LETT #2# (- (LENGTH |lo|) |n|)
                          . #3=(|FSPECF;get_int_listo|))
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#))
                . #3#)
          (LETT |lo| (SPADCALL |lo| |n0| (QREFELT $ 313)) . #3#)
          (LETT |rl| NIL . #3#)
          (SEQ (LETT |i| 1 . #3#) (LETT #1# |n| . #3#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (LETT |p| (SPADCALL (|SPADfirst| |lo|) (QREFELT $ 312)) . #3#)
                (LETT |rl| (CONS |p| |rl|) . #3#)
                (EXIT (LETT |lo| (CDR |lo|) . #3#)))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (LETT |rl| (NREVERSE |rl|) . #3#) (EXIT |rl|)))) 

(SDEFUN |FSPECF;dhyper0|
        ((|op| |OutputForm|) (|lo| |List| (|OutputForm|)) ($ |OutputForm|))
        (SPROG
         ((|z| (|OutputForm|)) (|b| #1=(|List| (|OutputForm|))) (|a| #1#)
          (|al| (|List| (|List| (|OutputForm|)))) (|pql| (|List| (|Integer|)))
          (|n0| (|NonNegativeInteger|)) (#2=#:G1798 NIL))
         (SEQ
          (LETT |n0|
                (PROG1 (LETT #2# (- (LENGTH |lo|) 2) . #3=(|FSPECF;dhyper0|))
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#))
                . #3#)
          (LETT |pql| (|FSPECF;get_int_listo| 2 |lo| $) . #3#)
          (LETT |lo| (SPADCALL |lo| |n0| (QREFELT $ 314)) . #3#)
          (LETT |al| (|FSPECF;get_of_lists| |pql| |lo| $) . #3#)
          (LETT |lo| (|SPADfirst| |al|) . #3#) (LETT |al| (CDR |al|) . #3#)
          (LETT |a| (|SPADfirst| |al|) . #3#)
          (LETT |b| (|SPADfirst| (CDR |al|)) . #3#)
          (LETT |z| (|SPADfirst| |lo|) . #3#)
          (EXIT
           (SPADCALL |op|
                     (LIST (SPADCALL |a| (QREFELT $ 315))
                           (SPADCALL |b| (QREFELT $ 315)) |z|)
                     (QREFELT $ 316)))))) 

(SDEFUN |FSPECF;dhyper| ((|lo| |List| (|OutputForm|)) ($ |OutputForm|))
        (|FSPECF;dhyper0| (SPADCALL '|hypergeometricF| (QREFELT $ 317)) |lo| $)) 

(SDEFUN |FSPECF;ddhyper| ((|lo| |List| (|OutputForm|)) ($ |OutputForm|))
        (|FSPECF;dhyper0| (|SPADfirst| |lo|) (CDR |lo|) $)) 

(SDEFUN |FSPECF;dmeijer0|
        ((|op| |OutputForm|) (|lo| |List| (|OutputForm|)) ($ |OutputForm|))
        (SPROG
         ((|z| (|OutputForm|)) (|al| (|List| (|List| (|OutputForm|))))
          (|nl| (|List| (|Integer|))) (|n0| (|NonNegativeInteger|))
          (#1=#:G1803 NIL))
         (SEQ
          (LETT |n0|
                (PROG1 (LETT #1# (- (LENGTH |lo|) 4) . #2=(|FSPECF;dmeijer0|))
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#))
                . #2#)
          (LETT |nl| (|FSPECF;get_int_listo| 4 |lo| $) . #2#)
          (LETT |lo| (SPADCALL |lo| |n0| (QREFELT $ 314)) . #2#)
          (LETT |al| (|FSPECF;get_of_lists| |nl| |lo| $) . #2#)
          (LETT |lo| (|SPADfirst| |al|) . #2#) (LETT |al| (CDR |al|) . #2#)
          (LETT |z| (|SPADfirst| |lo|) . #2#)
          (EXIT
           (SPADCALL |op|
                     (SPADCALL (SPADCALL (ELT $ 315) |al| (QREFELT $ 320))
                               (LIST |z|) (QREFELT $ 321))
                     (QREFELT $ 316)))))) 

(SDEFUN |FSPECF;dmeijer| ((|lo| |List| (|OutputForm|)) ($ |OutputForm|))
        (|FSPECF;dmeijer0| (SPADCALL '|meijerG| (QREFELT $ 317)) |lo| $)) 

(SDEFUN |FSPECF;ddmeijer| ((|lo| |List| (|OutputForm|)) ($ |OutputForm|))
        (|FSPECF;dmeijer0| (|SPADfirst| |lo|) (CDR |lo|) $)) 

(SDEFUN |FSPECF;inhyper| ((|lf| |List| (|InputForm|)) ($ |InputForm|))
        (SPROG
         ((|li| (|List| #1=(|InputForm|))) (|zi| #1#) (|bi| #2=(|InputForm|))
          (|b| #3=(|List| (|InputForm|))) (|ai| #2#) (|a| #3#)
          (|al| (|List| (|List| (|InputForm|)))) (|pqi| (|List| (|Integer|))))
         (SEQ
          (LETT |pqi| (|FSPECF;get_int_listi| 2 |lf| $)
                . #4=(|FSPECF;inhyper|))
          (LETT |al| (|FSPECF;get_if_lists| |pqi| |lf| $) . #4#)
          (LETT |lf| (|SPADfirst| |al|) . #4#) (LETT |al| (CDR |al|) . #4#)
          (LETT |a| (|SPADfirst| |al|) . #4#)
          (LETT |ai| (SPADCALL |a| (QREFELT $ 174)) . #4#)
          (LETT |b| (|SPADfirst| (CDR |al|)) . #4#)
          (LETT |bi| (SPADCALL |b| (QREFELT $ 174)) . #4#)
          (LETT |zi| (|SPADfirst| |lf|) . #4#)
          (LETT |li|
                (LIST (SPADCALL '|hypergeometricF| (QREFELT $ 173)) |ai| |bi|
                      |zi|)
                . #4#)
          (EXIT (SPADCALL |li| (QREFELT $ 174)))))) 

(SDEFUN |FSPECF;inmeijer| ((|lf| |List| (|InputForm|)) ($ |InputForm|))
        (SPROG
         ((|li| (|List| #1=(|InputForm|))) (|zi| #1#) (|di| #2=(|InputForm|))
          (|d| #3=(|List| (|InputForm|)))
          (|al| (|List| (|List| (|InputForm|)))) (|ci| #2#) (|c| #3#)
          (|bi| #2#) (|b| #3#) (|ai| #2#) (|a| #3#)
          (|pqi| (|List| (|Integer|))))
         (SEQ
          (LETT |pqi| (|FSPECF;get_int_listi| 4 |lf| $)
                . #4=(|FSPECF;inmeijer|))
          (LETT |al| (|FSPECF;get_if_lists| |pqi| |lf| $) . #4#)
          (LETT |lf| (|SPADfirst| |al|) . #4#) (LETT |al| (CDR |al|) . #4#)
          (LETT |a| (|SPADfirst| |al|) . #4#)
          (LETT |ai| (SPADCALL |a| (QREFELT $ 174)) . #4#)
          (LETT |al| (CDR |al|) . #4#) (LETT |b| (|SPADfirst| |al|) . #4#)
          (LETT |bi| (SPADCALL |b| (QREFELT $ 174)) . #4#)
          (LETT |al| (CDR |al|) . #4#) (LETT |c| (|SPADfirst| |al|) . #4#)
          (LETT |ci| (SPADCALL |c| (QREFELT $ 174)) . #4#)
          (LETT |al| (CDR |al|) . #4#) (LETT |d| (|SPADfirst| |al|) . #4#)
          (LETT |di| (SPADCALL |d| (QREFELT $ 174)) . #4#)
          (LETT |zi| (|SPADfirst| |lf|) . #4#)
          (LETT |li|
                (LIST (SPADCALL '|meijerG| (QREFELT $ 173)) |ai| |bi| |ci| |di|
                      |zi|)
                . #4#)
          (EXIT (SPADCALL |li| (QREFELT $ 174)))))) 

(SDEFUN |FSPECF;iiHypergeometricF;LF;312| ((|l| |List| F) ($ F))
        (SPADCALL (QREFELT $ 34) |l| (QREFELT $ 101))) 

(SDEFUN |FSPECF;iiMeijerG| ((|l| |List| F) ($ F))
        (SPADCALL (QREFELT $ 35) |l| (QREFELT $ 101))) 

(SDEFUN |FSPECF;d_eis| ((|x| F) ($ F))
        (SPADCALL
         (SPADCALL (SPADCALL (QREFELT $ 42) |x| (QREFELT $ 209))
                   (QREFELT $ 112))
         (SPADCALL (|spadConstant| $ 74) |x| (QREFELT $ 111)) (QREFELT $ 103))) 

(SDEFUN |FSPECF;d_erfs| ((|x| F) ($ F))
        (SPADCALL
         (SPADCALL (SPADCALL 2 |x| (QREFELT $ 94))
                   (SPADCALL (QREFELT $ 43) |x| (QREFELT $ 209))
                   (QREFELT $ 102))
         (SPADCALL (SPADCALL 2 (QREFELT $ 78))
                   (SPADCALL (SPADCALL (QREFELT $ 126)) (QREFELT $ 115))
                   (QREFELT $ 111))
         (QREFELT $ 110))) 

(SDEFUN |FSPECF;d_erfis| ((|x| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL 2 |x| (QREFELT $ 94))
                    (SPADCALL (QREFELT $ 44) |x| (QREFELT $ 209))
                    (QREFELT $ 102))
          (QREFELT $ 112))
         (SPADCALL (SPADCALL 2 (QREFELT $ 78))
                   (SPADCALL (SPADCALL (QREFELT $ 126)) (QREFELT $ 115))
                   (QREFELT $ 111))
         (QREFELT $ 103))) 

(DECLAIM (NOTINLINE |FunctionalSpecialFunction;|)) 

(DEFUN |FunctionalSpecialFunction| (&REST #1=#:G1890)
  (SPROG NIL
         (PROG (#2=#:G1891)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FunctionalSpecialFunction|)
                                               '|domainEqualList|)
                    . #3=(|FunctionalSpecialFunction|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FunctionalSpecialFunction;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FunctionalSpecialFunction|)))))))))) 

(DEFUN |FunctionalSpecialFunction;| (|#1| |#2|)
  (SPROG
   ((#1=#:G836 NIL) (|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #2=(|FunctionalSpecialFunction|))
    (LETT DV$2 (|devaluate| |#2|) . #2#)
    (LETT |dv$| (LIST '|FunctionalSpecialFunction| DV$1 DV$2) . #2#)
    (LETT $ (GETREFV 323) . #2#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|RetractableTo|
                                                         (|Integer|)))))
                    . #2#))
    (|haddProp| |$ConstructorCache| '|FunctionalSpecialFunction|
                (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 8 '|special|)
    (QSETREFV $ 13 (SPADCALL '|abs| (QREFELT $ 12)))
    (QSETREFV $ 14 (SPADCALL '|conjugate| (QREFELT $ 12)))
    (QSETREFV $ 15 (SPADCALL '|Gamma| (QREFELT $ 12)))
    (QSETREFV $ 16 (SPADCALL '|Gamma2| (QREFELT $ 12)))
    (QSETREFV $ 17 (SPADCALL '|Beta| (QREFELT $ 12)))
    (QSETREFV $ 18 (SPADCALL '|digamma| (QREFELT $ 12)))
    (QSETREFV $ 19 (SPADCALL '|polygamma| (QREFELT $ 12)))
    (QSETREFV $ 20 (SPADCALL '|besselJ| (QREFELT $ 12)))
    (QSETREFV $ 21 (SPADCALL '|besselY| (QREFELT $ 12)))
    (QSETREFV $ 22 (SPADCALL '|besselI| (QREFELT $ 12)))
    (QSETREFV $ 23 (SPADCALL '|besselK| (QREFELT $ 12)))
    (QSETREFV $ 24 (SPADCALL '|airyAi| (QREFELT $ 12)))
    (QSETREFV $ 25 (SPADCALL '|airyAiPrime| (QREFELT $ 12)))
    (QSETREFV $ 26 (SPADCALL '|airyBi| (QREFELT $ 12)))
    (QSETREFV $ 27 (SPADCALL '|airyBiPrime| (QREFELT $ 12)))
    (QSETREFV $ 28 (SPADCALL '|lambertW| (QREFELT $ 12)))
    (QSETREFV $ 29 (SPADCALL '|polylog| (QREFELT $ 12)))
    (QSETREFV $ 30 (SPADCALL '|weierstrassP| (QREFELT $ 12)))
    (QSETREFV $ 31 (SPADCALL '|weierstrassPPrime| (QREFELT $ 12)))
    (QSETREFV $ 32 (SPADCALL '|weierstrassSigma| (QREFELT $ 12)))
    (QSETREFV $ 33 (SPADCALL '|weierstrassZeta| (QREFELT $ 12)))
    (QSETREFV $ 34 (SPADCALL '|hypergeometricF| (QREFELT $ 12)))
    (QSETREFV $ 35 (SPADCALL '|meijerG| (QREFELT $ 12)))
    (QSETREFV $ 36 (SPADCALL '|charlierC| (QREFELT $ 12)))
    (QSETREFV $ 37 (SPADCALL '|hermiteH| (QREFELT $ 12)))
    (QSETREFV $ 38 (SPADCALL '|jacobiP| (QREFELT $ 12)))
    (QSETREFV $ 39 (SPADCALL '|laguerreL| (QREFELT $ 12)))
    (QSETREFV $ 40 (SPADCALL '|meixnerM| (QREFELT $ 12)))
    (QSETREFV $ 41 (SPADCALL '|%logGamma| (QREFELT $ 12)))
    (QSETREFV $ 42 (SPADCALL '|%eis| (QREFELT $ 12)))
    (QSETREFV $ 43 (SPADCALL '|%erfs| (QREFELT $ 12)))
    (QSETREFV $ 44 (SPADCALL '|%erfis| (QREFELT $ 12)))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 83
                 (CONS (|dispatchFunction| |FSPECF;hypergeometricF;2L2F;22|)
                       $))
       (QSETREFV $ 84
                 (CONS (|dispatchFunction| |FSPECF;meijerG;4L2F;23|) $)))))
    (QSETREFV $ 86
              (SPADCALL (SPADCALL '|%diff| (QREFELT $ 12)) (QREFELT $ 85)))
    (QSETREFV $ 89
              (PROG2
                  (LETT #1#
                        (SPADCALL (SPADCALL 2 (QREFELT $ 78)) (QREFELT $ 88))
                        . #2#)
                  (QCDR #1#)
                (|check_union2| (QEQCAR #1# 0) |#2| (|Union| |#2| #3="failed")
                                #1#)))
    (QSETREFV $ 90
              (PROG2
                  (LETT #1#
                        (SPADCALL (SPADCALL 3 (QREFELT $ 78)) (QREFELT $ 88))
                        . #2#)
                  (QCDR #1#)
                (|check_union2| (QEQCAR #1# 0) |#2| (|Union| |#2| #3#) #1#)))
    (QSETREFV $ 91
              (PROG2
                  (LETT #1#
                        (SPADCALL (SPADCALL 4 (QREFELT $ 78)) (QREFELT $ 88))
                        . #2#)
                  (QCDR #1#)
                (|check_union2| (QEQCAR #1# 0) |#2| (|Union| |#2| #3#) #1#)))
    (QSETREFV $ 92
              (PROG2
                  (LETT #1#
                        (SPADCALL (SPADCALL 6 (QREFELT $ 78)) (QREFELT $ 88))
                        . #2#)
                  (QCDR #1#)
                (|check_union2| (QEQCAR #1# 0) |#2| (|Union| |#2| #3#) #1#)))
    (QSETREFV $ 95 (SPADCALL 2 (QREFELT $ 90) (QREFELT $ 94)))
    (QSETREFV $ 96 (SPADCALL 3 (QREFELT $ 89) (QREFELT $ 94)))
    (QSETREFV $ 104 (SPADCALL '|weierstrassPInverse| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 104)
              (CONS (|function| |FSPECF;elWeierstrassPInverse|) $)
              (QREFELT $ 108))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 104)
                 (LIST
                  (CONS (|function| |FSPECF;eWeierstrassPInverseGrad_g2|) $)
                  (CONS (|function| |FSPECF;eWeierstrassPInverseGrad_g3|) $)
                  (CONS (|function| |FSPECF;eWeierstrassPInverseGrad_z|) $))
                 (QREFELT $ 117)))))
    (QSETREFV $ 118 (SPADCALL '|whittakerM| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 118) (CONS (|function| |FSPECF;elWhittakerM|) $)
              (QREFELT $ 108))
    (SPADCALL (QREFELT $ 118) '|%specialDiff|
              (CONS (|function| |FSPECF;dWhittakerM|) $) (QREFELT $ 121))
    (QSETREFV $ 122 (SPADCALL '|whittakerW| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 122) (CONS (|function| |FSPECF;elWhittakerW|) $)
              (QREFELT $ 108))
    (SPADCALL (QREFELT $ 122) '|%specialDiff|
              (CONS (|function| |FSPECF;dWhittakerW|) $) (QREFELT $ 121))
    (QSETREFV $ 124 (SPADCALL '|angerJ| (QREFELT $ 12)))
    (COND
     ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 124) (CONS (|function| |FSPECF;elAngerJ|) $)
                 (QREFELT $ 108))
       (SPADCALL (QREFELT $ 124) '|%specialDiff|
                 (CONS (|function| |FSPECF;dAngerJ|) $) (QREFELT $ 121))))
     ('T
      (PROGN
       (SPADCALL (QREFELT $ 124) (CONS (|function| |FSPECF;eeAngerJ|) $)
                 (QREFELT $ 108)))))
    (QSETREFV $ 128 (SPADCALL '|weberE| (QREFELT $ 12)))
    (COND
     ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 128) (CONS (|function| |FSPECF;elWeberE|) $)
                 (QREFELT $ 108))
       (SPADCALL (QREFELT $ 128) '|%specialDiff|
                 (CONS (|function| |FSPECF;dWeberE|) $) (QREFELT $ 121))))
     ('T
      (PROGN
       (SPADCALL (QREFELT $ 128) (CONS (|function| |FSPECF;eeWeberE|) $)
                 (QREFELT $ 108)))))
    (QSETREFV $ 132 (SPADCALL '|struveH| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 132) (CONS (|function| |FSPECF;elStruveH|) $)
              (QREFELT $ 108))
    (COND
     ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
      (COND
       ((|HasCategory| |#2| '(|RadicalCategory|))
        (PROGN
         (SPADCALL (QREFELT $ 132) '|%specialDiff|
                   (CONS (|function| |FSPECF;dStruveH|) $)
                   (QREFELT $ 121)))))))
    (QSETREFV $ 135 (SPADCALL '|struveL| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 135) (CONS (|function| |FSPECF;elStruveL|) $)
              (QREFELT $ 108))
    (COND
     ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
      (COND
       ((|HasCategory| |#2| '(|RadicalCategory|))
        (PROGN
         (SPADCALL (QREFELT $ 135) '|%specialDiff|
                   (CONS (|function| |FSPECF;dStruveL|) $)
                   (QREFELT $ 121)))))))
    (QSETREFV $ 137 (SPADCALL '|hankelH1| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 137) (CONS (|function| |FSPECF;elHankelH1|) $)
              (QREFELT $ 108))
    (SPADCALL (QREFELT $ 137) '|%specialDiff|
              (CONS (|function| |FSPECF;dHankelH1|) $) (QREFELT $ 121))
    (QSETREFV $ 139 (SPADCALL '|hankelH2| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 139) (CONS (|function| |FSPECF;elHankelH2|) $)
              (QREFELT $ 108))
    (SPADCALL (QREFELT $ 139) '|%specialDiff|
              (CONS (|function| |FSPECF;dHankelH2|) $) (QREFELT $ 121))
    (QSETREFV $ 141 (SPADCALL '|lommelS1| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 141) (CONS (|function| |FSPECF;elLommelS1|) $)
              (QREFELT $ 108))
    (SPADCALL (QREFELT $ 141) '|%specialDiff|
              (CONS (|function| |FSPECF;dLommelS1|) $) (QREFELT $ 121))
    (QSETREFV $ 143 (SPADCALL '|lommelS2| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 143) (CONS (|function| |FSPECF;elLommelS2|) $)
              (QREFELT $ 108))
    (SPADCALL (QREFELT $ 143) '|%specialDiff|
              (CONS (|function| |FSPECF;dLommelS2|) $) (QREFELT $ 121))
    (QSETREFV $ 145 (SPADCALL '|kummerM| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 145) (CONS (|function| |FSPECF;elKummerM|) $)
              (QREFELT $ 108))
    (SPADCALL (QREFELT $ 145) '|%specialDiff|
              (CONS (|function| |FSPECF;dKummerM|) $) (QREFELT $ 121))
    (QSETREFV $ 147 (SPADCALL '|kummerU| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 147) (CONS (|function| |FSPECF;elKummerU|) $)
              (QREFELT $ 108))
    (SPADCALL (QREFELT $ 147) '|%specialDiff|
              (CONS (|function| |FSPECF;dKummerU|) $) (QREFELT $ 121))
    (QSETREFV $ 149 (SPADCALL '|legendreP| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 149) (CONS (|function| |FSPECF;elLegendreP|) $)
              (QREFELT $ 108))
    (SPADCALL (QREFELT $ 149) '|%specialDiff|
              (CONS (|function| |FSPECF;dLegendreP|) $) (QREFELT $ 121))
    (QSETREFV $ 151 (SPADCALL '|legendreQ| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 151) (CONS (|function| |FSPECF;elLegendreQ|) $)
              (QREFELT $ 108))
    (SPADCALL (QREFELT $ 151) '|%specialDiff|
              (CONS (|function| |FSPECF;dLegendreQ|) $) (QREFELT $ 121))
    (QSETREFV $ 153 (SPADCALL '|kelvinBei| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 153) (CONS (|function| |FSPECF;elKelvinBei|) $)
              (QREFELT $ 108))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 153) '|%specialDiff|
                 (CONS (|function| |FSPECF;dKelvinBei|) $) (QREFELT $ 121)))))
    (QSETREFV $ 156 (SPADCALL '|kelvinBer| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 156) (CONS (|function| |FSPECF;elKelvinBer|) $)
              (QREFELT $ 108))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 156) '|%specialDiff|
                 (CONS (|function| |FSPECF;dKelvinBer|) $) (QREFELT $ 121)))))
    (QSETREFV $ 157 (SPADCALL '|kelvinKei| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 157) (CONS (|function| |FSPECF;elKelvinKei|) $)
              (QREFELT $ 108))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 157) '|%specialDiff|
                 (CONS (|function| |FSPECF;dKelvinKei|) $) (QREFELT $ 121)))))
    (QSETREFV $ 160 (SPADCALL '|kelvinKer| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 160) (CONS (|function| |FSPECF;elKelvinKer|) $)
              (QREFELT $ 108))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 160) '|%specialDiff|
                 (CONS (|function| |FSPECF;dKelvinKer|) $) (QREFELT $ 121)))))
    (QSETREFV $ 161 (SPADCALL '|ellipticK| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 161) (CONS (|function| |FSPECF;elEllipticK|) $)
              (QREFELT $ 108))
    (SPADCALL (QREFELT $ 161) (CONS (|function| |FSPECF;dEllipticK|) $)
              (QREFELT $ 167))
    (QSETREFV $ 168 (SPADCALL '|ellipticE| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 168) (CONS (|function| |FSPECF;elEllipticE|) $)
              (QREFELT $ 108))
    (SPADCALL (QREFELT $ 168) (CONS (|function| |FSPECF;dEllipticE|) $)
              (QREFELT $ 167))
    (QSETREFV $ 169 (SPADCALL '|ellipticE2| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 169) (CONS (|function| |FSPECF;elEllipticE2|) $)
              (QREFELT $ 108))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 169)
                 (LIST (CONS (|function| |FSPECF;eEllipticE2Grad_z|) $)
                       (CONS (|function| |FSPECF;eEllipticE2Grad_m|) $))
                 (QREFELT $ 117)))))
    (SPADCALL (QREFELT $ 169) (CONS (|function| |FSPECF;inEllipticE2|) $)
              (QREFELT $ 176))
    (QSETREFV $ 177 (SPADCALL '|ellipticF| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 177) (CONS (|function| |FSPECF;elEllipticF|) $)
              (QREFELT $ 108))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 177)
                 (LIST (CONS (|function| |FSPECF;eEllipticFGrad_z|) $)
                       (CONS (|function| |FSPECF;eEllipticFGrad_m|) $))
                 (QREFELT $ 117)))))
    (QSETREFV $ 178 (SPADCALL '|ellipticPi| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 178) (CONS (|function| |FSPECF;elEllipticPi|) $)
              (QREFELT $ 108))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 178)
                 (LIST (CONS (|function| |FSPECF;eEllipticPiGrad_z|) $)
                       (CONS (|function| |FSPECF;eEllipticPiGrad_n|) $)
                       (CONS (|function| |FSPECF;eEllipticPiGrad_m|) $))
                 (QREFELT $ 117)))))
    (QSETREFV $ 180 (SPADCALL '|jacobiSn| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 180) (CONS (|function| |FSPECF;elJacobiSn|) $)
              (QREFELT $ 108))
    (SPADCALL (QREFELT $ 180)
              (LIST (CONS (|function| |FSPECF;eJacobiSnGrad_z|) $)
                    (CONS (|function| |FSPECF;eJacobiSnGrad_m|) $))
              (QREFELT $ 117))
    (QSETREFV $ 189 (SPADCALL '|jacobiCn| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 189) (CONS (|function| |FSPECF;elJacobiCn|) $)
              (QREFELT $ 108))
    (SPADCALL (QREFELT $ 189)
              (LIST (CONS (|function| |FSPECF;eJacobiCnGrad_z|) $)
                    (CONS (|function| |FSPECF;eJacobiCnGrad_m|) $))
              (QREFELT $ 117))
    (QSETREFV $ 190 (SPADCALL '|jacobiDn| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 190) (CONS (|function| |FSPECF;elJacobiDn|) $)
              (QREFELT $ 108))
    (SPADCALL (QREFELT $ 190)
              (LIST (CONS (|function| |FSPECF;eJacobiDnGrad_z|) $)
                    (CONS (|function| |FSPECF;eJacobiDnGrad_m|) $))
              (QREFELT $ 117))
    (QSETREFV $ 191 (SPADCALL '|jacobiZeta| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 191) (CONS (|function| |FSPECF;elJacobiZeta|) $)
              (QREFELT $ 108))
    (SPADCALL (QREFELT $ 191)
              (LIST (CONS (|function| |FSPECF;eJacobiZetaGrad_z|) $)
                    (CONS (|function| |FSPECF;eJacobiZetaGrad_m|) $))
              (QREFELT $ 117))
    (QSETREFV $ 193 (SPADCALL '|jacobiTheta| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 193) (CONS (|function| |FSPECF;elJacobiTheta|) $)
              (QREFELT $ 108))
    (SPADCALL (QREFELT $ 193)
              (LIST (CONS (|function| |FSPECF;eJacobiThetaGrad_z|) $)
                    (CONS (|function| |FSPECF;eJacobiThetaGrad_m|) $))
              (QREFELT $ 117))
    (QSETREFV $ 195 (SPADCALL '|lerchPhi| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 195) (CONS (|function| |FSPECF;elLerchPhi|) $)
              (QREFELT $ 108))
    (SPADCALL (QREFELT $ 195) '|%specialDiff|
              (CONS (|function| |FSPECF;dLerchPhi|) $) (QREFELT $ 121))
    (QSETREFV $ 197 (SPADCALL '|riemannZeta| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 197) (CONS (|function| |FSPECF;elRiemannZeta|) $)
              (QREFELT $ 108))
    (SPADCALL (QREFELT $ 36) (CONS (|function| |FSPECF;elCharlierC|) $)
              (QREFELT $ 108))
    (SPADCALL (QREFELT $ 37) (CONS (|function| |FSPECF;elHermiteH|) $)
              (QREFELT $ 108))
    (SPADCALL (QREFELT $ 37) '|%specialDiff|
              (CONS (|function| |FSPECF;dHermiteH|) $) (QREFELT $ 121))
    (SPADCALL (QREFELT $ 38) (CONS (|function| |FSPECF;elJacobiP|) $)
              (QREFELT $ 108))
    (SPADCALL (QREFELT $ 38) '|%specialDiff|
              (CONS (|function| |FSPECF;dJacobiP|) $) (QREFELT $ 121))
    (SPADCALL (QREFELT $ 39) (CONS (|function| |FSPECF;elLaguerreL|) $)
              (QREFELT $ 108))
    (SPADCALL (QREFELT $ 39) '|%specialDiff|
              (CONS (|function| |FSPECF;dLaguerreL|) $) (QREFELT $ 121))
    (SPADCALL (QREFELT $ 40) (CONS (|function| |FSPECF;elMeixnerM|) $)
              (QREFELT $ 108))
    (COND
     ((|HasCategory| |#2| '(|ElementaryFunctionCategory|))
      (PROGN
       (QSETREFV $ 213 (CONS (|dispatchFunction| |FSPECF;iAiryAi;2F;216|) $))
       (QSETREFV $ 214
                 (CONS (|dispatchFunction| |FSPECF;iAiryAiPrime;2F;217|) $))
       (QSETREFV $ 215 (CONS (|dispatchFunction| |FSPECF;iAiryBi;2F;218|) $))
       (QSETREFV $ 216
                 (CONS (|dispatchFunction| |FSPECF;iAiryBiPrime;2F;219|) $))))
     ('T
      (PROGN
       (QSETREFV $ 213 (CONS (|dispatchFunction| |FSPECF;iAiryAi;2F;220|) $))
       (QSETREFV $ 214
                 (CONS (|dispatchFunction| |FSPECF;iAiryAiPrime;2F;221|) $))
       (QSETREFV $ 215 (CONS (|dispatchFunction| |FSPECF;iAiryBi;2F;222|) $))
       (QSETREFV $ 216
                 (CONS (|dispatchFunction| |FSPECF;iAiryBiPrime;2F;223|) $)))))
    (COND
     ((|HasCategory| |#2| '(|ElementaryFunctionCategory|))
      (QSETREFV $ 218 (CONS (|dispatchFunction| |FSPECF;iLambertW;2F;224|) $)))
     ('T
      (QSETREFV $ 218
                (CONS (|dispatchFunction| |FSPECF;iLambertW;2F;225|) $))))
    (COND
     ((|HasCategory| |#2| '(|ElementaryFunctionCategory|))
      (COND
       ((|HasCategory| |#2| '(|LiouvillianFunctionCategory|))
        (QSETREFV $ 221
                  (CONS (|dispatchFunction| |FSPECF;iiPolylog;3F;226|) $)))
       ('T
        (QSETREFV $ 221
                  (CONS (|dispatchFunction| |FSPECF;iiPolylog;3F;227|) $)))))
     ('T
      (QSETREFV $ 221
                (CONS (|dispatchFunction| |FSPECF;iiPolylog;3F;228|) $))))
    (COND
     ((|HasSignature| |#1|
                      (LIST '|abs|
                            (LIST (|devaluate| |#1|) (|devaluate| |#1|))))
      (PROGN
       (QSETREFV $ 233 (CONS (|dispatchFunction| |FSPECF;iiabs;2F;234|) $))))
     ('T (QSETREFV $ 233 (CONS (|dispatchFunction| |FSPECF;iiabs;2F;235|) $))))
    (COND
     ((|HasCategory| |#1| '(|SpecialFunctionCategory|))
      (PROGN
       (QSETREFV $ 260 (CONS (|dispatchFunction| |FSPECF;iiGamma;2F;237|) $))
       (QSETREFV $ 262 (CONS (|dispatchFunction| |FSPECF;iiBeta;LF;238|) $))
       (QSETREFV $ 264 (CONS (|dispatchFunction| |FSPECF;iidigamma;2F;239|) $))
       (QSETREFV $ 266
                 (CONS (|dispatchFunction| |FSPECF;iipolygamma;LF;240|) $))
       (QSETREFV $ 268 (CONS (|dispatchFunction| |FSPECF;iiBesselJ;LF;241|) $))
       (QSETREFV $ 270 (CONS (|dispatchFunction| |FSPECF;iiBesselY;LF;242|) $))
       (QSETREFV $ 272 (CONS (|dispatchFunction| |FSPECF;iiBesselI;LF;243|) $))
       (QSETREFV $ 274 (CONS (|dispatchFunction| |FSPECF;iiBesselK;LF;244|) $))
       (QSETREFV $ 276 (CONS (|dispatchFunction| |FSPECF;iiAiryAi;2F;245|) $))
       (QSETREFV $ 278
                 (CONS (|dispatchFunction| |FSPECF;iiAiryAiPrime;2F;246|) $))
       (QSETREFV $ 280 (CONS (|dispatchFunction| |FSPECF;iiAiryBi;2F;247|) $))
       (QSETREFV $ 280
                 (CONS (|dispatchFunction| |FSPECF;iiAiryBi;2F;248|) $))))
     ('T
      (PROGN
       (COND
        ((|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (QSETREFV $ 260
                   (CONS (|dispatchFunction| |FSPECF;iiGamma;2F;249|) $)))
        ('T
         (QSETREFV $ 260
                   (CONS (|dispatchFunction| |FSPECF;iiGamma;2F;250|) $))))
       (QSETREFV $ 262 (CONS (|dispatchFunction| |FSPECF;iiBeta;LF;251|) $))
       (QSETREFV $ 264 (CONS (|dispatchFunction| |FSPECF;iidigamma;2F;252|) $))
       (QSETREFV $ 266
                 (CONS (|dispatchFunction| |FSPECF;iipolygamma;LF;253|) $))
       (QSETREFV $ 268 (CONS (|dispatchFunction| |FSPECF;iiBesselJ;LF;254|) $))
       (QSETREFV $ 270 (CONS (|dispatchFunction| |FSPECF;iiBesselY;LF;255|) $))
       (QSETREFV $ 272 (CONS (|dispatchFunction| |FSPECF;iiBesselI;LF;256|) $))
       (QSETREFV $ 274 (CONS (|dispatchFunction| |FSPECF;iiBesselK;LF;257|) $))
       (QSETREFV $ 276 (CONS (|dispatchFunction| |FSPECF;iiAiryAi;2F;258|) $))
       (QSETREFV $ 278
                 (CONS (|dispatchFunction| |FSPECF;iiAiryAiPrime;2F;259|) $))
       (QSETREFV $ 280 (CONS (|dispatchFunction| |FSPECF;iiAiryBi;2F;260|) $))
       (QSETREFV $ 285
                 (CONS (|dispatchFunction| |FSPECF;iiAiryBiPrime;2F;261|)
                       $)))))
    (SPADCALL (QREFELT $ 15) (ELT $ 260) (QREFELT $ 287))
    (SPADCALL (QREFELT $ 13) (ELT $ 233) (QREFELT $ 287))
    (SPADCALL (QREFELT $ 14) (ELT $ 243) (QREFELT $ 287))
    (SPADCALL (QREFELT $ 17) (ELT $ 262) (QREFELT $ 108))
    (SPADCALL (QREFELT $ 18) (ELT $ 264) (QREFELT $ 287))
    (SPADCALL (QREFELT $ 19) (ELT $ 266) (QREFELT $ 108))
    (SPADCALL (QREFELT $ 20) (ELT $ 268) (QREFELT $ 108))
    (SPADCALL (QREFELT $ 21) (ELT $ 270) (QREFELT $ 108))
    (SPADCALL (QREFELT $ 22) (ELT $ 272) (QREFELT $ 108))
    (SPADCALL (QREFELT $ 23) (ELT $ 274) (QREFELT $ 108))
    (SPADCALL (QREFELT $ 24) (ELT $ 276) (QREFELT $ 287))
    (SPADCALL (QREFELT $ 25) (ELT $ 278) (QREFELT $ 287))
    (SPADCALL (QREFELT $ 26) (ELT $ 280) (QREFELT $ 287))
    (SPADCALL (QREFELT $ 27) (ELT $ 285) (QREFELT $ 287))
    (SPADCALL (QREFELT $ 28) (ELT $ 218) (QREFELT $ 287))
    (SPADCALL (QREFELT $ 29) (CONS (|function| |FSPECF;iPolylog|) $)
              (QREFELT $ 108))
    (SPADCALL (QREFELT $ 30) (CONS (|function| |FSPECF;iiWeierstrassP|) $)
              (QREFELT $ 108))
    (SPADCALL (QREFELT $ 31) (CONS (|function| |FSPECF;iiWeierstrassPPrime|) $)
              (QREFELT $ 108))
    (SPADCALL (QREFELT $ 32) (CONS (|function| |FSPECF;iiWeierstrassSigma|) $)
              (QREFELT $ 108))
    (SPADCALL (QREFELT $ 33) (CONS (|function| |FSPECF;iiWeierstrassZeta|) $)
              (QREFELT $ 108))
    (SPADCALL (QREFELT $ 34) (ELT $ 288) (QREFELT $ 108))
    (SPADCALL (QREFELT $ 35) (CONS (|function| |FSPECF;iiMeijerG|) $)
              (QREFELT $ 108))
    (COND
     ((|HasCategory| |#2| '(|ElementaryFunctionCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 16) '|%specialDiff|
                 (CONS (|function| |FSPECF;iGamma2|) $) (QREFELT $ 121)))))
    (SPADCALL (QREFELT $ 16) (CONS (|function| |FSPECF;inGamma2|) $)
              (QREFELT $ 176))
    (SPADCALL (QREFELT $ 14) (CONS (|function| |FSPECF;dconjugate|) $)
              (QREFELT $ 297))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 288
                 (CONS (|dispatchFunction| |FSPECF;iiHypergeometricF;LF;293|)
                       $))
       (SPADCALL (QREFELT $ 34) '|%diffDisp|
                 (CONS (|function| |FSPECF;ddhyper|) $) (QREFELT $ 121))
       (SPADCALL (QREFELT $ 35) '|%diffDisp|
                 (CONS (|function| |FSPECF;ddmeijer|) $) (QREFELT $ 121))
       (SPADCALL (QREFELT $ 34) (CONS (|function| |FSPECF;dhyper|) $)
                 (QREFELT $ 297))
       (SPADCALL (QREFELT $ 35) (CONS (|function| |FSPECF;dmeijer|) $)
                 (QREFELT $ 297))
       (SPADCALL (QREFELT $ 34) '|%specialDiff|
                 (CONS (|function| |FSPECF;dvhypergeom|) $) (QREFELT $ 121))
       (SPADCALL (QREFELT $ 35) '|%specialDiff|
                 (CONS (|function| |FSPECF;dvmeijer|) $) (QREFELT $ 121))
       (SPADCALL (QREFELT $ 34) (CONS (|function| |FSPECF;inhyper|) $)
                 (QREFELT $ 176))
       (SPADCALL (QREFELT $ 35) (CONS (|function| |FSPECF;inmeijer|) $)
                 (QREFELT $ 176))))
     ('T
      (QSETREFV $ 288
                (CONS (|dispatchFunction| |FSPECF;iiHypergeometricF;LF;312|)
                      $))))
    (COND
     ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
      (COND
       ((|HasCategory| |#2| '(|RadicalCategory|))
        (PROGN
         (SPADCALL (QREFELT $ 43) (CONS (|function| |FSPECF;d_erfs|) $)
                   (QREFELT $ 167))
         (SPADCALL (QREFELT $ 44) (CONS (|function| |FSPECF;d_erfis|) $)
                   (QREFELT $ 167)))))))
    (SPADCALL (QREFELT $ 13) (CONS #'|FunctionalSpecialFunction!0| $)
              (QREFELT $ 167))
    (SPADCALL (QREFELT $ 15) (CONS #'|FunctionalSpecialFunction!1| $)
              (QREFELT $ 167))
    (SPADCALL (QREFELT $ 41) (ELT $ 52) (QREFELT $ 167))
    (SPADCALL (QREFELT $ 17)
              (LIST (CONS (|function| |FSPECF;iBetaGrad1|) $)
                    (CONS (|function| |FSPECF;iBetaGrad2|) $))
              (QREFELT $ 117))
    (SPADCALL (QREFELT $ 18) (CONS #'|FunctionalSpecialFunction!2| $)
              (QREFELT $ 167))
    (SPADCALL (QREFELT $ 42) (CONS (|function| |FSPECF;d_eis|) $)
              (QREFELT $ 167))
    (SPADCALL (QREFELT $ 24) (ELT $ 59) (QREFELT $ 167))
    (SPADCALL (QREFELT $ 25) (CONS #'|FunctionalSpecialFunction!3| $)
              (QREFELT $ 167))
    (SPADCALL (QREFELT $ 26) (ELT $ 61) (QREFELT $ 167))
    (SPADCALL (QREFELT $ 27) (CONS #'|FunctionalSpecialFunction!4| $)
              (QREFELT $ 167))
    (SPADCALL (QREFELT $ 28) (CONS (|function| |FSPECF;dLambertW|) $)
              (QREFELT $ 167))
    (SPADCALL (QREFELT $ 30)
              (LIST (CONS (|function| |FSPECF;iWeierstrassPGrad1|) $)
                    (CONS (|function| |FSPECF;iWeierstrassPGrad2|) $)
                    (CONS (|function| |FSPECF;iWeierstrassPGrad3|) $))
              (QREFELT $ 117))
    (SPADCALL (QREFELT $ 31)
              (LIST (CONS (|function| |FSPECF;iWeierstrassPPrimeGrad1|) $)
                    (CONS (|function| |FSPECF;iWeierstrassPPrimeGrad2|) $)
                    (CONS (|function| |FSPECF;iWeierstrassPPrimeGrad3|) $))
              (QREFELT $ 117))
    (SPADCALL (QREFELT $ 32)
              (LIST (CONS (|function| |FSPECF;iWeierstrassSigmaGrad1|) $)
                    (CONS (|function| |FSPECF;iWeierstrassSigmaGrad2|) $)
                    (CONS (|function| |FSPECF;iWeierstrassSigmaGrad3|) $))
              (QREFELT $ 117))
    (SPADCALL (QREFELT $ 33)
              (LIST (CONS (|function| |FSPECF;iWeierstrassZetaGrad1|) $)
                    (CONS (|function| |FSPECF;iWeierstrassZetaGrad2|) $)
                    (CONS (|function| |FSPECF;iWeierstrassZetaGrad3|) $))
              (QREFELT $ 117))
    (SPADCALL (QREFELT $ 19) '|%specialDiff|
              (CONS (|function| |FSPECF;ipolygamma|) $) (QREFELT $ 121))
    (SPADCALL (QREFELT $ 20) '|%specialDiff|
              (CONS (|function| |FSPECF;iBesselJ|) $) (QREFELT $ 121))
    (SPADCALL (QREFELT $ 21) '|%specialDiff|
              (CONS (|function| |FSPECF;iBesselY|) $) (QREFELT $ 121))
    (SPADCALL (QREFELT $ 22) '|%specialDiff|
              (CONS (|function| |FSPECF;iBesselI|) $) (QREFELT $ 121))
    (SPADCALL (QREFELT $ 23) '|%specialDiff|
              (CONS (|function| |FSPECF;iBesselK|) $) (QREFELT $ 121))
    (SPADCALL (QREFELT $ 29) '|%specialDiff|
              (CONS (|function| |FSPECF;dPolylog|) $) (QREFELT $ 121))
    $))) 

(DEFUN |FunctionalSpecialFunction!4| (|x| $)
  (SPADCALL |x| (SPADCALL |x| (QREFELT $ 60)) (QREFELT $ 102))) 

(DEFUN |FunctionalSpecialFunction!3| (|x| $)
  (SPADCALL |x| (SPADCALL |x| (QREFELT $ 58)) (QREFELT $ 102))) 

(DEFUN |FunctionalSpecialFunction!2| (|x| $)
  (SPADCALL (|spadConstant| $ 74) |x| (QREFELT $ 53))) 

(DEFUN |FunctionalSpecialFunction!1| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 52)) (SPADCALL |x| (QREFELT $ 48))
            (QREFELT $ 102))) 

(DEFUN |FunctionalSpecialFunction!0| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 46)) (SPADCALL |x| (QREFELT $ 322))
            (QREFELT $ 102))) 

(MAKEPROP '|FunctionalSpecialFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'SPECIAL
              (|BasicOperator|) (|Symbol|) (|CommonOperators|) (0 . |operator|)
              '|opabs| '|opconjugate| '|opGamma| '|opGamma2| '|opBeta|
              '|opdigamma| '|oppolygamma| '|opBesselJ| '|opBesselY|
              '|opBesselI| '|opBesselK| '|opAiryAi| '|opAiryAiPrime|
              '|opAiryBi| '|opAiryBiPrime| '|opLambertW| '|opPolylog|
              '|opWeierstrassP| '|opWeierstrassPPrime| '|opWeierstrassSigma|
              '|opWeierstrassZeta| '|opHypergeometricF| '|opMeijerG|
              '|opCharlierC| '|opHermiteH| '|opJacobiP| '|opLaguerreL|
              '|opMeixnerM| '|op_log_gamma| '|op_eis| '|op_erfs| '|op_erfis|
              (5 . |elt|) |FSPECF;abs;2F;1| |FSPECF;conjugate;2F;2|
              |FSPECF;Gamma;2F;3| (11 . |elt|) |FSPECF;Gamma;3F;4|
              |FSPECF;Beta;3F;5| |FSPECF;digamma;2F;6| |FSPECF;polygamma;3F;7|
              |FSPECF;besselJ;3F;8| |FSPECF;besselY;3F;9|
              |FSPECF;besselI;3F;10| |FSPECF;besselK;3F;11|
              |FSPECF;airyAi;2F;12| |FSPECF;airyAiPrime;2F;13|
              |FSPECF;airyBi;2F;14| |FSPECF;airyBiPrime;2F;15|
              |FSPECF;lambertW;2F;16| |FSPECF;polylog;3F;17| (18 . |elt|)
              |FSPECF;weierstrassP;4F;18| |FSPECF;weierstrassPPrime;4F;19|
              |FSPECF;weierstrassSigma;4F;20| |FSPECF;weierstrassZeta;4F;21|
              (26 . |Zero|) (30 . |Zero|) (|Boolean|) (34 . =) (40 . |One|)
              (44 . |One|) (|NonNegativeInteger|) (48 . <=) (|Integer|)
              (54 . |coerce|) (|List| 7) (59 . |concat|) (|List| $)
              (65 . |elt|) (71 . |hypergeometricF|) (78 . |meijerG|)
              (87 . |operator|) '|opdiff| (|Union| $ '"failed") (92 . |recip|)
              '|ahalf| '|athird| '|afourth| '|asixth| (|PositiveInteger|)
              (97 . *) '|twothirds| '|threehalfs| (103 . |elt|) (109 . |new|)
              (113 . |coerce|) (118 . |differentiate|) (124 . |kernel|)
              (130 . *) (136 . +) '|opWeierstrassPInverse|
              |FSPECF;weierstrassPInverse;4F;27| (|Mapping| 7 79)
              (|BasicOperatorFunctions1| 7) (142 . |evaluate|) (148 . ^)
              (154 . -) (160 . /) (166 . -)
              (|SparseMultivariatePolynomial| 6 185) (171 . |One|)
              (175 . |sqrt|) (|List| 106) (180 . |derivative|) '|opWhittakerM|
              |FSPECF;whittakerM;4F;33| (|None|) (186 . |setProperty|)
              '|opWhittakerW| |FSPECF;whittakerW;4F;38| '|opAngerJ|
              |FSPECF;angerJ;3F;43| (193 . |pi|) (197 . |sin|) '|opWeberE|
              |FSPECF;weberE;3F;49| (202 . ^) (208 . |cos|) '|opStruveH|
              |FSPECF;struveH;3F;55| (213 . ^) '|opStruveL|
              |FSPECF;struveL;3F;60| '|opHankelH1| |FSPECF;hankelH1;3F;65|
              '|opHankelH2| |FSPECF;hankelH2;3F;70| '|opLommelS1|
              |FSPECF;lommelS1;4F;75| '|opLommelS2| |FSPECF;lommelS2;4F;80|
              '|opKummerM| |FSPECF;kummerM;4F;85| '|opKummerU|
              |FSPECF;kummerU;4F;90| '|opLegendreP| |FSPECF;legendreP;4F;95|
              '|opLegendreQ| |FSPECF;legendreQ;4F;100| '|opKelvinBei|
              |FSPECF;kelvinBei;3F;105| |FSPECF;kelvinBer;3F;110|
              '|opKelvinBer| '|opKelvinKei| |FSPECF;kelvinKei;3F;115|
              |FSPECF;kelvinKer;3F;120| '|opKelvinKer| '|opEllipticK|
              |FSPECF;ellipticK;2F;125| |FSPECF;ellipticE;2F;129|
              (|Fraction| 77) (219 . |One|) (|Mapping| 7 7)
              (223 . |derivative|) '|opEllipticE| '|opEllipticE2|
              |FSPECF;ellipticE;3F;133| |FSPECF;ellipticF;3F;139| (|InputForm|)
              (229 . |convert|) (234 . |convert|) (|Mapping| 172 309)
              (239 . |input|) '|opEllipticF| '|opEllipticPi|
              |FSPECF;ellipticPi;4F;144| '|opJacobiSn| |FSPECF;jacobiSn;3F;150|
              (245 . |is?|) (|Kernel| $) (251 . |retract|) (|Kernel| 7)
              (256 . |argument|) |FSPECF;jacobiCn;3F;156|
              |FSPECF;jacobiDn;3F;161| '|opJacobiCn| '|opJacobiDn|
              '|opJacobiZeta| |FSPECF;jacobiZeta;3F;166| '|opJacobiTheta|
              |FSPECF;jacobiTheta;3F;171| '|opLerchPhi|
              |FSPECF;lerchPhi;4F;176| '|opRiemannZeta|
              |FSPECF;riemannZeta;2F;180| |FSPECF;charlierC;4F;183|
              |FSPECF;hermiteH;3F;186| (261 . |elt|) |FSPECF;jacobiP;5F;191|
              |FSPECF;laguerreL;4F;196| |FSPECF;meixnerM;5F;201| (270 . |has?|)
              |FSPECF;belong?;BoB;204| (276 . |is?|) |FSPECF;operator;2Bo;205|
              (282 . |kernel|) (288 . |zero?|) (293 . |one?|)
              (298 . |smaller?|) (304 . |iAiryAi|) (309 . |iAiryAiPrime|)
              (314 . |iAiryBi|) (319 . |iAiryBiPrime|) (324 . |exp|)
              (329 . |iLambertW|) (334 . |log|) (339 . |dilog|)
              (344 . |iiPolylog|) (350 . |second|) (|Union| 226 '#1="failed")
              (355 . |retractIfCan|) (|Polynomial| 6) (|Fraction| 225)
              (360 . |numer|) (|Union| 6 '"failed") (365 . |retractIfCan|)
              (370 . |denom|) (375 . |abs|) (380 . |coerce|) (385 . |iiabs|)
              (|Union| 10 '#1#) (390 . |retractIfCan|) (|List| 183)
              (395 . |kernels|) (400 . |height|) (405 . |Zero|) (409 . =)
              (415 . |coerce|) (420 . |One|) |FSPECF;iiconjugate;2F;236|
              (|Mapping| $ $) (424 . |map|) (|Mapping| 7 185) (|List| 185)
              (|ListFunctions2| 185 7) (430 . |map|) (436 . |eval|)
              (443 . |conjugate|) (|SparseMultivariatePolynomial| 6 183)
              (448 . |numer|) (|Mapping| 6 6) (453 . |map|) (459 . |coerce|)
              (464 . |denom|) (469 . |retractIfCan|) (474 . |Gamma|)
              (479 . |iiGamma|) (484 . |Beta|) (490 . |iiBeta|)
              (495 . |digamma|) (500 . |iidigamma|) (505 . |polygamma|)
              (511 . |iipolygamma|) (516 . |besselJ|) (522 . |iiBesselJ|)
              (527 . |besselY|) (533 . |iiBesselY|) (538 . |besselI|)
              (544 . |iiBesselI|) (549 . |besselK|) (555 . |iiBesselK|)
              (560 . |airyAi|) (565 . |iiAiryAi|) (570 . |airyAiPrime|)
              (575 . |iiAiryAiPrime|) (580 . |airyBi|) (585 . |iiAiryBi|)
              (590 . |airyBiPrime|) (|Union| 77 '#1#) (595 . |retractIfCan|)
              (600 . |factorial|) (605 . |iiAiryBiPrime|) (610 . |third|)
              (615 . |evaluate|) (621 . |iiHypergeometricF|) (|List| 10)
              (626 . |variables|) (631 . |member?|) (|OutputForm|) (|List| 292)
              (637 . |elt|) (643 . |overbar|) (|Mapping| 292 293)
              (648 . |display|) (654 . |retract|) (|List| 77) (|Mapping| 77 7)
              (|ListFunctions2| 7 77) (659 . |map|) (665 . |first|)
              (671 . |rest|) (677 . <=) (683 . ~=) (689 . |elt|) (695 . >)
              (|List| 172) (701 . |rest|) (|SExpression|) (707 . |integer|)
              (712 . |rest|) (718 . |first|) (724 . |bracket|) (729 . |prefix|)
              (735 . |coerce|) (|List| 293) (|ListFunctions2| 293 292)
              (740 . |map|) (746 . |concat|) (752 . |inv|))
           '#(|whittakerW| 757 |whittakerM| 764 |weierstrassZeta| 771
              |weierstrassSigma| 778 |weierstrassPPrime| 785
              |weierstrassPInverse| 792 |weierstrassP| 799 |weberE| 806
              |struveL| 812 |struveH| 818 |riemannZeta| 824 |polylog| 829
              |polygamma| 835 |operator| 841 |meixnerM| 846 |meijerG| 854
              |lommelS2| 863 |lommelS1| 870 |lerchPhi| 877 |legendreQ| 884
              |legendreP| 891 |lambertW| 898 |laguerreL| 903 |kummerU| 910
              |kummerM| 917 |kelvinKer| 924 |kelvinKei| 930 |kelvinBer| 936
              |kelvinBei| 942 |jacobiZeta| 948 |jacobiTheta| 954 |jacobiSn| 960
              |jacobiP| 966 |jacobiDn| 974 |jacobiCn| 980 |iipolygamma| 986
              |iidigamma| 991 |iiconjugate| 996 |iiabs| 1001 |iiPolylog| 1006
              |iiHypergeometricF| 1012 |iiGamma| 1017 |iiBeta| 1022 |iiBesselY|
              1027 |iiBesselK| 1032 |iiBesselJ| 1037 |iiBesselI| 1042
              |iiAiryBiPrime| 1047 |iiAiryBi| 1052 |iiAiryAiPrime| 1057
              |iiAiryAi| 1062 |iLambertW| 1067 |iAiryBiPrime| 1072 |iAiryBi|
              1077 |iAiryAiPrime| 1082 |iAiryAi| 1087 |hypergeometricF| 1092
              |hermiteH| 1099 |hankelH2| 1105 |hankelH1| 1111 |ellipticPi| 1117
              |ellipticK| 1124 |ellipticF| 1129 |ellipticE| 1135 |digamma| 1146
              |conjugate| 1151 |charlierC| 1156 |besselY| 1163 |besselK| 1169
              |besselJ| 1175 |besselI| 1181 |belong?| 1187 |angerJ| 1192
              |airyBiPrime| 1198 |airyBi| 1203 |airyAiPrime| 1208 |airyAi| 1213
              |abs| 1218 |Gamma| 1223 |Beta| 1234)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 322
                                                 '(1 11 9 10 12 2 7 0 9 0 45 3
                                                   7 0 9 0 0 49 4 7 0 9 0 0 0
                                                   64 0 6 0 69 0 7 0 70 2 7 71
                                                   0 0 72 0 6 0 73 0 7 0 74 2
                                                   75 71 0 0 76 1 7 0 77 78 2
                                                   79 0 0 0 80 2 7 0 9 81 82 3
                                                   0 7 79 79 7 83 5 0 7 79 79
                                                   79 79 7 84 1 7 9 9 85 1 7 87
                                                   0 88 2 7 0 93 0 94 2 79 7 0
                                                   77 97 0 10 0 98 1 7 0 10 99
                                                   2 7 0 0 10 100 2 7 0 9 81
                                                   101 2 7 0 0 0 102 2 7 0 0 0
                                                   103 2 107 9 9 106 108 2 7 0
                                                   0 93 109 2 7 0 0 0 110 2 7 0
                                                   0 0 111 1 7 0 0 112 0 113 0
                                                   114 1 7 0 0 115 2 107 9 9
                                                   116 117 3 9 0 0 10 120 121 0
                                                   7 0 126 1 7 0 0 127 2 7 0 0
                                                   77 130 1 7 0 0 131 2 7 0 0 0
                                                   134 0 164 0 165 2 107 9 9
                                                   166 167 1 10 172 0 173 1 172
                                                   0 81 174 2 9 0 0 175 176 2 7
                                                   71 0 9 182 1 7 183 0 184 1
                                                   185 79 0 186 5 7 0 9 0 0 0 0
                                                   201 2 9 71 0 10 205 2 9 71 0
                                                   10 207 2 7 0 9 0 209 1 7 71
                                                   0 210 1 7 71 0 211 2 7 71 0
                                                   0 212 1 0 7 7 213 1 0 7 7
                                                   214 1 0 7 7 215 1 0 7 7 216
                                                   1 7 0 0 217 1 0 7 7 218 1 7
                                                   0 0 219 1 7 0 0 220 2 0 7 7
                                                   7 221 1 79 7 0 222 1 7 223 0
                                                   224 1 226 225 0 227 1 225
                                                   228 0 229 1 226 225 0 230 1
                                                   6 0 0 231 1 7 0 6 232 1 0 7
                                                   7 233 1 7 234 0 235 1 7 236
                                                   0 237 1 185 75 0 238 0 75 0
                                                   239 2 75 71 0 0 240 1 7 0
                                                   183 241 0 93 0 242 2 7 0 244
                                                   183 245 2 248 79 246 247 249
                                                   3 7 0 0 236 81 250 1 6 0 0
                                                   251 1 7 252 0 253 2 113 0
                                                   254 0 255 1 7 0 252 256 1 7
                                                   252 0 257 1 7 228 0 258 1 6
                                                   0 0 259 1 0 7 7 260 2 6 0 0
                                                   0 261 1 0 7 79 262 1 6 0 0
                                                   263 1 0 7 7 264 2 6 0 0 0
                                                   265 1 0 7 79 266 2 6 0 0 0
                                                   267 1 0 7 79 268 2 6 0 0 0
                                                   269 1 0 7 79 270 2 6 0 0 0
                                                   271 1 0 7 79 272 2 6 0 0 0
                                                   273 1 0 7 79 274 1 6 0 0 275
                                                   1 0 7 7 276 1 6 0 0 277 1 0
                                                   7 7 278 1 6 0 0 279 1 0 7 7
                                                   280 1 6 0 0 281 1 7 282 0
                                                   283 1 77 0 0 284 1 0 7 7 285
                                                   1 79 7 0 286 2 107 9 9 166
                                                   287 1 0 7 79 288 1 7 289 0
                                                   290 2 289 71 10 0 291 2 293
                                                   292 0 77 294 1 292 0 0 295 2
                                                   9 0 0 296 297 1 7 77 0 298 2
                                                   301 299 300 79 302 2 79 0 0
                                                   75 303 2 79 0 0 75 304 2 77
                                                   71 0 0 305 2 75 71 0 0 306 2
                                                   299 77 0 77 307 2 77 71 0 0
                                                   308 2 309 0 0 75 310 1 311
                                                   77 0 312 2 293 0 0 75 313 2
                                                   293 0 0 75 314 1 292 0 81
                                                   315 2 292 0 0 81 316 1 10
                                                   292 0 317 2 319 293 296 318
                                                   320 2 293 0 0 0 321 1 7 0 0
                                                   322 3 0 7 7 7 7 123 3 0 7 7
                                                   7 7 119 3 0 7 7 7 7 68 3 0 7
                                                   7 7 7 67 3 0 7 7 7 7 66 3 0
                                                   7 7 7 7 105 3 0 7 7 7 7 65 2
                                                   0 7 7 7 129 2 0 7 7 7 136 2
                                                   0 7 7 7 133 1 0 7 7 198 2 0
                                                   7 7 7 63 2 0 7 7 7 53 1 0 9
                                                   9 208 4 0 7 7 7 7 7 204 5 1
                                                   7 79 79 79 79 7 84 3 0 7 7 7
                                                   7 144 3 0 7 7 7 7 142 3 0 7
                                                   7 7 7 196 3 0 7 7 7 7 152 3
                                                   0 7 7 7 7 150 1 0 7 7 62 3 0
                                                   7 7 7 7 203 3 0 7 7 7 7 148
                                                   3 0 7 7 7 7 146 2 0 7 7 7
                                                   159 2 0 7 7 7 158 2 0 7 7 7
                                                   155 2 0 7 7 7 154 2 0 7 7 7
                                                   192 2 0 7 7 7 194 2 0 7 7 7
                                                   181 4 0 7 7 7 7 7 202 2 0 7
                                                   7 7 188 2 0 7 7 7 187 1 0 7
                                                   79 266 1 0 7 7 264 1 0 7 7
                                                   243 1 0 7 7 233 2 0 7 7 7
                                                   221 1 0 7 79 288 1 0 7 7 260
                                                   1 0 7 79 262 1 0 7 79 270 1
                                                   0 7 79 274 1 0 7 79 268 1 0
                                                   7 79 272 1 0 7 7 285 1 0 7 7
                                                   280 1 0 7 7 278 1 0 7 7 276
                                                   1 0 7 7 218 1 0 7 7 216 1 0
                                                   7 7 215 1 0 7 7 214 1 0 7 7
                                                   213 3 1 7 79 79 7 83 2 0 7 7
                                                   7 200 2 0 7 7 7 140 2 0 7 7
                                                   7 138 3 0 7 7 7 7 179 1 0 7
                                                   7 162 2 0 7 7 7 171 1 0 7 7
                                                   163 2 0 7 7 7 170 1 0 7 7 52
                                                   1 0 7 7 47 3 0 7 7 7 7 199 2
                                                   0 7 7 7 55 2 0 7 7 7 57 2 0
                                                   7 7 7 54 2 0 7 7 7 56 1 0 71
                                                   9 206 2 0 7 7 7 125 1 0 7 7
                                                   61 1 0 7 7 60 1 0 7 7 59 1 0
                                                   7 7 58 1 0 7 7 46 1 0 7 7 48
                                                   2 0 7 7 7 50 2 0 7 7 7
                                                   51)))))
           '|lookupComplete|)) 
