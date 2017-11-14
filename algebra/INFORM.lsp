
(SDEFUN |INFORM;Zero;$;1| (($ $)) (SPADCALL 0 (QREFELT $ 8))) 

(SDEFUN |INFORM;One;$;2| (($ $)) (SPADCALL 1 (QREFELT $ 8))) 

(PUT '|INFORM;convert;$Se;3| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |INFORM;convert;$Se;3| ((|x| $) ($ |SExpression|)) |x|) 

(PUT '|INFORM;convert;Se$;4| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |INFORM;convert;Se$;4| ((|x| |SExpression|) ($ $)) |x|) 

(SDEFUN |INFORM;conv| ((|ll| |List| $) ($ $)) (SPADCALL |ll| (QREFELT $ 14))) 

(SDEFUN |INFORM;lambda;$L$;6| ((|f| $) (|l| |List| (|Symbol|)) ($ $))
        (|INFORM;conv|
         (LIST (SPADCALL '+-> (QREFELT $ 16)) (|INFORM;tuplify| |l| $) |f|) $)) 

(SDEFUN |INFORM;interpret;$A;7| ((|x| $) ($ |Any|))
        (SPROG ((|v| (|None|)))
               (SEQ (LETT |v| (|interpret| |x| NIL) |INFORM;interpret;$A;7|)
                    (EXIT
                     (|mkObj| (|unwrap| (|objVal| |v|)) (|objMode| |v|)))))) 

(SDEFUN |INFORM;convert;Df$;8| ((|x| |DoubleFloat|) ($ $))
        (COND ((|zero?_DF| |x|) (|spadConstant| $ 9))
              ((|eql_DF| |x| 1.0) (|spadConstant| $ 10))
              ('T (SPADCALL |x| (QREFELT $ 22))))) 

(SDEFUN |INFORM;flatten;2$;9| ((|s| $) ($ $))
        (SPROG
         ((#1=#:G755 NIL) (|u| NIL) (#2=#:G754 NIL) (#3=#:G753 NIL)
          (#4=#:G752 NIL)
          (|l2| (|List| (|Record| (|:| |lst| (|List| $)) (|:| |symb| $))))
          (|n| (|NonNegativeInteger|)) (#5=#:G751 NIL) (|l| (|List| $))
          (|x| NIL) (#6=#:G750 NIL) (|sy| (|Symbol|)))
         (SEQ
          (COND
           ((OR (SPADCALL |s| (QREFELT $ 25))
                (SPADCALL (ELT $ 25) (SPADCALL |s| (QREFELT $ 26))
                          (QREFELT $ 29)))
            |s|)
           ('T
            (SEQ
             (LETT |sy| (SPADCALL (QREFELT $ 30)) . #7=(|INFORM;flatten;2$;9|))
             (LETT |n| 0 . #7#)
             (LETT |l2|
                   (PROGN
                    (LETT #6# NIL . #7#)
                    (SEQ (LETT |x| NIL . #7#)
                         (LETT #5#
                               (SPADCALL
                                (LETT |l| (SPADCALL |s| (QREFELT $ 26)) . #7#)
                                (QREFELT $ 31))
                               . #7#)
                         G190
                         (COND
                          ((OR (ATOM #5#)
                               (PROGN (LETT |x| (CAR #5#) . #7#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #6#
                                 (CONS
                                  (|INFORM;flatten0| |x| |sy|
                                   (LETT |n| (+ |n| 1) . #7#) $)
                                  #6#)
                                 . #7#)))
                         (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                         (EXIT (NREVERSE #6#))))
                   . #7#)
             (EXIT
              (|INFORM;conv|
               (SPADCALL (SPADCALL 'SEQ (QREFELT $ 16))
                         (SPADCALL
                          (SPADCALL
                           (PROGN
                            (LETT #4# NIL . #7#)
                            (SEQ (LETT |u| NIL . #7#) (LETT #3# |l2| . #7#)
                                 G190
                                 (COND
                                  ((OR (ATOM #3#)
                                       (PROGN (LETT |u| (CAR #3#) . #7#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #4# (CONS (QCAR |u|) #4#) . #7#)))
                                 (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                                 (EXIT (NREVERSE #4#))))
                           (QREFELT $ 32))
                          (|INFORM;conv|
                           (LIST (SPADCALL '|exit| (QREFELT $ 16))
                                 (|spadConstant| $ 10)
                                 (|INFORM;conv|
                                  (SPADCALL (SPADCALL |l| (QREFELT $ 33))
                                            (PROGN
                                             (LETT #2# NIL . #7#)
                                             (SEQ (LETT |u| NIL . #7#)
                                                  (LETT #1# |l2| . #7#) G190
                                                  (COND
                                                   ((OR (ATOM #1#)
                                                        (PROGN
                                                         (LETT |u| (CAR #1#)
                                                               . #7#)
                                                         NIL))
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT #2#
                                                          (CONS (QCDR |u|) #2#)
                                                          . #7#)))
                                                  (LETT #1# (CDR #1#) . #7#)
                                                  (GO G190) G191
                                                  (EXIT (NREVERSE #2#))))
                                            (QREFELT $ 34))
                                  $))
                           $)
                          (QREFELT $ 35))
                         (QREFELT $ 34))
               $)))))))) 

(SDEFUN |INFORM;flatten0|
        ((|s| $) (|sy| |Symbol|) (|n| |NonNegativeInteger|)
         ($ |Record| (|:| |lst| (|List| $)) (|:| |symb| $)))
        (SPROG
         ((#1=#:G768 NIL) (|u| NIL) (#2=#:G767 NIL) (#3=#:G766 NIL)
          (#4=#:G765 NIL)
          (|l2| (|List| (|Record| (|:| |lst| (|List| $)) (|:| |symb| $))))
          (#5=#:G764 NIL) (|l| (|List| $)) (|x| NIL) (#6=#:G763 NIL) (|a| ($)))
         (SEQ
          (COND ((SPADCALL |s| (QREFELT $ 25)) (CONS NIL |s|))
                ('T
                 (SEQ
                  (LETT |a|
                        (SPADCALL
                         (SPADCALL
                          (STRCONC (SPADCALL |sy| (QREFELT $ 38))
                                   (STRINGIMAGE |n|))
                          (QREFELT $ 39))
                         (QREFELT $ 16))
                        . #7=(|INFORM;flatten0|))
                  (LETT |l2|
                        (PROGN
                         (LETT #6# NIL . #7#)
                         (SEQ (LETT |x| NIL . #7#)
                              (LETT #5#
                                    (SPADCALL
                                     (LETT |l| (SPADCALL |s| (QREFELT $ 26))
                                           . #7#)
                                     (QREFELT $ 31))
                                    . #7#)
                              G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |x| (CAR #5#) . #7#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #6#
                                      (CONS
                                       (|INFORM;flatten0| |x| |sy|
                                        (LETT |n| (+ |n| 1) . #7#) $)
                                       #6#)
                                      . #7#)))
                              (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                              (EXIT (NREVERSE #6#))))
                        . #7#)
                  (EXIT
                   (CONS
                    (SPADCALL
                     (SPADCALL
                      (PROGN
                       (LETT #4# NIL . #7#)
                       (SEQ (LETT |u| NIL . #7#) (LETT #3# |l2| . #7#) G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |u| (CAR #3#) . #7#) NIL))
                              (GO G191)))
                            (SEQ (EXIT (LETT #4# (CONS (QCAR |u|) #4#) . #7#)))
                            (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                            (EXIT (NREVERSE #4#))))
                      (QREFELT $ 32))
                     (|INFORM;conv|
                      (LIST (SPADCALL 'LET (QREFELT $ 16)) |a|
                            (|INFORM;conv|
                             (SPADCALL (SPADCALL |l| (QREFELT $ 33))
                                       (PROGN
                                        (LETT #2# NIL . #7#)
                                        (SEQ (LETT |u| NIL . #7#)
                                             (LETT #1# |l2| . #7#) G190
                                             (COND
                                              ((OR (ATOM #1#)
                                                   (PROGN
                                                    (LETT |u| (CAR #1#) . #7#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #2# (CONS (QCDR |u|) #2#)
                                                     . #7#)))
                                             (LETT #1# (CDR #1#) . #7#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #2#))))
                                       (QREFELT $ 34))
                             $))
                      $)
                     (QREFELT $ 35))
                    |a|)))))))) 

(SDEFUN |INFORM;strsym| ((|s| $) ($ |String|))
        (COND ((SPADCALL |s| (QREFELT $ 40)) (SPADCALL |s| (QREFELT $ 41)))
              ((SPADCALL |s| (QREFELT $ 42))
               (SPADCALL (SPADCALL |s| (QREFELT $ 43)) (QREFELT $ 38)))
              ('T (|error| "strsym: form is neither a string or symbol")))) 

(SDEFUN |INFORM;unparse;$S;12| ((|x| $) ($ |String|))
        (SPROG ((#1=#:G776 NIL) (|a| NIL) (#2=#:G775 NIL) (|s| ($)))
               (SEQ
                (COND
                 ((SPADCALL
                   (LETT |s| (|unparseInputForm| |x|)
                         . #3=(|INFORM;unparse;$S;12|))
                   (QREFELT $ 25))
                  (|INFORM;strsym| |s| $))
                 ('T
                  (SPADCALL
                   (PROGN
                    (LETT #2# NIL . #3#)
                    (SEQ (LETT |a| NIL . #3#)
                         (LETT #1# (SPADCALL |s| (QREFELT $ 26)) . #3#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2# (CONS (|INFORM;strsym| |a| $) #2#)
                                 . #3#)))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                         (EXIT (NREVERSE #2#))))
                   (QREFELT $ 44))))))) 

(PUT '|INFORM;parse;S$;13| '|SPADreplace| '|ncParseFromString|) 

(SDEFUN |INFORM;parse;S$;13| ((|s| |String|) ($ $)) (|ncParseFromString| |s|)) 

(SDEFUN |INFORM;declare;LS;14| ((|signature| |List| $) ($ |Symbol|))
        (SPROG ((|name| (|Symbol|)))
               (SEQ
                (|declare|
                 (LETT |name| (SPADCALL (QREFELT $ 30)) |INFORM;declare;LS;14|)
                 |signature|)
                (EXIT |name|)))) 

(SDEFUN |INFORM;compile;SLS;15|
        ((|name| |Symbol|) (|types| |List| $) ($ |Symbol|))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL
            (|selectLocalMms| (|INFORM;mkProperOp| |name| $)
                              (SPADCALL |name| (QREFELT $ 16)) |types| NIL)
            (QREFELT $ 48))
           (QREFELT $ 49))
          (QREFELT $ 48))
         (QREFELT $ 43))) 

(SDEFUN |INFORM;mkProperOp| ((|name| |Symbol|) ($ $))
        (SPROG ((|op| ($)) (|nme| ($)))
               (SEQ
                (LETT |op|
                      (|mkAtree|
                       (LETT |nme| (SPADCALL |name| (QREFELT $ 16))
                             . #1=(|INFORM;mkProperOp|)))
                      . #1#)
                (|transferPropsToNode| |nme| |op|) (EXIT |op|)))) 

(SDEFUN |INFORM;binary;$L$;17| ((|op| $) (|args| |List| $) ($ $))
        (SPROG ((|n| (|NonNegativeInteger|)))
               (SEQ
                (LETT |n| (SPADCALL |args| (QREFELT $ 52))
                      |INFORM;binary;$L$;17|)
                (EXIT
                 (COND ((< |n| 2) (|error| "Need at least 2 arguments"))
                       ((EQL |n| 2)
                        (SPADCALL
                         (LIST |op| (SPADCALL |args| (QREFELT $ 33))
                               (SPADCALL |args| (QREFELT $ 53)))
                         (QREFELT $ 54)))
                       ('T
                        (SPADCALL
                         (LIST |op| (SPADCALL |args| (QREFELT $ 33))
                               (SPADCALL |op| (SPADCALL |args| (QREFELT $ 31))
                                         (QREFELT $ 55)))
                         (QREFELT $ 54)))))))) 

(SDEFUN |INFORM;tuplify| ((|l| |List| (|Symbol|)) ($ $))
        (SPROG ((#1=#:G790 NIL) (|x| NIL) (#2=#:G789 NIL))
               (SEQ
                (COND
                 ((NULL (CDR |l|)) (SPADCALL (|SPADfirst| |l|) (QREFELT $ 16)))
                 ('T
                  (|INFORM;conv|
                   (SPADCALL (SPADCALL '|Tuple| (QREFELT $ 16))
                             (PROGN
                              (LETT #2# NIL . #3=(|INFORM;tuplify|))
                              (SEQ (LETT |x| NIL . #3#) (LETT #1# |l| . #3#)
                                   G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |x| (CAR #1#) . #3#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS (SPADCALL |x| (QREFELT $ 16))
                                                 #2#)
                                           . #3#)))
                                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                   (EXIT (NREVERSE #2#))))
                             (QREFELT $ 34))
                   $)))))) 

(SDEFUN |INFORM;function;$LS$;19|
        ((|f| $) (|l| |List| (|Symbol|)) (|name| |Symbol|) ($ $))
        (SPROG ((#1=#:G795 NIL) (|x| NIL) (#2=#:G794 NIL) (|nn| ($)))
               (SEQ
                (LETT |nn|
                      (SPADCALL
                       (SPADCALL (+ 1 (LENGTH |l|))
                                 (SPADCALL NIL (QREFELT $ 54)) (QREFELT $ 56))
                       (QREFELT $ 54))
                      . #3=(|INFORM;function;$LS$;19|))
                (EXIT
                 (|INFORM;conv|
                  (LIST (SPADCALL 'DEF (QREFELT $ 16))
                        (|INFORM;conv|
                         (SPADCALL (SPADCALL |name| (QREFELT $ 16))
                                   (PROGN
                                    (LETT #2# NIL . #3#)
                                    (SEQ (LETT |x| NIL . #3#)
                                         (LETT #1# |l| . #3#) G190
                                         (COND
                                          ((OR (ATOM #1#)
                                               (PROGN
                                                (LETT |x| (CAR #1#) . #3#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #2#
                                                 (CONS
                                                  (SPADCALL |x| (QREFELT $ 16))
                                                  #2#)
                                                 . #3#)))
                                         (LETT #1# (CDR #1#) . #3#) (GO G190)
                                         G191 (EXIT (NREVERSE #2#))))
                                   (QREFELT $ 57))
                         $)
                        |nn| |nn| |f|)
                  $))))) 

(SDEFUN |INFORM;+;3$;20| ((|s1| $) (|s2| $) ($ $))
        (COND ((SPADCALL |s1| (|spadConstant| $ 9) (QREFELT $ 59)) |s2|)
              ((SPADCALL |s2| (|spadConstant| $ 9) (QREFELT $ 59)) |s1|)
              ('T
               (|INFORM;conv| (LIST (SPADCALL '+ (QREFELT $ 16)) |s1| |s2|)
                $)))) 

(SDEFUN |INFORM;*;3$;21| ((|s1| $) (|s2| $) ($ $))
        (COND
         ((OR (SPADCALL |s1| (|spadConstant| $ 9) (QREFELT $ 59))
              (SPADCALL |s2| (|spadConstant| $ 9) (QREFELT $ 59)))
          (|spadConstant| $ 9))
         ('T
          (COND ((SPADCALL |s1| (|spadConstant| $ 10) (QREFELT $ 59)) |s2|)
                ((SPADCALL |s2| (|spadConstant| $ 10) (QREFELT $ 59)) |s1|)
                ('T
                 (|INFORM;conv| (LIST (SPADCALL '* (QREFELT $ 16)) |s1| |s2|)
                  $)))))) 

(SDEFUN |INFORM;^;$I$;22| ((|s1| $) (|n| |Integer|) ($ $))
        (SEQ
         (COND
          ((SPADCALL |s1| (|spadConstant| $ 9) (QREFELT $ 59))
           (COND
            ((SPADCALL |n| 0 (QREFELT $ 62)) (EXIT (|spadConstant| $ 9))))))
         (COND
          ((OR (SPADCALL |s1| (|spadConstant| $ 10) (QREFELT $ 59))
               (ZEROP |n|))
           (EXIT (|spadConstant| $ 10))))
         (EXIT
          (COND ((EQL |n| 1) |s1|)
                ('T
                 (|INFORM;conv|
                  (LIST (SPADCALL '^ (QREFELT $ 16)) |s1|
                        (SPADCALL |n| (QREFELT $ 8)))
                  $)))))) 

(SDEFUN |INFORM;^;$Nni$;23| ((|s1| $) (|n| |NonNegativeInteger|) ($ $))
        (SPADCALL |s1| |n| (QREFELT $ 63))) 

(SDEFUN |INFORM;/;3$;24| ((|s1| $) (|s2| $) ($ $))
        (COND ((SPADCALL |s2| (|spadConstant| $ 10) (QREFELT $ 59)) |s1|)
              ('T
               (|INFORM;conv| (LIST (SPADCALL '/ (QREFELT $ 16)) |s1| |s2|)
                $)))) 

(DECLAIM (NOTINLINE |InputForm;|)) 

(DEFUN |InputForm| ()
  (SPROG NIL
         (PROG (#1=#:G805)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|InputForm|)
                    . #2=(|InputForm|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|InputForm|
                             (LIST (CONS NIL (CONS 1 (|InputForm;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|InputForm|)))))))))) 

(DEFUN |InputForm;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|InputForm|) . #1=(|InputForm|))
          (LETT $ (GETREFV 70) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|InputForm| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 (|SExpression|))
          $))) 

(MAKEPROP '|InputForm| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SExpression|) '|Rep| (|Integer|)
              (0 . |convert|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |INFORM;Zero;$;1|) $))
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |INFORM;One;$;2|) $))
              |INFORM;convert;$Se;3| |INFORM;convert;Se$;4| (|List| $)
              (5 . |convert|) (|Symbol|) (10 . |convert|) (|List| 15)
              |INFORM;lambda;$L$;6| (|Any|) |INFORM;interpret;$A;7|
              (|DoubleFloat|) (15 . |convert|) |INFORM;convert;Df$;8|
              (|Boolean|) (20 . |atom?|) (25 . |destruct|) (|Mapping| 24 $$)
              (|List| $$) (30 . |every?|) (36 . |new|) (40 . |rest|)
              (45 . |concat|) (50 . |first|) (55 . |concat|) (61 . |concat|)
              |INFORM;flatten;2$;9| (|String|) (67 . |string|) (72 . |coerce|)
              (77 . |string?|) (82 . |string|) (87 . |symbol?|) (92 . |symbol|)
              (97 . |concat|) |INFORM;unparse;$S;12| |INFORM;parse;S$;13|
              |INFORM;declare;LS;14| (102 . |car|) (107 . |cdr|)
              |INFORM;compile;SLS;15| (|NonNegativeInteger|) (112 . |#|)
              (117 . |last|) (122 . |convert|) |INFORM;binary;$L$;17|
              (127 . |new|) (133 . |cons|) |INFORM;function;$LS$;19| (139 . =)
              |INFORM;+;3$;20| |INFORM;*;3$;21| (145 . >) |INFORM;^;$I$;22|
              |INFORM;^;$Nni$;23| |INFORM;/;3$;24| (|List| 7) (|SingleInteger|)
              (|HashState|) (|OutputForm|))
           '#(|unparse| 151 |symbol?| 156 |symbol| 161 |string?| 166 |string|
              171 |parse| 176 |lambda| 181 |interpret| 187 |function| 192
              |flatten| 199 |destruct| 204 |declare| 209 |convert| 214
              |compile| 244 |cdr| 250 |car| 255 |binary| 260 |atom?| 266 ^ 271
              |Zero| 283 |One| 287 = 291 / 297 + 303 * 309)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0))
                 (CONS '#(NIL |SetCategory&| |BasicType&| NIL NIL)
                       (CONS
                        '#((|SExpressionCategory| 37 15 7 21) (|SetCategory|)
                           (|BasicType|) (|ConvertibleTo| 5)
                           (|CoercibleTo| 69))
                        (|makeByteWordVec2| 65
                                            '(1 0 0 7 8 1 5 0 13 14 1 0 0 15 16
                                              1 6 0 21 22 1 0 24 0 25 1 0 13 0
                                              26 2 28 24 27 0 29 0 15 0 30 1 28
                                              0 0 31 1 28 0 13 32 1 28 2 0 33 2
                                              28 0 2 0 34 2 28 0 0 2 35 1 15 37
                                              0 38 1 15 0 37 39 1 0 24 0 40 1 0
                                              37 0 41 1 0 24 0 42 1 0 15 0 43 1
                                              37 0 13 44 1 0 0 0 48 1 0 0 0 49
                                              1 28 51 0 52 1 28 2 0 53 1 0 0 13
                                              54 2 28 0 51 2 56 2 28 0 2 0 57 2
                                              0 24 0 0 59 2 7 24 0 0 62 1 0 37
                                              0 45 1 0 24 0 42 1 0 15 0 43 1 0
                                              24 0 40 1 0 37 0 41 1 0 0 37 46 2
                                              0 0 0 17 18 1 0 19 0 20 3 0 0 0
                                              17 15 58 1 0 0 0 36 1 0 13 0 26 1
                                              0 15 13 47 1 0 0 5 12 1 0 5 0 11
                                              1 0 0 21 23 1 0 0 7 8 1 0 0 15 16
                                              1 0 0 13 54 2 0 15 15 13 50 1 0 0
                                              0 49 1 0 0 0 48 2 0 0 0 13 55 1 0
                                              24 0 25 2 0 0 0 51 64 2 0 0 0 7
                                              63 0 0 0 9 0 0 0 10 2 0 24 0 0 59
                                              2 0 0 0 0 65 2 0 0 0 0 60 2 0 0 0
                                              0 61)))))
           '|lookupIncomplete|)) 

(MAKEPROP '|InputForm| 'NILADIC T) 
