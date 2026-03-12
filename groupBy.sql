/* 1. Contare quanti iscritti ci sono stati ogni anno */
SELECT
  YEAR (enrolment_date) AS anno,
  COUNT(*) AS numeroIscritti
FROM
  university.students
GROUP BY
  YEAR (enrolment_date);

/* 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio */
SELECT
  COUNT(*) AS numero,
  office_address AS ufficio
FROM
  university.teachers
GROUP BY
  office_address;

/* 3. Calcolare la media dei voti di ogni appello d'esame */
SELECT
  exams.id,
  exams.date,
  AVG(exam_student.vote) AS media_voti
FROM
  university.exams
  INNER JOIN university.exam_student ON exams.id = exam_student.exam_id
GROUP BY
  exams.id,
  exams.date;

/* 4. Contare quanti corsi di laurea ci sono per ogni dipartimento */
SELECT
  departments.id,
  departments.name,
  COUNT(degrees.id) AS num_corsi_laurea
FROM
  university.departments
  INNER JOIN university.degrees ON departments.id = degrees.department_id
GROUP BY
  departments.id,
  departments.name;