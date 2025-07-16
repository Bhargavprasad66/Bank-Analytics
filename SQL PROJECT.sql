-- > BANK ANALYTICS PROJECT

-- KPI 1 > Year wise loan amount
select issue_year as Year_of_issue_d,concat("$",round((sum(loan_amnt)/1000000),2)," M")  as Total_loan_amount
from finance
group by Year_of_issue_d;


-- KPI 2 > Grade-Subgrade wise revolution balance
select
grade, sub_grade ,concat("$",round((sum(revol_bal)/1000000),2)," M")  as total_revol_bal
from finance
group by grade, sub_grade
order by grade, sub_grade;


-- KPI 3 > Total payment for Verified Status v/s Non-Verified Status
select verification_status, 
concat("$",round((sum(total_payment)/1000000),2)," M") as Total_payment
from finance
group by verification_status;	



-- KPI 4 > State-wise month wise Loan Status
select issue_mon, loan_status, addr_state, loan_amnt
from finance
group by issue_mon, loan_status, addr_state, loan_amnt
order by loan_amnt desc;


-- KPI 5 > Home Ownership Status v/s Last Payment Date Status
select 
home_ownership, max(last_pymnt_d) as last_payment_date, min(last_pymnt_d) as first_payment_date, count(*) as total_id
from finance
group by  home_ownership;


-- KPI CARD
SELECT SUM(funded_amnt) AS total_funded_amount
FROM finance;

SELECT COUNT(*) AS total_loans_issued
FROM finance;

SELECT concat(round(AVG(int_rate)*100,2),"%") AS average_interest_rate
FROM finance;


