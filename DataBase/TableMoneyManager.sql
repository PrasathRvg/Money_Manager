-- CATEGORY TABLE --

use moneymanager

CREATE TABLE CATEGORIES (CATEGORY_ID VARCHAR(10) PRIMARY KEY, CATEGORY_NAME VARCHAR(30), CATEGORY_TYPE VARCHAR(20),
ISACTIVE BIT,CREATED_DATE DATETIME,MODIFIED_DATE DATETIME);

SELECT * FROM CATEGORIES


INSERT INTO CATEGORIES (CATEGORY_ID,CATEGORY_NAME,CATEGORY_TYPE,ISACTIVE,CREATED_DATE,MODIFIED_DATE)
VALUES('C1','ENTERTAINMENT','EXPENSE',1,GETDATE(),GETDATE());
INSERT INTO CATEGORIES (CATEGORY_ID,CATEGORY_NAME,CATEGORY_TYPE,ISACTIVE,CREATED_DATE,MODIFIED_DATE)
VALUES('C2','RENT','EXPENSE',1,GETDATE(),GETDATE());

-- TRANSACT TABLE --

CREATE TABLE TRANSACT_TABLE( TRANSAC_ID VARCHAR(10) PRIMARY KEY,TRANSAC_NAME VARCHAR(20) NOT NULL,
AMOUNT INT NOT NULL,CATEGORY_ID VARCHAR(10),CREATED_DATE DATETIME,MODIFIED_DATE DATETIME, FOREIGN KEY(CATEGORY_ID) REFERENCES CATEGORIES(CATEGORY_ID))

SELECT * FROM TRANSACT_TABLE





-- USER_DETAILS TABLE --

CREATE TABLE USER_DETAILS (USER_ID INT PRIMARY KEY,USER_NAME VARCHAR(20) NOT NULL,
EMAIL VARCHAR(MAX),PASSWORD VARCHAR(20) NOT NULL,CREATED_DATE DATETIME,MODIFIED_DATE DATETIME)


SELECT * FROM USER_DETAILS




---------------------------------------BANKACCOUNT TABLE----------------------------------

CREATE TABLE BANK_ACCOUNT(USER_ID INT,
                      BNKACT_ID INT NOT NULL,
                      ACCOUNT_NUMBER INT NOT NULL, 
                      NAME VARCHAR(50) NOT NULL, 
                      BANK VARCHAR(50) NOT NULL,
                      IFSC_CODE VARCHAR(10) NOT NULL,
                      BALANCE INT NOT NULL,
                      CREATED_DATE DATETIME,
                      MODIFIED_DATE DATETIME,
                      FOREIGN KEY(USER_ID) REFERENCES USER_DETAILS(USER_ID))
SELECT * FROM BANK_ACCOUNT

---------------------------WALLET TABLE------------------------------------------------------

CREATE TABLE WALLET_ACCOUNT(USER_ID INT,
                      AMOUNT INT NOT NULL,
                      CREATED_DATE DATETIME,
                      MODIFIED_DATE DATETIME,
                      FOREIGN KEY(USER_ID) REFERENCES USER_DETAILS(USER_ID))
SELECT * FROM WALLET_ACCOUNT




-- BUDGET_TABLE --

CREATE TABLE BUDGET(CATEGORY_ID VARCHAR(10) NOT NULL,AMOUNT NUMERIC NOT NULL, BUDGET_PLAN VARCHAR(10),
USER_ID INT,CREATED_DATE DATETIME,MODIFIED_DATE DATETIME, FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORIES(CATEGORY_ID),
FOREIGN KEY(USER_ID) REFERENCES USER_DETAILS(USER_ID))

SELECT * FROM BUDGET





