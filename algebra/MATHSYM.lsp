
(SDEFUN |MATHSYM;greek_str| ((|i| (|Integer|)) (% (|String|)))
        (SPROG
         ((#1=#:G7 NIL) (|ns| (|String|))
          (|qr|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|)))))
         (SEQ
          (EXIT
           (SEQ (LETT |ns| "")
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |qr| (DIVIDE2 |i| 24)) (LETT |i| (QCAR |qr|))
                           (LETT |ns|
                                 (STRCONC (NUM2USTR (+ (QCDR |qr|) 946)) |ns|))
                           (EXIT
                            (COND
                             ((ZEROP |i|)
                              (PROGN (LETT #1# |ns|) (GO #2=#:G6))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |MATHSYM;newGreek;S;2| ((% (|Symbol|)))
        (SPROG ((|sym| (|String|)))
               (SEQ (LETT |sym| (|MATHSYM;greek_str| (QREFELT % 6) %))
                    (SETELT % 6 (+ (QREFELT % 6) 1))
                    (EXIT (SPADCALL |sym| (QREFELT % 9)))))) 

(SDEFUN |MATHSYM;resetNewGreek;V;3| ((% (|Void|))) (SETELT % 6 0)) 

(SDEFUN |MATHSYM;getUTF| ((|i| (|PositiveInteger|)) (% (|Symbol|)))
        (SPADCALL (NUM2USTR |i|) (QREFELT % 9))) 

(SDEFUN |MATHSYM;partial;S;5| ((% (|Symbol|))) (|MATHSYM;getUTF| 8706 %)) 

(SDEFUN |MATHSYM;alpha;S;6| ((% (|Symbol|))) (|MATHSYM;getUTF| 945 %)) 

(SDEFUN |MATHSYM;beta;S;7| ((% (|Symbol|))) (|MATHSYM;getUTF| 946 %)) 

(SDEFUN |MATHSYM;gamma;S;8| ((% (|Symbol|))) (|MATHSYM;getUTF| 947 %)) 

(SDEFUN |MATHSYM;delta;S;9| ((% (|Symbol|))) (|MATHSYM;getUTF| 948 %)) 

(SDEFUN |MATHSYM;epsilon;S;10| ((% (|Symbol|))) (|MATHSYM;getUTF| 949 %)) 

(SDEFUN |MATHSYM;zeta;S;11| ((% (|Symbol|))) (|MATHSYM;getUTF| 950 %)) 

(SDEFUN |MATHSYM;eta;S;12| ((% (|Symbol|))) (|MATHSYM;getUTF| 951 %)) 

(SDEFUN |MATHSYM;theta;S;13| ((% (|Symbol|))) (|MATHSYM;getUTF| 952 %)) 

(SDEFUN |MATHSYM;iota;S;14| ((% (|Symbol|))) (|MATHSYM;getUTF| 953 %)) 

(SDEFUN |MATHSYM;kappa;S;15| ((% (|Symbol|))) (|MATHSYM;getUTF| 954 %)) 

(SDEFUN |MATHSYM;lambda;S;16| ((% (|Symbol|))) (|MATHSYM;getUTF| 955 %)) 

(SDEFUN |MATHSYM;mu;S;17| ((% (|Symbol|))) (|MATHSYM;getUTF| 956 %)) 

(SDEFUN |MATHSYM;nu;S;18| ((% (|Symbol|))) (|MATHSYM;getUTF| 957 %)) 

(SDEFUN |MATHSYM;xi;S;19| ((% (|Symbol|))) (|MATHSYM;getUTF| 958 %)) 

(SDEFUN |MATHSYM;omicron;S;20| ((% (|Symbol|))) (|MATHSYM;getUTF| 959 %)) 

(SDEFUN |MATHSYM;pi;S;21| ((% (|Symbol|))) (|MATHSYM;getUTF| 960 %)) 

(SDEFUN |MATHSYM;rho;S;22| ((% (|Symbol|))) (|MATHSYM;getUTF| 961 %)) 

(SDEFUN |MATHSYM;sigma;S;23| ((% (|Symbol|))) (|MATHSYM;getUTF| 963 %)) 

(SDEFUN |MATHSYM;tau;S;24| ((% (|Symbol|))) (|MATHSYM;getUTF| 964 %)) 

(SDEFUN |MATHSYM;upsilon;S;25| ((% (|Symbol|))) (|MATHSYM;getUTF| 965 %)) 

(SDEFUN |MATHSYM;phi;S;26| ((% (|Symbol|))) (|MATHSYM;getUTF| 966 %)) 

(SDEFUN |MATHSYM;chi;S;27| ((% (|Symbol|))) (|MATHSYM;getUTF| 967 %)) 

(SDEFUN |MATHSYM;psi;S;28| ((% (|Symbol|))) (|MATHSYM;getUTF| 968 %)) 

(SDEFUN |MATHSYM;omega;S;29| ((% (|Symbol|))) (|MATHSYM;getUTF| 669 %)) 

(SDEFUN |MATHSYM;Alpha;S;30| ((% (|Symbol|))) (|MATHSYM;getUTF| 913 %)) 

(SDEFUN |MATHSYM;Beta;S;31| ((% (|Symbol|))) (|MATHSYM;getUTF| 914 %)) 

(SDEFUN |MATHSYM;Gamma;S;32| ((% (|Symbol|))) (|MATHSYM;getUTF| 915 %)) 

(SDEFUN |MATHSYM;Delta;S;33| ((% (|Symbol|))) (|MATHSYM;getUTF| 916 %)) 

(SDEFUN |MATHSYM;Epsilon;S;34| ((% (|Symbol|))) (|MATHSYM;getUTF| 917 %)) 

(SDEFUN |MATHSYM;Zeta;S;35| ((% (|Symbol|))) (|MATHSYM;getUTF| 918 %)) 

(SDEFUN |MATHSYM;Eta;S;36| ((% (|Symbol|))) (|MATHSYM;getUTF| 919 %)) 

(SDEFUN |MATHSYM;Theta;S;37| ((% (|Symbol|))) (|MATHSYM;getUTF| 920 %)) 

(SDEFUN |MATHSYM;Iota;S;38| ((% (|Symbol|))) (|MATHSYM;getUTF| 921 %)) 

(SDEFUN |MATHSYM;Kappa;S;39| ((% (|Symbol|))) (|MATHSYM;getUTF| 922 %)) 

(SDEFUN |MATHSYM;Lambda;S;40| ((% (|Symbol|))) (|MATHSYM;getUTF| 923 %)) 

(SDEFUN |MATHSYM;Mu;S;41| ((% (|Symbol|))) (|MATHSYM;getUTF| 924 %)) 

(SDEFUN |MATHSYM;Nu;S;42| ((% (|Symbol|))) (|MATHSYM;getUTF| 925 %)) 

(SDEFUN |MATHSYM;Xi;S;43| ((% (|Symbol|))) (|MATHSYM;getUTF| 926 %)) 

(SDEFUN |MATHSYM;Omicron;S;44| ((% (|Symbol|))) (|MATHSYM;getUTF| 927 %)) 

(SDEFUN |MATHSYM;Pi;S;45| ((% (|Symbol|))) (|MATHSYM;getUTF| 928 %)) 

(SDEFUN |MATHSYM;Rho;S;46| ((% (|Symbol|))) (|MATHSYM;getUTF| 929 %)) 

(SDEFUN |MATHSYM;Sigma;S;47| ((% (|Symbol|))) (|MATHSYM;getUTF| 931 %)) 

(SDEFUN |MATHSYM;Tau;S;48| ((% (|Symbol|))) (|MATHSYM;getUTF| 932 %)) 

(SDEFUN |MATHSYM;Upsilon;S;49| ((% (|Symbol|))) (|MATHSYM;getUTF| 933 %)) 

(SDEFUN |MATHSYM;Phi;S;50| ((% (|Symbol|))) (|MATHSYM;getUTF| 934 %)) 

(SDEFUN |MATHSYM;Chi;S;51| ((% (|Symbol|))) (|MATHSYM;getUTF| 935 %)) 

(SDEFUN |MATHSYM;Psi;S;52| ((% (|Symbol|))) (|MATHSYM;getUTF| 936 %)) 

(SDEFUN |MATHSYM;Omega;S;53| ((% (|Symbol|))) (|MATHSYM;getUTF| 937 %)) 

(DECLAIM (NOTINLINE |MathematicalSymbols;|)) 

(DEFUN |MathematicalSymbols;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|MathematicalSymbols|))
          (LETT % (GETREFV 62))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|MathematicalSymbols| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6 0)
          %))) 

(DEFUN |MathematicalSymbols| ()
  (SPROG NIL
         (PROG (#1=#:G62)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|MathematicalSymbols|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|MathematicalSymbols|
                             (LIST
                              (CONS NIL (CONS 1 (|MathematicalSymbols;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|MathematicalSymbols|)))))))))) 

(MAKEPROP '|MathematicalSymbols| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|greekCount| (|String|) (|Symbol|)
              (0 . |coerce|) |MATHSYM;newGreek;S;2| (|Void|)
              |MATHSYM;resetNewGreek;V;3|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;partial;S;5|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;alpha;S;6|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;beta;S;7|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;gamma;S;8|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;delta;S;9|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;epsilon;S;10|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;zeta;S;11|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;eta;S;12|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;theta;S;13|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;iota;S;14|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;kappa;S;15|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;lambda;S;16|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;mu;S;17|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;nu;S;18|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;xi;S;19|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;omicron;S;20|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;pi;S;21|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;rho;S;22|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;sigma;S;23|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;tau;S;24|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;upsilon;S;25|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;phi;S;26|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;chi;S;27|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;psi;S;28|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;omega;S;29|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;Alpha;S;30|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;Beta;S;31|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;Gamma;S;32|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;Delta;S;33|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;Epsilon;S;34|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;Zeta;S;35|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;Eta;S;36|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;Theta;S;37|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;Iota;S;38|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;Kappa;S;39|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;Lambda;S;40|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;Mu;S;41|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;Nu;S;42|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;Xi;S;43|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;Omicron;S;44|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;Pi;S;45|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;Rho;S;46|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;Sigma;S;47|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;Tau;S;48|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;Upsilon;S;49|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;Phi;S;50|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;Chi;S;51|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;Psi;S;52|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MATHSYM;Omega;S;53|) %)))
           '#(|zeta| 5 |xi| 9 |upsilon| 13 |theta| 17 |tau| 21 |sigma| 25 |rho|
              29 |resetNewGreek| 33 |psi| 37 |pi| 41 |phi| 45 |partial| 49
              |omicron| 53 |omega| 57 |nu| 61 |newGreek| 65 |mu| 69 |lambda| 73
              |kappa| 77 |iota| 81 |gamma| 85 |eta| 89 |epsilon| 93 |delta| 97
              |chi| 101 |beta| 105 |alpha| 109 |Zeta| 113 |Xi| 117 |Upsilon|
              121 |Theta| 125 |Tau| 129 |Sigma| 133 |Rho| 137 |Psi| 141 |Pi|
              145 |Phi| 149 |Omicron| 153 |Omega| 157 |Nu| 161 |Mu| 165
              |Lambda| 169 |Kappa| 173 |Iota| 177 |Gamma| 181 |Eta| 185
              |Epsilon| 189 |Delta| 193 |Chi| 197 |Beta| 201 |Alpha| 205)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|newGreek| ((|Symbol|))) T)
                                   '((|resetNewGreek| ((|Void|))) T)
                                   '((|partial| ((|Symbol|)) |constant|) T)
                                   '((|alpha| ((|Symbol|)) |constant|) T)
                                   '((|beta| ((|Symbol|)) |constant|) T)
                                   '((|gamma| ((|Symbol|)) |constant|) T)
                                   '((|delta| ((|Symbol|)) |constant|) T)
                                   '((|epsilon| ((|Symbol|)) |constant|) T)
                                   '((|zeta| ((|Symbol|)) |constant|) T)
                                   '((|eta| ((|Symbol|)) |constant|) T)
                                   '((|theta| ((|Symbol|)) |constant|) T)
                                   '((|iota| ((|Symbol|)) |constant|) T)
                                   '((|kappa| ((|Symbol|)) |constant|) T)
                                   '((|lambda| ((|Symbol|)) |constant|) T)
                                   '((|mu| ((|Symbol|)) |constant|) T)
                                   '((|nu| ((|Symbol|)) |constant|) T)
                                   '((|xi| ((|Symbol|)) |constant|) T)
                                   '((|omicron| ((|Symbol|)) |constant|) T)
                                   '((|pi| ((|Symbol|)) |constant|) T)
                                   '((|rho| ((|Symbol|)) |constant|) T)
                                   '((|sigma| ((|Symbol|)) |constant|) T)
                                   '((|tau| ((|Symbol|)) |constant|) T)
                                   '((|upsilon| ((|Symbol|)) |constant|) T)
                                   '((|phi| ((|Symbol|)) |constant|) T)
                                   '((|chi| ((|Symbol|)) |constant|) T)
                                   '((|psi| ((|Symbol|)) |constant|) T)
                                   '((|omega| ((|Symbol|)) |constant|) T)
                                   '((|Alpha| ((|Symbol|)) |constant|) T)
                                   '((|Beta| ((|Symbol|)) |constant|) T)
                                   '((|Gamma| ((|Symbol|)) |constant|) T)
                                   '((|Delta| ((|Symbol|)) |constant|) T)
                                   '((|Epsilon| ((|Symbol|)) |constant|) T)
                                   '((|Zeta| ((|Symbol|)) |constant|) T)
                                   '((|Eta| ((|Symbol|)) |constant|) T)
                                   '((|Theta| ((|Symbol|)) |constant|) T)
                                   '((|Iota| ((|Symbol|)) |constant|) T)
                                   '((|Kappa| ((|Symbol|)) |constant|) T)
                                   '((|Lambda| ((|Symbol|)) |constant|) T)
                                   '((|Mu| ((|Symbol|)) |constant|) T)
                                   '((|Nu| ((|Symbol|)) |constant|) T)
                                   '((|Xi| ((|Symbol|)) |constant|) T)
                                   '((|Omicron| ((|Symbol|)) |constant|) T)
                                   '((|Pi| ((|Symbol|)) |constant|) T)
                                   '((|Rho| ((|Symbol|)) |constant|) T)
                                   '((|Sigma| ((|Symbol|)) |constant|) T)
                                   '((|Tau| ((|Symbol|)) |constant|) T)
                                   '((|Upsilon| ((|Symbol|)) |constant|) T)
                                   '((|Phi| ((|Symbol|)) |constant|) T)
                                   '((|Chi| ((|Symbol|)) |constant|) T)
                                   '((|Psi| ((|Symbol|)) |constant|) T)
                                   '((|Omega| ((|Symbol|)) |constant|) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 61
                                            '(1 8 0 7 9 0 0 8 19 0 0 8 27 0 0 8
                                              33 0 0 8 21 0 0 8 32 0 0 8 31 0 0
                                              8 30 0 0 11 12 0 0 8 36 0 0 8 29
                                              0 0 8 34 0 0 8 13 0 0 8 28 0 0 8
                                              37 0 0 8 26 0 0 8 10 0 0 8 25 0 0
                                              8 24 0 0 8 23 0 0 8 22 0 0 8 16 0
                                              0 8 20 0 0 8 18 0 0 8 17 0 0 8 35
                                              0 0 8 15 0 0 8 14 0 0 8 43 0 0 8
                                              51 0 0 8 57 0 0 8 45 0 0 8 56 0 0
                                              8 55 0 0 8 54 0 0 8 60 0 0 8 53 0
                                              0 8 58 0 0 8 52 0 0 8 61 0 0 8 50
                                              0 0 8 49 0 0 8 48 0 0 8 47 0 0 8
                                              46 0 0 8 40 0 0 8 44 0 0 8 42 0 0
                                              8 41 0 0 8 59 0 0 8 39 0 0 8
                                              38)))))
           '|lookupComplete|)) 
