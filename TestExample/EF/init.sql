@Model.edmx.sql

@id.sql

INSERT INTO "OPTVIEWER"."Orders"(ID,"Name", "Number", "Done") VALUES(0, '-', 0, 0);

insert into "OPTVIEWER"."Properties"(id, "Text") values(0, 'Versionsupdate auf MV');
insert into "OPTVIEWER"."Properties"(id, "Text") values(1, 'Verhanden FUs');
insert into "OPTVIEWER"."Properties"(id, "Text") values(2, 'zusätzliche FUs');
INSERT INTO "OPTVIEWER"."Properties"(ID, "Text") values(3, 'zu entfernende FUs');

commit;