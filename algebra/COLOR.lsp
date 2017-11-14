
(SDEFUN |COLOR;*;Df2$;1| ((|f| |DoubleFloat|) (|c| $) ($ $))
        (COND ((|zero?_DF| |f|) |c|)
              ('T (CONS (QCAR |c|) (|mul_DF| |f| (QCDR |c|)))))) 

(SDEFUN |COLOR;+;3$;2| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((|ans| #1=(|Integer|)) (|offset| (|Integer|)) (|diff| #1#)
          (|moreThanHalf| (|Boolean|)) (|xHueSmaller| (|Boolean|)) (|c| ($)))
         (SEQ
          (COND
           ((EQL (QCAR |x|) (QCAR |y|))
            (CONS (QCAR |x|) (|add_DF| (QCDR |x|) (QCDR |y|))))
           (#2='T
            (SEQ
             (COND
              ((SPADCALL (QCDR |y|) (QCDR |x|) (QREFELT $ 10))
               (SEQ (LETT |c| |x| . #3=(|COLOR;+;3$;2|)) (LETT |x| |y| . #3#)
                    (EXIT (LETT |y| |c| . #3#)))))
             (LETT |diff| (- (QCAR |x|) (QCAR |y|)) . #3#)
             (SEQ (LETT |xHueSmaller| (< |diff| 0) . #3#)
                  (EXIT (COND (|xHueSmaller| (LETT |diff| (- |diff|) . #3#)))))
             (SEQ
              (LETT |moreThanHalf|
                    (SPADCALL |diff| (QUOTIENT2 27 2) (QREFELT $ 12)) . #3#)
              (EXIT (COND (|moreThanHalf| (LETT |diff| (- 27 |diff|) . #3#)))))
             (LETT |offset|
                   (TRUNCATE
                    (SPADCALL
                     (|div_DF| (FLOAT |diff| MOST-POSITIVE-DOUBLE-FLOAT)
                               (SPADCALL (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)
                                         (|div_DF| (QCDR |x|) (QCDR |y|))
                                         (QREFELT $ 13)))
                     (QREFELT $ 14)))
                   . #3#)
             (COND
              (|xHueSmaller|
               (COND
                (|moreThanHalf|
                 (COND
                  ((OR |xHueSmaller| (NULL |moreThanHalf|))
                   (LETT |ans| (- (QCAR |x|) |offset|) . #3#))
                  ('T (LETT |ans| (+ (QCAR |x|) |offset|) . #3#))))
                (#2# (LETT |ans| (+ (QCAR |x|) |offset|) . #3#))))
              (|moreThanHalf| (LETT |ans| (+ (QCAR |x|) |offset|) . #3#))
              (#2# (LETT |ans| (- (QCAR |x|) |offset|) . #3#)))
             (COND ((< |ans| 0) (LETT |ans| (+ 27 |ans|) . #3#))
                   ((SPADCALL |ans| 27 (QREFELT $ 12))
                    (LETT |ans| (- |ans| 27) . #3#)))
             (EXIT (CONS |ans| 1.0)))))))) 

(SDEFUN |COLOR;=;2$B;3| ((|x| $) (|y| $) ($ |Boolean|))
        (COND ((EQL (QCAR |x|) (QCAR |y|)) (|eql_DF| (QCDR |x|) (QCDR |y|)))
              ('T NIL))) 

(PUT '|COLOR;red;$;4| '|SPADreplace| '(XLAM NIL (CONS 1 1.0))) 

(SDEFUN |COLOR;red;$;4| (($ $)) (CONS 1 1.0)) 

(PUT '|COLOR;yellow;$;5| '|SPADreplace| '(XLAM NIL (CONS 11 1.0))) 

(SDEFUN |COLOR;yellow;$;5| (($ $)) (CONS 11 1.0)) 

(PUT '|COLOR;green;$;6| '|SPADreplace| '(XLAM NIL (CONS 14 1.0))) 

(SDEFUN |COLOR;green;$;6| (($ $)) (CONS 14 1.0)) 

(PUT '|COLOR;blue;$;7| '|SPADreplace| '(XLAM NIL (CONS 22 1.0))) 

(SDEFUN |COLOR;blue;$;7| (($ $)) (CONS 22 1.0)) 

(PUT '|COLOR;hue;$I;8| '|SPADreplace| 'QCAR) 

(SDEFUN |COLOR;hue;$I;8| ((|c| $) ($ |Integer|)) (QCAR |c|)) 

(SDEFUN |COLOR;*;Pi2$;9| ((|i| |PositiveInteger|) (|c| $) ($ $))
        (SPADCALL (FLOAT |i| MOST-POSITIVE-DOUBLE-FLOAT) |c| (QREFELT $ 8))) 

(PUT '|COLOR;numberOfHues;Pi;10| '|SPADreplace| '(XLAM NIL 27)) 

(SDEFUN |COLOR;numberOfHues;Pi;10| (($ |PositiveInteger|)) 27) 

(SDEFUN |COLOR;color;I$;11| ((|i| |Integer|) ($ $))
        (SEQ
         (COND
          ((OR (< |i| 0) (SPADCALL |i| 27 (QREFELT $ 12)))
           (|error|
            (STRCONC "Color should be in the range 1.." (STRINGIMAGE 27)))))
         (EXIT (CONS |i| 1.0)))) 

(SDEFUN |COLOR;coerce;$Of;12| ((|c| $) ($ |OutputForm|))
        (SPADCALL
         (LIST (SPADCALL "Hue: " (QREFELT $ 28))
               (SPADCALL (QCAR |c|) (QREFELT $ 29))
               (SPADCALL "  Weight: " (QREFELT $ 28))
               (SPADCALL (QCDR |c|) (QREFELT $ 30)))
         (QREFELT $ 32))) 

(DECLAIM (NOTINLINE |Color;|)) 

(DEFUN |Color| ()
  (SPROG NIL
         (PROG (#1=#:G738)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Color|) . #2=(|Color|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Color|
                             (LIST (CONS NIL (CONS 1 (|Color;|))))))
                    (LETT #1# T . #2#))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Color|)))))))))) 

(DEFUN |Color;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Color|) . #1=(|Color|))
          (LETT $ (GETREFV 36) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|Color| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record| (|:| |hue| (|Integer|))
                              (|:| |weight| (|DoubleFloat|))))
          $))) 

(MAKEPROP '|Color| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|DoubleFloat|) |COLOR;*;Df2$;1|
              (|Boolean|) (0 . >) (|Integer|) (6 . >) (12 . ^) (18 . |round|)
              |COLOR;+;3$;2| |COLOR;=;2$B;3| |COLOR;red;$;4| |COLOR;yellow;$;5|
              |COLOR;green;$;6| |COLOR;blue;$;7| |COLOR;hue;$I;8|
              (|PositiveInteger|) |COLOR;*;Pi2$;9| |COLOR;numberOfHues;Pi;10|
              |COLOR;color;I$;11| (|String|) (|OutputForm|) (23 . |message|)
              (28 . |coerce|) (33 . |coerce|) (|List| $) (38 . |hconcat|)
              |COLOR;coerce;$Of;12| (|HashState|) (|SingleInteger|))
           '#(~= 43 |yellow| 49 |red| 53 |numberOfHues| 57 |latex| 61 |hue| 66
              |hashUpdate!| 71 |hash| 77 |green| 82 |color| 86 |coerce| 91
              |blue| 96 = 100 + 106 * 112)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|AbelianSemiGroup&| |SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|AbelianSemiGroup|) (|SetCategory|) (|BasicType|)
                           (|CoercibleTo| 27))
                        (|makeByteWordVec2| 35
                                            '(2 7 9 0 0 10 2 11 9 0 0 12 2 7 0
                                              0 0 13 1 7 0 0 14 1 27 0 26 28 1
                                              11 27 0 29 1 7 27 0 30 1 27 0 31
                                              32 2 0 9 0 0 1 0 0 0 18 0 0 0 17
                                              0 0 22 24 1 0 26 0 1 1 0 11 0 21
                                              2 0 34 34 0 1 1 0 35 0 1 0 0 0 19
                                              1 0 0 11 25 1 0 27 0 33 0 0 0 20
                                              2 0 9 0 0 16 2 0 0 0 0 15 2 0 0 7
                                              0 8 2 0 0 22 0 23)))))
           '|lookupComplete|)) 

(MAKEPROP '|Color| 'NILADIC T) 
