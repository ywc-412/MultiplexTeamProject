-- 영우 SQL START
CREATE TABLE member (
    memberId VARCHAR2(20),
    memberPw VARCHAR2(500) NOT NULL,
    memberName VARCHAR2(40) NOT NULL,
    memberAddress VARCHAR2(100) NOT NULL,
    memberPhoneFirst VARCHAR2(20) NOT NULL,
    memberPhoneSecond varchar2(20) not null,
    memberPhoneThird varchar2(20) not null,
    memberBirth DATE NOT NULL,
    memberEmail VARCHAR2(100) NOT NULL,
    memberEmailSecond varchar2(100) not null,
    memberRegDate DATE DEFAULT sysdate
);

CREATE TABLE auth(
    memberId VARCHAR2(20) NOT NULL,
    memberAuth VARCHAR2(20) DEFAULT 'ROLE_MEMBER' NOT NULL
);

CREATE TABLE suggest(
    suggestNo NUMBER(10),
    memberID VARCHAR2(20) NOT NULL,
    suggestTitle VARCHAR2(300) NOT NULL,
    suggestContent VARCHAR2(1000) NOT NULL,
    suggestPrivateChk NUMBER(1) DEFAULT 0 NOT NULL,
    suggestPw VARCHAR2(30),
    suggestView NUMBER(5) DEFAULT 0 NOT NULL
);

-- 영우 SQL END


-- 한나 SQL START
CREATE TABLE RESERVE (
   reserveNo VARCHAR2(30) NOT NULL,
   memberId VARCHAR2(20) NOT NULL,
   seat VARCHAR2(20) NOT NULL,
   scheduleNo NUMBER(10) NOT NULL,
   adultNum NUMBER(1) DEFAULT 0,
   teenNum NUMBER(1) DEFAULT 0,
   status NUMBER(1) DEFAULT 0
);

CREATE TABLE SCHEDULE (
   scheduleNo NUMBER(10) NOT NULL,
   scheduleDate DATE NOT NULL,
   scheduleTime VARCHAR2(20) NOT NULL,
   screen VARCHAR2(20) NOT NULL,
   movieNo NUMBER(10) NOT NULL
);

CREATE TABLE SEAT (
   scheduleNo NUMBER(10) NOT NULL,
   seatNo VARCHAR2(20) NOT NULL,
   seatStatus NUMBER(1) DEFAULT 0
);


-- 한나 SQL END

-- 진주 SQL START
CREATE TABLE notice (
    noticeNo NUMBER(10),
    noticeTitle VARCHAR2(100) NOT NULL,
    noticeContent VARCHAR2(1000) NOT NULL,
    noticeView NUMBER(5) DEFAULT 0,
    noticeDate DATE DEFAULT SYSDATE
);

CREATE TABLE gift(
    giftNo NUMBER(10),
    giftName VARCHAR2(100) NOT NULL,
    giftPrice NUMBER(10) NOT NULL,
    giftSet VARCHAR(200) NOT NULL
);

CREATE TABLE myGift(
    memberId VARCHAR2(20) NOT NULL,
    giftNo NUMBER(10) NOT NULL,
    myGiftNo NUMBER(10),
    status NUMBER(1) DEFAULT 0,
    buyingDate DATE DEFAULT SYSDATE,
    expireDate DATE DEFAULT SYSDATE + (INTERVAL '1' MONTH),
    extendChk NUMBER(1) DEFAULT 0
);

CREATE TABLE giftAttach(
    giftUuid VARCHAR2(100),
    giftUploadPath VARCHAR2(200) NOT NULL,
    giftFileName VARCHAR2(100) NOT NULL,
    giftNo NUMBER(10) NOT NULL
);

-- 진주 SQL END


-- 영주 SQL START

CREATE TABLE movieAttach (
    movieUuid VARCHAR2(100),
    movieUploadPath VARCHAR2(200) NOT NULL,
    movieFileName VARCHAR2(100) NOT NULL,
    movieNo NUMBER(10)  NOT NULL
);

CREATE TABLE movie (
    movieNo NUMBER(10),
    movieTitle VARCHAR2(300) NOT NULL,
    movieManager VARCHAR2(500) NOT NULL,
    movieMainActor VARCHAR2(500)  NOT NULL,
    movieSupportActor VARCHAR2(500),
    movieGenre VARCHAR2(20)  NOT NULL,
    movieGrade NUMBER(10),
    runningTime NUMBER(10)  NOT NULL,
    summary VARCHAR2(3000),
    openDate DATE,
    yesterdayNum NUMBER(10) DEFAULT 0
);

CREATE TABLE commentReply (
    commentNo NUMBER(10),
    movieNo NUMBER(10) NOT NULL,
    memberId VARCHAR2(20) NOT NULL,
    commentContent VARCHAR2(1000)  NOT NULL,
    commentStar NUMBER(1) NOT NULL,
    commentDate DATE DEFAULT SYSDATE
);

CREATE TABLE commentReport (
commentReportNo NUMBER(10),
commentNo NUMBER(10) NOT NULL,
commentReportContent VARCHAR2(3000) NOT NULL,
memberId VARCHAR2(20)  NOT NULL,
commentReportResult NUMBER(1) DEFAULT 0,
commentReportDate DATE DEFAULT SYSDATE
);

-- 영주 SQL END

-- 홍이 SQL START
CREATE TABLE review(
    reviewNo number(10),
    movieNo Number(10) not null,
    memberId varchar2(20) not null,
    reviewTitle varchar2(300) not null,
    reviewContent varchar2(3000) not null,
    reviewDate Date default sysdate,
    reviewView number(5) default 0
);

CREATE TABLE reply(
    replyNo number(10),
    reviewNo number(10) not null,
    memberId varchar2(20) not null,
    replyContent varchar2(1000) not null,
    replyDate date default sysdate
);

CREATE TABLE reviewReport(
    reviewReportNo number(10),
    memberId varchar2(20) not null,
    reviewNo number(10) not null,
    reviewReportContent varchar2(3000) not null,
    reviewReportResult number(1) default 0,
    reviewReportDate date default sysdate
);

CREATE TABLE replyReport(
    replyReportNo number(10),
    memberId varchar2(20) not null,
    replyNo number(10) not null,
    replyReportContent varchar2(3000) not null,
    replyReportResult number(1) default 0,
    replyReportDate date default sysdate
);

CREATE TABLE lost(
    lostNo number(10),
    lostTitle varchar2(300) not null,
    lostContent varchar2(3000) not null,
    lostDate date default sysdate,
    lostView number(10) default 0
);
-- 홍이 SQL END

--ALTER-------------------------------------------------------------------------------
ALTER TABLE member ADD CONSTRAINT PK_MEMBER PRIMARY KEY(memberId);

ALTER TABLE movieAttach ADD CONSTRAINT pk_movieAttach PRIMARY KEY (movieUuid) ;
ALTER TABLE movie ADD CONSTRAINT pk_movie PRIMARY KEY (movieNo);
ALTER TABLE commentReply ADD CONSTRAINT pk_commentReply PRIMARY KEY (commentNo);
ALTER TABLE commentReport ADD CONSTRAINT pk_commentReport PRIMARY KEY (commentReportNo);
ALTER TABLE RESERVE ADD CONSTRAINT PK_RESERVE PRIMARY KEY (reserveNo);
ALTER TABLE SCHEDULE ADD CONSTRAINT PK_SCHEDULE PRIMARY KEY (scheduleNo);
ALTER TABLE SEAT ADD CONSTRAINT PK_SEAT PRIMARY KEY (scheduleNo, seatNo);
ALTER TABLE notice ADD CONSTRAINT PK_NOTICE PRIMARY KEY(noticeNo);
ALTER TABLE gift ADD CONSTRAINT PK_GIFT PRIMARY KEY(giftNo);
ALTER TABLE myGift ADD CONSTRAINT PK_MYGIFT PRIMARY KEY(myGiftNo);
ALTER TABLE giftAttach ADD CONSTRAINT PK_GIFTATTACH PRIMARY KEY(giftUuid);
ALTER TABLE review ADD CONSTRAINT PK_review PRIMARY KEY (reviewNo);
ALTER TABLE reply ADD CONSTRAINT PK_reply PRIMARY KEY (replyNo);
ALTER TABLE reviewReport ADD CONSTRAINT PK_reviewReport PRIMARY KEY (reviewReportNo);
ALTER TABLE lost ADD CONSTRAINT PK_lost PRIMARY KEY (lostNo);
ALTER TABLE replyReport ADD CONSTRAINT PK_replyReport PRIMARY KEY (replyReportNo);


-- 영우 알터 START
ALTER TABLE auth ADD CONSTRAINT FK_AUTH_MEMBER FOREIGN KEY (memberId) REFERENCES member(memberId) ON DELETE CASCADE;
ALTER TABLE suggest ADD CONSTRAINT fk_suggest_memberId foreign key (memberId) REFERENCES member(memberId) ON DELETE CASCADE;
CREATE INDEX idx_member_memberRegDate ON MEMBER(memberRegDate);
-- 영우 알터 END

-- 영주 ALTER START
ALTER TABLE movieAttach ADD CONSTRAINT fk_movieAttach_movie FOREIGN KEY (movieNo) REFERENCES movie(movieNo) ON DELETE CASCADE;
ALTER TABLE commentReply ADD CONSTRAINT fk_commentReply_movie FOREIGN KEY (movieNo) REFERENCES movie(movieNo) ON DELETE CASCADE;
ALTER TABLE commentReply ADD CONSTRAINT fk_commentReply_member FOREIGN KEY (memberId) REFERENCES member(memberId) ON DELETE CASCADE;
ALTER TABLE commentReport ADD CONSTRAINT fk_commentReport_commentReply FOREIGN KEY (commentNo) REFERENCES commentReply(commentNo) ON DELETE SET NULL;
ALTER TABLE commentReport ADD CONSTRAINT fk_commentReport_member FOREIGN KEY (memberId) REFERENCES member(memberId) ON DELETE CASCADE;
-- 영주 ALTER END

-- 한나 ALTER START
ALTER TABLE RESERVE ADD CONSTRAINT FK_RESERVE_MEMBER FOREIGN KEY (memberId) REFERENCES MEMBER(memberId) ON DELETE CASCADE;
ALTER TABLE RESERVE ADD CONSTRAINT FK_RESERVE_SCHEDULE FOREIGN KEY (scheduleNo) REFERENCES SCHEDULE(scheduleNo) ON DELETE CASCADE;
ALTER TABLE SCHEDULE ADD CONSTRAINT FK_SCHEDULE_MOVIE FOREIGN KEY (movieNo) REFERENCES MOVIE(movieNo) ON DELETE CASCADE;
ALTER TABLE SEAT ADD CONSTRAINT FK_SEAT_SCHEDULE FOREIGN KEY (scheduleNo) REFERENCES SCHEDULE(scheduleNo) ON DELETE CASCADE;
-- 한나 ALTER END

-- 진주 ALTER START
ALTER TABLE myGift ADD CONSTRAINT FK_MYGIFT_GIFT FOREIGN KEY(giftNo) REFERENCES gift(giftNo);
ALTER TABLE myGift ADD CONSTRAINT FK_MYGIFT_MEMBER FOREIGN KEY (memberId) REFERENCES member (memberId) ON DELETE CASCADE;
ALTER TABLE giftAttach ADD CONSTRAINT FK_GIFTATTACH_GIFT FOREIGN KEY(giftNo) REFERENCES gift (giftNo) ON DELETE CASCADE;
-- 진주 ALTER END

-- 홍이 ALTER START
ALTER TABLE review ADD CONSTRAINT FK_review_member FOREIGN KEY (memberId) REFERENCES member(memberId) ON DELETE CASCADE;
ALTER TABLE review ADD CONSTRAINT FK_review_movie FOREIGN KEY (movieNo)REFERENCES movie(movieNo) ON DELETE CASCADE;
ALTER TABLE reply ADD CONSTRAINT FK_reply_member FOREIGN KEY (memberId) REFERENCES member(memberId) ON DELETE CASCADE;
ALTER TABLE reply ADD CONSTRAINT FK_reply_review FOREIGN KEY (reviewNo) REFERENCES review(reviewNo) ON DELETE CASCADE;
ALTER TABLE reviewReport ADD CONSTRAINT FK_reviewReport_member FOREIGN KEY (memberId) REFERENCES member(memberId) ON DELETE CASCADE;
ALTER TABLE reviewReport ADD CONSTRAINT FK_reviewReport_review FOREIGN KEY (reviewNo) REFERENCES review(reviewNo) ON DELETE SET NULL;
ALTER TABLE replyReport ADD CONSTRAINT FK_replyReport_reply FOREIGN KEY (replyNo) REFERENCES reply(replyNo) ON DELETE SET NULL;
ALTER TABLE replyReport ADD CONSTRAINT FK_replyReport_member FOREIGN KEY (memberId) REFERENCES member(memberId) ON DELETE CASCADE;
-- 홍이 ALTER END
--ALTER END-------------------------------------------------------------------------------

-- SEQUENCE START
CREATE SEQUENCE seq_schedule;
CREATE SEQUENCE SEQ_NOTICE;
CREATE SEQUENCE SEQ_GIFT;
CREATE SEQUENCE SEQ_MYGIFT;
CREATE SEQUENCE seq_commentReport
INCREMENT BY 1 MAXVALUE 999999 CYCLE;
CREATE SEQUENCE seq_movie
INCREMENT BY 1 MAXVALUE 999999 CYCLE;
CREATE SEQUENCE seq_commentReply
INCREMENT BY 1 MAXVALUE 999999 CYCLE;
CREATE SEQUENCE seq_reviewReport;
CREATE SEQUENCE seq_replyReport;
CREATE SEQUENCE seq_lost;
CREATE SEQUENCE seq_reply;
CREATE SEQUENCE seq_review;
CREATE SEQUENCE seq_suggest;

