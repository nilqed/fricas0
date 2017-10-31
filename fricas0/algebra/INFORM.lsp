
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
         ((#1=#:G752 NIL) (|u| NIL) (#2=#:G751 NIL) (#3=#:G750 NIL)
          (#4=#:G749 NIL)
          (|l2| (|List| (|Record| (|:| |lst| (|List| $)) (|:| |symb| $))))
          (|n| (|NonNegativeInteger|)) (#5=#:G748 NIL) (|l| (|List| $))
          (|x| NIL) (#6=#:G747 NIL) (|sy| (|Symbol|)))
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
         ((#1=#:G765 NIL) (|u| NIL) (#2=#:G764 NIL) (#3=#:G763 NIL)
          (#4=#:G762 NIL)
          (|l2| (|List| (|Record| (|:| |lst| (|List| $)) (|:| |symb| $))))
          (#5=#:G761 NIL) (|l| (|List| $)) (|x| NIL) (#6=#:G760 NIL) (|a| ($)))
         (SEQ
          (COND
           ((SPADCALL |s| (QREFELT $ 25)) (CONS (SPADCALL (QREFELT $ 37)) |s|))
           ('T
            (SEQ
             (LETT |a|
                   (SPADCALL
                    (SPADCALL
                     (STRCONC (SPADCALL |sy| (QREFELT $ 39)) (STRINGIMAGE |n|))
                     (QREFELT $ 40))
                    (QREFELT $ 16))
                   . #7=(|INFORM;flatten0|))
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
              (CONS
               (SPADCALL
                (SPADCALL
                 (PROGN
                  (LETT #4# NIL . #7#)
                  (SEQ (LETT |u| NIL . #7#) (LETT #3# |l2| . #7#) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |u| (CAR #3#) . #7#) NIL))
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
                                        (LETT #1# (CDR #1#) . #7#) (GO G190)
                                        G191 (EXIT (NREVERSE #2#))))
                                  (QREFELT $ 34))
                        $))
                 $)
                (QREFELT $ 35))
               |a|)))))))) 

(SDEFUN |INFORM;strsym| ((|s| $) ($ |String|))
        (COND ((SPADCALL |s| (QREFELT $ 41)) (SPADCALL |s| (QREFELT $ 42)))
              ((SPADCALL |s| (QREFELT $ 43))
               (SPADCALL (SPADCALL |s| (QREFELT $ 44)) (QREFELT $ 39)))
              ('T (|error| "strsym: form is neither a string or symbol")))) 

(SDEFUN |INFORM;unparse;$S;12| ((|x| $) ($ |String|))
        (SPROG ((#1=#:G773 NIL) (|a| NIL) (#2=#:G772 NIL) (|s| ($)))
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
                   (QREFELT $ 45))))))) 

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
                              (SPADCALL |name| (QREFELT $ 16)) |types|
                              (SPADCALL (QREFELT $ 37)))
            (QREFELT $ 49))
           (QREFELT $ 50))
          (QREFELT $ 49))
         (QREFELT $ 44))) 

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
                (LETT |n| (SPADCALL |args| (QREFELT $ 53))
                      |INFORM;binary;$L$;17|)
                (EXIT
                 (COND ((< |n| 2) (|error| "Need at least 2 arguments"))
                       ((EQL |n| 2)
                        (SPADCALL
                         (LIST |op| (SPADCALL |args| (QREFELT $ 33))
                               (SPADCALL |args| (QREFELT $ 54)))
                         (QREFELT $ 55)))
                       ('T
                        (SPADCALL
                         (LIST |op| (SPADCALL |args| (QREFELT $ 33))
                               (SPADCALL |op| (SPADCALL |args| (QREFELT $ 31))
                                         (QREFELT $ 56)))
                         (QREFELT $ 55)))))))) 

(SDEFUN |INFORM;tuplify| ((|l| |List| (|Symbol|)) ($ $))
        (SPROG ((#1=#:G786 NIL) (|x| NIL) (#2=#:G785 NIL))
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
        (SPROG ((#1=#:G791 NIL) (|x| NIL) (#2=#:G790 NIL) (|nn| ($)))
               (SEQ
                (LETT |nn|
                      (SPADCALL
                       (SPADCALL (+ 1 (LENGTH |l|))
                                 (SPADCALL (SPADCALL (QREFELT $ 37))
                                           (QREFELT $ 55))
                                 (QREFELT $ 57))
                       (QREFELT $ 55))
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
                                   (QREFELT $ 58))
                         $)
                        |nn| |nn| |f|)
                  $))))) 

(SDEFUN |INFORM;+;3$;20| ((|s1| $) (|s2| $) ($ $))
        (COND ((SPADCALL |s1| (|spadConstant| $ 9) (QREFELT $ 60)) |s2|)
              ((SPADCALL |s2| (|spadConstant| $ 9) (QREFELT $ 60)) |s1|)
              ('T
               (|INFORM;conv| (LIST (SPADCALL '+ (QREFELT $ 16)) |s1| |s2|)
                $)))) 

(SDEFUN |INFORM;*;3$;21| ((|s1| $) (|s2| $) ($ $))
        (COND
         ((OR (SPADCALL |s1| (|spadConstant| $ 9) (QREFELT $ 60))
              (SPADCALL |s2| (|spadConstant| $ 9) (QREFELT $ 60)))
          (|spadConstant| $ 9))
         ('T
          (COND ((SPADCALL |s1| (|spadConstant| $ 10) (QREFELT $ 60)) |s2|)
                ((SPADCALL |s2| (|spadConstant| $ 10) (QREFELT $ 60)) |s1|)
                ('T
                 (|INFORM;conv| (LIST (SPADCALL '* (QREFELT $ 16)) |s1| |s2|)
                  $)))))) 

(SDEFUN |INFORM;^;$I$;22| ((|s1| $) (|n| |Integer|) ($ $))
        (SEQ
         (COND
          ((SPADCALL |s1| (|spadConstant| $ 9) (QREFELT $ 60))
           (COND
            ((SPADCALL |n| 0 (QREFELT $ 63)) (EXIT (|spadConstant| $ 9))))))
         (COND
          ((OR (SPADCALL |s1| (|spadConstant| $ 10) (QREFELT $ 60))
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
        (SPADCALL |s1| |n| (QREFELT $ 64))) 

(SDEFUN |INFORM;/;3$;24| ((|s1| $) (|s2| $) ($ $))
        (COND ((SPADCALL |s2| (|spadConstant| $ 10) (QREFELT $ 60)) |s1|)
              ('T
               (|INFORM;conv| (LIST (SPADCALL '/ (QREFELT $ 16)) |s1| |s2|)
                $)))) 

(DECLAIM (NOTINLINE |InputForm;|)) 

(DEFUN |InputForm| ()
  (SPROG NIL
         (PROG (#1=#:G801)
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
          (LETT $ (GETREFV 71) . #1#)
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
              |INFORM;flatten;2$;9| (67 . |nil|) (|String|) (71 . |string|)
              (76 . |coerce|) (81 . |string?|) (86 . |string|) (91 . |symbol?|)
              (96 . |symbol|) (101 . |concat|) |INFORM;unparse;$S;12|
              |INFORM;parse;S$;13| |INFORM;declare;LS;14| (106 . |car|)
              (111 . |cdr|) |INFORM;compile;SLS;15| (|NonNegativeInteger|)
              (116 . |#|) (121 . |last|) (126 . |convert|)
              |INFORM;binary;$L$;17| (131 . |new|) (137 . |cons|)
              |INFORM;function;$LS$;19| (143 . =) |INFORM;+;3$;20|
              |INFORM;*;3$;21| (149 . >) |INFORM;^;$I$;22| |INFORM;^;$Nni$;23|
              |INFORM;/;3$;24| (|List| 7) (|SingleInteger|) (|HashState|)
              (|OutputForm|))
           '#(|unparse| 155 |symbol?| 160 |symbol| 165 |string?| 170 |string|
              175 |parse| 180 |lambda| 185 |interpret| 191 |function| 196
              |flatten| 203 |destruct| 208 |declare| 213 |convert| 218
              |compile| 248 |cdr| 254 |car| 259 |binary| 264 |atom?| 270 ^ 275
              |Zero| 287 |One| 291 = 295 / 301 + 307 * 313)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0))
                 (CONS '#(NIL |SetCategory&| |BasicType&| NIL NIL)
                       (CONS
                        '#((|SExpressionCategory| 38 15 7 21) (|SetCategory|)
                           (|BasicType|) (|ConvertibleTo| 5)
                           (|CoercibleTo| 70))
                        (|makeByteWordVec2| 66
                                            '(1 0 0 7 8 1 5 0 13 14 1 0 0 15 16
                                              1 6 0 21 22 1 0 24 0 25 1 0 13 0
                                              26 2 28 24 27 0 29 0 15 0 30 1 28
                                              0 0 31 1 28 0 13 32 1 28 2 0 33 2
                                              28 0 2 0 34 2 28 0 0 2 35 0 28 0
                                              37 1 15 38 0 39 1 15 0 38 40 1 0
                                              24 0 41 1 0 38 0 42 1 0 24 0 43 1
                                              0 15 0 44 1 38 0 13 45 1 0 0 0 49
                                              1 0 0 0 50 1 28 52 0 53 1 28 2 0
                                              54 1 0 0 13 55 2 28 0 52 2 57 2
                                              28 0 2 0 58 2 0 24 0 0 60 2 7 24
                                              0 0 63 1 0 38 0 46 1 0 24 0 43 1
                                              0 15 0 44 1 0 24 0 41 1 0 38 0 42
                                              1 0 0 38 47 2 0 0 0 17 18 1 0 19
                                              0 20 3 0 0 0 17 15 59 1 0 0 0 36
                                              1 0 13 0 26 1 0 15 13 48 1 0 0 5
                                              12 1 0 5 0 11 1 0 0 21 23 1 0 0 7
                                              8 1 0 0 15 16 1 0 0 13 55 2 0 15
                                              15 13 51 1 0 0 0 50 1 0 0 0 49 2
                                              0 0 0 13 56 1 0 24 0 25 2 0 0 0
                                              52 65 2 0 0 0 7 64 0 0 0 9 0 0 0
                                              10 2 0 24 0 0 60 2 0 0 0 0 66 2 0
                                              0 0 0 61 2 0 0 0 0 62)))))
           '|lookupIncomplete|)) 

(MAKEPROP '|InputForm| 'NILADIC T) 
