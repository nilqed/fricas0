
; )package "BOOT"

(IN-PACKAGE "BOOT")

; $compBugPrefix :=      '"Bug!"

(EVAL-WHEN (EVAL LOAD) (SETQ |$compBugPrefix| "Bug!"))

; $compErrorPrefix :=    '"Error"

(EVAL-WHEN (EVAL LOAD) (SETQ |$compErrorPrefix| "Error"))

; $nopos   := ['noposition]

(EVAL-WHEN (EVAL LOAD) (SETQ |$nopos| (LIST '|noposition|)))

; $showKeyNum   :=        NIL

(EVAL-WHEN (EVAL LOAD) (SETQ |$showKeyNum| NIL))

; $newcompErrorCount :=           0

(EVAL-WHEN (EVAL LOAD) (SETQ |$newcompErrorCount| 0))

; $preLength := 11

(EVAL-WHEN (EVAL LOAD) (SETQ |$preLength| 11))

; $LOGLENGTH := $LINELENGTH - 6

(EVAL-WHEN (EVAL LOAD) (SETQ $LOGLENGTH (- $LINELENGTH 6)))

; $specificMsgTags := []

(EVAL-WHEN (EVAL LOAD) (SETQ |$specificMsgTags| NIL))

; $imPrTagGuys := ['unimple, 'bug, 'debug, 'say, 'warn]

(EVAL-WHEN (EVAL LOAD)
  (SETQ |$imPrTagGuys| (LIST '|unimple| '|bug| '|debug| '|say| '|warn|)))

; $toWhereGuys := ['fileOnly, 'screenOnly ]

(EVAL-WHEN (EVAL LOAD) (SETQ |$toWhereGuys| (LIST '|fileOnly| '|screenOnly|)))

; $imPrGuys    := ['imPr]

(EVAL-WHEN (EVAL LOAD) (SETQ |$imPrGuys| (LIST '|imPr|)))

; $repGuys     := ['noRep, 'rep]

(EVAL-WHEN (EVAL LOAD) (SETQ |$repGuys| (LIST '|noRep| '|rep|)))

; $attrCats    := ['$imPrGuys, '$toWhereGuys, '$repGuys]

(EVAL-WHEN (EVAL LOAD)
  (SETQ |$attrCats| (LIST '|$imPrGuys| '|$toWhereGuys| '|$repGuys|)))

; $ncMsgList := nil

(EVAL-WHEN (EVAL LOAD) (SETQ |$ncMsgList| NIL))

; ncSoftError(pos, erMsgKey, erArgL) ==
;   $newcompErrorCount := $newcompErrorCount + 1
;   desiredMsg erMsgKey =>
;     processKeyedError _
;        msgCreate ('error, pos, erMsgKey, erArgL, $compErrorPrefix)

(DEFUN |ncSoftError| (|pos| |erMsgKey| |erArgL|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |$newcompErrorCount| (+ |$newcompErrorCount| 1))
      (COND
       ((|desiredMsg| |erMsgKey|)
        (|processKeyedError|
         (|msgCreate| '|error| |pos| |erMsgKey| |erArgL|
          |$compErrorPrefix|))))))))

; ncHardError(pos, erMsgKey, erArgL) ==
;   $newcompErrorCount := $newcompErrorCount + 1
;   desiredMsg erMsgKey =>
;       processKeyedError(
;           msgCreate('error, pos, erMsgKey, erArgL, $compErrorPrefix))
;   ncError()

(DEFUN |ncHardError| (|pos| |erMsgKey| |erArgL|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |$newcompErrorCount| (+ |$newcompErrorCount| 1))
      (COND
       ((|desiredMsg| |erMsgKey|)
        (|processKeyedError|
         (|msgCreate| '|error| |pos| |erMsgKey| |erArgL| |$compErrorPrefix|)))
       ('T (|ncError|)))))))

; ncBug (erMsgKey, erArgL) ==
;   $newcompErrorCount := $newcompErrorCount + 1
;   processKeyedError (
;         msgCreate('bug, $nopos, erMsgKey, erArgL, $compBugPrefix))
;   -- The next line is to try to deal with some reported cases of unwanted
;   -- backtraces appearing, MCD.
;   ENABLE_BACKTRACE(nil)
;   BREAK()
;   ncAbort()

(DEFUN |ncBug| (|erMsgKey| |erArgL|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |$newcompErrorCount| (+ |$newcompErrorCount| 1))
      (|processKeyedError|
       (|msgCreate| '|bug| |$nopos| |erMsgKey| |erArgL| |$compBugPrefix|))
      (ENABLE_BACKTRACE NIL)
      (BREAK)
      (|ncAbort|)))))

; msgCreate(tag,posWTag,key,argL,optPre) ==
;     if PAIRP key then tag := 'old
;     msg := [tag,posWTag,key,argL,optPre,NIL]
;     putDatabaseStuff msg
;     initImPr    msg
;     initToWhere msg
;     msg

(DEFUN |msgCreate| (|tag| |posWTag| |key| |argL| |optPre|)
  (PROG (|msg|)
    (RETURN
     (PROGN
      (COND ((CONSP |key|) (SETQ |tag| '|old|)))
      (SETQ |msg| (LIST |tag| |posWTag| |key| |argL| |optPre| NIL))
      (|putDatabaseStuff| |msg|)
      (|initImPr| |msg|)
      (|initToWhere| |msg|)
      |msg|))))

; processKeyedError msg ==
;     getMsgTag? msg = 'old  =>                                 --temp
;         erMsg := getMsgKey msg                                --temp
;         if pre := getMsgPrefix? msg then                      --temp
;           erMsg := ['%b, pre, '%d, :erMsg]                    --temp
;         sayBrightly ['"old msg from ",_
;           CallerName 4,:erMsg]                  --temp
;     msgImPr? msg =>
;       msgOutputter msg
;     $ncMsgList := cons (msg, $ncMsgList)

(DEFUN |processKeyedError| (|msg|)
  (PROG (|erMsg| |pre|)
    (RETURN
     (COND
      ((EQ (|getMsgTag?| |msg|) '|old|)
       (PROGN
        (SETQ |erMsg| (|getMsgKey| |msg|))
        (COND
         ((SETQ |pre| (|getMsgPrefix?| |msg|))
          (SETQ |erMsg| (CONS '|%b| (CONS |pre| (CONS '|%d| |erMsg|))))))
        (|sayBrightly|
         (CONS "old msg from " (CONS (|CallerName| 4) |erMsg|)))))
      ((|msgImPr?| |msg|) (|msgOutputter| |msg|))
      ('T (SETQ |$ncMsgList| (CONS |msg| |$ncMsgList|)))))))

; putDatabaseStuff msg ==
;     [text,attributes] := getMsgInfoFromKey msg
;     if attributes then setMsgUnforcedAttrList(msg,aL)
;     setMsgText(msg,text)

(DEFUN |putDatabaseStuff| (|msg|)
  (PROG (|LETTMP#1| |text| |attributes|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (|getMsgInfoFromKey| |msg|))
      (SETQ |text| (CAR |LETTMP#1|))
      (SETQ |attributes| (CADR |LETTMP#1|))
      (COND (|attributes| (|setMsgUnforcedAttrList| |msg| |aL|)))
      (|setMsgText| |msg| |text|)))))

; getMsgInfoFromKey msg ==
;     msgText :=
;         msgKey := getMsgKey? msg =>   --temp  oldmsgs use key tostoretext
;            getKeyedMsg msgKey
;         getMsgKey msg                  --temp oldmsgs
;     msgText := segmentKeyedMsg  msgText
;     [msgText,attributes] := removeAttributes msgText
;     msgText := substituteSegmentedMsg(msgText, getMsgArgL msg)
;     [msgText,attributes]

(DEFUN |getMsgInfoFromKey| (|msg|)
  (PROG (|msgKey| |msgText| |LETTMP#1| |attributes|)
    (RETURN
     (PROGN
      (SETQ |msgText|
              (COND
               ((SETQ |msgKey| (|getMsgKey?| |msg|)) (|getKeyedMsg| |msgKey|))
               ('T (|getMsgKey| |msg|))))
      (SETQ |msgText| (|segmentKeyedMsg| |msgText|))
      (SETQ |LETTMP#1| (|removeAttributes| |msgText|))
      (SETQ |msgText| (CAR |LETTMP#1|))
      (SETQ |attributes| (CADR |LETTMP#1|))
      (SETQ |msgText|
              (|substituteSegmentedMsg| |msgText| (|getMsgArgL| |msg|)))
      (LIST |msgText| |attributes|)))))

; processChPosesForOneLine msgList ==
;     chPosList := posPointers msgList
;     for msg in msgList repeat
;         if getMsgFTTag? msg then
;             putFTText (msg,chPosList)
;         posLetter := rest ASSOC(poCharPosn getMsgPos msg, chPosList)
;         oldPre := getMsgPrefix msg
;         setMsgPrefix (msg,STRCONC(oldPre,_
;                      make_full_CVEC($preLength - 4 - SIZE oldPre), posLetter))
;     leaderMsg := makeLeaderMsg chPosList
;     NCONC(msgList,LIST leaderMsg)  --a back cons

(DEFUN |processChPosesForOneLine| (|msgList|)
  (PROG (|chPosList| |posLetter| |oldPre| |leaderMsg|)
    (RETURN
     (PROGN
      (SETQ |chPosList| (|posPointers| |msgList|))
      ((LAMBDA (|bfVar#1| |msg|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#1|) (PROGN (SETQ |msg| (CAR |bfVar#1|)) NIL))
            (RETURN NIL))
           ('T
            (PROGN
             (COND ((|getMsgFTTag?| |msg|) (|putFTText| |msg| |chPosList|)))
             (SETQ |posLetter|
                     (CDR
                      (ASSOC (|poCharPosn| (|getMsgPos| |msg|)) |chPosList|)))
             (SETQ |oldPre| (|getMsgPrefix| |msg|))
             (|setMsgPrefix| |msg|
              (STRCONC |oldPre|
               (|make_full_CVEC| (- (- |$preLength| 4) (SIZE |oldPre|)))
               |posLetter|)))))
          (SETQ |bfVar#1| (CDR |bfVar#1|))))
       |msgList| NIL)
      (SETQ |leaderMsg| (|makeLeaderMsg| |chPosList|))
      (NCONC |msgList| (LIST |leaderMsg|))))))

; posPointers msgList ==
; --gets all the char posns for msgs on one line
; --associates them with a uppercase letter
;     pointers  := '"ABCDEFGHIJKLMONPQRS"
;     increment := 0
;     posList:= []
;     ftPosList := []
;     for msg in msgList repeat
;        pos := poCharPosn getMsgPos msg
;        if pos ~= IFCAR posList then
;          posList := [pos,:posList]
;        if getMsgFTTag?(msg) = 'FROMTO then
;          ftPosList := [poCharPosn getMsgPos2 msg,:ftPosList]
;     for toPos in ftPosList repeat
;            posList := insertPos(toPos,posList)
;     for pos in posList repeat
;         posLetterList := [[pos,:pointers.increment],:posLetterList]
;         increment := increment + 1
;     posLetterList

(DEFUN |posPointers| (|msgList|)
  (PROG (|pointers| |increment| |posList| |ftPosList| |pos| |posLetterList|)
    (RETURN
     (PROGN
      (SETQ |pointers| "ABCDEFGHIJKLMONPQRS")
      (SETQ |increment| 0)
      (SETQ |posList| NIL)
      (SETQ |ftPosList| NIL)
      ((LAMBDA (|bfVar#2| |msg|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#2|) (PROGN (SETQ |msg| (CAR |bfVar#2|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (SETQ |pos| (|poCharPosn| (|getMsgPos| |msg|)))
             (COND
              ((NOT (EQUAL |pos| (IFCAR |posList|)))
               (SETQ |posList| (CONS |pos| |posList|))))
             (COND
              ((EQ (|getMsgFTTag?| |msg|) 'FROMTO)
               (SETQ |ftPosList|
                       (CONS (|poCharPosn| (|getMsgPos2| |msg|))
                             |ftPosList|)))))))
          (SETQ |bfVar#2| (CDR |bfVar#2|))))
       |msgList| NIL)
      ((LAMBDA (|bfVar#3| |toPos|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#3|) (PROGN (SETQ |toPos| (CAR |bfVar#3|)) NIL))
            (RETURN NIL))
           (#1# (SETQ |posList| (|insertPos| |toPos| |posList|))))
          (SETQ |bfVar#3| (CDR |bfVar#3|))))
       |ftPosList| NIL)
      ((LAMBDA (|bfVar#4| |pos|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#4|) (PROGN (SETQ |pos| (CAR |bfVar#4|)) NIL))
            (RETURN NIL))
           (#1#
            (PROGN
             (SETQ |posLetterList|
                     (CONS (CONS |pos| (ELT |pointers| |increment|))
                           |posLetterList|))
             (SETQ |increment| (+ |increment| 1)))))
          (SETQ |bfVar#4| (CDR |bfVar#4|))))
       |posList| NIL)
      |posLetterList|))))

; insertPos(newPos,posList) ==
; --inserts a position in the proper place of a position list
; --used for the 2nd pos of a fromto
;     done := false
;     bot  := [0,:posList]
;     top  := []
;     while not done repeat
;         top  := [first bot, :top]
;         bot  := rest bot
;         NULL(bot) =>
;            top := [newPos,:top]
;            done := true
;         pos  := first bot
;         done :=
;           pos < newPos => false
;           pos = newPos => true
;           pos > newPos =>
;             top := [newPos,:top]
;             true
;     for pp in top repeat
;         bot := [pp, :bot]
;     rest bot

(DEFUN |insertPos| (|newPos| |posList|)
  (PROG (|done| |bot| |top| |pos|)
    (RETURN
     (PROGN
      (SETQ |done| NIL)
      (SETQ |bot| (CONS 0 |posList|))
      (SETQ |top| NIL)
      ((LAMBDA ()
         (LOOP
          (COND (|done| (RETURN NIL))
                (#1='T
                 (PROGN
                  (SETQ |top| (CONS (CAR |bot|) |top|))
                  (SETQ |bot| (CDR |bot|))
                  (COND
                   ((NULL |bot|)
                    (PROGN (SETQ |top| (CONS |newPos| |top|)) (SETQ |done| T)))
                   (#1#
                    (PROGN
                     (SETQ |pos| (CAR |bot|))
                     (SETQ |done|
                             (COND ((< |pos| |newPos|) NIL)
                                   ((EQUAL |pos| |newPos|) T)
                                   ((< |newPos| |pos|)
                                    (PROGN
                                     (SETQ |top| (CONS |newPos| |top|))
                                     T)))))))))))))
      ((LAMBDA (|bfVar#5| |pp|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#5|) (PROGN (SETQ |pp| (CAR |bfVar#5|)) NIL))
            (RETURN NIL))
           (#1# (SETQ |bot| (CONS |pp| |bot|))))
          (SETQ |bfVar#5| (CDR |bfVar#5|))))
       |top| NIL)
      (CDR |bot|)))))

; putFTText (msg,chPosList) ==
;     tag := getMsgFTTag? msg
;     pos := poCharPosn getMsgPos msg
;     charMarker := rest ASSOC(pos, chPosList)
;     tag = 'FROM =>
;         markingText := ['"(from ",charMarker,'" and on) "]
;         setMsgText(msg,[:markingText,:getMsgText msg])
;     tag = 'TO =>
;         markingText := ['"(up to ",charMarker,'") "]
;         setMsgText(msg,[:markingText,:getMsgText msg])
;     tag = 'FROMTO =>
;        pos2 := poCharPosn getMsgPos2 msg
;        charMarker2 := rest ASSOC(pos2, chPosList)
;        markingText := ['"(from ",charMarker,'" up to ",_
;            charMarker2,'") "]
;        setMsgText(msg,[:markingText,:getMsgText msg])

(DEFUN |putFTText| (|msg| |chPosList|)
  (PROG (|tag| |pos| |charMarker| |markingText| |pos2| |charMarker2|)
    (RETURN
     (PROGN
      (SETQ |tag| (|getMsgFTTag?| |msg|))
      (SETQ |pos| (|poCharPosn| (|getMsgPos| |msg|)))
      (SETQ |charMarker| (CDR (ASSOC |pos| |chPosList|)))
      (COND
       ((EQ |tag| 'FROM)
        (PROGN
         (SETQ |markingText| (LIST "(from " |charMarker| " and on) "))
         (|setMsgText| |msg| (APPEND |markingText| (|getMsgText| |msg|)))))
       ((EQ |tag| 'TO)
        (PROGN
         (SETQ |markingText| (LIST "(up to " |charMarker| ") "))
         (|setMsgText| |msg| (APPEND |markingText| (|getMsgText| |msg|)))))
       ((EQ |tag| 'FROMTO)
        (PROGN
         (SETQ |pos2| (|poCharPosn| (|getMsgPos2| |msg|)))
         (SETQ |charMarker2| (CDR (ASSOC |pos2| |chPosList|)))
         (SETQ |markingText|
                 (LIST "(from " |charMarker| " up to " |charMarker2| ") "))
         (|setMsgText| |msg| (APPEND |markingText| (|getMsgText| |msg|))))))))))

; rep (c,n)  ==
;     n > 0 =>
;       make_full_CVEC2(n, c)
;     '""

(DEFUN |rep| (|c| |n|)
  (PROG () (RETURN (COND ((< 0 |n|) (|make_full_CVEC2| |n| |c|)) ('T "")))))

; From   pos == ['FROM,   pos]

(DEFUN |From| (|pos|) (PROG () (RETURN (LIST 'FROM |pos|))))

; To     pos == ['TO,     pos]

(DEFUN |To| (|pos|) (PROG () (RETURN (LIST 'TO |pos|))))

; FromTo (pos1,pos2) == ['FROMTO, pos1, pos2]

(DEFUN |FromTo| (|pos1| |pos2|) (PROG () (RETURN (LIST 'FROMTO |pos1| |pos2|))))

; processMsgList (erMsgList,lineList) ==
;     $outputList :local := []--grows in queueUp errors
;     $noRepList :local := []--grows in queueUp errors
;     erMsgList  := erMsgSort erMsgList
;     for line in lineList repeat
;         msgLine := makeMsgFromLine line
;         $outputList := [msgLine,:$outputList]
;         globalNumOfLine := poGlobalLinePosn getMsgPos msgLine
;         erMsgList :=
;              queueUpErrors(globalNumOfLine,erMsgList)
;     $outputList := append(erMsgList,$outputList)  --the nopos's
;     listOutputter reverse $outputList

(DEFUN |processMsgList| (|erMsgList| |lineList|)
  (PROG (|$noRepList| |$outputList| |globalNumOfLine| |msgLine|)
    (DECLARE (SPECIAL |$noRepList| |$outputList|))
    (RETURN
     (PROGN
      (SETQ |$outputList| NIL)
      (SETQ |$noRepList| NIL)
      (SETQ |erMsgList| (|erMsgSort| |erMsgList|))
      ((LAMBDA (|bfVar#6| |line|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#6|) (PROGN (SETQ |line| (CAR |bfVar#6|)) NIL))
            (RETURN NIL))
           ('T
            (PROGN
             (SETQ |msgLine| (|makeMsgFromLine| |line|))
             (SETQ |$outputList| (CONS |msgLine| |$outputList|))
             (SETQ |globalNumOfLine|
                     (|poGlobalLinePosn| (|getMsgPos| |msgLine|)))
             (SETQ |erMsgList|
                     (|queueUpErrors| |globalNumOfLine| |erMsgList|)))))
          (SETQ |bfVar#6| (CDR |bfVar#6|))))
       |lineList| NIL)
      (SETQ |$outputList| (APPEND |erMsgList| |$outputList|))
      (|listOutputter| (REVERSE |$outputList|))))))

; erMsgSort erMsgList ==
;     [msgWPos,msgWOPos] := erMsgSep erMsgList
;     msgWPos  := listSort(function erMsgCompare, msgWPos)
;     msgWOPos := reverse msgWOPos
;     [:msgWPos,:msgWOPos]

(DEFUN |erMsgSort| (|erMsgList|)
  (PROG (|LETTMP#1| |msgWPos| |msgWOPos|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (|erMsgSep| |erMsgList|))
      (SETQ |msgWPos| (CAR |LETTMP#1|))
      (SETQ |msgWOPos| (CADR |LETTMP#1|))
      (SETQ |msgWPos| (|listSort| #'|erMsgCompare| |msgWPos|))
      (SETQ |msgWOPos| (REVERSE |msgWOPos|))
      (APPEND |msgWPos| |msgWOPos|)))))

; erMsgCompare(ob1,ob2)==
;     pos1 :=  getMsgPos ob1
;     pos2 :=  getMsgPos ob2
;     compareposns(pos2,pos1)

(DEFUN |erMsgCompare| (|ob1| |ob2|)
  (PROG (|pos1| |pos2|)
    (RETURN
     (PROGN
      (SETQ |pos1| (|getMsgPos| |ob1|))
      (SETQ |pos2| (|getMsgPos| |ob2|))
      (|compareposns| |pos2| |pos1|)))))

; erMsgSep erMsgList ==
;     msgWPos  := []
;     msgWOPos := []
;     for msg in erMsgList repeat
;         if poNopos? getMsgPos msg then
;           msgWOPos := [msg,:msgWOPos]
;         else
;           msgWPos  := [msg,:msgWPos]
;     [msgWPos,msgWOPos]

(DEFUN |erMsgSep| (|erMsgList|)
  (PROG (|msgWPos| |msgWOPos|)
    (RETURN
     (PROGN
      (SETQ |msgWPos| NIL)
      (SETQ |msgWOPos| NIL)
      ((LAMBDA (|bfVar#7| |msg|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#7|) (PROGN (SETQ |msg| (CAR |bfVar#7|)) NIL))
            (RETURN NIL))
           (#1='T
            (COND
             ((|poNopos?| (|getMsgPos| |msg|))
              (SETQ |msgWOPos| (CONS |msg| |msgWOPos|)))
             (#1# (SETQ |msgWPos| (CONS |msg| |msgWPos|))))))
          (SETQ |bfVar#7| (CDR |bfVar#7|))))
       |erMsgList| NIL)
      (LIST |msgWPos| |msgWOPos|)))))

; getLinePos line  == first line

(DEFUN |getLinePos| (|line|) (PROG () (RETURN (CAR |line|))))

; getLineText line == rest line

(DEFUN |getLineText| (|line|) (PROG () (RETURN (CDR |line|))))

; queueUpErrors(globalNumOfLine,msgList)==
;     thisPosMsgs  := []
;     for msg in msgList _
;       while thisPosIsLess(getMsgPos msg,globalNumOfLine) repeat
;     --these are msgs that refer to positions from earlier compilations
;         if not redundant (msg,notThisPosMsgs) then
;            notThisPosMsgs := [msg,:notThisPosMsgs]
;         msgList := rest msgList
;     for msg in msgList _
;       while thisPosIsEqual(getMsgPos msg,globalNumOfLine) repeat
;        if not redundant (msg,thisPosMsgs) then
;            thisPosMsgs := [msg,:thisPosMsgs]
;        msgList := rest msgList
;     if thisPosMsgs then
;         thisPosMsgs := processChPosesForOneLine  thisPosMsgs
;         $outputList := NCONC(thisPosMsgs,$outputList)
;     if notThisPosMsgs then
;         $outputList := NCONC(notThisPosMsgs,$outputList)
;     msgList

(DEFUN |queueUpErrors| (|globalNumOfLine| |msgList|)
  (PROG (|thisPosMsgs| |notThisPosMsgs|)
    (RETURN
     (PROGN
      (SETQ |thisPosMsgs| NIL)
      ((LAMBDA (|bfVar#8| |msg|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#8|) (PROGN (SETQ |msg| (CAR |bfVar#8|)) NIL)
                (NOT (|thisPosIsLess| (|getMsgPos| |msg|) |globalNumOfLine|)))
            (RETURN NIL))
           (#1='T
            (PROGN
             (COND
              ((NULL (|redundant| |msg| |notThisPosMsgs|))
               (SETQ |notThisPosMsgs| (CONS |msg| |notThisPosMsgs|))))
             (SETQ |msgList| (CDR |msgList|)))))
          (SETQ |bfVar#8| (CDR |bfVar#8|))))
       |msgList| NIL)
      ((LAMBDA (|bfVar#9| |msg|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#9|) (PROGN (SETQ |msg| (CAR |bfVar#9|)) NIL)
                (NOT (|thisPosIsEqual| (|getMsgPos| |msg|) |globalNumOfLine|)))
            (RETURN NIL))
           (#1#
            (PROGN
             (COND
              ((NULL (|redundant| |msg| |thisPosMsgs|))
               (SETQ |thisPosMsgs| (CONS |msg| |thisPosMsgs|))))
             (SETQ |msgList| (CDR |msgList|)))))
          (SETQ |bfVar#9| (CDR |bfVar#9|))))
       |msgList| NIL)
      (COND
       (|thisPosMsgs|
        (SETQ |thisPosMsgs| (|processChPosesForOneLine| |thisPosMsgs|))
        (SETQ |$outputList| (NCONC |thisPosMsgs| |$outputList|))))
      (COND
       (|notThisPosMsgs|
        (SETQ |$outputList| (NCONC |notThisPosMsgs| |$outputList|))))
      |msgList|))))

; redundant(msg,thisPosMsgs) ==
;     found := NIL
;     if msgNoRep? msg then
;         for item in $noRepList repeat
;             sameMsg?(msg,item) => return (found := true)
;         $noRepList := [msg,$noRepList]
;     found or MEMBER(msg,thisPosMsgs)

(DEFUN |redundant| (|msg| |thisPosMsgs|)
  (PROG (|found|)
    (RETURN
     (PROGN
      (SETQ |found| NIL)
      (COND
       ((|msgNoRep?| |msg|)
        ((LAMBDA (|bfVar#10| |item|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#10|) (PROGN (SETQ |item| (CAR |bfVar#10|)) NIL))
              (RETURN NIL))
             ('T
              (COND
               ((|sameMsg?| |msg| |item|)
                (IDENTITY (RETURN (SETQ |found| T)))))))
            (SETQ |bfVar#10| (CDR |bfVar#10|))))
         |$noRepList| NIL)
        (SETQ |$noRepList| (LIST |msg| |$noRepList|))))
      (OR |found| (MEMBER |msg| |thisPosMsgs|))))))

; sameMsg? (msg1,msg2) ==
;     (getMsgKey   msg1 = getMsgKey  msg2) and _
;     (getMsgArgL  msg1 = getMsgArgL msg2)

(DEFUN |sameMsg?| (|msg1| |msg2|)
  (PROG ()
    (RETURN
     (AND (EQUAL (|getMsgKey| |msg1|) (|getMsgKey| |msg2|))
          (EQUAL (|getMsgArgL| |msg1|) (|getMsgArgL| |msg2|))))))

; thisPosIsLess(pos,num) ==
;     poNopos? pos => NIL
;     poGlobalLinePosn pos < num

(DEFUN |thisPosIsLess| (|pos| |num|)
  (PROG ()
    (RETURN
     (COND ((|poNopos?| |pos|) NIL)
           ('T (< (|poGlobalLinePosn| |pos|) |num|))))))

; thisPosIsEqual(pos,num) ==
;     poNopos? pos => NIL
;     poGlobalLinePosn pos = num

(DEFUN |thisPosIsEqual| (|pos| |num|)
  (PROG ()
    (RETURN
     (COND ((|poNopos?| |pos|) NIL)
           ('T (EQUAL (|poGlobalLinePosn| |pos|) |num|))))))

; listOutputter outputList ==
;     for msg in outputList repeat
;         msgOutputter msg

(DEFUN |listOutputter| (|outputList|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#11| |msg|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#11|) (PROGN (SETQ |msg| (CAR |bfVar#11|)) NIL))
           (RETURN NIL))
          ('T (|msgOutputter| |msg|)))
         (SETQ |bfVar#11| (CDR |bfVar#11|))))
      |outputList| NIL))))

; msgOutputter msg  ==
;     st := getStFromMsg msg
;     shouldFlow := not (leader? msg or line? msg)
;     if toScreen? msg then
;        if shouldFlow then
;           st := flowSegmentedMsg(st,$LINELENGTH,0)
;        sayBrightly st
;     if toFile? msg then
;        if shouldFlow then
;           st := flowSegmentedMsg(st,$LOGLENGTH,0)
;        alreadyOpened := alreadyOpened? msg

(DEFUN |msgOutputter| (|msg|)
  (PROG (|st| |shouldFlow| |alreadyOpened|)
    (RETURN
     (PROGN
      (SETQ |st| (|getStFromMsg| |msg|))
      (SETQ |shouldFlow| (NULL (OR (|leader?| |msg|) (|line?| |msg|))))
      (COND
       ((|toScreen?| |msg|)
        (COND
         (|shouldFlow| (SETQ |st| (|flowSegmentedMsg| |st| $LINELENGTH 0))))
        (|sayBrightly| |st|)))
      (COND
       ((|toFile?| |msg|)
        (COND
         (|shouldFlow| (SETQ |st| (|flowSegmentedMsg| |st| $LOGLENGTH 0))))
        (SETQ |alreadyOpened| (|alreadyOpened?| |msg|))))))))

; toScreen? msg ==  getMsgToWhere msg ~= 'fileOnly

(DEFUN |toScreen?| (|msg|)
  (PROG () (RETURN (NOT (EQ (|getMsgToWhere| |msg|) '|fileOnly|)))))

; toFile? msg   ==
;      getMsgToWhere msg ~= 'screenOnly

(DEFUN |toFile?| (|msg|)
  (PROG () (RETURN (NOT (EQ (|getMsgToWhere| |msg|) '|screenOnly|)))))

; alreadyOpened? msg ==
;        not msgImPr? msg

(DEFUN |alreadyOpened?| (|msg|) (PROG () (RETURN (NULL (|msgImPr?| |msg|)))))

; getStFromMsg msg ==
;     $optKeyBlanks : local := '""  --set in setOptKeyBlanks()
;     setOptKeyBlanks()
;     preStL := getPreStL getMsgPrefix? msg
;     getMsgTag  msg = 'line =>
;           [$optKeyBlanks, '"%x1" , :preStL,_
;            getMsgText msg]
;     posStL := getPosStL msg
;     optKey :=
;         $showKeyNum =>
;             msgKey := getMsgKey? msg => PNAME msgKey
;             '"no key  "
;         '""
;     st :=[posStL,getMsgLitSym msg,_
;           optKey,:preStL,_
;           tabbing msg,:getMsgText msg]

(DEFUN |getStFromMsg| (|msg|)
  (PROG (|$optKeyBlanks| |st| |optKey| |msgKey| |posStL| |preStL|)
    (DECLARE (SPECIAL |$optKeyBlanks|))
    (RETURN
     (PROGN
      (SETQ |$optKeyBlanks| "")
      (|setOptKeyBlanks|)
      (SETQ |preStL| (|getPreStL| (|getMsgPrefix?| |msg|)))
      (COND
       ((EQ (|getMsgTag| |msg|) '|line|)
        (CONS |$optKeyBlanks|
              (CONS "%x1" (APPEND |preStL| (CONS (|getMsgText| |msg|) NIL)))))
       (#1='T
        (PROGN
         (SETQ |posStL| (|getPosStL| |msg|))
         (SETQ |optKey|
                 (COND
                  (|$showKeyNum|
                   (COND
                    ((SETQ |msgKey| (|getMsgKey?| |msg|)) (PNAME |msgKey|))
                    (#1# "no key  ")))
                  (#1# "")))
         (SETQ |st|
                 (CONS |posStL|
                       (CONS (|getMsgLitSym| |msg|)
                             (CONS |optKey|
                                   (APPEND |preStL|
                                           (CONS (|tabbing| |msg|)
                                                 (|getMsgText|
                                                  |msg|))))))))))))))

; tabbing msg ==
;     chPos := 2
;     if getMsgPrefix? msg then
;       chPos := chPos + $preLength - 1
;     if $showKeyNum then chPos := chPos + 8
;     ["%t",:chPos]

(DEFUN |tabbing| (|msg|)
  (PROG (|chPos|)
    (RETURN
     (PROGN
      (SETQ |chPos| 2)
      (COND
       ((|getMsgPrefix?| |msg|) (SETQ |chPos| (- (+ |chPos| |$preLength|) 1))))
      (COND (|$showKeyNum| (SETQ |chPos| (+ |chPos| 8))))
      (CONS '|%t| |chPos|)))))

; setOptKeyBlanks() ==
;     $optKeyBlanks :=
;         $showKeyNum => '"%x8"
;         '""

(DEFUN |setOptKeyBlanks| ()
  (PROG ()
    (RETURN (SETQ |$optKeyBlanks| (COND (|$showKeyNum| "%x8") ('T ""))))))

; getPosStL msg ==
;     not showMsgPos? msg => '""
;     msgPos := getMsgPos msg
;     howMuch :=
;         msgImPr? msg =>
;             decideHowMuch (msgPos,$lastPos)
;         listDecideHowMuch (msgPos,$lastPos)
;     $lastPos := msgPos
;     fullPrintedPos := ppos msgPos
;     printedFileName :=  ['"%x2",'"[",:remLine fullPrintedPos,'"]" ]
;     printedLineNum  :=  ['"%x2",'"[",:remFile fullPrintedPos,'"]" ]
;     printedOrigin   :=  ['"%x2",'"[",:fullPrintedPos,'"]" ]
;     howMuch  = 'ORG  => [$optKeyBlanks,:printedOrigin, '%l]
;     howMuch  = 'LINE => [$optKeyBlanks,:printedLineNum, '%l]
;     howMuch  = 'FILE => [$optKeyBlanks,:printedFileName, '%l]
;     howMuch  = 'ALL  => [$optKeyBlanks,:printedFileName, '%l,_
;                          $optKeyBlanks,:printedLineNum,  '%l]
;     '""

(DEFUN |getPosStL| (|msg|)
  (PROG (|msgPos| |howMuch| |fullPrintedPos| |printedFileName| |printedLineNum|
         |printedOrigin|)
    (RETURN
     (COND ((NULL (|showMsgPos?| |msg|)) "")
           (#1='T
            (PROGN
             (SETQ |msgPos| (|getMsgPos| |msg|))
             (SETQ |howMuch|
                     (COND
                      ((|msgImPr?| |msg|)
                       (|decideHowMuch| |msgPos| |$lastPos|))
                      (#1# (|listDecideHowMuch| |msgPos| |$lastPos|))))
             (SETQ |$lastPos| |msgPos|)
             (SETQ |fullPrintedPos| (|ppos| |msgPos|))
             (SETQ |printedFileName|
                     (CONS "%x2"
                           (CONS "["
                                 (APPEND (|remLine| |fullPrintedPos|)
                                         (CONS "]" NIL)))))
             (SETQ |printedLineNum|
                     (CONS "%x2"
                           (CONS "["
                                 (APPEND (|remFile| |fullPrintedPos|)
                                         (CONS "]" NIL)))))
             (SETQ |printedOrigin|
                     (CONS "%x2"
                           (CONS "["
                                 (APPEND |fullPrintedPos| (CONS "]" NIL)))))
             (COND
              ((EQ |howMuch| 'ORG)
               (CONS |$optKeyBlanks|
                     (APPEND |printedOrigin| (CONS '|%l| NIL))))
              ((EQ |howMuch| 'LINE)
               (CONS |$optKeyBlanks|
                     (APPEND |printedLineNum| (CONS '|%l| NIL))))
              ((EQ |howMuch| 'FILE)
               (CONS |$optKeyBlanks|
                     (APPEND |printedFileName| (CONS '|%l| NIL))))
              ((EQ |howMuch| 'ALL)
               (CONS |$optKeyBlanks|
                     (APPEND |printedFileName|
                             (CONS '|%l|
                                   (CONS |$optKeyBlanks|
                                         (APPEND |printedLineNum|
                                                 (CONS '|%l| NIL)))))))
              (#1# ""))))))))

; showMsgPos? msg ==
;     $erMsgToss or (not msgImPr? msg and not msgLeader? msg)

(DEFUN |showMsgPos?| (|msg|)
  (PROG ()
    (RETURN
     (OR |$erMsgToss|
         (AND (NULL (|msgImPr?| |msg|)) (NULL (|msgLeader?| |msg|)))))))

; remFile positionList ==
;         IFCDR IFCDR positionList

(DEFUN |remFile| (|positionList|)
  (PROG () (RETURN (IFCDR (IFCDR |positionList|)))))

; remLine positionList ==
;         [IFCAR positionList]

(DEFUN |remLine| (|positionList|)
  (PROG () (RETURN (LIST (IFCAR |positionList|)))))

; decideHowMuch(pos,oldPos) ==
; --when printing a msg, we wish not to show pos info that was
; --shown for a previous msg with identical pos info.
; --org prints out the word noposition or console
;     ((poNopos? pos) and (poNopos? oldPos)) or _
;       ((poPosImmediate? pos) and (poPosImmediate? oldPos))  => 'NONE
;     (poNopos? pos) or (poPosImmediate? pos) => 'ORG
;     (poNopos? oldPos) or (poPosImmediate? oldPos) => 'ALL
;     poFileName oldPos ~= poFileName pos => 'ALL
;     poLinePosn oldPos ~= poLinePosn pos => 'LINE
;     'NONE

(DEFUN |decideHowMuch| (|pos| |oldPos|)
  (PROG ()
    (RETURN
     (COND
      ((OR (AND (|poNopos?| |pos|) (|poNopos?| |oldPos|))
           (AND (|poPosImmediate?| |pos|) (|poPosImmediate?| |oldPos|)))
       'NONE)
      ((OR (|poNopos?| |pos|) (|poPosImmediate?| |pos|)) 'ORG)
      ((OR (|poNopos?| |oldPos|) (|poPosImmediate?| |oldPos|)) 'ALL)
      ((NOT (EQUAL (|poFileName| |oldPos|) (|poFileName| |pos|))) 'ALL)
      ((NOT (EQUAL (|poLinePosn| |oldPos|) (|poLinePosn| |pos|))) 'LINE)
      ('T 'NONE)))))

; listDecideHowMuch(pos,oldPos) ==
;     ((poNopos? pos) and (poNopos? oldPos)) or _
;       ((poPosImmediate? pos) and (poPosImmediate? oldPos))  => 'NONE
;     (poNopos? pos)     => 'ORG
;     (poNopos? oldPos)  => 'NONE
;     poGlobalLinePosn pos < poGlobalLinePosn oldPos =>
;         poPosImmediate? pos => 'ORG
;         'LINE
;     --(poNopos? pos) or (poPosImmediate? pos) => 'ORG
;     'NONE

(DEFUN |listDecideHowMuch| (|pos| |oldPos|)
  (PROG ()
    (RETURN
     (COND
      ((OR (AND (|poNopos?| |pos|) (|poNopos?| |oldPos|))
           (AND (|poPosImmediate?| |pos|) (|poPosImmediate?| |oldPos|)))
       'NONE)
      ((|poNopos?| |pos|) 'ORG) ((|poNopos?| |oldPos|) 'NONE)
      ((< (|poGlobalLinePosn| |pos|) (|poGlobalLinePosn| |oldPos|))
       (COND ((|poPosImmediate?| |pos|) 'ORG) (#1='T 'LINE)))
      (#1# 'NONE)))))

; getPreStL optPre ==
;     null optPre => [make_full_CVEC(2)]
;     spses :=
;       (extraPlaces := ($preLength - (SIZE optPre) - 3)) > 0 =>
;         make_full_CVEC(extraPlaces)
;       '""
;     ['%b, optPre,spses,'":", '%d]

(DEFUN |getPreStL| (|optPre|)
  (PROG (|extraPlaces| |spses|)
    (RETURN
     (COND ((NULL |optPre|) (LIST (|make_full_CVEC| 2)))
           (#1='T
            (PROGN
             (SETQ |spses|
                     (COND
                      ((< 0
                          (SETQ |extraPlaces|
                                  (- (- |$preLength| (SIZE |optPre|)) 3)))
                       (|make_full_CVEC| |extraPlaces|))
                      (#1# "")))
             (LIST '|%b| |optPre| |spses| ":" '|%d|)))))))

; desiredMsg (erMsgKey,:optCatFlag) ==
;     isKeyQualityP(erMsgKey,'show)   => true
;     isKeyQualityP(erMsgKey,'stifle) => false
;     not null optCatFlag  => first optCatFlag
;     true

(DEFUN |desiredMsg| (|erMsgKey| &REST |optCatFlag|)
  (PROG ()
    (RETURN
     (COND ((|isKeyQualityP| |erMsgKey| '|show|) T)
           ((|isKeyQualityP| |erMsgKey| '|stifle|) NIL)
           ((NULL (NULL |optCatFlag|)) (CAR |optCatFlag|)) ('T T)))))

; isKeyQualityP (key,qual)  ==
;     --returns pair if found, else NIL
;     found := false
;     while not found and (qualPair := ASSOC(key,$specificMsgTags)) repeat
;         if rest qualPair = qual then found := true
;     qualPair

(DEFUN |isKeyQualityP| (|key| |qual|)
  (PROG (|found| |qualPair|)
    (RETURN
     (PROGN
      (SETQ |found| NIL)
      ((LAMBDA ()
         (LOOP
          (COND
           ((NOT
             (AND (NULL |found|)
                  (SETQ |qualPair| (ASSOC |key| |$specificMsgTags|))))
            (RETURN NIL))
           ('T (COND ((EQUAL (CDR |qualPair|) |qual|) (SETQ |found| T))))))))
      |qualPair|))))

; initImPr msg  ==
;     $erMsgToss or MEMQ (getMsgTag msg,$imPrTagGuys) =>
;         setMsgUnforcedAttr (msg,'$imPrGuys,'imPr)

(DEFUN |initImPr| (|msg|)
  (PROG ()
    (RETURN
     (COND
      ((OR |$erMsgToss| (MEMQ (|getMsgTag| |msg|) |$imPrTagGuys|))
       (IDENTITY (|setMsgUnforcedAttr| |msg| '|$imPrGuys| '|imPr|)))))))

; initToWhere msg  ==
;     MEMBER ('trace,getMsgCatAttr (msg,'catless)) =>
;           setMsgUnforcedAttr (msg,'$toWhereGuys,'screenOnly)

(DEFUN |initToWhere| (|msg|)
  (PROG ()
    (RETURN
     (COND
      ((MEMBER '|trace| (|getMsgCatAttr| |msg| '|catless|))
       (IDENTITY
        (|setMsgUnforcedAttr| |msg| '|$toWhereGuys| '|screenOnly|)))))))

; msgImPr? msg ==
;     (getMsgCatAttr (msg,'$imPrGuys) = 'imPr)

(DEFUN |msgImPr?| (|msg|)
  (PROG () (RETURN (EQ (|getMsgCatAttr| |msg| '|$imPrGuys|) '|imPr|))))

; msgNoRep? msg ==
;     (getMsgCatAttr (msg,'$repGuys) = 'noRep)

(DEFUN |msgNoRep?| (|msg|)
  (PROG () (RETURN (EQ (|getMsgCatAttr| |msg| '|$repGuys|) '|noRep|))))

; msgLeader? msg ==
;     getMsgTag msg = 'leader

(DEFUN |msgLeader?| (|msg|)
  (PROG () (RETURN (EQ (|getMsgTag| |msg|) '|leader|))))

; getMsgToWhere msg ==
;     getMsgCatAttr (msg,'$toWhereGuys)

(DEFUN |getMsgToWhere| (|msg|)
  (PROG () (RETURN (|getMsgCatAttr| |msg| '|$toWhereGuys|))))

; getMsgCatAttr  (msg,cat) ==
;     IFCDR ASSQ(cat, ncAlist msg)

(DEFUN |getMsgCatAttr| (|msg| |cat|)
  (PROG () (RETURN (IFCDR (ASSQ |cat| (|ncAlist| |msg|))))))

; setMsgUnforcedAttrList (msg,aL) ==
;     for attr in aL repeat
;         setMsgUnforcedAttr(msg,whichCat attr,attr)

(DEFUN |setMsgUnforcedAttrList| (|msg| |aL|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#12| |attr|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#12|) (PROGN (SETQ |attr| (CAR |bfVar#12|)) NIL))
           (RETURN NIL))
          ('T (|setMsgUnforcedAttr| |msg| (|whichCat| |attr|) |attr|)))
         (SETQ |bfVar#12| (CDR |bfVar#12|))))
      |aL| NIL))))

; setMsgUnforcedAttr(msg,cat,attr) ==
;     cat = 'catless => setMsgCatlessAttr(msg,attr)
;     not ASSQ(cat, ncAlist msg) => ncPutQ(msg,cat,attr)

(DEFUN |setMsgUnforcedAttr| (|msg| |cat| |attr|)
  (PROG ()
    (RETURN
     (COND ((EQ |cat| '|catless|) (|setMsgCatlessAttr| |msg| |attr|))
           ((NULL (ASSQ |cat| (|ncAlist| |msg|)))
            (|ncPutQ| |msg| |cat| |attr|))))))

; setMsgCatlessAttr(msg,attr) ==
;     ncPutQ(msg,catless,CONS (attr, IFCDR ASSQ(catless, ncAlist msg)))

(DEFUN |setMsgCatlessAttr| (|msg| |attr|)
  (PROG ()
    (RETURN
     (|ncPutQ| |msg| |catless|
      (CONS |attr| (IFCDR (ASSQ |catless| (|ncAlist| |msg|))))))))

; whichCat attr ==
;     found := 'catless
;     for cat in $attrCats repeat
;         if ListMember? (attr,EVAL cat) then
;           found := cat
;           return found
;     found

(DEFUN |whichCat| (|attr|)
  (PROG (|found|)
    (RETURN
     (PROGN
      (SETQ |found| '|catless|)
      ((LAMBDA (|bfVar#13| |cat|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#13|) (PROGN (SETQ |cat| (CAR |bfVar#13|)) NIL))
            (RETURN NIL))
           ('T
            (COND
             ((|ListMember?| |attr| (EVAL |cat|)) (SETQ |found| |cat|)
              (RETURN |found|)))))
          (SETQ |bfVar#13| (CDR |bfVar#13|))))
       |$attrCats| NIL)
      |found|))))

; makeLeaderMsg chPosList ==
;     st := make_full_CVEC($preLength - 3)
;     oldPos := -1
;     for [posNum,:posLetter] in reverse chPosList repeat
;         st := STRCONC(st, _
;             rep(char ".", (posNum - oldPos - 1)),posLetter)
;         oldPos := posNum
;     ['leader,$nopos,'nokey,NIL,NIL,[st]]

(DEFUN |makeLeaderMsg| (|chPosList|)
  (PROG (|st| |oldPos| |posNum| |posLetter|)
    (RETURN
     (PROGN
      (SETQ |st| (|make_full_CVEC| (- |$preLength| 3)))
      (SETQ |oldPos| (- 1))
      ((LAMBDA (|bfVar#15| |bfVar#14|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#15|)
                (PROGN (SETQ |bfVar#14| (CAR |bfVar#15|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#14|)
                 (PROGN
                  (SETQ |posNum| (CAR |bfVar#14|))
                  (SETQ |posLetter| (CDR |bfVar#14|))
                  #1#)
                 (PROGN
                  (SETQ |st|
                          (STRCONC |st|
                           (|rep| (|char| '|.|) (- (- |posNum| |oldPos|) 1))
                           |posLetter|))
                  (SETQ |oldPos| |posNum|)))))
          (SETQ |bfVar#15| (CDR |bfVar#15|))))
       (REVERSE |chPosList|) NIL)
      (LIST '|leader| |$nopos| '|nokey| NIL NIL (LIST |st|))))))

; makeMsgFromLine line ==
;     posOfLine  := getLinePos line
;     textOfLine := getLineText line
;     localNumOfLine  :=
;         i := poLinePosn posOfLine
;         stNum := STRINGIMAGE i
;         STRCONC(rep(char " ", ($preLength - 7 - SIZE stNum)),_
;          stNum)
;     ['line,posOfLine,NIL,NIL, STRCONC('"Line", localNumOfLine),_
;         textOfLine]

(DEFUN |makeMsgFromLine| (|line|)
  (PROG (|posOfLine| |textOfLine| |i| |stNum| |localNumOfLine|)
    (RETURN
     (PROGN
      (SETQ |posOfLine| (|getLinePos| |line|))
      (SETQ |textOfLine| (|getLineText| |line|))
      (SETQ |localNumOfLine|
              (PROGN
               (SETQ |i| (|poLinePosn| |posOfLine|))
               (SETQ |stNum| (STRINGIMAGE |i|))
               (STRCONC
                (|rep| (|char| '| |) (- (- |$preLength| 7) (SIZE |stNum|)))
                |stNum|)))
      (LIST '|line| |posOfLine| NIL NIL (STRCONC "Line" |localNumOfLine|)
            |textOfLine|)))))

; getMsgTag msg == ncTag msg

(DEFUN |getMsgTag| (|msg|) (PROG () (RETURN (|ncTag| |msg|))))

; getMsgTag? msg ==
;    IFCAR MEMBER (getMsgTag msg,_
;        ['line,'old,'error,'warn,'bug,'unimple,'remark,'stat,'say,'debug])

(DEFUN |getMsgTag?| (|msg|)
  (PROG ()
    (RETURN
     (IFCAR
      (MEMBER (|getMsgTag| |msg|)
              (LIST '|line| '|old| '|error| '|warn| '|bug| '|unimple| '|remark|
                    '|stat| '|say| '|debug|))))))

; leader? msg == getMsgTag msg = 'leader

(DEFUN |leader?| (|msg|) (PROG () (RETURN (EQ (|getMsgTag| |msg|) '|leader|))))

; line?   msg == getMsgTag msg = 'line

(DEFUN |line?| (|msg|) (PROG () (RETURN (EQ (|getMsgTag| |msg|) '|line|))))

; getMsgPosTagOb msg == msg.1

(DEFUN |getMsgPosTagOb| (|msg|) (PROG () (RETURN (ELT |msg| 1))))

; getMsgPos msg ==
;     getMsgFTTag? msg => CADR getMsgPosTagOb msg
;     getMsgPosTagOb msg

(DEFUN |getMsgPos| (|msg|)
  (PROG ()
    (RETURN
     (COND ((|getMsgFTTag?| |msg|) (CADR (|getMsgPosTagOb| |msg|)))
           ('T (|getMsgPosTagOb| |msg|))))))

; getMsgPos2 msg ==
;     getMsgFTTag? msg => CADDR getMsgPosTagOb msg
;     ncBug('"not a from to",[])

(DEFUN |getMsgPos2| (|msg|)
  (PROG ()
    (RETURN
     (COND ((|getMsgFTTag?| |msg|) (CADDR (|getMsgPosTagOb| |msg|)))
           ('T (|ncBug| "not a from to" NIL))))))

; getMsgFTTag? msg == IFCAR MEMBER (IFCAR getMsgPosTagOb msg,_
;                       ['FROM,'TO,'FROMTO])

(DEFUN |getMsgFTTag?| (|msg|)
  (PROG ()
    (RETURN
     (IFCAR
      (MEMBER (IFCAR (|getMsgPosTagOb| |msg|)) (LIST 'FROM 'TO 'FROMTO))))))

; getMsgKey msg == msg.2

(DEFUN |getMsgKey| (|msg|) (PROG () (RETURN (ELT |msg| 2))))

; getMsgKey? msg == IDENTP (val := getMsgKey msg) => val

(DEFUN |getMsgKey?| (|msg|)
  (PROG (|val|)
    (RETURN
     (COND ((IDENTP (SETQ |val| (|getMsgKey| |msg|))) (IDENTITY |val|))))))

; getMsgArgL msg == msg.3

(DEFUN |getMsgArgL| (|msg|) (PROG () (RETURN (ELT |msg| 3))))

; getMsgPrefix? msg ==
;     (pre := msg.4) = 'noPre => NIL
;     pre

(DEFUN |getMsgPrefix?| (|msg|)
  (PROG (|pre|)
    (RETURN (COND ((EQ (SETQ |pre| (ELT |msg| 4)) '|noPre|) NIL) ('T |pre|)))))

; getMsgPrefix  msg == msg.4

(DEFUN |getMsgPrefix| (|msg|) (PROG () (RETURN (ELT |msg| 4))))

; getMsgLitSym msg ==
;     getMsgKey? msg => '" "
;     '"*"

(DEFUN |getMsgLitSym| (|msg|)
  (PROG () (RETURN (COND ((|getMsgKey?| |msg|) " ") ('T "*")))))

; getMsgText msg == msg.5

(DEFUN |getMsgText| (|msg|) (PROG () (RETURN (ELT |msg| 5))))

; setMsgPrefix (msg,val) == msg.4 := val

(DEFUN |setMsgPrefix| (|msg| |val|)
  (PROG () (RETURN (SETF (ELT |msg| 4) |val|))))

; setMsgText (msg,val) == msg.5 := val

(DEFUN |setMsgText| (|msg| |val|) (PROG () (RETURN (SETF (ELT |msg| 5) |val|))))
