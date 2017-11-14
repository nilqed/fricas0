
(SDEFUN |COMPUTIL;Ski2Lambda| ((|s| |SKICombinators| UT) ($ |Lambda| UT))
        (SPROG
         ((#1=#:G756 NIL) (|s112| #2=(|String|)) (|s12| #2#)
          (|s2| #3=(|String|)) (|c112| #4=(|SKICombinators| UT))
          (|c111| #5=(|SKICombinators| UT))
          (|subsubnodes2| #6=(|List| (|SKICombinators| UT))) (|c12| #4#)
          (|c11| #5#) (|subsubnodes| #6#) (|s1| #3#) (|c2| #4#) (|c1| #5#)
          (|subnodes| #6#) (|strVar3| #7=(|String|)) (|strVar2| #7#)
          (|strVar1| #7#) (|strVar| #7#))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |s| (QREFELT $ 10))
              (SEQ
               (COND
                ((SPADCALL |s| (QREFELT $ 11))
                 (SEQ
                  (LETT |strVar| (STRCONC "v" (STRINGIMAGE (QREFELT $ 7)))
                        . #8=(|COMPUTIL;Ski2Lambda|))
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL "util coerce rule SL1: Ski[I] = \\"
                               (QREFELT $ 14))
                     (SPADCALL |strVar| (QREFELT $ 14)) (QREFELT $ 15))
                    (SPADCALL ".0" (QREFELT $ 14)) (QREFELT $ 15))
                   (QREFELT $ 17))
                  (SETELT $ 7 (+ (QREFELT $ 7) 1))
                  (EXIT
                   (PROGN
                    (LETT #1#
                          (SPADCALL
                           (SPADCALL (LIST "\\" |strVar| ".0") (QREFELT $ 19))
                           (QREFELT $ 21))
                          . #8#)
                    (GO #9=#:G755))))))
               (COND
                ((SPADCALL |s| (QREFELT $ 22))
                 (SEQ
                  (LETT |strVar1| (STRCONC "v" (STRINGIMAGE (QREFELT $ 7)))
                        . #8#)
                  (LETT |strVar2|
                        (STRCONC "v" (STRINGIMAGE (+ (QREFELT $ 7) 1))) . #8#)
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL "util coerce rule SL2: Ski[K] = \\"
                                 (QREFELT $ 14))
                       (SPADCALL |strVar1| (QREFELT $ 14)) (QREFELT $ 15))
                      (SPADCALL ".\\" (QREFELT $ 14)) (QREFELT $ 15))
                     (SPADCALL |strVar2| (QREFELT $ 14)) (QREFELT $ 15))
                    (SPADCALL ".1" (QREFELT $ 14)) (QREFELT $ 15))
                   (QREFELT $ 17))
                  (SETELT $ 7 (+ (QREFELT $ 7) 2))
                  (EXIT
                   (PROGN
                    (LETT #1#
                          (SPADCALL
                           (SPADCALL (LIST "\\" |strVar1| ".\\" |strVar2| ".1")
                                     (QREFELT $ 19))
                           (QREFELT $ 21))
                          . #8#)
                    (GO #9#))))))
               (COND
                ((SPADCALL |s| (QREFELT $ 23))
                 (SEQ
                  (LETT |strVar1| (STRCONC "v" (STRINGIMAGE (QREFELT $ 7)))
                        . #8#)
                  (LETT |strVar2|
                        (STRCONC "v" (STRINGIMAGE (+ (QREFELT $ 7) 1))) . #8#)
                  (LETT |strVar3|
                        (STRCONC "v" (STRINGIMAGE (+ (QREFELT $ 7) 2))) . #8#)
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL "util coerce rule SL3: Ski[S] = \\"
                                   (QREFELT $ 14))
                         (SPADCALL |strVar1| (QREFELT $ 14)) (QREFELT $ 15))
                        (SPADCALL ".\\" (QREFELT $ 14)) (QREFELT $ 15))
                       (SPADCALL |strVar2| (QREFELT $ 14)) (QREFELT $ 15))
                      (SPADCALL ".\\" (QREFELT $ 14)) (QREFELT $ 15))
                     (SPADCALL |strVar3| (QREFELT $ 14)) (QREFELT $ 15))
                    (SPADCALL ".(2 0 (1 0))" (QREFELT $ 14)) (QREFELT $ 15))
                   (QREFELT $ 17))
                  (SETELT $ 7 (+ (QREFELT $ 7) 3))
                  (EXIT
                   (PROGN
                    (LETT #1#
                          (SPADCALL
                           (SPADCALL
                            (LIST "\\" |strVar1| ".\\" |strVar2| ".\\"
                                  |strVar3| ".(2 0 (1 0))")
                            (QREFELT $ 19))
                           (QREFELT $ 21))
                          . #8#)
                    (GO #9#))))))
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL "util coerce pass unbound variable "
                            (QREFELT $ 14))
                  (SPADCALL
                   (SPADCALL (SPADCALL |s| (QREFELT $ 24)) (QREFELT $ 25))
                   (QREFELT $ 14))
                  (QREFELT $ 15))
                 (SPADCALL " unchanged" (QREFELT $ 14)) (QREFELT $ 15))
                (QREFELT $ 17))
               (EXIT
                (PROGN
                 (LETT #1#
                       (SPADCALL (SPADCALL |s| (QREFELT $ 24)) (QREFELT $ 26))
                       . #8#)
                 (GO #9#))))))
            (LETT |subnodes| (SPADCALL |s| (QREFELT $ 27)) . #8#)
            (LETT |c1| (|SPADfirst| |subnodes|) . #8#)
            (LETT |c2| (SPADCALL |subnodes| (QREFELT $ 29)) . #8#)
            (LETT |s1| (SPADCALL |c1| (QREFELT $ 30)) . #8#)
            (LETT |s2| (SPADCALL |c2| (QREFELT $ 30)) . #8#)
            (COND
             ((SPADCALL |c1| (QREFELT $ 11))
              (SEQ
               (SPADCALL
                (SPADCALL
                 (SPADCALL "util coerce apply rule SL1 in:" (QREFELT $ 14))
                 (SPADCALL |s| (QREFELT $ 31)) (QREFELT $ 15))
                (QREFELT $ 17))
               (EXIT
                (PROGN
                 (LETT #1# (|COMPUTIL;Ski2Lambda| |c2| $) . #8#)
                 (GO #9#))))))
            (COND
             ((SPADCALL |c1| (QREFELT $ 10))
              (SEQ
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL "util coerce rule SL4: Ski[(" (QREFELT $ 14))
                        (SPADCALL |s1| (QREFELT $ 14)) (QREFELT $ 15))
                       (SPADCALL " " (QREFELT $ 14)) (QREFELT $ 15))
                      (SPADCALL |s2| (QREFELT $ 14)) (QREFELT $ 15))
                     (SPADCALL ")] = (Ski[" (QREFELT $ 14)) (QREFELT $ 15))
                    (SPADCALL |s1| (QREFELT $ 14)) (QREFELT $ 15))
                   (SPADCALL "] Ski[" (QREFELT $ 14)) (QREFELT $ 15))
                  (SPADCALL |s2| (QREFELT $ 14)) (QREFELT $ 15))
                 (SPADCALL "])" (QREFELT $ 14)) (QREFELT $ 15))
                (QREFELT $ 17))
               (EXIT
                (PROGN
                 (LETT #1#
                       (SPADCALL (|COMPUTIL;Ski2Lambda| |c1| $)
                                 (|COMPUTIL;Ski2Lambda| |c2| $) (QREFELT $ 32))
                       . #8#)
                 (GO #9#))))))
            (LETT |subsubnodes| (SPADCALL |c1| (QREFELT $ 27)) . #8#)
            (LETT |c11| (|SPADfirst| |subsubnodes|) . #8#)
            (LETT |c12| (SPADCALL |subsubnodes| (QREFELT $ 29)) . #8#)
            (COND
             ((SPADCALL |c11| (QREFELT $ 22))
              (SEQ
               (LETT |s12|
                     (SPADCALL (SPADCALL |c12| (QREFELT $ 24)) (QREFELT $ 25))
                     . #8#)
               (SPADCALL
                (SPADCALL
                 (SPADCALL "util coerce apply rule SL2 in:" (QREFELT $ 14))
                 (SPADCALL |s| (QREFELT $ 31)) (QREFELT $ 15))
                (QREFELT $ 17))
               (EXIT
                (PROGN
                 (LETT #1# (|COMPUTIL;Ski2Lambda| |c12| $) . #8#)
                 (GO #9#))))))
            (COND
             ((SPADCALL |c11| (QREFELT $ 10))
              (SEQ
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL "util coerce rule SL4: Ski[(" (QREFELT $ 14))
                        (SPADCALL |s1| (QREFELT $ 14)) (QREFELT $ 15))
                       (SPADCALL " " (QREFELT $ 14)) (QREFELT $ 15))
                      (SPADCALL |s2| (QREFELT $ 14)) (QREFELT $ 15))
                     (SPADCALL ")] = (Ski[" (QREFELT $ 14)) (QREFELT $ 15))
                    (SPADCALL |s1| (QREFELT $ 14)) (QREFELT $ 15))
                   (SPADCALL "] Ski[" (QREFELT $ 14)) (QREFELT $ 15))
                  (SPADCALL |s2| (QREFELT $ 14)) (QREFELT $ 15))
                 (SPADCALL "])" (QREFELT $ 14)) (QREFELT $ 15))
                (QREFELT $ 17))
               (EXIT
                (PROGN
                 (LETT #1#
                       (SPADCALL (|COMPUTIL;Ski2Lambda| |c1| $)
                                 (|COMPUTIL;Ski2Lambda| |c2| $) (QREFELT $ 32))
                       . #8#)
                 (GO #9#))))))
            (LETT |subsubnodes2| (SPADCALL |c11| (QREFELT $ 27)) . #8#)
            (LETT |c111| (|SPADfirst| |subsubnodes2|) . #8#)
            (LETT |c112| (SPADCALL |subsubnodes2| (QREFELT $ 29)) . #8#)
            (COND
             ((SPADCALL |c111| (QREFELT $ 23))
              (SEQ
               (LETT |s2|
                     (SPADCALL (SPADCALL |c2| (QREFELT $ 24)) (QREFELT $ 25))
                     . #8#)
               (LETT |s12|
                     (SPADCALL (SPADCALL |c12| (QREFELT $ 24)) (QREFELT $ 25))
                     . #8#)
               (LETT |s112|
                     (SPADCALL (SPADCALL |c112| (QREFELT $ 24)) (QREFELT $ 25))
                     . #8#)
               (SPADCALL
                (SPADCALL
                 (SPADCALL "util coerce apply rule SL3 in:" (QREFELT $ 14))
                 (SPADCALL |s| (QREFELT $ 31)) (QREFELT $ 15))
                (QREFELT $ 17))
               (EXIT
                (PROGN
                 (LETT #1#
                       (SPADCALL
                        (SPADCALL (|COMPUTIL;Ski2Lambda| |c112| $)
                                  (|COMPUTIL;Ski2Lambda| |c2| $)
                                  (QREFELT $ 32))
                        (SPADCALL (|COMPUTIL;Ski2Lambda| |c12| $)
                                  (|COMPUTIL;Ski2Lambda| |c2| $)
                                  (QREFELT $ 32))
                        (QREFELT $ 32))
                       . #8#)
                 (GO #9#))))))
            (SPADCALL
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL "util coerce rule SL4: Ski[(" (QREFELT $ 14))
                     (SPADCALL |s1| (QREFELT $ 14)) (QREFELT $ 15))
                    (SPADCALL " " (QREFELT $ 14)) (QREFELT $ 15))
                   (SPADCALL |s2| (QREFELT $ 14)) (QREFELT $ 15))
                  (SPADCALL ")] = (Ski[" (QREFELT $ 14)) (QREFELT $ 15))
                 (SPADCALL |s1| (QREFELT $ 14)) (QREFELT $ 15))
                (SPADCALL "] Ski[" (QREFELT $ 14)) (QREFELT $ 15))
               (SPADCALL |s2| (QREFELT $ 14)) (QREFELT $ 15))
              (SPADCALL "])" (QREFELT $ 14)) (QREFELT $ 15))
             (QREFELT $ 17))
            (EXIT
             (SPADCALL (|COMPUTIL;Ski2Lambda| |c1| $)
                       (|COMPUTIL;Ski2Lambda| |c2| $) (QREFELT $ 32)))))
          #9# (EXIT #1#)))) 

(SDEFUN |COMPUTIL;coerce;SkicL;2| ((|s| |SKICombinators| UT) ($ |Lambda| UT))
        (SPROG ((|term| (|Lambda| UT)))
               (SEQ (SETELT $ 7 0)
                    (LETT |term| (|COMPUTIL;Ski2Lambda| |s| $)
                          |COMPUTIL;coerce;SkicL;2|)
                    (EXIT |term|)))) 

(SDEFUN |COMPUTIL;lambdaOverSki|
        ((|var| UT) (|sk| |SKICombinators| UT) ($ |SKICombinators| UT))
        (SPROG
         ((#1=#:G767 NIL) (|right| (|SKICombinators| UT))
          (|left| (|SKICombinators| UT)) (|ch| (|List| (|SKICombinators| UT))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |sk| (QREFELT $ 10))
              (SEQ
               (COND
                ((SPADCALL |sk| |var| (QREFELT $ 34))
                 (SEQ
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL "util coerce rule LS3' applied to: \\"
                                  (QREFELT $ 14))
                        (SPADCALL |var| (QREFELT $ 35)) (QREFELT $ 15))
                       (SPADCALL "." (QREFELT $ 14)) (QREFELT $ 15))
                      (SPADCALL |sk| (QREFELT $ 31)) (QREFELT $ 15))
                     (SPADCALL " giving K " (QREFELT $ 14)) (QREFELT $ 15))
                    (SPADCALL |sk| (QREFELT $ 31)) (QREFELT $ 15))
                   (QREFELT $ 17))
                  (EXIT
                   (PROGN
                    (LETT #1#
                          (SPADCALL (SPADCALL (QREFELT $ 36)) |sk|
                                    (QREFELT $ 37))
                          . #2=(|COMPUTIL;lambdaOverSki|))
                    (GO #3=#:G766))))))
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL "util coerce rule LS4' applied to: \\"
                              (QREFELT $ 14))
                    (SPADCALL |var| (QREFELT $ 35)) (QREFELT $ 15))
                   (SPADCALL "." (QREFELT $ 14)) (QREFELT $ 15))
                  (SPADCALL |sk| (QREFELT $ 31)) (QREFELT $ 15))
                 (SPADCALL " giving I" (QREFELT $ 14)) (QREFELT $ 15))
                (QREFELT $ 17))
               (EXIT
                (PROGN (LETT #1# (SPADCALL (QREFELT $ 38)) . #2#) (GO #3#))))))
            (LETT |ch| (SPADCALL |sk| (QREFELT $ 27)) . #2#)
            (LETT |left| (|SPADfirst| |ch|) . #2#)
            (LETT |right| (SPADCALL |ch| (QREFELT $ 29)) . #2#)
            (COND
             ((SPADCALL |sk| |var| (QREFELT $ 34))
              (SEQ
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL "util coerce rule LS3' applied to: \\"
                                     (QREFELT $ 14))
                           (SPADCALL |var| (QREFELT $ 35)) (QREFELT $ 15))
                          (SPADCALL "." (QREFELT $ 14)) (QREFELT $ 15))
                         (SPADCALL |sk| (QREFELT $ 31)) (QREFELT $ 15))
                        (SPADCALL " giving K \\" (QREFELT $ 14))
                        (QREFELT $ 15))
                       (SPADCALL |var| (QREFELT $ 35)) (QREFELT $ 15))
                      (SPADCALL "." (QREFELT $ 14)) (QREFELT $ 15))
                     (SPADCALL |left| (QREFELT $ 31)) (QREFELT $ 15))
                    (SPADCALL " \\" (QREFELT $ 14)) (QREFELT $ 15))
                   (SPADCALL |var| (QREFELT $ 35)) (QREFELT $ 15))
                  (SPADCALL "." (QREFELT $ 14)) (QREFELT $ 15))
                 (SPADCALL |right| (QREFELT $ 31)) (QREFELT $ 15))
                (QREFELT $ 17))
               (EXIT
                (PROGN
                 (LETT #1#
                       (SPADCALL (SPADCALL (QREFELT $ 36))
                                 (SPADCALL |left| |right| (QREFELT $ 37))
                                 (QREFELT $ 37))
                       . #2#)
                 (GO #3#))))))
            (SPADCALL
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL "util coerce rule LS5' applied to: \\"
                                  (QREFELT $ 14))
                        (SPADCALL |var| (QREFELT $ 35)) (QREFELT $ 15))
                       (SPADCALL "." (QREFELT $ 14)) (QREFELT $ 15))
                      (SPADCALL |sk| (QREFELT $ 31)) (QREFELT $ 15))
                     (SPADCALL " giving S \\" (QREFELT $ 14)) (QREFELT $ 15))
                    (SPADCALL |var| (QREFELT $ 35)) (QREFELT $ 15))
                   (SPADCALL "." (QREFELT $ 14)) (QREFELT $ 15))
                  (SPADCALL |left| (QREFELT $ 31)) (QREFELT $ 15))
                 (SPADCALL " \\" (QREFELT $ 14)) (QREFELT $ 15))
                (SPADCALL |var| (QREFELT $ 35)) (QREFELT $ 15))
               (SPADCALL "." (QREFELT $ 14)) (QREFELT $ 15))
              (SPADCALL |right| (QREFELT $ 31)) (QREFELT $ 15))
             (QREFELT $ 17))
            (EXIT
             (PROGN
              (LETT #1#
                    (SPADCALL
                     (SPADCALL (SPADCALL (QREFELT $ 39))
                               (|COMPUTIL;lambdaOverSki| |var| |left| $)
                               (QREFELT $ 37))
                     (|COMPUTIL;lambdaOverSki| |var| |right| $) (QREFELT $ 37))
                    . #2#)
              (GO #3#)))))
          #3# (EXIT #1#)))) 

(SDEFUN |COMPUTIL;coerce;LSkic;4| ((|lam| |Lambda| UT) ($ |SKICombinators| UT))
        (SPROG
         ((#1=#:G784 NIL) (|c32| #2=(|Lambda| UT)) (|c31| #3=(|Lambda| UT))
          (|ch3| #4=(|List| (|Lambda| UT))) (|cxx| (|Lambda| UT)) (|c33| #3#)
          (|s3| (UT)) (|c3| #3#) (|lamUn| (|Lambda| UT)) (|c2| #2#) (|c1| #3#)
          (|ch| #4#))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |lam| (QREFELT $ 40))
              (SEQ
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL "util coerce rule LS1 applied to:" (QREFELT $ 14))
                   (SPADCALL |lam| (QREFELT $ 41)) (QREFELT $ 15))
                  (SPADCALL " giving " (QREFELT $ 14)) (QREFELT $ 15))
                 (SPADCALL |lam| (QREFELT $ 41)) (QREFELT $ 15))
                (QREFELT $ 17))
               (EXIT
                (PROGN
                 (LETT #1#
                       (SPADCALL
                        (SPADCALL (SPADCALL |lam| (QREFELT $ 42))
                                  (QREFELT $ 43))
                        (QREFELT $ 44))
                       . #5=(|COMPUTIL;coerce;LSkic;4|))
                 (GO #6=#:G783))))))
            (COND
             ((SPADCALL |lam| (QREFELT $ 45))
              (SEQ (LETT |ch| (SPADCALL |lam| (QREFELT $ 46)) . #5#)
                   (LETT |c1| (|SPADfirst| |ch|) . #5#)
                   (LETT |c2| (SPADCALL |ch| (QREFELT $ 48)) . #5#)
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL "util coerce rule LS2 applied to:"
                                    (QREFELT $ 14))
                          (SPADCALL |lam| (QREFELT $ 41)) (QREFELT $ 15))
                         (SPADCALL " giving (" (QREFELT $ 14)) (QREFELT $ 15))
                        (SPADCALL |c1| (QREFELT $ 41)) (QREFELT $ 15))
                       (SPADCALL " " (QREFELT $ 14)) (QREFELT $ 15))
                      (SPADCALL |c2| (QREFELT $ 41)) (QREFELT $ 15))
                     (SPADCALL ")" (QREFELT $ 14)) (QREFELT $ 15))
                    (QREFELT $ 17))
                   (EXIT
                    (PROGN
                     (LETT #1#
                           (SPADCALL (SPADCALL |c1| (QREFELT $ 49))
                                     (SPADCALL |c2| (QREFELT $ 49))
                                     (QREFELT $ 37))
                           . #5#)
                     (GO #6#))))))
            (COND
             ((SPADCALL |lam| (QREFELT $ 50))
              (SEQ (LETT |lamUn| (SPADCALL |lam| (QREFELT $ 51)) . #5#)
                   (LETT |c3| (|SPADfirst| (SPADCALL |lamUn| (QREFELT $ 46)))
                         . #5#)
                   (LETT |s3| (SPADCALL |lam| (QREFELT $ 52)) . #5#)
                   (COND
                    ((SPADCALL |c3| (QREFELT $ 40))
                     (COND
                      ((EQUAL (SPADCALL |c3| (QREFELT $ 42)) "0")
                       (SEQ
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL "util coerce rule LS4 applied to:"
                                     (QREFELT $ 14))
                           (SPADCALL |lam| (QREFELT $ 41)) (QREFELT $ 15))
                          (SPADCALL " giving I" (QREFELT $ 14)) (QREFELT $ 15))
                         (QREFELT $ 17))
                        (EXIT
                         (PROGN
                          (LETT #1# (SPADCALL (QREFELT $ 38)) . #5#)
                          (GO #6#))))))))
                   (COND
                    ((SPADCALL |lam| (QREFELT $ 53))
                     (SEQ
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL "util coerce rule LS3 applied to:"
                                    (QREFELT $ 14))
                          (SPADCALL |lam| (QREFELT $ 41)) (QREFELT $ 15))
                         (SPADCALL " giving K " (QREFELT $ 14)) (QREFELT $ 15))
                        (SPADCALL |c3| (QREFELT $ 41)) (QREFELT $ 15))
                       (QREFELT $ 17))
                      (EXIT
                       (PROGN
                        (LETT #1#
                              (SPADCALL (SPADCALL (QREFELT $ 36))
                                        (SPADCALL |c3| (QREFELT $ 49))
                                        (QREFELT $ 37))
                              . #5#)
                        (GO #6#))))))
                   (COND
                    ((SPADCALL |c3| (QREFELT $ 50))
                     (SEQ
                      (LETT |c33| (|SPADfirst| (SPADCALL |c3| (QREFELT $ 46)))
                            . #5#)
                      (LETT |cxx|
                            (SPADCALL |c33| (SPADCALL |c3| (QREFELT $ 52))
                                      (QREFELT $ 54))
                            . #5#)
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL "util coerce rule LS5 applied to:"
                                      (QREFELT $ 14))
                            (SPADCALL |lam| (QREFELT $ 41)) (QREFELT $ 15))
                           (SPADCALL " giving \\" (QREFELT $ 14))
                           (QREFELT $ 15))
                          (SPADCALL |s3| (QREFELT $ 35)) (QREFELT $ 15))
                         (SPADCALL "." (QREFELT $ 14)) (QREFELT $ 15))
                        (SPADCALL |cxx| (QREFELT $ 41)) (QREFELT $ 15))
                       (QREFELT $ 17))
                      (EXIT
                       (PROGN
                        (LETT #1#
                              (|COMPUTIL;lambdaOverSki| |s3|
                               (SPADCALL |cxx| (QREFELT $ 49)) $)
                              . #5#)
                        (GO #6#))))))
                   (EXIT
                    (COND
                     ((SPADCALL |c3| (QREFELT $ 45))
                      (SEQ (LETT |ch3| (SPADCALL |c3| (QREFELT $ 46)) . #5#)
                           (LETT |c31| (|SPADfirst| |ch3|) . #5#)
                           (LETT |c32| (SPADCALL |ch3| (QREFELT $ 48)) . #5#)
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL
                                      "util coerce rule LS6 applied to:"
                                      (QREFELT $ 14))
                                     (SPADCALL |lam| (QREFELT $ 41))
                                     (QREFELT $ 15))
                                    (SPADCALL " giving S \\" (QREFELT $ 14))
                                    (QREFELT $ 15))
                                   (SPADCALL |s3| (QREFELT $ 35))
                                   (QREFELT $ 15))
                                  (SPADCALL "." (QREFELT $ 14)) (QREFELT $ 15))
                                 (SPADCALL |c31| (QREFELT $ 41))
                                 (QREFELT $ 15))
                                (SPADCALL " \\" (QREFELT $ 14)) (QREFELT $ 15))
                               (SPADCALL |s3| (QREFELT $ 35)) (QREFELT $ 15))
                              (SPADCALL "." (QREFELT $ 14)) (QREFELT $ 15))
                             (SPADCALL |c32| (QREFELT $ 41)) (QREFELT $ 15))
                            (QREFELT $ 17))
                           (EXIT
                            (PROGN
                             (LETT #1#
                                   (SPADCALL
                                    (SPADCALL (SPADCALL (QREFELT $ 39))
                                              (|COMPUTIL;lambdaOverSki| |s3|
                                               (SPADCALL |c31| (QREFELT $ 49))
                                               $)
                                              (QREFELT $ 37))
                                    (|COMPUTIL;lambdaOverSki| |s3|
                                     (SPADCALL |c32| (QREFELT $ 49)) $)
                                    (QREFELT $ 37))
                                   . #5#)
                             (GO #6#))))))))))
            (SPADCALL
             (SPADCALL
              (SPADCALL "util coerce warning could not match any rule to:"
                        (QREFELT $ 14))
              (SPADCALL |lam| (QREFELT $ 41)) (QREFELT $ 15))
             (QREFELT $ 17))
            (EXIT (SPADCALL (QREFELT $ 38)))))
          #6# (EXIT #1#)))) 

(SDEFUN |COMPUTIL;coerce;SkicIl;5| ((|s| |SKICombinators| UT) ($ |ILogic|))
        (SPROG
         ((#1=#:G803 NIL) (|bc| #2=(|ILogic|)) (|ac| #2#) (|ab| #2#)
          (|c| #3=(|ILogic|)) (|b| #3#) (|a| #3#)
          (|c112| #4=(|SKICombinators| UT)) (|c111| #5=(|SKICombinators| UT))
          (|subsubnodes2| #6=(|List| (|SKICombinators| UT))) (|c12| #4#)
          (|c11| #5#) (|subsubnodes| #6#) (|c2| #4#) (|c1| #5#)
          (|subnodes| #6#))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |s| (QREFELT $ 10))
              (SEQ
               (COND
                ((SPADCALL |s| (QREFELT $ 11))
                 (SEQ
                  (SPADCALL
                   (SPADCALL "warning I does not have a parameter to act on"
                             (QREFELT $ 14))
                   (QREFELT $ 17))
                  (SPADCALL (SPADCALL "creating x" (QREFELT $ 14))
                            (QREFELT $ 17))
                  (LETT |a| (SPADCALL "x" (QREFELT $ 56))
                        . #7=(|COMPUTIL;coerce;SkicIl;5|))
                  (EXIT
                   (PROGN
                    (LETT #1# (SPADCALL |a| |a| (QREFELT $ 57)) . #7#)
                    (GO #8=#:G802))))))
               (COND
                ((SPADCALL |s| (QREFELT $ 22))
                 (SEQ
                  (SPADCALL
                   (SPADCALL "warning K does not enough parameters to act on"
                             (QREFELT $ 14))
                   (QREFELT $ 17))
                  (SPADCALL (SPADCALL "creating x and y" (QREFELT $ 14))
                            (QREFELT $ 17))
                  (LETT |a| (SPADCALL "x" (QREFELT $ 56)) . #7#)
                  (LETT |b| (SPADCALL "y" (QREFELT $ 56)) . #7#)
                  (EXIT
                   (PROGN
                    (LETT #1#
                          (SPADCALL |a| (SPADCALL |b| |a| (QREFELT $ 57))
                                    (QREFELT $ 57))
                          . #7#)
                    (GO #8#))))))
               (COND
                ((SPADCALL |s| (QREFELT $ 23))
                 (SEQ
                  (SPADCALL
                   (SPADCALL "warning S does not enough parameters to act on"
                             (QREFELT $ 14))
                   (QREFELT $ 17))
                  (SPADCALL (SPADCALL "creating x,y and z" (QREFELT $ 14))
                            (QREFELT $ 17))
                  (LETT |a| (SPADCALL "x" (QREFELT $ 56)) . #7#)
                  (LETT |b| (SPADCALL "y" (QREFELT $ 56)) . #7#)
                  (LETT |c| (SPADCALL "z" (QREFELT $ 56)) . #7#)
                  (LETT |ab| (SPADCALL |a| |b| (QREFELT $ 57)) . #7#)
                  (LETT |ac| (SPADCALL |a| |c| (QREFELT $ 57)) . #7#)
                  (LETT |bc| (SPADCALL |b| |c| (QREFELT $ 57)) . #7#)
                  (EXIT
                   (PROGN
                    (LETT #1#
                          (SPADCALL (SPADCALL |a| |bc| (QREFELT $ 57))
                                    (SPADCALL |ab| |ac| (QREFELT $ 57))
                                    (QREFELT $ 57))
                          . #7#)
                    (GO #8#))))))
               (EXIT
                (PROGN
                 (LETT #1#
                       (SPADCALL
                        (SPADCALL (SPADCALL |s| (QREFELT $ 24)) (QREFELT $ 25))
                        (QREFELT $ 56))
                       . #7#)
                 (GO #8#))))))
            (LETT |subnodes| (SPADCALL |s| (QREFELT $ 27)) . #7#)
            (LETT |c1| (|SPADfirst| |subnodes|) . #7#)
            (LETT |c2| (SPADCALL |subnodes| (QREFELT $ 29)) . #7#)
            (COND
             ((SPADCALL |c1| (QREFELT $ 11))
              (SEQ
               (SPADCALL
                (SPADCALL
                 (SPADCALL "util coerce apply rule SI1 in:" (QREFELT $ 14))
                 (SPADCALL |s| (QREFELT $ 31)) (QREFELT $ 15))
                (QREFELT $ 17))
               (LETT |a| (SPADCALL |c1| (QREFELT $ 58)) . #7#)
               (EXIT
                (PROGN
                 (LETT #1# (SPADCALL |a| |a| (QREFELT $ 57)) . #7#)
                 (GO #8#))))))
            (COND
             ((SPADCALL |c1| (QREFELT $ 10))
              (PROGN
               (LETT #1#
                     (SPADCALL (SPADCALL |c1| (QREFELT $ 58))
                               (SPADCALL |c2| (QREFELT $ 58)) (QREFELT $ 59))
                     . #7#)
               (GO #8#))))
            (LETT |subsubnodes| (SPADCALL |c1| (QREFELT $ 27)) . #7#)
            (LETT |c11| (|SPADfirst| |subsubnodes|) . #7#)
            (LETT |c12| (SPADCALL |subsubnodes| (QREFELT $ 29)) . #7#)
            (COND
             ((SPADCALL |c11| (QREFELT $ 22))
              (SEQ
               (SPADCALL
                (SPADCALL
                 (SPADCALL "util coerce apply rule SI2 in:" (QREFELT $ 14))
                 (SPADCALL |s| (QREFELT $ 31)) (QREFELT $ 15))
                (QREFELT $ 17))
               (LETT |a| (SPADCALL |c2| (QREFELT $ 58)) . #7#)
               (LETT |b| (SPADCALL |c12| (QREFELT $ 58)) . #7#)
               (EXIT
                (PROGN
                 (LETT #1#
                       (SPADCALL |a| (SPADCALL |b| |a| (QREFELT $ 57))
                                 (QREFELT $ 57))
                       . #7#)
                 (GO #8#))))))
            (COND
             ((SPADCALL |c11| (QREFELT $ 10))
              (PROGN
               (LETT #1#
                     (SPADCALL (SPADCALL |c1| (QREFELT $ 58))
                               (SPADCALL |c2| (QREFELT $ 58)) (QREFELT $ 59))
                     . #7#)
               (GO #8#))))
            (LETT |subsubnodes2| (SPADCALL |c11| (QREFELT $ 27)) . #7#)
            (LETT |c111| (|SPADfirst| |subsubnodes2|) . #7#)
            (LETT |c112| (SPADCALL |subsubnodes2| (QREFELT $ 29)) . #7#)
            (COND
             ((SPADCALL |c111| (QREFELT $ 23))
              (SEQ
               (SPADCALL
                (SPADCALL
                 (SPADCALL "util coerce apply rule SI3 in:" (QREFELT $ 14))
                 (SPADCALL |s| (QREFELT $ 31)) (QREFELT $ 15))
                (QREFELT $ 17))
               (LETT |a| (SPADCALL |c2| (QREFELT $ 58)) . #7#)
               (LETT |b| (SPADCALL |c12| (QREFELT $ 58)) . #7#)
               (LETT |c| (SPADCALL |c112| (QREFELT $ 58)) . #7#)
               (LETT |ab| (SPADCALL |a| |b| (QREFELT $ 57)) . #7#)
               (LETT |ac| (SPADCALL |a| |c| (QREFELT $ 57)) . #7#)
               (LETT |bc| (SPADCALL |b| |c| (QREFELT $ 57)) . #7#)
               (EXIT
                (PROGN
                 (LETT #1#
                       (SPADCALL (SPADCALL |a| |bc| (QREFELT $ 57))
                                 (SPADCALL |ab| |ac| (QREFELT $ 57))
                                 (QREFELT $ 57))
                       . #7#)
                 (GO #8#))))))
            (EXIT
             (SPADCALL (SPADCALL |c1| (QREFELT $ 58))
                       (SPADCALL |c2| (QREFELT $ 58)) (QREFELT $ 59)))))
          #8# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |compUtil;|)) 

(DEFUN |compUtil| (#1=#:G804)
  (SPROG NIL
         (PROG (#2=#:G805)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|compUtil|)
                                               '|domainEqualList|)
                    . #3=(|compUtil|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|compUtil;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|compUtil|)))))))))) 

(DEFUN |compUtil;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|compUtil|))
          (LETT |dv$| (LIST '|compUtil| DV$1) . #1#)
          (LETT $ (GETREFV 60) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|compUtil| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 0)
          $))) 

(MAKEPROP '|compUtil| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|varNum| (|Boolean|)
              (|SKICombinators| 6) (0 . |atom?|) (5 . |isI?|) (|String|)
              (|OutputForm|) (10 . |message|) (15 . |hconcat|) (|Void|)
              (21 . |print|) (|List| $) (26 . |concat|) (|Lambda| 6)
              (31 . |parseLambda|) (36 . |isK?|) (41 . |isS?|)
              (46 . |getVariable|) (51 . |getName|) (56 . |lambda|)
              (61 . |getChildren|) (|List| 9) (66 . |second|) (71 . |toString|)
              (76 . |coerce|) (81 . |lambda|) |COMPUTIL;coerce;SkicL;2|
              (87 . |freeVariable?|) (93 . |coerce|) (98 . K) (102 . |ski|)
              (108 . I) (112 . S) (116 . |atom?|) (121 . |coerce|)
              (126 . |toString|) (131 . |var|) (136 . |ski|)
              (141 . |isCompound?|) (146 . |getChildren|) (|List| 20)
              (151 . |second|) |COMPUTIL;coerce;LSkic;4| (156 . |isLambda?|)
              (161 . |unbind|) (166 . |getVariable|) (171 . |free?|)
              (176 . |lambda|) (|ILogic|) (182 . |proposition|)
              (187 . |implies|) |COMPUTIL;coerce;SkicIl;5| (193 . |\\/|))
           '#(|coerce| 199) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 59
                                                 '(1 9 8 0 10 1 9 8 0 11 1 13 0
                                                   12 14 2 13 0 0 0 15 1 13 16
                                                   0 17 1 12 0 18 19 1 20 0 12
                                                   21 1 9 8 0 22 1 9 8 0 23 1 9
                                                   6 0 24 1 6 12 0 25 1 20 0 6
                                                   26 1 9 18 0 27 1 28 9 0 29 1
                                                   9 12 0 30 1 9 13 0 31 2 20 0
                                                   0 0 32 2 9 8 0 6 34 1 6 13 0
                                                   35 0 9 0 36 2 9 0 0 0 37 0 9
                                                   0 38 0 9 0 39 1 20 8 0 40 1
                                                   20 13 0 41 1 20 12 0 42 1 6
                                                   0 12 43 1 9 0 6 44 1 20 8 0
                                                   45 1 20 18 0 46 1 47 20 0 48
                                                   1 20 8 0 50 1 20 0 0 51 1 20
                                                   6 0 52 1 20 8 0 53 2 20 0 0
                                                   6 54 1 55 0 12 56 2 55 0 0 0
                                                   57 2 55 0 0 0 59 1 0 20 9 33
                                                   1 0 55 9 58 1 0 9 20 49)))))
           '|lookupComplete|)) 
