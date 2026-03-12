/* 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia */
SELECT
  students.id,
  students.name,
  students.surname,
  degrees.name
FROM
  university.students
  INNER JOIN university.degrees ON students.degree_id = degrees.id
WHERE
  students.degree_id = 53;

/* 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze */
SELECT
  *
FROM
  university.courses
  INNER JOIN university.degrees ON courses.degree_id = degrees.id
  INNER JOIN university.departments ON degrees.department_id = departments.id
WHERE
  departments.id = 7
  AND degrees.level = 'magistrale';

/* 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44) */
SELECT
  *
FROM
  university.courses
  INNER JOIN university.course_teacher ON courses.id = course_teacher.course_id
WHERE
  course_teacher.teacher_id = 44;

/* 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome */
SELECT
  students.id,
  students.name,
  students.surname,
  degrees.name,
  degrees.level,
  departments.name
FROM
  university.students
  INNER JOIN university.degrees ON students.degree_id = degrees.id
  INNER JOIN university.departments ON degrees.department_id = departments.id
ORDER BY
  students.name;

/* 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti */
SELECT
  degrees.id,
  degrees.name,
  degrees.level,
  courses.name,
  courses.period,
  courses.year,
  teachers.name,
  teachers.surname
FROM
  university.degrees
  INNER JOIN university.courses ON degrees.id = courses.degree_id
  INNER JOIN university.course_teacher ON courses.id = course_teacher.course_id
  INNER JOIN university.teachers ON course_teacher.teacher_id = teachers.id;

/* 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54) */
SELECT DISTINCT
  teachers.*
FROM
  university.teachers
  INNER JOIN university.course_teacher ON teachers.id = course_teacher.teacher_id
  INNER JOIN university.courses ON course_teacher.course_id = courses.id
  INNER JOIN university.degrees ON courses.degree_id = degrees.id
  INNER JOIN university.departments ON degrees.department_id = departments.id
WHERE
  departments.id = 5;

/* 7. BONUS: Selezionare per ogni studente il numero di tentativi sostenuti per ogni esame, stampando anche il voto massimo. Successivamente, filtrare i tentativi con voto minimo 18. */