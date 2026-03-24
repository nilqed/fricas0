
(SDEFUN |DFLOAT;doubleFloatFormat;2S;1| ((|s| (|String|)) (% (|String|)))
        (SPROG ((|ss| (|String|)))
               (SEQ (LETT |ss| (QREFELT % 6)) (SETELT % 6 |s|) (EXIT |ss|)))) 

(SDEFUN |DFLOAT;OMwrite;Omd%BV;2|
        ((|dev| (|OpenMathDevice|)) (|x| (%)) (|wholeObj| (|Boolean|))
         (% (|Void|)))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT % 11))))
             (SPADCALL |dev| |x| (QREFELT % 13))
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT % 14))))))) 

(PUT '|DFLOAT;checkComplex| '|SPADreplace| '|c_to_r|) 

(SDEFUN |DFLOAT;checkComplex| ((|x| (%)) (% (%))) (|c_to_r| |x|)) 

(PUT '|DFLOAT;base;Pi;4| '|SPADreplace| '(XLAM NIL (FLOAT-RADIX 0.0))) 

(SDEFUN |DFLOAT;base;Pi;4| ((% (|PositiveInteger|))) (FLOAT-RADIX 0.0)) 

(SDEFUN |DFLOAT;mantissa;%I;5| ((|x| (%)) (% (|Integer|)))
        (QCAR (|DFLOAT;manexp| |x| %))) 

(SDEFUN |DFLOAT;exponent;%I;6| ((|x| (%)) (% (|Integer|)))
        (QCDR (|DFLOAT;manexp| |x| %))) 

(PUT '|DFLOAT;precision;Pi;7| '|SPADreplace| '(XLAM NIL (FLOAT-DIGITS 0.0))) 

(SDEFUN |DFLOAT;precision;Pi;7| ((% (|PositiveInteger|))) (FLOAT-DIGITS 0.0)) 

(SDEFUN |DFLOAT;bits;Pi;8| ((% (|PositiveInteger|)))
        (SPROG ((#1=#:G310 NIL))
               (COND
                ((EQL (SPADCALL (QREFELT % 18)) 2) (SPADCALL (QREFELT % 22)))
                ((EQL (SPADCALL (QREFELT % 18)) 16)
                 (* 4 (SPADCALL (QREFELT % 22))))
                ('T
                 (PROG1
                     (LETT #1#
                           (TRUNCATE
                            (SPADCALL (SPADCALL (QREFELT % 22))
                                      (SPADCALL
                                       (FLOAT (SPADCALL (QREFELT % 18))
                                              MOST-POSITIVE-DOUBLE-FLOAT)
                                       (QREFELT % 23))
                                      (QREFELT % 24))))
                   (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                     '(|Integer|) #1#)))))) 

(PUT '|DFLOAT;max;%;9| '|SPADreplace| '(XLAM NIL MOST-POSITIVE-DOUBLE-FLOAT)) 

(SDEFUN |DFLOAT;max;%;9| ((% (%))) MOST-POSITIVE-DOUBLE-FLOAT) 

(PUT '|DFLOAT;min;%;10| '|SPADreplace| '(XLAM NIL MOST-NEGATIVE-DOUBLE-FLOAT)) 

(SDEFUN |DFLOAT;min;%;10| ((% (%))) MOST-NEGATIVE-DOUBLE-FLOAT) 

(SDEFUN |DFLOAT;order;%I;11| ((|a| (%)) (% (|Integer|)))
        (- (+ (SPADCALL (QREFELT % 22)) (SPADCALL |a| (QREFELT % 21))) 1)) 

(PUT '|DFLOAT;Zero;%;12| '|SPADreplace|
     '(XLAM NIL (FLOAT 0 MOST-POSITIVE-DOUBLE-FLOAT))) 

(SDEFUN |DFLOAT;Zero;%;12| ((% (%))) (FLOAT 0 MOST-POSITIVE-DOUBLE-FLOAT)) 

(PUT '|DFLOAT;One;%;13| '|SPADreplace|
     '(XLAM NIL (FLOAT 1 MOST-POSITIVE-DOUBLE-FLOAT))) 

(SDEFUN |DFLOAT;One;%;13| ((% (%))) (FLOAT 1 MOST-POSITIVE-DOUBLE-FLOAT)) 

(SDEFUN |DFLOAT;exp1;%;14| ((% (%)))
        (|div_DF| (FLOAT 534625820200 MOST-POSITIVE-DOUBLE-FLOAT)
                  (FLOAT 196677847971 MOST-POSITIVE-DOUBLE-FLOAT))) 

(PUT '|DFLOAT;pi;%;15| '|SPADreplace|
     '(XLAM NIL (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT))) 

(SDEFUN |DFLOAT;pi;%;15| ((% (%))) (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)) 

(SDEFUN |DFLOAT;convert;%S;16| ((|x| (%)) (% (|String|)))
        (FORMAT NIL (QREFELT % 6) |x|)) 

(SDEFUN |DFLOAT;coerce;%Of;17| ((|x| (%)) (% (|OutputForm|)))
        (COND
         ((SPADCALL |x| 0.0 (QREFELT % 34))
          (SPADCALL (SPADCALL |x| (QREFELT % 33)) (QREFELT % 36)))
         ('T
          (SPADCALL (SPADCALL (|minus_DF| |x|) (QREFELT % 37))
                    (QREFELT % 38))))) 

(SDEFUN |DFLOAT;convert;%If;18| ((|x| (%)) (% (|InputForm|)))
        (SPADCALL |x| (QREFELT % 40))) 

(PUT '|DFLOAT;<;2%B;19| '|SPADreplace| '|less_DF|) 

(SDEFUN |DFLOAT;<;2%B;19| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (|less_DF| |x| |y|)) 

(PUT '|DFLOAT;-;2%;20| '|SPADreplace| '|minus_DF|) 

(SDEFUN |DFLOAT;-;2%;20| ((|x| (%)) (% (%))) (|minus_DF| |x|)) 

(PUT '|DFLOAT;+;3%;21| '|SPADreplace| '|add_DF|) 

(SDEFUN |DFLOAT;+;3%;21| ((|x| (%)) (|y| (%)) (% (%))) (|add_DF| |x| |y|)) 

(PUT '|DFLOAT;-;3%;22| '|SPADreplace| '|sub_DF|) 

(SDEFUN |DFLOAT;-;3%;22| ((|x| (%)) (|y| (%)) (% (%))) (|sub_DF| |x| |y|)) 

(PUT '|DFLOAT;*;3%;23| '|SPADreplace| '|mul_DF|) 

(SDEFUN |DFLOAT;*;3%;23| ((|x| (%)) (|y| (%)) (% (%))) (|mul_DF| |x| |y|)) 

(PUT '|DFLOAT;*;I2%;24| '|SPADreplace| '(XLAM (|i| |x|) (|mul_DF_I| |x| |i|))) 

(SDEFUN |DFLOAT;*;I2%;24| ((|i| (|Integer|)) (|x| (%)) (% (%)))
        (|mul_DF_I| |x| |i|)) 

(PUT '|DFLOAT;max;3%;25| '|SPADreplace| '|max_DF|) 

(SDEFUN |DFLOAT;max;3%;25| ((|x| (%)) (|y| (%)) (% (%))) (|max_DF| |x| |y|)) 

(PUT '|DFLOAT;min;3%;26| '|SPADreplace| '|min_DF|) 

(SDEFUN |DFLOAT;min;3%;26| ((|x| (%)) (|y| (%)) (% (%))) (|min_DF| |x| |y|)) 

(PUT '|DFLOAT;=;2%B;27| '|SPADreplace| '|eql_DF|) 

(SDEFUN |DFLOAT;=;2%B;27| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (|eql_DF| |x| |y|)) 

(PUT '|DFLOAT;/;%I%;28| '|SPADreplace| '|div_DF_I|) 

(SDEFUN |DFLOAT;/;%I%;28| ((|x| (%)) (|i| (|Integer|)) (% (%)))
        (|div_DF_I| |x| |i|)) 

(SDEFUN |DFLOAT;sqrt;2%;29| ((|x| (%)) (% (%)))
        (|DFLOAT;checkComplex| (|sqrt_DF| |x|) %)) 

(PUT '|DFLOAT;qsqrt;2%;30| '|SPADreplace| '|qsqrt_DF|) 

(SDEFUN |DFLOAT;qsqrt;2%;30| ((|x| (%)) (% (%))) (|qsqrt_DF| |x|)) 

(SDEFUN |DFLOAT;log10;2%;31| ((|x| (%)) (% (%)))
        (|DFLOAT;checkComplex| (LOG10 |x|) %)) 

(PUT '|DFLOAT;^;%I%;32| '|SPADreplace| '|expt_DF_I|) 

(SDEFUN |DFLOAT;^;%I%;32| ((|x| (%)) (|i| (|Integer|)) (% (%)))
        (|expt_DF_I| |x| |i|)) 

(SDEFUN |DFLOAT;^;3%;33| ((|x| (%)) (|y| (%)) (% (%)))
        (|DFLOAT;checkComplex| (|expt_DF| |x| |y|) %)) 

(PUT '|DFLOAT;coerce;I%;34| '|SPADreplace|
     '(XLAM (|i|) (FLOAT |i| MOST-POSITIVE-DOUBLE-FLOAT))) 

(SDEFUN |DFLOAT;coerce;I%;34| ((|i| (|Integer|)) (% (%)))
        (FLOAT |i| MOST-POSITIVE-DOUBLE-FLOAT)) 

(PUT '|DFLOAT;exp;2%;35| '|SPADreplace| '|exp_DF|) 

(SDEFUN |DFLOAT;exp;2%;35| ((|x| (%)) (% (%))) (|exp_DF| |x|)) 

(SDEFUN |DFLOAT;log;2%;36| ((|x| (%)) (% (%)))
        (|DFLOAT;checkComplex| (|log_DF| |x|) %)) 

(PUT '|DFLOAT;qlog;2%;37| '|SPADreplace| '|qlog_DF|) 

(SDEFUN |DFLOAT;qlog;2%;37| ((|x| (%)) (% (%))) (|qlog_DF| |x|)) 

(SDEFUN |DFLOAT;log2;2%;38| ((|x| (%)) (% (%)))
        (|DFLOAT;checkComplex| (LOG2 |x|) %)) 

(PUT '|DFLOAT;sin;2%;39| '|SPADreplace| '|sin_DF|) 

(SDEFUN |DFLOAT;sin;2%;39| ((|x| (%)) (% (%))) (|sin_DF| |x|)) 

(PUT '|DFLOAT;cos;2%;40| '|SPADreplace| '|cos_DF|) 

(SDEFUN |DFLOAT;cos;2%;40| ((|x| (%)) (% (%))) (|cos_DF| |x|)) 

(PUT '|DFLOAT;tan;2%;41| '|SPADreplace| '|tan_DF|) 

(SDEFUN |DFLOAT;tan;2%;41| ((|x| (%)) (% (%))) (|tan_DF| |x|)) 

(PUT '|DFLOAT;cot;2%;42| '|SPADreplace| 'COT) 

(SDEFUN |DFLOAT;cot;2%;42| ((|x| (%)) (% (%))) (COT |x|)) 

(SDEFUN |DFLOAT;sec;2%;43| ((|x| (%)) (% (%))) (|div_DF| 1.0 (|cos_DF| |x|))) 

(SDEFUN |DFLOAT;csc;2%;44| ((|x| (%)) (% (%))) (|div_DF| 1.0 (|sin_DF| |x|))) 

(SDEFUN |DFLOAT;asin;2%;45| ((|x| (%)) (% (%)))
        (|DFLOAT;checkComplex| (ASIN |x|) %)) 

(SDEFUN |DFLOAT;acos;2%;46| ((|x| (%)) (% (%)))
        (|DFLOAT;checkComplex| (ACOS |x|) %)) 

(PUT '|DFLOAT;atan;2%;47| '|SPADreplace| '|atan_DF|) 

(SDEFUN |DFLOAT;atan;2%;47| ((|x| (%)) (% (%))) (|atan_DF| |x|)) 

(SDEFUN |DFLOAT;acsc;2%;48| ((|x| (%)) (% (%)))
        (SPADCALL (|div_DF| 1.0 |x|) (QREFELT % 67))) 

(SDEFUN |DFLOAT;acot;2%;49| ((|x| (%)) (% (%)))
        (COND
         ((|less_DF| 0.0 |x|)
          (COND ((|less_DF| |x| 1.0) (|sub_DF| (QREFELT % 71) (|atan_DF| |x|)))
                ('T (|atan_DF| (|div_DF| 1.0 |x|)))))
         ((NULL (|less_DF| (|minus_DF| 1.0) |x|))
          (|sub_DF| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)
                    (|atan_DF| (|minus_DF| (|div_DF| 1.0 |x|)))))
         ('T (|add_DF| (QREFELT % 71) (|atan_DF| (|minus_DF| |x|)))))) 

(SDEFUN |DFLOAT;asec;2%;50| ((|x| (%)) (% (%)))
        (SPADCALL (|div_DF| 1.0 |x|) (QREFELT % 68))) 

(PUT '|DFLOAT;sinh;2%;51| '|SPADreplace| '|sinh_DF|) 

(SDEFUN |DFLOAT;sinh;2%;51| ((|x| (%)) (% (%))) (|sinh_DF| |x|)) 

(PUT '|DFLOAT;cosh;2%;52| '|SPADreplace| '|cosh_DF|) 

(SDEFUN |DFLOAT;cosh;2%;52| ((|x| (%)) (% (%))) (|cosh_DF| |x|)) 

(PUT '|DFLOAT;tanh;2%;53| '|SPADreplace| '|tanh_DF|) 

(SDEFUN |DFLOAT;tanh;2%;53| ((|x| (%)) (% (%))) (|tanh_DF| |x|)) 

(SDEFUN |DFLOAT;csch;2%;54| ((|x| (%)) (% (%))) (|div_DF| 1.0 (|sinh_DF| |x|))) 

(SDEFUN |DFLOAT;coth;2%;55| ((|x| (%)) (% (%))) (|div_DF| 1.0 (|tanh_DF| |x|))) 

(SDEFUN |DFLOAT;sech;2%;56| ((|x| (%)) (% (%))) (|div_DF| 1.0 (|cosh_DF| |x|))) 

(PUT '|DFLOAT;asinh;2%;57| '|SPADreplace| 'ASINH) 

(SDEFUN |DFLOAT;asinh;2%;57| ((|x| (%)) (% (%))) (ASINH |x|)) 

(SDEFUN |DFLOAT;acosh;2%;58| ((|x| (%)) (% (%)))
        (|DFLOAT;checkComplex| (ACOSH |x|) %)) 

(SDEFUN |DFLOAT;atanh;2%;59| ((|x| (%)) (% (%)))
        (|DFLOAT;checkComplex| (ATANH |x|) %)) 

(SDEFUN |DFLOAT;acsch;2%;60| ((|x| (%)) (% (%))) (ASINH (|div_DF| 1.0 |x|))) 

(SDEFUN |DFLOAT;acoth;2%;61| ((|x| (%)) (% (%)))
        (SPADCALL (|div_DF| 1.0 |x|) (QREFELT % 82))) 

(SDEFUN |DFLOAT;asech;2%;62| ((|x| (%)) (% (%)))
        (SPADCALL (|div_DF| 1.0 |x|) (QREFELT % 81))) 

(PUT '|DFLOAT;/;3%;63| '|SPADreplace| '|div_DF|) 

(SDEFUN |DFLOAT;/;3%;63| ((|x| (%)) (|y| (%)) (% (%))) (|div_DF| |x| |y|)) 

(PUT '|DFLOAT;negative?;%B;64| '|SPADreplace| '|negative?_DF|) 

(SDEFUN |DFLOAT;negative?;%B;64| ((|x| (%)) (% (|Boolean|)))
        (|negative?_DF| |x|)) 

(PUT '|DFLOAT;zero?;%B;65| '|SPADreplace| '|zero?_DF|) 

(SDEFUN |DFLOAT;zero?;%B;65| ((|x| (%)) (% (|Boolean|))) (|zero?_DF| |x|)) 

(SDEFUN |DFLOAT;hashUpdate!;Hs%Hs;66|
        ((|hs| #1=(|HashState|)) (|s| (%)) (% #1#))
        (HASHSTATEUPDATE |hs| (SXHASH |s|))) 

(SDEFUN |DFLOAT;recip;%U;67| ((|x| (%)) (% (|Union| % "failed")))
        (COND ((|zero?_DF| |x|) (CONS 1 "failed"))
              ('T (CONS 0 (|div_DF| 1.0 |x|))))) 

(PUT '|DFLOAT;differentiate;2%;68| '|SPADreplace| '(XLAM (|x|) 0.0)) 

(SDEFUN |DFLOAT;differentiate;2%;68| ((|x| (%)) (% (%))) 0.0) 

(SDEFUN |DFLOAT;besselI;3%;69| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 95))) 

(SDEFUN |DFLOAT;besselJ;3%;70| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 97))) 

(SDEFUN |DFLOAT;besselK;3%;71| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 99))) 

(SDEFUN |DFLOAT;besselY;3%;72| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 101))) 

(SDEFUN |DFLOAT;Beta;3%;73| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 104))) 

(SDEFUN |DFLOAT;Gamma;2%;74| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 106))) 

(SDEFUN |DFLOAT;airyAi;2%;75| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 108))) 

(SDEFUN |DFLOAT;airyAiPrime;2%;76| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 110))) 

(SDEFUN |DFLOAT;airyBi;2%;77| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 112))) 

(SDEFUN |DFLOAT;airyBiPrime;2%;78| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 114))) 

(SDEFUN |DFLOAT;digamma;2%;79| ((|x| (%)) (% (%)))
        (SPADCALL 0 |x| (QREFELT % 117))) 

(SDEFUN |DFLOAT;polygamma;3%;80| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG ((|n| (|Union| (|Integer|) "failed")))
               (SEQ (LETT |n| (SPADCALL |x| (QREFELT % 120)))
                    (EXIT
                     (COND
                      ((QEQCAR |n| 0)
                       (COND
                        ((>= (QCDR |n|) 0)
                         (SPADCALL (QCDR |n|) |y| (QREFELT % 117)))
                        (#1='T
                         (|error|
                          #2="polygamma: first argument should be a nonnegative integer"))))
                      (#1# (|error| #2#))))))) 

(SDEFUN |DFLOAT;lambertW;2%;81| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 123))) 

(SDEFUN |DFLOAT;ellipticF;3%;82| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 126))) 

(SDEFUN |DFLOAT;ellipticK;2%;83| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 128))) 

(SDEFUN |DFLOAT;ellipticE;3%;84| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 130))) 

(SDEFUN |DFLOAT;ellipticE;2%;85| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 132))) 

(SDEFUN |DFLOAT;ellipticPi;4%;86| ((|x| (%)) (|y| (%)) (|z| (%)) (% (%)))
        (SPADCALL |x| |y| |z| (QREFELT % 134))) 

(SDEFUN |DFLOAT;jacobiSn;3%;87| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 137)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 138))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 139))
                                       (SPADCALL |y| (QREFELT % 139))
                                       (QREFELT % 141))
                             (QREFELT % 142))))
                      (SPADCALL |obits| (QREFELT % 138))))))) 

(SDEFUN |DFLOAT;jacobiCn;3%;88| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 137)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 138))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 139))
                                       (SPADCALL |y| (QREFELT % 139))
                                       (QREFELT % 144))
                             (QREFELT % 142))))
                      (SPADCALL |obits| (QREFELT % 138))))))) 

(SDEFUN |DFLOAT;jacobiDn;3%;89| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 137)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 138))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 139))
                                       (SPADCALL |y| (QREFELT % 139))
                                       (QREFELT % 146))
                             (QREFELT % 142))))
                      (SPADCALL |obits| (QREFELT % 138))))))) 

(SDEFUN |DFLOAT;weierstrassP;4%;90| ((|x| (%)) (|y| (%)) (|z| (%)) (% (%)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 137)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 138))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 139))
                                       (SPADCALL |y| (QREFELT % 139))
                                       (SPADCALL |z| (QREFELT % 139))
                                       (QREFELT % 148))
                             (QREFELT % 142))))
                      (SPADCALL |obits| (QREFELT % 138))))))) 

(SDEFUN |DFLOAT;weierstrassPPrime;4%;91|
        ((|x| (%)) (|y| (%)) (|z| (%)) (% (%)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 137)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 138))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 139))
                                       (SPADCALL |y| (QREFELT % 139))
                                       (SPADCALL |z| (QREFELT % 139))
                                       (QREFELT % 150))
                             (QREFELT % 142))))
                      (SPADCALL |obits| (QREFELT % 138))))))) 

(PUT '|DFLOAT;wholePart;%I;92| '|SPADreplace| 'TRUNCATE) 

(SDEFUN |DFLOAT;wholePart;%I;92| ((|x| (%)) (% (|Integer|))) (TRUNCATE |x|)) 

(SDEFUN |DFLOAT;float;2IPi%;93|
        ((|ma| #1=(|Integer|)) (|ex| #1#) (|b| (|PositiveInteger|)) (% (%)))
        (|mul_DF_I| (|expt_DF_I| (FLOAT |b| MOST-POSITIVE-DOUBLE-FLOAT) |ex|)
                    |ma|)) 

(PUT '|DFLOAT;convert;2%;94| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |DFLOAT;convert;2%;94| ((|x| (%)) (% (|DoubleFloat|))) |x|) 

(SDEFUN |DFLOAT;convert;%F;95| ((|x| (%)) (% (|Float|)))
        (SPADCALL |x| (QREFELT % 155))) 

(SDEFUN |DFLOAT;rationalApproximation;%NniF;96|
        ((|x| (%)) (|d| (|NonNegativeInteger|)) (% (|Fraction| (|Integer|))))
        (SPADCALL |x| |d| 10 (QREFELT % 158))) 

(SDEFUN |DFLOAT;atan;3%;97| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG ((|theta| (%)))
               (SEQ
                (COND
                 ((|eql_DF| |x| 0.0)
                  (COND
                   ((SPADCALL |y| 0.0 (QREFELT % 160))
                    (|div_DF_I| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT) 2))
                   ((|less_DF| |y| 0.0)
                    (|minus_DF|
                     (|div_DF_I| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT) 2)))
                   (#1='T 0.0)))
                 (#1#
                  (SEQ (LETT |theta| (|atan_DF| (|abs_DF| (|div_DF| |y| |x|))))
                       (COND
                        ((|less_DF| |x| 0.0)
                         (LETT |theta|
                               (|sub_DF| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)
                                         |theta|))))
                       (COND
                        ((|less_DF| |y| 0.0)
                         (LETT |theta| (|minus_DF| |theta|))))
                       (EXIT |theta|))))))) 

(SDEFUN |DFLOAT;retract;%F;98| ((|x| (%)) (% (|Fraction| (|Integer|))))
        (SPROG ((#1=#:G425 NIL))
               (SPADCALL |x|
                         (PROG1 (LETT #1# (- (SPADCALL (QREFELT % 22)) 1))
                           (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #1#))
                         (SPADCALL (QREFELT % 18)) (QREFELT % 158)))) 

(SDEFUN |DFLOAT;retractIfCan;%U;99|
        ((|x| (%)) (% (|Union| (|Fraction| (|Integer|)) "failed")))
        (SPROG ((#1=#:G430 NIL))
               (CONS 0
                     (SPADCALL |x|
                               (PROG1
                                   (LETT #1# (- (SPADCALL (QREFELT % 22)) 1))
                                 (|check_subtype2| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #1#))
                               (SPADCALL (QREFELT % 18)) (QREFELT % 158))))) 

(SDEFUN |DFLOAT;retract;%I;100| ((|x| (%)) (% (|Integer|)))
        (SPROG ((|n| (|Integer|)))
               (SEQ (LETT |n| (TRUNCATE |x|))
                    (EXIT
                     (COND
                      ((|eql_DF| |x| (FLOAT |n| MOST-POSITIVE-DOUBLE-FLOAT))
                       |n|)
                      ('T (|error| "Not an integer"))))))) 

(SDEFUN |DFLOAT;retractIfCan;%U;101|
        ((|x| (%)) (% (|Union| (|Integer|) "failed")))
        (SPROG ((|n| (|Integer|)))
               (SEQ (LETT |n| (TRUNCATE |x|))
                    (EXIT
                     (COND
                      ((|eql_DF| |x| (FLOAT |n| MOST-POSITIVE-DOUBLE-FLOAT))
                       (CONS 0 |n|))
                      ('T (CONS 1 "failed"))))))) 

(SDEFUN |DFLOAT;sign;%I;102| ((|x| (%)) (% (|Integer|)))
        (SPADCALL (FLOAT-SIGN |x| 1.0) (QREFELT % 165))) 

(PUT '|DFLOAT;sign;2%;103| '|SPADreplace| '(XLAM (|x|) (FLOAT-SIGN |x| 1.0))) 

(SDEFUN |DFLOAT;sign;2%;103| ((|x| (%)) (% (%))) (FLOAT-SIGN |x| 1.0)) 

(PUT '|DFLOAT;abs;2%;104| '|SPADreplace| '|abs_DF|) 

(SDEFUN |DFLOAT;abs;2%;104| ((|x| (%)) (% (%))) (|abs_DF| |x|)) 

(PUT '|DFLOAT;conjugate;2%;105| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |DFLOAT;conjugate;2%;105| ((|x| (%)) (% (%))) |x|) 

(SDEFUN |DFLOAT;manexp|
        ((|x| (%))
         (% (|Record| (|:| MANTISSA (|Integer|)) (|:| EXPONENT (|Integer|)))))
        (SPROG
         ((|two53| (|PositiveInteger|))
          (|me| (|Record| (|:| |man| %) (|:| |exp| (|Integer|))))
          (#1=#:G451 NIL) (|s| (|Integer|)))
         (SEQ
          (EXIT
           (COND ((|zero?_DF| |x|) (CONS 0 0))
                 ('T
                  (SEQ (LETT |s| (SPADCALL |x| (QREFELT % 167)))
                       (LETT |x| (|abs_DF| |x|))
                       (COND
                        ((SPADCALL |x| MOST-POSITIVE-DOUBLE-FLOAT
                                   (QREFELT % 160))
                         (PROGN
                          (LETT #1#
                                (CONS
                                 (+
                                  (* |s|
                                     (SPADCALL MOST-POSITIVE-DOUBLE-FLOAT
                                               (QREFELT % 20)))
                                  1)
                                 (SPADCALL MOST-POSITIVE-DOUBLE-FLOAT
                                           (QREFELT % 21))))
                          (GO #2=#:G450))))
                       (LETT |me| (MANEXP |x|))
                       (LETT |two53|
                             (EXPT (SPADCALL (QREFELT % 18))
                                   (SPADCALL (QREFELT % 22))))
                       (EXIT
                        (CONS
                         (* |s|
                            (TRUNCATE
                             (SPADCALL |two53| (QCAR |me|) (QREFELT % 24))))
                         (- (QCDR |me|) (SPADCALL (QREFELT % 22)))))))))
          #2# (EXIT #1#)))) 

(SDEFUN |DFLOAT;rationalApproximation;%2NniF;107|
        ((|f| (%)) (|d| (|NonNegativeInteger|)) (|b| (|NonNegativeInteger|))
         (% (|Fraction| (|Integer|))))
        (SPROG
         ((|t| #1=(|Integer|)) (|s| #2=(|Integer|)) (|#G148| #3=(|Integer|))
          (|#G147| #1#) (|q1| #4=(|Integer|)) (|q0| (|Integer|))
          (|#G146| #5=(|Integer|)) (|#G145| #4#) (|p1| #6=(|Integer|))
          (|p0| (|Integer|)) (|#G144| #5#) (|#G143| #6#) (#7=#:G485 NIL)
          (|q2| #5#) (|p2| #5#) (|r| #3#) (|q| #8=(|Integer|))
          (|#G142| (|Record| (|:| |quotient| #8#) (|:| |remainder| #3#)))
          (|tol| (|NonNegativeInteger|)) (|de| #1#) (#9=#:G475 NIL)
          (#10=#:G473 NIL) (BASE (|PositiveInteger|)) (|ex| #11=(|Integer|))
          (|nu| #2#)
          (|#G141| (|Record| (|:| MANTISSA #2#) (|:| EXPONENT #11#))))
         (SEQ
          (EXIT
           (SEQ
            (PROGN
             (LETT |#G141| (|DFLOAT;manexp| |f| %))
             (LETT |nu| (QCAR |#G141|))
             (LETT |ex| (QCDR |#G141|))
             |#G141|)
            (LETT BASE (SPADCALL (QREFELT % 18)))
            (EXIT
             (COND
              ((>= |ex| 0)
               (SPADCALL
                (* |nu|
                   (EXPT BASE
                         (PROG1 (LETT #10# |ex|)
                           (|check_subtype2| (>= #10# 0)
                                             '(|NonNegativeInteger|)
                                             '(|Integer|) #10#))))
                (QREFELT % 171)))
              (#12='T
               (SEQ
                (LETT |de|
                      (EXPT BASE
                            (PROG1 (LETT #9# (- |ex|))
                              (|check_subtype2| (>= #9# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #9#))))
                (EXIT
                 (COND ((< |b| 2) (|error| "base must be > 1"))
                       (#12#
                        (SEQ (LETT |tol| (EXPT |b| |d|)) (LETT |s| |nu|)
                             (LETT |t| |de|) (LETT |p0| 0) (LETT |p1| 1)
                             (LETT |q0| 1) (LETT |q1| 0)
                             (EXIT
                              (SEQ G190 NIL
                                   (SEQ
                                    (PROGN
                                     (LETT |#G142| (DIVIDE2 |s| |t|))
                                     (LETT |q| (QCAR |#G142|))
                                     (LETT |r| (QCDR |#G142|))
                                     |#G142|)
                                    (LETT |p2| (+ (* |q| |p1|) |p0|))
                                    (LETT |q2| (+ (* |q| |q1|) |q0|))
                                    (COND
                                     ((OR (EQL |r| 0)
                                          (<
                                           (* |tol|
                                              (ABS
                                               (- (* |nu| |q2|)
                                                  (* |de| |p2|))))
                                           (* |de| (ABS |p2|))))
                                      (EXIT
                                       (PROGN
                                        (LETT #7#
                                              (SPADCALL |p2| |q2|
                                                        (QREFELT % 172)))
                                        (GO #13=#:G484)))))
                                    (PROGN
                                     (LETT |#G143| |p1|)
                                     (LETT |#G144| |p2|)
                                     (LETT |p0| |#G143|)
                                     (LETT |p1| |#G144|))
                                    (PROGN
                                     (LETT |#G145| |q1|)
                                     (LETT |#G146| |q2|)
                                     (LETT |q0| |#G145|)
                                     (LETT |q1| |#G146|))
                                    (EXIT
                                     (PROGN
                                      (LETT |#G147| |t|)
                                      (LETT |#G148| |r|)
                                      (LETT |s| |#G147|)
                                      (LETT |t| |#G148|))))
                                   NIL (GO G190) G191 (EXIT NIL)))))))))))))
          #13# (EXIT #7#)))) 

(SDEFUN |DFLOAT;^;%F%;108| ((|x| (%)) (|r| (|Fraction| (|Integer|))) (% (%)))
        (SPROG ((#1=#:G495 NIL) (|d| (|Integer|)) (|n| (|Integer|)))
               (SEQ
                (EXIT
                 (COND
                  ((|zero?_DF| |x|)
                   (COND ((SPADCALL |r| (QREFELT % 173)) 1.0)
                         ((SPADCALL |r| (QREFELT % 174))
                          (|error| "division by 0"))
                         (#2='T 0.0)))
                  ((OR (SPADCALL |r| (QREFELT % 173)) (|eql_DF| |x| 1.0)) 1.0)
                  ('T
                   (COND
                    ((SPADCALL |r| (|spadConstant| % 175) (QREFELT % 176)) |x|)
                    (#2#
                     (SEQ (LETT |n| (SPADCALL |r| (QREFELT % 177)))
                          (LETT |d| (SPADCALL |r| (QREFELT % 178)))
                          (EXIT
                           (COND
                            ((|negative?_DF| |x|)
                             (COND
                              ((ODDP |d|)
                               (COND
                                ((ODDP |n|)
                                 (PROGN
                                  (LETT #1#
                                        (|minus_DF|
                                         (SPADCALL (|minus_DF| |x|) |r|
                                                   (QREFELT % 179))))
                                  (GO #3=#:G494)))
                                (#2#
                                 (PROGN
                                  (LETT #1#
                                        (SPADCALL (|minus_DF| |x|) |r|
                                                  (QREFELT % 179)))
                                  (GO #3#)))))
                              (#2# (|error| "negative root"))))
                            ((EQL |d| 2)
                             (|expt_DF_I| (SPADCALL |x| (QREFELT % 52)) |n|))
                            (#2#
                             (SPADCALL |x|
                                       (|div_DF|
                                        (FLOAT |n| MOST-POSITIVE-DOUBLE-FLOAT)
                                        (FLOAT |d| MOST-POSITIVE-DOUBLE-FLOAT))
                                       (QREFELT % 56)))))))))))
                #3# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |DoubleFloat;|)) 

(DEFUN |DoubleFloat;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|DoubleFloat|))
          (LETT % (GETREFV 194))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|DoubleFloat| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (AND (|HasCategory| % '(|arbitraryPrecision|))
               (|augmentPredVector| % 1))
          (AND (|not| (|HasCategory| % '(|arbitraryExponent|)))
               (|not| (|HasCategory| % '(|arbitraryPrecision|)))
               (|augmentPredVector| % 2))
          (AND (|HasCategory| % '(|RetractableTo| (|Integer|)))
               (|augmentPredVector| % 4))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6 "~A")
          (QSETREFV % 71
                    (|div_DF| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)
                              (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)))
          %))) 

(DEFUN |DoubleFloat| ()
  (SPROG NIL
         (PROG (#1=#:G509)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|DoubleFloat|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|DoubleFloat|
                             (LIST (CONS NIL (CONS 1 (|DoubleFloat;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|DoubleFloat|)))))))))) 

(MAKEPROP '|DoubleFloat| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|format| (|String|)
              |DFLOAT;doubleFloatFormat;2S;1| (|Void|) (|OpenMathDevice|)
              (0 . |OMputObject|) (|DoubleFloat|) (5 . |OMputFloat|)
              (11 . |OMputEndObject|) (|Boolean|) |DFLOAT;OMwrite;Omd%BV;2|
              (|PositiveInteger|) |DFLOAT;base;Pi;4| (|Integer|)
              |DFLOAT;mantissa;%I;5| |DFLOAT;exponent;%I;6|
              |DFLOAT;precision;Pi;7| |DFLOAT;log2;2%;38| (16 . *)
              |DFLOAT;bits;Pi;8| |DFLOAT;max;%;9| |DFLOAT;min;%;10|
              |DFLOAT;order;%I;11|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |DFLOAT;Zero;%;12|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |DFLOAT;One;%;13|) %))
              |DFLOAT;exp1;%;14| |DFLOAT;pi;%;15| |DFLOAT;convert;%S;16|
              (22 . >=) (|OutputForm|) (28 . |message|) |DFLOAT;coerce;%Of;17|
              (33 . -) (|InputForm|) (38 . |convert|) |DFLOAT;convert;%If;18|
              |DFLOAT;<;2%B;19| |DFLOAT;-;2%;20| |DFLOAT;+;3%;21|
              |DFLOAT;-;3%;22| |DFLOAT;*;3%;23| |DFLOAT;*;I2%;24|
              |DFLOAT;max;3%;25| |DFLOAT;min;3%;26| |DFLOAT;=;2%B;27|
              |DFLOAT;/;%I%;28| |DFLOAT;sqrt;2%;29| |DFLOAT;qsqrt;2%;30|
              |DFLOAT;log10;2%;31| |DFLOAT;^;%I%;32| |DFLOAT;^;3%;33|
              |DFLOAT;coerce;I%;34| |DFLOAT;exp;2%;35| |DFLOAT;log;2%;36|
              |DFLOAT;qlog;2%;37| |DFLOAT;sin;2%;39| |DFLOAT;cos;2%;40|
              |DFLOAT;tan;2%;41| |DFLOAT;cot;2%;42| |DFLOAT;sec;2%;43|
              |DFLOAT;csc;2%;44| |DFLOAT;asin;2%;45| |DFLOAT;acos;2%;46|
              |DFLOAT;atan;2%;47| |DFLOAT;acsc;2%;48| '|pi_half|
              |DFLOAT;acot;2%;49| |DFLOAT;asec;2%;50| |DFLOAT;sinh;2%;51|
              |DFLOAT;cosh;2%;52| |DFLOAT;tanh;2%;53| |DFLOAT;csch;2%;54|
              |DFLOAT;coth;2%;55| |DFLOAT;sech;2%;56| |DFLOAT;asinh;2%;57|
              |DFLOAT;acosh;2%;58| |DFLOAT;atanh;2%;59| |DFLOAT;acsch;2%;60|
              |DFLOAT;acoth;2%;61| |DFLOAT;asech;2%;62| |DFLOAT;/;3%;63|
              |DFLOAT;negative?;%B;64| |DFLOAT;zero?;%B;65| (|HashState|)
              |DFLOAT;hashUpdate!;Hs%Hs;66| (|Union| % '"failed")
              |DFLOAT;recip;%U;67| |DFLOAT;differentiate;2%;68|
              (|DoubleFloatSpecialFunctions|) (43 . |besselI|)
              |DFLOAT;besselI;3%;69| (49 . |besselJ|) |DFLOAT;besselJ;3%;70|
              (55 . |besselK|) |DFLOAT;besselK;3%;71| (61 . |besselY|)
              |DFLOAT;besselY;3%;72| (|DoubleFloatSpecialFunctions2|)
              (67 . |Beta|) |DFLOAT;Beta;3%;73| (73 . |Gamma|)
              |DFLOAT;Gamma;2%;74| (78 . |airyAi|) |DFLOAT;airyAi;2%;75|
              (83 . |airyAiPrime|) |DFLOAT;airyAiPrime;2%;76| (88 . |airyBi|)
              |DFLOAT;airyBi;2%;77| (93 . |airyBiPrime|)
              |DFLOAT;airyBiPrime;2%;78| (|NonNegativeInteger|)
              (98 . |polygamma|) |DFLOAT;digamma;2%;79| (|Union| 19 '"failed")
              (104 . |retractIfCan|) |DFLOAT;polygamma;3%;80|
              (|FloatSpecialFunctions|) (109 . |lambertW|)
              |DFLOAT;lambertW;2%;81| (|DoubleFloatEllipticIntegrals|)
              (114 . |ellipticF|) |DFLOAT;ellipticF;3%;82| (120 . |ellipticK|)
              |DFLOAT;ellipticK;2%;83| (125 . |ellipticE|)
              |DFLOAT;ellipticE;3%;84| (131 . |ellipticE|)
              |DFLOAT;ellipticE;2%;85| (136 . |ellipticPi|)
              |DFLOAT;ellipticPi;4%;86| (|Float|) (143 . |bits|) (147 . |bits|)
              (152 . |convert|) (|FloatEllipticFunctions|) (157 . |jacobiSn|)
              (163 . |convert|) |DFLOAT;jacobiSn;3%;87| (168 . |jacobiCn|)
              |DFLOAT;jacobiCn;3%;88| (174 . |jacobiDn|)
              |DFLOAT;jacobiDn;3%;89| (180 . |weierstrassP|)
              |DFLOAT;weierstrassP;4%;90| (187 . |weierstrassPPrime|)
              |DFLOAT;weierstrassPPrime;4%;91| |DFLOAT;wholePart;%I;92|
              |DFLOAT;float;2IPi%;93| |DFLOAT;convert;2%;94| (194 . |convert|)
              |DFLOAT;convert;%F;95| (|Fraction| 19)
              |DFLOAT;rationalApproximation;%2NniF;107|
              |DFLOAT;rationalApproximation;%NniF;96| (199 . >)
              |DFLOAT;atan;3%;97| |DFLOAT;retract;%F;98|
              (|Union| 157 '"failed") |DFLOAT;retractIfCan;%U;99|
              |DFLOAT;retract;%I;100| |DFLOAT;retractIfCan;%U;101|
              |DFLOAT;sign;%I;102| |DFLOAT;sign;2%;103| |DFLOAT;abs;2%;104|
              |DFLOAT;conjugate;2%;105| (205 . |coerce|) (210 . /)
              (216 . |zero?|) (221 . |negative?|) (226 . |One|) (230 . =)
              (236 . |numer|) (241 . |denom|) |DFLOAT;^;%F%;108|
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|List| %) (|Record| (|:| |coef| 182) (|:| |generator| %))
              (|SparseUnivariatePolynomial| %) (|Union| 182 '"failed")
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 188 '"failed") (|Factored| %) (|Pattern| 136)
              (|PatternMatchResult| 136 %) (|SingleInteger|))
           '#(~= 246 |zero?| 252 |wilsonW| 257 |wholePart| 267 |whittakerW| 272
              |whittakerM| 279 |weierstrassZeta| 286 |weierstrassSigma| 293
              |weierstrassPPrime| 300 |weierstrassPInverse| 307 |weierstrassP|
              314 |weberE| 321 |unitStep| 327 |unitNormal| 332 |unitCanonical|
              337 |unit?| 342 |truncate| 347 |toString| 352 |tanh| 363 |tan|
              368 |subtractIfCan| 373 |struveL| 379 |struveH| 385
              |squareFreePart| 391 |squareFree| 396 |sqrt| 401 |smaller?| 406
              |sizeLess?| 412 |sinh| 418 |sin| 423 |sign| 428 |sech| 438 |sec|
              443 |sample| 448 |round| 452 |rightRecip| 457 |rightPower| 462
              |riemannZeta| 474 |retractIfCan| 479 |retract| 489 |rem| 499
              |recip| 505 |rationalApproximation| 510 |racahR| 523 |quo| 533
              |qsqrt| 539 |qlog| 544 |principalIdeal| 549 |prime?| 554
              |precision| 559 |positive?| 568 |polylog| 573 |polygamma| 579
              |plenaryPower| 585 |pi| 591 |patternMatch| 595 |order| 602
              |opposite?| 607 |one?| 613 |nthRoot| 618 |norm| 624 |negative?|
              629 |multiEuclidean| 634 |min| 640 |meixnerP| 650 |meixnerM| 658
              |meijerG| 666 |max| 675 |mantissa| 685 |lommelS2| 690 |lommelS1|
              697 |log2| 704 |log10| 709 |log| 714 |lerchPhi| 719 |legendreQ|
              726 |legendreP| 733 |leftRecip| 740 |leftPower| 745 |lcmCoef| 757
              |lcm| 763 |latex| 774 |lambertW| 779 |laguerreL| 784 |kummerU|
              791 |kummerM| 798 |krawtchoukK| 805 |kelvinKer| 813 |kelvinKei|
              819 |kelvinBer| 825 |kelvinBei| 831 |jacobiZeta| 837
              |jacobiTheta| 843 |jacobiSn| 849 |jacobiP| 855 |jacobiDn| 863
              |jacobiCn| 869 |inv| 875 |increasePrecision| 880
              |hypergeometricF| 885 |hermiteH| 892 |hashUpdate!| 898 |hash| 904
              |hankelH2| 909 |hankelH1| 915 |hahn_p| 921 |hahnS| 930 |hahnR|
              939 |hahnQ| 948 |gcdPolynomial| 957 |gcd| 963 |fractionPart| 974
              |floor| 979 |float| 984 |factor| 997 |extendedEuclidean| 1002
              |exquo| 1015 |expressIdealMember| 1021 |exponent| 1027 |exp1|
              1032 |exp| 1036 |euclideanSize| 1041 |ellipticPi| 1046
              |ellipticK| 1053 |ellipticF| 1058 |ellipticE| 1064
              |doubleFloatFormat| 1075 |divide| 1080 |diracDelta| 1086 |digits|
              1091 |digamma| 1100 |differentiate| 1105 |decreasePrecision| 1116
              |csch| 1121 |csc| 1126 |coth| 1131 |cot| 1136 |cosh| 1141 |cos|
              1146 |convert| 1151 |conjugate| 1176 |commutator| 1181 |coerce|
              1187 |charlierC| 1207 |characteristic| 1214 |ceiling| 1218 |bits|
              1223 |besselY| 1232 |besselK| 1238 |besselJ| 1244 |besselI| 1250
              |base| 1256 |atanh| 1260 |atan| 1265 |associator| 1276
              |associates?| 1283 |asinh| 1289 |asin| 1294 |asech| 1299 |asec|
              1304 |antiCommutator| 1309 |annihilate?| 1315 |angerJ| 1321
              |airyBiPrime| 1327 |airyBi| 1332 |airyAiPrime| 1337 |airyAi| 1342
              |acsch| 1347 |acsc| 1352 |acoth| 1357 |acot| 1362 |acosh| 1367
              |acos| 1372 |abs| 1377 ^ 1382 |Zero| 1412 |One| 1416 |OMwrite|
              1420 |Gamma| 1444 D 1455 |Beta| 1466 >= 1479 > 1485 = 1491 <=
              1497 < 1503 / 1509 - 1521 + 1532 * 1538)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|FloatingPointSystem&| |RealNumberSystem&| |Field&|
                |EuclideanDomain&| |UniqueFactorizationDomain&| NIL
                |GcdDomain&| NIL NIL NIL |DivisionRing&| |OrderedRing&|
                |Algebra&| |EntireRing&| |Algebra&| NIL |DifferentialRing&| NIL
                NIL |Rng&| |NonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                NIL |Module&| |Module&| |NonAssociativeRing&| NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL NIL NIL |AbelianGroup&| NIL NIL
                NIL NIL NIL |AbelianMonoid&| |NonAssociativeSemiRng&|
                |MagmaWithUnit&| NIL |OrderedSet&| |AbelianSemiGroup&| |Magma&|
                NIL NIL |SetCategory&| NIL NIL |RetractableTo&|
                |RetractableTo&| |TranscendentalFunctionCategory&| |Hashable&|
                NIL |BasicType&| NIL NIL NIL NIL NIL |PartialOrder&| NIL NIL
                NIL NIL |RadicalCategory&| NIL NIL NIL |OpenMath&|
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                NIL NIL)
             (CONS
              '#((|FloatingPointSystem|) (|RealNumberSystem|) (|Field|)
                 (|EuclideanDomain|) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|LeftOreRing|) (|CommutativeRing|) (|DivisionRing|)
                 (|OrderedRing|) (|Algebra| $$) (|EntireRing|) (|Algebra| 157)
                 (|CharacteristicZero|) (|DifferentialRing|) (|Ring|)
                 (|SemiRing|) (|Rng|) (|NonAssociativeAlgebra| $$)
                 (|NonAssociativeAlgebra| 157) (|SemiRng|) (|Module| $$)
                 (|Module| 157) (|NonAssociativeRing|) (|BiModule| $$ $$)
                 (|BiModule| 157 157) (|OrderedAbelianGroup|)
                 (|RightModule| $$) (|NonAssociativeRng|) (|LeftModule| $$)
                 (|LeftModule| 157) (|RightModule| 157)
                 (|OrderedCancellationAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianMonoid|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|OrderedAbelianSemiGroup|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|OrderedSet|) (|AbelianSemiGroup|) (|Magma|) (|Comparable|)
                 (|PatternMatchable| 136) (|SetCategory|) (|CommutativeStar|)
                 (|RealConstant|) (|RetractableTo| 19) (|RetractableTo| 157)
                 (|TranscendentalFunctionCategory|) (|Hashable|)
                 (|CoercibleTo| 35) (|BasicType|) (|unitsKnown|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|PartialOrder|) (|ConvertibleTo| 12)
                 (|ConvertibleTo| 136) (|CoercibleFrom| 19)
                 (|CoercibleFrom| 157) (|RadicalCategory|)
                 (|ConvertibleTo| 191) (|Approximate|) (|ConvertibleTo| 7)
                 (|OpenMath|) (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|SpecialFunctionCategory|)
                 (|ConvertibleTo| 39))
              (|makeByteWordVec2| 193
                                  '(1 10 9 0 11 2 10 9 0 12 13 1 10 9 0 14 2 0
                                    0 17 0 24 2 0 15 0 0 34 1 35 0 7 36 1 35 0
                                    0 38 1 39 0 12 40 2 94 12 12 12 95 2 94 12
                                    12 12 97 2 94 12 12 12 99 2 94 12 12 12 101
                                    2 103 12 12 12 104 1 103 12 12 106 1 103 12
                                    12 108 1 103 12 12 110 1 103 12 12 112 1
                                    103 12 12 114 2 103 12 116 12 117 1 12 119
                                    0 120 1 122 12 12 123 2 125 12 12 12 126 1
                                    125 12 12 128 2 125 12 12 12 130 1 125 12
                                    12 132 3 125 12 12 12 12 134 0 136 17 137 1
                                    136 17 17 138 1 12 136 0 139 2 140 136 136
                                    136 141 1 136 12 0 142 2 140 136 136 136
                                    144 2 140 136 136 136 146 3 140 136 136 136
                                    136 148 3 140 136 136 136 136 150 1 136 0
                                    12 155 2 0 15 0 0 160 1 157 0 19 171 2 157
                                    0 19 19 172 1 157 15 0 173 1 157 15 0 174 0
                                    157 0 175 2 157 15 0 0 176 1 157 19 0 177 1
                                    157 19 0 178 2 0 15 0 0 1 1 0 15 0 88 6 0 0
                                    0 0 0 0 0 0 1 1 0 19 0 152 3 0 0 0 0 0 1 3
                                    0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0
                                    0 0 0 0 151 3 0 0 0 0 0 1 3 0 0 0 0 0 149 2
                                    0 0 0 0 1 1 0 0 0 1 1 0 180 0 1 1 0 0 0 1 1
                                    0 15 0 1 1 0 0 0 1 1 0 7 0 1 2 0 7 0 116 1
                                    1 0 0 0 76 1 0 0 0 63 2 0 91 0 0 1 2 0 0 0
                                    0 1 2 0 0 0 0 1 1 0 0 0 1 1 0 190 0 1 1 0 0
                                    0 52 2 0 15 0 0 1 2 0 15 0 0 1 1 0 0 0 74 1
                                    0 0 0 61 1 0 19 0 167 1 0 0 0 168 1 0 0 0
                                    79 1 0 0 0 65 0 0 0 1 1 0 0 0 1 1 0 91 0 1
                                    2 0 0 0 17 1 2 0 0 0 116 1 1 0 0 0 1 1 0
                                    119 0 166 1 0 163 0 164 1 0 19 0 165 1 0
                                    157 0 162 2 0 0 0 0 1 1 0 91 0 92 2 0 157 0
                                    116 159 3 0 157 0 116 116 158 6 0 0 0 0 0 0
                                    0 0 1 2 0 0 0 0 1 1 0 0 0 53 1 0 0 0 60 1 0
                                    183 182 1 1 0 15 0 1 0 0 17 22 1 1 17 17 1
                                    1 0 15 0 1 2 0 0 0 0 1 2 0 0 0 0 121 2 0 0
                                    0 17 1 0 0 0 32 3 0 192 0 191 192 1 1 0 19
                                    0 28 2 0 15 0 0 1 1 0 15 0 1 2 0 0 0 19 1 1
                                    0 0 0 1 1 0 15 0 87 2 0 185 182 0 1 2 0 0 0
                                    0 49 0 2 0 27 4 0 0 0 0 0 0 1 4 0 0 0 0 0 0
                                    1 5 3 0 182 182 182 182 0 1 2 0 0 0 0 48 0
                                    2 0 26 1 0 19 0 20 3 0 0 0 0 0 1 3 0 0 0 0
                                    0 1 1 0 0 0 23 1 0 0 0 54 1 0 0 0 59 3 0 0
                                    0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 1 0 91
                                    0 1 2 0 0 0 17 1 2 0 0 0 116 1 2 0 181 0 0
                                    1 2 0 0 0 0 1 1 0 0 182 1 1 0 7 0 1 1 0 0 0
                                    124 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0
                                    1 4 0 0 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2
                                    0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0
                                    1 2 0 0 0 0 143 4 0 0 0 0 0 0 1 2 0 0 0 0
                                    147 2 0 0 0 0 145 1 0 0 0 1 1 1 17 19 1 3 3
                                    0 182 182 0 1 2 0 0 0 0 1 2 0 89 89 0 90 1
                                    0 193 0 1 2 0 0 0 0 1 2 0 0 0 0 1 5 0 0 0 0
                                    0 0 0 1 5 0 0 0 0 0 0 0 1 5 0 0 0 0 0 0 0 1
                                    5 0 0 0 0 0 0 0 1 2 0 184 184 184 1 2 0 0 0
                                    0 1 1 0 0 182 1 1 0 0 0 1 1 0 0 0 1 3 0 0
                                    19 19 17 153 2 0 0 19 19 1 1 0 190 0 1 2 0
                                    187 0 0 1 3 0 189 0 0 0 1 2 0 91 0 0 1 2 0
                                    185 182 0 1 1 0 19 0 21 0 0 0 31 1 0 0 0 58
                                    1 0 116 0 1 3 0 0 0 0 0 135 1 0 0 0 129 2 0
                                    0 0 0 127 1 0 0 0 133 2 0 0 0 0 131 1 0 7 7
                                    8 2 0 186 0 0 1 1 0 0 0 1 0 0 17 1 1 1 17
                                    17 1 1 0 0 0 118 2 0 0 0 116 1 1 0 0 0 93 1
                                    1 17 19 1 1 0 0 0 77 1 0 0 0 66 1 0 0 0 78
                                    1 0 0 0 64 1 0 0 0 75 1 0 0 0 62 1 0 136 0
                                    156 1 0 12 0 154 1 0 191 0 1 1 0 7 0 33 1 0
                                    39 0 41 1 0 0 0 170 2 0 0 0 0 1 1 0 35 0 37
                                    1 0 0 19 57 1 0 0 0 1 1 0 0 157 1 3 0 0 0 0
                                    0 1 0 0 116 1 1 0 0 0 1 0 0 17 25 1 1 17 17
                                    1 2 0 0 0 0 102 2 0 0 0 0 100 2 0 0 0 0 98
                                    2 0 0 0 0 96 0 0 17 18 1 0 0 0 82 1 0 0 0
                                    69 2 0 0 0 0 161 3 0 0 0 0 0 1 2 0 15 0 0 1
                                    1 0 0 0 80 1 0 0 0 67 1 0 0 0 85 1 0 0 0 73
                                    2 0 0 0 0 1 2 0 15 0 0 1 2 0 0 0 0 1 1 0 0
                                    0 115 1 0 0 0 113 1 0 0 0 111 1 0 0 0 109 1
                                    0 0 0 83 1 0 0 0 70 1 0 0 0 84 1 0 0 0 72 1
                                    0 0 0 81 1 0 0 0 68 1 0 0 0 169 2 0 0 0 17
                                    1 2 0 0 0 116 1 2 0 0 0 19 55 2 0 0 0 157
                                    179 2 0 0 0 0 56 0 0 0 29 0 0 0 30 1 0 7 0
                                    1 2 0 9 10 0 1 2 0 7 0 15 1 3 0 9 10 0 15
                                    16 1 0 0 0 107 2 0 0 0 0 1 2 0 0 0 116 1 1
                                    0 0 0 1 3 0 0 0 0 0 1 2 0 0 0 0 105 2 0 15
                                    0 0 34 2 0 15 0 0 160 2 0 15 0 0 50 2 0 15
                                    0 0 1 2 0 15 0 0 42 2 0 0 0 0 86 2 0 0 0 19
                                    51 1 0 0 0 43 2 0 0 0 0 45 2 0 0 0 0 44 2 0
                                    0 17 0 24 2 0 0 0 0 46 2 0 0 19 0 47 2 0 0
                                    116 0 1 2 0 0 157 0 1 2 0 0 0 157 1)))))
           '|lookupComplete|)) 
