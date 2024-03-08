SELECT * FROM `sql-project-416009.use_of_water.Estimate of the use of water` ;

--determining the rural population
SELECT *, 
    ((pop_n-pop_u/pop_n)*100) AS pop_r
FROM `sql-project-416009.use_of_water.Estimate of the use of water`;

-- country with the highest national population in 2020
SELECT 
     name, 
     pop_n 
FROM `sql-project-416009.use_of_water.Estimate of the use of water`
   WHERE year= 2020
   ORDER BY pop_n DESC;

--Countries where access to basic water services in the urban region is less tha in the rural in the urban region
SELECT 
    name,
    wat_bas_u,
    wat_bas_r 
FROM `sql-project-416009.use_of_water.Estimate of the use of water`
   WHERE wat_bas_u < wat_bas_r
      AND wat_bas_r IS NOT NULL
      AND year = 2020
      ORDER BY wat_bas_r DESC;

--Water access improvemnt in rural area
SELECT name,wat_unimp_r,wat_unimp_u,
    CASE 
        WHEN wat_unimp_r > wat_unimp_u THEN 'Improved'
        WHEN wat_unimp_r = wat_unimp_u THEN 'No Change'
        ELSE 'Declined'
    END AS water_access_improvement
FROM 
    `sql-project-416009.use_of_water.Estimate of the use of water`
  WHERE year=2015;

