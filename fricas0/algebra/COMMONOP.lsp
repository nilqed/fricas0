
(SDEFUN |COMMONOP;operator;SBo;1| ((|s| |Symbol|) ($ |BasicOperator|))
        (SPROG ((#1=#:G715 NIL) (#2=#:G716 NIL) (#3=#:G717 NIL) (|op| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL (QREFELT $ 9) (QREFELT $ 159))
                    (|COMMONOP;startUp| NIL $)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |op| NIL . #4=(|COMMONOP;operator;SBo;1|))
                         (LETT #3# (QREFELT $ 154) . #4#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |op| (CAR #3#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |op| |s| (QREFELT $ 160))
                             (PROGN
                              (LETT #1#
                                    (PROGN
                                     (LETT #2# (SPADCALL |op| (QREFELT $ 161))
                                           . #4#)
                                     (GO #5=#:G714))
                                    . #4#)
                              (GO #6=#:G712))))))
                         (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT (SPADCALL |s| (QREFELT $ 44)))))
                #5# (EXIT #2#)))) 

(SDEFUN |COMMONOP;dpi| ((|l| |List| (|OutputForm|)) ($ |OutputForm|))
        (SPADCALL '|%pi| (QREFELT $ 164))) 

(SDEFUN |COMMONOP;dfact| ((|x| |OutputForm|) ($ |OutputForm|))
        (SPADCALL (SPADCALL '! (QREFELT $ 164))
                  (COND ((ATOM |x|) |x|) ('T (SPADCALL |x| (QREFELT $ 165))))
                  (QREFELT $ 166))) 

(SDEFUN |COMMONOP;dquote| ((|l| |List| (|OutputForm|)) ($ |OutputForm|))
        (SPADCALL (SPADCALL (|SPADfirst| |l|) (QREFELT $ 167)) (CDR |l|)
                  (QREFELT $ 169))) 

(SDEFUN |COMMONOP;dgamma| ((|l| |List| (|OutputForm|)) ($ |OutputForm|))
        (SPADCALL (SPADCALL '|Gamma| (QREFELT $ 164)) |l| (QREFELT $ 169))) 

(SDEFUN |COMMONOP;dEllipticE2| ((|l| |List| (|OutputForm|)) ($ |OutputForm|))
        (SPADCALL (SPADCALL '|ellipticE| (QREFELT $ 164)) |l| (QREFELT $ 169))) 

(SDEFUN |COMMONOP;setDummyVar|
        ((|op| |BasicOperator|) (|n| |NonNegativeInteger|) ($ |BasicOperator|))
        (SPADCALL |op| '|%dummyVar| |n| (QREFELT $ 171))) 

(SDEFUN |COMMONOP;dexp| ((|x| |OutputForm|) ($ |OutputForm|))
        (SPROG ((|e| (|OutputForm|)))
               (SEQ (LETT |e| (SPADCALL '|%e| (QREFELT $ 164)) |COMMONOP;dexp|)
                    (EXIT
                     (COND
                      ((SPADCALL |x| (SPADCALL 1 (QREFELT $ 172))
                                 (QREFELT $ 173))
                       |e|)
                      ('T (SPADCALL |e| |x| (QREFELT $ 174)))))))) 

(SDEFUN |COMMONOP;startUp| ((|b| |Boolean|) ($ |Void|))
        (SPROG
         ((#1=#:G792 NIL) (|op| NIL) (#2=#:G791 NIL) (#3=#:G790 NIL)
          (#4=#:G789 NIL) (#5=#:G788 NIL) (#6=#:G787 NIL) (#7=#:G786 NIL)
          (#8=#:G785 NIL) (#9=#:G784 NIL) (#10=#:G783 NIL) (#11=#:G782 NIL)
          (#12=#:G781 NIL) (#13=#:G780 NIL))
         (SEQ (SPADCALL (QREFELT $ 9) |b| (QREFELT $ 175))
              (SPADCALL (QREFELT $ 46) (ELT $ 165) (QREFELT $ 177))
              (SPADCALL (QREFELT $ 45) (ELT $ 178) (QREFELT $ 180))
              (SPADCALL (QREFELT $ 16) (CONS (|function| |COMMONOP;dpi|) $)
                        (QREFELT $ 180))
              (SPADCALL (QREFELT $ 18) (CONS (|function| |COMMONOP;dexp|) $)
                        (QREFELT $ 177))
              (SPADCALL (QREFELT $ 61) (CONS (|function| |COMMONOP;dgamma|) $)
                        (QREFELT $ 180))
              (SPADCALL (QREFELT $ 101)
                        (CONS (|function| |COMMONOP;dEllipticE2|) $)
                        (QREFELT $ 180))
              (SPADCALL (QREFELT $ 124) (CONS (|function| |COMMONOP;dfact|) $)
                        (QREFELT $ 177))
              (SPADCALL (QREFELT $ 47) (CONS (|function| |COMMONOP;dquote|) $)
                        (QREFELT $ 180))
              (SPADCALL (QREFELT $ 125) (CONS #'|COMMONOP;startUp!0| $)
                        (QREFELT $ 180))
              (SPADCALL (QREFELT $ 126) (CONS #'|COMMONOP;startUp!1| $)
                        (QREFELT $ 180))
              (SPADCALL (QREFELT $ 127) (CONS #'|COMMONOP;startUp!2| $)
                        (QREFELT $ 180))
              (SPADCALL (QREFELT $ 128) (CONS #'|COMMONOP;startUp!3| $)
                        (QREFELT $ 180))
              (SPADCALL (QREFELT $ 130) (CONS #'|COMMONOP;startUp!4| $)
                        (QREFELT $ 180))
              (SPADCALL (QREFELT $ 121) (CONS #'|COMMONOP;startUp!5| $)
                        (QREFELT $ 180))
              (SPADCALL (QREFELT $ 46) (CONS #'|COMMONOP;startUp!6| $)
                        (QREFELT $ 200))
              (SPADCALL (QREFELT $ 127) (CONS #'|COMMONOP;startUp!7| $)
                        (QREFELT $ 200))
              (SPADCALL (QREFELT $ 15) (CONS #'|COMMONOP;startUp!8| $)
                        (QREFELT $ 200))
              (SEQ (LETT |op| NIL . #14=(|COMMONOP;startUp|))
                   (LETT #13# (QREFELT $ 143) . #14#) G190
                   (COND
                    ((OR (ATOM #13#) (PROGN (LETT |op| (CAR #13#) . #14#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|%alg| (QREFELT $ 208))))
                   (LETT #13# (CDR #13#) . #14#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL . #14#) (LETT #12# (QREFELT $ 144) . #14#)
                   G190
                   (COND
                    ((OR (ATOM #12#) (PROGN (LETT |op| (CAR #12#) . #14#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|rtrig| (QREFELT $ 208))))
                   (LETT #12# (CDR #12#) . #14#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL . #14#) (LETT #11# (QREFELT $ 145) . #14#)
                   G190
                   (COND
                    ((OR (ATOM #11#) (PROGN (LETT |op| (CAR #11#) . #14#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|htrig| (QREFELT $ 208))))
                   (LETT #11# (CDR #11#) . #14#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL . #14#) (LETT #10# (QREFELT $ 148) . #14#)
                   G190
                   (COND
                    ((OR (ATOM #10#) (PROGN (LETT |op| (CAR #10#) . #14#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|trig| (QREFELT $ 208))))
                   (LETT #10# (CDR #10#) . #14#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL . #14#) (LETT #9# (QREFELT $ 149) . #14#)
                   G190
                   (COND
                    ((OR (ATOM #9#) (PROGN (LETT |op| (CAR #9#) . #14#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|elem| (QREFELT $ 208))))
                   (LETT #9# (CDR #9#) . #14#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL . #14#) (LETT #8# (QREFELT $ 150) . #14#)
                   G190
                   (COND
                    ((OR (ATOM #8#) (PROGN (LETT |op| (CAR #8#) . #14#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|prim| (QREFELT $ 208))))
                   (LETT #8# (CDR #8#) . #14#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL . #14#) (LETT #7# (QREFELT $ 151) . #14#)
                   G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |op| (CAR #7#) . #14#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|comb| (QREFELT $ 208))))
                   (LETT #7# (CDR #7#) . #14#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL . #14#) (LETT #6# (QREFELT $ 152) . #14#)
                   G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |op| (CAR #6#) . #14#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|special| (QREFELT $ 208))))
                   (LETT #6# (CDR #6#) . #14#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL . #14#) (LETT #5# (QREFELT $ 153) . #14#)
                   G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |op| (CAR #5#) . #14#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|any| (QREFELT $ 208))))
                   (LETT #5# (CDR #5#) . #14#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL . #14#) (LETT #4# (QREFELT $ 155) . #14#)
                   G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |op| (CAR #4#) . #14#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|even| (QREFELT $ 208))))
                   (LETT #4# (CDR #4#) . #14#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL . #14#) (LETT #3# (QREFELT $ 156) . #14#)
                   G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |op| (CAR #3#) . #14#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|odd| (QREFELT $ 208))))
                   (LETT #3# (CDR #3#) . #14#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL . #14#) (LETT #2# (QREFELT $ 157) . #14#)
                   G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |op| (CAR #2#) . #14#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (|COMMONOP;setDummyVar| |op| 1 $)))
                   (LETT #2# (CDR #2#) . #14#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL . #14#) (LETT #1# (QREFELT $ 158) . #14#)
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |op| (CAR #1#) . #14#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (|COMMONOP;setDummyVar| |op| 2 $)))
                   (LETT #1# (CDR #1#) . #14#) (GO G190) G191 (EXIT NIL))
              (SPADCALL (QREFELT $ 46) '|linear| (QREFELT $ 208))
              (EXIT (SPADCALL (QREFELT $ 210)))))) 

(SDEFUN |COMMONOP;startUp!8| ((|z1| NIL) ($ NIL))
        (SPADCALL
         (LIST (SPADCALL '^ (QREFELT $ 194)) (SPADCALL |z1| (QREFELT $ 201))
               (SPADCALL (|spadConstant| $ 205) (SPADCALL |z1| (QREFELT $ 206))
                         (QREFELT $ 207)))
         (QREFELT $ 198))) 

(SDEFUN |COMMONOP;startUp!7| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL (SPADCALL '^ (QREFELT $ 194)) |z1| (QREFELT $ 197))
                  (QREFELT $ 198))) 

(SDEFUN |COMMONOP;startUp!6| ((|z1| NIL) ($ NIL))
        (SPADCALL
         (SPADCALL (SPADCALL '|(| (QREFELT $ 194))
                   (SPADCALL |z1| (SPADCALL '|)| (QREFELT $ 194))
                             (QREFELT $ 196))
                   (QREFELT $ 197))
         (QREFELT $ 198))) 

(SDEFUN |COMMONOP;startUp!5| ((|z1| NIL) ($ NIL))
        (SPADCALL
         (SPADCALL (SPADCALL |z1| (QREFELT $ 183))
                   (SPADCALL (SPADCALL '|d| (QREFELT $ 164))
                             (SPADCALL |z1| (QREFELT $ 184)) (QREFELT $ 189))
                   (QREFELT $ 190))
         (SPADCALL (QREFELT $ 191)) (SPADCALL |z1| (QREFELT $ 186))
         (QREFELT $ 192))) 

(SDEFUN |COMMONOP;startUp!4| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 183))
                  (SPADCALL |z1| (QREFELT $ 184))
                  (SPADCALL |z1| (QREFELT $ 186)) (QREFELT $ 188))) 

(SDEFUN |COMMONOP;startUp!3| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 183))
                  (SPADCALL |z1| (QREFELT $ 184))
                  (SPADCALL |z1| (QREFELT $ 186)) (QREFELT $ 187))) 

(SDEFUN |COMMONOP;startUp!2| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 183))
                  (SPADCALL |z1| (QREFELT $ 184)) (QREFELT $ 174))) 

(SDEFUN |COMMONOP;startUp!1| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 183))
                  (SPADCALL |z1| (QREFELT $ 184)) (QREFELT $ 185))) 

(SDEFUN |COMMONOP;startUp!0| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL 'A (QREFELT $ 164)) |z1| (QREFELT $ 181))) 

(DECLAIM (NOTINLINE |CommonOperators;|)) 

(DEFUN |CommonOperators| ()
  (SPROG NIL
         (PROG (#1=#:G794)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|CommonOperators|)
                    . #2=(|CommonOperators|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|CommonOperators|
                             (LIST (CONS NIL (CONS 1 (|CommonOperators;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|CommonOperators|)))))))))) 

(DEFUN |CommonOperators;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|CommonOperators|) . #1=(|CommonOperators|))
          (LETT $ (GETREFV 211) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|CommonOperators| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9 (SPADCALL 'T (QREFELT $ 8)))
          (QSETREFV $ 14 (SPADCALL '|rootOf| 2 (QREFELT $ 13)))
          (QSETREFV $ 15 (SPADCALL '|nthRoot| 2 (QREFELT $ 13)))
          (QSETREFV $ 16 (SPADCALL '|pi| 0 (QREFELT $ 13)))
          (QSETREFV $ 17 (SPADCALL '|log| 1 (QREFELT $ 13)))
          (QSETREFV $ 18 (SPADCALL '|exp| 1 (QREFELT $ 13)))
          (QSETREFV $ 19 (SPADCALL '|abs| 1 (QREFELT $ 13)))
          (QSETREFV $ 20 (SPADCALL '|sin| 1 (QREFELT $ 13)))
          (QSETREFV $ 21 (SPADCALL '|cos| 1 (QREFELT $ 13)))
          (QSETREFV $ 22 (SPADCALL '|tan| 1 (QREFELT $ 13)))
          (QSETREFV $ 23 (SPADCALL '|cot| 1 (QREFELT $ 13)))
          (QSETREFV $ 24 (SPADCALL '|sec| 1 (QREFELT $ 13)))
          (QSETREFV $ 25 (SPADCALL '|csc| 1 (QREFELT $ 13)))
          (QSETREFV $ 26 (SPADCALL '|asin| 1 (QREFELT $ 13)))
          (QSETREFV $ 27 (SPADCALL '|acos| 1 (QREFELT $ 13)))
          (QSETREFV $ 28 (SPADCALL '|atan| 1 (QREFELT $ 13)))
          (QSETREFV $ 29 (SPADCALL '|acot| 1 (QREFELT $ 13)))
          (QSETREFV $ 30 (SPADCALL '|asec| 1 (QREFELT $ 13)))
          (QSETREFV $ 31 (SPADCALL '|acsc| 1 (QREFELT $ 13)))
          (QSETREFV $ 32 (SPADCALL '|sinh| 1 (QREFELT $ 13)))
          (QSETREFV $ 33 (SPADCALL '|cosh| 1 (QREFELT $ 13)))
          (QSETREFV $ 34 (SPADCALL '|tanh| 1 (QREFELT $ 13)))
          (QSETREFV $ 35 (SPADCALL '|coth| 1 (QREFELT $ 13)))
          (QSETREFV $ 36 (SPADCALL '|sech| 1 (QREFELT $ 13)))
          (QSETREFV $ 37 (SPADCALL '|csch| 1 (QREFELT $ 13)))
          (QSETREFV $ 38 (SPADCALL '|asinh| 1 (QREFELT $ 13)))
          (QSETREFV $ 39 (SPADCALL '|acosh| 1 (QREFELT $ 13)))
          (QSETREFV $ 40 (SPADCALL '|atanh| 1 (QREFELT $ 13)))
          (QSETREFV $ 41 (SPADCALL '|acoth| 1 (QREFELT $ 13)))
          (QSETREFV $ 42 (SPADCALL '|asech| 1 (QREFELT $ 13)))
          (QSETREFV $ 43 (SPADCALL '|acsch| 1 (QREFELT $ 13)))
          (QSETREFV $ 45 (SPADCALL '|%box| (QREFELT $ 44)))
          (QSETREFV $ 46 (SPADCALL '|%paren| (QREFELT $ 44)))
          (QSETREFV $ 47 (SPADCALL '|%quote| (QREFELT $ 44)))
          (QSETREFV $ 48 (SPADCALL '|%diff| 3 (QREFELT $ 13)))
          (QSETREFV $ 49 (SPADCALL '|Si| 1 (QREFELT $ 13)))
          (QSETREFV $ 50 (SPADCALL '|Ci| 1 (QREFELT $ 13)))
          (QSETREFV $ 51 (SPADCALL '|Shi| 1 (QREFELT $ 13)))
          (QSETREFV $ 52 (SPADCALL '|Chi| 1 (QREFELT $ 13)))
          (QSETREFV $ 53 (SPADCALL '|Ei| 1 (QREFELT $ 13)))
          (QSETREFV $ 54 (SPADCALL '|li| 1 (QREFELT $ 13)))
          (QSETREFV $ 55 (SPADCALL '|erf| 1 (QREFELT $ 13)))
          (QSETREFV $ 56 (SPADCALL '|erfi| 1 (QREFELT $ 13)))
          (QSETREFV $ 57 (SPADCALL '|dilog| 1 (QREFELT $ 13)))
          (QSETREFV $ 58 (SPADCALL '|fresnelS| 1 (QREFELT $ 13)))
          (QSETREFV $ 59 (SPADCALL '|fresnelC| 1 (QREFELT $ 13)))
          (QSETREFV $ 60 (SPADCALL '|Gamma| 1 (QREFELT $ 13)))
          (QSETREFV $ 61 (SPADCALL '|Gamma2| 2 (QREFELT $ 13)))
          (QSETREFV $ 62 (SPADCALL '|Beta| 2 (QREFELT $ 13)))
          (QSETREFV $ 63 (SPADCALL '|digamma| 1 (QREFELT $ 13)))
          (QSETREFV $ 64 (SPADCALL '|polygamma| 2 (QREFELT $ 13)))
          (QSETREFV $ 65 (SPADCALL '|besselJ| 2 (QREFELT $ 13)))
          (QSETREFV $ 66 (SPADCALL '|besselY| 2 (QREFELT $ 13)))
          (QSETREFV $ 67 (SPADCALL '|besselI| 2 (QREFELT $ 13)))
          (QSETREFV $ 68 (SPADCALL '|besselK| 2 (QREFELT $ 13)))
          (QSETREFV $ 69 (SPADCALL '|airyAi| 1 (QREFELT $ 13)))
          (QSETREFV $ 70 (SPADCALL '|airyAiPrime| 1 (QREFELT $ 13)))
          (QSETREFV $ 71 (SPADCALL '|airyBi| 1 (QREFELT $ 13)))
          (QSETREFV $ 72 (SPADCALL '|airyBiPrime| 1 (QREFELT $ 13)))
          (QSETREFV $ 73 (SPADCALL '|lambertW| 1 (QREFELT $ 13)))
          (QSETREFV $ 74 (SPADCALL '|polylog| 2 (QREFELT $ 13)))
          (QSETREFV $ 75 (SPADCALL '|weierstrassP| 3 (QREFELT $ 13)))
          (QSETREFV $ 76 (SPADCALL '|weierstrassPPrime| 3 (QREFELT $ 13)))
          (QSETREFV $ 77 (SPADCALL '|weierstrassSigma| 3 (QREFELT $ 13)))
          (QSETREFV $ 78 (SPADCALL '|weierstrassZeta| 3 (QREFELT $ 13)))
          (QSETREFV $ 79 (SPADCALL '|hypergeometricF| (QREFELT $ 44)))
          (QSETREFV $ 80 (SPADCALL '|meijerG| (QREFELT $ 44)))
          (QSETREFV $ 81 (SPADCALL '|whittakerM| 3 (QREFELT $ 13)))
          (QSETREFV $ 82 (SPADCALL '|whittakerW| 3 (QREFELT $ 13)))
          (QSETREFV $ 83 (SPADCALL '|angerJ| 2 (QREFELT $ 13)))
          (QSETREFV $ 84 (SPADCALL '|weberE| 2 (QREFELT $ 13)))
          (QSETREFV $ 85 (SPADCALL '|struveH| 2 (QREFELT $ 13)))
          (QSETREFV $ 86 (SPADCALL '|struveL| 2 (QREFELT $ 13)))
          (QSETREFV $ 87 (SPADCALL '|hankelH1| 2 (QREFELT $ 13)))
          (QSETREFV $ 88 (SPADCALL '|hankelH2| 2 (QREFELT $ 13)))
          (QSETREFV $ 89 (SPADCALL '|lommelS1| 3 (QREFELT $ 13)))
          (QSETREFV $ 90 (SPADCALL '|lommelS2| 3 (QREFELT $ 13)))
          (QSETREFV $ 91 (SPADCALL '|kummerM| 3 (QREFELT $ 13)))
          (QSETREFV $ 92 (SPADCALL '|kummerU| 3 (QREFELT $ 13)))
          (QSETREFV $ 93 (SPADCALL '|legendreP| 3 (QREFELT $ 13)))
          (QSETREFV $ 94 (SPADCALL '|legendreQ| 3 (QREFELT $ 13)))
          (QSETREFV $ 95 (SPADCALL '|kelvinBei| 2 (QREFELT $ 13)))
          (QSETREFV $ 96 (SPADCALL '|kelvinBer| 2 (QREFELT $ 13)))
          (QSETREFV $ 97 (SPADCALL '|kelvinKei| 2 (QREFELT $ 13)))
          (QSETREFV $ 98 (SPADCALL '|kelvinKer| 2 (QREFELT $ 13)))
          (QSETREFV $ 99 (SPADCALL '|ellipticK| 1 (QREFELT $ 13)))
          (QSETREFV $ 100 (SPADCALL '|ellipticE| 1 (QREFELT $ 13)))
          (QSETREFV $ 101 (SPADCALL '|ellipticE2| 2 (QREFELT $ 13)))
          (QSETREFV $ 102 (SPADCALL '|ellipticF| 2 (QREFELT $ 13)))
          (QSETREFV $ 103 (SPADCALL '|ellipticPi| 3 (QREFELT $ 13)))
          (QSETREFV $ 104 (SPADCALL '|jacobiSn| 2 (QREFELT $ 13)))
          (QSETREFV $ 105 (SPADCALL '|jacobiCn| 2 (QREFELT $ 13)))
          (QSETREFV $ 106 (SPADCALL '|jacobiDn| 2 (QREFELT $ 13)))
          (QSETREFV $ 107 (SPADCALL '|jacobiZeta| 2 (QREFELT $ 13)))
          (QSETREFV $ 108 (SPADCALL '|jacobiTheta| 2 (QREFELT $ 13)))
          (QSETREFV $ 109 (SPADCALL '|weierstrassPInverse| 3 (QREFELT $ 13)))
          (QSETREFV $ 110 (SPADCALL '|lerchPhi| 3 (QREFELT $ 13)))
          (QSETREFV $ 111 (SPADCALL '|riemannZeta| 1 (QREFELT $ 13)))
          (QSETREFV $ 112 (SPADCALL '|charlierC| 3 (QREFELT $ 13)))
          (QSETREFV $ 113 (SPADCALL '|hermiteH| 2 (QREFELT $ 13)))
          (QSETREFV $ 114 (SPADCALL '|jacobiP| 4 (QREFELT $ 13)))
          (QSETREFV $ 115 (SPADCALL '|laguerreL| 3 (QREFELT $ 13)))
          (QSETREFV $ 116 (SPADCALL '|meixnerM| 4 (QREFELT $ 13)))
          (QSETREFV $ 117 (SPADCALL '|%logGamma| 1 (QREFELT $ 13)))
          (QSETREFV $ 118 (SPADCALL '|%eis| 1 (QREFELT $ 13)))
          (QSETREFV $ 119 (SPADCALL '|%erfs| 1 (QREFELT $ 13)))
          (QSETREFV $ 120 (SPADCALL '|%erfis| 1 (QREFELT $ 13)))
          (QSETREFV $ 121 (SPADCALL '|integral| 3 (QREFELT $ 13)))
          (QSETREFV $ 122 (SPADCALL '|%iint| (QREFELT $ 44)))
          (QSETREFV $ 123 (SPADCALL '|%defint| 5 (QREFELT $ 13)))
          (QSETREFV $ 124 (SPADCALL '|factorial| 1 (QREFELT $ 13)))
          (QSETREFV $ 125 (SPADCALL '|permutation| 2 (QREFELT $ 13)))
          (QSETREFV $ 126 (SPADCALL '|binomial| 2 (QREFELT $ 13)))
          (QSETREFV $ 127 (SPADCALL '|%power| 2 (QREFELT $ 13)))
          (QSETREFV $ 128 (SPADCALL '|summation| 3 (QREFELT $ 13)))
          (QSETREFV $ 129 (SPADCALL '|%defsum| 5 (QREFELT $ 13)))
          (QSETREFV $ 130 (SPADCALL '|product| 3 (QREFELT $ 13)))
          (QSETREFV $ 131 (SPADCALL '|%defprod| 5 (QREFELT $ 13)))
          (QSETREFV $ 132 (SPADCALL '|%root_sum| 3 (QREFELT $ 13)))
          (QSETREFV $ 133 (SPADCALL '|floor| 1 (QREFELT $ 13)))
          (QSETREFV $ 134 (SPADCALL '|ceil| 1 (QREFELT $ 13)))
          (QSETREFV $ 135 (SPADCALL '|real| 1 (QREFELT $ 13)))
          (QSETREFV $ 136 (SPADCALL '|imag| 1 (QREFELT $ 13)))
          (QSETREFV $ 137 (SPADCALL '|conjugate| 1 (QREFELT $ 13)))
          (QSETREFV $ 138 (SPADCALL '|arg| 1 (QREFELT $ 13)))
          (QSETREFV $ 139 (SPADCALL '|sign| 1 (QREFELT $ 13)))
          (QSETREFV $ 140 (SPADCALL '|diracDelta| 1 (QREFELT $ 13)))
          (QSETREFV $ 141 (SPADCALL '|max| (QREFELT $ 44)))
          (QSETREFV $ 142 (SPADCALL '|min| (QREFELT $ 44)))
          (QSETREFV $ 143 (LIST (QREFELT $ 15) (QREFELT $ 14)))
          (QSETREFV $ 144
                    (LIST (QREFELT $ 20) (QREFELT $ 21) (QREFELT $ 22)
                          (QREFELT $ 23) (QREFELT $ 24) (QREFELT $ 25)
                          (QREFELT $ 26) (QREFELT $ 27) (QREFELT $ 28)
                          (QREFELT $ 29) (QREFELT $ 30) (QREFELT $ 31)))
          (QSETREFV $ 145
                    (LIST (QREFELT $ 32) (QREFELT $ 33) (QREFELT $ 34)
                          (QREFELT $ 35) (QREFELT $ 36) (QREFELT $ 37)
                          (QREFELT $ 38) (QREFELT $ 39) (QREFELT $ 40)
                          (QREFELT $ 41) (QREFELT $ 42) (QREFELT $ 43)))
          (QSETREFV $ 148
                    (SPADCALL (QREFELT $ 144) (QREFELT $ 145) (QREFELT $ 147)))
          (QSETREFV $ 149
                    (SPADCALL (QREFELT $ 148)
                              (LIST (QREFELT $ 16) (QREFELT $ 17)
                                    (QREFELT $ 18))
                              (QREFELT $ 147)))
          (QSETREFV $ 150
                    (LIST (QREFELT $ 53) (QREFELT $ 54) (QREFELT $ 49)
                          (QREFELT $ 50) (QREFELT $ 51) (QREFELT $ 52)
                          (QREFELT $ 55) (QREFELT $ 56) (QREFELT $ 57)
                          (QREFELT $ 121) (QREFELT $ 123) (QREFELT $ 58)
                          (QREFELT $ 59) (QREFELT $ 122)))
          (QSETREFV $ 151
                    (LIST (QREFELT $ 124) (QREFELT $ 125) (QREFELT $ 126)
                          (QREFELT $ 127) (QREFELT $ 128) (QREFELT $ 129)
                          (QREFELT $ 130) (QREFELT $ 131)))
          (QSETREFV $ 152
                    (LIST (QREFELT $ 60) (QREFELT $ 61) (QREFELT $ 62)
                          (QREFELT $ 63) (QREFELT $ 64) (QREFELT $ 19)
                          (QREFELT $ 133) (QREFELT $ 134) (QREFELT $ 135)
                          (QREFELT $ 136) (QREFELT $ 139) (QREFELT $ 141)
                          (QREFELT $ 142) (QREFELT $ 140) (QREFELT $ 138)
                          (QREFELT $ 137) (QREFELT $ 117) (QREFELT $ 118)
                          (QREFELT $ 119) (QREFELT $ 120) (QREFELT $ 65)
                          (QREFELT $ 66) (QREFELT $ 67) (QREFELT $ 68)
                          (QREFELT $ 69) (QREFELT $ 71) (QREFELT $ 70)
                          (QREFELT $ 72) (QREFELT $ 73) (QREFELT $ 74)
                          (QREFELT $ 75) (QREFELT $ 76) (QREFELT $ 78)
                          (QREFELT $ 77) (QREFELT $ 79) (QREFELT $ 80)
                          (QREFELT $ 81) (QREFELT $ 82) (QREFELT $ 83)
                          (QREFELT $ 84) (QREFELT $ 85) (QREFELT $ 86)
                          (QREFELT $ 87) (QREFELT $ 88) (QREFELT $ 89)
                          (QREFELT $ 90) (QREFELT $ 91) (QREFELT $ 92)
                          (QREFELT $ 93) (QREFELT $ 94) (QREFELT $ 95)
                          (QREFELT $ 96) (QREFELT $ 97) (QREFELT $ 98)
                          (QREFELT $ 99) (QREFELT $ 100) (QREFELT $ 101)
                          (QREFELT $ 102) (QREFELT $ 103) (QREFELT $ 104)
                          (QREFELT $ 105) (QREFELT $ 106) (QREFELT $ 107)
                          (QREFELT $ 108) (QREFELT $ 110) (QREFELT $ 111)
                          (QREFELT $ 112) (QREFELT $ 113) (QREFELT $ 114)
                          (QREFELT $ 115) (QREFELT $ 116)))
          (QSETREFV $ 153
                    (LIST (QREFELT $ 46) (QREFELT $ 48) (QREFELT $ 45)
                          (QREFELT $ 47)))
          (QSETREFV $ 154
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (QREFELT $ 143) (QREFELT $ 149)
                                  (QREFELT $ 147))
                        (QREFELT $ 150) (QREFELT $ 147))
                       (QREFELT $ 151) (QREFELT $ 147))
                      (QREFELT $ 152) (QREFELT $ 147))
                     (QREFELT $ 153) (QREFELT $ 147)))
          (QSETREFV $ 155
                    (LIST (QREFELT $ 21) (QREFELT $ 24) (QREFELT $ 33)
                          (QREFELT $ 36) (QREFELT $ 19) (QREFELT $ 140)))
          (QSETREFV $ 156
                    (LIST (QREFELT $ 20) (QREFELT $ 25) (QREFELT $ 22)
                          (QREFELT $ 23) (QREFELT $ 26) (QREFELT $ 31)
                          (QREFELT $ 28) (QREFELT $ 32) (QREFELT $ 37)
                          (QREFELT $ 34) (QREFELT $ 35) (QREFELT $ 38)
                          (QREFELT $ 43) (QREFELT $ 40) (QREFELT $ 41)
                          (QREFELT $ 49) (QREFELT $ 51) (QREFELT $ 55)
                          (QREFELT $ 56) (QREFELT $ 58) (QREFELT $ 59)
                          (QREFELT $ 139) (QREFELT $ 135) (QREFELT $ 136)))
          (QSETREFV $ 157
                    (LIST (QREFELT $ 48) (QREFELT $ 14) (QREFELT $ 121)
                          (QREFELT $ 132) (QREFELT $ 128) (QREFELT $ 130)))
          (QSETREFV $ 158
                    (LIST (QREFELT $ 123) (QREFELT $ 129) (QREFELT $ 131)))
          $))) 

(MAKEPROP '|CommonOperators| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Boolean|) (|Reference| 6) (0 . |ref|)
              '|brandNew?| (|Symbol|) (|NonNegativeInteger|) (|BasicOperator|)
              (5 . |operator|) '|opalg| '|oproot| '|oppi| '|oplog| '|opexp|
              '|opabs| '|opsin| '|opcos| '|optan| '|opcot| '|opsec| '|opcsc|
              '|opasin| '|opacos| '|opatan| '|opacot| '|opasec| '|opacsc|
              '|opsinh| '|opcosh| '|optanh| '|opcoth| '|opsech| '|opcsch|
              '|opasinh| '|opacosh| '|opatanh| '|opacoth| '|opasech| '|opacsch|
              (11 . |operator|) '|opbox| '|oppren| '|opquote| '|opdiff| '|opsi|
              '|opci| '|opshi| '|opchi| '|opei| '|opli| '|operf| '|operfi|
              '|opli2| '|opfis| '|opfic| '|opGamma| '|opGamma2| '|opBeta|
              '|opdigamma| '|oppolygamma| '|opBesselJ| '|opBesselY|
              '|opBesselI| '|opBesselK| '|opAiryAi| '|opAiryAiPrime|
              '|opAiryBi| '|opAiryBiPrime| '|opLambertW| '|opPolylog|
              '|opWeierstrassP| '|opWeierstrassPPrime| '|opWeierstrassSigma|
              '|opWeierstrassZeta| '|opHypergeometricF| '|opMeijerG|
              '|opWhittakerM| '|opWhittakerW| '|opAngerJ| '|opWeberE|
              '|opStruveH| '|opStruveL| '|opHankelH1| '|opHankelH2|
              '|opLommelS1| '|opLommelS2| '|opKummerM| '|opKummerU|
              '|opLegendreP| '|opLegendreQ| '|opKelvinBei| '|opKelvinBer|
              '|opKelvinKei| '|opKelvinKer| '|opEllipticK| '|opEllipticE|
              '|opEllipticE2| '|opEllipticF| '|opEllipticPi| '|opJacobiSn|
              '|opJacobiCn| '|opJacobiDn| '|opJacobiZeta| '|opJacobiTheta|
              '|opWeierstrassPInverse| '|opLerchPhi| '|opRiemannZeta|
              '|opCharlierC| '|opHermiteH| '|opJacobiP| '|opLaguerreL|
              '|opMeixnerM| '|op_log_gamma| '|op_eis| '|op_erfs| '|op_erfis|
              '|opint| '|opiint| '|opdint| '|opfact| '|opperm| '|opbinom|
              '|oppow| '|opsum| '|opdsum| '|opprod| '|opdprod| '|oprootsum|
              '|opfloor| '|opceil| '|opreal| '|opimag| '|opconjugate| '|oparg|
              '|opsign| '|opDiracDelta| '|opmax| '|opmin| '|algop| '|rtrigop|
              '|htrigop| (|List| 12) (16 . |concat|) '|trigop| '|elemop|
              '|primop| '|combop| '|specop| '|anyop| '|allop| '|evenop|
              '|oddop| '|dummyvarop1| '|dummyvarop2| (22 . |deref|)
              (27 . |is?|) (33 . |copy|) |COMMONOP;operator;SBo;1|
              (|OutputForm|) (38 . |coerce|) (43 . |paren|) (48 . |postfix|)
              (54 . |quote|) (|List| $) (59 . |prefix|) (|None|)
              (65 . |setProperty|) (72 . |coerce|) (77 . =) (83 . ^)
              (89 . |setelt!|) (|Mapping| 163 163) (95 . |display|)
              (101 . |commaSeparate|) (|Mapping| 163 182) (106 . |display|)
              (112 . |supersub|) (|List| 163) (118 . |first|) (123 . |second|)
              (128 . |binomial|) (134 . |third|) (139 . |sum|) (146 . |prod|)
              (153 . |hconcat|) (159 . *) (165 . |empty|) (169 . |int|)
              (|InputForm|) (176 . |convert|) (|List| 193) (181 . |concat|)
              (187 . |concat|) (193 . |convert|) (|Mapping| 193 195)
              (198 . |input|) (204 . |first|) (209 . |One|) (|Integer|)
              (213 . |One|) (217 . |One|) (221 . |second|) (226 . /)
              (232 . |assert|) (|Void|) (238 . |void|))
           '#(|operator| 242) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 210
                                                 '(1 7 0 6 8 2 12 0 10 11 13 1
                                                   12 0 10 44 2 146 0 0 0 147 1
                                                   7 6 0 159 2 12 6 0 10 160 1
                                                   12 0 0 161 1 10 163 0 164 1
                                                   163 0 0 165 2 163 0 0 0 166
                                                   1 163 0 0 167 2 163 0 0 168
                                                   169 3 12 0 0 10 170 171 1 11
                                                   163 0 172 2 163 6 0 0 173 2
                                                   163 0 0 0 174 2 7 6 0 6 175
                                                   2 12 0 0 176 177 1 163 0 168
                                                   178 2 12 0 0 179 180 2 163 0
                                                   0 168 181 1 182 163 0 183 1
                                                   182 163 0 184 2 163 0 0 0
                                                   185 1 182 163 0 186 3 163 0
                                                   0 0 0 187 3 163 0 0 0 0 188
                                                   2 163 0 0 0 189 2 163 0 0 0
                                                   190 0 163 0 191 3 163 0 0 0
                                                   0 192 1 10 193 0 194 2 195 0
                                                   0 193 196 2 195 0 193 0 197
                                                   1 193 0 168 198 2 12 0 0 199
                                                   200 1 195 193 0 201 0 11 0
                                                   202 0 203 0 204 0 193 0 205
                                                   1 195 193 0 206 2 193 0 0 0
                                                   207 2 12 0 0 10 208 0 209 0
                                                   210 1 0 12 10 162)))))
           '|lookupComplete|)) 

(MAKEPROP '|CommonOperators| 'NILADIC T) 
