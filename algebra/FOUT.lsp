
(SDEFUN |FOUT;convert_mr;RIRS;1|
        ((|f|
          (|Record| (|:| |mantissa| (|Integer|)) (|:| |exponent| (|Integer|))))
         (|d| (|Integer|))
         (|mr|
          (|Record| (|:| |default?| (|Boolean|))
                    (|:| |trim_trailing_zeros?| (|Boolean|))
                    (|:| |out_mode| (|String|)) (|:| |spacing| (|Integer|))
                    (|:| |separator| (|Character|))))
         (% (|String|)))
        (COND
         ((EQUAL (QVELT |mr| 2) "fixed")
          (SPADCALL |f| |d| |mr| (QREFELT % 10)))
         ((EQUAL (QVELT |mr| 2) "floating")
          (SPADCALL |f| |d| |mr| (QREFELT % 11)))
         ((EQUAL (QVELT |mr| 2) "general")
          (SPADCALL |f| |d| |mr| (QREFELT % 12)))
         ('T (|error| "convert_mr: bad output mode")))) 

(SDEFUN |FOUT;convert_to_decimal;RIR;2|
        ((|f|
          (|Record| (|:| |mantissa| (|Integer|)) (|:| |exponent| (|Integer|))))
         (|d| (|Integer|))
         (%
          (|Record| (|:| |mantissa| (|Integer|))
                    (|:| |exponent| (|Integer|)))))
        (SPROG
         ((|dfm1| (|Integer|)) (|r1| #1=(|Integer|)) (|q1| #2=(|Integer|))
          (|#G8| #3=(|Record| (|:| |quotient| #2#) (|:| |remainder| #1#)))
          (|e10| #4=(|Integer|)) (#5=#:G60 NIL) (|r| #1#) (|q| #2#) (|#G7| #3#)
          (#6=#:G56 NIL)
          (|dm|
           (|Record| (|:| |mantissa| (|Integer|))
                     (|:| |exponent| (|Integer|))))
          (|ldm|
           (|Record| (|:| |mantissa| (|Integer|))
                     (|:| |exponent| (|Integer|))))
          (|le10|
           #7=(|Record| (|:| |mantissa| (|Integer|))
                        (|:| |exponent| (|Integer|))))
          (|n10| #8=(|Integer|)) (#9=#:G54 NIL) (|d10| #8#) (#10=#:G49 NIL)
          (|ed| #4#)
          (|l10|
           (|Record| (|:| |mantissa| (|Integer|))
                     (|:| |exponent| (|Integer|))))
          (|lf|
           (|Record| (|:| |mantissa| (|Integer|))
                     (|:| |exponent| (|Integer|))))
          (|le| #7#)
          (|lm|
           (|Record| (|:| |mantissa| (|Integer|))
                     (|:| |exponent| (|Integer|))))
          (|e| (|Integer|)) (|m| #8#) (#11=#:G43 NIL)
          (|ba1| (|PositiveInteger|)) (#12=#:G41 NIL) (|ea| (|Integer|))
          (|ba0| (|Integer|)))
         (SEQ (LETT |ba0| (+ (QUOTIENT2 (* |d| 70777) 21306) 1))
              (LETT |m| (QCAR |f|)) (LETT |e| (QCDR |f|))
              (LETT |ea| (ABS (+ (INTEGER-LENGTH |m|) |e|)))
              (LETT |ba1|
                    (PROG1 (LETT #12# (+ (+ |ba0| (INTEGER-LENGTH |ea|)) 25))
                      (|check_subtype2| (> #12# 0) '(|PositiveInteger|)
                                        '(|Integer|) #12#)))
              (COND
               ((> (INTEGER-LENGTH |m|) |ba1|)
                (SEQ (LETT |ed| (- (INTEGER-LENGTH |m|) |ba1|))
                     (LETT |m|
                           (QUOTIENT2 |m|
                                      (EXPT 2
                                            (PROG1 (LETT #11# |ed|)
                                              (|check_subtype2| (>= #11# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #11#)))))
                     (EXIT (LETT |e| (+ |e| |ed|))))))
              (LETT |lm| (SPADCALL (CONS |m| 0) |ba1| (QREFELT % 16)))
              (LETT |le|
                    (SPADCALL (CONS |e| 0) (SPADCALL |ba1| (QREFELT % 17))
                              |ba1| (QREFELT % 18)))
              (LETT |lf| (SPADCALL |lm| |le| |ba1| (QREFELT % 19)))
              (LETT |l10| (SPADCALL |ba1| (QREFELT % 20)))
              (LETT |ed| (- (QCDR |lf|) (QCDR |l10|))) (LETT |n10| (QCAR |lf|))
              (LETT |d10| (QCAR |l10|))
              (COND
               ((< |ed| 0)
                (SEQ (LETT |ed| (- |ed|))
                     (EXIT
                      (LETT |d10|
                            (* |d10|
                               (EXPT 2
                                     (PROG1 (LETT #10# |ed|)
                                       (|check_subtype2| (>= #10# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|)
                                                         #10#))))))))
               (#13='T
                (LETT |n10|
                      (* |n10|
                         (EXPT 2
                               (PROG1 (LETT #9# |ed|)
                                 (|check_subtype2| (>= #9# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #9#)))))))
              (LETT |e10| (- (QUOTIENT2 |n10| |d10|) |d|))
              (LETT |le10|
                    (SPADCALL (CONS |e10| 0) |l10| |ba1| (QREFELT % 18)))
              (LETT |ldm| (SPADCALL |lf| |le10| |ba1| (QREFELT % 21)))
              (LETT |dm| (SPADCALL |ldm| |ba1| (QREFELT % 22)))
              (EXIT
               (COND ((>= (QCDR |dm|) 0) (|error| "impossible"))
                     (#13#
                      (SEQ
                       (PROGN
                        (LETT |#G7|
                              (DIVIDE2 (QCAR |dm|)
                                       (EXPT 2
                                             (PROG1
                                                 (LETT #6#
                                                       (- (- (QCDR |dm|)) 1))
                                               (|check_subtype2| (>= #6# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #6#)))))
                        (LETT |q| (QCAR |#G7|))
                        (LETT |r| (QCDR |#G7|))
                        |#G7|)
                       (LETT |dfm1| (QUOTIENT2 |q| 2))
                       (COND
                        ((ODDP |q|)
                         (COND ((> |r| 0) (LETT |dfm1| (+ |dfm1| 1))))))
                       (COND
                        ((>= |dfm1|
                             (EXPT 10
                                   (PROG1 (LETT #5# |d|)
                                     (|check_subtype2| (>= #5# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #5#))))
                         (SEQ (LETT |e10| (+ |e10| 1))
                              (PROGN
                               (LETT |#G8| (DIVIDE2 |q| 10))
                               (LETT |q1| (QCAR |#G8|))
                               (LETT |r1| (QCDR |#G8|))
                               |#G8|)
                              (LETT |dfm1| (QUOTIENT2 |q1| 2))
                              (EXIT
                               (COND
                                ((ODDP |q1|)
                                 (COND
                                  ((OR (> |r1| 0) (> |r| 0))
                                   (LETT |dfm1| (+ |dfm1| 1))))))))))
                       (EXIT (CONS |dfm1| |e10|))))))))) 

(SDEFUN |FOUT;insert_separators_from_left|
        ((|s| (|String|))
         (|mr|
          (|Record| (|:| |default?| (|Boolean|))
                    (|:| |trim_trailing_zeros?| (|Boolean|))
                    (|:| |out_mode| (|String|)) (|:| |spacing| #1=(|Integer|))
                    (|:| |separator| (|Character|))))
         (% (|String|)))
        (SPROG
         ((|j| (|Integer|)) (#2=#:G75 NIL) (|i| NIL) (|t| (|String|))
          (#3=#:G67 NIL) (|n| (|Integer|)) (|sp| #1#))
         (SEQ (LETT |sp| (QVELT |mr| 3))
              (EXIT
               (COND ((ZEROP |sp|) |s|)
                     ('T
                      (SEQ (LETT |n| (QCSIZE |s|))
                           (LETT |t|
                                 (|make_string_code|
                                  (PROG1
                                      (LETT #3#
                                            (+ |n| (QUOTIENT2 (- |n| 1) |sp|)))
                                    (|check_subtype2| (>= #3# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #3#))
                                  (QVELT |mr| 4)))
                           (LETT |j| 1)
                           (SEQ (LETT |i| 1) (LETT #2# |n|) G190
                                (COND ((|greater_SI| |i| #2#) (GO G191)))
                                (SEQ
                                 (SPADCALL |t| |j|
                                           (SPADCALL |s| |i| (QREFELT % 25))
                                           (QREFELT % 26))
                                 (COND
                                  ((EQL (REM |i| |sp|) 0)
                                   (LETT |j| (+ |j| 1))))
                                 (EXIT (LETT |j| (+ |j| 1))))
                                (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                (EXIT NIL))
                           (EXIT |t|)))))))) 

(SDEFUN |FOUT;insert_separators_from_right|
        ((|s| (|String|))
         (|mr|
          (|Record| (|:| |default?| (|Boolean|))
                    (|:| |trim_trailing_zeros?| (|Boolean|))
                    (|:| |out_mode| (|String|)) (|:| |spacing| #1=(|Integer|))
                    (|:| |separator| (|Character|))))
         (% (|String|)))
        (SPROG
         ((|j| (|Integer|)) (|i| NIL) (|t| (|String|)) (#2=#:G77 NIL)
          (|n| (|Integer|)) (|sp| #1#))
         (SEQ (LETT |sp| (QVELT |mr| 3))
              (EXIT
               (COND ((ZEROP |sp|) |s|)
                     ('T
                      (SEQ (LETT |n| (QCSIZE |s|))
                           (LETT |t|
                                 (|make_string_code|
                                  (PROG1
                                      (LETT #2#
                                            (+ |n| (QUOTIENT2 (- |n| 1) |sp|)))
                                    (|check_subtype2| (>= #2# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #2#))
                                  (QVELT |mr| 4)))
                           (LETT |j| (QCSIZE |t|))
                           (SEQ (LETT |i| |n|) G190
                                (COND ((< |i| 1) (GO G191)))
                                (SEQ
                                 (SPADCALL |t| |j|
                                           (SPADCALL |s| |i| (QREFELT % 25))
                                           (QREFELT % 26))
                                 (COND
                                  ((EQL (REM (+ (- |n| |i|) 1) |sp|) 0)
                                   (LETT |j| (- |j| 1))))
                                 (EXIT (LETT |j| (- |j| 1))))
                                (LETT |i| (+ |i| -1)) (GO G190) G191
                                (EXIT NIL))
                           (EXIT |t|)))))))) 

(SDEFUN |FOUT;split_digits|
        ((|s| #1=(|String|)) (|top_digit| (|Integer|)) (% (|List| (|String|))))
        (SPROG
         ((|s2| #1#) (#2=#:G88 NIL) (|s1| (|String|)) (#3=#:G86 NIL)
          (|n1| (|NonNegativeInteger|)))
         (SEQ (LETT |s2| |s|) (LETT |n1| (QCSIZE |s|))
              (LETT |s1|
                    (COND
                     ((> |top_digit| 0)
                      (COND
                       ((< |top_digit| |n1|)
                        (SEQ
                         (LETT |s2|
                               (SPADCALL |s|
                                         (SPADCALL (+ |top_digit| 1) |n1|
                                                   (QREFELT % 28))
                                         (QREFELT % 29)))
                         (EXIT
                          (SPADCALL |s| (SPADCALL 1 |top_digit| (QREFELT % 28))
                                    (QREFELT % 29)))))
                       (#4='T
                        (SEQ (LETT |s2| "0")
                             (EXIT
                              (STRCONC |s|
                                       (|make_string_code|
                                        (PROG1 (LETT #3# (- |top_digit| |n1|))
                                          (|check_subtype2| (>= #3# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #3#))
                                        (|STR_to_CHAR| #5="0"))))))))
                     (#4# "0")))
              (COND
               ((< |top_digit| 0)
                (LETT |s2|
                      (STRCONC
                       (|make_string_code|
                        (PROG1 (LETT #2# (- |top_digit|))
                          (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #2#))
                        (|STR_to_CHAR| #5#))
                       |s2|))))
              (EXIT (LIST |s1| |s2|))))) 

(SDEFUN |FOUT;fixed_default|
        ((|f|
          (|Record| (|:| |mantissa| #1=(|Integer|))
                    (|:| |exponent| #2=(|Integer|))))
         (|d| (|Integer|))
         (|mr|
          (|Record| (|:| |default?| (|Boolean|))
                    (|:| |trim_trailing_zeros?| (|Boolean|))
                    (|:| |out_mode| (|String|)) (|:| |spacing| (|Integer|))
                    (|:| |separator| (|Character|))))
         (% (|String|)))
        (SPROG
         ((|s2| (|String|)) (|s1| (|String|)) (|#G24| #3=(|List| (|String|)))
          (|#G23| #3#) (|s| (|String|)) (|top_digit| (|Integer|))
          (|n0| (|NonNegativeInteger|)) (|de| #2#) (|dm| #1#)
          (|#G22|
           #4=(|Record| (|:| |mantissa| (|Integer|))
                        (|:| |exponent| (|Integer|))))
          (|df| #4#))
         (SEQ (LETT |df| (SPADCALL |f| |d| (QREFELT % 23)))
              (PROGN
               (LETT |#G22| |df|)
               (LETT |dm| (QCAR |#G22|))
               (LETT |de| (QCDR |#G22|))
               |#G22|)
              (LETT |s| (STRINGIMAGE |dm|)) (LETT |n0| (QCSIZE |s|))
              (LETT |top_digit| (+ |de| |n0|))
              (COND
               ((QVELT |mr| 1)
                (LETT |s| (SPADCALL |s| (|STR_to_CHAR| "0") (QREFELT % 30)))))
              (PROGN
               (LETT |#G23| (|FOUT;split_digits| |s| |top_digit| %))
               (LETT |#G24| |#G23|)
               (LETT |s1| (|SPADfirst| |#G24|))
               (LETT |#G24| (CDR |#G24|))
               (LETT |s2| (|SPADfirst| |#G24|))
               |#G23|)
              (LETT |s1|
                    (STRCONC (|FOUT;insert_separators_from_right| |s1| |mr| %)
                             "."))
              (LETT |s2| (|FOUT;insert_separators_from_left| |s2| |mr| %))
              (EXIT (STRCONC |s1| |s2|))))) 

(SDEFUN |FOUT;fixed_mr;RIRS;7|
        ((|f|
          (|Record| (|:| |mantissa| (|Integer|)) (|:| |exponent| (|Integer|))))
         (|d| (|Integer|))
         (|mr|
          (|Record| (|:| |default?| (|Boolean|))
                    (|:| |trim_trailing_zeros?| (|Boolean|))
                    (|:| |out_mode| (|String|)) (|:| |spacing| (|Integer|))
                    (|:| |separator| (|Character|))))
         (% (|String|)))
        (SPROG
         ((|s2| #1=(|String|)) (#2=#:G124 NIL) (|s1| (|String|))
          (|nm| #3=(|Integer|)) (#4=#:G122 NIL) (#5=#:G117 NIL)
          (|#G33| #6=(|List| #1#)) (|#G32| #6#) (|s| (|String|))
          (|top_digit| #7=(|Integer|)) (|n0| (|NonNegativeInteger|))
          (|e| #8=(|Integer|)) (|m| #3#) (|d10h| (|NonNegativeInteger|))
          (|r| #9=(|Integer|)) (|q| #10=(|Integer|))
          (|#G31| (|Record| (|:| |quotient| #10#) (|:| |remainder| #9#)))
          (|d10| (|PositiveInteger|)) (#11=#:G112 NIL) (#12=#:G110 NIL)
          (|top_bit| #7#) (|i| (|Integer|)) (|lb| (|Integer|)) (#13=#:G99 NIL)
          (|#G30| (|Record| (|:| |mantissa| #3#) (|:| |exponent| #8#))))
         (SEQ
          (PROGN
           (LETT |#G30| |f|)
           (LETT |m| (QCAR |#G30|))
           (LETT |e| (QCDR |#G30|))
           |#G30|)
          (EXIT
           (COND
            ((EQL |m| 0)
             (COND ((QVELT |mr| 1) "0.0")
                   (#14='T
                    (STRCONC "0"
                             (STRCONC "."
                                      (|FOUT;insert_separators_from_left|
                                       (|make_string_code|
                                        (PROG1 (LETT #13# |d|)
                                          (|check_subtype2| (>= #13# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #13#))
                                        (|STR_to_CHAR| #15="0"))
                                       |mr| %))))))
            ((< |m| 0)
             (STRCONC "-"
                      (SPADCALL (CONS (- |m|) |e|) |d| |mr| (QREFELT % 10))))
            (#14#
             (SEQ
              (COND
               ((EVENP |m|)
                (COND
                 ((< |e| 0)
                  (EXIT
                   (SEQ (LETT |lb| (INTEGER-LENGTH |m|))
                        (COND ((< (- |e|) |lb|) (LETT |lb| (- |e|))))
                        (LETT |i| 0)
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND
                                 ((<= |i| |lb|)
                                  (NULL (SPADCALL |m| |i| (QREFELT % 32))))
                                 ('T NIL)))
                               (GO G191)))
                             (SEQ (EXIT (LETT |i| (+ |i| 1)))) NIL (GO G190)
                             G191 (EXIT NIL))
                        (LETT |m| (ASH |m| (- |i|)))
                        (EXIT
                         (SPADCALL (CONS |m| (+ |e| |i|)) |d| |mr|
                                   (QREFELT % 10)))))))))
              (EXIT
               (COND
                ((< |e| 0)
                 (COND ((QVELT |mr| 0) (|FOUT;fixed_default| |f| |d| |mr| %))
                       (#14#
                        (SEQ (LETT |e| (- |e|))
                             (LETT |top_bit| (- (INTEGER-LENGTH |m|) |e|))
                             (EXIT
                              (COND
                               ((< (* (+ |top_bit| 2) 12655) (- (* |d| 42039)))
                                (SPADCALL (CONS 0 0) |d| |mr| (QREFELT % 10)))
                               (#14#
                                (SEQ
                                 (LETT |m|
                                       (* |m|
                                          (EXPT 5
                                                (PROG1 (LETT #12# |e|)
                                                  (|check_subtype2| (>= #12# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #12#)))))
                                 (COND
                                  ((> |e| |d|)
                                   (SEQ
                                    (LETT |d10|
                                          (EXPT 10
                                                (PROG1 (LETT #11# (- |e| |d|))
                                                  (|check_subtype2| (>= #11# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #11#))))
                                    (PROGN
                                     (LETT |#G31| (DIVIDE2 |m| |d10|))
                                     (LETT |q| (QCAR |#G31|))
                                     (LETT |r| (QCDR |#G31|))
                                     |#G31|)
                                    (LETT |d10h| (QUOTIENT2 |d10| 2))
                                    (LETT |m|
                                          (COND ((< |r| |d10h|) |q|)
                                                ((> |r| |d10h|) (+ |q| 1))
                                                (#14#
                                                 (COND ((EVENP |q|) |q|)
                                                       (#14# (+ |q| 1))))))
                                    (EXIT (LETT |e| |d|)))))
                                 (LETT |s| (STRINGIMAGE |m|))
                                 (LETT |n0| (QCSIZE |s|))
                                 (LETT |top_digit| (- |n0| |e|))
                                 (COND
                                  ((QVELT |mr| 1)
                                   (LETT |s|
                                         (SPADCALL |s| (|STR_to_CHAR| #15#)
                                                   (QREFELT % 30)))))
                                 (PROGN
                                  (LETT |#G32|
                                        (|FOUT;split_digits| |s| |top_digit|
                                         %))
                                  (LETT |#G33| |#G32|)
                                  (LETT |s1| (|SPADfirst| |#G33|))
                                  (LETT |#G33| (CDR |#G33|))
                                  (LETT |s2| (|SPADfirst| |#G33|))
                                  |#G32|)
                                 (COND ((EQL |d| 0) (LETT |s2| "")))
                                 (LETT |s1|
                                       (STRCONC
                                        (|FOUT;insert_separators_from_right|
                                         |s1| |mr| %)
                                        "."))
                                 (COND
                                  ((< |e| |d|)
                                   (LETT |s2|
                                         (STRCONC |s2|
                                                  (|make_string_code|
                                                   (PROG1
                                                       (LETT #5# (- |d| |e|))
                                                     (|check_subtype2|
                                                      (>= #5# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #5#))
                                                   (|STR_to_CHAR| #15#))))))
                                 (LETT |s2|
                                       (|FOUT;insert_separators_from_left| |s2|
                                        |mr| %))
                                 (EXIT (STRCONC |s1| |s2|))))))))))
                (#14#
                 (SEQ
                  (LETT |nm|
                        (COND ((EQL |e| 0) |m|)
                              (#14#
                               (ASH
                                (PROG1 (LETT #4# |m|)
                                  (|check_subtype2| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #4#))
                                |e|))))
                  (LETT |s1|
                        (|FOUT;insert_separators_from_right| (STRINGIMAGE |nm|)
                         |mr| %))
                  (LETT |s2|
                        (COND ((QVELT |mr| 0) ".0")
                              (#14#
                               (STRCONC "."
                                        (|FOUT;insert_separators_from_left|
                                         (|make_string_code|
                                          (PROG1 (LETT #2# |d|)
                                            (|check_subtype2| (>= #2# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #2#))
                                          (|STR_to_CHAR| #15#))
                                         |mr| %)))))
                  (EXIT (STRCONC |s1| |s2|))))))))))))) 

(SDEFUN |FOUT;floating_mr;RIRS;8|
        ((|f|
          (|Record| (|:| |mantissa| (|Integer|)) (|:| |exponent| (|Integer|))))
         (|d| (|Integer|))
         (|mr|
          (|Record| (|:| |default?| (|Boolean|))
                    (|:| |trim_trailing_zeros?| (|Boolean|))
                    (|:| |out_mode| (|String|)) (|:| |spacing| (|Integer|))
                    (|:| |separator| (|Character|))))
         (% (|String|)))
        (SPROG
         ((|s| (|String|)) (|n0| (|NonNegativeInteger|)) (|e| (|Integer|))
          (|m| (|Integer|))
          (|#G40|
           (|Record| (|:| |mantissa| (|Integer|))
                     (|:| |exponent| (|Integer|))))
          (|es| (|String|)))
         (SEQ
          (COND ((EQL (QCAR |f|) 0) "0.0")
                ((< (QCAR |f|) 0)
                 (STRCONC "-"
                          (SPADCALL (CONS (- (QCAR |f|)) (QCDR |f|)) |d| |mr|
                                    (QREFELT % 11))))
                (#1='T
                 (SEQ
                  (LETT |es| (COND ((ZEROP (QVELT |mr| 3)) "E") (#1# " E ")))
                  (EXIT
                   (COND
                    ((ZEROP (QCDR |f|))
                     (SEQ (LETT |s| (STRINGIMAGE (QCAR |f|)))
                          (EXIT
                           (SPADCALL
                            (LIST "0."
                                  (|FOUT;insert_separators_from_left| |s| |mr|
                                   %)
                                  |es| (STRINGIMAGE (QCSIZE |s|)))
                            (QREFELT % 34)))))
                    (#1#
                     (SEQ
                      (PROGN
                       (LETT |#G40| (SPADCALL |f| |d| (QREFELT % 23)))
                       (LETT |m| (QCAR |#G40|))
                       (LETT |e| (QCDR |#G40|))
                       |#G40|)
                      (LETT |s| (STRINGIMAGE |m|)) (LETT |n0| (QCSIZE |s|))
                      (COND
                       ((QVELT |mr| 1)
                        (LETT |s|
                              (SPADCALL |s| (|STR_to_CHAR| "0")
                                        (QREFELT % 30)))))
                      (LETT |s|
                            (STRCONC "0."
                                     (|FOUT;insert_separators_from_left| |s|
                                      |mr| %)))
                      (EXIT
                       (STRCONC |s|
                                (STRCONC |es|
                                         (STRINGIMAGE (+ |e| |n0|))))))))))))))) 

(SDEFUN |FOUT;general_mr;RIRS;9|
        ((|f|
          (|Record| (|:| |mantissa| (|Integer|)) (|:| |exponent| (|Integer|))))
         (|d| (|Integer|))
         (|mr|
          (|Record| (|:| |default?| (|Boolean|))
                    (|:| |trim_trailing_zeros?| (|Boolean|))
                    (|:| |out_mode| (|String|)) (|:| |spacing| (|Integer|))
                    (|:| |separator| (|Character|))))
         (% (|String|)))
        (SPROG
         ((|s2| (|String|)) (|s1| (|String|)) (|es| (|String|))
          (|#G48| #1=(|List| (|String|))) (|#G47| #1#) (|s| (|String|))
          (|top_digit| (|Integer|)) (|n0| (|NonNegativeInteger|))
          (|e| #2=(|Integer|)) (|m| #3=(|Integer|))
          (|#G46|
           (|Record| (|:| |mantissa| (|Integer|))
                     (|:| |exponent| (|Integer|))))
          (|#G45| (|Record| (|:| |mantissa| #3#) (|:| |exponent| #2#))))
         (SEQ
          (PROGN
           (LETT |#G45| |f|)
           (LETT |m| (QCAR |#G45|))
           (LETT |e| (QCDR |#G45|))
           |#G45|)
          (EXIT
           (COND ((EQL |m| 0) "0.0")
                 ((< |m| 0)
                  (STRCONC "-"
                           (SPADCALL (CONS (- |m|) |e|) |d| |mr|
                                     (QREFELT % 12))))
                 ((EQL |e| 0)
                  (SEQ (LETT |s| (STRINGIMAGE |m|))
                       (LETT |top_digit| (QCSIZE |s|))
                       (COND
                        ((OR (QVELT |mr| 0) (< |top_digit| (+ |d| 3)))
                         (EXIT
                          (STRCONC
                           (|FOUT;insert_separators_from_right| |s| |mr| %)
                           ".0"))))
                       (LETT |s1|
                             (STRCONC "0."
                                      (|FOUT;insert_separators_from_left|
                                       (SPADCALL |s|
                                                 (SPADCALL 1 |d|
                                                           (QREFELT % 28))
                                                 (QREFELT % 29))
                                       |mr| %)))
                       (LETT |es|
                             (COND ((ZEROP (QVELT |mr| 3)) "E") (#4='T " E ")))
                       (EXIT
                        (STRCONC |s1|
                                 (STRCONC |es|
                                          (STRINGIMAGE
                                           (- |top_digit| |d|)))))))
                 (#4#
                  (SEQ
                   (PROGN
                    (LETT |#G46| (SPADCALL |f| |d| (QREFELT % 23)))
                    (LETT |m| (QCAR |#G46|))
                    (LETT |e| (QCDR |#G46|))
                    |#G46|)
                   (LETT |s| (STRINGIMAGE |m|)) (LETT |n0| (QCSIZE |s|))
                   (LETT |top_digit| (+ |e| |n0|))
                   (COND
                    ((QVELT |mr| 1)
                     (LETT |s|
                           (SPADCALL |s| (|STR_to_CHAR| "0") (QREFELT % 30)))))
                   (EXIT
                    (COND
                     ((< -6 |top_digit|)
                      (COND
                       ((< |top_digit| (+ |d| 2))
                        (SEQ
                         (PROGN
                          (LETT |#G47| (|FOUT;split_digits| |s| |top_digit| %))
                          (LETT |#G48| |#G47|)
                          (LETT |s1| (|SPADfirst| |#G48|))
                          (LETT |#G48| (CDR |#G48|))
                          (LETT |s2| (|SPADfirst| |#G48|))
                          |#G47|)
                         (LETT |s1|
                               (STRCONC
                                (|FOUT;insert_separators_from_right| |s1| |mr|
                                 %)
                                "."))
                         (LETT |s2|
                               (|FOUT;insert_separators_from_left| |s2| |mr|
                                %))
                         (EXIT (STRCONC |s1| |s2|))))
                       (#4#
                        (SEQ
                         (LETT |es|
                               (COND ((ZEROP (QVELT |mr| 3)) #5="E")
                                     (#4# #6=" E ")))
                         (LETT |s1|
                               (STRCONC #7="0."
                                        (|FOUT;insert_separators_from_left| |s|
                                         |mr| %)))
                         (LETT |s2| (STRCONC |es| (STRINGIMAGE |top_digit|)))
                         (EXIT (STRCONC |s1| |s2|))))))
                     (#4#
                      (SEQ
                       (LETT |es|
                             (COND ((ZEROP (QVELT |mr| 3)) #5#) (#4# #6#)))
                       (LETT |s1|
                             (STRCONC #7#
                                      (|FOUT;insert_separators_from_left| |s|
                                       |mr| %)))
                       (LETT |s2| (STRCONC |es| (STRINGIMAGE |top_digit|)))
                       (EXIT (STRCONC |s1| |s2|))))))))))))) 

(DECLAIM (NOTINLINE |FloatingPointConvertion;|)) 

(DEFUN |FloatingPointConvertion;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|FloatingPointConvertion|))
          (LETT % (GETREFV 35))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|FloatingPointConvertion| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |FloatingPointConvertion| ()
  (SPROG NIL
         (PROG (#1=#:G157)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|FloatingPointConvertion|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|FloatingPointConvertion|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|FloatingPointConvertion;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|FloatingPointConvertion|)))))))))) 

(MAKEPROP '|FloatingPointConvertion| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|String|)
              (|Record| (|:| |mantissa| 8) (|:| |exponent| 8)) (|Integer|)
              (|Record| (|:| |default?| 31) (|:| |trim_trailing_zeros?| 31)
                        (|:| |out_mode| 6) (|:| |spacing| 8)
                        (|:| |separator| 24))
              |FOUT;fixed_mr;RIRS;7| |FOUT;floating_mr;RIRS;8|
              |FOUT;general_mr;RIRS;9| |FOUT;convert_mr;RIRS;1|
              (|PositiveInteger|) (|FloatElementaryFunctions|) (0 . |log|)
              (6 . |log2|) (11 . |times|) (18 . |plus|) (25 . |log10|)
              (30 . |minus|) (37 . |exp|) |FOUT;convert_to_decimal;RIR;2|
              (|Character|) (43 . |elt|) (49 . |setelt!|)
              (|UniversalSegment| 8) (56 . SEGMENT) (62 . |elt|)
              (68 . |rightTrim|) (|Boolean|) (74 . |bit?|) (|List| %)
              (80 . |concat|))
           '#(|general_mr| 85 |floating_mr| 92 |fixed_mr| 99
              |convert_to_decimal| 106 |convert_mr| 112)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|fixed_mr|
                                 ((|String|)
                                  (|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|Integer|)
                                  (|Record| (|:| |default?| (|Boolean|))
                                            (|:| |trim_trailing_zeros?|
                                                 (|Boolean|))
                                            (|:| |out_mode| (|String|))
                                            (|:| |spacing| (|Integer|))
                                            (|:| |separator| (|Character|)))))
                                T)
                              '((|floating_mr|
                                 ((|String|)
                                  (|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|Integer|)
                                  (|Record| (|:| |default?| (|Boolean|))
                                            (|:| |trim_trailing_zeros?|
                                                 (|Boolean|))
                                            (|:| |out_mode| (|String|))
                                            (|:| |spacing| (|Integer|))
                                            (|:| |separator| (|Character|)))))
                                T)
                              '((|general_mr|
                                 ((|String|)
                                  (|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|Integer|)
                                  (|Record| (|:| |default?| (|Boolean|))
                                            (|:| |trim_trailing_zeros?|
                                                 (|Boolean|))
                                            (|:| |out_mode| (|String|))
                                            (|:| |spacing| (|Integer|))
                                            (|:| |separator| (|Character|)))))
                                T)
                              '((|convert_mr|
                                 ((|String|)
                                  (|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|Integer|)
                                  (|Record| (|:| |default?| (|Boolean|))
                                            (|:| |trim_trailing_zeros?|
                                                 (|Boolean|))
                                            (|:| |out_mode| (|String|))
                                            (|:| |spacing| (|Integer|))
                                            (|:| |separator| (|Character|)))))
                                T)
                              '((|convert_to_decimal|
                                 ((|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|Record| (|:| |mantissa| (|Integer|))
                                            (|:| |exponent| (|Integer|)))
                                  (|Integer|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 34
                                            '(2 15 7 7 14 16 1 15 7 14 17 3 15
                                              7 7 7 14 18 3 15 7 7 7 14 19 1 15
                                              7 14 20 3 15 7 7 7 14 21 2 15 7 7
                                              14 22 2 6 24 0 8 25 3 6 24 0 8 24
                                              26 2 27 0 8 8 28 2 6 0 0 27 29 2
                                              6 0 0 24 30 2 8 31 0 0 32 1 6 0
                                              33 34 3 0 6 7 8 9 12 3 0 6 7 8 9
                                              11 3 0 6 7 8 9 10 2 0 7 7 8 23 3
                                              0 6 7 8 9 13)))))
           '|lookupComplete|)) 
