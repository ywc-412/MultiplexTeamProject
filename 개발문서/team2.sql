-- 영우 SQL START
CREATE TABLE member (
    memberId VARCHAR2(20),
    memberPw VARCHAR2(30) NOT NULL,
    memberName VARCHAR2(15) NOT NULL,
    memberAddress VARCHAR2(100) NOT NULL,
    memberPhone VARCHAR2(20) NOT NULL,
    memberBirth DATE NOT NULL,
    memberEmail VARCHAR2(100) NOT NULL
);

CREATE TABLE auth(
    memberId VARCHAR2(20) NOT NULL,
    memberAuth VARCHAR2(20) NOT NULL
);

CREATE TABLE suggest(
    suggestNo NUMBER(10),
    memberID VARCHAR2(20) NOT NULL,
    suggestTitle VARCHAR2(100) NOT NULL,
    suggestContent VARCHAR2(1000) NOT NULL,
    suggestPrivateChk NUMBER(1) DEFAULT 0 NOT NULL,
    suggestPw VARCHAR2(30),
    suggestView NUMBER(10) DEFAULT 0 NOT NULL
);

-- 영우 알터 START
ALTER TABLE member ADD CONSTRAINT pk_memberId PRIMARY KEY(memberId);
ALTER TABLE auth ADD CONSTRAINT fk_auth_memberId FOREIGN KEY (memberId) REFERENCES member(memberId) ON DELETE CASCADE;
ALTER TABLE suggest ADD CONSTRAINT fk_suggest_memberId foreign key (memberId) REFERENCES member(memberId) ON DELETE CASCADE;
-- 영우 알터 END
-- 영우 SQL END

-- 한나 SQL START
CREATE TABLE RESERVE (
    reserveNo VARCHAR2(20) NOT NULL,
    memberId VARCHAR2(20) NOT NULL,
    seat VARCHAR2(20) NOT NULL,
    scheduleNo NUMBER(10) NOT NULL,
    adultNum NUMBER(10) DEFAULT 0,
    teenNum NUMBER(10) DEFAULT 0,
    status NUMBER(10) DEFAULT 0
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
    seatStatus NUMBER(10) DEFAULT 0
);
-- 한나 ALTER START
ALTER TABLE RESERVE ADD CONSTRAINT RESERVE_PK PRIMARY KEY (reserveNo);
ALTER TABLE RESERVE ADD CONSTRAINT RESERVE_FK1 FOREIGN KEY (memberId) REFERENCES MEMBER(memberId) ON DELETE CASCADE;
ALTER TABLE RESERVE ADD CONSTRAINT RESERVE_FK2 FOREIGN KEY (scheduleNo) REFERENCES SCHEDULE(scheduleNo) ON DELETE CASCADE;

ALTER TABLE SCHEDULE ADD CONSTRAINT SCHEDULE_PK PRIMARY KEY (scheduleNo);
ALTER TABLE SCHEDULE ADD CONSTRAINT SCHEDULE_FK FOREIGN KEY (movieNo) REFERENCES MOVIE(movieNo) ON DELETE CASCADE;

ALTER TABLE SEAT ADD CONSTRAINT SEAT_PK PRIMARY KEY (scheduleNo, seatNo);
ALTER TABLE SEAT ADD CONSTRAINT SEAT_FK FOREIGN KEY (scheduleNo) REFERENCES SCHEDULE(scheduleNo) ON DELETE CASCADE;

CREATE SEQUENCE seq_schedule;
-- 한나 ALTER END
-- 한나 SQL END

CREATE table notice (
 noticeNo number(10),
 noticeTitle varchar2(100) NOT NULL,
 noticeContent varchar2(1000) NOT NULL,
 noticeView number(10) default 0,
 noticeDate DATE default SYSDATE
);

-- 진주 SQL START
CREATE TABLE gift(
    giftNo number(10),
    giftName varchar2(100) NOT NULL,
    giftPrice number(10) NOT NULL,
    giftSet varchar2(200) NOT NULL
);

CREATE TABLE myGift(
    memberId varchar2(20) NOT NULL,
    giftNo number(10) NOT NULL,
    myGiftNo number(10),
    status number(10) NOT NULL,
    buyingDate Date default SYSDATE,
    expireDate Date default SYSDATE + (INTERVAL '1' MONTH),
    extendChk char(1) NOT NULL
);

CREATE TABLE giftAttach(
    giftUuid varchar2(100),
    giftUploadPath varchar2(200) NOT NULL,
    giftFileName varchar2(100) NOT NULL,
    giftNo number(10) NOT NULL
);

-- 진주 알터 START
alter table notice add constraint NOTICE_PK primary key(noticeNo);
alter table gift add constraint GIFT_PK primary key(giftNo);
alter table myGift add constraint MYGIFT_PK primary key(myGiftNo);
alter table myGift add constraint MYGIFT_FK1 foreign key (giftNo) references gift (giftNo);
alter table myGift add constraint MYGIFT_FK2 foreign key (memberId) references member (memberId) ON DELETE SET NULL;
alter table giftAttach constraint GIFTATTACH_PK primary key(giftUuid);
alter table giftAttach constraint GIFTATTACH_FK foreign key(giftNo) references gift (giftNo) ON DELETE CASCADE;
-- 진주 알터 END
-- 진주 SQL END



