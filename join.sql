-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT `students`.*
    FROM `degrees`
    JOIN `students`
    ON `degrees`.`id` = `students`.`degree_id`
  WHERE `degrees`.`name` = 'Corso di Laurea in Economia';

-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
*USO SHORTCUT per differenziare dal 1.

SELECT `A`.`name` AS 'Dipartimento', `B`.`name` AS 'Corso di Laurea'
FROM `departments` A
INNER JOIN `degrees`B
    ON `A`.`id` = `B`.`department_id`
WHERE `A`.`name` = 'Dipartimento di Neuroscienze';

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT `courses`.* 
FROM `courses`
JOIN `course_teacher`
-- MOLTI IN MOLTI STESSA FK courseteacher_
	ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
	ON  `teachers`.`id` = `course_teacher`.`teacher_id`
WHERE `teachers`.`id` = 44 ;

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea 
-- a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT  `students`.`surname` AS 'Cognome',`students`.`name` AS 'Nome', `degrees`.`name` AS 'Corso di Laurea', `departments`.`name` AS 'Dipartimento'
FROM `students`
JOIN `degrees`
    ON  `degrees`.`id` = `students`.`degree_id`
JOIN `departments`
    ON `departments`.`id` = `degrees`.`department_id` 
ORDER BY `students`.`surname`, DESC , `students`.`name`;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT `degrees`.`name` AS 'corso_di_laurea', `courses`.`name` AS 'Materia', `teachers`.`name` AS 'nome_insegnante'
FROM `degrees`
JOIN `courses`
    ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher`
    ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
    ON `teachers`.`id`=  `course_teacher`.`teacher_id`;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
-- DISTINCT per nn avere doppioni 
SELECT DISTINCT `teachers`.`id` AS 'Numero Id', `teachers`.`name` AS 'Nome', `teachers`.`surname` AS 'Cognome', `departments`.`name` AS 'Dipartimento'
FROM `departments`
JOIN `degrees`  
	ON `departments`.`id` = `degrees`.`department_id`
JOIN `courses`
	ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher`
	ON `courses`.`id` = `course_teacher`.`course_id` 
JOIN `teachers`
	ON `course_teacher`.`teacher_id` = `course_teacher`.`teacher_id`
WHERE `departments`.`name` = 'Dipartimento di Matematica'


-- 7. BONUS: Selezionare per ogni studente quanti tentativi d???esame ha sostenuto p
-- er superare ciascuno dei suoi esami
SELECT `students`.`name`, `students`.`surname`, `courses`.`name`, COUNT(`exam_student`.`vote`) as 'tentativi',  MAX(`exam_student`.`vote`) as 'miglior_voto'
FROM `students`
JOIN `exam_student`
ON `students`.`id` = `exam_student`.`student_id`
JOIN`exams`
ON `exams`.`id` = `exam_student`.`exam_id`
JOIN `courses`
ON `courses`.`id` = `exams`.`course_id`
GROUP BY `students`.`id`, `courses`.`id`
HAVING `miglior_voto` >= 18