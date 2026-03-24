
(DEFPARAMETER |ExpressionSpace2;CAT| 'NIL) 

(DECLAIM (NOTINLINE |ExpressionSpace2;|)) 

(DEFPARAMETER |ExpressionSpace2;AL| 'NIL) 

(DEFUN |ExpressionSpace2| (|t#1|)
  (LET (#1=#:G19 (#2=#:G20 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |ExpressionSpace2;AL|)) (CDR #1#))
          (T
           (SETQ |ExpressionSpace2;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|ExpressionSpace2;| #2#)))
                            |ExpressionSpace2;AL|))
           #1#)))) 

(DEFUN |ExpressionSpace2;| (|t#1|)
  (SPROG ((#1=#:G18 NIL))
         (PROG1
             (LETT #1#
                   (|subst_in_cat| '(|t#1|) (LIST |t#1|)
                                   (COND (|ExpressionSpace2;CAT|)
                                         ('T
                                          (LETT |ExpressionSpace2;CAT|
                                                (|Join| (|Comparable|)
                                                        (|RetractableTo|
                                                         '|t#1|)
                                                        (|InnerEvalable| '|t#1|
                                                                         '%)
                                                        (|Evalable| '%)
                                                        (|mkCategory|
                                                         '(((|elt|
                                                             (%
                                                              (|BasicOperator|)
                                                              %))
                                                            T)
                                                           ((|elt|
                                                             (%
                                                              (|BasicOperator|)
                                                              % %))
                                                            T)
                                                           ((|elt|
                                                             (%
                                                              (|BasicOperator|)
                                                              % % %))
                                                            T)
                                                           ((|elt|
                                                             (%
                                                              (|BasicOperator|)
                                                              % % % %))
                                                            T)
                                                           ((|elt|
                                                             (%
                                                              (|BasicOperator|)
                                                              % % % % %))
                                                            T)
                                                           ((|elt|
                                                             (%
                                                              (|BasicOperator|)
                                                              % % % % % %))
                                                            T)
                                                           ((|elt|
                                                             (%
                                                              (|BasicOperator|)
                                                              % % % % % % %))
                                                            T)
                                                           ((|elt|
                                                             (%
                                                              (|BasicOperator|)
                                                              % % % % % % % %))
                                                            T)
                                                           ((|elt|
                                                             (%
                                                              (|BasicOperator|)
                                                              % % % % % % % %
                                                              %))
                                                            T)
                                                           ((|elt|
                                                             (%
                                                              (|BasicOperator|)
                                                              (|List| %)))
                                                            T)
                                                           ((|subst|
                                                             (% %
                                                              (|Equation| %)))
                                                            T)
                                                           ((|subst|
                                                             (% %
                                                              (|List|
                                                               (|Equation|
                                                                %))))
                                                            T)
                                                           ((|subst|
                                                             (% %
                                                              (|List| |t#1|)
                                                              (|List| %)))
                                                            T)
                                                           ((|box| (% %)) T)
                                                           ((|paren| (% %)) T)
                                                           ((|distribute|
                                                             (% %))
                                                            T)
                                                           ((|distribute|
                                                             (% % %))
                                                            T)
                                                           ((|height|
                                                             ((|NonNegativeInteger|)
                                                              %))
                                                            T)
                                                           ((|mainKernel|
                                                             ((|Union| |t#1|
                                                                       "failed")
                                                              %))
                                                            T)
                                                           ((|kernels|
                                                             ((|List| |t#1|)
                                                              %))
                                                            T)
                                                           ((|kernels|
                                                             ((|List| |t#1|)
                                                              (|List| %)))
                                                            T)
                                                           ((|tower|
                                                             ((|List| |t#1|)
                                                              %))
                                                            T)
                                                           ((|tower|
                                                             ((|List| |t#1|)
                                                              (|List| %)))
                                                            T)
                                                           ((|operators|
                                                             ((|List|
                                                               (|BasicOperator|))
                                                              %))
                                                            T)
                                                           ((|operator|
                                                             ((|BasicOperator|)
                                                              (|BasicOperator|)))
                                                            T)
                                                           ((|belong?|
                                                             ((|Boolean|)
                                                              (|BasicOperator|)))
                                                            T)
                                                           ((|is?|
                                                             ((|Boolean|) %
                                                              (|BasicOperator|)))
                                                            T)
                                                           ((|is?|
                                                             ((|Boolean|) %
                                                              (|Symbol|)))
                                                            T)
                                                           ((|kernel|
                                                             (%
                                                              (|BasicOperator|)
                                                              %))
                                                            T)
                                                           ((|kernel|
                                                             (%
                                                              (|BasicOperator|)
                                                              (|List| %)))
                                                            T)
                                                           ((|map|
                                                             (% (|Mapping| % %)
                                                              |t#1|))
                                                            T)
                                                           ((|freeOf?|
                                                             ((|Boolean|) % %))
                                                            T)
                                                           ((|freeOf?|
                                                             ((|Boolean|) %
                                                              (|Symbol|)))
                                                            T)
                                                           ((|eval|
                                                             (% %
                                                              (|List|
                                                               (|Symbol|))
                                                              (|List|
                                                               (|Mapping| %
                                                                          %))))
                                                            T)
                                                           ((|eval|
                                                             (% %
                                                              (|List|
                                                               (|Symbol|))
                                                              (|List|
                                                               (|Mapping| %
                                                                          (|List|
                                                                           %)))))
                                                            T)
                                                           ((|eval|
                                                             (% % (|Symbol|)
                                                              (|Mapping| %
                                                                         (|List|
                                                                          %))))
                                                            T)
                                                           ((|eval|
                                                             (% % (|Symbol|)
                                                              (|Mapping| % %)))
                                                            T)
                                                           ((|eval|
                                                             (% %
                                                              (|List|
                                                               (|BasicOperator|))
                                                              (|List|
                                                               (|Mapping| %
                                                                          %))))
                                                            T)
                                                           ((|eval|
                                                             (% %
                                                              (|List|
                                                               (|BasicOperator|))
                                                              (|List|
                                                               (|Mapping| %
                                                                          (|List|
                                                                           %)))))
                                                            T)
                                                           ((|eval|
                                                             (% %
                                                              (|BasicOperator|)
                                                              (|Mapping| %
                                                                         (|List|
                                                                          %))))
                                                            T)
                                                           ((|eval|
                                                             (% %
                                                              (|BasicOperator|)
                                                              (|Mapping| % %)))
                                                            T)
                                                           ((|minPoly|
                                                             ((|SparseUnivariatePolynomial|
                                                               %)
                                                              |t#1|))
                                                            (|has| % (|Ring|)))
                                                           ((|definingPolynomial|
                                                             (% %))
                                                            (|has| % (|Ring|)))
                                                           ((|even?|
                                                             ((|Boolean|) %))
                                                            (|has| %
                                                                   (|RetractableTo|
                                                                    (|Integer|))))
                                                           ((|odd?|
                                                             ((|Boolean|) %))
                                                            (|has| %
                                                                   (|RetractableTo|
                                                                    (|Integer|)))))
                                                         NIL NIL NIL)))))))
           (SETELT #1# 0 (LIST '|ExpressionSpace2| |t#1|))))) 
