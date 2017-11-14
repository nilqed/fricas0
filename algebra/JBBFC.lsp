
(DEFPARAMETER |JetBundleBaseFunctionCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |JetBundleBaseFunctionCategory;|)) 

(DEFPARAMETER |JetBundleBaseFunctionCategory;AL| 'NIL) 

(DEFUN |JetBundleBaseFunctionCategory| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluate| #1#)
                       |JetBundleBaseFunctionCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |JetBundleBaseFunctionCategory;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (|JetBundleBaseFunctionCategory;| #1#)))
               |JetBundleBaseFunctionCategory;AL|))
      #2#)))) 

(DEFUN |JetBundleBaseFunctionCategory;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|JetBundleBaseFunctionCategory;CAT|)
                                    ('T
                                     (LETT |JetBundleBaseFunctionCategory;CAT|
                                           (|Join|
                                            (|JetBundleFunctionCategory|
                                             '|t#1|))
                                           . #2=(|JetBundleBaseFunctionCategory|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|JetBundleBaseFunctionCategory|
                         (|devaluate| |t#1|)))))) 
