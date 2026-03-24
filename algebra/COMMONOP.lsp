
(SDEFUN |COMMONOP;operator;SBo;1| ((|s| (|Symbol|)) (% (|BasicOperator|)))
        (SPROG ((#1=#:G6 NIL) (#2=#:G7 NIL) (#3=#:G8 NIL) (|op| NIL))
               (SEQ
                (EXIT
                 (SEQ (COND ((QREFELT % 6) (|COMMONOP;startUp| NIL %)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |op| NIL) (LETT #3# (QREFELT % 162)) G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |op| (CAR #3#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |op| |s| (QREFELT % 168))
                                 (PROGN
                                  (LETT #1#
                                        (PROGN
                                         (LETT #2#
                                               (SPADCALL |op| (QREFELT % 169)))
                                         (GO #4=#:G5)))
                                  (GO #5=#:G3))))))
                             (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                       #5# (EXIT #1#))
                      (EXIT (SPADCALL |s| (QREFELT % 43)))))
                #4# (EXIT #2#)))) 

(SDEFUN |COMMONOP;dpi| ((|l| (|List| (|OutputForm|))) (% (|OutputForm|)))
        (SPADCALL '|%pi| (QREFELT % 172))) 

(SDEFUN |COMMONOP;dfact| ((|x| (|OutputForm|)) (% (|OutputForm|)))
        (SPADCALL (SPADCALL '! (QREFELT % 172))
                  (COND ((ATOM |x|) |x|) ('T (SPADCALL |x| (QREFELT % 173))))
                  (QREFELT % 174))) 

(SDEFUN |COMMONOP;dquote| ((|l| (|List| (|OutputForm|))) (% (|OutputForm|)))
        (SPADCALL (SPADCALL (|SPADfirst| |l|) (QREFELT % 175)) (CDR |l|)
                  (QREFELT % 177))) 

(SDEFUN |COMMONOP;dgamma| ((|l| (|List| (|OutputForm|))) (% (|OutputForm|)))
        (SPADCALL (SPADCALL '|Gamma| (QREFELT % 172)) |l| (QREFELT % 177))) 

(SDEFUN |COMMONOP;dbeta| ((|l| (|List| (|OutputForm|))) (% (|OutputForm|)))
        (SPADCALL (SPADCALL '|Beta| (QREFELT % 172)) |l| (QREFELT % 177))) 

(SDEFUN |COMMONOP;dEllipticE2|
        ((|l| (|List| (|OutputForm|))) (% (|OutputForm|)))
        (SPADCALL (SPADCALL '|ellipticE| (QREFELT % 172)) |l| (QREFELT % 177))) 

(SDEFUN |COMMONOP;setDummyVar|
        ((|op| (|BasicOperator|)) (|n| (|NonNegativeInteger|))
         (% (|BasicOperator|)))
        (SPADCALL |op| '|%dummyVar| |n| (QREFELT % 179))) 

(SDEFUN |COMMONOP;dexp| ((|x| (|OutputForm|)) (% (|OutputForm|)))
        (SPROG ((|e| (|OutputForm|)))
               (SEQ (LETT |e| (SPADCALL '|%e| (QREFELT % 172)))
                    (EXIT
                     (COND
                      ((SPADCALL |x| (SPADCALL 1 (QREFELT % 180))
                                 (QREFELT % 181))
                       |e|)
                      ('T (SPADCALL |e| |x| (QREFELT % 182)))))))) 

(SDEFUN |COMMONOP;inputdefsum| ((|a| (|List| (|InputForm|))) (% (|InputForm|)))
        (SPROG ((|eq| #1=(|InputForm|)) (|seg| #1#))
               (SEQ
                (LETT |seg|
                      (SPADCALL
                       (LIST (SPADCALL 'SEGMENT (QREFELT % 184))
                             (SPADCALL |a| 4 (QREFELT % 187))
                             (SPADCALL |a| 5 (QREFELT % 187)))
                       (QREFELT % 188)))
                (LETT |eq|
                      (SPADCALL
                       (LIST (SPADCALL '|equation| (QREFELT % 184))
                             (SPADCALL |a| 2 (QREFELT % 187)) |seg|)
                       (QREFELT % 188)))
                (EXIT
                 (SPADCALL
                  (LIST (SPADCALL '|sum| (QREFELT % 184))
                        (SPADCALL |a| 1 (QREFELT % 187)) |eq|)
                  (QREFELT % 188)))))) 

(SDEFUN |COMMONOP;inputdefprod|
        ((|a| (|List| (|InputForm|))) (% (|InputForm|)))
        (SPROG ((|eq| #1=(|InputForm|)) (|seg| #1#))
               (SEQ
                (LETT |seg|
                      (SPADCALL
                       (LIST (SPADCALL 'SEGMENT (QREFELT % 184))
                             (SPADCALL |a| 4 (QREFELT % 187))
                             (SPADCALL |a| 5 (QREFELT % 187)))
                       (QREFELT % 188)))
                (LETT |eq|
                      (SPADCALL
                       (LIST (SPADCALL '|equation| (QREFELT % 184))
                             (SPADCALL |a| 2 (QREFELT % 187)) |seg|)
                       (QREFELT % 188)))
                (EXIT
                 (SPADCALL
                  (LIST (SPADCALL '|product| (QREFELT % 184))
                        (SPADCALL |a| 1 (QREFELT % 187)) |eq|)
                  (QREFELT % 188)))))) 

(SDEFUN |COMMONOP;startUp| ((|b| (|Boolean|)) (% (|Void|)))
        (SPROG
         ((#1=#:G95 NIL) (|op| NIL) (#2=#:G94 NIL) (#3=#:G93 NIL)
          (#4=#:G92 NIL) (#5=#:G91 NIL) (#6=#:G90 NIL) (#7=#:G89 NIL)
          (#8=#:G88 NIL) (#9=#:G87 NIL) (#10=#:G86 NIL) (#11=#:G85 NIL)
          (#12=#:G84 NIL) (#13=#:G83 NIL))
         (SEQ (SETELT % 6 |b|)
              (SPADCALL (QREFELT % 42) (ELT % 173) (QREFELT % 190))
              (SPADCALL (QREFELT % 41) (ELT % 191) (QREFELT % 193))
              (SPADCALL (QREFELT % 13) (CONS (|function| |COMMONOP;dpi|) %)
                        (QREFELT % 193))
              (SPADCALL (QREFELT % 15) (CONS (|function| |COMMONOP;dexp|) %)
                        (QREFELT % 190))
              (SPADCALL (QREFELT % 60) (CONS (|function| |COMMONOP;dbeta|) %)
                        (QREFELT % 193))
              (SPADCALL (QREFELT % 60) '|disp_name|
                        (SPADCALL '|Beta| (QREFELT % 172)) (QREFELT % 179))
              (SPADCALL (QREFELT % 58) (CONS (|function| |COMMONOP;dgamma|) %)
                        (QREFELT % 193))
              (SPADCALL (QREFELT % 58) '|disp_name|
                        (SPADCALL '|Gamma| (QREFELT % 172)) (QREFELT % 179))
              (SPADCALL (QREFELT % 99)
                        (CONS (|function| |COMMONOP;dEllipticE2|) %)
                        (QREFELT % 193))
              (SPADCALL (QREFELT % 130) (CONS (|function| |COMMONOP;dfact|) %)
                        (QREFELT % 190))
              (SPADCALL (QREFELT % 44) (CONS (|function| |COMMONOP;dquote|) %)
                        (QREFELT % 193))
              (SPADCALL (QREFELT % 131) (CONS #'|COMMONOP;startUp!0| %)
                        (QREFELT % 193))
              (SPADCALL (QREFELT % 132) (CONS #'|COMMONOP;startUp!1| %)
                        (QREFELT % 193))
              (SPADCALL (QREFELT % 133) (CONS #'|COMMONOP;startUp!2| %)
                        (QREFELT % 193))
              (SPADCALL (QREFELT % 134) (CONS #'|COMMONOP;startUp!3| %)
                        (QREFELT % 193))
              (SPADCALL (QREFELT % 136) (CONS #'|COMMONOP;startUp!4| %)
                        (QREFELT % 193))
              (SPADCALL (QREFELT % 127) (CONS #'|COMMONOP;startUp!5| %)
                        (QREFELT % 193))
              (SPADCALL (QREFELT % 42) (CONS #'|COMMONOP;startUp!6| %)
                        (QREFELT % 210))
              (SPADCALL (QREFELT % 133) (CONS #'|COMMONOP;startUp!7| %)
                        (QREFELT % 210))
              (SPADCALL (QREFELT % 12) (CONS #'|COMMONOP;startUp!8| %)
                        (QREFELT % 210))
              (SPADCALL (QREFELT % 135)
                        (CONS (|function| |COMMONOP;inputdefsum|) %)
                        (QREFELT % 210))
              (SPADCALL (QREFELT % 137)
                        (CONS (|function| |COMMONOP;inputdefprod|) %)
                        (QREFELT % 210))
              (SEQ (LETT |op| NIL) (LETT #13# (QREFELT % 151)) G190
                   (COND
                    ((OR (ATOM #13#) (PROGN (LETT |op| (CAR #13#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|%alg| (QREFELT % 217))))
                   (LETT #13# (CDR #13#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #12# (QREFELT % 152)) G190
                   (COND
                    ((OR (ATOM #12#) (PROGN (LETT |op| (CAR #12#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|rtrig| (QREFELT % 217))))
                   (LETT #12# (CDR #12#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #11# (QREFELT % 153)) G190
                   (COND
                    ((OR (ATOM #11#) (PROGN (LETT |op| (CAR #11#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|htrig| (QREFELT % 217))))
                   (LETT #11# (CDR #11#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #10# (QREFELT % 156)) G190
                   (COND
                    ((OR (ATOM #10#) (PROGN (LETT |op| (CAR #10#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|trig| (QREFELT % 217))))
                   (LETT #10# (CDR #10#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #9# (QREFELT % 157)) G190
                   (COND
                    ((OR (ATOM #9#) (PROGN (LETT |op| (CAR #9#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|elem| (QREFELT % 217))))
                   (LETT #9# (CDR #9#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #8# (QREFELT % 158)) G190
                   (COND
                    ((OR (ATOM #8#) (PROGN (LETT |op| (CAR #8#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|prim| (QREFELT % 217))))
                   (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #7# (QREFELT % 159)) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |op| (CAR #7#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|comb| (QREFELT % 217))))
                   (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #6# (QREFELT % 160)) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |op| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|special| (QREFELT % 217))))
                   (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #5# (QREFELT % 161)) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |op| (CAR #5#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|any| (QREFELT % 217))))
                   (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #4# (QREFELT % 163)) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |op| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|even| (QREFELT % 217))))
                   (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #3# (QREFELT % 164)) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |op| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|odd| (QREFELT % 217))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #2# (QREFELT % 165)) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |op| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (|COMMONOP;setDummyVar| |op| 1 %)))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #1# (QREFELT % 166)) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |op| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (|COMMONOP;setDummyVar| |op| 2 %)))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (SPADCALL (QREFELT % 42) '|linear| (QREFELT % 217))
              (EXIT (SPADCALL (QREFELT % 219)))))) 

(SDEFUN |COMMONOP;startUp!8| ((|z1| NIL) (% NIL))
        (SPADCALL
         (LIST (SPADCALL '^ (QREFELT % 206)) (SPADCALL |z1| (QREFELT % 211))
               (SPADCALL (|spadConstant| % 214) (SPADCALL |z1| (QREFELT % 215))
                         (QREFELT % 216)))
         (QREFELT % 188))) 

(SDEFUN |COMMONOP;startUp!7| ((|z1| NIL) (% NIL))
        (SPADCALL (SPADCALL (SPADCALL '^ (QREFELT % 206)) |z1| (QREFELT % 208))
                  (QREFELT % 188))) 

(SDEFUN |COMMONOP;startUp!6| ((|z1| NIL) (% NIL))
        (SPADCALL
         (SPADCALL (SPADCALL '|(| (QREFELT % 206))
                   (SPADCALL |z1| (SPADCALL '|)| (QREFELT % 206))
                             (QREFELT % 207))
                   (QREFELT % 208))
         (QREFELT % 188))) 

(SDEFUN |COMMONOP;startUp!5| ((|z1| NIL) (% NIL))
        (SPADCALL
         (SPADCALL (SPADCALL |z1| (QREFELT % 196))
                   (SPADCALL (SPADCALL '|d| (QREFELT % 172))
                             (SPADCALL |z1| (QREFELT % 197)) (QREFELT % 202))
                   (QREFELT % 203))
         (SPADCALL (QREFELT % 204)) (SPADCALL |z1| (QREFELT % 199))
         (QREFELT % 205))) 

(SDEFUN |COMMONOP;startUp!4| ((|z1| NIL) (% NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT % 196))
                  (SPADCALL |z1| (QREFELT % 197))
                  (SPADCALL |z1| (QREFELT % 199)) (QREFELT % 201))) 

(SDEFUN |COMMONOP;startUp!3| ((|z1| NIL) (% NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT % 196))
                  (SPADCALL |z1| (QREFELT % 197))
                  (SPADCALL |z1| (QREFELT % 199)) (QREFELT % 200))) 

(SDEFUN |COMMONOP;startUp!2| ((|z1| NIL) (% NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT % 196))
                  (SPADCALL |z1| (QREFELT % 197)) (QREFELT % 182))) 

(SDEFUN |COMMONOP;startUp!1| ((|z1| NIL) (% NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT % 196))
                  (SPADCALL |z1| (QREFELT % 197)) (QREFELT % 198))) 

(SDEFUN |COMMONOP;startUp!0| ((|z1| NIL) (% NIL))
        (SPADCALL (SPADCALL 'A (QREFELT % 172)) |z1| (QREFELT % 194))) 

(DECLAIM (NOTINLINE |CommonOperators;|)) 

(DEFUN |CommonOperators;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|CommonOperators|))
          (LETT % (GETREFV 220))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|CommonOperators| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6 'T)
          (QSETREFV % 11 (SPADCALL '|rootOf| 2 (QREFELT % 10)))
          (QSETREFV % 12 (SPADCALL '|nthRoot| 2 (QREFELT % 10)))
          (QSETREFV % 13 (SPADCALL '|pi| 0 (QREFELT % 10)))
          (QSETREFV % 14 (SPADCALL '|log| 1 (QREFELT % 10)))
          (QSETREFV % 15 (SPADCALL '|exp| 1 (QREFELT % 10)))
          (QSETREFV % 16 (SPADCALL '|abs| 1 (QREFELT % 10)))
          (QSETREFV % 17 (SPADCALL '|sin| 1 (QREFELT % 10)))
          (QSETREFV % 18 (SPADCALL '|cos| 1 (QREFELT % 10)))
          (QSETREFV % 19 (SPADCALL '|tan| 1 (QREFELT % 10)))
          (QSETREFV % 20 (SPADCALL '|cot| 1 (QREFELT % 10)))
          (QSETREFV % 21 (SPADCALL '|sec| 1 (QREFELT % 10)))
          (QSETREFV % 22 (SPADCALL '|csc| 1 (QREFELT % 10)))
          (QSETREFV % 23 (SPADCALL '|asin| 1 (QREFELT % 10)))
          (QSETREFV % 24 (SPADCALL '|acos| 1 (QREFELT % 10)))
          (QSETREFV % 25 (SPADCALL '|atan| 1 (QREFELT % 10)))
          (QSETREFV % 26 (SPADCALL '|acot| 1 (QREFELT % 10)))
          (QSETREFV % 27 (SPADCALL '|asec| 1 (QREFELT % 10)))
          (QSETREFV % 28 (SPADCALL '|acsc| 1 (QREFELT % 10)))
          (QSETREFV % 29 (SPADCALL '|sinh| 1 (QREFELT % 10)))
          (QSETREFV % 30 (SPADCALL '|cosh| 1 (QREFELT % 10)))
          (QSETREFV % 31 (SPADCALL '|tanh| 1 (QREFELT % 10)))
          (QSETREFV % 32 (SPADCALL '|coth| 1 (QREFELT % 10)))
          (QSETREFV % 33 (SPADCALL '|sech| 1 (QREFELT % 10)))
          (QSETREFV % 34 (SPADCALL '|csch| 1 (QREFELT % 10)))
          (QSETREFV % 35 (SPADCALL '|asinh| 1 (QREFELT % 10)))
          (QSETREFV % 36 (SPADCALL '|acosh| 1 (QREFELT % 10)))
          (QSETREFV % 37 (SPADCALL '|atanh| 1 (QREFELT % 10)))
          (QSETREFV % 38 (SPADCALL '|acoth| 1 (QREFELT % 10)))
          (QSETREFV % 39 (SPADCALL '|asech| 1 (QREFELT % 10)))
          (QSETREFV % 40 (SPADCALL '|acsch| 1 (QREFELT % 10)))
          (QSETREFV % 41 (SPADCALL '|%box| 1 (QREFELT % 10)))
          (QSETREFV % 42 (SPADCALL '|%paren| 1 (QREFELT % 10)))
          (QSETREFV % 44 (SPADCALL '|%quote| (QREFELT % 43)))
          (QSETREFV % 45 (SPADCALL '|%diff| 3 (QREFELT % 10)))
          (QSETREFV % 46 (SPADCALL '|Si| 1 (QREFELT % 10)))
          (QSETREFV % 47 (SPADCALL '|Ci| 1 (QREFELT % 10)))
          (QSETREFV % 48 (SPADCALL '|Shi| 1 (QREFELT % 10)))
          (QSETREFV % 49 (SPADCALL '|Chi| 1 (QREFELT % 10)))
          (QSETREFV % 50 (SPADCALL '|Ei| 1 (QREFELT % 10)))
          (QSETREFV % 51 (SPADCALL '|li| 1 (QREFELT % 10)))
          (QSETREFV % 52 (SPADCALL '|erf| 1 (QREFELT % 10)))
          (QSETREFV % 53 (SPADCALL '|erfi| 1 (QREFELT % 10)))
          (QSETREFV % 54 (SPADCALL '|dilog| 1 (QREFELT % 10)))
          (QSETREFV % 55 (SPADCALL '|fresnelS| 1 (QREFELT % 10)))
          (QSETREFV % 56 (SPADCALL '|fresnelC| 1 (QREFELT % 10)))
          (QSETREFV % 57 (SPADCALL '|Gamma| 1 (QREFELT % 10)))
          (QSETREFV % 58 (SPADCALL '|Gamma2| 2 (QREFELT % 10)))
          (QSETREFV % 59 (SPADCALL '|Beta| 2 (QREFELT % 10)))
          (QSETREFV % 60 (SPADCALL '|Beta3| 3 (QREFELT % 10)))
          (QSETREFV % 61 (SPADCALL '|digamma| 1 (QREFELT % 10)))
          (QSETREFV % 62 (SPADCALL '|polygamma| 2 (QREFELT % 10)))
          (QSETREFV % 63 (SPADCALL '|besselJ| 2 (QREFELT % 10)))
          (QSETREFV % 64 (SPADCALL '|besselY| 2 (QREFELT % 10)))
          (QSETREFV % 65 (SPADCALL '|besselI| 2 (QREFELT % 10)))
          (QSETREFV % 66 (SPADCALL '|besselK| 2 (QREFELT % 10)))
          (QSETREFV % 67 (SPADCALL '|airyAi| 1 (QREFELT % 10)))
          (QSETREFV % 68 (SPADCALL '|airyAiPrime| 1 (QREFELT % 10)))
          (QSETREFV % 69 (SPADCALL '|airyBi| 1 (QREFELT % 10)))
          (QSETREFV % 70 (SPADCALL '|airyBiPrime| 1 (QREFELT % 10)))
          (QSETREFV % 71 (SPADCALL '|lambertW| 1 (QREFELT % 10)))
          (QSETREFV % 72 (SPADCALL '|polylog| 2 (QREFELT % 10)))
          (QSETREFV % 73 (SPADCALL '|weierstrassP| 3 (QREFELT % 10)))
          (QSETREFV % 74 (SPADCALL '|weierstrassPPrime| 3 (QREFELT % 10)))
          (QSETREFV % 75 (SPADCALL '|weierstrassSigma| 3 (QREFELT % 10)))
          (QSETREFV % 76 (SPADCALL '|weierstrassZeta| 3 (QREFELT % 10)))
          (QSETREFV % 77 (SPADCALL '|hypergeometricF| (QREFELT % 43)))
          (QSETREFV % 78 (SPADCALL '|meijerG| (QREFELT % 43)))
          (QSETREFV % 79 (SPADCALL '|whittakerM| 3 (QREFELT % 10)))
          (QSETREFV % 80 (SPADCALL '|whittakerW| 3 (QREFELT % 10)))
          (QSETREFV % 81 (SPADCALL '|angerJ| 2 (QREFELT % 10)))
          (QSETREFV % 82 (SPADCALL '|weberE| 2 (QREFELT % 10)))
          (QSETREFV % 83 (SPADCALL '|struveH| 2 (QREFELT % 10)))
          (QSETREFV % 84 (SPADCALL '|struveL| 2 (QREFELT % 10)))
          (QSETREFV % 85 (SPADCALL '|hankelH1| 2 (QREFELT % 10)))
          (QSETREFV % 86 (SPADCALL '|hankelH2| 2 (QREFELT % 10)))
          (QSETREFV % 87 (SPADCALL '|lommelS1| 3 (QREFELT % 10)))
          (QSETREFV % 88 (SPADCALL '|lommelS2| 3 (QREFELT % 10)))
          (QSETREFV % 89 (SPADCALL '|kummerM| 3 (QREFELT % 10)))
          (QSETREFV % 90 (SPADCALL '|kummerU| 3 (QREFELT % 10)))
          (QSETREFV % 91 (SPADCALL '|legendreP| 3 (QREFELT % 10)))
          (QSETREFV % 92 (SPADCALL '|legendreQ| 3 (QREFELT % 10)))
          (QSETREFV % 93 (SPADCALL '|kelvinBei| 2 (QREFELT % 10)))
          (QSETREFV % 94 (SPADCALL '|kelvinBer| 2 (QREFELT % 10)))
          (QSETREFV % 95 (SPADCALL '|kelvinKei| 2 (QREFELT % 10)))
          (QSETREFV % 96 (SPADCALL '|kelvinKer| 2 (QREFELT % 10)))
          (QSETREFV % 97 (SPADCALL '|ellipticK| 1 (QREFELT % 10)))
          (QSETREFV % 98 (SPADCALL '|ellipticE| 1 (QREFELT % 10)))
          (QSETREFV % 99 (SPADCALL '|ellipticE2| 2 (QREFELT % 10)))
          (QSETREFV % 100 (SPADCALL '|ellipticF| 2 (QREFELT % 10)))
          (QSETREFV % 101 (SPADCALL '|ellipticPi| 3 (QREFELT % 10)))
          (QSETREFV % 102 (SPADCALL '|jacobiSn| 2 (QREFELT % 10)))
          (QSETREFV % 103 (SPADCALL '|jacobiCn| 2 (QREFELT % 10)))
          (QSETREFV % 104 (SPADCALL '|jacobiDn| 2 (QREFELT % 10)))
          (QSETREFV % 105 (SPADCALL '|jacobiZeta| 2 (QREFELT % 10)))
          (QSETREFV % 106 (SPADCALL '|jacobiTheta| 2 (QREFELT % 10)))
          (QSETREFV % 107 (SPADCALL '|weierstrassPInverse| 3 (QREFELT % 10)))
          (QSETREFV % 108 (SPADCALL '|lerchPhi| 3 (QREFELT % 10)))
          (QSETREFV % 109 (SPADCALL '|riemannZeta| 1 (QREFELT % 10)))
          (QSETREFV % 110 (SPADCALL '|charlierC| 3 (QREFELT % 10)))
          (QSETREFV % 111 (SPADCALL '|hahn_p| 5 (QREFELT % 10)))
          (QSETREFV % 112 (SPADCALL '|hahnQ| 5 (QREFELT % 10)))
          (QSETREFV % 113 (SPADCALL '|hahnR| 5 (QREFELT % 10)))
          (QSETREFV % 114 (SPADCALL '|hahnS| 5 (QREFELT % 10)))
          (QSETREFV % 115 (SPADCALL '|hermiteH| 2 (QREFELT % 10)))
          (QSETREFV % 116 (SPADCALL '|jacobiP| 4 (QREFELT % 10)))
          (QSETREFV % 117 (SPADCALL '|krawtchoukK| 4 (QREFELT % 10)))
          (QSETREFV % 118 (SPADCALL '|laguerreL| 3 (QREFELT % 10)))
          (QSETREFV % 119 (SPADCALL '|meixnerM| 4 (QREFELT % 10)))
          (QSETREFV % 120 (SPADCALL '|meixnerP| 4 (QREFELT % 10)))
          (QSETREFV % 121 (SPADCALL '|racahR| 6 (QREFELT % 10)))
          (QSETREFV % 122 (SPADCALL '|wilsonW| 6 (QREFELT % 10)))
          (QSETREFV % 123 (SPADCALL '|%logGamma| 1 (QREFELT % 10)))
          (QSETREFV % 124 (SPADCALL '|%eis| 1 (QREFELT % 10)))
          (QSETREFV % 125 (SPADCALL '|%erfs| 1 (QREFELT % 10)))
          (QSETREFV % 126 (SPADCALL '|%erfis| 1 (QREFELT % 10)))
          (QSETREFV % 127 (SPADCALL '|integral| 3 (QREFELT % 10)))
          (QSETREFV % 128 (SPADCALL '|%iint| (QREFELT % 43)))
          (QSETREFV % 129 (SPADCALL '|%defint| 5 (QREFELT % 10)))
          (QSETREFV % 130 (SPADCALL '|factorial| 1 (QREFELT % 10)))
          (QSETREFV % 131 (SPADCALL '|permutation| 2 (QREFELT % 10)))
          (QSETREFV % 132 (SPADCALL '|binomial| 2 (QREFELT % 10)))
          (QSETREFV % 133 (SPADCALL '|%power| 2 (QREFELT % 10)))
          (QSETREFV % 134 (SPADCALL '|summation| 3 (QREFELT % 10)))
          (QSETREFV % 135 (SPADCALL '|%defsum| 5 (QREFELT % 10)))
          (QSETREFV % 136 (SPADCALL '|product| 3 (QREFELT % 10)))
          (QSETREFV % 137 (SPADCALL '|%defprod| 5 (QREFELT % 10)))
          (QSETREFV % 138 (SPADCALL '|%root_sum| 3 (QREFELT % 10)))
          (QSETREFV % 139 (SPADCALL '|floor| 1 (QREFELT % 10)))
          (QSETREFV % 140 (SPADCALL '|ceil| 1 (QREFELT % 10)))
          (QSETREFV % 141 (SPADCALL '|fractionPart| 1 (QREFELT % 10)))
          (QSETREFV % 142 (SPADCALL '|real| 1 (QREFELT % 10)))
          (QSETREFV % 143 (SPADCALL '|imag| 1 (QREFELT % 10)))
          (QSETREFV % 144 (SPADCALL '|conjugate| 1 (QREFELT % 10)))
          (QSETREFV % 145 (SPADCALL '|arg| 1 (QREFELT % 10)))
          (QSETREFV % 146 (SPADCALL '|sign| 1 (QREFELT % 10)))
          (QSETREFV % 147 (SPADCALL '|unitStep| 1 (QREFELT % 10)))
          (QSETREFV % 148 (SPADCALL '|diracDelta| 1 (QREFELT % 10)))
          (QSETREFV % 149 (SPADCALL '|max| (QREFELT % 43)))
          (QSETREFV % 150 (SPADCALL '|min| (QREFELT % 43)))
          (QSETREFV % 151 (LIST (QREFELT % 12) (QREFELT % 11)))
          (QSETREFV % 152
                    (LIST (QREFELT % 17) (QREFELT % 18) (QREFELT % 19)
                          (QREFELT % 20) (QREFELT % 21) (QREFELT % 22)
                          (QREFELT % 23) (QREFELT % 24) (QREFELT % 25)
                          (QREFELT % 26) (QREFELT % 27) (QREFELT % 28)))
          (QSETREFV % 153
                    (LIST (QREFELT % 29) (QREFELT % 30) (QREFELT % 31)
                          (QREFELT % 32) (QREFELT % 33) (QREFELT % 34)
                          (QREFELT % 35) (QREFELT % 36) (QREFELT % 37)
                          (QREFELT % 38) (QREFELT % 39) (QREFELT % 40)))
          (QSETREFV % 156
                    (SPADCALL (QREFELT % 152) (QREFELT % 153) (QREFELT % 155)))
          (QSETREFV % 157
                    (SPADCALL (QREFELT % 156)
                              (LIST (QREFELT % 13) (QREFELT % 14)
                                    (QREFELT % 15))
                              (QREFELT % 155)))
          (QSETREFV % 158
                    (LIST (QREFELT % 50) (QREFELT % 51) (QREFELT % 46)
                          (QREFELT % 47) (QREFELT % 48) (QREFELT % 49)
                          (QREFELT % 52) (QREFELT % 53) (QREFELT % 54)
                          (QREFELT % 127) (QREFELT % 129) (QREFELT % 55)
                          (QREFELT % 56) (QREFELT % 128)))
          (QSETREFV % 159
                    (LIST (QREFELT % 130) (QREFELT % 131) (QREFELT % 132)
                          (QREFELT % 133) (QREFELT % 134) (QREFELT % 135)
                          (QREFELT % 136) (QREFELT % 137)))
          (QSETREFV % 160
                    (LIST (QREFELT % 57) (QREFELT % 58) (QREFELT % 59)
                          (QREFELT % 60) (QREFELT % 61) (QREFELT % 62)
                          (QREFELT % 139) (QREFELT % 140) (QREFELT % 142)
                          (QREFELT % 143) (QREFELT % 146) (QREFELT % 16)
                          (QREFELT % 149) (QREFELT % 150) (QREFELT % 141)
                          (QREFELT % 147) (QREFELT % 148) (QREFELT % 145)
                          (QREFELT % 144) (QREFELT % 123) (QREFELT % 124)
                          (QREFELT % 125) (QREFELT % 126) (QREFELT % 63)
                          (QREFELT % 64) (QREFELT % 65) (QREFELT % 66)
                          (QREFELT % 67) (QREFELT % 69) (QREFELT % 68)
                          (QREFELT % 70) (QREFELT % 71) (QREFELT % 72)
                          (QREFELT % 73) (QREFELT % 74) (QREFELT % 76)
                          (QREFELT % 75) (QREFELT % 77) (QREFELT % 78)
                          (QREFELT % 79) (QREFELT % 80) (QREFELT % 81)
                          (QREFELT % 82) (QREFELT % 83) (QREFELT % 84)
                          (QREFELT % 85) (QREFELT % 86) (QREFELT % 87)
                          (QREFELT % 88) (QREFELT % 89) (QREFELT % 90)
                          (QREFELT % 91) (QREFELT % 92) (QREFELT % 93)
                          (QREFELT % 94) (QREFELT % 95) (QREFELT % 96)
                          (QREFELT % 97) (QREFELT % 98) (QREFELT % 99)
                          (QREFELT % 100) (QREFELT % 101) (QREFELT % 102)
                          (QREFELT % 103) (QREFELT % 104) (QREFELT % 105)
                          (QREFELT % 106) (QREFELT % 108) (QREFELT % 109)
                          (QREFELT % 110) (QREFELT % 111) (QREFELT % 112)
                          (QREFELT % 113) (QREFELT % 114) (QREFELT % 115)
                          (QREFELT % 116) (QREFELT % 117) (QREFELT % 118)
                          (QREFELT % 119) (QREFELT % 120) (QREFELT % 121)
                          (QREFELT % 122) (QREFELT % 107)))
          (QSETREFV % 161
                    (LIST (QREFELT % 42) (QREFELT % 45) (QREFELT % 41)
                          (QREFELT % 44)))
          (QSETREFV % 162
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (QREFELT % 151) (QREFELT % 157)
                                  (QREFELT % 155))
                        (QREFELT % 158) (QREFELT % 155))
                       (QREFELT % 159) (QREFELT % 155))
                      (QREFELT % 160) (QREFELT % 155))
                     (QREFELT % 161) (QREFELT % 155)))
          (QSETREFV % 163
                    (LIST (QREFELT % 18) (QREFELT % 21) (QREFELT % 30)
                          (QREFELT % 33) (QREFELT % 16) (QREFELT % 148)))
          (QSETREFV % 164
                    (LIST (QREFELT % 17) (QREFELT % 22) (QREFELT % 19)
                          (QREFELT % 20) (QREFELT % 23) (QREFELT % 28)
                          (QREFELT % 25) (QREFELT % 29) (QREFELT % 34)
                          (QREFELT % 31) (QREFELT % 32) (QREFELT % 35)
                          (QREFELT % 40) (QREFELT % 37) (QREFELT % 38)
                          (QREFELT % 46) (QREFELT % 48) (QREFELT % 52)
                          (QREFELT % 53) (QREFELT % 55) (QREFELT % 56)
                          (QREFELT % 146) (QREFELT % 142) (QREFELT % 143)))
          (QSETREFV % 165
                    (LIST (QREFELT % 45) (QREFELT % 11) (QREFELT % 127)
                          (QREFELT % 138) (QREFELT % 134) (QREFELT % 136)))
          (QSETREFV % 166
                    (LIST (QREFELT % 129) (QREFELT % 135) (QREFELT % 137)))
          %))) 

(DEFUN |CommonOperators| ()
  (SPROG NIL
         (PROG (#1=#:G97)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|CommonOperators|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|CommonOperators|
                             (LIST (CONS NIL (CONS 1 (|CommonOperators;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|CommonOperators|)))))))))) 

(MAKEPROP '|CommonOperators| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|brandNew?| (|Symbol|)
              (|NonNegativeInteger|) (|BasicOperator|) (0 . |operator|)
              '|opalg| '|oproot| '|oppi| '|oplog| '|opexp| '|opabs| '|opsin|
              '|opcos| '|optan| '|opcot| '|opsec| '|opcsc| '|opasin| '|opacos|
              '|opatan| '|opacot| '|opasec| '|opacsc| '|opsinh| '|opcosh|
              '|optanh| '|opcoth| '|opsech| '|opcsch| '|opasinh| '|opacosh|
              '|opatanh| '|opacoth| '|opasech| '|opacsch| '|opbox| '|oppren|
              (6 . |operator|) '|opquote| '|opdiff| '|opsi| '|opci| '|opshi|
              '|opchi| '|opei| '|opli| '|operf| '|operfi| '|opli2| '|opfis|
              '|opfic| '|opGamma| '|opGamma2| '|opBeta| '|opBeta3| '|opdigamma|
              '|oppolygamma| '|opBesselJ| '|opBesselY| '|opBesselI|
              '|opBesselK| '|opAiryAi| '|opAiryAiPrime| '|opAiryBi|
              '|opAiryBiPrime| '|opLambertW| '|opPolylog| '|opWeierstrassP|
              '|opWeierstrassPPrime| '|opWeierstrassSigma| '|opWeierstrassZeta|
              '|opHypergeometricF| '|opMeijerG| '|opWhittakerM| '|opWhittakerW|
              '|opAngerJ| '|opWeberE| '|opStruveH| '|opStruveL| '|opHankelH1|
              '|opHankelH2| '|opLommelS1| '|opLommelS2| '|opKummerM|
              '|opKummerU| '|opLegendreP| '|opLegendreQ| '|opKelvinBei|
              '|opKelvinBer| '|opKelvinKei| '|opKelvinKer| '|opEllipticK|
              '|opEllipticE| '|opEllipticE2| '|opEllipticF| '|opEllipticPi|
              '|opJacobiSn| '|opJacobiCn| '|opJacobiDn| '|opJacobiZeta|
              '|opJacobiTheta| '|opWeierstrassPInverse| '|opLerchPhi|
              '|opRiemannZeta| '|opCharlierC| '|op_hahn_p| '|op_hahnQ|
              '|op_hahnR| '|op_hahnS| '|opHermiteH| '|opJacobiP|
              '|op_krawtchoukK| '|opLaguerreL| '|opMeixnerM| '|op_meixnerP|
              '|op_racahR| '|op_wilsonW| '|op_log_gamma| '|op_eis| '|op_erfs|
              '|op_erfis| '|opint| '|opiint| '|opdint| '|opfact| '|opperm|
              '|opbinom| '|oppow| '|opsum| '|opdsum| '|opprod| '|opdprod|
              '|oprootsum| '|opfloor| '|opceil| '|op_fractionPart| '|opreal|
              '|opimag| '|opconjugate| '|oparg| '|opsign| '|op_unitStep|
              '|op_diracDelta| '|opmax| '|opmin| '|algop| '|rtrigop| '|htrigop|
              (|List| 9) (11 . |concat|) '|trigop| '|elemop| '|primop|
              '|combop| '|specop| '|anyop| '|allop| '|evenop| '|oddop|
              '|dummyvarop1| '|dummyvarop2| (|Boolean|) (17 . |is?|)
              (23 . |copy|) |COMMONOP;operator;SBo;1| (|OutputForm|)
              (28 . |coerce|) (33 . |paren|) (38 . |postfix|) (44 . |quote|)
              (|List| %) (49 . |prefix|) (|None|) (55 . |setProperty|)
              (62 . |coerce|) (67 . =) (73 . ^) (|InputForm|) (79 . |convert|)
              (|Integer|) (|List| 183) (84 . |elt|) (90 . |convert|)
              (|Mapping| 171 171) (95 . |display|) (101 . |commaSeparate|)
              (|Mapping| 171 195) (106 . |display|) (112 . |supersub|)
              (|List| 171) (118 . |first|) (123 . |second|) (128 . |binomial|)
              (134 . |third|) (139 . |sum|) (146 . |prod|) (153 . |hconcat|)
              (159 . *) (165 . |empty|) (169 . |int|) (176 . |convert|)
              (181 . |concat|) (187 . |concat|) (|Mapping| 183 186)
              (193 . |input|) (199 . |first|) (204 . |One|) (208 . |One|)
              (212 . |One|) (216 . |second|) (221 . /) (227 . |assert|)
              (|Void|) (233 . |void|))
           '#(|operator| 237) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|operator| ((|BasicOperator|) (|Symbol|))) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 219
                                            '(2 9 0 7 8 10 1 9 0 7 43 2 154 0 0
                                              0 155 2 9 167 0 7 168 1 9 0 0 169
                                              1 7 171 0 172 1 171 0 0 173 2 171
                                              0 0 0 174 1 171 0 0 175 2 171 0 0
                                              176 177 3 9 0 0 7 178 179 1 8 171
                                              0 180 2 171 167 0 0 181 2 171 0 0
                                              0 182 1 183 0 7 184 2 186 183 0
                                              185 187 1 183 0 176 188 2 9 0 0
                                              189 190 1 171 0 176 191 2 9 0 0
                                              192 193 2 171 0 0 176 194 1 195
                                              171 0 196 1 195 171 0 197 2 171 0
                                              0 0 198 1 195 171 0 199 3 171 0 0
                                              0 0 200 3 171 0 0 0 0 201 2 171 0
                                              0 0 202 2 171 0 0 0 203 0 171 0
                                              204 3 171 0 0 0 0 205 1 7 183 0
                                              206 2 186 0 0 183 207 2 186 0 183
                                              0 208 2 9 0 0 209 210 1 186 183 0
                                              211 0 8 0 212 0 185 0 213 0 183 0
                                              214 1 186 183 0 215 2 183 0 0 0
                                              216 2 9 0 0 7 217 0 218 0 219 1 0
                                              9 7 170)))))
           '|lookupComplete|)) 
