-- ---------------------------------------  QUERY CON SELECT

-- 1. Selezionare tutti gli studenti nati nel 1990 (160)

SELECT * 
FROM `students`
WHERE `date_of_birth` LIKE '1990%';

ALTERNATIVA

SELECT *
FROM `students`
WHERE YEAR (`date_of_birth`) = '1990';


-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)

SELECT * FROM `courses`
WHERE `cfu` > 10


-- 3. Selezionare tutti gli studenti che hanno più di 30 anni

SELECT * 
FROM `students`
WHERE YEAR(date_of_birth) <= 1991

ALTERNATIVA

SELECT * 
FROM `students`
WHERE `date_of_birth` < '1992-01-01';

ALTERNATIVA 

SELECT * 
FROM `students`
WHERE TIMESTAMPDIFF(YEAR, 'date_of_birth', CURDATE()) > 30;

ALTERNATIVA

SELECT * 
FROM `students`
WHERE 'date_of_birth' < DATE_SUB(CURDATE(), INTERVAL 30 YEAR);

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)

SELECT * FROM `courses`
WHERE `year` = 1 AND `period` = 'I semestre'  



-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del   (21)

SELECT * FROM `exams`
WHERE `date` = '20-06-20' AND `hour`> '14:00:00'

ALTERNATIVA

SELECT * FROM `exams`
WHERE `date` = '20-06-20' AND HOUR(`hour`) > 14;


-- 6. Selezionare tutti i corsi di laurea magistrale (38)

SELECT * 
FROM `degrees`
WHERE `level` = 'magistrale'


-- 7. Da quanti dipartimenti è composta l'università? (12)

SELECT COUNT(*) as 'numero_dipartimenti' 
FROM `departments`

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)

  SELECT *
    FROM `teachers`
    WHERE `phone` IS NOT NULL



-- ------------------------------------------ QUERY CON GROUP BY


-- 1. Contare quanti iscritti ci sono stati ogni anno 

SELECT COUNT(*) AS `numero_studenti`, YEAR(`enrolment_date`) AS `anno`
    FROM `students`
    GROUP BY YEAR(`anno`)


-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT COUNT('id') AS `numero_insegnanti`, `office_address`AS 'indirizzo ufficio'
    FROM `teachers`
    GROUP BY (`office_address`)


-- 3. Calcolare la media dei voti di ogni appello d'esame

SELECT `exam_id` AS `appello`, ROUND(AVG(`vote`)) AS 'media_voti'
    FROM `exam_student`
    GROUP BY `exam_id`;


-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT  `department_id`as 'Dipartimento', COUNT(`id`) AS 'Totale Lauree Dipartimento'
FROM `degrees`
GROUP BY `department_id`