
(SDEFUN |OUTFORM;cons_form| ((|x| $) (|l| |List| $) ($ $))
        (SPADCALL |x| |l| (QREFELT $ 7))) 

(PUT '|OUTFORM;print;$V;2| '|SPADreplace| '|mathprint|) 

(SDEFUN |OUTFORM;print;$V;2| ((|x| $) ($ |Void|)) (|mathprint| |x|)) 

(SDEFUN |OUTFORM;message;S$;3| ((|s| |String|) ($ $))
        (COND ((SPADCALL |s| (QREFELT $ 13)) (SPADCALL (QREFELT $ 14)))
              ('T |s|))) 

(SDEFUN |OUTFORM;messagePrint;SV;4| ((|s| |String|) ($ |Void|))
        (SPADCALL (SPADCALL |s| (QREFELT $ 15)) (QREFELT $ 10))) 

(PUT '|OUTFORM;=;2$B;5| '|SPADreplace| 'EQUAL) 

(SDEFUN |OUTFORM;=;2$B;5| ((|a| $) (|b| $) ($ |Boolean|)) (EQUAL |a| |b|)) 

(SDEFUN |OUTFORM;=;3$;6| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '= $) |a| |b|) (QREFELT $ 19))) 

(PUT '|OUTFORM;coerce;2$;7| '|SPADreplace| '(XLAM (|a|) |a|)) 

(SDEFUN |OUTFORM;coerce;2$;7| ((|a| $) ($ |OutputForm|)) |a|) 

(PUT '|OUTFORM;outputForm;I$;8| '|SPADreplace| '(XLAM (|n|) |n|)) 

(SDEFUN |OUTFORM;outputForm;I$;8| ((|n| |Integer|) ($ $)) |n|) 

(PUT '|OUTFORM;outputForm;S$;9| '|SPADreplace| '(XLAM (|e|) |e|)) 

(SDEFUN |OUTFORM;outputForm;S$;9| ((|e| |Symbol|) ($ $)) |e|) 

(PUT '|OUTFORM;sform| '|SPADreplace| '(XLAM (|s|) |s|)) 

(SDEFUN |OUTFORM;sform| ((|s| |String|) ($ $)) |s|) 

(PUT '|OUTFORM;eform| '|SPADreplace| '(XLAM (|e|) |e|)) 

(SDEFUN |OUTFORM;eform| ((|e| |Symbol|) ($ $)) |e|) 

(PUT '|OUTFORM;iform| '|SPADreplace| '(XLAM (|n|) |n|)) 

(SDEFUN |OUTFORM;iform| ((|n| |Integer|) ($ $)) |n|) 

(SDEFUN |OUTFORM;outputForm;S$;13| ((|s| |String|) ($ $))
        (|OUTFORM;sform|
         (SPADCALL (STR_ELT #1="\" " 0)
                   (SPADCALL |s| (STR_ELT #1# 0) (QREFELT $ 28))
                   (QREFELT $ 29))
         $)) 

(PUT '|OUTFORM;width| '|SPADreplace| '|outformWidth|) 

(SDEFUN |OUTFORM;width| ((|a| $) ($ |Integer|)) (|outformWidth| |a|)) 

(PUT '|OUTFORM;width0| '|SPADreplace| '(XLAM NIL 66)) 

(SDEFUN |OUTFORM;width0| (($ |Integer|)) 66) 

(SDEFUN |OUTFORM;center;$I$;16| ((|a| $) (|w| |Integer|) ($ $))
        (SPADCALL
         (SPADCALL (QUOTIENT2 (- |w| (|OUTFORM;width| |a| $)) 2)
                   (QREFELT $ 31))
         |a| (QREFELT $ 32))) 

(SDEFUN |OUTFORM;left;$I$;17| ((|a| $) (|w| |Integer|) ($ $))
        (SPADCALL |a| (SPADCALL (- |w| (|OUTFORM;width| |a| $)) (QREFELT $ 31))
                  (QREFELT $ 32))) 

(SDEFUN |OUTFORM;right;$I$;18| ((|a| $) (|w| |Integer|) ($ $))
        (SPADCALL (SPADCALL (- |w| (|OUTFORM;width| |a| $)) (QREFELT $ 31)) |a|
                  (QREFELT $ 32))) 

(SDEFUN |OUTFORM;center;2$;19| ((|a| $) ($ $))
        (SPADCALL |a| (|OUTFORM;width0| $) (QREFELT $ 33))) 

(SDEFUN |OUTFORM;left;2$;20| ((|a| $) ($ $))
        (SPADCALL |a| (|OUTFORM;width0| $) (QREFELT $ 34))) 

(SDEFUN |OUTFORM;right;2$;21| ((|a| $) ($ $))
        (SPADCALL |a| (|OUTFORM;width0| $) (QREFELT $ 35))) 

(SDEFUN |OUTFORM;vspace;I$;22| ((|n| |Integer|) ($ $))
        (COND ((EQL |n| 0) (SPADCALL (QREFELT $ 14)))
              ('T
               (SPADCALL (|OUTFORM;sform| " " $)
                         (SPADCALL (- |n| 1) (QREFELT $ 39)) (QREFELT $ 40))))) 

(SDEFUN |OUTFORM;hspace;I$;23| ((|n| |Integer|) ($ $))
        (COND ((EQL |n| 0) (SPADCALL (QREFELT $ 14)))
              ('T (|OUTFORM;sform| (|fillerSpaces| |n| " ") $)))) 

(SDEFUN |OUTFORM;rspace;2I$;24| ((|n| |Integer|) (|m| |Integer|) ($ $))
        (COND ((OR (EQL |n| 0) (EQL |m| 0)) (SPADCALL (QREFELT $ 14)))
              ('T
               (SPADCALL (SPADCALL |n| (QREFELT $ 31))
                         (SPADCALL |n| (- |m| 1) (QREFELT $ 41))
                         (QREFELT $ 40))))) 

(SDEFUN |OUTFORM;matrix;L$;25| ((|ll| |List| (|List| $)) ($ $))
        (SPROG ((|lv| (|List| $)) (#1=#:G2309 NIL) (|l| NIL) (#2=#:G2308 NIL))
               (SEQ
                (COND ((NULL |ll|) (SPADCALL NIL (QREFELT $ 42)))
                      ('T
                       (SEQ
                        (LETT |lv|
                              (PROGN
                               (LETT #2# NIL . #3=(|OUTFORM;matrix;L$;25|))
                               (SEQ (LETT |l| NIL . #3#) (LETT #1# |ll| . #3#)
                                    G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |l| (CAR #1#) . #3#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (|OUTFORM;cons_form|
                                              (|OUTFORM;eform| 'ROW $) |l| $)
                                             #2#)
                                            . #3#)))
                                    (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              . #3#)
                        (EXIT
                         (|OUTFORM;cons_form| (|OUTFORM;eform| 'MATRIX $)
                          (SPADCALL (|OUTFORM;eform| 'NIL $) |lv|
                                    (QREFELT $ 7))
                          $)))))))) 

(SDEFUN |OUTFORM;pile;L$;26| ((|l| |List| $) ($ $))
        (|OUTFORM;cons_form| (|OUTFORM;eform| 'SC $) |l| $)) 

(SDEFUN |OUTFORM;commaSeparate;L$;27| ((|l| |List| $) ($ $))
        (|OUTFORM;cons_form| (|OUTFORM;eform| 'AGGLST $) |l| $)) 

(SDEFUN |OUTFORM;semicolonSeparate;L$;28| ((|l| |List| $) ($ $))
        (|OUTFORM;cons_form| (|OUTFORM;eform| 'AGGSET $) |l| $)) 

(SDEFUN |OUTFORM;blankSeparate;L$;29| ((|l| |List| $) ($ $))
        (SPROG
         ((|l1| (|List| $)) (|l2| (|List| $)) (|uo| (|OutputForm|))
          (#1=#:G2318 NIL) (|u| NIL) (|c| ($)))
         (SEQ
          (LETT |c| (|OUTFORM;eform| 'CONCATB $)
                . #2=(|OUTFORM;blankSeparate;L$;29|))
          (LETT |l1| NIL . #2#)
          (SEQ (LETT |u| NIL . #2#)
               (LETT #1# (SPADCALL |l| (QREFELT $ 48)) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |uo| |u| . #2#)
                    (EXIT
                     (COND
                      ((SPADCALL |uo| 'CONCATB (QREFELT $ 50))
                       (SEQ (LETT |l2| (SPADCALL |uo| (QREFELT $ 52)) . #2#)
                            (EXIT
                             (LETT |l1| (SPADCALL |l2| |l1| (QREFELT $ 53))
                                   . #2#))))
                      ('T
                       (LETT |l1| (SPADCALL |u| |l1| (QREFELT $ 7)) . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (|OUTFORM;cons_form| |c| |l1| $))))) 

(SDEFUN |OUTFORM;brace;2$;30| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'BRACE $) |a|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;brace;L$;31| ((|l| |List| $) ($ $))
        (SPADCALL (SPADCALL |l| (QREFELT $ 46)) (QREFELT $ 55))) 

(SDEFUN |OUTFORM;bracket;2$;32| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'BRACKET $) |a|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;bracket;L$;33| ((|l| |List| $) ($ $))
        (SPADCALL (SPADCALL |l| (QREFELT $ 46)) (QREFELT $ 57))) 

(SDEFUN |OUTFORM;paren;2$;34| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'PAREN $) |a|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;paren;L$;35| ((|l| |List| $) ($ $))
        (SPADCALL (SPADCALL |l| (QREFELT $ 46)) (QREFELT $ 58))) 

(SDEFUN |OUTFORM;sub;3$;36| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'SUB $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;super;3$;37| ((|a| $) (|b| $) ($ $))
        (SPADCALL
         (LIST (|OUTFORM;eform| 'SUPERSUB $) |a| (|OUTFORM;sform| " " $) |b|)
         (QREFELT $ 19))) 

(SDEFUN |OUTFORM;presub;3$;38| ((|a| $) (|b| $) ($ $))
        (SPADCALL
         (LIST (|OUTFORM;eform| 'SUPERSUB $) |a| (|OUTFORM;sform| " " $)
               (|OUTFORM;sform| " " $) (|OUTFORM;sform| " " $) |b|)
         (QREFELT $ 19))) 

(SDEFUN |OUTFORM;presuper;3$;39| ((|a| $) (|b| $) ($ $))
        (SPADCALL
         (LIST (|OUTFORM;eform| 'SUPERSUB $) |a| (|OUTFORM;sform| " " $)
               (|OUTFORM;sform| " " $) |b|)
         (QREFELT $ 19))) 

(SDEFUN |OUTFORM;scripts;$L$;40| ((|a| $) (|l| |List| $) ($ $))
        (COND ((SPADCALL |l| (QREFELT $ 64)) |a|)
              ((SPADCALL (SPADCALL |l| (QREFELT $ 65)) (QREFELT $ 64))
               (SPADCALL |a| (SPADCALL |l| (QREFELT $ 66)) (QREFELT $ 60)))
              ('T
               (|OUTFORM;cons_form| (|OUTFORM;eform| 'SUPERSUB $)
                (SPADCALL |a| |l| (QREFELT $ 7)) $)))) 

(SDEFUN |OUTFORM;supersub;$L$;41| ((|a| $) (|l| |List| $) ($ $))
        (SEQ
         (COND
          ((ODDP (SPADCALL |l| (QREFELT $ 69)))
           (LETT |l|
                 (SPADCALL |l| (LIST (SPADCALL (QREFELT $ 14))) (QREFELT $ 70))
                 |OUTFORM;supersub;$L$;41|)))
         (EXIT
          (|OUTFORM;cons_form| (|OUTFORM;eform| 'ALTSUPERSUB $)
           (SPADCALL |a| |l| (QREFELT $ 7)) $)))) 

(SDEFUN |OUTFORM;hconcat;3$;42| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'CONCAT $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;hconcat;L$;43| ((|l| |List| $) ($ $))
        (|OUTFORM;cons_form| (|OUTFORM;eform| 'CONCAT $) |l| $)) 

(SDEFUN |OUTFORM;vconcat;3$;44| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'VCONCAT $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;vconcat;L$;45| ((|l| |List| $) ($ $))
        (|OUTFORM;cons_form| (|OUTFORM;eform| 'VCONCAT $) |l| $)) 

(SDEFUN |OUTFORM;~=;3$;46| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '~= $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;<;3$;47| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '< $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;>;3$;48| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '> $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;<=;3$;49| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '<= $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;>=;3$;50| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '>= $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;+;3$;51| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '+ $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;-;3$;52| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '- $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;-;2$;53| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '- $) |a|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;*;3$;54| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '* $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;/;3$;55| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '/ $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;^;3$;56| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '^ $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;rem;3$;57| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '|rem| $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;quo;3$;58| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '|quo| $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;exquo;3$;59| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '|exquo| $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;and;3$;60| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '|and| $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;or;3$;61| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '|or| $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;not;2$;62| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '|not| $) |a|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;SEGMENT;3$;63| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'SEGMENT $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;SEGMENT;2$;64| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'SEGMENT $) |a|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;binomial;3$;65| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'BINOMIAL $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;empty;$;66| (($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'NOTHING $)) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;infix?;$B;67| ((|a| $) ($ |Boolean|))
        (SPROG ((|e| ($)) (#1=#:G2364 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |e|
                        (COND ((IDENTP |a|) |a|) ((STRINGP |a|) (INTERN |a|))
                              (#2='T
                               (PROGN
                                (LETT #1# NIL . #3=(|OUTFORM;infix?;$B;67|))
                                (GO #4=#:G2363))))
                        . #3#)
                  (EXIT (COND ((GET |e| 'INFIXOP) 'T) (#2# NIL)))))
                #4# (EXIT #1#)))) 

(SDEFUN |OUTFORM;elt;$L$;68| ((|a| $) (|l| |List| $) ($ $))
        (|OUTFORM;cons_form| |a| |l| $)) 

(SDEFUN |OUTFORM;prefix;$L$;69| ((|a| $) (|l| |List| $) ($ $))
        (COND
         ((NULL (SPADCALL |a| (QREFELT $ 94))) (|OUTFORM;cons_form| |a| |l| $))
         ('T
          (SPADCALL |a| (SPADCALL (SPADCALL |l| (QREFELT $ 46)) (QREFELT $ 58))
                    (QREFELT $ 32))))) 

(SDEFUN |OUTFORM;infix;$L$;70| ((|a| $) (|l| |List| $) ($ $))
        (COND ((SPADCALL |l| (QREFELT $ 64)) (SPADCALL (QREFELT $ 14)))
              ((SPADCALL (SPADCALL |l| (QREFELT $ 65)) (QREFELT $ 64))
               (SPADCALL |l| (QREFELT $ 66)))
              ((SPADCALL |a| (QREFELT $ 94)) (|OUTFORM;cons_form| |a| |l| $))
              ('T
               (SPADCALL
                (LIST (SPADCALL |l| (QREFELT $ 66)) |a|
                      (SPADCALL |a| (SPADCALL |l| (QREFELT $ 65))
                                (QREFELT $ 97)))
                (QREFELT $ 72))))) 

(SDEFUN |OUTFORM;infix;4$;71| ((|a| $) (|b| $) (|c| $) ($ $))
        (COND
         ((SPADCALL |a| (QREFELT $ 94))
          (SPADCALL (LIST |a| |b| |c|) (QREFELT $ 19)))
         ('T (SPADCALL (LIST |b| |a| |c|) (QREFELT $ 72))))) 

(SDEFUN |OUTFORM;postfix;3$;72| ((|a| $) (|b| $) ($ $))
        (SPADCALL |b| |a| (QREFELT $ 32))) 

(SDEFUN |OUTFORM;add_prime| ((|a| $) (|s| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'PRIME $) |a| |s|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;quote;2$;74| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'QUOTE $) |a|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;overbar;2$;75| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'OVERBAR $) |a|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;dot;2$;76| ((|a| $) ($ $))
        (SPADCALL |a| (|OUTFORM;sform| "." $) (QREFELT $ 61))) 

(SDEFUN |OUTFORM;prime;2$;77| ((|a| $) ($ $)) (SPADCALL |a| 1 (QREFELT $ 103))) 

(SDEFUN |OUTFORM;dot;$Nni$;78| ((|a| $) (|nn| |NonNegativeInteger|) ($ $))
        (SPROG ((|s| (|String|)))
               (SEQ
                (LETT |s| (|make_full_CVEC| |nn| (|STR_to_CHAR| "."))
                      |OUTFORM;dot;$Nni$;78|)
                (EXIT (SPADCALL |a| (|OUTFORM;sform| |s| $) (QREFELT $ 61)))))) 

(SDEFUN |OUTFORM;prime;$Nni$;79| ((|a| $) (|nn| |NonNegativeInteger|) ($ $))
        (SPROG ((|s| (|String|)))
               (SEQ
                (LETT |s| (|make_full_CVEC| |nn| (|STR_to_CHAR| ","))
                      |OUTFORM;prime;$Nni$;79|)
                (EXIT (|OUTFORM;add_prime| |a| (|OUTFORM;sform| |s| $) $))))) 

(SDEFUN |OUTFORM;overlabel;3$;80| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'OVERLABEL $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;box;2$;81| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'BOX $) |a|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;zag;3$;82| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'ZAG $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;root;2$;83| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'ROOT $) |a|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;root;3$;84| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'ROOT $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;over;3$;85| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'OVER $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;slash;3$;86| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'SLASH $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;assign;3$;87| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'LET $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;label;3$;88| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'EQUATNUM $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;rarrow;3$;89| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'TAG $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;differentiate;$Nni$;90|
        ((|a| $) (|nn| |NonNegativeInteger|) ($ $))
        (SPROG ((|s| (|String|)) (|r| (|String|)) (#1=#:G2396 NIL))
               (SEQ
                (COND ((ZEROP |nn|) |a|)
                      ((< |nn| 4) (SPADCALL |a| |nn| (QREFELT $ 103)))
                      ('T
                       (SEQ
                        (LETT |r|
                              (SPADCALL
                               (PROG1
                                   (LETT #1# |nn|
                                         . #2=(|OUTFORM;differentiate;$Nni$;90|))
                                 (|check_subtype2| (> #1# 0)
                                                   '(|PositiveInteger|)
                                                   '(|NonNegativeInteger|)
                                                   #1#))
                               (QREFELT $ 118))
                              . #2#)
                        (LETT |s| (SPADCALL |r| (QREFELT $ 119)) . #2#)
                        (EXIT
                         (|OUTFORM;add_prime| |a|
                          (SPADCALL (|OUTFORM;sform| |s| $) (QREFELT $ 58))
                          $)))))))) 

(SDEFUN |OUTFORM;sum;2$;91| ((|a| $) ($ $))
        (SPADCALL
         (LIST (|OUTFORM;eform| 'SIGMA $) (SPADCALL (QREFELT $ 14)) |a|)
         (QREFELT $ 19))) 

(SDEFUN |OUTFORM;sum;3$;92| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'SIGMA $) |b| |a|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;sum;4$;93| ((|a| $) (|b| $) (|c| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'SIGMA2 $) |b| |c| |a|)
                  (QREFELT $ 19))) 

(SDEFUN |OUTFORM;prod;2$;94| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'PI $) (SPADCALL (QREFELT $ 14)) |a|)
                  (QREFELT $ 19))) 

(SDEFUN |OUTFORM;prod;3$;95| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'PI $) |b| |a|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;prod;4$;96| ((|a| $) (|b| $) (|c| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'PI2 $) |b| |c| |a|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;int;2$;97| ((|a| $) ($ $))
        (SPADCALL
         (LIST (|OUTFORM;eform| 'INTSIGN $) (SPADCALL (QREFELT $ 14))
               (SPADCALL (QREFELT $ 14)) |a|)
         (QREFELT $ 19))) 

(SDEFUN |OUTFORM;int;3$;98| ((|a| $) (|b| $) ($ $))
        (SPADCALL
         (LIST (|OUTFORM;eform| 'INTSIGN $) |b| (SPADCALL (QREFELT $ 14)) |a|)
         (QREFELT $ 19))) 

(SDEFUN |OUTFORM;int;4$;99| ((|a| $) (|b| $) (|c| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'INTSIGN $) |b| |c| |a|)
                  (QREFELT $ 19))) 

(SDEFUN |OUTFORM;tensor;3$;100| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'TENSOR $) |a| |b|) (QREFELT $ 19))) 

(DECLAIM (NOTINLINE |OutputForm;|)) 

(DEFUN |OutputForm| ()
  (SPROG NIL
         (PROG (#1=#:G2411)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|OutputForm|)
                    . #2=(|OutputForm|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|OutputForm|
                             (LIST (CONS NIL (CONS 1 (|OutputForm;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|OutputForm|)))))))))) 

(DEFUN |OutputForm;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|OutputForm|) . #1=(|OutputForm|))
          (LETT $ (GETREFV 133) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|OutputForm| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 (|SExpression|))
          $))) 

(MAKEPROP '|OutputForm| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|List| $$) (0 . |cons|) '|Rep| (|Void|)
              |OUTFORM;print;$V;2| (|Boolean|) (|String|) (6 . |empty?|)
              |OUTFORM;empty;$;66| |OUTFORM;message;S$;3|
              |OUTFORM;messagePrint;SV;4| |OUTFORM;=;2$B;5| (|List| $)
              (11 . |convert|) |OUTFORM;=;3$;6| (|OutputForm|)
              |OUTFORM;coerce;2$;7| (|Integer|) |OUTFORM;outputForm;I$;8|
              (|Symbol|) |OUTFORM;outputForm;S$;9| (|Character|)
              (16 . |concat|) (22 . |concat|) |OUTFORM;outputForm;S$;13|
              |OUTFORM;hspace;I$;23| |OUTFORM;hconcat;3$;42|
              |OUTFORM;center;$I$;16| |OUTFORM;left;$I$;17|
              |OUTFORM;right;$I$;18| |OUTFORM;center;2$;19|
              |OUTFORM;left;2$;20| |OUTFORM;right;2$;21| |OUTFORM;vspace;I$;22|
              |OUTFORM;vconcat;3$;44| |OUTFORM;rspace;2I$;24|
              |OUTFORM;bracket;L$;33| (|List| 18) |OUTFORM;matrix;L$;25|
              |OUTFORM;pile;L$;26| |OUTFORM;commaSeparate;L$;27|
              |OUTFORM;semicolonSeparate;L$;28| (28 . |reverse|)
              (|OutputFormTools|) (33 . |has_op?|) (|List| 21)
              (39 . |arguments|) (44 . |concat|) |OUTFORM;blankSeparate;L$;29|
              |OUTFORM;brace;2$;30| |OUTFORM;brace;L$;31|
              |OUTFORM;bracket;2$;32| |OUTFORM;paren;2$;34|
              |OUTFORM;paren;L$;35| |OUTFORM;sub;3$;36| |OUTFORM;super;3$;37|
              |OUTFORM;presub;3$;38| |OUTFORM;presuper;3$;39| (50 . |empty?|)
              (55 . |rest|) (60 . |first|) |OUTFORM;scripts;$L$;40|
              (|NonNegativeInteger|) (65 . |#|) (70 . |append|)
              |OUTFORM;supersub;$L$;41| |OUTFORM;hconcat;L$;43|
              |OUTFORM;vconcat;L$;45| |OUTFORM;~=;3$;46| |OUTFORM;<;3$;47|
              |OUTFORM;>;3$;48| |OUTFORM;<=;3$;49| |OUTFORM;>=;3$;50|
              |OUTFORM;+;3$;51| |OUTFORM;-;3$;52| |OUTFORM;-;2$;53|
              |OUTFORM;*;3$;54| |OUTFORM;/;3$;55| |OUTFORM;^;3$;56|
              |OUTFORM;rem;3$;57| |OUTFORM;quo;3$;58| |OUTFORM;exquo;3$;59|
              |OUTFORM;and;3$;60| |OUTFORM;or;3$;61| |OUTFORM;not;2$;62|
              |OUTFORM;SEGMENT;3$;63| |OUTFORM;SEGMENT;2$;64|
              |OUTFORM;binomial;3$;65| |OUTFORM;infix?;$B;67|
              |OUTFORM;elt;$L$;68| |OUTFORM;prefix;$L$;69|
              |OUTFORM;infix;$L$;70| |OUTFORM;infix;4$;71|
              |OUTFORM;postfix;3$;72| |OUTFORM;quote;2$;74|
              |OUTFORM;overbar;2$;75| |OUTFORM;dot;2$;76|
              |OUTFORM;prime;$Nni$;79| |OUTFORM;prime;2$;77|
              |OUTFORM;dot;$Nni$;78| |OUTFORM;overlabel;3$;80|
              |OUTFORM;box;2$;81| |OUTFORM;zag;3$;82| |OUTFORM;root;2$;83|
              |OUTFORM;root;3$;84| |OUTFORM;over;3$;85| |OUTFORM;slash;3$;86|
              |OUTFORM;assign;3$;87| |OUTFORM;label;3$;88|
              |OUTFORM;rarrow;3$;89| (|PositiveInteger|) (|NumberFormats|)
              (76 . |FormatRoman|) (81 . |lowerCase|)
              |OUTFORM;differentiate;$Nni$;90| |OUTFORM;sum;2$;91|
              |OUTFORM;sum;3$;92| |OUTFORM;sum;4$;93| |OUTFORM;prod;2$;94|
              |OUTFORM;prod;3$;95| |OUTFORM;prod;4$;96| |OUTFORM;int;2$;97|
              |OUTFORM;int;3$;98| |OUTFORM;int;4$;99| |OUTFORM;tensor;3$;100|
              (|HashState|) (|SingleInteger|))
           '#(~= 86 |zag| 98 |vspace| 104 |vconcat| 109 |tensor| 120 |supersub|
              126 |super| 132 |sum| 138 |sub| 156 |slash| 162
              |semicolonSeparate| 168 |scripts| 173 |rspace| 179 |root| 185
              |right| 196 |rem| 207 |rarrow| 213 |quote| 219 |quo| 224 |prod|
              230 |print| 248 |prime| 253 |presuper| 264 |presub| 270 |prefix|
              276 |postfix| 282 |pile| 288 |paren| 293 |overlabel| 303
              |overbar| 309 |over| 314 |outputForm| 320 |or| 335 |not| 341
              |messagePrint| 346 |message| 351 |matrix| 356 |left| 361 |latex|
              372 |label| 377 |int| 383 |infix?| 401 |infix| 406 |hspace| 419
              |hconcat| 424 |hashUpdate!| 435 |hash| 441 |exquo| 446 |empty|
              452 |elt| 456 |dot| 462 |differentiate| 473 |commaSeparate| 479
              |coerce| 484 |center| 489 |bracket| 500 |brace| 510 |box| 520
              |blankSeparate| 525 |binomial| 530 |assign| 536 |and| 542 ^ 548
              SEGMENT 554 >= 565 > 571 = 577 <= 589 < 595 / 601 - 607 + 618 *
              624)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 21))
                        (|makeByteWordVec2| 132
                                            '(2 6 0 2 0 7 1 12 11 0 13 1 8 0 18
                                              19 2 12 0 0 27 28 2 12 0 27 0 29
                                              1 6 0 0 48 2 49 11 21 25 50 1 49
                                              51 21 52 2 6 0 0 0 53 1 6 11 0 64
                                              1 6 0 0 65 1 6 2 0 66 1 6 68 0 69
                                              2 6 0 0 0 70 1 117 12 116 118 1
                                              12 0 0 119 2 0 0 0 0 74 2 0 11 0
                                              0 1 2 0 0 0 0 108 1 0 0 23 39 1 0
                                              0 18 73 2 0 0 0 0 40 2 0 0 0 0
                                              130 2 0 0 0 18 71 2 0 0 0 0 61 3
                                              0 0 0 0 0 123 1 0 0 0 121 2 0 0 0
                                              0 122 2 0 0 0 0 60 2 0 0 0 0 112
                                              1 0 0 18 47 2 0 0 0 18 67 2 0 0
                                              23 23 41 2 0 0 0 0 110 1 0 0 0
                                              109 1 0 0 0 38 2 0 0 0 23 35 2 0
                                              0 0 0 85 2 0 0 0 0 115 1 0 0 0
                                              100 2 0 0 0 0 86 3 0 0 0 0 0 126
                                              1 0 0 0 124 2 0 0 0 0 125 1 0 9 0
                                              10 2 0 0 0 68 103 1 0 0 0 104 2 0
                                              0 0 0 63 2 0 0 0 0 62 2 0 0 0 18
                                              96 2 0 0 0 0 99 1 0 0 18 45 1 0 0
                                              18 59 1 0 0 0 58 2 0 0 0 0 106 1
                                              0 0 0 101 2 0 0 0 0 111 1 0 0 25
                                              26 1 0 0 12 30 1 0 0 23 24 2 0 0
                                              0 0 89 1 0 0 0 90 1 0 9 12 16 1 0
                                              0 12 15 1 0 0 43 44 1 0 0 0 37 2
                                              0 0 0 23 34 1 0 12 0 1 2 0 0 0 0
                                              114 3 0 0 0 0 0 129 1 0 0 0 127 2
                                              0 0 0 0 128 1 0 11 0 94 3 0 0 0 0
                                              0 98 2 0 0 0 18 97 1 0 0 23 31 1
                                              0 0 18 72 2 0 0 0 0 32 2 0 131
                                              131 0 1 1 0 132 0 1 2 0 0 0 0 87
                                              0 0 0 14 2 0 0 0 18 95 1 0 0 0
                                              102 2 0 0 0 68 105 2 0 0 0 68 120
                                              1 0 0 18 46 1 0 21 0 22 1 0 0 0
                                              36 2 0 0 0 23 33 1 0 0 18 42 1 0
                                              0 0 57 1 0 0 0 55 1 0 0 18 56 1 0
                                              0 0 107 1 0 0 18 54 2 0 0 0 0 93
                                              2 0 0 0 0 113 2 0 0 0 0 88 2 0 0
                                              0 0 84 1 0 0 0 92 2 0 0 0 0 91 2
                                              0 0 0 0 78 2 0 0 0 0 76 2 0 0 0 0
                                              20 2 0 11 0 0 17 2 0 0 0 0 77 2 0
                                              0 0 0 75 2 0 0 0 0 83 1 0 0 0 81
                                              2 0 0 0 0 80 2 0 0 0 0 79 2 0 0 0
                                              0 82)))))
           '|lookupComplete|)) 

(MAKEPROP '|OutputForm| 'NILADIC T) 
