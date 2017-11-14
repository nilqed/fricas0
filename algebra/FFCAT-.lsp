
(SDEFUN |FFCAT-;Q2RF| ((|q| |Fraction| F) ($ |Fraction| UP))
        (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 11)) (QREFELT $ 12))
                  (SPADCALL (SPADCALL |q| (QREFELT $ 13)) (QREFELT $ 12))
                  (QREFELT $ 15))) 

(SDEFUN |FFCAT-;infOrder| ((|f| |Fraction| UP) ($ |Integer|))
        (- (SPADCALL (SPADCALL |f| (QREFELT $ 16)) (QREFELT $ 18))
           (SPADCALL (SPADCALL |f| (QREFELT $ 19)) (QREFELT $ 18)))) 

(SDEFUN |FFCAT-;integral?;SB;3| ((|f| S) ($ |Boolean|))
        (SPADCALL (QCDR (SPADCALL |f| (QREFELT $ 21))) (QREFELT $ 23))) 

(SDEFUN |FFCAT-;integral?;SFB;4| ((|f| S) (|a| F) ($ |Boolean|))
        (SPADCALL
         (SPADCALL (QCDR (SPADCALL |f| (QREFELT $ 21))) |a| (QREFELT $ 25))
         (|spadConstant| $ 26) (QREFELT $ 27))) 

(SDEFUN |FFCAT-;absolutelyIrreducible?;B;5| (($ |Boolean|))
        (EQL (SPADCALL (QREFELT $ 29)) 1)) 

(SDEFUN |FFCAT-;yCoordinates;SR;6|
        ((|f| S) ($ |Record| (|:| |num| (|Vector| UP)) (|:| |den| UP)))
        (SPADCALL (SPADCALL |f| (QREFELT $ 32)) (QREFELT $ 34))) 

(SDEFUN |FFCAT-;hyperelliptic;U;7| (($ |Union| UP "failed"))
        (SPROG
         ((|p| (UP)) (|v| (|Union| UP "failed"))
          (|u| (|Union| (|Fraction| UP) "failed")) (|f| (UPUP)))
         (SEQ
          (COND
           ((SPADCALL
             (SPADCALL
              (LETT |f| (SPADCALL (QREFELT $ 36))
                    . #1=(|FFCAT-;hyperelliptic;U;7|))
              (QREFELT $ 37))
             2 (QREFELT $ 38))
            (CONS 1 "failed"))
           (#2='T
            (SEQ
             (LETT |u| (SPADCALL (SPADCALL |f| (QREFELT $ 39)) (QREFELT $ 41))
                   . #1#)
             (EXIT
              (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                    (#2#
                     (SEQ
                      (LETT |v|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (QCDR |u|)
                                        (SPADCALL |f| (QREFELT $ 42))
                                        (QREFELT $ 43))
                              (QREFELT $ 44))
                             (QREFELT $ 46))
                            . #1#)
                      (EXIT
                       (COND
                        ((OR (QEQCAR |v| 1)
                             (NULL
                              (ODDP
                               (SPADCALL (LETT |p| (QCDR |v|) . #1#)
                                         (QREFELT $ 18)))))
                         (CONS 1 "failed"))
                        ('T (CONS 0 |p|)))))))))))))) 

(SDEFUN |FFCAT-;algSplitSimple;SMR;8|
        ((|f| S) (|derivation| |Mapping| UP UP)
         ($ |Record| (|:| |num| S) (|:| |den| UP) (|:| |derivden| UP)
          (|:| |gd| UP)))
        (SPROG
         ((|dd| (UP)) (#1=#:G750 NIL) (|g| (UP))
          (|cd| (|Record| (|:| |num| UPUP) (|:| |den| UP))))
         (SEQ
          (LETT |cd| (SPADCALL (SPADCALL |f| (QREFELT $ 48)) (QREFELT $ 51))
                . #2=(|FFCAT-;algSplitSimple;SMR;8|))
          (LETT |dd|
                (PROG2
                    (LETT #1#
                          (SPADCALL (QCDR |cd|)
                                    (LETT |g|
                                          (SPADCALL (QCDR |cd|)
                                                    (SPADCALL (QCDR |cd|)
                                                              |derivation|)
                                                    (QREFELT $ 52))
                                          . #2#)
                                    (QREFELT $ 54))
                          . #2#)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (QREFELT $ 8)
                                  (|Union| (QREFELT $ 8) "failed") #1#))
                . #2#)
          (EXIT
           (VECTOR
            (SPADCALL
             (SPADCALL (SPADCALL (SPADCALL |g| (QREFELT $ 55)) (QREFELT $ 56))
                       (QCAR |cd|) (QREFELT $ 57))
             (QREFELT $ 58))
            |dd| (SPADCALL |dd| |derivation|)
            (SPADCALL |dd| (SPADCALL (SPADCALL (QREFELT $ 59)) (QREFELT $ 60))
                      (QREFELT $ 52))))))) 

(SDEFUN |FFCAT-;elliptic;U;9| (($ |Union| UP "failed"))
        (SPROG ((|p| (UP)) (|u| (|Union| UP "failed")))
               (SEQ
                (LETT |u| (SPADCALL (QREFELT $ 64))
                      . #1=(|FFCAT-;elliptic;U;9|))
                (EXIT
                 (COND
                  ((OR (QEQCAR |u| 1)
                       (NULL
                        (EQL
                         (SPADCALL (LETT |p| (QCDR |u|) . #1#) (QREFELT $ 18))
                         3)))
                   (CONS 1 "failed"))
                  ('T (CONS 0 |p|))))))) 

(SDEFUN |FFCAT-;rationalPoint?;2FB;10| ((|x| F) (|y| F) ($ |Boolean|))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL (QREFELT $ 36))
                    (SPADCALL (SPADCALL |y| (QREFELT $ 12)) (QREFELT $ 55))
                    (QREFELT $ 66))
          (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 55))
          (QREFELT $ 68))
         (QREFELT $ 69))) 

(SDEFUN |FFCAT-;UP2P| ((|p| UP) (|x| |Polynomial| F) ($ |Polynomial| F))
        (SPADCALL (SPADCALL (ELT $ 72) |p| (QREFELT $ 76)) |x| (QREFELT $ 77))) 

(SDEFUN |FFCAT-;UPUP2P|
        ((|p| UPUP) (|x| |Polynomial| F) (|y| |Polynomial| F)
         ($ |Polynomial| F))
        (SPROG NIL
               (SPADCALL
                (SPADCALL (CONS #'|FFCAT-;UPUP2P!0| (VECTOR |x| $)) |p|
                          (QREFELT $ 80))
                |y| (QREFELT $ 77)))) 

(SDEFUN |FFCAT-;UPUP2P!0| ((|s| NIL) ($$ NIL))
        (PROG ($ |x|)
          (LETT $ (QREFELT $$ 1) . #1=(|FFCAT-;UPUP2P|))
          (LETT |x| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|FFCAT-;UP2P| (SPADCALL |s| (QREFELT $ 60)) |x| $))))) 

(SDEFUN |FFCAT-;nonSingularModel;SL;13|
        ((|u| |Symbol|) ($ |List| (|Polynomial| F)))
        (SPROG
         ((#1=#:G805 NIL) (|v| NIL) (#2=#:G806 NIL) (|i| NIL) (#3=#:G804 NIL)
          (|y| (|Symbol|)) (|x| (|Symbol|)) (|vars| (|List| (|Symbol|)))
          (#4=#:G803 NIL) (|n| (|Integer|)) (#5=#:G802 NIL)
          (|d| (|Fraction| UP)) (|w| (|Vector| S)))
         (SEQ
          (LETT |d|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (LETT |w| (SPADCALL (QREFELT $ 82))
                         . #6=(|FFCAT-;nonSingularModel;SL;13|))
                   (QREFELT $ 84))
                  (QREFELT $ 86))
                 (QREFELT $ 55))
                . #6#)
          (LETT |vars|
                (PROGN
                 (LETT #5# NIL . #6#)
                 (SEQ (LETT |i| 1 . #6#)
                      (LETT #4# (LETT |n| (QVSIZE |w|) . #6#) . #6#) G190
                      (COND ((|greater_SI| |i| #4#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #5#
                              (CONS
                               (SPADCALL
                                (STRCONC (SPADCALL |u| (QREFELT $ 89))
                                         (STRINGIMAGE |i|))
                                (QREFELT $ 90))
                               #5#)
                              . #6#)))
                      (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                      (EXIT (NREVERSE #5#))))
                . #6#)
          (LETT |x| '|%%dummy1| . #6#) (LETT |y| '|%%dummy2| . #6#)
          (EXIT
           (SPADCALL
            (CONS #'|FFCAT-;nonSingularModel;SL;13!0| (VECTOR |y| $ |x|))
            (SPADCALL
             (PROGN
              (LETT #3# NIL . #6#)
              (SEQ (LETT |i| 1 . #6#) (LETT #2# |n| . #6#) (LETT |v| NIL . #6#)
                   (LETT #1# |vars| . #6#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #6#) NIL)
                         (|greater_SI| |i| #2#))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #3#
                           (CONS
                            (SPADCALL (SPADCALL |v| (QREFELT $ 93))
                                      (|FFCAT-;UPUP2P|
                                       (SPADCALL
                                        (SPADCALL |d|
                                                  (SPADCALL |w| |i|
                                                            (QREFELT $ 96))
                                                  (QREFELT $ 97))
                                        (QREFELT $ 48))
                                       (SPADCALL |x| (QREFELT $ 93))
                                       (SPADCALL |y| (QREFELT $ 93)) $)
                                      (QREFELT $ 98))
                            #3#)
                           . #6#)))
                   (LETT #1# (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|) . #6#))
                         . #6#)
                   (GO G190) G191 (EXIT (NREVERSE #3#))))
             (SPADCALL (LIST |x| |y|) |vars| (QREFELT $ 100)) (QREFELT $ 103))
            (QREFELT $ 105)))))) 

(SDEFUN |FFCAT-;nonSingularModel;SL;13!0| ((|s| NIL) ($$ NIL))
        (PROG (|x| $ |y|)
          (LETT |x| (QREFELT $$ 2) . #1=(|FFCAT-;nonSingularModel;SL;13|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |y| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND
             ((SPADCALL (SPADCALL |s| |x| (QREFELT $ 91)) (QREFELT $ 92))
              (SPADCALL (SPADCALL |s| |y| (QREFELT $ 91)) (QREFELT $ 92)))
             ('T NIL)))))) 

(SDEFUN |FFCAT-;ispoint| ((|p| UPUP) (|x| F) (|y| F) ($ |List| F))
        (SPROG ((|jhd| (|Fraction| UP)))
               (SEQ
                (LETT |jhd|
                      (SPADCALL |p|
                                (SPADCALL (SPADCALL |y| (QREFELT $ 12))
                                          (QREFELT $ 55))
                                (QREFELT $ 66))
                      |FFCAT-;ispoint|)
                (EXIT
                 (COND
                  ((SPADCALL
                    (SPADCALL |jhd|
                              (SPADCALL (SPADCALL |x| (QREFELT $ 12))
                                        (QREFELT $ 55))
                              (QREFELT $ 68))
                    (QREFELT $ 69))
                   (LIST |x| |y|))
                  ('T NIL)))))) 

(SDEFUN |FFCAT-;rationalPoints;L;15| (($ |List| (|List| F)))
        (SPROG
         ((|pt| (|List| F)) (#1=#:G812 NIL) (#2=#:G810 NIL) (#3=#:G821 NIL)
          (|y| NIL) (#4=#:G820 NIL) (#5=#:G819 NIL) (|x| NIL) (#6=#:G818 NIL)
          (|p| (UPUP)))
         (SEQ
          (LETT |p| (SPADCALL (QREFELT $ 36))
                . #7=(|FFCAT-;rationalPoints;L;15|))
          (EXIT
           (SPADCALL
            (PROGN
             (LETT #6# NIL . #7#)
             (SEQ (LETT |x| 1 . #7#)
                  (LETT #5# (SPADCALL (QREFELT $ 107)) . #7#) G190
                  (COND ((|greater_SI| |x| #5#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #6#
                          (CONS
                           (PROGN
                            (LETT #4# NIL . #7#)
                            (SEQ (LETT |y| 1 . #7#)
                                 (LETT #3# (SPADCALL (QREFELT $ 107)) . #7#)
                                 G190 (COND ((|greater_SI| |y| #3#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((NULL
                                      (NULL
                                       (LETT |pt|
                                             (|FFCAT-;ispoint| |p|
                                              (SPADCALL
                                               (PROG1 (LETT #2# |x| . #7#)
                                                 (|check_subtype2| (> #2# 0)
                                                                   '(|PositiveInteger|)
                                                                   '(|NonNegativeInteger|)
                                                                   #2#))
                                               (QREFELT $ 109))
                                              (SPADCALL
                                               (PROG1 (LETT #1# |y| . #7#)
                                                 (|check_subtype2| (> #1# 0)
                                                                   '(|PositiveInteger|)
                                                                   '(|NonNegativeInteger|)
                                                                   #1#))
                                               (QREFELT $ 109))
                                              $)
                                             . #7#)))
                                     (LETT #4# (CONS |pt| #4#) . #7#)))))
                                 (LETT |y| (|inc_SI| |y|) . #7#) (GO G190) G191
                                 (EXIT (NREVERSE #4#))))
                           #6#)
                          . #7#)))
                  (LETT |x| (|inc_SI| |x|) . #7#) (GO G190) G191
                  (EXIT (NREVERSE #6#))))
            (QREFELT $ 112)))))) 

(SDEFUN |FFCAT-;intvalue| ((|v| |Vector| UP) (|x| F) (|y| F) ($ F))
        (SPROG
         ((#1=#:G833 NIL) (|d| (F)) (|n| (F)) (#2=#:G827 NIL) (#3=#:G826 (F))
          (#4=#:G828 (F)) (#5=#:G830 NIL) (#6=#:G839 NIL) (|i| NIL)
          (|rec| (|Record| (|:| |num| (|Vector| UP)) (|:| |den| UP)))
          (#7=#:G823 NIL) (#8=#:G822 (S)) (#9=#:G824 (S)) (#10=#:G838 NIL)
          (|mini| (|Integer|)) (|w| (|Vector| S)))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 114)) (|error| "Point is singular"))
                (#11='T
                 (SEQ
                  (LETT |mini|
                        (SPADCALL
                         (LETT |w| (SPADCALL (QREFELT $ 82))
                               . #12=(|FFCAT-;intvalue|))
                         (QREFELT $ 115))
                        . #12#)
                  (LETT |rec|
                        (SPADCALL
                         (PROGN
                          (LETT #7# NIL . #12#)
                          (SEQ (LETT |i| |mini| . #12#)
                               (LETT #10# (QVSIZE |w|) . #12#) G190
                               (COND ((> |i| #10#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (PROGN
                                  (LETT #9#
                                        (SPADCALL
                                         (SPADCALL (QAREF1O |v| |i| 1)
                                                   (QREFELT $ 55))
                                         (QAREF1O |w| |i| 1) (QREFELT $ 97))
                                        . #12#)
                                  (COND
                                   (#7#
                                    (LETT #8#
                                          (SPADCALL #8# #9# (QREFELT $ 116))
                                          . #12#))
                                   ('T
                                    (PROGN
                                     (LETT #8# #9# . #12#)
                                     (LETT #7# 'T . #12#)))))))
                               (LETT |i| (+ |i| 1) . #12#) (GO G190) G191
                               (EXIT NIL))
                          (COND (#7# #8#) (#11# (|spadConstant| $ 117))))
                         (QREFELT $ 118))
                        . #12#)
                  (LETT |n|
                        (PROGN
                         (LETT #2# NIL . #12#)
                         (SEQ (LETT |i| |mini| . #12#)
                              (LETT #6# (QVSIZE |w|) . #12#) G190
                              (COND ((> |i| #6#) (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #4#
                                       (SPADCALL
                                        (SPADCALL (QAREF1O (QCAR |rec|) |i| 1)
                                                  |x| (QREFELT $ 25))
                                        (SPADCALL |y|
                                                  (PROG1
                                                      (LETT #5# (- |i| |mini|)
                                                            . #12#)
                                                    (|check_subtype2|
                                                     (>= #5# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #5#))
                                                  (QREFELT $ 119))
                                        (QREFELT $ 120))
                                       . #12#)
                                 (COND
                                  (#2#
                                   (LETT #3# (SPADCALL #3# #4# (QREFELT $ 121))
                                         . #12#))
                                  ('T
                                   (PROGN
                                    (LETT #3# #4# . #12#)
                                    (LETT #2# 'T . #12#)))))))
                              (LETT |i| (+ |i| 1) . #12#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#2# #3#) (#11# (|spadConstant| $ 26))))
                        . #12#)
                  (EXIT
                   (COND
                    ((SPADCALL
                      (LETT |d| (SPADCALL (QCDR |rec|) |x| (QREFELT $ 25))
                            . #12#)
                      (QREFELT $ 122))
                     (COND
                      ((SPADCALL |n| (QREFELT $ 122))
                       (|error| "0/0 -- cannot compute value yet"))
                      (#11# (|error| "Shouldn't happen"))))
                    (#11#
                     (PROG2
                         (LETT #1# (SPADCALL |n| |d| (QREFELT $ 123)) . #12#)
                         (QCDR #1#)
                       (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                       (|Union| (QREFELT $ 7) "failed")
                                       #1#))))))))))) 

(SDEFUN |FFCAT-;elt;S3F;17| ((|f| S) (|x| F) (|y| F) ($ F))
        (SPROG
         ((#1=#:G843 NIL) (|d| (F)) (|n| (F))
          (|rec| (|Record| (|:| |num| (|Vector| UP)) (|:| |den| UP))))
         (SEQ
          (LETT |rec| (SPADCALL |f| (QREFELT $ 21)) . #2=(|FFCAT-;elt;S3F;17|))
          (LETT |n| (|FFCAT-;intvalue| (QCAR |rec|) |x| |y| $) . #2#)
          (EXIT
           (COND
            ((SPADCALL
              (LETT |d| (SPADCALL (QCDR |rec|) |x| (QREFELT $ 25)) . #2#)
              (QREFELT $ 122))
             (COND
              ((SPADCALL |n| (QREFELT $ 122))
               (|error| "0/0 -- cannot compute value yet"))
              (#3='T (|error| "Function has a pole at the given point"))))
            (#3#
             (PROG2 (LETT #1# (SPADCALL |n| |d| (QREFELT $ 123)) . #2#)
                 (QCDR #1#)
               (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                               (|Union| (QREFELT $ 7) "failed") #1#)))))))) 

(SDEFUN |FFCAT-;primitivePart;2S;18| ((|f| S) ($ S))
        (SPROG
         ((#1=#:G855 NIL) (#2=#:G857 NIL) (|i| NIL) (#3=#:G856 NIL) (|d| (UP))
          (#4=#:G854 NIL) (#5=#:G853 NIL)
          (|cd| (|Record| (|:| |num| (|Vector| UP)) (|:| |den| UP))))
         (SEQ
          (LETT |cd| (SPADCALL |f| (QREFELT $ 118))
                . #6=(|FFCAT-;primitivePart;2S;18|))
          (LETT |d|
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #5# NIL . #6#)
                   (SEQ (LETT |i| (SPADCALL (QCAR |cd|) (QREFELT $ 126)) . #6#)
                        (LETT #4# (QVSIZE (QCAR |cd|)) . #6#) G190
                        (COND ((> |i| #4#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #5#
                                (CONS
                                 (SPADCALL (QAREF1O (QCAR |cd|) |i| 1)
                                           (QREFELT $ 127))
                                 #5#)
                                . #6#)))
                        (LETT |i| (+ |i| 1) . #6#) (GO G190) G191
                        (EXIT (NREVERSE #5#))))
                  (QREFELT $ 128))
                 (SPADCALL (QCDR |cd|) (QREFELT $ 129)) (QREFELT $ 130))
                . #6#)
          (EXIT
           (SPADCALL
            (PROGN
             (LETT #3#
                   (GETREFV
                    (|inc_SI|
                     (- #7=(QVSIZE (QCAR |cd|))
                        #8=(SPADCALL (QCAR |cd|) (QREFELT $ 126)))))
                   . #6#)
             (SEQ (LETT |i| #8# . #6#) (LETT #2# #7# . #6#) (LETT #1# 0 . #6#)
                  G190 (COND ((> |i| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SETELT #3# #1#
                            (SPADCALL (QAREF1O (QCAR |cd|) |i| 1) |d|
                                      (QREFELT $ 15)))))
                  (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |i| (+ |i| 1) . #6#))
                        . #6#)
                  (GO G190) G191 (EXIT NIL))
             #3#)
            (QREFELT $ 131)))))) 

(SDEFUN |FFCAT-;reduceBasisAtInfinity;2V;19| ((|b| |Vector| S) ($ |Vector| S))
        (SPROG
         ((|f| (S)) (|j| NIL) (#1=#:G864 NIL) (#2=#:G863 NIL) (|i| NIL)
          (#3=#:G862 NIL) (|x| (|Fraction| UP)))
         (SEQ
          (LETT |x|
                (SPADCALL (SPADCALL (|spadConstant| $ 134) 1 (QREFELT $ 135))
                          (QREFELT $ 55))
                . #4=(|FFCAT-;reduceBasisAtInfinity;2V;19|))
          (EXIT
           (SPADCALL
            (PROGN
             (LETT #3# NIL . #4#)
             (SEQ (LETT |i| (SPADCALL |b| (QREFELT $ 115)) . #4#)
                  (LETT #2# (QVSIZE |b|) . #4#) G190
                  (COND ((> |i| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #3#
                          (CONS
                           (LIST2VEC
                            (PROGN
                             (LETT #1# NIL . #4#)
                             (SEQ (LETT |j| 0 . #4#) G190
                                  (COND
                                   ((NULL
                                     (SPADCALL
                                      (LETT |f|
                                            (SPADCALL
                                             (SPADCALL |x| |j| (QREFELT $ 136))
                                             (QAREF1O |b| |i| 1)
                                             (QREFELT $ 97))
                                            . #4#)
                                      (QREFELT $ 137)))
                                    (GO G191)))
                                  (SEQ (EXIT (LETT #1# (CONS |f| #1#) . #4#)))
                                  (LETT |j| (|inc_SI| |j|) . #4#) (GO G190)
                                  G191 (EXIT (NREVERSE #1#)))))
                           #3#)
                          . #4#)))
                  (LETT |i| (+ |i| 1) . #4#) (GO G190) G191
                  (EXIT (NREVERSE #3#))))
            (QREFELT $ 138)))))) 

(SDEFUN |FFCAT-;complementaryBasis;2V;20| ((|b| |Vector| S) ($ |Vector| S))
        (SPROG
         ((#1=#:G871 NIL) (#2=#:G873 NIL) (|i| NIL) (#3=#:G872 NIL)
          (|m| (|Matrix| (|Fraction| UP))) (#4=#:G866 NIL))
         (SEQ
          (LETT |m|
                (PROG2
                    (LETT #4#
                          (SPADCALL (SPADCALL |b| (QREFELT $ 140))
                                    (QREFELT $ 141))
                          . #5=(|FFCAT-;complementaryBasis;2V;20|))
                    (QCDR #4#)
                  (|check_union2| (QEQCAR #4# 0)
                                  (|Matrix| (|Fraction| (QREFELT $ 8)))
                                  (|Union|
                                   (|Matrix| (|Fraction| (QREFELT $ 8)))
                                   "failed")
                                  #4#))
                . #5#)
          (EXIT
           (PROGN
            (LETT #3# (GETREFV #6=(SPADCALL |m| (QREFELT $ 142))) . #5#)
            (SEQ (LETT |i| 1 . #5#) (LETT #2# #6# . #5#) (LETT #1# 0 . #5#)
                 G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SETELT #3# #1#
                           (SPADCALL (SPADCALL |m| |i| (QREFELT $ 143))
                                     (QREFELT $ 131)))))
                 (LETT #1#
                       (PROG1 (|inc_SI| #1#) (LETT |i| (|inc_SI| |i|) . #5#))
                       . #5#)
                 (GO G190) G191 (EXIT NIL))
            #3#))))) 

(SDEFUN |FFCAT-;integralAtInfinity?;SB;21| ((|f| S) ($ |Boolean|))
        (NULL
         (SPADCALL (CONS #'|FFCAT-;integralAtInfinity?;SB;21!0| $)
                   (SPADCALL (SPADCALL |f| (QREFELT $ 32))
                             (SPADCALL (QREFELT $ 147)) (QREFELT $ 148))
                   (QREFELT $ 150)))) 

(SDEFUN |FFCAT-;integralAtInfinity?;SB;21!0| ((|s| NIL) ($ NIL))
        (SPADCALL (|FFCAT-;infOrder| |s| $) (|spadConstant| $ 145)
                  (QREFELT $ 146))) 

(SDEFUN |FFCAT-;numberOfComponents;Nni;22| (($ |NonNegativeInteger|))
        (SPADCALL (ELT $ 137) (SPADCALL (QREFELT $ 82)) (QREFELT $ 153))) 

(SDEFUN |FFCAT-;represents;VUPS;23| ((|v| |Vector| UP) (|d| UP) ($ S))
        (SPROG ((#1=#:G881 NIL) (#2=#:G883 NIL) (|i| NIL) (#3=#:G882 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #3#
                        (GETREFV
                         (|inc_SI|
                          (- #4=(QVSIZE |v|)
                             #5=(SPADCALL |v| (QREFELT $ 126)))))
                        . #6=(|FFCAT-;represents;VUPS;23|))
                  (SEQ (LETT |i| #5# . #6#) (LETT #2# #4# . #6#)
                       (LETT #1# 0 . #6#) G190 (COND ((> |i| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SETELT #3# #1#
                                 (SPADCALL (QAREF1O |v| |i| 1) |d|
                                           (QREFELT $ 15)))))
                       (LETT #1#
                             (PROG1 (|inc_SI| #1#) (LETT |i| (+ |i| 1) . #6#))
                             . #6#)
                       (GO G190) G191 (EXIT NIL))
                  #3#)
                 (QREFELT $ 131))))) 

(SDEFUN |FFCAT-;genus;Nni;24| (($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G887 NIL) (|dd| (|Integer|)) (#2=#:G885 NIL) (|d| (|Integer|))
          (|ds| (|Fraction| UP)))
         (SEQ
          (LETT |ds| (SPADCALL (QREFELT $ 59)) . #3=(|FFCAT-;genus;Nni;24|))
          (LETT |d|
                (+ (SPADCALL (SPADCALL |ds| (QREFELT $ 60)) (QREFELT $ 18))
                   (|FFCAT-;infOrder|
                    (SPADCALL |ds|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (SPADCALL (QREFELT $ 156))
                                          (SPADCALL (QREFELT $ 157))
                                          (QREFELT $ 158))
                                (QREFELT $ 159))
                               2 (QREFELT $ 160))
                              (QREFELT $ 161))
                    $))
                . #3#)
          (LETT |dd|
                (PROG2
                    (LETT #2#
                          (SPADCALL
                           (-
                            (PROG2
                                (LETT #2# (SPADCALL |d| 2 (QREFELT $ 162))
                                      . #3#)
                                (QCDR #2#)
                              (|check_union2| (QEQCAR #2# 0) (|Integer|)
                                              (|Union| (|Integer|) #4="failed")
                                              #2#))
                            (SPADCALL (QREFELT $ 163)))
                           (SPADCALL (QREFELT $ 29)) (QREFELT $ 162))
                          . #3#)
                    (QCDR #2#)
                  (|check_union2| (QEQCAR #2# 0) (|Integer|)
                                  (|Union| (|Integer|) #4#) #2#))
                . #3#)
          (EXIT
           (PROG1 (LETT #1# (+ |dd| 1) . #3#)
             (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|) '(|Integer|)
                               #1#)))))) 

(SDEFUN |FFCAT-;repOrder|
        ((|m| |Matrix| (|Fraction| UP)) (|i| |Integer|) ($ |Integer|))
        (SPROG
         ((|ans| (|Integer|)) (|nostart| (|Boolean|)) (#1=#:G894 NIL) (|j| NIL)
          (|r| (|Vector| (|Fraction| UP))))
         (SEQ (LETT |nostart| 'T . #2=(|FFCAT-;repOrder|)) (LETT |ans| 0 . #2#)
              (LETT |r| (SPADCALL |m| |i| (QREFELT $ 143)) . #2#)
              (SEQ (LETT |j| (SPADCALL |r| (QREFELT $ 165)) . #2#)
                   (LETT #1# (QVSIZE |r|) . #2#) G190
                   (COND ((> |j| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (QAREF1O |r| |j| 1) (|spadConstant| $ 166)
                                 (QREFELT $ 167))
                       (LETT |ans|
                             (COND
                              (|nostart|
                               (SEQ (LETT |nostart| NIL . #2#)
                                    (EXIT
                                     (|FFCAT-;infOrder| (QAREF1O |r| |j| 1)
                                      $))))
                              ('T
                               (MIN |ans|
                                    (|FFCAT-;infOrder| (QAREF1O |r| |j| 1)
                                     $))))
                             . #2#)))))
                   (LETT |j| (+ |j| 1) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (COND (|nostart| (|error| "Null row")) ('T |ans|)))))) 

(SDEFUN |FFCAT-;infValue| ((|f| |Fraction| UP) ($ |Fraction| F))
        (SPROG ((|n| (|Integer|)))
               (SEQ
                (COND ((SPADCALL |f| (QREFELT $ 69)) (|spadConstant| $ 168))
                      (#1='T
                       (SEQ
                        (LETT |n| (|FFCAT-;infOrder| |f| $) |FFCAT-;infValue|)
                        (EXIT
                         (COND
                          ((SPADCALL |n| 0 (QREFELT $ 169))
                           (|spadConstant| $ 168))
                          ((ZEROP |n|)
                           (SPADCALL
                            (SPADCALL (SPADCALL |f| (QREFELT $ 19))
                                      (QREFELT $ 170))
                            (SPADCALL (SPADCALL |f| (QREFELT $ 16))
                                      (QREFELT $ 170))
                            (QREFELT $ 171)))
                          (#1#
                           (|error|
                            "f not locally integral at infinity")))))))))) 

(SDEFUN |FFCAT-;rfmonom| ((|n| |Integer|) ($ |Fraction| UP))
        (SPROG ((#1=#:G900 NIL) (#2=#:G899 NIL))
               (COND
                ((< |n| 0)
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 134)
                             (PROG1 (LETT #2# (- |n|) . #3=(|FFCAT-;rfmonom|))
                               (|check_subtype2| (>= #2# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #2#))
                             (QREFELT $ 135))
                   (QREFELT $ 55))
                  (QREFELT $ 56)))
                ('T
                 (SPADCALL
                  (SPADCALL (|spadConstant| $ 134)
                            (PROG1 (LETT #1# |n| . #3#)
                              (|check_subtype2| (>= #1# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #1#))
                            (QREFELT $ 135))
                  (QREFELT $ 55)))))) 

(SDEFUN |FFCAT-;kmin|
        ((|m| |Matrix| (|Fraction| UP)) (|v| |Vector| (|Fraction| F))
         ($ |Record| (|:| |pos| (|Integer|)) (|:| |km| (|Integer|))))
        (SPROG
         ((|i0| (|Integer|)) (|k| (|Integer|)) (|nostart| (|Boolean|))
          (|nk| (|Integer|)) (#1=#:G909 NIL) (|i| NIL) (|ii| (|Integer|)))
         (SEQ (LETT |nostart| 'T . #2=(|FFCAT-;kmin|)) (LETT |k| 0 . #2#)
              (LETT |ii| (- 1 (LETT |i0| (SPADCALL |v| (QREFELT $ 173)) . #2#))
                    . #2#)
              (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 173)) . #2#)
                   (LETT #1# (QVSIZE |v|) . #2#) G190
                   (COND ((> |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (QAREF1O |v| |i| 1) (|spadConstant| $ 168)
                                 (QREFELT $ 174))
                       (SEQ
                        (LETT |nk| (|FFCAT-;repOrder| |m| (+ |i| |ii|) $)
                              . #2#)
                        (EXIT
                         (COND
                          (|nostart|
                           (SEQ (LETT |nostart| NIL . #2#)
                                (LETT |k| |nk| . #2#)
                                (EXIT (LETT |i0| |i| . #2#))))
                          ((< |nk| |k|)
                           (SEQ (LETT |k| |nk| . #2#)
                                (EXIT (LETT |i0| |i| . #2#)))))))))))
                   (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND (|nostart| (|error| "vector v has only zero entries"))
                     ('T (CONS |i0| |k|))))))) 

(SDEFUN |FFCAT-;normalizeAtInfinity;2V;29| ((|w| |Vector| S) ($ |Vector| S))
        (SPROG
         ((#1=#:G916 NIL) (#2=#:G915 (S)) (#3=#:G917 (S)) (#4=#:G929 NIL)
          (|i| NIL)
          (|pr| (|Record| (|:| |pos| (|Integer|)) (|:| |km| (|Integer|))))
          (|sol| (|Vector| (|Fraction| F))) (#5=#:G923 NIL)
          (|solList| (|List| (|Vector| (|Fraction| F)))) (#6=#:G928 NIL)
          (|j| NIL) (#7=#:G927 NIL) (|r| (|Vector| (|Fraction| UP)))
          (#8=#:G924 NIL) (#9=#:G926 NIL) (#10=#:G925 NIL)
          (|m| (|Matrix| (|Fraction| UP))) (|ii| (|Integer|))
          (|mhat| (|Matrix| (|Fraction| UP)))
          (|infm| (|Matrix| (|Fraction| UP))) (|ans| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ans| (SPADCALL |w| (QREFELT $ 175))
                  . #11=(|FFCAT-;normalizeAtInfinity;2V;29|))
            (LETT |infm| (SPADCALL (QREFELT $ 147)) . #11#)
            (LETT |mhat|
                  (SPADCALL (SPADCALL (QREFELT $ 163))
                            (SPADCALL (QREFELT $ 163)) (QREFELT $ 176))
                  . #11#)
            (LETT |ii| (- (SPADCALL |w| (QREFELT $ 115)) 1) . #11#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (LETT |m|
                         (SPADCALL (SPADCALL |ans| (QREFELT $ 84)) |infm|
                                   (QREFELT $ 158))
                         . #11#)
                   (LETT |r|
                         (PROGN
                          (LETT #10#
                                (GETREFV #12=(SPADCALL |m| (QREFELT $ 142)))
                                . #11#)
                          (SEQ (LETT |i| 1 . #11#) (LETT #9# #12# . #11#)
                               (LETT #8# 0 . #11#) G190
                               (COND ((|greater_SI| |i| #9#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SETELT #10# #8#
                                         (|FFCAT-;rfmonom|
                                          (|FFCAT-;repOrder| |m| |i| $) $))))
                               (LETT #8#
                                     (PROG1 (|inc_SI| #8#)
                                       (LETT |i| (|inc_SI| |i|) . #11#))
                                     . #11#)
                               (GO G190) G191 (EXIT NIL))
                          #10#)
                         . #11#)
                   (SEQ (LETT |i| 1 . #11#)
                        (LETT #7# (SPADCALL |m| (QREFELT $ 142)) . #11#) G190
                        (COND ((|greater_SI| |i| #7#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |j| 1 . #11#)
                               (LETT #6# (SPADCALL |m| (QREFELT $ 177)) . #11#)
                               G190 (COND ((|greater_SI| |j| #6#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (QSETAREF2O |mhat| |i| |j|
                                             (SPADCALL
                                              (QAREF1O |r| (+ |i| |ii|) 1)
                                              (QAREF2O |m| |i| |j| 1 1)
                                              (QREFELT $ 161))
                                             1 1)))
                               (LETT |j| (|inc_SI| |j|) . #11#) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191
                        (EXIT NIL))
                   (LETT |solList|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (CONS (|function| |FFCAT-;infValue|) $)
                                     |mhat| (QREFELT $ 181))
                           (QREFELT $ 182))
                          (QREFELT $ 184))
                         . #11#)
                   (EXIT
                    (COND
                     ((NULL |solList|)
                      (PROGN (LETT #5# |ans| . #11#) (GO #13=#:G922)))
                     ('T
                      (SEQ (LETT |sol| (|SPADfirst| |solList|) . #11#)
                           (LETT |pr| (|FFCAT-;kmin| |m| |sol| $) . #11#)
                           (EXIT
                            (QSETAREF1O |ans| (QCAR |pr|)
                                        (PROGN
                                         (LETT #1# NIL . #11#)
                                         (SEQ
                                          (LETT |i|
                                                (SPADCALL |sol|
                                                          (QREFELT $ 173))
                                                . #11#)
                                          (LETT #4# (QVSIZE |sol|) . #11#) G190
                                          (COND ((> |i| #4#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (PROGN
                                             (LETT #3#
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (|FFCAT-;Q2RF|
                                                      (QAREF1O |sol| |i| 1) $)
                                                     (|FFCAT-;rfmonom|
                                                      (-
                                                       (|FFCAT-;repOrder| |m|
                                                        (- |i| |ii|) $)
                                                       (QCDR |pr|))
                                                      $)
                                                     (QREFELT $ 161))
                                                    (QAREF1O |ans| |i| 1)
                                                    (QREFELT $ 97))
                                                   . #11#)
                                             (COND
                                              (#1#
                                               (LETT #2#
                                                     (SPADCALL #2# #3#
                                                               (QREFELT $ 116))
                                                     . #11#))
                                              ('T
                                               (PROGN
                                                (LETT #2# #3# . #11#)
                                                (LETT #1# 'T . #11#)))))))
                                          (LETT |i| (+ |i| 1) . #11#) (GO G190)
                                          G191 (EXIT NIL))
                                         (COND (#1# #2#)
                                               ('T (|spadConstant| $ 117))))
                                        1)))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #13# (EXIT #5#)))) 

(SDEFUN |FFCAT-;integral?;SUPB;30| ((|f| S) (|p| UP) ($ |Boolean|))
        (SPROG ((|r| (|Union| F "failed")))
               (SEQ
                (LETT |r| (SPADCALL |p| (QREFELT $ 187))
                      |FFCAT-;integral?;SUPB;30|)
                (EXIT
                 (COND
                  ((QEQCAR |r| 0) (SPADCALL |f| (QCDR |r|) (QREFELT $ 188)))
                  ('T
                   (QEQCAR
                    (SPADCALL (QCDR (SPADCALL |f| (QREFELT $ 21))) |p|
                              (QREFELT $ 54))
                    1))))))) 

(SDEFUN |FFCAT-;differentiate;SMS;31| ((|f| S) (|d| |Mapping| UP UP) ($ S))
        (SPROG NIL
               (SPADCALL |f|
                         (CONS #'|FFCAT-;differentiate;SMS;31!0|
                               (VECTOR $ |d|))
                         (QREFELT $ 192)))) 

(SDEFUN |FFCAT-;differentiate;SMS;31!0| ((|x| NIL) ($$ NIL))
        (PROG (|d| $)
          (LETT |d| (QREFELT $$ 1) . #1=(|FFCAT-;differentiate;SMS;31|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |d| (QREFELT $ 190)))))) 

(DECLAIM (NOTINLINE |FunctionFieldCategory&;|)) 

(DEFUN |FunctionFieldCategory&| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|FunctionFieldCategory&|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|FunctionFieldCategory&| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 195) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST (|HasCategory| |#2| '(|Finite|))
                                             (|HasCategory| |#2| '(|Field|))))
                    . #1#))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 2)
      (PROGN
       (QSETREFV $ 106
                 (CONS (|dispatchFunction| |FFCAT-;nonSingularModel;SL;13|)
                       $)))))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 113
                 (CONS (|dispatchFunction| |FFCAT-;rationalPoints;L;15|) $)))))
    $))) 

(MAKEPROP '|FunctionFieldCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Fraction| 7) (0 . |numer|)
              (5 . |coerce|) (10 . |denom|) (|Fraction| 8) (15 . /)
              (21 . |denom|) (|NonNegativeInteger|) (26 . |degree|)
              (31 . |numer|) (|Record| (|:| |num| 125) (|:| |den| 8))
              (36 . |integralCoordinates|) (|Boolean|) (41 . |ground?|)
              |FFCAT-;integral?;SB;3| (46 . |elt|) (52 . |Zero|) (56 . ~=)
              |FFCAT-;integral?;SFB;4| (62 . |numberOfComponents|)
              |FFCAT-;absolutelyIrreducible?;B;5| (|Vector| 14)
              (66 . |coordinates|) (|InnerCommonDenominator| 8 14 125 31)
              (71 . |splitDenominator|) |FFCAT-;yCoordinates;SR;6|
              (76 . |definingPolynomial|) (80 . |degree|) (85 . ~=)
              (91 . |reductum|) (|Union| 14 '#1="failed") (96 . |retractIfCan|)
              (101 . |leadingCoefficient|) (106 . /) (112 . -)
              (|Union| 8 '"failed") (117 . |retractIfCan|)
              |FFCAT-;hyperelliptic;U;7| (122 . |lift|)
              (|Record| (|:| |num| 9) (|:| |den| 8))
              (|UnivariatePolynomialCommonDenominator| 8 14 9)
              (127 . |splitDenominator|) (132 . |gcd|) (|Union| $ '"failed")
              (138 . |exquo|) (144 . |coerce|) (149 . |inv|) (154 . *)
              (160 . |reduce|) (165 . |discriminant|) (169 . |retract|)
              (|Record| (|:| |num| $) (|:| |den| 8) (|:| |derivden| 8)
                        (|:| |gd| 8))
              (|Mapping| 8 8) |FFCAT-;algSplitSimple;SMR;8|
              (174 . |hyperelliptic|) |FFCAT-;elliptic;U;9| (178 . |elt|)
              (|Fraction| $) (184 . |elt|) (190 . |zero?|)
              |FFCAT-;rationalPoint?;2FB;10| (|Polynomial| 7) (195 . |coerce|)
              (|SparseUnivariatePolynomial| 71) (|Mapping| 71 7)
              (|UnivariatePolynomialCategoryFunctions2| 7 8 71 73)
              (200 . |map|) (206 . |elt|) (|Mapping| 71 14)
              (|UnivariatePolynomialCategoryFunctions2| 14 9 71 73)
              (212 . |map|) (|Vector| $) (218 . |integralBasis|) (|Matrix| 14)
              (222 . |coordinates|) (|MatrixCommonDenominator| 8 14)
              (227 . |commonDenominator|) (|String|) (|Symbol|)
              (232 . |string|) (237 . |coerce|) (242 . |degree|)
              (248 . |zero?|) (253 . |coerce|) (|Integer|) (|Vector| 6)
              (258 . |elt|) (264 . *) (270 . -) (|List| 88) (276 . |concat|)
              (|List| 71) (|PolyGroebner| 7) (282 . |lexGroebner|)
              (|Mapping| 22 71) (288 . |select!|) (294 . |nonSingularModel|)
              (299 . |size|) (|PositiveInteger|) (303 . |index|) (|List| $)
              (|List| (|List| 7)) (308 . |concat|) (313 . |rationalPoints|)
              (317 . |singular?|) (322 . |minIndex|) (327 . +) (333 . |Zero|)
              (337 . |yCoordinates|) (342 . ^) (348 . *) (354 . +)
              (360 . |zero?|) (365 . |exquo|) |FFCAT-;elt;S3F;17| (|Vector| 8)
              (371 . |minIndex|) (376 . |content|) (381 . |gcd|)
              (386 . |primitivePart|) (391 . *) (397 . |represents|)
              |FFCAT-;primitivePart;2S;18| (402 . |One|) (406 . |One|)
              (410 . |monomial|) (416 . ^) (422 . |integralAtInfinity?|)
              (427 . |concat|) |FFCAT-;reduceBasisAtInfinity;2V;19|
              (432 . |traceMatrix|) (437 . |inverse|) (442 . |maxRowIndex|)
              (447 . |row|) |FFCAT-;complementaryBasis;2V;20| (453 . |Zero|)
              (457 . <) (463 . |inverseIntegralMatrixAtInfinity|) (467 . *)
              (|Mapping| 22 14) (473 . |any?|)
              |FFCAT-;integralAtInfinity?;SB;21| (|Mapping| 22 6)
              (479 . |count|) |FFCAT-;numberOfComponents;Nni;22|
              |FFCAT-;represents;VUPS;23| (485 . |integralMatrixAtInfinity|)
              (489 . |inverseIntegralMatrix|) (493 . *) (499 . |determinant|)
              (504 . ^) (510 . *) (516 . |exquo|) (522 . |rank|)
              |FFCAT-;genus;Nni;24| (526 . |minIndex|) (531 . |Zero|)
              (535 . ~=) (541 . |Zero|) (545 . >) (551 . |leadingCoefficient|)
              (556 . /) (|Vector| 10) (562 . |minIndex|) (567 . ~=)
              (573 . |copy|) (578 . |zero|) (584 . |maxColIndex|) (|Matrix| 10)
              (|Mapping| 10 14)
              (|MatrixCategoryFunctions2| 14 31 31 83 10 172 172 178)
              (589 . |map|) (595 . |transpose|) (|List| 172)
              (600 . |nullSpace|) |FFCAT-;normalizeAtInfinity;2V;29|
              (|Union| 7 '#1#) (605 . |retractIfCan|) (610 . |integral?|)
              |FFCAT-;integral?;SUPB;30| (616 . |differentiate|)
              (|Mapping| 14 14) (622 . |differentiate|)
              |FFCAT-;differentiate;SMS;31| (|List| 17))
           '#(|yCoordinates| 628 |represents| 633 |reduceBasisAtInfinity| 639
              |rationalPoints| 644 |rationalPoint?| 648 |primitivePart| 654
              |numberOfComponents| 659 |normalizeAtInfinity| 663
              |nonSingularModel| 668 |integralAtInfinity?| 673 |integral?| 678
              |hyperelliptic| 695 |genus| 699 |elt| 703 |elliptic| 710
              |differentiate| 714 |complementaryBasis| 720 |algSplitSimple| 725
              |absolutelyIrreducible?| 731)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 193
                                                 '(1 10 7 0 11 1 8 0 7 12 1 10
                                                   7 0 13 2 14 0 8 8 15 1 14 8
                                                   0 16 1 8 17 0 18 1 14 8 0 19
                                                   1 6 20 0 21 1 8 22 0 23 2 8
                                                   7 0 7 25 0 7 0 26 2 7 22 0 0
                                                   27 0 6 17 29 1 6 31 0 32 1
                                                   33 20 31 34 0 6 9 36 1 9 17
                                                   0 37 2 17 22 0 0 38 1 9 0 0
                                                   39 1 9 40 0 41 1 9 14 0 42 2
                                                   14 0 0 0 43 1 14 0 0 44 1 14
                                                   45 0 46 1 6 9 0 48 1 50 49 9
                                                   51 2 8 0 0 0 52 2 8 53 0 0
                                                   54 1 14 0 8 55 1 14 0 0 56 2
                                                   9 0 14 0 57 1 6 0 9 58 0 6
                                                   14 59 1 14 8 0 60 0 6 45 64
                                                   2 9 14 0 14 66 2 8 67 67 67
                                                   68 1 14 22 0 69 1 71 0 7 72
                                                   2 75 73 74 8 76 2 73 71 0 71
                                                   77 2 79 73 78 9 80 0 6 81 82
                                                   1 6 83 81 84 1 85 8 83 86 1
                                                   88 87 0 89 1 88 0 87 90 2 71
                                                   17 0 88 91 1 17 22 0 92 1 71
                                                   0 88 93 2 95 6 0 94 96 2 6 0
                                                   14 0 97 2 71 0 0 0 98 2 99 0
                                                   0 0 100 2 102 101 101 99 103
                                                   2 101 0 104 0 105 1 0 101 88
                                                   106 0 7 17 107 1 7 0 108 109
                                                   1 111 0 110 112 0 0 111 113
                                                   1 6 22 7 114 1 95 94 0 115 2
                                                   6 0 0 0 116 0 6 0 117 1 6 20
                                                   0 118 2 7 0 0 17 119 2 7 0 0
                                                   0 120 2 7 0 0 0 121 1 7 22 0
                                                   122 2 7 53 0 0 123 1 125 94
                                                   0 126 1 8 7 0 127 1 7 0 110
                                                   128 1 8 0 0 129 2 8 0 7 0
                                                   130 1 6 0 31 131 0 6 0 133 0
                                                   7 0 134 2 8 0 7 17 135 2 14
                                                   0 0 17 136 1 6 22 0 137 1 95
                                                   0 110 138 1 6 83 81 140 1 83
                                                   53 0 141 1 83 94 0 142 2 83
                                                   31 0 94 143 0 17 0 145 2 94
                                                   22 0 0 146 0 6 83 147 2 83
                                                   31 31 0 148 2 31 22 149 0
                                                   150 2 95 17 152 0 153 0 6 83
                                                   156 0 6 83 157 2 83 0 0 0
                                                   158 1 83 14 0 159 2 14 0 0
                                                   94 160 2 14 0 0 0 161 2 94
                                                   53 0 0 162 0 6 108 163 1 31
                                                   94 0 165 0 14 0 166 2 14 22
                                                   0 0 167 0 10 0 168 2 94 22 0
                                                   0 169 1 8 7 0 170 2 10 0 7 7
                                                   171 1 172 94 0 173 2 10 22 0
                                                   0 174 1 95 0 0 175 2 83 0 17
                                                   17 176 1 83 94 0 177 2 180
                                                   178 179 83 181 1 178 0 0 182
                                                   1 178 183 0 184 1 8 186 0
                                                   187 2 6 22 0 7 188 2 14 0 0
                                                   62 190 2 6 0 0 191 192 1 0
                                                   20 0 35 2 0 0 125 8 155 1 0
                                                   81 81 139 0 0 111 113 2 0 22
                                                   7 7 70 1 0 0 0 132 0 0 17
                                                   154 1 0 81 81 185 1 0 101 88
                                                   106 1 0 22 0 151 2 0 22 0 7
                                                   28 2 0 22 0 8 189 1 0 22 0
                                                   24 0 0 45 47 0 0 17 164 3 0
                                                   7 0 7 7 124 0 0 45 65 2 0 0
                                                   0 62 193 1 0 81 81 144 2 0
                                                   61 0 62 63 0 0 22 30)))))
           '|lookupComplete|)) 
