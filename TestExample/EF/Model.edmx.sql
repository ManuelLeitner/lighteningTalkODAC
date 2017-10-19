-- --------------------------------------------------
-- Entity Designer DDL Script for Oracle database
-- --------------------------------------------------
-- Date Created: 17.10.2017 13:22:07
-- Generated from EDMX file: G:\5. Klasse\SYPRET\ProjektEngel\Workspace\OrderChecker\EF\Model.edmx
-- --------------------------------------------------

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

-- ALTER TABLE "OPTVIEWER"."Orders" DROP CONSTRAINT "FK_CustomerOrder" CASCADE;

-- ALTER TABLE "OPTVIEWER"."MachineProperties" DROP CONSTRAINT "FK_OrderPropertyProperty" CASCADE;

-- ALTER TABLE "OPTVIEWER"."RuleTask" DROP CONSTRAINT "FK_RuleTask_Rule" CASCADE;

-- ALTER TABLE "OPTVIEWER"."RuleTask" DROP CONSTRAINT "FK_RuleTask_Task" CASCADE;

-- ALTER TABLE "OPTVIEWER"."Operations_Condition" DROP CONSTRAINT "FK_PropertyCondition" CASCADE;

-- ALTER TABLE "OPTVIEWER"."OptOrder" DROP CONSTRAINT "FK_OptOrder_Opt" CASCADE;

-- ALTER TABLE "OPTVIEWER"."OptOrder" DROP CONSTRAINT "FK_OptOrder_Order" CASCADE;

-- ALTER TABLE "OPTVIEWER"."Operations_UnaryOperation" DROP CONSTRAINT "FK_OpUnOp" CASCADE;

-- ALTER TABLE "OPTVIEWER"."Times" DROP CONSTRAINT "FK_OrderTime" CASCADE;

-- ALTER TABLE "OPTVIEWER"."Times" DROP CONSTRAINT "FK_UserTime" CASCADE;

-- ALTER TABLE "OPTVIEWER"."MachineOrder" DROP CONSTRAINT "FK_OrderMachineOrder" CASCADE;

-- ALTER TABLE "OPTVIEWER"."MachineOrder" DROP CONSTRAINT "FK_MachineOrderMachine" CASCADE;

-- ALTER TABLE "OPTVIEWER"."MachineProperties" DROP CONSTRAINT "FK_MachineOrderProperty" CASCADE;

-- ALTER TABLE "OPTVIEWER"."Operations_BinaryOperation" DROP CONSTRAINT "FK_BinOp1" CASCADE;

-- ALTER TABLE "OPTVIEWER"."Operations_BinaryOperation" DROP CONSTRAINT "FK_BinOp2" CASCADE;

-- ALTER TABLE "OPTVIEWER"."Rules" DROP CONSTRAINT "FK_OperationRule" CASCADE;

-- ALTER TABLE "OPTVIEWER"."Rules" DROP CONSTRAINT "FK_UserRule" CASCADE;

-- ALTER TABLE "OPTVIEWER"."OrderTask" DROP CONSTRAINT "FK_OrderTask_Orders" CASCADE;

-- ALTER TABLE "OPTVIEWER"."OrderTask" DROP CONSTRAINT "FK_OrderTask_Tasks" CASCADE;

-- ALTER TABLE "OPTVIEWER"."Operations_Condition" DROP CONSTRAINT "FK_Condition_Operation" CASCADE;

-- ALTER TABLE "OPTVIEWER"."Operations_UnaryOperation" DROP CONSTRAINT "FK_UnaryOperation_Operation" CASCADE;

-- ALTER TABLE "OPTVIEWER"."Operations_BinaryOperation" DROP CONSTRAINT "FK_BinaryOperation_Operation" CASCADE;
-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

-- DROP TABLE "OPTVIEWER"."Users";

-- DROP TABLE "OPTVIEWER"."Customers";

-- DROP TABLE "OPTVIEWER"."Opts";

-- DROP TABLE "OPTVIEWER"."Machines";

-- DROP TABLE "OPTVIEWER"."Orders";

-- DROP TABLE "OPTVIEWER"."MachineProperties";

-- DROP TABLE "OPTVIEWER"."Properties";

-- DROP TABLE "OPTVIEWER"."Rules";

-- DROP TABLE "OPTVIEWER"."Tasks";

-- DROP TABLE "OPTVIEWER"."Operations";

-- DROP TABLE "OPTVIEWER"."Times";

-- DROP TABLE "OPTVIEWER"."MachineOrder";

-- DROP TABLE "OPTVIEWER"."Operations_Condition";

-- DROP TABLE "OPTVIEWER"."Operations_UnaryOperation";

-- DROP TABLE "OPTVIEWER"."Operations_BinaryOperation";

-- DROP TABLE "OPTVIEWER"."RuleTask";

-- DROP TABLE "OPTVIEWER"."OptOrder";

-- DROP TABLE "OPTVIEWER"."OrderTask";

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Users'
CREATE TABLE "OPTVIEWER"."Users" (
   "ID" NUMBER(19) NOT NULL,
   "FirstName" VARCHAR2(30 CHAR) ,
   "SecondName" VARCHAR2(30 CHAR) ,
   "UserName" VARCHAR2(30 CHAR) 
);

-- Creating table 'Customers'
CREATE TABLE "OPTVIEWER"."Customers" (
   "ID" NUMBER(19) NOT NULL,
   "Name" VARCHAR2(100 CHAR) ,
   "AdditionalInfos" VARCHAR2(1000 CHAR) ,
   "CustomerNr" NUMBER(19) NOT NULL
);

-- Creating table 'Opts'
CREATE TABLE "OPTVIEWER"."Opts" (
   "ID" NUMBER(19) NOT NULL,
   "Blockname" CHAR(500 CHAR) ,
   "SwitchCondition" CHAR(500 CHAR) ,
   "Number" NUMBER(19) NOT NULL
);

-- Creating table 'Machines'
CREATE TABLE "OPTVIEWER"."Machines" (
   "ID" NUMBER(19) NOT NULL,
   "FabricationNumber" NUMBER(10) NOT NULL,
   "SD" VARCHAR2(15 CHAR) NOT NULL,
   "Version" VARCHAR2(30 CHAR) ,
   "Type" VARCHAR2(30 CHAR) ,
   "Reference" VARCHAR2(30 CHAR) ,
   "Plant" NUMBER(19) ,
   "Year" DATE ,
   "KVZ" NUMBER(19) 
);

-- Creating table 'Orders'
CREATE TABLE "OPTVIEWER"."Orders" (
   "ID" NUMBER(19) NOT NULL,
   "Deadline" TIMESTAMP ,
   "Note" VARCHAR2(1000 CHAR) ,
   "Name" VARCHAR2(50 CHAR) NOT NULL,
   "Text" CLOB ,
   "Number" NUMBER(19) NOT NULL,
   "Done" NUMBER(1) NOT NULL,
   "Customer_ID" NUMBER(19) 
);

-- Creating table 'MachineProperties'
CREATE TABLE "OPTVIEWER"."MachineProperties" (
   "ID" NUMBER(19) NOT NULL,
   "Value" VARCHAR2(30 CHAR) NOT NULL,
   "Property_ID" NUMBER(19) NOT NULL,
   "MachineOrder_ID" NUMBER(19) 
);

-- Creating table 'Properties'
CREATE TABLE "OPTVIEWER"."Properties" (
   "ID" NUMBER(19) NOT NULL,
   "Text" NVARCHAR2(150) NOT NULL
);

-- Creating table 'Rules'
CREATE TABLE "OPTVIEWER"."Rules" (
   "ID" NUMBER(19) NOT NULL,
   "Name" VARCHAR2(100 CHAR) NOT NULL,
   "Priority" NUMBER(10) NOT NULL,
   "X" NUMBER(5) NOT NULL,
   "Y" NUMBER(5) NOT NULL,
   "UserID" NUMBER(19) ,
   "Operation_ID" NUMBER(19) 
);

-- Creating table 'Tasks'
CREATE TABLE "OPTVIEWER"."Tasks" (
   "ID" NUMBER(19) NOT NULL,
   "Text" VARCHAR2(1000 CHAR) NOT NULL
);

-- Creating table 'Operations'
CREATE TABLE "OPTVIEWER"."Operations" (
   "ID" NUMBER(19) NOT NULL,
   "Operator" NVARCHAR2(5) NOT NULL,
   "X" NUMBER(5) NOT NULL,
   "Y" NUMBER(5) NOT NULL,
   "Type" NVARCHAR2(1) NOT NULL
);

-- Creating table 'Times'
CREATE TABLE "OPTVIEWER"."Times" (
   "ID" NUMBER(19) NOT NULL,
   "StartTime" DATE NOT NULL,
   "EndTime" DATE NOT NULL,
   "Hours" NUMBER(10) NOT NULL,
   "Order_ID" NUMBER(19) NOT NULL,
   "User_ID" NUMBER(19) NOT NULL
);

-- Creating table 'MachineOrder'
CREATE TABLE "OPTVIEWER"."MachineOrder" (
   "ID" NUMBER(19) NOT NULL,
   "Checked" NUMBER(1) NOT NULL,
   "Order_ID" NUMBER(19) ,
   "Machine_ID" NUMBER(19) 
);

-- Creating table 'Operations_Condition'
CREATE TABLE "OPTVIEWER"."Operations_Condition" (
   "Value" VARCHAR2(30 CHAR) NOT NULL,
   "ID" NUMBER(19) NOT NULL,
   "Property_ID" NUMBER(19) NOT NULL
);

-- Creating table 'Operations_UnaryOperation'
CREATE TABLE "OPTVIEWER"."Operations_UnaryOperation" (
   "ID" NUMBER(19) NOT NULL,
   "Operation1_ID" NUMBER(19) 
);

-- Creating table 'Operations_BinaryOperation'
CREATE TABLE "OPTVIEWER"."Operations_BinaryOperation" (
   "ID" NUMBER(19) NOT NULL,
   "Operation1_ID" NUMBER(19) ,
   "Operation2_ID" NUMBER(19) 
);

-- Creating table 'RuleTask'
CREATE TABLE "OPTVIEWER"."RuleTask" (
   "Rules_ID" NUMBER(19) NOT NULL,
   "Tasks_ID" NUMBER(19) NOT NULL
);

-- Creating table 'OptOrder'
CREATE TABLE "OPTVIEWER"."OptOrder" (
   "Opts_ID" NUMBER(19) NOT NULL,
   "Order_ID" NUMBER(19) NOT NULL
);

-- Creating table 'OrderTask'
CREATE TABLE "OPTVIEWER"."OrderTask" (
   "MachineOrders_ID" NUMBER(19) NOT NULL,
   "Tasks_ID" NUMBER(19) NOT NULL
);


-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on "ID"in table 'Users'
ALTER TABLE "OPTVIEWER"."Users"
ADD CONSTRAINT "PK_Users"
   PRIMARY KEY ("ID" )
   ENABLE
   VALIDATE;


-- Creating primary key on "ID"in table 'Customers'
ALTER TABLE "OPTVIEWER"."Customers"
ADD CONSTRAINT "PK_Customers"
   PRIMARY KEY ("ID" )
   ENABLE
   VALIDATE;


-- Creating primary key on "ID"in table 'Opts'
ALTER TABLE "OPTVIEWER"."Opts"
ADD CONSTRAINT "PK_Opts"
   PRIMARY KEY ("ID" )
   ENABLE
   VALIDATE;


-- Creating primary key on "ID"in table 'Machines'
ALTER TABLE "OPTVIEWER"."Machines"
ADD CONSTRAINT "PK_Machines"
   PRIMARY KEY ("ID" )
   ENABLE
   VALIDATE;


-- Creating primary key on "ID"in table 'Orders'
ALTER TABLE "OPTVIEWER"."Orders"
ADD CONSTRAINT "PK_Orders"
   PRIMARY KEY ("ID" )
   ENABLE
   VALIDATE;


-- Creating primary key on "ID"in table 'MachineProperties'
ALTER TABLE "OPTVIEWER"."MachineProperties"
ADD CONSTRAINT "PK_MachineProperties"
   PRIMARY KEY ("ID" )
   ENABLE
   VALIDATE;


-- Creating primary key on "ID"in table 'Properties'
ALTER TABLE "OPTVIEWER"."Properties"
ADD CONSTRAINT "PK_Properties"
   PRIMARY KEY ("ID" )
   ENABLE
   VALIDATE;


-- Creating primary key on "ID"in table 'Rules'
ALTER TABLE "OPTVIEWER"."Rules"
ADD CONSTRAINT "PK_Rules"
   PRIMARY KEY ("ID" )
   ENABLE
   VALIDATE;


-- Creating primary key on "ID"in table 'Tasks'
ALTER TABLE "OPTVIEWER"."Tasks"
ADD CONSTRAINT "PK_Tasks"
   PRIMARY KEY ("ID" )
   ENABLE
   VALIDATE;


-- Creating primary key on "ID"in table 'Operations'
ALTER TABLE "OPTVIEWER"."Operations"
ADD CONSTRAINT "PK_Operations"
   PRIMARY KEY ("ID" )
   ENABLE
   VALIDATE;


-- Creating primary key on "ID"in table 'Times'
ALTER TABLE "OPTVIEWER"."Times"
ADD CONSTRAINT "PK_Times"
   PRIMARY KEY ("ID" )
   ENABLE
   VALIDATE;


-- Creating primary key on "ID"in table 'MachineOrder'
ALTER TABLE "OPTVIEWER"."MachineOrder"
ADD CONSTRAINT "PK_MachineOrder"
   PRIMARY KEY ("ID" )
   ENABLE
   VALIDATE;


-- Creating primary key on "ID"in table 'Operations_Condition'
ALTER TABLE "OPTVIEWER"."Operations_Condition"
ADD CONSTRAINT "PK_Operations_Condition"
   PRIMARY KEY ("ID" )
   ENABLE
   VALIDATE;


-- Creating primary key on "ID"in table 'Operations_UnaryOperation'
ALTER TABLE "OPTVIEWER"."Operations_UnaryOperation"
ADD CONSTRAINT "PK_Operations_UnaryOperation"
   PRIMARY KEY ("ID" )
   ENABLE
   VALIDATE;


-- Creating primary key on "ID"in table 'Operations_BinaryOperation'
ALTER TABLE "OPTVIEWER"."Operations_BinaryOperation"
ADD CONSTRAINT "PK_Operations_BinaryOperation"
   PRIMARY KEY ("ID" )
   ENABLE
   VALIDATE;


-- Creating primary key on "Rules_ID", "Tasks_ID"in table 'RuleTask'
ALTER TABLE "OPTVIEWER"."RuleTask"
ADD CONSTRAINT "PK_RuleTask"
   PRIMARY KEY ("Rules_ID", "Tasks_ID" )
   ENABLE
   VALIDATE;


-- Creating primary key on "Opts_ID", "Order_ID"in table 'OptOrder'
ALTER TABLE "OPTVIEWER"."OptOrder"
ADD CONSTRAINT "PK_OptOrder"
   PRIMARY KEY ("Opts_ID", "Order_ID" )
   ENABLE
   VALIDATE;


-- Creating primary key on "MachineOrders_ID", "Tasks_ID"in table 'OrderTask'
ALTER TABLE "OPTVIEWER"."OrderTask"
ADD CONSTRAINT "PK_OrderTask"
   PRIMARY KEY ("MachineOrders_ID", "Tasks_ID" )
   ENABLE
   VALIDATE;


-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on "Customer_ID" in table 'Orders'
ALTER TABLE "OPTVIEWER"."Orders"
ADD CONSTRAINT "FK_CustomerOrder"
   FOREIGN KEY ("Customer_ID")
   REFERENCES "OPTVIEWER"."Customers"
       ("ID")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_CustomerOrder'
CREATE INDEX "IX_FK_CustomerOrder"
ON "OPTVIEWER"."Orders"
   ("Customer_ID");

-- Creating foreign key on "Property_ID" in table 'MachineProperties'
ALTER TABLE "OPTVIEWER"."MachineProperties"
ADD CONSTRAINT "FK_OrderPropertyProperty"
   FOREIGN KEY ("Property_ID")
   REFERENCES "OPTVIEWER"."Properties"
       ("ID")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_OrderPropertyProperty'
CREATE INDEX "IX_FK_OrderPropertyProperty"
ON "OPTVIEWER"."MachineProperties"
   ("Property_ID");

-- Creating foreign key on "Rules_ID" in table 'RuleTask'
ALTER TABLE "OPTVIEWER"."RuleTask"
ADD CONSTRAINT "FK_RuleTask_Rule"
   FOREIGN KEY ("Rules_ID")
   REFERENCES "OPTVIEWER"."Rules"
       ("ID")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_RuleTask_Rule'
CREATE INDEX "IX_FK_RuleTask_Rule"
ON "OPTVIEWER"."RuleTask"
   ("Rules_ID");

-- Creating foreign key on "Tasks_ID" in table 'RuleTask'
ALTER TABLE "OPTVIEWER"."RuleTask"
ADD CONSTRAINT "FK_RuleTask_Task"
   FOREIGN KEY ("Tasks_ID")
   REFERENCES "OPTVIEWER"."Tasks"
       ("ID")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_RuleTask_Task'
CREATE INDEX "IX_FK_RuleTask_Task"
ON "OPTVIEWER"."RuleTask"
   ("Tasks_ID");

-- Creating foreign key on "Property_ID" in table 'Operations_Condition'
ALTER TABLE "OPTVIEWER"."Operations_Condition"
ADD CONSTRAINT "FK_PropertyCondition"
   FOREIGN KEY ("Property_ID")
   REFERENCES "OPTVIEWER"."Properties"
       ("ID")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_PropertyCondition'
CREATE INDEX "IX_FK_PropertyCondition"
ON "OPTVIEWER"."Operations_Condition"
   ("Property_ID");

-- Creating foreign key on "Opts_ID" in table 'OptOrder'
ALTER TABLE "OPTVIEWER"."OptOrder"
ADD CONSTRAINT "FK_OptOrder_Opt"
   FOREIGN KEY ("Opts_ID")
   REFERENCES "OPTVIEWER"."Opts"
       ("ID")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_OptOrder_Opt'
CREATE INDEX "IX_FK_OptOrder_Opt"
ON "OPTVIEWER"."OptOrder"
   ("Opts_ID");

-- Creating foreign key on "Order_ID" in table 'OptOrder'
ALTER TABLE "OPTVIEWER"."OptOrder"
ADD CONSTRAINT "FK_OptOrder_Order"
   FOREIGN KEY ("Order_ID")
   REFERENCES "OPTVIEWER"."Orders"
       ("ID")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_OptOrder_Order'
CREATE INDEX "IX_FK_OptOrder_Order"
ON "OPTVIEWER"."OptOrder"
   ("Order_ID");

-- Creating foreign key on "Operation1_ID" in table 'Operations_UnaryOperation'
ALTER TABLE "OPTVIEWER"."Operations_UnaryOperation"
ADD CONSTRAINT "FK_OpUnOp"
   FOREIGN KEY ("Operation1_ID")
   REFERENCES "OPTVIEWER"."Operations"
       ("ID")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_OpUnOp'
CREATE INDEX "IX_FK_OpUnOp"
ON "OPTVIEWER"."Operations_UnaryOperation"
   ("Operation1_ID");

-- Creating foreign key on "Order_ID" in table 'Times'
ALTER TABLE "OPTVIEWER"."Times"
ADD CONSTRAINT "FK_OrderTime"
   FOREIGN KEY ("Order_ID")
   REFERENCES "OPTVIEWER"."Orders"
       ("ID")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_OrderTime'
CREATE INDEX "IX_FK_OrderTime"
ON "OPTVIEWER"."Times"
   ("Order_ID");

-- Creating foreign key on "User_ID" in table 'Times'
ALTER TABLE "OPTVIEWER"."Times"
ADD CONSTRAINT "FK_UserTime"
   FOREIGN KEY ("User_ID")
   REFERENCES "OPTVIEWER"."Users"
       ("ID")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_UserTime'
CREATE INDEX "IX_FK_UserTime"
ON "OPTVIEWER"."Times"
   ("User_ID");

-- Creating foreign key on "Order_ID" in table 'MachineOrder'
ALTER TABLE "OPTVIEWER"."MachineOrder"
ADD CONSTRAINT "FK_OrderMachineOrder"
   FOREIGN KEY ("Order_ID")
   REFERENCES "OPTVIEWER"."Orders"
       ("ID")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_OrderMachineOrder'
CREATE INDEX "IX_FK_OrderMachineOrder"
ON "OPTVIEWER"."MachineOrder"
   ("Order_ID");

-- Creating foreign key on "Machine_ID" in table 'MachineOrder'
ALTER TABLE "OPTVIEWER"."MachineOrder"
ADD CONSTRAINT "FK_MachineOrderMachine"
   FOREIGN KEY ("Machine_ID")
   REFERENCES "OPTVIEWER"."Machines"
       ("ID")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_MachineOrderMachine'
CREATE INDEX "IX_FK_MachineOrderMachine"
ON "OPTVIEWER"."MachineOrder"
   ("Machine_ID");

-- Creating foreign key on "MachineOrder_ID" in table 'MachineProperties'
ALTER TABLE "OPTVIEWER"."MachineProperties"
ADD CONSTRAINT "FK_MachineOrderProperty"
   FOREIGN KEY ("MachineOrder_ID")
   REFERENCES "OPTVIEWER"."MachineOrder"
       ("ID")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_MachineOrderProperty'
CREATE INDEX "IX_FK_MachineOrderProperty"
ON "OPTVIEWER"."MachineProperties"
   ("MachineOrder_ID");

-- Creating foreign key on "Operation1_ID" in table 'Operations_BinaryOperation'
ALTER TABLE "OPTVIEWER"."Operations_BinaryOperation"
ADD CONSTRAINT "FK_BinOp1"
   FOREIGN KEY ("Operation1_ID")
   REFERENCES "OPTVIEWER"."Operations"
       ("ID")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_BinOp1'
CREATE INDEX "IX_FK_BinOp1"
ON "OPTVIEWER"."Operations_BinaryOperation"
   ("Operation1_ID");

-- Creating foreign key on "Operation2_ID" in table 'Operations_BinaryOperation'
ALTER TABLE "OPTVIEWER"."Operations_BinaryOperation"
ADD CONSTRAINT "FK_BinOp2"
   FOREIGN KEY ("Operation2_ID")
   REFERENCES "OPTVIEWER"."Operations"
       ("ID")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_BinOp2'
CREATE INDEX "IX_FK_BinOp2"
ON "OPTVIEWER"."Operations_BinaryOperation"
   ("Operation2_ID");

-- Creating foreign key on "Operation_ID" in table 'Rules'
ALTER TABLE "OPTVIEWER"."Rules"
ADD CONSTRAINT "FK_OperationRule"
   FOREIGN KEY ("Operation_ID")
   REFERENCES "OPTVIEWER"."Operations"
       ("ID")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_OperationRule'
CREATE INDEX "IX_FK_OperationRule"
ON "OPTVIEWER"."Rules"
   ("Operation_ID");

-- Creating foreign key on "UserID" in table 'Rules'
ALTER TABLE "OPTVIEWER"."Rules"
ADD CONSTRAINT "FK_UserRule"
   FOREIGN KEY ("UserID")
   REFERENCES "OPTVIEWER"."Users"
       ("ID")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_UserRule'
CREATE INDEX "IX_FK_UserRule"
ON "OPTVIEWER"."Rules"
   ("UserID");

-- Creating foreign key on "MachineOrders_ID" in table 'OrderTask'
ALTER TABLE "OPTVIEWER"."OrderTask"
ADD CONSTRAINT "FK_OrderTask_Orders"
   FOREIGN KEY ("MachineOrders_ID")
   REFERENCES "OPTVIEWER"."MachineOrder"
       ("ID")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_OrderTask_Orders'
CREATE INDEX "IX_FK_OrderTask_Orders"
ON "OPTVIEWER"."OrderTask"
   ("MachineOrders_ID");

-- Creating foreign key on "Tasks_ID" in table 'OrderTask'
ALTER TABLE "OPTVIEWER"."OrderTask"
ADD CONSTRAINT "FK_OrderTask_Tasks"
   FOREIGN KEY ("Tasks_ID")
   REFERENCES "OPTVIEWER"."Tasks"
       ("ID")
   ENABLE
   VALIDATE;

-- Creating index for FOREIGN KEY 'FK_OrderTask_Tasks'
CREATE INDEX "IX_FK_OrderTask_Tasks"
ON "OPTVIEWER"."OrderTask"
   ("Tasks_ID");

-- Creating foreign key on "ID" in table 'Operations_Condition'
ALTER TABLE "OPTVIEWER"."Operations_Condition"
ADD CONSTRAINT "FK_Condition_Operation"
   FOREIGN KEY ("ID")
   REFERENCES "OPTVIEWER"."Operations"
       ("ID")
   ENABLE
   VALIDATE;

-- Creating foreign key on "ID" in table 'Operations_UnaryOperation'
ALTER TABLE "OPTVIEWER"."Operations_UnaryOperation"
ADD CONSTRAINT "FK_UnaryOperation_Operation"
   FOREIGN KEY ("ID")
   REFERENCES "OPTVIEWER"."Operations"
       ("ID")
   ENABLE
   VALIDATE;

-- Creating foreign key on "ID" in table 'Operations_BinaryOperation'
ALTER TABLE "OPTVIEWER"."Operations_BinaryOperation"
ADD CONSTRAINT "FK_BinaryOperation_Operation"
   FOREIGN KEY ("ID")
   REFERENCES "OPTVIEWER"."Operations"
       ("ID")
   ENABLE
   VALIDATE;

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
