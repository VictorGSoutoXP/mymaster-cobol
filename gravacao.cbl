IDENTIFICATION DIVISION.
PROGRAM-ID. EXEMPLO.

DATA DIVISION.
FILE SECTION.
FD INPUT-FILE.
01 INPUT-RECORD.
   05 INPUT-FIELD PIC X(10).

FD OUTPUT-FILE.
01 OUTPUT-RECORD.
   05 OUTPUT-FIELD PIC X(10).

WORKING-STORAGE SECTION.
01 WS-EOF PIC X VALUE 'N'.

PROCEDURE DIVISION.
MAIN-LOGIC.
    OPEN INPUT INPUT-FILE
         OUTPUT OUTPUT-FILE.
         
    PERFORM UNTIL WS-EOF = 'Y'
        READ INPUT-FILE
            AT END SET WS-EOF TO 'Y'
        END-READ.
        
        IF WS-EOF = 'N' THEN
            MOVE INPUT-FIELD TO OUTPUT-FIELD
            WRITE OUTPUT-RECORD
        END-IF.
    END-PERFORM.
    
    CLOSE INPUT-FILE
          OUTPUT-FILE.
          
    STOP RUN.
