/* 1. Selezionare tutti gli studenti nati nel 1990 (160) */
SELECT
  *
FROM
  university.students
WHERE
  students.date_of_birth LIKE "1990%";

/* 2. Selezionare tutti i corsi che valgono più di 10 crediti (479) */
SELECT
  *
FROM
  university.courses
WHERE
  courses.cfu > 10;

/* 3. Selezionare tutti gli studenti che hanno più di 30 anni */
SELECT
  *
FROM
  university.students
WHERE
  YEAR (students.date_of_birth) < "1996";

/* 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286) */
SELECT
  *
FROM
  university.courses
WHERE
  courses.period = "I semestre"
  and courses.year = 1;

/* 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21) */
SELECT
  *
FROM
  university.exams
WHERE
  HOUR (exams.hour) >= 14
  and exams.date = "2020/06/20";

/* 6. Selezionare tutti i corsi di laurea magistrale (38) */
SELECT
  *
FROM
  university.degrees
WHERE
  degrees.level = "magistrale";

/* 7. Da quanti dipartimenti è composta l'università? (12) */
SELECT
  *
FROM
  university.departments;

/* 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50) */
SELECT
  *
FROM
  university.teachers
WHERE
  teachers.phone IS NULL;